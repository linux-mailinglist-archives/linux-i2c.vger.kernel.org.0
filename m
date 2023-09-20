Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3027A79F3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 13:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbjITLDN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 07:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbjITLDM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 07:03:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F2A9E;
        Wed, 20 Sep 2023 04:03:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A94C433C7;
        Wed, 20 Sep 2023 11:03:03 +0000 (UTC)
Date:   Wed, 20 Sep 2023 12:03:00 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Jan Bottorff <janb@os.amperecomputing.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Wolfram Sang <wsa@kernel.org>,
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
Message-ID: <ZQrRZFLsDGJweWbx@arm.com>
References: <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 20, 2023 at 12:05:50AM +0300, Serge Semin wrote:
> On Tue, Sep 19, 2023 at 11:54:10AM -0700, Jan Bottorff wrote:
> > On 9/19/2023 7:51 AM, Catalin Marinas wrote:
> > > While smp_* is ok, it really depends on what the regmap_write() does. Is
> > > it a write to a shared peripheral (if not, you may need a DSB)? Does the
> > > regmap_write() caller know this? That's why I think having the barrier
> > > in dw_reg_write() is better.
> > > 
> > > If you do want to stick to a fix in i2c_dw_xfer_init(), you could go for
> > > dma_wmb(). While this is not strictly DMA, it's sharing data with
> > > another coherent agent (a different CPU in this instance). The smp_wmb()
> > > is more about communication via memory not involving I/O. But this still
> > > assumes that the caller knows regmap_write() ends up with an I/O
> > > write*() (potentially relaxed).
> 
> Catalin, thank you very much for your messages. The situation is much
> clearer now. I should have noted that we indeed talking about
> different memory types: Normal and Device memories. Anyway to sum it up
> AFAICS the next situation is happening:
> 1. some data is updated,
> 2. IRQ is activated by means of writel_relaxed() to the
> DW_IC_INTR_MASK register.
> 3. IRQ is raised and being handled, but the data updated in 1. looked
> as corrupted.
> 
> (Jan, correct me if I'm wrong.)
> 
> Since ARM doesn't "guarantee ordering between memory accesses to
> different devices, or usually between accesses of different memory
> types", most likely the CPU core changes 1. and 2. places
> occasionally. So in that case the IRQ handler just doesn't see the
> updated data. What needs to be done is to make sure that 2. always
> happens after 1. is completed. Outer Shareability domain write-barrier
> (DMB(oshst)) does that. Am I right? That's why it's utilized in the
> __io_bw() and __dma_wmb() macros implementation.

Yes.

> Wolfram, Jan seeing the root cause of the problem is in using the
> '_relaxed' accessors for the controller CSRs I assume that the problem
> might be more generic than just for ARMs, since based on [1] these
> accessors "do not guarantee ordering with respect to locking, _normal_
> memory accesses or delay() loops." So theoretically the problem might
> get to be met on any other arch if it implements the semantic with the
> relaxed normal and device memory accesses execution.
> 
> [1] "KERNEL I/O BARRIER EFFECTS" Documentation/memory-barriers.txt
> 
> If so we need to have give up from using the _relaxed accessors at for
> the CSRs which may cause a side effect like IRQ raising. Instead the
> normal IO write should be utilized which "wait for the completion of
> all prior writes to memory either issued by, or propagated to, the
> same thread." [1] Thus I'd suggest the next fix for the problem:
> 
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -72,7 +72,10 @@ static int dw_reg_write(void *context, unsigned int reg, unsigned int val)
>  {
>  	struct dw_i2c_dev *dev = context;
>  
> -	writel_relaxed(val, dev->base + reg);
> +	if (reg == DW_IC_INTR_MASK)
> +		writel(val, dev->base + reg);
> +	else
> +		writel_relaxed(val, dev->base + reg);
>  
>  	return 0;
>  }
> 
> (and similar changes for dw_reg_write_swab() and dw_reg_write_word().)

This should work as well.

-- 
Catalin
