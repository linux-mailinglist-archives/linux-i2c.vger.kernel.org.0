Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754AF770C6A
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 01:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjHDXag (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Aug 2023 19:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjHDXae (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Aug 2023 19:30:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C504EE3
        for <linux-i2c@vger.kernel.org>; Fri,  4 Aug 2023 16:30:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1FFB62109
        for <linux-i2c@vger.kernel.org>; Fri,  4 Aug 2023 23:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51B7C433C8;
        Fri,  4 Aug 2023 23:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691191832;
        bh=W9UNwFbWUiwuBWb8KFWd90zl5XmIjPqAPszE28jU0dM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XGCORaqUZJOP1NzuqNMxSAuYDc1ctReb11anVM+rsCo9+PXr3HBP9iJ9/VtrhQpte
         JFBIyeV1YfcqKvlwZxyolMeKX2tIhSQL/3yT4yJa29/c2R8ki4hv4uFV8yEU1zMHoY
         0P+PSyl0yDn7SU1XJKJO7wGJnB3PxONUetD8WFf76hGplp9c78R3XN15mYOlY+F171
         d6FX+Y9CiNiqMQ3vfip/z0Yy3f103yCkYnc0jayebnZfEbDgnwjTkDp1DCI9HZ4rdG
         Ggr62J4UGbeXdcVUvLUl5krLfsuhT6ZI07lbkxAm+PDoYt3i+oYNRNxtxeLv1IVPjp
         tg3OiGB7wn/VQ==
Date:   Sat, 5 Aug 2023 01:30:29 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     yangyicong@hisilicon.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, f.fangjian@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH] i2c: hisi: Only handle the interrupt of the driver's
 transfer
Message-ID: <20230804233029.xgqf6zszzbqcue5o@intel.intel>
References: <20230801124625.63587-1-yangyicong@huawei.com>
 <20230801221557.74z7lorwzq5nxqam@intel.intel>
 <517658b5-4f44-7903-bb86-074c7561e0f2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <517658b5-4f44-7903-bb86-074c7561e0f2@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yicong,

On Wed, Aug 02, 2023 at 10:39:04AM +0800, Yicong Yang wrote:
> On 2023/8/2 6:15, Andi Shyti wrote:
> > Hi Yicong,
> > 
> > On Tue, Aug 01, 2023 at 08:46:25PM +0800, Yicong Yang wrote:
> >> From: Yicong Yang <yangyicong@hisilicon.com>
> >>
> >> The controller may be shared with other port, for example the firmware.
> >> Handle the interrupt from other sources will cause crash since some
> >> data are not initialized. So only handle the interrupt of the driver's
> >> transfer and discard others.
> >>
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Is this a fix? Then, could you please add:
> > 
> > Fixes: d62fbdb99a85 ("i2c: add support for HiSilicon I2C controller")
> > Cc: <stable@vger.kernel.org> # v5.13+
> > 
> > What kind of crash is this? Is it a NULL pointer dereference?
> 
> I not quite sure this is a fix of the driver. On some use case the controller is
> shared between the firmware and the OS and we have no synchronization method
> from the hardware. A transfer started by the firmware cause the interrupt handled
> by the driver and cause a NULL pointer dereference.

So that the firmware is running on a controller and memory,
concurrently to the main CPU; which means that you are having
some kind of bus arbitration issue with two masters on the bus.

Anyway, if we are talking about avoiding a NULL pointer
dereference then this is a fix and you need to add the tags
above.

(No need to resend for this, I can do it for you if you convince
me on the part below.)

> >> ---
> >>  drivers/i2c/busses/i2c-hisi.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> >> index e067671b3ce2..8328da4bc3ec 100644
> >> --- a/drivers/i2c/busses/i2c-hisi.c
> >> +++ b/drivers/i2c/busses/i2c-hisi.c
> >> @@ -330,6 +330,14 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
> >>  	struct hisi_i2c_controller *ctlr = context;
> >>  	u32 int_stat;
> >>  
> >> +	/*
> >> +	 * Don't handle the interrupt if cltr->completion is NULL. We may
> >> +	 * reach here because the interrupt is spurious or the transfer is
> >> +	 * started by another port rather than us.
> >> +	 */
> >> +	if (!ctlr->completion)
> >> +		return IRQ_NONE;
> > 
> > Is this the place you should really check for completion being
> > NULL? By reading the code I don't exclude that completion at this
> > stage might be NULL.
> > 
> > Can it be that the real fix is this one instead:
> 
> Maybe not. If we handle the case as late as below, we'll operate the hardware
> which should be handled by the firmware which start the transfer. So we check
> it as early as possible.

But if i2c_master_xfer() is not called and we receive an irq,
most probably ctrl->completion is NULL. Right? Can this happen?

I can't really tell the sequence for enabling/disabling the
interrupt in this device. They might happen in
hisi_i2c_start_xfer() for enabling and in hisi_i2c_xfer_msg() for
desabling at the last message; which makes the scenario above a
bit difficult, indeed.

Thanks for the explanation,
Andi

> > @@ -352,7 +352,7 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
> >          * Only use TRANS_CPLT to indicate the completion. On error cases we'll
> >          * get two interrupts, INT_ERR first then TRANS_CPLT.
> >          */
> > -       if (int_stat & HISI_I2C_INT_TRANS_CPLT) {
> > +       if (ctrl->completion && (int_stat & HISI_I2C_INT_TRANS_CPLT)) {
> >                 hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
> >                 hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
> >                 complete(ctlr->completion);
> > 
> > Anyway, this whole completion management smells a bit racy to me.
> > 
> > Andi
> > 
> >>  	int_stat = readl(ctlr->iobase + HISI_I2C_INT_MSTAT);
> >>  	hisi_i2c_clear_int(ctlr, int_stat);
> >>  	if (!(int_stat & HISI_I2C_INT_ALL))
> >> -- 
> >> 2.24.0
> >>
> > .
> > 
