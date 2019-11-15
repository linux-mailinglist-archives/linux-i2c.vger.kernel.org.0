Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C014EFD763
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 08:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfKOHxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Nov 2019 02:53:47 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44296 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOHxr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Nov 2019 02:53:47 -0500
Received: by mail-ot1-f66.google.com with SMTP id c19so7271784otr.11;
        Thu, 14 Nov 2019 23:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZHuccE/95KXLQImkLtOEDMk/sqf7jY5QUv/r90SYzw=;
        b=Hm3ie+nTD/b9EF00oIdirV9FNVVp6P95IDxe5YEZeJYUZouiKbmDAOXe60UQuNcbGk
         QKOUYt1uvIo1zOLiJ1tp3D2kDWEqSKbq7OB+bCxgg3q5Z+Ch15P8a1bkg4KQiJsST1Qz
         XQ6fL9LcPCplzrkiDvNNeDlXeNRSz/z2bdcB+LWqWAMHTij9ie+ah0gOOmEl+8mxvN9S
         IcXrh98bFKTZSx9lf91y4AfW25Af2ntYxRsdCY8Zv1QvBD/EfMMq0jXEuYl9ABtsDxCu
         MUgtttSMMv0m+TuNezRqmjoEK/hh4d6JAVVi0uSko/ikzz4wa2axFdiz5YJ6+ErTGDM9
         oO3A==
X-Gm-Message-State: APjAAAUjNMAJSFtNMxAqEe0EEM+6cVeP5PclWEciz7Uwz/TL4T6utr2r
        ngilNwF4j+U0v6j+2YfJj/IUGYgsjvvBxktOKTNX0w==
X-Google-Smtp-Source: APXvYqzk3G/z/EdYihyFqa9HiPqmkoti86ph8Fzpm/afY5conxIn2WKpd9AlGFYNe4kHlYz/JwUZT23rgY/tnvtrm5k=
X-Received: by 2002:a05:6830:1047:: with SMTP id b7mr1144052otp.107.1573804425957;
 Thu, 14 Nov 2019 23:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20191113101453.28157-1-geert+renesas@glider.be> <20191114203940.GA7213@kunai>
In-Reply-To: <20191114203940.GA7213@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Nov 2019 08:53:34 +0100
Message-ID: <CAMuHMdUpfAtt2QZUCFgmk5uYN+x0BBYBEA27nEp_k4WguV8h8Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: Remove superfluous call to clk_get_rate()
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Thu, Nov 14, 2019 at 9:39 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, Nov 13, 2019 at 11:14:53AM +0100, Geert Uytterhoeven wrote:
> > Variable "rate" already contains the current clock rate, so use that
> > rather than calling clk_get_rate() again.
> >
> > Fixes: 8d0494037bb2af32 ("i2c: rcar: get clock rate only once and simplify calculation")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Applied to for-next, thanks! I agree with Luca, though, and dropped the
> Fixes: line because this is not a bugfix.

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
