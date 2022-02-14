module PostImagesHelper
    def list
        {a: "aaa", b: "bbb", c: "ccc"}
    end

    def grade_hash
        {"8Q" => "8級",
        "7Q" => "7級",
        "6Q" => "6級",
        "5Q" => "5級",
        "4Q" => "4級",
        "3Q" => "3級",
        "2Q" => "2級",
        "1Q" => "1級",
        "1D" => "1段",
        "2D" => "2段",
        "3D" => "3段"}
    end

    def wall_type_hash
        {"slav" => "スラブ",
        "vertical" => "垂直",
        "over-hang" => "薄かぶり",
        "over-hang-hard" => "どっかぶり",
        "roof" => "ルーフ",
        "mantle" => "マントル",
        }

    end

end
