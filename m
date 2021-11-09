Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B2444A969
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 09:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244361AbhKIIoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 03:44:13 -0500
Received: from mail-pl1-f173.google.com ([209.85.214.173]:39674 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244402AbhKIInQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 03:43:16 -0500
Received: by mail-pl1-f173.google.com with SMTP id t21so19642292plr.6;
        Tue, 09 Nov 2021 00:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSLDpPNAPTFpdKJNeNQhMNDuIXO+IuEe87YK9rCw7Wk=;
        b=bkicM4NptlSvs00dBmXJ8TA9DlC4vSJ2JXtFGNClf/JdgY4gMyYyDkSYfwVpSzaTnz
         X/9Wi4YkrynGP0SbMT9EbYhwepz+NrK9oERNaggxMkpCgX+anSzKxtgAOIKj4IYigEg0
         9ziUGP3BHi4ZZk6si4bLc9OwHusH/W4uqufNQGUc7GWsZYNR/2ugLGrYPK2Y/IuTbNWx
         ocF8GDLevXNUHUAP+S9RN7O/NISFiLxrDiEy4+ZZ/7GaeGMzoIQvLQUzjhwcMEb6xQjS
         GFVmaUA4Tuo/vGfkt0fsCpn5T74w77WAPuCupdrAq5wpzcctY8fN/XoXodE/YsvedD0a
         0v6A==
X-Gm-Message-State: AOAM532+o1o3PB0qgfdwg60wYvQCsPagQHqel0K7+/32C8gpUGzkhywD
        d8m7o/BRi10LzU2X5WI1pTtuoRpciUOYTtil
X-Google-Smtp-Source: ABdhPJwtNor6FrZO+2M63XnKFgzRT/k6VXW3jhwqnHCDRjPu1KybXzCzjDFd1YQD8ThE7ACLxJkvoA==
X-Received: by 2002:a17:90a:134f:: with SMTP id y15mr5317434pjf.158.1636447230229;
        Tue, 09 Nov 2021 00:40:30 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id a13sm1962640pfv.99.2021.11.09.00.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 00:40:30 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id o4so4771059pfp.13;
        Tue, 09 Nov 2021 00:40:29 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr9441005vst.37.1636446824427;
 Tue, 09 Nov 2021 00:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com> <20211108150554.4457-4-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-4-conor.dooley@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Nov 2021 09:33:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVx9BgCYHX5-Bwx1TzQzNK1+7cUWoWnOdMX31SJ22sMzg@mail.gmail.com>
Message-ID: <CAMuHMdVx9BgCYHX5-Bwx1TzQzNK1+7cUWoWnOdMX31SJ22sMzg@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat string
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
> Update 'compatible' strings for system controller drivers to the
> approved Microchip name.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

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

Is there any point in keeping the old compatible value?
Are there any real users? Most of the MPFS upstream DT is still in flux.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
