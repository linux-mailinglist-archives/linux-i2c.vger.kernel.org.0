Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD364793227
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 00:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbjIEWxq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 18:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbjIEWxq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 18:53:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D51109;
        Tue,  5 Sep 2023 15:53:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B512EC433C8;
        Tue,  5 Sep 2023 22:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693954422;
        bh=miuDGTaJZrddpauNP0hGkxomeqgCzyoCrEificvmnr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=brMpdWs72DTusXM27W9jzz0n/0x1koCiMVqB0h69WdyCqkgmUL3NzMnZ1ow0W/kPP
         HvC0c9+tEmc32e3bD5S5jlL0/h+AWirwecxPyEZLtXivuDjwp2OP8TigTV91qWitVM
         gfM11YtlkX530YPgjIrFQapP/xOnqfqWaPTr45USqexbGwhzUpvwUZgI4KT8wYycmK
         qgj2wXju4frSUPWCgfGDIA8op4s8QjYza3Pqv5ftQBixGYSiCZtrs3pnQFlAIxdoGC
         lZCIeo4Rso2rKZN2b1xL1g2aYN6sVhYMyQUDG/M088G0MgpfoDOQ/26heS7Pe2g/MP
         Lx9/90xcfYVnA==
Date:   Wed, 6 Sep 2023 00:53:38 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jonas Gorski <jonas.gorski@bisdn.de>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>,
        Kevin Cernekee <cernekee@chromium.org>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: iproc: reset bus after timeout if START_BUSY is
 stuck
Message-ID: <20230905225338.g76dqf3a26dnnzxx@zenone.zhora.eu>
References: <20230904090005.52622-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230904090005.52622-1-jonas.gorski@bisdn.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jonas,

On Mon, Sep 04, 2023 at 11:00:04AM +0200, Jonas Gorski wrote:
> If a transaction times out, the START_BUSY signal may have gotten stuck,
> and subsequent transactaction attempts will fail as the bus is still
> considered busy.
> 
> To work around this, check if the START_BUSY bit is still asserted, and
> reset the controller in case it is.
> 
> This is also done by the alternative, non-upstream iproc-smbus driver
> implementation [1].
> 
> Works around situations like:
> 
>     bcm-iproc-2c 1803b000.i2c: transaction timed out
>     bcm-iproc-2c 1803b000.i2c: bus is busy
>     bcm-iproc-2c 1803b000.i2c: bus is busy
>     bcm-iproc-2c 1803b000.i2c: bus is busy
>     bcm-iproc-2c 1803b000.i2c: bus is busy
>     bcm-iproc-2c 1803b000.i2c: bus is busy
>     ...
> 
> where the bus never recovers after a timeout.
> 
> [1] https://github.com/opencomputeproject/onie/blob/master/patches/kernel/3.2.69/driver-iproc-smbus.patch
> 
> Fixes: e6e5dd3566e0 ("i2c: iproc: Add Broadcom iProc I2C Driver")
> Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>

I think the right Fixes tag should be:

Fixes: 3f98ad45e585 ("i2c: iproc: add polling support")
Cc: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc: <stable@vger.kernel.org> # v5.2+

> ---
> The iproc-smbus driver does some additional checks/mitigations, but
> since my I2C understanding is only very rudimentary, I didn't add them,
> also the reset was enough to fix the issue I was seeing.
> 
> I was a bit conflicted about the Fixes tag, but since it fixes/work
> around misbehaviour seen I decided to add one.
> 
> The issue was happening only in production, and only once per boot (so
> far), but with 100% probability within a few hours.
> 
>  drivers/i2c/busses/i2c-bcm-iproc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 05c80680dff4..69f9c199fa3b 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -796,6 +796,15 @@ static int bcm_iproc_i2c_xfer_wait(struct bcm_iproc_i2c_dev *iproc_i2c,
>  	if (!time_left && !iproc_i2c->xfer_is_done) {
>  		dev_err(iproc_i2c->device, "transaction timed out\n");
>  
> +		/* check if START_BUSY did not clear */

as Ray asked, can you please expand this comment?

Thanks,
Andi

> +		if (!!(iproc_i2c_rd_reg(iproc_i2c, M_CMD_OFFSET) &
> +		       BIT(M_CMD_START_BUSY_SHIFT))) {
> +			/* re-initialize i2c for recovery */
> +			bcm_iproc_i2c_enable_disable(iproc_i2c, false);
> +			bcm_iproc_i2c_init(iproc_i2c);
> +			bcm_iproc_i2c_enable_disable(iproc_i2c, true);
> +		}
> +
>  		/* flush both TX/RX FIFOs */
>  		val = BIT(M_FIFO_RX_FLUSH_SHIFT) | BIT(M_FIFO_TX_FLUSH_SHIFT);
>  		iproc_i2c_wr_reg(iproc_i2c, M_FIFO_CTRL_OFFSET, val);
> -- 
> 2.42.0
> 
> 
> -- 
> BISDN GmbH
> Körnerstraße 7-10
> 10785 Berlin
> Germany
> 
> 
> Phone: 
> +49-30-6108-1-6100
> 
> 
> Managing Directors: 
> Dr.-Ing. Hagen Woesner, Andreas 
> Köpsel
> 
> 
> Commercial register: 
> Amtsgericht Berlin-Charlottenburg HRB 141569 
> B
> VAT ID No: DE283257294
> 
