Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 360367DE9AF
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 01:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbjKBAuE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 20:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbjKBAuD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 20:50:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B52DB;
        Wed,  1 Nov 2023 17:50:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553C1C433C7;
        Thu,  2 Nov 2023 00:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698886201;
        bh=WNxpmAo8kYWZiEgjs9FzdK9Jg3rrRZyqynpcNT0yCKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i7lC8r6kenLdK8vEX/xyzyG1mvVREF+VyjOGaz3ugGgDCvE5Xzt/GxsjJ4q4H28em
         Qs2WYuvN1a0vXKcUkZJ0OUmBastJjts5MtLW1s637hB08ebCavkAfsN12QmAY/HAoF
         kaxNMHxaWhRy/4a9qT50FqGVUGeaCQdY+NuOmrpqyA4t55KGxj2gpiR9d/MW49rwsr
         1lPcXzNxOrQo322hjaG/azK0NsdDgVu8F90fKmWDFVqJxxJxRQS5VQlptlkO+yk4fV
         wYFaotRffvzG2wZQGipmIc264lFcG1G/x+oYjWwaLvs7hZGiyjzvVRQEFnM2uHsyx2
         C8JlHTLCYAsFA==
Date:   Thu, 2 Nov 2023 01:49:55 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
Message-ID: <20231102004955.cjp7vfdaqjlwhnyo@zenone.zhora.eu>
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
 <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
 <20231025121725.46028-2-m.szyprowski@samsung.com>
 <20231027133950.kntkq6ddgifaor76@zenone.zhora.eu>
 <3484d2c1-942b-4145-801f-8b8bda7dd9ec@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3484d2c1-942b-4145-801f-8b8bda7dd9ec@samsung.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 31, 2023 at 02:49:04PM +0100, Marek Szyprowski wrote:
> On 27.10.2023 15:39, Andi Shyti wrote:
> > On Wed, Oct 25, 2023 at 02:17:23PM +0200, Marek Szyprowski wrote:
> >> To properly handle read transfers in polling mode, no waiting for the ACK
> >> state is needed as it will never come. Just wait a bit to ensure start
> >> state is on the bus and continue processing next bytes.
> >>
> >> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
> >> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> >> ---
> >>   drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
> >>   1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> >> index 127eb3805fac..f9dcb1112a61 100644
> >> --- a/drivers/i2c/busses/i2c-s3c2410.c
> >> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> >> @@ -216,8 +216,13 @@ static bool is_ack(struct s3c24xx_i2c *i2c)
> >>   	int tries;
> >>   
> >>   	for (tries = 50; tries; --tries) {
> >> -		if (readl(i2c->regs + S3C2410_IICCON)
> >> -			& S3C2410_IICCON_IRQPEND) {
> >> +		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
> >> +
> >> +		if (!(tmp & S3C2410_IICCON_ACKEN)) {
> >> +			usleep_range(100, 200);
> >> +			return true;
> > What is the real issue here? Is the value of S3C2410_IICCON_ACKEN
> > enabling/disabling irq's?
> 
> It is not about the enabling/disabling interrupts, but controlling the 
> bus state. This bit is named as 'Acknowledge generation / I2C-bus 
> acknowledge enable bit' in Exynos reference manual:
> 
> In Tx mode, the I2CSDA is idle in the ACK time.
> 
> In Rx mode, the I2CSDA is low in the ACK time.
> 
> So it is a part of proper controlling the bus state, not the reported 
> interrupts, although the S3C2410_IICCON_ACKEN name is a bit misleading 
> in this case.

Yes, correct, but I still don't understand this sequence in the
message_start:

 - enable ACKEN in IICCON (enable_ack())
 - read IICCON (iiccon = readl(...))
 - write what you read in IICCON (writel(iiccon, ...))
 - if ACKEN is disabled in IICCON (from your patch)

Where is supposed ACKEN to be disabled?

> > Besides, if we use polling mode, shouldn't we disable the acks
> > already in probe (even though they are disabled by default),
> > never enable them before starting the message and avoid checking
> > here everytime?
> 
> 
> I assume that this polling mode is a special case, so there is no point 
> in optimizing it much. It is used only by the i2c core for some special 
> transfers to the PMIC during system reboot/shutdown or by the s3c24xx 
> i2c controller embedded in SoC for controlling some PHYs. Till now only 
> the second case was actually used. There were only a few single writes 
> done this way, so noone even noticed that the other types of transfers 
> (multi message or read) were broken... I found all those issues by 
> enabling polling mode unconditionally and fixing it to make all my test 
> systems working again.

Yeah, I understand your point here.

It would be nice to have a pure polling mode supported though.

Thanks,
Andi
