Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E244524ADA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEUIxf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:53:35 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40889 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfEUIxe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 04:53:34 -0400
Received: by mail-io1-f67.google.com with SMTP id s20so13294065ioj.7
        for <linux-i2c@vger.kernel.org>; Tue, 21 May 2019 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0WTLMFKkLUN0R2VYo2s52FuJddz43lvf89DbG6rO7g0=;
        b=f0wy8Jgw4OePrhSb+uhjdHPIcYaf94LsDLObsmWgcRRGwprT+MFwYrfsYtifaDDl7Q
         +EijPvIDfoUForSDn9CGCgptmFY+FfpRZOIdzz5s/WLap14TkHuTKCu3ri2H/CW4EWya
         b5R8hlW/yKna8jXe1rjJ1XqCdw7VAjBnoLtWHt148Uz3zI5YCe+3HQX0HUiQDSVcMH0l
         Xs7l3P9TJnCLusmhbpIO70CDJGsOKVbEZpqxkQ9afsjs3BXGgI+LtdhpzQHWBW9zxb80
         D5V2c78mYOltjZ6n5Fs47AObDtY91lqjLUMJ6+MqH6iKzPgQpg3irZuDSvZj0E2xubEe
         OjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0WTLMFKkLUN0R2VYo2s52FuJddz43lvf89DbG6rO7g0=;
        b=JB3Y7QGyGO7Vw76aB1cU0etjJ5q3TJdTaMa7sKyA/Iw/N3PnPddNq+s45kXH3Vlfxi
         zodxg1vsc6xXrTuulTrtbPtvodOjGOQT5wTjfa3iJ+YSEtnkJXmOgNPUTj5LOA046BC8
         uoFbdSPVaP9MW3e2bYCns3vN0VA9hu40KI4B4HQd/hApp8xuJ0M7YcY4gJle7yVvp9vn
         fA0QxrDYKbuqXSe0cYvysZWOZiZaWHeqJZPhVj163pJL4tXWFvjY6Ww4jyMSnAG9dl/D
         Urlvn149R5Vi5N1jQ18l8oECxsKwRApDKiKMAcv0wrKZ7c+3Rda+2ikrkylFboJQvicG
         /ABg==
X-Gm-Message-State: APjAAAUomWx1MobNZEnH6R0pKSy8+uYfFG/Bt7210Z/OxaPaEPp4Ulnb
        ocoMtVNi4rHl5BkJCAVDmorNYKYye5TVzd3RRvP4uA==
X-Google-Smtp-Source: APXvYqxowIZJEKCvn9zlEa54stTzsKBZRQuqwpelBfsdNv9od56pW1pvcCFx0lySUeXz8aWSKtdrXCW4KzGHUbNyGkU=
X-Received: by 2002:a5e:9411:: with SMTP id q17mr10206625ioj.65.1558428814158;
 Tue, 21 May 2019 01:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190521013350.8426-1-masahisa.kojima@linaro.org>
In-Reply-To: <20190521013350.8426-1-masahisa.kojima@linaro.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Tue, 21 May 2019 10:53:22 +0200
Message-ID: <CAKv+Gu_Zcgr_9i-nX2pYp2SPJ0h6GHsKQ+3BUnRn4CnFsWxEPg@mail.gmail.com>
Subject: Re: [PATCH] i2c: synquacer: fix synquacer_i2c_doxfer() return value
To:     Masahisa Kojima <masahisa.kojima@linaro.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Satoru Okamoto <okamoto.satoru@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 21 May 2019 at 03:35, Masahisa Kojima
<masahisa.kojima@linaro.org> wrote:
>
> master_xfer should return the number of messages successfully
> processed.
>
> Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
> Cc: <stable@vger.kernel.org> # v4.19+
> Signed-off-by: Okamoto Satoru <okamoto.satoru@socionext.com>
> Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

> ---
>  drivers/i2c/busses/i2c-synquacer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index f14d4b3fab44..f724c8e6b360 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -351,7 +351,7 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
>         /* wait 2 clock periods to ensure the stop has been through the bus */
>         udelay(DIV_ROUND_UP(2 * 1000, i2c->speed_khz));
>
> -       return 0;
> +       return ret;
>  }
>
>  static irqreturn_t synquacer_i2c_isr(int irq, void *dev_id)
> --
> 2.14.2
>
