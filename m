Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D657A79F8
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 13:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbjITLFW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 07:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbjITLFV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 07:05:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4801CA;
        Wed, 20 Sep 2023 04:05:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C93C433C8;
        Wed, 20 Sep 2023 11:05:11 +0000 (UTC)
Date:   Wed, 20 Sep 2023 12:05:09 +0100
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
Message-ID: <ZQrR5RBBaJn4wZB+@arm.com>
References: <xxnggfauhkfum63p5bkgxsu3m5odyjda7pnwpb5ocwf4gez7fh@4lu6qyqy6dvh>
 <37e10c3d-b5ab-75ec-3c96-76e15eb9bef8@sionneau.net>
 <v4hdblxwhl6ncdfxre5gyrve7bgdsorfqpqj53ib6q4tr7aguy@4kfr6ergb3jn>
 <9de89e14-35bd-415d-97f1-4b6db1258997@os.amperecomputing.com>
 <ZQlwC9TCSwWJpuxy@arm.com>
 <ZQl1zwVkx9n2MPvr@shikoro>
 <da400d3e-a357-1ae8-cb92-728cc4974b67@kalrayinc.com>
 <ZQm1UyZ0g7KxRW3a@arm.com>
 <cde7e2fc-2e13-4b82-98b3-3d3a52c4c185@os.amperecomputing.com>
 <ZQrNKo8fTy0Rh5su@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQrNKo8fTy0Rh5su@arm.com>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 20, 2023 at 11:44:58AM +0100, Catalin Marinas wrote:
> On Tue, Sep 19, 2023 at 11:54:10AM -0700, Jan Bottorff wrote:
> > The ARM docs do have a specific example case where the device write triggers
> > an interrupt, and that example specifically says a DSB barrier is needed.
> 
> Yeah, the Arm ARM is not very precise here on what the mailbox is,
> whether it's a local or shared peripheral and they went for the
> stronger DMB. Will added a good explanation on why a DMB is sufficient
           ^^^
	   DSB

(fixing typo in my reply)

-- 
Catalin
