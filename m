Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0BA2760C0
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 21:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgIWTF0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 15:05:26 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36088 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgIWTFZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 15:05:25 -0400
Received: by mail-oi1-f193.google.com with SMTP id v20so996052oiv.3;
        Wed, 23 Sep 2020 12:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=riDSVgXlGYFR+6jWV+2ATBBKwbz1TRVTuZiwea5PJ9s=;
        b=Hjju+W0cGOzisr1G21K0uROICBFATAVKhuJjHxEHNR5x6vMrFOeUUCtRFiAXKUSQc9
         BemhNrK5sgPriO9puFpStpBUNo5rFLPTeP0BVSs0Mo+/2RbMEGIxcAp/NelMNU/y2GL0
         hgM2EgDriNfjl3AuejFgKBfuDy20B4j97kFBqGLQg41gf8FzJ+HlXIhXiq2PeZemwXqc
         Xwr7BvhjMR9jYs3bQ9/f7nW0BP3ylhkPy7oxk7TJHNdFCEfOI9FfiN9pJmdGEwM4xvf9
         LF690BuIJFP8JPfURu6LANBwFmQ+xtpUoxWvpXWRO49KRsCLuvRke1PnT3hjh6kTMWje
         05RA==
X-Gm-Message-State: AOAM532aMfaJaJVM8W7kQsmpdUCEplHFopiD05xFYCb1yRuwoTXXD1H5
        eiiwHMGoJsLDCC9jt0r/PeXA2VAgrOCtj5rPVGn5ra33
X-Google-Smtp-Source: ABdhPJy5GTGjyHrW2H+N0TM5K1BJLFkK54/2LwkBFIxRlcZ9ns/xjt7e8BUd3q+8cbioeo7oofTcgJOa2jbn3Dd9NKw=
X-Received: by 2002:aca:4441:: with SMTP id r62mr499595oia.153.1600887925058;
 Wed, 23 Sep 2020 12:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200922154943.29574-1-uli+renesas@fpond.eu> <CAMuHMdXF7kX0u_awH3w8sCAvAQUN7dzZix6anSrrafwTjpLBUg@mail.gmail.com>
 <20200923160627.GA6697@ninjato>
In-Reply-To: <20200923160627.GA6697@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 21:05:13 +0200
Message-ID: <CAMuHMdV1dJax_gBB-mR2fvJLSiynEnS8GZkcZq3BNmb6KXxxDg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: sh_mobile: implement atomic transfers
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Sep 23, 2020 at 6:06 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > To make sure external conditions are satisfied, and we never deadlock:
> >
> >     if (pd->dev->power.is_suspended)
> >             return -EPERM;  /* any other suitable error code? */
> >
> > Perhaps this can even be done in the i2c core instead?
>
> Good question! My gut feeling says "i2c core", but that would need more
> research. I'd say we tackle this in a seperate patch but also for the
> next merge window. Sounds good?

Fine for me, it's already late in the v5.9-rc cycle.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
