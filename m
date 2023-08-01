Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A749C76C045
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 00:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbjHAWQC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 18:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjHAWQC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 18:16:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89289132
        for <linux-i2c@vger.kernel.org>; Tue,  1 Aug 2023 15:16:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 237F36175D
        for <linux-i2c@vger.kernel.org>; Tue,  1 Aug 2023 22:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD75C433C8;
        Tue,  1 Aug 2023 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690928160;
        bh=spe1tIcORmsF3gAxGkgqJG3ZdTjFpyQLHWqOcvH/ClU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q85+w2UfuuzU6C6y1UJvmXDg5VTPYzXYLmNTwe9vgzQHao7hGb8XXPJs6JSGoNl8i
         Dw8YNbU53cLgYEqLKidZfBrnqRMmv2AuOkOo88VrTbRwtbgI6MzmdIa/i8AJON1FhJ
         PYqBnYQ/pfBQwBn6AUZqGh14KHM2W0HEGnJtbGp523e//azj7jRcnwOiytXEtv3tNg
         UaCAv/i6gG6AsSbMtgp2eikrCqANyFjig8AniZmuOM2ii1FAzfY+S1mfC9YJNv/tuq
         n/C6vOWKJukzlOFWGtnjDArxIXhGdkkoj/kcIsJRKQPR4w+yT1yqhNmnw5kW2cnwQ1
         Aq3v0RlYnVyqA==
Date:   Wed, 2 Aug 2023 00:15:57 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        yangyicong@hisilicon.com, f.fangjian@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH] i2c: hisi: Only handle the interrupt of the driver's
 transfer
Message-ID: <20230801221557.74z7lorwzq5nxqam@intel.intel>
References: <20230801124625.63587-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801124625.63587-1-yangyicong@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yicong,

On Tue, Aug 01, 2023 at 08:46:25PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The controller may be shared with other port, for example the firmware.
> Handle the interrupt from other sources will cause crash since some
> data are not initialized. So only handle the interrupt of the driver's
> transfer and discard others.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Is this a fix? Then, could you please add:

Fixes: d62fbdb99a85 ("i2c: add support for HiSilicon I2C controller")
Cc: <stable@vger.kernel.org> # v5.13+

What kind of crash is this? Is it a NULL pointer dereference?

> ---
>  drivers/i2c/busses/i2c-hisi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index e067671b3ce2..8328da4bc3ec 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -330,6 +330,14 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
>  	struct hisi_i2c_controller *ctlr = context;
>  	u32 int_stat;
>  
> +	/*
> +	 * Don't handle the interrupt if cltr->completion is NULL. We may
> +	 * reach here because the interrupt is spurious or the transfer is
> +	 * started by another port rather than us.
> +	 */
> +	if (!ctlr->completion)
> +		return IRQ_NONE;

Is this the place you should really check for completion being
NULL? By reading the code I don't exclude that completion at this
stage might be NULL.

Can it be that the real fix is this one instead:

@@ -352,7 +352,7 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
         * Only use TRANS_CPLT to indicate the completion. On error cases we'll
         * get two interrupts, INT_ERR first then TRANS_CPLT.
         */
-       if (int_stat & HISI_I2C_INT_TRANS_CPLT) {
+       if (ctrl->completion && (int_stat & HISI_I2C_INT_TRANS_CPLT)) {
                hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
                hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
                complete(ctlr->completion);

Anyway, this whole completion management smells a bit racy to me.

Andi

>  	int_stat = readl(ctlr->iobase + HISI_I2C_INT_MSTAT);
>  	hisi_i2c_clear_int(ctlr, int_stat);
>  	if (!(int_stat & HISI_I2C_INT_ALL))
> -- 
> 2.24.0
> 
