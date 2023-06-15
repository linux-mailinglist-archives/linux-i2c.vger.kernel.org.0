Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A14D7319CC
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 15:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343926AbjFONVQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 09:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240465AbjFONVO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 09:21:14 -0400
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0583270D;
        Thu, 15 Jun 2023 06:21:10 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
        by mail11.truemail.it (Postfix) with ESMTPA id 82320206E1;
        Thu, 15 Jun 2023 15:21:08 +0200 (CEST)
Date:   Thu, 15 Jun 2023 15:21:02 +0200
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Nishanth Menon <nm@ti.com>
Cc:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v6 1/5] kernel/reboot: emergency_restart: set correct
 system_state
Message-ID: <ZIsQPutiZWACawec@francesco-nb.int.toradex.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-1-af44a4cd82e9@skidata.com>
 <20230615000650.coyphnwdai7smww7@unblended>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615000650.coyphnwdai7smww7@unblended>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Nishanth,

On Wed, Jun 14, 2023 at 07:06:50PM -0500, Nishanth Menon wrote:
> On 21:02-20230509, Benjamin Bara wrote:
> > From: Benjamin Bara <benjamin.bara@skidata.com>
> > 
> > As the emergency restart does not call kernel_restart_prepare(), the
> > system_state stays in SYSTEM_RUNNING.
> > 
> > Since bae1d3a05a8b, this hinders i2c_in_atomic_xfer_mode() from becoming
> > active, and therefore might lead to avoidable warnings in the restart
> > handlers, e.g.:
> > 
> > [   12.667612] WARNING: CPU: 1 PID: 1 at kernel/rcu/tree_plugin.h:318 rcu_note_context_switch+0x33c/0x6b0
> > [   12.676926] Voluntary context switch within RCU read-side critical section!
> > ...
> > [   12.742376]  schedule_timeout from wait_for_completion_timeout+0x90/0x114
> > [   12.749179]  wait_for_completion_timeout from tegra_i2c_wait_completion+0x40/0x70
> > ...
> > [   12.994527]  atomic_notifier_call_chain from machine_restart+0x34/0x58
> > [   13.001050]  machine_restart from panic+0x2a8/0x32c
> > 
> > Avoid these by setting the correct system_state.
> > 
> > Fixes: bae1d3a05a8b ("i2c: core: remove use of in_atomic()")
> > Cc: stable@vger.kernel.org # v5.2+
> > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > ---
> >  kernel/reboot.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/kernel/reboot.c b/kernel/reboot.c
> > index 3bba88c7ffc6..6ebef11c8876 100644
> > --- a/kernel/reboot.c
> > +++ b/kernel/reboot.c
> > @@ -74,6 +74,7 @@ void __weak (*pm_power_off)(void);
> >  void emergency_restart(void)
> >  {
> >  	kmsg_dump(KMSG_DUMP_EMERG);
> > +	system_state = SYSTEM_RESTART;
> >  	machine_emergency_restart();
> >  }
> >  EXPORT_SYMBOL_GPL(emergency_restart);
> > 
> > -- 
> > 2.34.1
> > 
> 
> Tested-by: Nishanth Menon <nm@ti.com>
> 
> This in addition to a deeper bug in our driver seems to have helped
> resolve a report we had been looking at. Tested on beagleplay platform
> 
> https://lore.kernel.org/all/ZGeHMjlnob2GFyHF@francesco-nb.int.toradex.com/

Is this patch going to fix the RCU warning I reported on that email or
it is just part of a more complex solution?

Francesco


