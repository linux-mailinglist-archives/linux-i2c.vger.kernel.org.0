Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1FD5271C4
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 16:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbiENOPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 10:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiENOPk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 10:15:40 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E7E140F3;
        Sat, 14 May 2022 07:15:38 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-edf9ddb312so13977046fac.8;
        Sat, 14 May 2022 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V0UWMw+8IC5/blrDj2MNiuz1nnIEdolub0ud2xnX3wc=;
        b=dkxvJMEFx6NNgw1tH/UOFEVkB83/cvgCoN2PlMfOTAvFF3YrqCpWz24cv5z8xQwuP7
         BcwvEsuFTuyE8yjru1Pi9Q9cgXnx/x9R5X1crekVv9DRnAcrnELwo3xV1+gyUaEzYXqH
         2VUhW79PlCNlREYwLWgPacsLZpLg/SR1rbTxCrHKruvIDmJ15NRQ1aWlUpvb1oblcA6c
         U16dqcZxJxDVmmhhEtOaqJlvLnZm618xa4XDWfp31YWmyoDpO6YqqvqeDNcXATzvnLdr
         AjTjqn6W2vguXwB/Unl/2mEHV4UkX8F6g+4VT6wc7OouhdHE7n3go4ycJIu1c2LG90Js
         AvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=V0UWMw+8IC5/blrDj2MNiuz1nnIEdolub0ud2xnX3wc=;
        b=hGphlE7Rgn1gf5CsnBJig/mnyhXZ3VW4J+zm+gomQpfQRi6dfJJIhO81cky131Xe16
         Q0ccY/oF6P6SneoN6d8kYZmjMu0aSsQqcJzgzQ9xowirQmW8lB2dj4XLcNTF07/Ckg5T
         6qyvJberBhE1UsxjC/a8LPhAH7An8kYjvVOtXShlVX3yanziM6roiB1Bk/w3FxMDTjqs
         S+uQ9LxErrTm33yMzUFUYAezdUkn0Im1wIUnq7LFGAGw7/DEJ8jEpxlVN+30XD7JBUFh
         7I3yGPcyouCoiBzlQSlJKkLy8CB93k03tigstXnTtUTHsx4nRYZ6GSvbAdkBsoNWoKgI
         Zclw==
X-Gm-Message-State: AOAM532ZeNNmWIhinyChocr2Ti4cd40IOguG2fOha8JmcXtKXUcGBWJM
        gDKA9QJvTRyIMUV9mAX/ur3Q9lOarnQm6w==
X-Google-Smtp-Source: ABdhPJxIh4A6RDGJLkqD3wI+SAa3lP6jsUbrzhaqHnQbP/kqqs6hM/AP18eGNJmYYJxAgVXlsnJ15A==
X-Received: by 2002:a05:6871:70c:b0:ed:e6c2:e599 with SMTP id f12-20020a056871070c00b000ede6c2e599mr5088966oap.70.1652537737907;
        Sat, 14 May 2022 07:15:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n39-20020a05687055a700b000e686d1389dsm2401199oao.55.2022.05.14.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:15:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 14 May 2022 07:15:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 7/7] dt-bindings: watchdog: renesas,wdt: R-Car V3U is
 R-Car Gen4
Message-ID: <20220514141536.GA1319284@roeck-us.net>
References: <cover.1651497024.git.geert+renesas@glider.be>
 <2882a6de3905a57ae62d91060d27521af43c4068.1651497024.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2882a6de3905a57ae62d91060d27521af43c4068.1651497024.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 02, 2022 at 03:34:59PM +0200, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> index 77ee7c4b8067f506..1fa243052327bffe 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
> @@ -59,11 +59,11 @@ properties:
>                - renesas,r8a77980-wdt     # R-Car V3H
>                - renesas,r8a77990-wdt     # R-Car E3
>                - renesas,r8a77995-wdt     # R-Car D3
> -              - renesas,r8a779a0-wdt     # R-Car V3U
>            - const: renesas,rcar-gen3-wdt # R-Car Gen3 and RZ/G2
>  
>        - items:
>            - enum:
> +              - renesas,r8a779a0-wdt     # R-Car V3U
>                - renesas,r8a779f0-wdt     # R-Car S4-8
>            - const: renesas,rcar-gen4-wdt # R-Car Gen4
>  
