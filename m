Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCB5334A2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 18:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbfFCQKY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 12:10:24 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:32988 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbfFCQKY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 12:10:24 -0400
Received: by mail-ua1-f66.google.com with SMTP id f20so5023430ual.0
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2019 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyJzf1yi98VFMYZfdiaa/UefduULHHHdYwPE+AR70zc=;
        b=Bap7lCNM210BxGkcOYz91OEWkXlENlTpcQ31hRq6HBrH0xxi8/AZb8I7YE3B0EsLwj
         rcAgdEDhlszUgWwXiw4Mu0ufRq4ciizVbiyP9Cp3mqzW2GDgZXdFld5RnomQiuFTaFx9
         m+0Zi4hyJrh9BOw3rQLnBROtGDbBngdIE7PGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyJzf1yi98VFMYZfdiaa/UefduULHHHdYwPE+AR70zc=;
        b=oCH1zxNN3fbyDjDdlZ9+Ni8zbgZXUFZK1zYBnlO2ztlJHr4uuaAXG/wQ6oyTDUmIkw
         E+ZgBDd7jnIDgWFE/PSXTqOGSYT+/MJFfT5SSn0OD95CFYHpRuSGw4jsT27XAnKtLyJw
         +xxBJ7fC+cwxL2wPCAcDS00fLu0ZwthvmAvnKglqYAhqett1kQOM1espcnwdUWCArTf5
         E10zPvXUvmH3Nc2BLzHzbj+k/rDQEqB1SS5z5hsEHDqOJN6tpSv08sKryl5jgEPbuSyZ
         QCg/i1rfY5ql8vq/nnd2B/ncxb/s+aGDOmbD7W5QrPtuFULLjbj9UlWMM7AQGClZTmYX
         Snxw==
X-Gm-Message-State: APjAAAX1oPCfKS7GAjEQX1o04o/lmjqLu8RFmRYClmp2lDL1sBSLu+qz
        D7gXfwj9C6g8lLxb0y7MwANX1DWwC/8=
X-Google-Smtp-Source: APXvYqyhZhkF7+MuKa4ODluycEwYKVsSBsvt0UG5ZemvH8ik094n7UmVbJXdppeuWdVTTxT3p1ZsoA==
X-Received: by 2002:ab0:7384:: with SMTP id l4mr3306809uap.8.1559578223104;
        Mon, 03 Jun 2019 09:10:23 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id y10sm6962792vky.55.2019.06.03.09.10.22
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 09:10:22 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id c24so11593726vsp.7
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2019 09:10:22 -0700 (PDT)
X-Received: by 2002:a67:ebcc:: with SMTP id y12mr2207426vso.87.1559578222096;
 Mon, 03 Jun 2019 09:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190601165931.17226-1-linus.walleij@linaro.org>
In-Reply-To: <20190601165931.17226-1-linus.walleij@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Jun 2019 09:10:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wu=P7CFXSr_9dm1zF94VXdeZ_8aV31gh8wEy-FArbsmA@mail.gmail.com>
Message-ID: <CAD=FV=Wu=P7CFXSr_9dm1zF94VXdeZ_8aV31gh8wEy-FArbsmA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: mux: arb-gpio: Rewrite to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Sat, Jun 1, 2019 at 9:59 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Instead of complex code picking GPIOs out of the device tree
> and keeping track of polarity for each GPIO line, use descriptors
> and pull polarity handling into the gpiolib.
>
> We look for "our-claim" and "their-claim" since the gpiolib
> code will try e.g. "our-claim-gpios" and "our-claim-gpio" in
> turn to locate these GPIO lines from the device tree.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Print some errors if we fail to obtain GPIOs.
> - Switch to devm_gpiod_get_index() and !IS_ERR() on the result
>   to check for an unsupported multimaster set-up.
> - Especially handle if the second master returns -EPROBE_DEFER
>   even in the case of the optional GPIO that we explicitly bail
>   out on if found, as it may be a sign that the GPIO controllers
>   are not yet up.
> ---
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c | 79 ++++++++--------------
>  1 file changed, 27 insertions(+), 52 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
