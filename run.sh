#!/bin/bash

# 保留 en_US en zh_CN

function cleanup_lang()
{
    langs=(af am be bg ca cs da de el es et eu fi fr he hi hr hu hy is it ja kk ko lt nl no pl pt ro ru sk sl sr sv tr uk zh af_ZA am_ET be_BY bg_BG ca_ES cs_CZ da_DK de_AT de_CH de_DE el_GR en_AU en_CA en_GB en_IE en_NZ es_ES et_EE eu_ES fi_FI fr_BE fr_CA fr_CH fr_FR he_IL hi_IN hr_HR hu_HU hy_AM is_IS it_CH it_IT ja_JP kk_KZ ko_KR lt_LT nl_BE nl_NL no_NO pl_PL pt_BR pt_PT ro_RO ru_RU sk_SK sl_SI sr_YU sv_SE tr_TR uk_UA zh_HK zh_TW)

    for app in /Applications/*
    do
        echo Cleaning $app
        for lang in ${langs[@]}
        do
            dir="${app}/Contents/Resources/${lang}.lproj"
            if [[ -d "$dir" ]]; then
                sudo rm -rf "$dir"
            fi
        done
    done

}

function cleanup_container_cache()
{
    for x in ~/Library/Containers/*
    do 
        dir="$x/Data/Library/Caches"
        if [[ -d "$dir" ]]; then
            rm -rf "$dir"; mkdir -p "$dir"
        fi
    done
}

cleanup_container_cache
cleanup_lang
