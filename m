Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 018A14AD627
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 12:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357417AbiBHLWk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 06:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245348AbiBHKDZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 05:03:25 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3ACC03FEC0
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 02:03:23 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id i30so17980952pfk.8
        for <linux-i2c@vger.kernel.org>; Tue, 08 Feb 2022 02:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9a3aAuOX50mvJsMuY1a5GIiQFDm5tr+cq08+mjsTm/A=;
        b=jO+m7uXJ0ZUsSfU096+lVi4qrs6BxSoRtlFtzYxMtb6l884fj4D4haoyEmKRMYQh9t
         wsH5X2j6OfZBEcejNWSwnjUuKY8iS5FMjYo/t58fLaUQPcPNVpKy4yyy3OrH9NG3TFLg
         r3gPtFIyX16vftj8Baq1dxYLHHOIDXyPBMWa89uhcMMtKpdkazzaf0F0IfcT2izHvzl0
         P4hfEnOhRCWl1Bfzo7o/QtcNu8hvlG9pOboAdpGINN8wYbYecb9d2bPhdlhBzv9IZ65g
         B0uPsjm7U1jHLX/gJMGiUjwkoqXYDAAK/QQr+BLB248VzAwJHF0gsYTtOZ0PL6d/75DR
         dCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9a3aAuOX50mvJsMuY1a5GIiQFDm5tr+cq08+mjsTm/A=;
        b=swiysAdC0UpoORU+bGWaQ2J7KeBZRxP1W2Qn9XNBToA8Y+ZcAlWaYOx2jTIi5qLSx+
         EeH1Mka8X0Cc3MAyF2ut28m8A5qvYWYKZhWTsEZ8bPCNMOd/iTlsYDgr5vLfLWmr07a5
         /pUZhywPe3kxbgWKa2uuLYwaRUiHZ6f8ATZnxziYWLBVaeLcZWeu2Wu5vZupJD1EY+ZA
         hKh50CNoXqbLuTMwEZ478dtKBYhtdiucZVNgjchey5zL1+RmH1ndF8+id0tfR/BP+qm7
         xJc13Q9QiJWhvwNrfvSaU7sQCCX7BRNQvGlp0UL40FsnAD3cAkDkq5NZ1F5JfOMOz1Bg
         fg6g==
X-Gm-Message-State: AOAM532fsO7ZIH/XvzakzqtOcsO59sg1eqFtp3iSC0RnnGQ3zwe7Qba7
        oSwII1Z1xnC0kX/FLpS/9OnK0r+RbeUK4rJrODcOog==
X-Google-Smtp-Source: ABdhPJzM1hWIXSKOwV6kGVpFedZHrHLLv1V3cuWj33KBZJnMAZXYl7Qh3XGfqDHsnPuc/C0mPbz0ojj4DRX9max7+mM=
X-Received: by 2002:a63:4a49:: with SMTP id j9mr2877151pgl.178.1644314603174;
 Tue, 08 Feb 2022 02:03:23 -0800 (PST)
MIME-Version: 1.0
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
 <YgF/0QGFN4SppLKg@shikoro> <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
 <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com>
 <YgHTYrODoo2ou49J@google.com> <b76771e5-b8e-54c9-2474-d5a73d236cba@google.com>
In-Reply-To: <b76771e5-b8e-54c9-2474-d5a73d236cba@google.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 8 Feb 2022 11:02:47 +0100
Message-ID: <CAMZdPi8PBd6RJ4BSoS_Vfb8CCv16nApLZA4n6a4fBbs5CjeMxw@mail.gmail.com>
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
To:     Hugh Dickins <hughd@google.com>, Rajat Jain <rajatja@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Derek Basehore <dbasehore@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        vincent.huang@tw.synaptics.com, cheiny@synaptics.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi folks,

