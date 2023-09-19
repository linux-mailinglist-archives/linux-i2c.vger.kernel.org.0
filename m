Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3397D7A674E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 16:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbjISOvM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 10:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjISOvL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 10:51:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708A5BC;
        Tue, 19 Sep 2023 07:51:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D57C433C7;
        Tue, 19 Sep 2023 14:51:02 +0000 (UTC)
Date:   Tue, 19 Sep 2023 15:51:00 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Yann Sionneau <ysionneau@kalrayinc.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jan Bottorff <janb@os.amperecomputing.com>,
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
Message-ID: <ZQm1UyZ0g7KxRW3a@arm.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <i6h72feyrvo6pajo67b346masyxt7ycpfj46mvrfp4o7suh4ud@xuv5lu64s75m>
 <a7a85428-d40d-4adb-8f84-75e1dabe19c9@os.amperecomputing.com>
 <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 19, 2023 at 02:38:22PM +0200, Yann Sionneau wrote:
> Hi,
> 
> On 9/19/23 12:19, Wolfram Sang wrote:
> > > I also agree that a wmb() in the i2c driver is not the more elegant fix.
> > > For similar reasons, we hid barriers in the write*() macros, drivers
> > > need to stay architecture-agnostic as much as possible.
> > Exactly my thinking. I wanted to read this patch discussion later this
> > week. But from glimpsing at it so far, I already wondered why there
> > isn't a memory barrier in the final accessor to the register.
> 
> The regmap accessors used by the designware driver end up calling
> writel_relaxed() and readl_relaxed() : https://elixir.bootlin.com/linux/v6.6-rc2/source/drivers/i2c/busses/i2c-designware-common.c#L71

OK, since it ends up with the *_relaxed() accessors, there are no
barriers here. I wonder whether the regmap API should have both standard
and relaxed variants. If a regmap driver does not populate the
.reg_write_relaxed etc. members, a regmap_write_relaxed() would just
fall back to regmap_write().

We went through similar discussions many years ago around the I/O
accessors and decided to add the barriers to readl/writel() even if they
become more expensive, correctness should be first. The relaxed variants
were added as optimisations if specific memory ordering was not
required. I think the regmap API should follow the same semantics, go
for correctness first as you can't tell what the side-effect of a
regmap_write() is (e.g. kicking off DMA or causing an interrupt on
another CPU).

> In those cases I would say the smp_* barriers are what we are supposed to
> use, isn't it?

While smp_* is ok, it really depends on what the regmap_write() does. Is
it a write to a shared peripheral (if not, you may need a DSB)? Does the
regmap_write() caller know this? That's why I think having the barrier
in dw_reg_write() is better.

If you do want to stick to a fix in i2c_dw_xfer_init(), you could go for
dma_wmb(). While this is not strictly DMA, it's sharing data with
another coherent agent (a different CPU in this instance). The smp_wmb()
is more about communication via memory not involving I/O. But this still
assumes that the caller knows regmap_write() ends up with an I/O
write*() (potentially relaxed).

-- 
Catalin
