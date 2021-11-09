Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103C444A92F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 09:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239424AbhKIIh7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 03:37:59 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:34468 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244280AbhKIIhg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 03:37:36 -0500
Received: by mail-ua1-f47.google.com with SMTP id b3so37086347uam.1;
        Tue, 09 Nov 2021 00:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AeQsRqY/GskMz/vOm4ldxuS7JHiWlKXTjA+Am1FlP0g=;
        b=5r7uvOhw7ynCk9Af+p6Mek1PwSJ53TQ2RWapaDY4UfTPNdB/UuxNSVRvZ+QrLxnHzE
         kArpQlzv1vM9eX3gFCT683DrheD2AU3GtdIy2f71BA59DA5FxaQu7VvVcPOmnD3ch4+d
         dmrhIJDJwA1F0fi3dPULvCHo8HK7FHtUGxwbSmrQMwnWBtDs8NpkWBzWcmKwfTk2ocpX
         Y8iFF5fWSFtJ8PF1K81VmxkP7IARFB9a7sf5ClUE4WpXgNNafowPbLTUphsjVpf2ALsG
         pDpDC6OvhbLuoLz1VTSFu0jtNyXzFKfyQvSu/atdMFvLYdKvtREXTb417r8Bg2Po96Ur
         lDDg==
X-Gm-Message-State: AOAM533YHVNpX3xKC2R3FC38oYiEFNevOQvMRUpyvgETqWfjG7S3349n
        FknGjDx7Ty2EqWjWv4jXZ9j9F6hm4PNNghw9
X-Google-Smtp-Source: ABdhPJwa1j6nX5jloLYtG9RuU90/Sh9fPVM9brTspVa1+XS29skV/GXmtqcLaiUDjzoIxZ5qEBA8dQ==
X-Received: by 2002:ab0:6942:: with SMTP id c2mr7733560uas.92.1636446889902;
        Tue, 09 Nov 2021 00:34:49 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id f7sm2310878vkm.31.2021.11.09.00.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:34:49 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id b17so37082452uas.0;
        Tue, 09 Nov 2021 00:34:49 -0800 (PST)
X-Received: by 2002:a9f:2584:: with SMTP id 4mr7741221uaf.114.1636446888895;
 Tue, 09 Nov 2021 00:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-5-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-5-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:34:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
Message-ID: <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
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

On Mon, Nov 8, 2021 at 4:06 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add mpfs-soc to clear undocumented binding warning
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 3f981e897126..1ff7a5224bbc 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -21,6 +21,7 @@ properties:
>        - enum:
>            - microchip,mpfs-icicle-kit
>        - const: microchip,mpfs
> +      - const: microchip,mpfs-soc

Doesn't the "s" in "mpfs" already stand for "soc"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
