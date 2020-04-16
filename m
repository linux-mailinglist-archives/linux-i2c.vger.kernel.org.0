Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A4B1AB6EF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 06:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392041AbgDPEr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 00:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390974AbgDPErZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 00:47:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27857C061A0C
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 21:47:25 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so6293392ljp.9
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 21:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+NDlWQ/mRFjSuqtZlOq7qrYq4K4xoJ9j5o51tM/JSCc=;
        b=DIr5D1DwGtuWE+AQZWvlocaxYUwNMz4kWu1civ3xfMmjTJptX9W/wDWceP+Ufd46OU
         TMM1FddMh61/VRQPGRl+VZiqTv/2mTZGXp6xwrFGC0wqsbdu1e/qXu7bPPJxzKwElWZ9
         W+/w8sk81hHsOttLqrUDm1veCpPpttvFydWhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+NDlWQ/mRFjSuqtZlOq7qrYq4K4xoJ9j5o51tM/JSCc=;
        b=GrlmiDZ9qZlvTf0Ro/nMf3OXwsQGCEMd+3s1ML5Xz8QlVN/BFFttlASuFEplZpd5yF
         MwVGYIYVTASk7O4s+3bXqy+j1hK0HxZqPPNGcgRG5DjykzYN2Aty5fdkAHENTaC+LB/u
         sY3cdLuBaKTwoxp6y0nZsQ2SPgS2SOvqTDxYTTW6MHODgbpTm8Im5WVPc7OjISij1MAR
         6BsFzUBNnG+GyMlqt77Hxd4zo8QIm9a76zRgesR6BgT57NeZkXYJ73paS+6lJB0BhenF
         ZIn2N0Vz4q5tUMx1he2fKz/2Xg6Amn0YZMvRdwDX2Y3jDS0C6eO28jGTpDHEPXrLObBk
         N+DA==
X-Gm-Message-State: AGi0PuYxlXHZ6HNRUvyyRByx5cOyguHZ5KKcfHyMgTky/F4BBvEFNuvF
        m93a2swnTscj4fx3/y1h1QnmzSsxCy53Aor82w5QIw==
X-Google-Smtp-Source: APiQypJA4A7ULXkeBweYmQbdUIOUieWPyVIxDPOys0Ry6iqrOvNMb71M3vq6dhM29YnR8rKQis03m1kXD1m5wzUHDRU=
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr125354ljm.129.1587012443450;
 Wed, 15 Apr 2020 21:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200322182019.32493-1-rayagonda.kokatanur@broadcom.com> <20200415122945.GC910@ninjato>
In-Reply-To: <20200415122945.GC910@ninjato>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Thu, 16 Apr 2020 10:17:11 +0530
Message-ID: <CAHO=5PF5yOOUUKHzEA1710YRFJe8VvR09HinjR9Hyoo7kXFa=g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: iproc: generate stop event for slave writes
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 15, 2020 at 5:59 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Sun, Mar 22, 2020 at 11:50:19PM +0530, Rayagonda Kokatanur wrote:
> > When slave status is I2C_SLAVE_RX_END, generate I2C_SLAVE_STOP
> > event to i2c_client.
> >
> > Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
> > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
>
> Just to make sure: That means the HW has already detected a STOP
> condition on the bus?
Yes.
>
> > ---
> >  drivers/i2c/busses/i2c-bcm-iproc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> > index 30efb7913b2e..b58224b7ba79 100644
> > --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> > +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> > @@ -360,6 +360,9 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
> >                       value = (u8)((val >> S_RX_DATA_SHIFT) & S_RX_DATA_MASK);
> >                       i2c_slave_event(iproc_i2c->slave,
> >                                       I2C_SLAVE_WRITE_RECEIVED, &value);
> > +                     if (rx_status == I2C_SLAVE_RX_END)
> > +                             i2c_slave_event(iproc_i2c->slave,
> > +                                             I2C_SLAVE_STOP, &value);
> >               }
> >       } else if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
> >               /* Master read other than start */
> > --
> > 2.17.1
> >
