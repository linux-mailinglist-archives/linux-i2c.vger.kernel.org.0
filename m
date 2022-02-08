Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CF84ACEC6
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 03:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343906AbiBHCUY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 21:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbiBHCUY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 21:20:24 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326B0C061355;
        Mon,  7 Feb 2022 18:20:23 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so1184445pjb.1;
        Mon, 07 Feb 2022 18:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3voktX25CEcc7Ox+ZaE8wcmsYyWJ14ljUbJuhmaSIVk=;
        b=YSiuLQzdyEW+yQGnw9QwtRxbT+Y414YIVE0pOEGZszr/lWdLopVqrJHelcb7W1odqP
         kHFHzn317V5IOuLMIvaFPP5pep9acthY5Tc5t0ldiTKnWBmU7u0D5jCyhb3b0DZN9F62
         4cS7LM4OSWaXf8AbfAer0MUPuwE7CZNFH9BbTgG8taq1v9vC5fxwc/3jywhSdvckf5Kw
         Lk+1Fn68d3NCDBc9Zp3ZRKrOp0wf4Al2s+1mbsiuWnxUM2GojD9FF0sm+jcP3at7Itye
         F1LkKq5iCi2ebO6jgwnXdlaXniKBQ//i2mOvZb56DxEIuhCeyePRhyBQ+Fc93XYHbYE1
         86+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3voktX25CEcc7Ox+ZaE8wcmsYyWJ14ljUbJuhmaSIVk=;
        b=ZgJ+m39zaySksc2mPn3HDCFHDT/HBVylhx4bC6etrnDibKHg7dsRBlDBi23W/pdIhD
         FNNtIvaS6c8CFHLBIhmeaz/37hD3bmi4Drud3F7/yIXrxymveb8rBs1swbcoiS5qil6y
         +OUo9sOZlidABeNe7PciR1ruwIEzNRSmcPMOLkCupgpeGzhuqOGP3vMQMXHBRQrfaujx
         16qKmUa51WQiHS9LwktLuBZUuNGNOFtsTKSFKeNstptpIY5YkEj27KQB1YYFhOzEWuVZ
         PDvbWPaMwQ3w4ZgLtsM28RGrWc1j+Jo5InlMK66G42sXXtXMPfHsN9ALRRqPTWhsmT3N
         seDA==
X-Gm-Message-State: AOAM532JVfZSq858Vzw16CmUFiy+Y0yHZpkID21TtNeotWSdChu3pKmZ
        BEtDzmgtorNJgUcPpU1xuac=
X-Google-Smtp-Source: ABdhPJyoN9ImWN5bwQi/JeLNBNpouSH7t6X+KC/Pqe63KUFUGNAEeo2+hvVGkO9xB7UvSpGCnnfhrQ==
X-Received: by 2002:a17:903:248:: with SMTP id j8mr56516plh.123.1644286822376;
        Mon, 07 Feb 2022 18:20:22 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7164:d581:d7ee:53bb])
        by smtp.gmail.com with ESMTPSA id q1sm626649pjd.48.2022.02.07.18.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 18:20:21 -0800 (PST)
Date:   Mon, 7 Feb 2022 18:20:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Hugh Dickins <hughd@google.com>,
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
Message-ID: <YgHTYrODoo2ou49J@google.com>
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
 <YgF/0QGFN4SppLKg@shikoro>
 <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
 <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 07, 2022 at 01:41:36PM -0800, Rajat Jain wrote:
> +linux-input@vger.kernel.org
> 
> On Mon, Feb 7, 2022 at 1:09 PM Rajat Jain <rajatja@google.com> wrote:
> >
> > +Rafael (for any inputs on asynchronous suspend / resume)
> > +Dmitry Torokhov (since no other maintainer of rmi4 in MAINTAINERS file)
> > +loic.poulain@linaro.org (who fixed RMI device hierarchy recently)
> > + Some Synaptics folks (from recent commits - Vincent Huang, Andrew
> > Duggan, Cheiny)
> >
> > On Mon, Feb 7, 2022 at 12:23 PM Wolfram Sang <wsa@kernel.org> wrote:
> > >
> > > Hello Hugh,
> > >
> > > > Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> > > > ("i2c: enable async suspend/resume on i2c client devices")
> > > > and reverting that fixes it for me.
> > >
> > > Thank you for the report plus bisection and sorry for the regression!
> >
> > +1, Thanks for the bisection, and apologies for the inconveniences.
> >
> > The problem here seems to be that for some reason, some devices (all
> > connected to rmi4 adapter) failed to resume, but only when
> > asynchronous suspend is enabled (by 172d931910e1):
> >
> > [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
> > [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
> > to read current IRQ mask.
> > [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
> > [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
> > [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
> > [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
> > [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
> >
> > A resume failure that only shows up during asynchronous resume,
> > typically means that the device is dependent on some other device to
> > resume first, but this dependency is NOT established in a parent child
> > relationship (which is wrong and needs to be fixed, perhaps using
> > device_add_link()). Thus the kernel may be resuming these devices
> > without first resuming some other device that these devices need to
> > depend on.
> >
> > TBH, I'm not sure how to fix this. The only hint I see is that all of
> > these devices seem to be attached to rmi4 device so perhaps something
> > there? I see 6e4860410b828f recently fixed device hierarchy for rmi4,
> > and so seemingly should have fixed this very issue (as also seen in
> > commit message)?
> >
> > >
> > > I will wait a few days if people come up with a fix. If not, I will
> > > revert the offending commit.
> >
> > While I'll be sad because this means no i2c-client can now resume in
> > parallel and increases resume latency by a *LOT* (hundreds of ms on
> > all Linux systems), I understand that this needs to be done unless
> > someone comes up with a fix.

There is intricate dance happening switching touchpad from legacy PS/2
into RMI mode, with touchpad being dependent not only on SMbus
controller, but also on i8042 keyboard controller and its PS/2 port (or
rather their emulation by the system firmware).

I wonder if we could apply a little bit more targeted patch:

diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
index 2407ea43de59..3901d06d38ca 100644
--- a/drivers/input/rmi4/rmi_smbus.c
+++ b/drivers/input/rmi4/rmi_smbus.c
@@ -335,6 +335,7 @@ static int rmi_smb_probe(struct i2c_client *client,
 		return error;
 	}
 
+	device_disable_async_suspend(&client->dev);
 	return 0;
 }
 

... and if that works then we cant try to establish proper dependencies
via device links later.

Hugh, could you please try this out and see if it helps?

Thanks!

-- 
Dmitry
