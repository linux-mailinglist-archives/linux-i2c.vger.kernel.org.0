Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11ACA132303
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgAGJyC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:54:02 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44266 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgAGJyC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:54:02 -0500
Received: by mail-ot1-f65.google.com with SMTP id h9so73097977otj.11;
        Tue, 07 Jan 2020 01:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s/kMF/bJ1LDeS7SpyIbqm4OFqc7vZ2oyDMR/GikRQIw=;
        b=QNA+eFE72GrsOPHyI40Xztm3c2n4U1a7cNQAKoqcp1Em9qPeYMt9Wp5QjJ8rtz34f9
         9I660F4JJn+3kVEAMwkmu8hm7K/4Tai9hO1IP2n6QAHCNmIA4W1ISlXoKPkgQ6PZ6Pax
         ccH51MuCFYsRsp987DlENGLKJcLUOwz7slknt2I+DiY6ZaMdYjgHq+113PfiYIUMWUv7
         ZcQIN/Y8dw38YSM87dQ4ypv54SQhYzzWNSWJChMMWe7zn2mhwqV2sqrAILfO8mhGaX/A
         ekyfc0Yfo2HvQaXQ7zH3QgFzPrE67nZBKLAOSkOR2sXbN64WUcb7bJYxYxTKJ1iUlKzB
         TUSw==
X-Gm-Message-State: APjAAAXtkPUpwAtr4zXhMc3ZJFzMPj7CczpiS1+Vr5DsMkwPeZfMvx94
        376W6jyTW4NyCEB03WGdHHbvxljRqaQe9k0xu4pjTxMh
X-Google-Smtp-Source: APXvYqw+QsF3UKmg3Vi8I2d1cNzaVtGjgunAa52mgg6hD2hLvZCebPx8bMgoN7esxIepasZ1i391EWiUVVyZBaCx2+s=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr21737883ots.250.1578390841476;
 Tue, 07 Jan 2020 01:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com> <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
In-Reply-To: <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 10:53:50 +0100
Message-ID: <CAMuHMdXVxeF0bCV8tNMr_0D-HudXBMXycs=LXCxJX=wKzjQZgw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
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

Hi Kieran,

On Tue, Jan 7, 2020 at 10:26 AM Kieran Bingham <kieran@ksquared.org.uk> wrote:
> This looks reasonable to me, I see Laurent has a concern over the use of
> a WARN to present a backtrace, but I think in this instance it will be
> useful as it will facilitate identifying what code path provided the
> incorrect address.

Quoting GregKH:
| We really do not want WARN_ON() anywhere, as that causes systems with
| panic-on-warn to reboot.

https://lore.kernel.org/lkml/20191121135743.GA552517@kroah.com/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
