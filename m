Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C073767A8D
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2019 16:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbfGMOak (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jul 2019 10:30:40 -0400
Received: from stcim.de ([78.46.90.227]:49834 "EHLO stcim.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727504AbfGMOak (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Jul 2019 10:30:40 -0400
X-Greylist: delayed 926 seconds by postgrey-1.27 at vger.kernel.org; Sat, 13 Jul 2019 10:30:38 EDT
Received: from ip-109-40-128-43.web.vodafone.de ([109.40.128.43] helo=porty)
        by stcim with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <contact@stefanchrist.eu>)
        id 1hmInu-0006sh-Cn; Sat, 13 Jul 2019 16:15:10 +0200
Date:   Sat, 13 Jul 2019 16:15:09 +0200
From:   Stefan Lengfeld <contact@stefanchrist.eu>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, wsa+renesas@sang-engineering.com,
        Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [RFC PATCH 0/3] Re: i2c: core: introduce atomic transfers
Message-ID: <20190713141509.lmuej3jrxugzlz4y@porty>
References: <20190403124019.8947-1-wsa+renesas@sang-engineering.com>
 <20190415213432.8972-1-contact@stefanchrist.eu>
 <20190416105722.gfalz7uzdyrfiosc@ninjato>
 <20190421182554.mn7chr4hdaj6fevd@porty>
 <20190422072415.GB1005@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190422072415.GB1005@kunai>
X-PGP-Key: https://stefanchrist.eu/personal/Stefan_Lengfeld_0xE44A23B289092311.asc
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

I finally found some time to write my response.

On Mon, Apr 22, 2019 at 09:24:15AM +0200, Wolfram Sang wrote:
> 
> > > There is freq scaling going on when 'system_state > SYSTEM_RUNNING'? Is
> > > this a guess or confirmed?
> > 
> > Only some memories in my head that the frequency scaler caused I2C
> > adapter locking issues on a multi core device. So read it as a 'guess'.
> > But since I don't like unsolved mysteries in software engineering, I'm
> > now trying to get an i.MX6 Quad device to verify this. I have a very
> > kind donor :-)
> 
> Cool. It would indeed be very important to have that confirmed / sorted
> out. Thanks!
> 

In May Phytec has donated a second phyBOARD-Mira Board to me with a
i.MX6 Quad Soc [1]. Thanks :-) So I could test the I2C atomic transfer
patches on a SMP SoC, not only on a i.MX6 solo with a single ARM core.

> > > There is freq scaling going on when 'system_state > SYSTEM_RUNNING'? Is
> > > this a guess or confirmed?

Summary: In new kernels (since v4.0) cpufreq is not running when the
system is going down. It's disabled on reboot/shutdown.


Long version: In v3.19 or earlier kernels the frequencey scaling is
still active when the system is going down. For the kernel v4.0-rc1 the
patch 

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=90de2a4aa9f355b55e57eaf2fd584897dd0adf8c

    cpufreq: suspend cpufreq governors on shutdown

    We should stop cpufreq governors when we shut down the system.  If we
    don't do this, we can end up with this deadlock:

    1. cpufreq governor may be running on a CPU other than CPU0.
    2. In machine_restart() we call smp_send_stop() which stops CPUs.
       If one of these CPUs was actively running a cpufreq governor
       then it may have the mutex / spinlock needed to access the main
       PMIC in the system (perhaps over I2C)
    3. If a machine needs access to the main PMIC in order to shutdown
       then it will never get it since the mutex was lost when the other
       CPU stopped.
    4. We'll hang (possibly eventually hitting the hard lockup detector).

    Let's avoid the problem by stopping the cpufreq governor at shutdown,
    which is a sensible thing to do anyway.

changed that behavior. The commit message clearly describes the deadlock
behavior that I was seeing and tried to fix with my initial patchset
[2].

At that time I tried to fix the issue at a generic level in the I2C
subsystem and block the whole I2C adapter for only a single driver,
because there could be other kernel threads trying to use I2C bus.

Now I think differently. Any in-kernel user/thread that still runs at
reboot/shutdown and uses the I2C bus is a bug. They all should be fixed
like the cpufreq and orderly shutdown themselves. This should guarantee
that there is _no_ on-going I2C bus activity and the I2C adapter mutex
is not acquired.

In my current tests I didn't found another driver that is doing late I2C
communication on my boards.

So I think the new code 

    /*
     * We only allow atomic transfers for very late communication, e.g. to send
     * the powerdown command to a PMIC. Atomic transfers are a corner case and not
     * for generic use!
     */
    static inline bool i2c_in_atomic_xfer_mode(void)
    {
            return system_state > SYSTEM_RUNNING && irqs_disabled();
    }

is very sensible and the correct check.

For atomic I2C transfers you have to guarantee a free bus. For reboot
handlers we can guarantee that by shutting down any in-kernel threads.
All user processes are terminated already.

For normal interrupt contexts we don't have this guarantee. Interrupts
can fire at any time and cpufreq or other I2C usages, e.g. user
processes, can be in progress and hold the lock.

So I think the usecase I2C reboot/reset handlers is solved now. :-)


Other usescases, like oops handling, pointed out by Russel King.
See https://www.spinics.net/lists/arm-kernel/msg682695.html

> Also, how does this get around the issue which I pointed out with (eg)
> an oops occuring, which leads to a panic followed by an attempt to
> reboot if the I2C bus in question is already mid-transaction?  Won't
> we deadlock?

need some additional work and thoughts. E.g. your
ignore-the-locking-and-reset-the-IP-core idea [3].

For embedded devices the watchdog, which is integrated into the PMIC,
should reboot the board in case of an oops. So for these devices I don't
think this feature is required.


Some final words: It's very cool that the upstream kernel now supports
I2C reboot/reset handlers. Thanks for your patches and the steady
process of getting this done.

Kind regards,
Stefan

[1]: https://www.phytec.eu/product-eu/single-board-computer/phyboard-mira/
[2]: https://www.spinics.net/lists/linux-i2c/msg25401.html
[3]: https://www.spinics.net/lists/arm-kernel/msg705961.html
