Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31323673FE7
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 18:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjASR2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 12:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjASR1u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 12:27:50 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658301BE9;
        Thu, 19 Jan 2023 09:27:49 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i4so1939265wrs.9;
        Thu, 19 Jan 2023 09:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rep8VyTcjsWcrm+FThgLtYbfi7P7h/NdS4LzD6Gp4P8=;
        b=WJgf21ry6TlFf5Y6YMfxpJne08KYwcuUhC32BlwUCcPAKWFXnVQ2z8yY7DmD8cF5eZ
         DY+iw3liZhQrsffELrC36VGLh4ZdTehIRCXDh7K+ldCJkXYFl0UUv0rV85qqnK6FtJqL
         dehY6Ty2Y5cHUtA0ovEIyBwTVVnKp25QIqQUVX6szGvgo9vjsycywrpHKs2b9yYtYEMo
         fpW61YK6nTak8QXJMaiBlMUmty8juEl2sAMhmPsfLkiB31FmmHudG5t2HKCYPX9y/0XQ
         CDry8mr73Sa+/Mm44k0EW/e+32Miq6ucY/OCR2cxUR7TMJ3HmG7sw4xz4PcAw6R3FlMJ
         jr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rep8VyTcjsWcrm+FThgLtYbfi7P7h/NdS4LzD6Gp4P8=;
        b=yeg4vZZTM5LbFc2KjcqRwJEXyF9PoDiKH5PhQfxi86N/r42Oh4xBMcgr7vuT+aG5Py
         fdSDdJ32B07KLD5ZVXDdcef/py95Z5aNd5zQPANEVsoc8pzZilwNEaNpvuBVwCEuDhT0
         7wRQACWe3bYF3XkFueJskUf661U15dd83jGivGgJx8JukZVFSCg+XisFD4fo4iSeVAK/
         7Bnv6omZv4sspo/N8ZFao5KHoERsbEgLR5A+l1elgtonJhBkGOkuTilX5bD+xEoxyZA2
         ZFz8zv/YuLWZTKTCPhBllNZ1YwCHNfUMChdVygrfzU/DHRW7btqagbU8uM2dY9D9Y5iw
         GVyQ==
X-Gm-Message-State: AFqh2krd5It6H7phdFoexn74m2qNnUiIUm3Bh51GKsuxdeZFr0k4MEOx
        mbKHNgY9XJcfka+JajVCCtY=
X-Google-Smtp-Source: AMrXdXuChxw61VMVEQM/MTbeOkF17U8tlsZJK1Zg0jN2XZ5VWzfqvo0MONbPGa1zXHC449UlMcuwvA==
X-Received: by 2002:adf:e109:0:b0:2bd:e547:943a with SMTP id t9-20020adfe109000000b002bde547943amr10047432wrz.14.1674149267942;
        Thu, 19 Jan 2023 09:27:47 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600000cb00b002be53aa2260sm87773wrx.117.2023.01.19.09.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:27:47 -0800 (PST)
Message-ID: <51b63da0-2aea-f351-d737-66e832a80a18@gmail.com>
Date:   Thu, 19 Jan 2023 18:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-mt65xx: add binding for
 MT8365 SoC
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
 <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 19/01/2023 18:08, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add binding documentation for the MT8365 I2C controllers.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 421563bf576c..72ae2e01cf22 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -41,6 +41,10 @@ properties:
>                 - mediatek,mt6797-i2c
>                 - mediatek,mt7623-i2c
>             - const: mediatek,mt6577-i2c
> +      - items:
> +          - enum:
> +              - mediatek,mt8365-i2c
> +          - const: mediatek,mt8168-i2c
>         - items:
>             - enum:
>                 - mediatek,mt8195-i2c
> 
