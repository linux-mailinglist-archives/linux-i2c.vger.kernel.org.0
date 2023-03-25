Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB9D46C8D4B
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 12:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjCYLL6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 07:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjCYLL4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 07:11:56 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3847F956
        for <linux-i2c@vger.kernel.org>; Sat, 25 Mar 2023 04:11:55 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id eg48so17264182edb.13
        for <linux-i2c@vger.kernel.org>; Sat, 25 Mar 2023 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quDJROYZau1xv6HdG0MK6L0Z5Z+WN4DnzD83c5yx90g=;
        b=JZR7cNi438VpAia1Q2EpjsXEkAiziqTnN3CHCXewKfg5fnaf53lztCnJGu5kIqL386
         38rsE8mwuspJWwtBBWSMoIJKu++wyUGnYnC98rUNwrYbBKSPhgR5mwN36OBz4bbdb0+j
         PzMHlYNr5tl3Xefwjt95Ux+sr/5kwz5IfphblIKdNcZInm5c+myHTxmO+PP7xD6dM7t+
         3wmihgEZxvgWX/IvSVLcIyCg4eTpXKTr8+QvJBvzG/X9kqk3pWSt3O5k1rRo2vcuAUbh
         BbKjx0oXDbIPILGEvU72wpLifLCiyBXKhcxh8AxHwtBp2ORr0hzogkMruPbXTcR03/Hk
         6xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quDJROYZau1xv6HdG0MK6L0Z5Z+WN4DnzD83c5yx90g=;
        b=4PyCignzxWLEP+UEemZ465gIRj86zCO5mtM7NClABPzBv+rAxjhVxiZZ1lfJXLmPYN
         wJIUGdsNUiChbLQ/KXCVzU4z1gWmoHLzJq0YVRElAjBendsBU/dIam+8Tb4/G1rVXD9E
         R19CInQm5xqXvoDRfBwefAqVD8/qeoL02iTFzbp1uebX/hEsTdQs22zU/yDSqFAZl6hX
         ePF1xG7kbYlypO7D4uAj29BSauKyh+0aAA3hwKJBUCaXYH7ikULKBBpybTG+m1lkJRrs
         uRz6zv6xPcUxYA8fexsq3AfdiQ1ih9dAB6kWK4tvGzBIpSxKVsIoj5lOv/CuLFmxa0mO
         Zypg==
X-Gm-Message-State: AAQBX9d/oK4F0APUzYFMvZgaWsIPsquLr6B71l5YgzNOh144izchVV7l
        PJY8PaKq+14EPryRWl4thg1tZA==
X-Google-Smtp-Source: AKy350bsE9lPQhYt7qH3o7Tk/Mup0e6CsrJLPYxBN1MNaWWiU2oMlVwSlMpylKH/yC8pTtsEs3LbgA==
X-Received: by 2002:a17:906:9485:b0:933:c052:a277 with SMTP id t5-20020a170906948500b00933c052a277mr5978078ejx.12.1679742714202;
        Sat, 25 Mar 2023 04:11:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id qb16-20020a1709077e9000b0093f3d41b9ebsm840671ejc.220.2023.03.25.04.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:11:53 -0700 (PDT)
Message-ID: <bedbda17-57e2-725a-2469-ddc6917448fb@linaro.org>
Date:   Sat, 25 Mar 2023 12:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 07/18] dt-bindings: mailbox: mediatek,gce-mailbox: Add
 compatible for MT6795
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-8-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MT6795 Helio X10 SoC which: this SoC
> can use MT8173 bindings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

