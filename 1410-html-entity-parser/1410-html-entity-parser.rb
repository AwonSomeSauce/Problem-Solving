# @param {String} text
# @return {String}
def entity_parser(text)
    entities = {
        '&quot;' => '"~~',
        '&apos;' => "'~~",
        '&amp;' => '&~~',
        '&gt;' => '>~~',
        '&lt;' => '<~~',
        '&frasl;' => '/~~'
    }.freeze

    entities.each do |key, val|
        text.gsub!(key, val)
    end

    text.gsub('~~', '')
end