;; inherits: yaml,yaml.ansible
;; extends

(block_mapping_pair
  key: (flow_node
    (plain_scalar (string_scalar) @injection.language
      (#eq? @injection.language "sql")))
  value: (block_node (block_scalar) @injection.content
    (#offset! @injection.content 0 1 0 0)))

;;;;;;;;;;;;;;;;;;
; VRL for vector ;
;;;;;;;;;;;;;;;;;;

(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @_source
      (#any-of? @_source "source" "condition")))
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "^[\\|][-+1-9]\n.*$")
    (#offset! @injection.content 0 2 0 0)
    (#set! injection.language "vrl")))

;; Block header in _strip_ or _keep_ mode with indentation indicator
;; Example:
;;
;;     source: |-4
(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @_source
      (#any-of? @_source "source" "condition")))
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "^[\\|][-+][1-9]\n.*$")
    (#offset! @injection.content 0 3 0 0)
    (#set! injection.language "vrl")))

;; Block header in _clip_ mode without indentation indicator
;; Example:
;;
;;     source: |
(block_mapping_pair
  key: (flow_node
    (plain_scalar
      (string_scalar) @_source
      (#any-of? @_source "source" "condition")))
  value: (block_node
    (block_scalar) @injection.content
    (#match? @injection.content "^[\\|]\n.*$")
    (#offset! @injection.content 0 1 0 0)
    (#set! injection.language "vrl")))

;; For float scalars
(block_mapping_pair
  key: (flow_node
         (plain_scalar
           (string_scalar) @_source
          (#eq? @_source "condition")))
  value: (flow_node
           (plain_scalar
             (string_scalar) @injection.content
             (#offset! @injection.content 0 0 0 0)
             (#set! injection.language "vrl"))))
