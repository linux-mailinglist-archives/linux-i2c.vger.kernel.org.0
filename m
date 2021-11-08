Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52820449DA7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 22:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239806AbhKHVMX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:12:23 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42552
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239590AbhKHVMW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:12:22 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 71E793F1B8
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636405777;
        bh=Va/pwg0yU2yK/e7gM+AfCFIYpglqXBbYNHqGSFsajyo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=YZvAA0wYyA7LJlfe5euuTj+SgWcDR+24x/KAtkVWngYxnbRJBVsHeQNhHZoaH66Gu
         2GfbHCy4Oz/wQBAso/w//0nRj9U79rwTMrJEd3dg0hMNnJU7HCorDO1lJBCFqzZKvJ
         FnWibgy3kW3RLnkW0nsJ8BtAG3IXX5jUUXmYBcPdmy/Z+t/EJjtWqjEV/GCOhEhFDb
         kELjwQjsjTvXLVF0pzG9PgP0Ho42EaYqzBN3yUg6/12XWBc5f6IzIg3HlKNCrqjTJl
         iJF/Bovy948WVp4k7hjjxAN+txCaGjJDusm7V8DwAvn7pYzwyWTiReM3snSUbG6+O2
         VUDgsp5RnXIfw==
Received: by mail-ed1-f71.google.com with SMTP id z1-20020a05640235c100b003e28c89743bso15879068edc.22
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 13:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Va/pwg0yU2yK/e7gM+AfCFIYpglqXBbYNHqGSFsajyo=;
        b=HNLEhjihxyhALBEDutGXhuSw28uEKYArlPhx6kribjw4rkI0A1mPtyP6bJeM6rTnV6
         7eZbK6x9sCwmpNkQLqyNJskTtsndPrEwrrKOHU7Hx8pNrN0c3SzEd7fIjdzc2HBJF4IJ
         p/vhM3HLTmhbj6vLfm66/CKVVdlE6p8s0WDjTbGRIcsUyjUZZmfV9xswe6GrppSXj3Dc
         bjW1bqdRG85eBy2utBF/mnhQdiPDulSzh8HGPCSAi8ZbSfAW1gRRQmlESxedQLDG/bOJ
         m8gaXy/MhQ3b6uFg8D2OpD6HeqfjcjwD3veo+R+g0jt55eVYEQc5xOpy8rWWrEo/uIlU
         pxqw==
X-Gm-Message-State: AOAM531AniinYs0+yQ8AATPVv6ODMiAoPQG7ogVnpbAKq+oKzayyfb1t
        gwshiUHmuH2azUWg1UotTuM21IX9rhQa5iJSgiYukwE3E/bjiqdrX8/t/UD7EcKMJhhC2gDMH+l
        /kEgYsEC7zD9uf5ZLu5/e89/wpPEU1FQrz4AoZg==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr2048857ljo.30.1636405766133;
        Mon, 08 Nov 2021 13:09:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5zuS8P1mHA/OLv+7/rIK0KelVh9uEKzH2K354xcsLSXE2l72piSekseZIEjgtyZT8qG201w==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr2048814ljo.30.1636405765859;
        Mon, 08 Nov 2021 13:09:25 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p21sm1933204lfg.18.2021.11.08.13.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:09:25 -0800 (PST)
Message-ID: <8a316610-c0f6-dadd-4745-bd3aff76372c@canonical.com>
Date:   Mon, 8 Nov 2021 22:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat
 string
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-4-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-4-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update 'compatible' strings for system controller drivers to the
> approved Microchip name.
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

Please split the bindings from the code.


Best regards,
Krzysztof
