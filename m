Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D299F95AA5
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 11:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfHTJIN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 05:08:13 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43938 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTJIM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Aug 2019 05:08:12 -0400
Received: by mail-oi1-f194.google.com with SMTP id y8so3538197oih.10;
        Tue, 20 Aug 2019 02:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lrFXPnKUiQnk8Bn/RsYkWMYxjLa4oQsr3R8Oeq6EX1s=;
        b=jNxCReY4r+Yzgq5KZJJAondmbM1zWmzH9F5XLjfUK1fTADON+XVotH3VoCy753rH80
         AnuGtNq2RvK3b5otBJDC+gl8vqK+Iqpq4MCG7A521HAgKqrPdHovmVw89estjx1tqsRp
         86OffQetyfd4TkbPm3AP/RUsfntu/FXtr+3mW7bWJkIXVFiYbuvqmXCdhh/Vv7MIhgpb
         jaqdvFAusoXLhuNMTbwgB6xcSV+GUGxcCQQ6EzZV1j5rfyLlcCQf5z2PK/MGEbH/N0g3
         QQbb6V8pHyOIetBk/vvYFUpbGMjCWaRFFSUyhO+esZHD/RBGUUhRz+f1XwyTjx9AXzxS
         g6tQ==
X-Gm-Message-State: APjAAAUzNb7nzBMa+HF7Jfwr5k1C8MUU4z6Bk5qjG6+7suhYH8FiDaak
        ePfFN4QCqaK/NQH5mFmz72+E0w/Iu/048PWbi8k=
X-Google-Smtp-Source: APXvYqyrME+Zi0KuuED6kPm+wXg4w60IHWQKF9jQ25MFaOMMjU5Ia1602KDn3l1GQS3FIFbsDmPgThd7qFVbcrP2XBk=
X-Received: by 2002:a54:478d:: with SMTP id o13mr16391135oic.54.1566292091580;
 Tue, 20 Aug 2019 02:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190819121618.16557-1-max@enpas.org>
In-Reply-To: <20190819121618.16557-1-max@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Aug 2019 11:08:00 +0200
Message-ID: <CAMuHMdU=18qtZi7N8+i9cJbKVL+pOB-wttnRRu_mOcMNymF_3w@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
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

On Mon, Aug 19, 2019 at 2:17 PM Max Staudt <max@enpas.org> wrote:
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
> v5: usleep_range() instead of udelay()
>     Style
>
> v3: Fixed %pa format string
>     Dropped adapter class.
>     Clarified licence.
>     Removed clock parameter.
>
> v2: Matched function names to callbacks from i2c-algo-pcf
>     Used z_readb()/z_writeb()
>     Removed BROKEN_ON_SMP in Kconfig
>     Moved LTC2990 to a separate commit
>
> Signed-off-by: Max Staudt <max@enpas.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-icy.c

> +static int icy_pcf_getpcf(void *data, int ctl)
> +{
> +       struct icy_i2c *i2c = (struct icy_i2c *)data;
> +
> +       u8 __iomem *address = ctl ? i2c->reg_s1 : i2c->reg_s0;
> +       int val = z_readb(address);
> +
> +       return val;

return z_readb(address);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
