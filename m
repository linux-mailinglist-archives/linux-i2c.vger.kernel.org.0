Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2EFD6D395C
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Apr 2023 19:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjDBRIy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 13:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjDBRIw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 13:08:52 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA42B46A;
        Sun,  2 Apr 2023 10:08:51 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so16741174wmq.3;
        Sun, 02 Apr 2023 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680455329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsJ97AzAinqmYulQ9uVcLwa3ToVHlFCND7bl1BMrRiU=;
        b=YHNxsnJJ4c5c+8fCLqRjsHMs8tmEZHQ1w2ViHHGFaniGDy3caW4L474GMekT/yDMAp
         HNpLsnUDef4DYgY2EjmHZa1S8iK42qMP0qxu+LY+Nj0hvf1Kzkm/WOqjVveCyJGWQ6tO
         TQnqxsn/3DlfOxmdVY2EEgo6MM5bVzVdEq/nLIbCHat7Lk1JwznFRW7LzNrXR8Qh2H/8
         b4iHjFYYO9iS1cPGCM0GR0z4s/KHHrBTlkbw91nqBr6T+ljCcWaEmM4DmFMpXVwdiVLf
         rYuMQO5vBNeXRNbzTvcuTU3vup2h+YsxCtpG92MBHJlyTJ9GmvkkqGsUZ72gnEHP8LVd
         NIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680455329;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsJ97AzAinqmYulQ9uVcLwa3ToVHlFCND7bl1BMrRiU=;
        b=OuTkyXV9HUZZPO4gYz9sLc3bAmEP8WIh0c12f5tDrGiiPSssmgWHHhFKm2kMswqo0W
         /0WSGC1HhV4YNcxXvZSIhCKc0Q8tQnC5pmfQzI8D+1MrkIu1YNNsF6HasDfhIld4acEc
         47tyzF6WplhAmNobjdCsKAZqy98TPP+fRavZVFIUcqsD7GyzYOhgpMijEi29Q0Adj72v
         FvBbvGzqz0UsK1Q1Zhvco5jCOpfNby8ag4WIC+8BNcvXt3Jn5xOYRKGwC5r0k9NJeEOK
         /hoN2Lq74sGavond0u7f6rMq2CJAbNibtRvphRC+kP29PyWvDkUwRPA09/LqPW0PkCKq
         Ou1g==
X-Gm-Message-State: AAQBX9cS9CVUbdQvHOU2SByoczLPP2V5+0qRGZXO+k/Z/8Ejl/ddlGjx
        gqxZK0mi6FKPTJjSXfR0pAA=
X-Google-Smtp-Source: AKy350Y8n3sLV835zkLGWD1Asl2o/5OiDqWwy1rdkkLRI7XF1gVqgugu90RkgvcR9WttMJwwPkB95g==
X-Received: by 2002:a1c:7406:0:b0:3da:2ba4:b97 with SMTP id p6-20020a1c7406000000b003da2ba40b97mr10806342wmc.19.1680455329510;
        Sun, 02 Apr 2023 10:08:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c45cf00b003eb2e33f327sm26654245wmo.2.2023.04.02.10.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:08:48 -0700 (PDT)
Message-ID: <eef88552-64cb-b4e7-f443-bf6d7afe3ae2@gmail.com>
Date:   Sun, 2 Apr 2023 19:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/17] arm64: dts: mediatek: mt6795: Add apmixedsys
 syscon node
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
 <20230327083647.22017-3-angelogioacchino.delregno@collabora.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230327083647.22017-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 27/03/2023 10:36, AngeloGioacchino Del Regno wrote:
> Add the APMIXEDSYS node, providing a syscon to the APMIXED iospace and
> also providing PLLs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 4d2119751572..26d640e1bfb6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -310,6 +310,12 @@ systimer: timer@10200670 {
>   			clock-names = "clk13m";
>   		};
>   
> +		apmixedsys: syscon@10209000 {
> +			compatible = "mediatek,mt6795-apmixedsys", "syscon";

Looks good although we have the compatible twice, in 
bindings/clock/mediatek,apmixedsys.yaml and 
bindings/clock/mediatek,mt6795-sys-clock.yaml

So we should see if we can merge both.

Matthias

> +			reg = <0 0x10209000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
>   		fhctl: clock-controller@10209f00 {
>   			compatible = "mediatek,mt6795-fhctl";
>   			reg = <0 0x10209f00 0 0x100>;
