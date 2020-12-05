Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABFA2CFDB5
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 19:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgLESnH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 13:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbgLEQ4O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Dec 2020 11:56:14 -0500
Received: from vulcan.natalenko.name (vulcan.natalenko.name [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF674C02A181;
        Sat,  5 Dec 2020 08:30:12 -0800 (PST)
Received: from localhost (home.natalenko.name [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 143D98C5EF8;
        Sat,  5 Dec 2020 17:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1607185444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GK1PlK9w+nRMGOMB2nAyoVtDY3FO7kDEwHLHCW8nhA4=;
        b=iQeJiu7i/J2REiY0NP5gViG9pXMAflZwOOLWauV7OcFN7IsZqGt3kPudD6ohc6vbbp3fp0
        CCbiBkbXBrnOGVg21+GRS1wTFXbzMdo0TvcUZP0y6SBD81klOVGRbFhQvleWZ6noko+1VY
        gejBdQqT9nF2LhSTprt93n5ZlWy6d3U=
Date:   Sat, 5 Dec 2020 17:24:03 +0100
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     bugzilla-daemon@bugzilla.kernel.org, jdelvare@suse.de,
        wsa@kernel.org, benjamin.tissoires@redhat.com, rui.zhang@intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Carlos Jimenez <javashin1986@gmail.com>
Subject: Re: [Bug 202453] TRACE irq/18-i801_smb Tainted when enabled
 threadirqs in kernel commandline.
Message-ID: <20201205162403.sey33v2js2cs65q4@spock.localdomain>
References: <bug-202453-19117@https.bugzilla.kernel.org/>
 <bug-202453-19117-0k1QQBMPTi@https.bugzilla.kernel.org/>
 <20201204201930.vtvitsq6xcftjj3o@spock.localdomain>
 <87zh2s8buh.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zh2s8buh.fsf@nanos.tec.linutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Dec 05, 2020 at 05:19:18PM +0100, Thomas Gleixner wrote:
> On Fri, Dec 04 2020 at 21:19, Oleksandr Natalenko wrote:
> > On Thu, Dec 03, 2020 at 07:04:00PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> >>    2) Have a wrapper around handle_generic_irq() which ensures that
> >>       interrupts are disabled before invoking it.
> 
> > The question is whether it's guaranteed under all circumstances
> > including forced irq threading. The i801 driver has assumptions about
> > this, so I wouldn't be surprised if there are more.
> 
> Assuming that a final answer might take some time, the below which
> implements #2 will make it at least work for now.
> 
> Thanks,
> 
>         tglx
> ---
> Subject: genirq, i2c: Provide and use generic_dispatch_irq()
> From: Thomas Gleixner <tglx@linutronix.de>
> Date: Thu, 03 Dec 2020 19:12:24 +0100
> 
> Carlos reported that on his system booting with 'threadirqs' on the command
> line result in the following warning:
> 
> irq 31 handler irq_default_primary_handler+0x0/0x10 enabled interrupts
> WARNING: CPU: 2 PID: 989 at kernel/irq/handle.c:153 __handle_irq_event_percpu+0x19f/0x1b0
> 
> The reason is in the i2c stack:
> 
>     i801_isr()
>       i801_host_notify_isr()
>         i2c_handle_smbus_host_notify()
>           generic_handle_irq()
> 
> and that explodes with forced interrupt threading because it's called with
> interrupts enabled.
> 
> It would be possible to set IRQF_NO_THREAD on the i801 interrupt to exclude
> it from force threading, but that would break on RT and require a larger
> update.
> 
> It's also unclear whether there are other drivers which can reach that code
> path via i2c_slave_host_notify_cb(). As there are enough i2c drivers which
> use threaded interrupt handlers by default it seems not completely
> impossible that this can happen even without force threaded interrupts.
> 
> For a quick fix provide a wrapper around generic_handle_irq() which has a
> local_irq_save/restore() around the invocation and use it in the i2c code.
> 
> Reported-by: Carlos Jimenez <javashin1986@gmail.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=202453
> ---
>  drivers/i2c/i2c-core-base.c |    2 +-
>  include/linux/irqdesc.h     |    1 +
>  kernel/irq/irqdesc.c        |   20 ++++++++++++++++++++
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1385,7 +1385,7 @@ int i2c_handle_smbus_host_notify(struct
>  	if (irq <= 0)
>  		return -ENXIO;
>  
> -	generic_handle_irq(irq);
> +	generic_dispatch_irq(irq);
>  
>  	return 0;
>  }
> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -153,6 +153,7 @@ static inline void generic_handle_irq_de
>  }
>  
>  int generic_handle_irq(unsigned int irq);
> +int generic_dispatch_irq(unsigned int irq);
>  
>  #ifdef CONFIG_HANDLE_DOMAIN_IRQ
>  /*
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -652,6 +652,26 @@ int generic_handle_irq(unsigned int irq)
>  }
>  EXPORT_SYMBOL_GPL(generic_handle_irq);
>  
> +/**
> + * generic_dispatch_irq - Dispatch an interrupt from an interrupt handler
> + * @irq:	The irq number to handle
> + *
> + * A wrapper around generic_handle_irq() which ensures that interrupts are
> + * disabled when the primary handler of the dispatched irq is invoked.
> + * This is useful for interrupt handlers with dispatching to be safe for
> + * the forced threaded case.
> + */
> +int generic_dispatch_irq(unsigned int irq)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	local_irq_save(&flags);
> +	ret = generic_handle_irq(irq);
> +	local_irq_restore(&flags);

FWIW, for me &flags explodes build on v5.10-rc6. I had to change it to local_irq_save/restore(flags) (without taking an address via &).

> +	return ret;
> +}
> +
>  #ifdef CONFIG_HANDLE_DOMAIN_IRQ
>  /**
>   * __handle_domain_irq - Invoke the handler for a HW irq belonging to a domain

-- 
  Oleksandr Natalenko (post-factum)
