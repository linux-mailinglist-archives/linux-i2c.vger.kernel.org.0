Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8A8D8B079
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 09:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfHMHIy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 03:08:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37392 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfHMHIy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 03:08:54 -0400
Received: by mail-ot1-f66.google.com with SMTP id f17so33365150otq.4;
        Tue, 13 Aug 2019 00:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTT+rg6SG7UBUHob0HZt48vAmE4ApsnQp1E/BlW8Ffs=;
        b=DL2/2woCXIGfwoubqoDRWb0hqPqG3lbIrqu6JYPHqPjVCHpvbp9BCMcSipRDaOKiK6
         JJI8KoDKTdo4PnekGqpLZ0fXfai/WlkGjb2pcaog3dS46FsSesjxmjzK2wBpcGnKJb4c
         FOU/qG6tcL8wTa7Fj4BJ60sO4a5P6V4ev2DhdRYkqeDBKqzOCvlv9wRPgnDJf2LI2nDY
         cpLdraLsaDWMRvSjq28yunpogUHiCojJ7F7WxDhuJEYLKDMaTZ/e0jPGA4R+BWH14eNS
         oZuVBx21kJbUYVJwKXLgnW1NRdyJwh2AGCs/YKQL9A2WKFe3Bg5Cf/8FuWWWZV0CTcXI
         4Pfg==
X-Gm-Message-State: APjAAAUmbCgfJ47GOp0yPsMx9/Pk7Y/0xxXoK2zVnflPqohEfqTy7/sT
        ZfjMIUvXUdz+kytKrNAf5AIW06lkw9DCXk0v3DM=
X-Google-Smtp-Source: APXvYqyxIBNomwwxuMp7gXjXaQeSsLp7cLO7iGbIbBd1HLTwSnMOtbU5U45ex3/GUZRUjjcCoh6+5196SaVwJtYYRzU=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr513752oih.131.1565680133423;
 Tue, 13 Aug 2019 00:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190812235237.21797-1-max@enpas.org>
In-Reply-To: <20190812235237.21797-1-max@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Aug 2019 09:08:42 +0200
Message-ID: <CAMuHMdWCm9peP9P5_6KBC63cMHXiC3p1oycb0DvKqEd8G4Nx6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
To:     Max Staudt <max@enpas.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Max,

On Tue, Aug 13, 2019 at 1:53 AM Max Staudt <max@enpas.org> wrote:
> This is the i2c-icy driver for the ICY board for Amiga computers.
> It connects a PCF8584 I2C controller to the Zorro bus, providing I2C
> connectivity. The original documentation can be found on Aminet:
>
> https://aminet.net/package/docs/hard/icy
>
> IRQ support is currently not implemented, as i2c-algo-pcf is built for
> the ISA bus and a straight implementation of the same stack locks up a
> Zorro machine.
>
> v2: Matched function names to callbacks from i2c-algo-pcf
>     Used z_readb()/z_writeb()
>     Removed BROKEN_ON_SMP in Kconfig
>     Moved LTC2990 to a separate commit
>
> Signed-off-by: Max Staudt <max@enpas.org>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-icy.c
> @@ -0,0 +1,189 @@

> +       dev_info(&z->dev, "ICY I2C controller at %#x, IRQ not implemented\n",
> +                z->resource.start);

z->resource.start has type phys_addr_t, so you should pas a reference, and
use %pa to print it.
Alternatively, you can print the full resource using %pR.
See Documentation/core-api/printk-formats.rst

> +
> +       return 0;
> +}

The rest looks fine to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
