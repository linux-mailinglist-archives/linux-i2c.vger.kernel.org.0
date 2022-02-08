Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A754ACF2F
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 03:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239892AbiBHCu7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 21:50:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346150AbiBHCu6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 21:50:58 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440D4C06109E
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 18:50:56 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id m25so12685542qka.9
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 18:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=j9YGDJIhJbgnGLmj0QUvoFwQuw8xnpg1AzQucPN0JeY=;
        b=dxsmwqNqTY0yk5MZkE09dvQgYkWhdAH7tRcKGXCEUWzoRiCPAhciPiVgXYBdb/U1gv
         rzMJp5n8vSg+38I8TImrWnxNDtR5sCA7xEx9WlC58mIl0D7kjdAr1SP6k7luQD91rbsq
         I+3vg5OJ4Dy6X2DIIshBxl8aCcpbxKZYTI24Nstp4Is7e8vx2Vu5aQYsaQkDFXbT/6/0
         9VltcYbbJuVo5bhPz1blV2amggNLeDFg19zPx8nyjZ7C+CwyLXCPxLncNANP1h8jrfHP
         yC4scqaJwkYnSzraqUtWzpqjqCi0vx1DkImtWkCqRlMZe1R5e107LJtc20GVGFCV8jzk
         Iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=j9YGDJIhJbgnGLmj0QUvoFwQuw8xnpg1AzQucPN0JeY=;
        b=MXDHAEabfJjj89dfWIK0ua1JyR/OBFDAz4aR24c/jzT65iKZO5IbdwLMcp5F2DT6cf
         MKG6j9zUKq8gttZcgMJw3krIzzTvCwD7TCrWcxGkrUxiIuPQ7l55L46m6ZF2a7jISxVL
         eqwweIK3etUXBXG3zTcOmBi2Jl5jIdtPk9h1h33R1vomxmMe1Io4aZakpGPmN+ZCl07/
         K1ftxZd6QWbKRdq1BpnQl9AViK/7z1Y11qDXbeSVGUi4cFFTDF1OdXvZQZk1G2vB//0s
         6RkkBRe3YqRpALn/QjY1FrbQ12zrWRWG7tz1WFXH9WmAnHIxacG+Sq1/DGwTpeBXqcEX
         SAiQ==
X-Gm-Message-State: AOAM531GuIuAAXs0TyFIeWBBQXRYtmdYn0mo88YKll8SHsPPepaY8l9y
        Da5d2Ml1wAjHdA+LGVUwpSGpF4IdEjdhyg==
X-Google-Smtp-Source: ABdhPJxe19l38PCbgZ8NckrEXyc1qlW9qQwdU1aNCgvkaaQ+6PGFh5Q8soT3N412a5DjGqXnMNRUSw==
X-Received: by 2002:a05:620a:f05:: with SMTP id v5mr1577430qkl.692.1644288654728;
        Mon, 07 Feb 2022 18:50:54 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b8sm6938297qtx.79.2022.02.07.18.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 18:50:54 -0800 (PST)
Date:   Mon, 7 Feb 2022 18:50:40 -0800 (PST)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Rajat Jain <rajatja@google.com>, Wolfram Sang <wsa@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Derek Basehore <dbasehore@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        vincent.huang@tw.synaptics.com, cheiny@synaptics.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
In-Reply-To: <YgHTYrODoo2ou49J@google.com>
Message-ID: <b76771e5-b8e-54c9-2474-d5a73d236cba@google.com>
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com> <YgF/0QGFN4SppLKg@shikoro> <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com> <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com> <YgHTYrODoo2ou49J@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 7 Feb 2022, Dmitry Torokhov wrote:
> On Mon, Feb 07, 2022 at 01:41:36PM -0800, Rajat Jain wrote:
> > +linux-input@vger.kernel.org
> > 
> > On Mon, Feb 7, 2022 at 1:09 PM Rajat Jain <rajatja@google.com> wrote:
> > >
> > > +Rafael (for any inputs on asynchronous suspend / resume)
> > > +Dmitry Torokhov (since no other maintainer of rmi4 in MAINTAINERS file)
> > > +loic.poulain@linaro.org (who fixed RMI device hierarchy recently)
> > > + Some Synaptics folks (from recent commits - Vincent Huang, Andrew
> > > Duggan, Cheiny)
> > >
> > > On Mon, Feb 7, 2022 at 12:23 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > >
> > > > Hello Hugh,
> > > >
> > > > > Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> > > > > ("i2c: enable async suspend/resume on i2c client devices")
> > > > > and reverting that fixes it for me.
> > > >
> > > > Thank you for the report plus bisection and sorry for the regression!
> > >
> > > +1, Thanks for the bisection, and apologies for the inconveniences.
> > >
> > > The problem here seems to be that for some reason, some devices (all
> > > connected to rmi4 adapter) failed to resume, but only when
> > > asynchronous suspend is enabled (by 172d931910e1):
> > >
> > > [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
> > > [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
> > > to read current IRQ mask.
> > > [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
> > > [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
> > > [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
> > > [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
> > > [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
> > >
> > > A resume failure that only shows up during asynchronous resume,
> > > typically means that the device is dependent on some other device to
> > > resume first, but this dependency is NOT established in a parent child
> > > relationship (which is wrong and needs to be fixed, perhaps using
> > > device_add_link()). Thus the kernel may be resuming these devices
> > > without first resuming some other device that these devices need to
> > > depend on.
> > >
> > > TBH, I'm not sure how to fix this. The only hint I see is that all of
> > > these devices seem to be attached to rmi4 device so perhaps something
> > > there? I see 6e4860410b828f recently fixed device hierarchy for rmi4,
> > > and so seemingly should have fixed this very issue (as also seen in
> > > commit message)?
> > >
> > > >
> > > > I will wait a few days if people come up with a fix. If not, I will
> > > > revert the offending commit.
> > >
> > > While I'll be sad because this means no i2c-client can now resume in
> > > parallel and increases resume latency by a *LOT* (hundreds of ms on
> > > all Linux systems), I understand that this needs to be done unless
> > > someone comes up with a fix.
> 
> There is intricate dance happening switching touchpad from legacy PS/2
> into RMI mode, with touchpad being dependent not only on SMbus
> controller, but also on i8042 keyboard controller and its PS/2 port (or
> rather their emulation by the system firmware).
> 
> I wonder if we could apply a little bit more targeted patch:
> 
> diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
> index 2407ea43de59..3901d06d38ca 100644
> --- a/drivers/input/rmi4/rmi_smbus.c
> +++ b/drivers/input/rmi4/rmi_smbus.c
> @@ -335,6 +335,7 @@ static int rmi_smb_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> +	device_disable_async_suspend(&client->dev);
>  	return 0;
>  }
>  
> 
> ... and if that works then we cant try to establish proper dependencies
> via device links later.
> 
> Hugh, could you please try this out and see if it helps?

Yes, that works nicely, thanks Dmitry.

By the way, my memory's been jogged by "rmi4" and the discussion above:
I had a similar-ish problem with it a year ago, discussed with PM guys,

https://lore.kernel.org/linux-pm/alpine.LSU.2.11.2101102010200.25762@eggly.anvils/

I'm not saying you have to read through that thread, but you may find
some relevance in it - Saravana concluded rmi4 driver isn't capturing
parent/child relationship correctly (at that time, anyway).

Hugh