On Tue, 8 Feb 2022 at 03:50, Hugh Dickins <hughd@google.com> wrote:
>
> On Mon, 7 Feb 2022, Dmitry Torokhov wrote:
> > On Mon, Feb 07, 2022 at 01:41:36PM -0800, Rajat Jain wrote:
> > > +linux-input@vger.kernel.org
> > >
> > > On Mon, Feb 7, 2022 at 1:09 PM Rajat Jain <rajatja@google.com> wrote:
> > > >
> > > > +Rafael (for any inputs on asynchronous suspend / resume)
> > > > +Dmitry Torokhov (since no other maintainer of rmi4 in MAINTAINERS file)
> > > > +loic.poulain@linaro.org (who fixed RMI device hierarchy recently)
> > > > + Some Synaptics folks (from recent commits - Vincent Huang, Andrew
> > > > Duggan, Cheiny)
> > > >
> > > > On Mon, Feb 7, 2022 at 12:23 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > > >
> > > > > Hello Hugh,
> > > > >
> > > > > > Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> > > > > > ("i2c: enable async suspend/resume on i2c client devices")
> > > > > > and reverting that fixes it for me.
> > > > >
> > > > > Thank you for the report plus bisection and sorry for the regression!
> > > >
> > > > +1, Thanks for the bisection, and apologies for the inconveniences.
> > > >
> > > > The problem here seems to be that for some reason, some devices (all
> > > > connected to rmi4 adapter) failed to resume, but only when
> > > > asynchronous suspend is enabled (by 172d931910e1):
> > > >
> > > > [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!

Looks like this is the initial issue. Does the rmi device lose power
while suspended? if so could it be that enabling async_suspend makes
the device resuming earlier, at a time it is not yet ready? What if
you simply start with a naive msleep(200) in rmi_smb_resume()?

The rmi4 bus does not rely on generic device suspend/resume
infrastructure for its subdevices, so async_suspend should only impact
the moment at which the smbus rmi4 root device is resumed, but not the
way it and its subdevices are resumed.

Would be interesting to get some pm_debug/pm_trace to compare the
good/bad cases.




> > > > [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
> > > > to read current IRQ mask.
> > > > [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
> > > > [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
> > > > [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
> > > > [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
> > > > [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
> > > >
> > > > A resume failure that only shows up during asynchronous resume,
> > > > typically means that the device is dependent on some other device to
> > > > resume first, but this dependency is NOT established in a parent child
> > > > relationship (which is wrong and needs to be fixed, perhaps using
> > > > device_add_link()). Thus the kernel may be resuming these devices
> > > > without first resuming some other device that these devices need to
> > > > depend on.
> > > >
> > > > TBH, I'm not sure how to fix this. The only hint I see is that all of
> > > > these devices seem to be attached to rmi4 device so perhaps something
> > > > there? I see 6e4860410b828f recently fixed device hierarchy for rmi4,
> > > > and so seemingly should have fixed this very issue (as also seen in
> > > > commit message)?
> > > >
> > > > >
> > > > > I will wait a few days if people come up with a fix. If not, I will
> > > > > revert the offending commit.
> > > >
> > > > While I'll be sad because this means no i2c-client can now resume in
> > > > parallel and increases resume latency by a *LOT* (hundreds of ms on
> > > > all Linux systems), I understand that this needs to be done unless
> > > > someone comes up with a fix.
> >
> > There is intricate dance happening switching touchpad from legacy PS/2
> > into RMI mode, with touchpad being dependent not only on SMbus
> > controller, but also on i8042 keyboard controller and its PS/2 port (or
> > rather their emulation by the system firmware).
> >
> > I wonder if we could apply a little bit more targeted patch:
> >
> > diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
> > index 2407ea43de59..3901d06d38ca 100644
> > --- a/drivers/input/rmi4/rmi_smbus.c
> > +++ b/drivers/input/rmi4/rmi_smbus.c
> > @@ -335,6 +335,7 @@ static int rmi_smb_probe(struct i2c_client *client,
> >               return error;
> >       }
> >
> > +     device_disable_async_suspend(&client->dev);
> >       return 0;
> >  }
> >
> >
> > ... and if that works then we cant try to establish proper dependencies
> > via device links later.
> >
> > Hugh, could you please try this out and see if it helps?
>
> Yes, that works nicely, thanks Dmitry.
>
> By the way, my memory's been jogged by "rmi4" and the discussion above:
> I had a similar-ish problem with it a year ago, discussed with PM guys,
>
> https://lore.kernel.org/linux-pm/alpine.LSU.2.11.2101102010200.25762@eggly.anvils/
>
> I'm not saying you have to read through that thread, but you may find
> some relevance in it - Saravana concluded rmi4 driver isn't capturing
> parent/child relationship correctly (at that time, anyway).
