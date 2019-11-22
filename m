Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34F211068DD
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 10:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfKVJcC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 04:32:02 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23121 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726364AbfKVJcC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 04:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574415120;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DoDZy46uKDi4GzZqKHF4v0IZkSk/7/aoKA8jH0rjeS0=;
        b=LHFx+JvOeGRfkYmceH33XPWhBjygo+XXBQUO0qO+gsaj6z9BB7NJrmsUj4VaZ6FHOEgA/K
        3fBkLay4Xrz8POi4VQrM1mMwbyILoTCzqcRJVUYW6++LSNlWA8UiB5FDaiIIMXJpIRF7Oi
        BzJDi/Ioq+sI11DwXFne1sHdZV258Rs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-V78fDNrtPnKsyry5UyHBiQ-1; Fri, 22 Nov 2019 04:31:56 -0500
Received: by mail-qk1-f197.google.com with SMTP id l21so3907786qke.21
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2019 01:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JlU5TxJJYJcA55zvxuKAcCWK3844Z5TRyqoE20NoTVY=;
        b=rDBJu7U+SqRy+9OMayvgyLWMTdvEOaIWAQXw99pnwy/2bZa/KwdT2w/eqiIqeLuv/A
         A5SHihjOH8ZoL3gMOB2DVBqxs1Y4L3p/I/wygPUosur9LlLP5njxf5CXOvGi5evvfhpB
         1nwbXngIN4lCMch+uHMBGE9mI5W+d98+qvseYHsmOMxlkpSNzxnAZWJjysqdL6p1AIrU
         lG/sDMm5WZ5a0Vfpugn+3F6h4wSOKCVTbFMuhIhXZqMzPVg4IMMqCV3FLr9tP2CLO6MI
         0rbSLZSbFBR7qC2lSVPUZGhlYCjCNR1Obap1n7MgQvkpWe9sHcl0wB6iMbR6iK41lxov
         IaNw==
X-Gm-Message-State: APjAAAXo9Y7H+u36ryHo2GY89Sen3SOaOw//THnOL3dHg51JX73PWxOQ
        QKW2q1Y4/f0WRQh8inUfBsRHX1iV8l9AGVNZXshaWFC4D/Y/wedqnpbZbODWF7HedcTb2czx6kH
        FGWygKQDYBK8wjprUqn73+ovSAkZ5nZqOEAL2
X-Received: by 2002:ac8:6757:: with SMTP id n23mr778399qtp.345.1574415116461;
        Fri, 22 Nov 2019 01:31:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVKRfO7wfJ4RTGrhgqBSUwX/B3aKrHxhMTszKmhSLo74jhXD7Rb/fSKVXRmqeLl4oFjcVM9RTjE+Ny/ZD/kTA=
X-Received: by 2002:ac8:6757:: with SMTP id n23mr778369qtp.345.1574415116049;
 Fri, 22 Nov 2019 01:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20191121101051.71859534@endymion> <20191122032719.GQ3556@minyard.net>
In-Reply-To: <20191122032719.GQ3556@minyard.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 22 Nov 2019 10:31:45 +0100
Message-ID: <CAO-hwJLc2MJ_gBM=29hz1WZLTO_jwC0x_P+e+c1kezeFxG55DA@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-smbus: Don't filter out duplicate alerts
To:     cminyard@mvista.com
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
X-MC-Unique: V78fDNrtPnKsyry5UyHBiQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 22, 2019 at 4:27 AM Corey Minyard <cminyard@mvista.com> wrote:
>
> On Thu, Nov 21, 2019 at 10:10:51AM +0100, Jean Delvare wrote:
> > From: Corey Minyard <cminyard@mvista.com>
> >
> > Getting the same alert twice in a row is legal and normal,
> > especially on a fast device (like running in qemu).  Kind of
> > like interrupts.  So don't report duplicate alerts, and deliver
> > them normally.
> >
> > [JD: Fixed subject]
> >
> > Signed-off-by: Corey Minyard <cminyard@mvista.com>
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > ---
> > That's a 4-year-old patch from Corey which I stumbled upon this
> > morning. I was supposed to test it on my ADM1032 evaluation board but
> > never got to it. Sorry about that. It turns out that I no longer have
> > any system with a parallel port to test it.
>
> Thanks.  This hasn't been a huge deal, since the only system that is
> affected at the moment (AFAIK) is the qemu test environment that I use.
> But it will be nice to have this for when something real actually uses
> this.
>
> -corey
>
> >
> > I think the patch is correct and whatever the problem was on my ADM1032
> > evaluation board, it should be fixed differently. Maybe it was a wrong
> > trigger type, or alerts must be disabled temporarily during processing,
> > or the hardware is actually bogus and it would be up to the device
> > driver to ignore alerts for some time after receiving one. Whatever,
> > let's apply the fix now and deal with this problem later if/when it
> > resurfaces.
> >
> >  drivers/i2c/i2c-smbus.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> > index 94765a8..cecd423 100644
> > --- a/drivers/i2c/i2c-smbus.c
> > +++ b/drivers/i2c/i2c-smbus.c
> > @@ -75,7 +75,6 @@ static void smbus_alert(struct work_struct *work)
> >  {
> >       struct i2c_smbus_alert *alert;
> >       struct i2c_client *ara;
> > -     unsigned short prev_addr =3D 0;   /* Not a valid address */
> >
> >       alert =3D container_of(work, struct i2c_smbus_alert, alert);
> >       ara =3D alert->ara;
> > @@ -99,18 +98,12 @@ static void smbus_alert(struct work_struct *work)
> >               data.flag =3D status & 1;
> >               data.addr =3D status >> 1;
> >
> > -             if (data.addr =3D=3D prev_addr) {
> > -                     dev_warn(&ara->dev, "Duplicate SMBALERT# from dev=
 "
> > -                             "0x%02x, skipping\n", data.addr);
> > -                     break;
> > -             }

I assume that the SMB alert client (ara) is the one responsible for
sending the data.addr, and so it would make sense to consider that as
long as the client sends the address, there is something to process.

With that (probably dumb) comment, the patch is:
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Note that I have no SMBus alert device to test this, but the patch
looks correct to me.

Cheers,
Benjamin

> >               dev_dbg(&ara->dev, "SMBALERT# from dev 0x%02x, flag %d\n"=
,
> >                       data.addr, data.flag);
> >
> >               /* Notify driver for the device which issued the alert */
> >               device_for_each_child(&ara->adapter->dev, &data,
> >                                     smbus_do_alert);
> > -             prev_addr =3D data.addr;
> >       }
> >
> >       /* We handled all alerts; re-enable level-triggered IRQs */
> >
> >
> > --
> > Jean Delvare
> > SUSE L3 Support
>

