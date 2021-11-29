Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D3F462161
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 21:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347495AbhK2UIr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 15:08:47 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:39519 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhK2UGq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 15:06:46 -0500
Received: by mail-ot1-f50.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso27069920ots.6;
        Mon, 29 Nov 2021 12:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kvDcsM3w4WQk4jXsDcnewbr4cFKFCF6p3RmEQ5PDnjA=;
        b=S7JPj8OFP9W9H/iYZ3Dm9XvVqanpni9mXRwicwFiz5tsxzGU2fnAwhxX80oy9cri16
         u4bD9fql8YOHxoLjejQAOnRjELE5gZzaCULoB4Sm25WMU5Snjj7KzIrwW9esE3Ex6oK3
         yfb39gha2TB+dP6nUCmJchmaJMaIeVze4vgNF2owIUXqcrkxdwdlKhhuuqGfhdXzN5TT
         bWNbo1b0GjcrDqh/hY7pG1U4SkqpX83Xtq/HAdbrbx+ofqGl2j0DUknxCXTchBlJ4H+f
         7ks8Lq7uxEb2OfDqbL0HVhXbscsDcNmfkUqmfZPeAWb0ForYEcGzUq1o8a+CFBUhcEuI
         RTBQ==
X-Gm-Message-State: AOAM533SBv7/Vr7z0M+YIwcWLAgSBffmWUHO4aLmMsrHJp2xfXBcVuRK
        r/2kDREUlOfep5p0cBBbuQ==
X-Google-Smtp-Source: ABdhPJy/Ihp3jA541L/1BdmDyIG1+61H1YRDltOlKuS90bu2rf+mRdfltiPME33JnY7hnF3caTjYCA==
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr46658945ote.52.1638216207570;
        Mon, 29 Nov 2021 12:03:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e21sm2805635ote.72.2021.11.29.12.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 12:03:27 -0800 (PST)
Received: (nullmailer pid 512532 invoked by uid 1000);
        Mon, 29 Nov 2021 20:03:25 -0000
Date:   Mon, 29 Nov 2021 14:03:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        bin.meng@windriver.com
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr
 compat string
Message-ID: <YaUyDUsyEoaA6nky@robh.at.kernel.org>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108150554.4457-4-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 08, 2021 at 03:05:44PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update 'compatible' strings for system controller drivers to the
> approved Microchip name.

Why do I care what Microchip approved? You all picked identifiers 
(that's all it is) and now get to live with them.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/mailbox/microchip,polarfire-soc-mailbox.yaml     | 4 +++-
>  .../soc/microchip/microchip,polarfire-soc-sys-controller.yaml | 4 +++-
>  drivers/mailbox/mailbox-mpfs.c                                | 1 +
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> index bbb173ea483c..b08c8a158eea 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: microchip,polarfire-soc-mailbox
> +    enum:
> +      - microchip,polarfire-soc-mailbox
> +      - microchip,mpfs-mailbox
>  
>    reg:
>      items:
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> index 2cd3bc6bd8d6..d6c953cd154b 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> @@ -19,7 +19,9 @@ properties:
>      maxItems: 1
>  
>    compatible:
> -    const: microchip,polarfire-soc-sys-controller
> +    enum:
> +      - microchip,polarfire-soc-sys-controller
> +      - microchip,mpfs-sys-controller
>  
>  required:
>    - compatible
> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
> index 0d6e2231a2c7..9d5e558a6ee6 100644
> --- a/drivers/mailbox/mailbox-mpfs.c
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -233,6 +233,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id mpfs_mbox_of_match[] = {
>  	{.compatible = "microchip,polarfire-soc-mailbox", },
> +	{.compatible = "microchip,mpfs-mailbox", },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
> -- 
> 2.33.1
> 
> 
