Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BCF44A958
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 09:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244326AbhKIImd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 03:42:33 -0500
Received: from mail-vk1-f179.google.com ([209.85.221.179]:36498 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244324AbhKIImc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 03:42:32 -0500
Received: by mail-vk1-f179.google.com with SMTP id b192so3968532vkf.3;
        Tue, 09 Nov 2021 00:39:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RhEU7/cMn0jM+Rvv1TDlHzOAxsTE31x17vOVQ8kJt3g=;
        b=VZ9g06ZAwQPDkNRttHsK/eL3Y1pHtCeO2Fi2EGhbG7SPzgK7FaVewRgeiu0tAAy215
         WaCfwzsYUlvbw20LCLfs8fcXsBu77+qPWM2P2bHKELJBsZDdErCXP3wD6xdkMn5soI33
         5z8ZlBj/h47FFbGuoy9Jc4TJnySsNGZcbiwjyN1l5+pWRAOnbmkuEoGi4xROhiREwWuj
         gGwoxYlMi3YoKd0KKq7HUe/rk+cP0BdJHGjgS5J+N/NFtDTOcE0fzpULJYhgCabB+Sr3
         nlv3RyYfI/fDguBE00hHKDeC8Socqcj0Y1HFXZ78vTLpvIXwsCIp654xvJNq85WtbTO0
         /tZQ==
X-Gm-Message-State: AOAM530gg5gyF1vWB+qCj2ulOR0jKjPqvXR3QJW7S3fujQpwOorFunAQ
        k1z8X5qyOZKEYCqGkd5AUzgwhKpNbt3/O49A
X-Google-Smtp-Source: ABdhPJx0i0radw7kJgP5pqxSrLSZGsN5Cel+MReidhcy9UCfp1QLl3Lbg8JubezsdAGemilOyJAXXA==
X-Received: by 2002:a05:6122:2090:: with SMTP id i16mr8629246vkd.18.1636447185930;
        Tue, 09 Nov 2021 00:39:45 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id k185sm3593725vsc.21.2021.11.09.00.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:39:45 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id p37so35895611uae.8;
        Tue, 09 Nov 2021 00:39:45 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr38560622vsl.41.1636447185011;
 Tue, 09 Nov 2021 00:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-8-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-8-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:39:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWd_mXWeaDR+1SG=yoD=x6GGZwqXSH9pismXV=v2DOLhg@mail.gmail.com>
Message-ID: <CAMuHMdWd_mXWeaDR+1SG=yoD=x6GGZwqXSH9pismXV=v2DOLhg@mail.gmail.com>
Subject: Re: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs rtc
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
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -0,0 +1,61 @@

> +examples:
> +  - |
> +    #include <dt-bindings/clock/microchip,mpfs-clock.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Examples are indeed built with #{address,size}-cells = <1>.
However, there is no need to override this.  Just drop the zeros in
the reg property below.

> +        rtc@20124000 {
> +            compatible = "microchip,mpfs-rtc";
> +            reg = <0 0x20124000 0 0x1000>;
> +            clocks = <&clkcfg CLK_RTC>;
> +            clock-names = "rtc";
> +            interrupts = <80>;
> +        };
> +    };
> +...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
