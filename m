Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9690D7A5EE0
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbjISJ44 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 05:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbjISJ4r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:56:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A393F1990;
        Tue, 19 Sep 2023 02:55:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCBEC433C8;
        Tue, 19 Sep 2023 09:55:26 +0000 (UTC)
Date:   Tue, 19 Sep 2023 10:55:23 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZQlwC9TCSwWJpuxy@arm.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 18, 2023 at 08:45:42PM -0700, Jan Bottorff wrote:
> > > > > > > diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> > > > > > > index ca1035e010c7..1694ac6bb592 100644
> > > > > > > --- a/drivers/i2c/busses/i2c-designware-master.c
> > > > > > > +++ b/drivers/i2c/busses/i2c-designware-master.c
> > > > > > > @@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
> > > > > > >         /* Dummy read to avoid the register getting stuck on Bay Trail */
> > > > > > >         regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
> > > > > > > 
> > > > > > > +     /*
> > > > > > > +      * To guarantee data written by the current core is visible to
> > > > > > > +      * all cores, a write barrier is required. This needs to be
> > > > > > > +      * before an interrupt causes execution on another core.
> > > > > > > +      * For ARM processors, this needs to be a DSB barrier.
> > > > > > > +      */
> > > > > > > +     wmb();
[...]
> I did find the below text in the Arm Architectural Reference Manual (DDI
> 0487I.a) section K13.4 "Using a mailbox to send an interrupt". It was nearly
> the same wording as the ARM barrier document I previously referenced at
> https://developer.arm.com/documentation/genc007826/latest/ This too says a
> DSB barrier is required for memory updates to be observable in the ISR.
> 
> "
> K13.4 Using a mailbox to send an interrupt
>   In some message passing systems, it is common for one observer to update
> memory and then notify a second observer of the update by sending an
> interrupt, using a mailbox. Although a memory access might be made to
> initiate the sending of the mailbox interrupt, a DSB instruction is
> required to ensure the completion of previous memory accesses.
> 
> Therefore, the following sequence is required to ensure that P2 observes the
> updated value:
> 
> AArch32
> P1
>   STR R5, [R1] ; message stored to shared memory location
>   DSB ST
>   STR R0, [R4] ; R4 contains the address of a mailbox
> P2
>   ; interrupt service routine
>   LDR R5, [R1]
> 
> AArch64
> P1
>   STR W5, [X1] ; message stored to shared memory location
>   DSB ST
>   STR W0, [X4] ; R4 contains the address of a mailbox
> P2
>   ; interrupt service routine
>   LDR W5, [X1]
> "

Will convinced me in the past that a DMB is sufficient here unless the
peripheral is CPU-local. The Arm ARM is not entirely clear here.

> I hear your concern about how this barrier in platform portable code may
> impact platforms other than the one I'm trying to fix. It almost seems like
> there is some missing type of barrier macro that on ARM64 does what is
> required for cases like this and on other platforms does whatever is
> appropriate for that platform, often nothing.

I also agree that a wmb() in the i2c driver is not the more elegant fix.
For similar reasons, we hid barriers in the write*() macros, drivers
need to stay architecture-agnostic as much as possible.

Where does the regmap_write() end up? I think the barrier should be
somewhere down this path.

-- 
Catalin
