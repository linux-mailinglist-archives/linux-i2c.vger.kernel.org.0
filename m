Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5FB8B02A
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 08:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfHMGx1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 02:53:27 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45593 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfHMGx1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 02:53:27 -0400
Received: by mail-ot1-f66.google.com with SMTP id m24so15626751otp.12;
        Mon, 12 Aug 2019 23:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vz3G11PqHYeCzc37P34uoD1vhwXZtRmIg5ogdMOlp8Y=;
        b=kXY0qAyCMENcVwrKoVuaKTUJKKY8OtPQHZVn9R6067vh4M/lpSfXMAwt3PNmAmHFb4
         Mb3BgEs+z254KdpqPaGjPPrNVpb+B+pkc8trU4pERCDoEg2clZR8N7iMDO+YXOhkfnpS
         ShWWmkH3382PzTBcpWPXFCK8PUxLQxsMd6u5T2h7bvzpHnEXHCemiqQ5xASKkJV+wIPw
         Harkj4FagGLS4Y8jZCQQCxi2K7HJpIQweOUKs2KzUL+lxC87GkxUwnfyPmNj4khkW3QA
         vSu2PoyxVlCmIfnKkqjVvt9691OHC+1QVhl3koYoFJgnf527dm8PL9pBojxW+fvStgOA
         3hng==
X-Gm-Message-State: APjAAAXqgCZc+4SsWlwX/sQhelU2JmRs7Y+Pz+pl824omAWsUNQCU0jA
        2ZQvzgn//40v5p3Z99T/8fkeYsnBzcaZPIBkipKUQg==
X-Google-Smtp-Source: APXvYqxMLv1ABsas1WFYO66GujeO/vB0usB7gDbIYXEPS6g7MCLQzXHL1a7g5P39z2LryIdQg8rzU18p4abRSAQJzrQ=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr30441928otk.107.1565679206247;
 Mon, 12 Aug 2019 23:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190811043253.24938-1-max@enpas.org> <CAMuHMdVJJxjH-gPraW==smrkOOMcGYPKB8BPzrYPU4bstASX3A@mail.gmail.com>
 <0d61e12f-5fc5-7cb6-755f-298ebf4c935f@enpas.org>
In-Reply-To: <0d61e12f-5fc5-7cb6-755f-298ebf4c935f@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Aug 2019 08:53:14 +0200
Message-ID: <CAMuHMdWr8VNBBVjgcu9wtdby-0pznEtg=GeVmAcrk78Of7gwNA@mail.gmail.com>
Subject: Re: [PATCH] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
To:     Max Staudt <max@enpas.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Max,

On Tue, Aug 13, 2019 at 12:21 AM Max Staudt <max@enpas.org> wrote:
> On 08/12/2019 11:37 AM, Geert Uytterhoeven wrote:
> >> +       iowrite8(val, address);
> >
> > As this is on a Zorro bus, z_writeb()?
>
> I forgot to ask about this.
>
> What is the reasoning behind having a separate z_writeb() for Zorro?
> As far as I can see in arch/m68k/include/asm this maps 1:1 to a direct memory access, and it prohibits cross-arch code as in i2c-elektor.

write*() and friends are intended for PCI, and thus little endian, while
the Zorro bus is big endian. For byte accesses this doesn't matter,
obviously.

Note that this predates iowrite*(), which does have *be variants.
If you want to add compile-testing to your driver, using iowrite*() is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
