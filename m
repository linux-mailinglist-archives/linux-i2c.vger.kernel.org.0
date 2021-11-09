Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D51444A9CE
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 09:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244593AbhKII72 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 03:59:28 -0500
Received: from mail-pl1-f176.google.com ([209.85.214.176]:34554 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236483AbhKII72 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 03:59:28 -0500
Received: by mail-pl1-f176.google.com with SMTP id r5so19745157pls.1;
        Tue, 09 Nov 2021 00:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WBDXAvrVMOF74SvlOY510+Wn6BscpCQ4WL2UuaAH35U=;
        b=ftPxll5hJLbsBFse6BuYWl9/OedhmNSmetl24Dyh5XHFvwa/2wU6wn47fXGOw8jPp7
         HyBYErDUnjlzMynO1yjVHEOSUmpDWrFak2bnd+9LyzpGMSJQDTsNsaVlyd4O4eTVDREO
         xOLY6kHiw68azbZb+L4jluNAD7AF3COwkSPCCDJPHuX3kZPb5/8I8DsE5iEMFwzmfJJV
         XesrgJiEBx0Tk7+PBTQvy/uAin/xGyFc6hcq53EsWJUzf2/ECqV8UTH+9eRvwtcpcEmt
         OMJIU2PlyYYEo8iVLF47Wka5dfj9ueJ4/ow9xZssNXnyXzGNegbblI867GHplsmQTwK0
         Nx0A==
X-Gm-Message-State: AOAM531Z0YQxkWSGXzzFNOR7V5Na+bRWCzvzq/EqCoPXjdPHSbqoDNHg
        CmCYArS18WQ01KhcwYr0scd6rAdOERUfYIr1
X-Google-Smtp-Source: ABdhPJxMt/MNQBOTF55lYEDhNTekyu5Jts9bhFxvILqmY/REW7QXVgl/WWsxMiBuXleXsM+cFqKqdQ==
X-Received: by 2002:a17:90b:2412:: with SMTP id nr18mr5495829pjb.233.1636448202161;
        Tue, 09 Nov 2021 00:56:42 -0800 (PST)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id p124sm1448384pfg.110.2021.11.09.00.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:56:41 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id m26so18893914pff.3;
        Tue, 09 Nov 2021 00:56:41 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr9690352vsj.50.1636447720630;
 Tue, 09 Nov 2021 00:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-12-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-12-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:48:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtVTEEhjUr7jj4tBoahPTXAYu9uSKVpr54mCeZx_ktqQ@mail.gmail.com>
Message-ID: <CAMuHMdVtVTEEhjUr7jj4tBoahPTXAYu9uSKVpr54mCeZx_ktqQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] dt-bindings: usb: add bindings for microchip mpfs musb
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
> Add device tree bindings for the usb controller on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-usb-host.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,mpfs-usb-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip MPFS USB Controller Device Tree Bindings
> +
> +maintainers:
> +  - Conor Dooley <conor.dooley@microchip.com>
> +
> +description: |
> +  This USB controller is found on the Microchip PolarFire SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,mpfs-usb-host

"microchip-mpfs-usb", given the dr_mode property below indicates this
controller is not limited to host mode?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    minItems: 2
> +    items:
> +      - const: dma
> +      - const: mc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dr_mode:
> +    enum:
> +      - host
> +      - otg
> +      - peripheral
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - dr_mode
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/clock/microchip,mpfs-clock.h"
> +    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;

Please drop these two...

> +      usb: usb@20201000 {
> +        compatible = "microchip,mpfs-usb-host";
> +        reg = <0x0 0x20201000 0x0 0x1000>;

... and the zeros here.

> +        clocks = <&clkcfg CLK_USB>;
> +        interrupt-parent = <&plic>;
> +        interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;

Please group by angular brackets:

<PLIC_INT_USB_DMA>, <PLIC_INT_USB_MC>.

> +        interrupt-names = "dma","mc";
> +        dr_mode = "host";
> +        status = "disabled";

Please drop this.

> +      };
> +    };
> +
> +...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
