Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895002CF5A6
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Dec 2020 21:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbgLDU1T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Dec 2020 15:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgLDU1T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Dec 2020 15:27:19 -0500
X-Greylist: delayed 420 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Dec 2020 12:26:39 PST
Received: from vulcan.natalenko.name (vulcan.natalenko.name [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5C8C0613D1
        for <linux-i2c@vger.kernel.org>; Fri,  4 Dec 2020 12:26:39 -0800 (PST)
Received: from localhost (home.natalenko.name [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 83A348C4585;
        Fri,  4 Dec 2020 21:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1607113170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5i7pvUEzEqeo1L0MFc38H7RyxsyPdYm+kQhMqhBD5tg=;
        b=xMKD1dwT5YMN0h/MSKwJAr08RqEdE2fq5AigQlR5D+Mw9e81XxR4QHqTdyRZ5SCL4629iz
        Ocw5XD94zHXsGsQerTv7FqinaVVyfC/ogExYJahdqf9aFpWhdcNkyAGvD4hbA8uoIlrfHD
        rIjnCFcfaTXOF7epgBldEm6JQ//calI=
Date:   Fri, 4 Dec 2020 21:19:30 +0100
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     jdelvare@suse.de, wsa@kernel.org, benjamin.tissoires@redhat.com,
        rui.zhang@intel.com, tglx@linutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Bug 202453] TRACE irq/18-i801_smb Tainted when enabled
 threadirqs in kernel commandline.
Message-ID: <20201204201930.vtvitsq6xcftjj3o@spock.localdomain>
References: <bug-202453-19117@https.bugzilla.kernel.org/>
 <bug-202453-19117-0k1QQBMPTi@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-202453-19117-0k1QQBMPTi@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 03, 2020 at 07:04:00PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=202453
> 
> --- Comment #7 from Thomas Gleixner (tglx@linutronix.de) ---
> On Tue, Aug 06 2019 at 14:07, bugzilla-daemon wrote:
> > Jean Delvare (jdelvare@suse.de) changed:
> >
> > Is this happening with vanilla kernels or gentoo kernels?
> >
> > Thomas, I'm not sure if this is a bug in the i2c-i801 driver or something
> > more
> > general in how we handle the interrupts under threadirqs. Any suggestion how
> > to
> > investigate this further?
> 
> Bah. What happens is that the i2c-i801 driver interrupt handler does:
> 
> i801_isr()
> 
>       ...
>         return i801_host_notify_isr(priv);
> 
> which invokes:
> 
>       i2c_handle_smbus_host_notify()
> 
> which in turn invokes
> 
>       generic_handle_irq()
> 
> and that explodes with forced interrupt threading because it's called
> with interrupts enabled.
> 
> The root of all evil is the usage of generic_handle_irq() under the
> assumption that this is always called from hard interrupt context. That
> assumption is not true since 8d32a307e4fa ("genirq: Provide forced
> interrupt threading") which went into 2.6.39 almost 10 years ago.
> 
> Seems you got lucky that since 10 years someone no user of this uses a
> threaded interrupt handler, like some of the i2c drivers actually do. :)
> 
> So there are a couple of options to fix this:
> 
>    1) Set the IRQF_NO_THREAD flag and replace the waitqueue as that
>       won't work on RT.
> 
>       Looking at the usage it's a single waiter wakeup and a single
>       waiter at a time because the xfer is fully serialized by the
>       core. So we can switch it to rcuwait, if there would be
>       rcu_wait_event_timeout(), but that's fixable.
> 
>    2) Have a wrapper around handle_generic_irq() which ensures that
>       interrupts are disabled before invoking it.
> 
>    3) Make the interrupt which is dispatched there to be requested with
>       [devm_]request_any_context_irq(). That also requires that the
>       NESTED_THREAD flag is set on the irq descriptor.
> 
>       That's exactly made for the use case where the dispatching
>       interrupt can be either threaded or in hard interrupt context.
> 
>       But that's lots of churn.
> 
> And because we have so many options, here is the question:
> 
>    Is i2c_handle_smbus_host_notify() guaranteed to be called from hard
>    interrupt handlers (assumed that we use #1 above)?
> 
>    I can't tell because there is also i2c_slave_host_notify_cb() which
>    invokes it and my i2c foo is not good enough to figure that out.
> 
> If that's the case the #1 would be the straight forward solution. If
> not, then you want #2 because then the problem will just pop up via the
> slave thing and that might be not as trivial to fix as this one.
> 
> If you can answer that, I can send you the proper patch :)

tglx suggested moving this to the appropriate mailing lists, so I'mm
Cc'ing those.

Jean, Wolfram, Benjamin, or someone else, could you please check Thomas'
questions above and let us know what you think?

I'll copy-paste my attempt to answer this in bugzilla below:

```
As far as I can grep through bus drivers, yes, it is called from hard
interrupt handlers only.

i2c_handle_smbus_host_notify() is indeed called from
i2c_slave_host_notify_cb(), which, in its turn, is set to be called as
->slave_cb() via i2c_slave_event() wrapper only.

Also, check [1], slide #9. I'm not sure about that "usually" word
though since I couldn't find any examples of "unusual" usage.

/* not an i2c guru here either, just looking around the code */

[1] https://elinux.org/images/f/f6/ELCE15-WolframSang-ShinyNewI2CSlaveFramework.pdf
```

and also tglx' follow-up question:

```
The question is whether it's guaranteed under all circumstances
including forced irq threading. The i801 driver has assumptions about
this, so I wouldn't be surprised if there are more.
```

Thanks.

-- 
  Oleksandr Natalenko (post-factum)
