Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F741323C1
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 11:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgAGKgj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 05:36:39 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37900 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgAGKgj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 05:36:39 -0500
Received: by mail-qt1-f195.google.com with SMTP id n15so44926875qtp.5;
        Tue, 07 Jan 2020 02:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QeSF/6JJEtY7qU4oYuTuPQ5X5Y2Ft7PgpKJsvHUjbvY=;
        b=AvyzLP4XRqS/pfZie32tTqHu4MMHK6KfvXA4ZVHMf1OWgAwiYzh2oiozgP/AQVeppa
         CHTImlcXGBbRwFonfgBxEXart8kX8JQoKT9RAfGsKLXk0MGPJRS8mLdr8Hw3aNCqc8P5
         iCjvlcpFU7sqImCVVW/z8e2WAg9sCFoCj8xqgFY7WPWz3ekbNbuYibKkvxnOmJNCYOcr
         woQ/gFhgA2sPr8eE1MrC9xtrEg9r7o0SuUqc9ayx36hTiFJHIeS7GceijFk0xTAD2LUX
         QwZh+JAIjdIWAB9bHlZJa2lMWq/hDWGEAWiDOZutdXfr/ctlhvh2pPKDg6VyQhH0e7t2
         UM2Q==
X-Gm-Message-State: APjAAAVXSONFJ6vfnQD4UFva/oiFUxJwU95Wq4SJzHESJBbwmagdigmw
        /dxQMj4BqOHL7aHiKWYJrdrebdooucc7yu9eYpIytG/I
X-Google-Smtp-Source: APXvYqwC6fFX2xmVnSH0aCX5ekhjzhS2hXu7vSXUVbW2d2twnaRosSmB7f9ngkjda/0SXH3Se+jYLSi75YwFwWq/QWg=
X-Received: by 2002:ac8:958:: with SMTP id z24mr79726402qth.40.1578393398188;
 Tue, 07 Jan 2020 02:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com> <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
 <CAMuHMdXVxeF0bCV8tNMr_0D-HudXBMXycs=LXCxJX=wKzjQZgw@mail.gmail.com> <20200107102557.GA1135@ninjato>
In-Reply-To: <20200107102557.GA1135@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 11:36:26 +0100
Message-ID: <CAMuHMdWM0PoqLuAP2qjCjejNQ8FaArnkAT0gnd96xp3yJKLE-A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Kieran Bingham <kieran@ksquared.org.uk>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Jan 7, 2020 at 11:26 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Quoting GregKH:
> > | We really do not want WARN_ON() anywhere, as that causes systems with
> > | panic-on-warn to reboot.
> >
> > https://lore.kernel.org/lkml/20191121135743.GA552517@kroah.com/
>
> Huh? This renders WARN completely useless, or? If somebody wants panic
> on warn, this person should get it?

I also have my doubts...

> If we don't add a stack trace, we only know that *someone* registered an
> invalid address. Finding out who can be annoying. Kieran spotted this
> correctly.

What other information will you have in the backtrace, that you don't have
available inside the function?
Would printing the i2c_driver name be sufficient?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
