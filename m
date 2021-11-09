Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1E044A998
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 09:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244459AbhKIIsp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 03:48:45 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:43777 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244433AbhKIIso (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 03:48:44 -0500
Received: by mail-vk1-f170.google.com with SMTP id f7so337784vkf.10;
        Tue, 09 Nov 2021 00:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cBujI6LULAaiAY45bOf/1wEBrbff5jn8VFxrA8Nj2gY=;
        b=5OJvbVNnggPsyJbH3DFOZH9IXf417UKJi5yUmjA6ZHbiVB4DTVt0nHlUTtbOshzMYH
         dvbx7VGZp5Pen7JVgmM+cotKlnH9kBkgXthbmres6R04Xz1mCOwSeKR0bBUkd1khgSTc
         kYU0ArBftti5z9x9DBUYeSYozuS9sqcahRWHB0YV4pa1GA4j2LRXwHqQ0UQT1X4eHFRr
         u19V8KeoT6es5KRViZB09IiUOau2/rPPPZCUyR9/s1TPXntnO6nZ4EK7wk65BZjqOr3A
         aKrmftjmikncvpQFbxS9vR3jqKX/ZLqV4HQCIp2LZGOVsnCDyFXKqE4mHQU4RjfV9TwV
         DUWg==
X-Gm-Message-State: AOAM533BPvEeeDbZGVU/1D8vM6bDDZszxLMBcZqpzrQQ0kDahmJzWUMu
        WK1uVOmVqpw2fKaAnldpIOoWSg3lYKjm7XXD
X-Google-Smtp-Source: ABdhPJw5TsC7HzLHYmnfgC3H+jVA1zj6odTPKXc2T7osAwDSY+Q5rKWbcoxdvRN7lx7EMyrMMdh7Lw==
X-Received: by 2002:a05:6122:218b:: with SMTP id j11mr21602415vkd.11.1636447557618;
        Tue, 09 Nov 2021 00:45:57 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id g187sm1263699vsc.10.2021.11.09.00.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:45:56 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id s13so21532204uaj.11;
        Tue, 09 Nov 2021 00:45:56 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr7784643uaj.89.1636447556112;
 Tue, 09 Nov 2021 00:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-11-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-11-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:45:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQxz5eprDuqJcsXcp+cKPwxoV=+if_qvS9ah5qBO-shA@mail.gmail.com>
Message-ID: <CAMuHMdWQxz5eprDuqJcsXcp+cKPwxoV=+if_qvS9ah5qBO-shA@mail.gmail.com>
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs spi
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
> Add device tree bindings for the {q,}spi controller on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/microchip,mpfs-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS {Q,}SPI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This {Q,}SPI controller is found on the Microchip PolarFire SoC.
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-spi
> +      - microsemi,ms-pf-mss-spi
> +      - microchip,mpfs-qspi
> +      - microsemi,ms-pf-mss-qspi

Same comment as before: what are the ms-pf-mss entries?

> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;

Please drop these two...

> +      spi0: spi@20108000 {
> +        compatible = "microchip,mpfs-spi";
> +        reg = <0x0 0x20108000 0x0 0x1000>;

... and the zeros here.

> +        clocks = <&clkcfg CLK_SPI0>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_SPI0>;
> +        spi-max-frequency = <25000000>;
> +        num-cs = <8>;
> +        status = "disabled";

Please drop this.

> +      };
> +    };
> +...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
