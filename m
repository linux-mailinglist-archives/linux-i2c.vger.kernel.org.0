Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C93C26A2AC9
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Feb 2023 17:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjBYQlm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Feb 2023 11:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjBYQll (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Feb 2023 11:41:41 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831BE125AF;
        Sat, 25 Feb 2023 08:41:35 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-172a623ad9aso3027885fac.13;
        Sat, 25 Feb 2023 08:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmn+cqYTvDT85OGvCMKkjTNE8FVd8ZGTaREnVmw8Y5k=;
        b=JeAIBpYUvNiXAA121YTlLRE7xs6FpBBdLcnKmViFAKnx0CAyuikX7hInf+ybRgcPU2
         +qxGszBkgPNH4cJ4wAI4569+t1Xqf6fh5xaaQD98MO1fYRYlLG3zyXte2pP0cX/Oe5DZ
         iSk5+0t1cywz6YkzojDiSA0c2orMUnZLEtqT/+iPn16CmlC3iLxUIKNnWvmULxuDanUC
         jFwxulUiH4rLfylMJcybmUuXmvj6jcewXl5auogL9CVK1z8HLdut85UvNOLa2AdE3QPn
         RjZzs+2BDhqeqYVEVmdYunlYeDNE0J71QG7PZ4iKjxXy3svG2dNR7jHcKrEGsF4WxZQ1
         Qbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmn+cqYTvDT85OGvCMKkjTNE8FVd8ZGTaREnVmw8Y5k=;
        b=QjTgcFXsbrMfsNhCkeBMLJbhS7SoS7l+2qnEw1wNZmtXHCk7UXfH8kySz9/fUJ08r3
         pgfIrr3+yqouF9v/KUaCdVv5sDeo0RipvoDNMzdtc2RMJrWm+iPZ3bFixPj1q5d4deDV
         HDqdBwJVWM4mR4ZXj/BSdCt5nrzwSHVWL19t36KWa1jRd5jwKFliiXQFWWaoUIa4tUjW
         NNdfHXW+z63ezFycliWCBL+VacKLzDMw8bO98pDnV+1VofIAum+7zH3d0oWC6TcFytcr
         0eHOX0FZ1jnsW8Si6RcfeNGkpzQYGMVM8z+VJyqfPMjJGioYCRHuAw2rEi6X9JxWCneg
         A78A==
X-Gm-Message-State: AO0yUKXEj8pbiN+tUZOyP5lKiCy0pB2sjwzXFS4KAVCyeu2Rq8wv9HbS
        UpUlqejPF2vGF49noNcTCjm0twyipIY=
X-Google-Smtp-Source: AK7set9nFJwgKU2JNnNF/RkpGiT2OOeIvv/dN+67jI23lAI/UoG09P6nrZwOJLRbeHtMWkberKCg4w==
X-Received: by 2002:a05:6870:910c:b0:16d:c18d:4074 with SMTP id o12-20020a056870910c00b0016dc18d4074mr15754800oae.12.1677343294607;
        Sat, 25 Feb 2023 08:41:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t2-20020a05687044c200b001726cfeea97sm718811oai.29.2023.02.25.08.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 08:41:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 25 Feb 2023 08:41:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, qii.wang@mediatek.com, matthias.bgg@gmail.com,
        jic23@kernel.org, chaotian.jing@mediatek.com,
        ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
        chunfeng.yun@mediatek.com, broonie@kernel.org,
        wim@linux-watchdog.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 08/17] dt-bindings: watchdog: mtk-wdt: Add MT8365 SoC
 bindings
Message-ID: <20230225164132.GA2905933@roeck-us.net>
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-9-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531135026.238475-9-fparent@baylibre.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 31, 2022 at 03:50:17PM +0200, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Going through my old e-mails:

This patch never made it upstream and would have to be rewritten to apply
to Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml.

Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index a97418c74f6b..0e63c4ba3785 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -19,6 +19,7 @@ Required properties:
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>  	"mediatek,mt8192-wdt": for MT8192
>  	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> +	"mediatek,mt8365-wdt", "mediatek,mt6589-wdt": for MT8365
>  
>  - reg : Specifies base physical address and size of the registers.
>  
