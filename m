Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7841F9779
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 14:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbgFOM7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 08:59:11 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38743 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730071AbgFOM7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Jun 2020 08:59:11 -0400
Received: by mail-ot1-f67.google.com with SMTP id n70so13014027ota.5;
        Mon, 15 Jun 2020 05:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gDcy+5QlBNnC9u5VTfQ8VAY3iKZcZhRb0ooVuUjZG4E=;
        b=asFQ1LvibZvpCU4/V7FS8auZdxex2cvUOpsADZhmxsdL+Z2iqjB0Zk2S5nuvoikh7r
         bMTR4ShYmnh22vG6kYhUB3mbbHrlv/PbH6/UXtw49MQtij8YGKDiQQdnN2g94Vcj1HsJ
         5XPDxUK6W3t45SqZSVtBbU6TEUZOIuS6b/AtUdFdYNNS7BQkTG09D0An8pbYYVJ6ziq0
         nY0lHYS9bVfo15vLSj+UVWm5Hqu0xHed4ifIhO7NaxFQB+/g9ng99Y0srayM7CdrmWEV
         OlyVSbkpME7A0P55X2FeA+6qj6gET3f9jnp2Ju1yygyKOw0zNICUxfSbgZO+ud21KH6V
         MzSQ==
X-Gm-Message-State: AOAM531NStePUQVzWIap+dQiAMWOaVdCKtaThIIjBF4WFfYuXzBWXQTP
        Uya1QRPYfpFI1gZoXkNFk1OOMPxuOsTtlUEHW/k=
X-Google-Smtp-Source: ABdhPJxvA0iJjsv9/vsBEemQECwV2j6e3hNjeqPgPbsWOiYatVIpLZsgj1lFg4TuV5PAi5cgu5QTT5g0HfZwK3Rre58=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr21413119otp.250.1592225950782;
 Mon, 15 Jun 2020 05:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
 <20200614093131.GD2878@kunai> <CAMuHMdWA82HpLAjYBK0fHm=wTM3LGjKn_c9KRH1EZTi8UznrBw@mail.gmail.com>
 <20200615124834.GB4423@kunai>
In-Reply-To: <20200615124834.GB4423@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Jun 2020 14:58:59 +0200
Message-ID: <CAMuHMdWbZ8Bs84naNtoPk6N3itXABwwE2KGVG3k4dbw_5+Qm7A@mail.gmail.com>
Subject: Re: [PATCH] i2c: sh_mobile: implement atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Jun 15, 2020 at 2:48 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Uli: can you check if atomic transfers work with the touchscreen or
> > codec on Armadillo-800-EVA?
>
> Atmoic transfers are used for very late communication (e.g. PMIC).
> Touchscreens and codecs should be already down, then.

So how to test atomic transfers are working if the I2C controller is part of
a real power domain? Add a fake PMIC?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
