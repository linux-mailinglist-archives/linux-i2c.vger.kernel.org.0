Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFD444A94F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 09:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244183AbhKIIkU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 03:40:20 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:33535 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237880AbhKIIkT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 03:40:19 -0500
Received: by mail-vk1-f172.google.com with SMTP id d130so9629460vke.0;
        Tue, 09 Nov 2021 00:37:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a20XwW+ywquM0TvSLc4Uu7eUmVwNDFrP9cILSrmfGU4=;
        b=ZPXlAO4KvMB6hGXaYL5C/A3eafP22MA8lyU1gWi5L/KRoqr0J3niBVcAR8NQrSJJKl
         siQIrqk0bVxCI2xvRmmTLl45HW/YsKyI3LnB9cG0MDKCrBrnemt/PIkOiBcpy7FhZcFw
         CCwDidcd2ML7gLm5XGqH98ZdS9BhvqCd1L8jiYEPRWVufOD6wcPHpmvyZEZdm22EyX1h
         eypqecDErl57KmXjv0nH/hxLiwt+JZGd5+99gFKGlqPswVWCqWL7/LE/3AO/AGFt6803
         T5u6f+oSVyPdl78PYdJT8Io4UQ5N6sjQvGK8H3WCx2kVAsuxk3GIKID0oXCaMO2yoml+
         PfnA==
X-Gm-Message-State: AOAM531FoZRLDJXb2065hmnc41mIc+8QV71ip+AqS3gNHfW7X1eNg4kc
        z3NSXOT9tpJQ9BW1+glCLCqMxVXOLm7f5w==
X-Google-Smtp-Source: ABdhPJxSJJiIqvqWvbpTflwUf4QrflfXVMFmla87mAJ93jPLjO5aJs/kaHm9LcUKMl8TNu/VB7nRJw==
X-Received: by 2002:a05:6122:2005:: with SMTP id l5mr36807793vkd.4.1636447052081;
        Tue, 09 Nov 2021 00:37:32 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id x9sm1655185vkn.36.2021.11.09.00.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:37:32 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id s13so21496268uaj.11;
        Tue, 09 Nov 2021 00:37:31 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr48697933vsb.9.1636447051587;
 Tue, 09 Nov 2021 00:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-7-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-7-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:37:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWzQE7Pq8Qo=Vt3ey-ODhnP9B5+r==fsoK0miDv7-arA@mail.gmail.com>
Message-ID: <CAMuHMdWWzQE7Pq8Qo=Vt3ey-ODhnP9B5+r==fsoK0miDv7-arA@mail.gmail.com>
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs rng
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lewis Hanly <lewis.hanly@microchip.com>,
        daire.mcnamara@microchip.com, Atish Patra <atish.patra@wdc.com>,
        ivan.griffin@microchip.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Conor,

On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add device tree bindings for the hardware rng device accessed via
> the system services on the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> ---
>  .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>
> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> new file mode 100644
> index 000000000000..e8ecb3538a86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Microchip MPFS random number generator
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,polarfire-soc-rng

"microchip,mpfs-rng", for consistency with other bindings?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
