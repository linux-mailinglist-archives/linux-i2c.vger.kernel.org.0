Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171E67A7990
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 12:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbjITKps (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 06:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbjITKpY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 06:45:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDE0197;
        Wed, 20 Sep 2023 03:45:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3628BC433CB;
        Wed, 20 Sep 2023 10:45:01 +0000 (UTC)
Date:   Wed, 20 Sep 2023 11:44:58 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Yann Sionneau <ysionneau@kalrayinc.com>,
        Wolfram Sang <wsa@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZQrNKo8fTy0Rh5su@arm.com>
References: <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 19, 2023 at 11:54:10AM -0700, Jan Bottorff wrote:
> On 9/19/2023 7:51 AM, Catalin Marinas wrote:
> > While smp_* is ok, it really depends on what the regmap_write() does. Is
> > it a write to a shared peripheral (if not, you may need a DSB)? Does the
> > regmap_write() caller know this? That's why I think having the barrier
> > in dw_reg_write() is better.
> > 
> > If you do want to stick to a fix in i2c_dw_xfer_init(), you could go for
> > dma_wmb(). While this is not strictly DMA, it's sharing data with
> > another coherent agent (a different CPU in this instance). The smp_wmb()
> > is more about communication via memory not involving I/O. But this still
> > assumes that the caller knows regmap_write() ends up with an I/O
> > write*() (potentially relaxed).
> 
> If we wanted maximum correctness wouldn't we need something like
> writel_triggers_interrupt/regmap_write_triggers_interrupt or maybe
> preinterrupt_wmb?

Well, if you want to have an API for all things that can be triggered
(interrupts, device DMA), you can try but I think it would make things
more confusing and driver writers won't bother (if, say, they only test
on x86 and never see a problem). The other way around - barriers by
default and only relax if you see a performance issue - seems more
sensible. But I don't maintain these drivers, so it's up to you guys.

> The ARM docs do have a specific example case where the device write triggers
> an interrupt, and that example specifically says a DSB barrier is needed.

Yeah, the Arm ARM is not very precise here on what the mailbox is,
whether it's a local or shared peripheral and they went for the
stronger DMB. Will added a good explanation on why a DMB is sufficient
in commit 22ec71615d82 ("arm64: io: Relax implicit barriers in default
I/O accessors"). It talks about DMA but it applies equally to another
CPU accessing the memory. It's pretty subtle though.

> If I look at the ARM GIC IPI send function gic_ipi_send_mask in
> https://elixir.bootlin.com/linux/v6.6-rc2/source/drivers/irqchip/irq-gic-v3.c#L1354
> is says:
> 
>         /*
> 	 * Ensure that stores to Normal memory are visible to the
> 	 * other CPUs before issuing the IPI.
> 	 */
> 	dsb(ishst);
> 
> I would think the IPI send code is very carefully tuned for performance, and
> would not use a barrier any stronger than required.

That's why I mentioned in my previous reply that it really depends on
what the regmap_write() does, where the I/O go shared peripheral or some
local CPU interface). In the GIC example above, there's not even an I/O
access but a system register write (MSR, see gic_write_sgi1r()), hence
the DSB. If you look at gic_ipi_send_mask() in irq-gic.c (GICv2), there
is a dmb(ishst) since the interrupt is sent with an I/O write to the GIC
distributor (shared peripheral).

> I believe dma_wmb maps to DMB on ARM64.

Yes, it does.

-- 
Catalin
