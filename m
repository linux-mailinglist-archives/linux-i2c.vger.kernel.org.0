Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 266DAEF504
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2019 06:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfKEF3x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Nov 2019 00:29:53 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37834 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfKEF3x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Nov 2019 00:29:53 -0500
Received: by mail-ed1-f67.google.com with SMTP id k14so6222391eds.4
        for <linux-i2c@vger.kernel.org>; Mon, 04 Nov 2019 21:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S4oQAmlmvKkkE0O5UrR55Nt2vxfaeVazUKURXTgTwqA=;
        b=KVE94H62rpLeZROA+OJ5JBw1Kzr+KbQFI1eI4gnn746Ya1P36KjdSnHkQEcsfPbyxw
         Ka8NqG2ws3y0GFkWS8FvwSwLpY+8+dT1RrsmeArlrZOp/uNBBKGcu53t9Pjx9UphsVxL
         gaRcjlnXCZGkEG5a2gqKLDJYQuSD/ek0xUxQbwyF/i0v8AYvA8Y7puZZbZkZinCgKFxJ
         AJhSCyhSBZCiON/jLmomljFTiR2jt6qMuz1V3aNDaN2dclt8C195Oil14J4KsHbcyRet
         3E0RMTfbqmxpTI2YYAd0HLMBp4YXvUjOq5xM0khto/9tJaHioffhJM56Tgt6NuA80/gu
         PLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S4oQAmlmvKkkE0O5UrR55Nt2vxfaeVazUKURXTgTwqA=;
        b=kyDqiJw34UY0UfshD7KaUtVu8OFRQhYxu19DP+UKsR18eKh+x0TnSR6pnwNLOfyjic
         x014b0libDZ2w7nuo9z4jvNuINwcCKI78MhVMEBvycfdiJ4kUXzvQ5iOCqWEdaQXqTWI
         5f2JOoE7DXvEgWYHx+mUHLG6zYXyQBTVf5hHHReEpacQfOsTHC6n14XsitO8ksDl8rCp
         RPoRE7P8J6mFbgV7NPivECdMXeU8aMOo8liC42tFW5fKHdNJhh+CGbFO6frJ/mn7VoP+
         O6tOoELrl/YOdebDn+1uA/eQE73xMI0O2yUP9oB++x/pOmmY8d4nYEokmg24jVRw3XQL
         KfCw==
X-Gm-Message-State: APjAAAWtglyXXTIJOLU+H/XNp5hW5Gm2ERDR3/QwtlVKoWNpaMyzMWcj
        TW82M7kbwKoK1ItEui6+0qRr/Lg8ZtI2ACYVytyoEu/g
X-Google-Smtp-Source: APXvYqzj18jqtvm21cMlj7UPuymV6L1XZWKEEz7MNzqES9rorHPF6jAkU0ryDWW+IH5W4xwvGjZT2+8yvlyL0BslLxs=
X-Received: by 2002:a17:906:6d4f:: with SMTP id a15mr6879259ejt.175.1572931791903;
 Mon, 04 Nov 2019 21:29:51 -0800 (PST)
MIME-Version: 1.0
References: <1572615563-31751-1-git-send-email-shubhrajyoti.datta@xilinx.com> <f0a66b3c-17a1-8fb0-ee89-1dc8d0668d8c@lucaceresoli.net>
In-Reply-To: <f0a66b3c-17a1-8fb0-ee89-1dc8d0668d8c@lucaceresoli.net>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Tue, 5 Nov 2019 10:59:40 +0530
Message-ID: <CAKfKVtH_S=Rx0boFOGVN_WcM+6oAOq1dv3BwwaCcGXPGxD6zZA@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: Fix kerneldoc warnings
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,
thanks for review.
On Mon, Nov 4, 2019 a
t 10:47 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Hi Shubhrajyoti,
>
> On 01/11/19 14:39, Shubhrajyoti Datta wrote:
> > Fix the below warning by adding the description of clock and dev.
> >
> > drivers/i2c/busses/i2c-xiic.c:57: info: Scanning doc for struct xiic_i2c
> > drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> > 'dev' not described in 'xiic_i2c'
> > drivers/i2c/busses/i2c-xiic.c:84: warning: Function parameter or member
> > 'clk' not described in 'xiic_i2c'
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> > index 0c51c0f..e212a9c 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -55,6 +55,7 @@ enum xiic_endian {
> >
> >  /**
> >   * struct xiic_i2c - Internal representation of the XIIC I2C bus
> > + * @dev:       Pointer to device structure
> >   * @base:      Memory base of the HW registers
> >   * @wait:      Wait queue for callers
> >   * @adap:      Kernel adapter representation
> > @@ -66,6 +67,7 @@ enum xiic_endian {
> >   * @rx_msg:    Current RX message
> >   * @rx_pos:    Position within current RX message
> >   * @endianness: big/little-endian byte order
> > + * @clk:       Pointer to struct clk
>
> 'Pointer to struct clk' does not say anything that is not already
> obvious from the 'struct clk *clk' below. I understand you are simply
> fixing a kernel-doc warning, but I'd rather document this field as
> 'Input clock' or 'AXI4-Lite input clock', which gives at least a bit of
> extra information (even though not much more, because clock management
> is really simple for this device).
>
> Just my 2c,
I agree  fixed that in v2.


> --
> Luca
