Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81D2C8B06E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 09:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfHMHDW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 03:03:22 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33955 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfHMHDW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 03:03:22 -0400
Received: by mail-ot1-f65.google.com with SMTP id n5so168785421otk.1;
        Tue, 13 Aug 2019 00:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhGTc67iDk0mQkGr3SBplFSte482C9R5LMSQUAAcrNw=;
        b=XWZynr6FjBT9T3Wt0OSNNlyWjQHaqkGqfMM1rPxUEj0hckFOybUBKzxkbqHtpqEFHP
         lq4fuVzOThzc1BDhNL/imXMwZTKJZPDbV7UVFFlEaOaSaQJFYPaQqIVXW27wWnruRryf
         GXTO2oL526o2dpzVGGChUUoVBlb7OEumey3ul5yo8f1832XTropyRvovzIeefXvP5O2K
         yXkwzpVR9yRtB4D0I7WP3WlEVX8WLTyDcEuy0Po1mQ8+iOmQnOmZHYU90ww/8LzzmYTf
         R5o+XAokPsO/dDVJFEYurZ/5O0EW/MY/ilYSTbxQ6/pNkVr4siLD11Lg2HpfHnYTFGaK
         6dTQ==
X-Gm-Message-State: APjAAAXaXQSa3ZIfYTd07IIK+qUtlP2uY2aUUTBGgIa8aIqThb/XRGEZ
        UwaG54J2qb/wJHdV03pnZhKujsMTQ1hX1NQPY94=
X-Google-Smtp-Source: APXvYqytaLfbTwHotyHE+3m2wOIBDCYLMAHVOs9zK/GpnzKscqmVcB8SeuIErIRHBshiW4KOwggYZA3WQDpThQnws1Y=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr33683977otc.250.1565679801553;
 Tue, 13 Aug 2019 00:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190812235237.21797-1-max@enpas.org> <20190812235237.21797-2-max@enpas.org>
In-Reply-To: <20190812235237.21797-2-max@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Aug 2019 09:03:10 +0200
Message-ID: <CAMuHMdX3NtKwxb6BJzJR1qLs5vC9zhU3d+cdrrHx4B9r1opkvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] i2c/busses/i2c-icy: Add LTC2990 present on 2019
 board revision
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
> Since the 2019 a1k.org community re-print of these PCBs sports an
> LTC2990 hwmon chip as an example use case, let this driver autoprobe
> for that as well. If it is present, modprobing ltc2990 is sufficient.
>
> Signed-off-by: Max Staudt <max@enpas.org>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-icy.c
> +++ b/drivers/i2c/busses/i2c-icy.c
> @@ -160,6 +180,8 @@ static void icy_remove(struct zorro_dev *z)
>  {
>         struct icy_i2c *i2c = dev_get_drvdata(&z->dev);
>
> +       i2c_unregister_device(i2c->client_ltc2990);

Is this needed?
In my understanding, i2c_del_adapter() below takes care of that.

Apart from that, this looks good to me.

> +
>         i2c_del_adapter(&i2c->adapter);
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
