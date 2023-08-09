Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC72177697E
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Aug 2023 22:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbjHIUI4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Aug 2023 16:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjHIUI4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Aug 2023 16:08:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9051810C4
        for <linux-i2c@vger.kernel.org>; Wed,  9 Aug 2023 13:08:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 23F9A647ED
        for <linux-i2c@vger.kernel.org>; Wed,  9 Aug 2023 20:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09614C433C8;
        Wed,  9 Aug 2023 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691611734;
        bh=eWGALpcFoiETNjUZ1ufqLwIj9hZlGFzkvrdtyGoOO9U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nEB6PpoSR5BzDUKjxYbLkqDvBHT+SmvKkTrOtacDHogrc24sDrXOa4GAzVDf5Lqrj
         Yjyg9/pMCZOReFitEV+pD2ONeTrmwIgnvkK6BpmUrYzAogbJhLSrgaGRYHBmfMD/TR
         6cOm8sgNlPAGWNU8E3DskteYxEvWm8oKUA9X4WNr3e4icjvjn2xZJSsoZCW5AzwHmk
         EeRTdCPLd9LEQiCbyHaO9XZJpSg6OejULMSH+LnyEqEloK4mUL8AIGdb6XpvpSZI1m
         B5A47Zedtw/mp2Nr4a9T7a+UyLzLCgol5WOWoK3p7Hvdtw7DQ7MY6Y+qVQ4jEe26w+
         V4O2GFBFCOJ1A==
Date:   Wed, 9 Aug 2023 22:08:51 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yicong Yang <yangyicong@huawei.com>
Cc:     yangyicong@hisilicon.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, f.fangjian@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH] i2c: hisi: Only handle the interrupt of the driver's
 transfer
Message-ID: <20230809200851.kwvjvc6cea7qgwgm@intel.intel>
References: <20230801124625.63587-1-yangyicong@huawei.com>
 <20230801221557.74z7lorwzq5nxqam@intel.intel>
 <517658b5-4f44-7903-bb86-074c7561e0f2@huawei.com>
 <20230804233029.xgqf6zszzbqcue5o@intel.intel>
 <d50d5d19-4f5f-8c5b-2505-1195fa314976@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d50d5d19-4f5f-8c5b-2505-1195fa314976@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yicong,

[...]

> >>>> @@ -330,6 +330,14 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
> >>>>  	struct hisi_i2c_controller *ctlr = context;
> >>>>  	u32 int_stat;
> >>>>  
> >>>> +	/*
> >>>> +	 * Don't handle the interrupt if cltr->completion is NULL. We may
> >>>> +	 * reach here because the interrupt is spurious or the transfer is
> >>>> +	 * started by another port rather than us.
> >>>> +	 */
> >>>> +	if (!ctlr->completion)
> >>>> +		return IRQ_NONE;
> >>>
> >>> Is this the place you should really check for completion being
> >>> NULL? By reading the code I don't exclude that completion at this
> >>> stage might be NULL.
> >>>
> >>> Can it be that the real fix is this one instead:
> >>
> >> Maybe not. If we handle the case as late as below, we'll operate the hardware
> >> which should be handled by the firmware which start the transfer. So we check
> >> it as early as possible.
> > 
> > But if i2c_master_xfer() is not called and we receive an irq,
> > most probably ctrl->completion is NULL. Right? Can this happen?
> > 
> 
> Yes, this is the case.
> 
> > I can't really tell the sequence for enabling/disabling the
> > interrupt in this device. They might happen in
> > hisi_i2c_start_xfer() for enabling and in hisi_i2c_xfer_msg() for
> > desabling at the last message; which makes the scenario above a
> > bit difficult, indeed.
> > 
> 
> The driver will keep the interrupt disabled if no transfer in progress.
> But since the transfer is driven by the interrupt so if the firmware
> start the transfer it will enable the interrupt. In such case the driver
> will receive an interrupt on the Tx FIFO empty, etc and since the
> transfer is not started by the driver ctlr->completion is not
> initialized.

OK... makes sense...

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks!
Andi
