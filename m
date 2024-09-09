Return-Path: <linux-i2c+bounces-6409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F91971A70
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE745287968
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CB81BBBE8;
	Mon,  9 Sep 2024 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ed1QGc1h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34AF1BBBE3;
	Mon,  9 Sep 2024 13:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887309; cv=none; b=AjcoFdtmwtXT5eBktyJ82of4Z8+tJQTCdm0vRqyVyq2A0hh48EcK4zVQqYadpaFY1MW1cRxmqEmkfz6rhtR8qSEUUXA12P8IfsoCqSm/UGzb0cXK2QsymuKlPMKCNTQZo1h2+8XNrTqE0Y/4sinRCmz2Av/heUhqhJeIt3X1Cdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887309; c=relaxed/simple;
	bh=EgMs+TbVTeQGo2kimjC1q99O6NPUAD9k97y6im6JB8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1S8nMTzEn5I8GwyaCskMUmH7tNR8nDUsk3WwKmMNJ19wvC/yL0PTxj7R0TFNNJ9/HCNBjWPndvLCuq+XT0elwWF8Uu5QNBjIdyj0Is5xjCMAiOlxtsCKUVmbPpzcefvHCaZAYxLtkUeKAY/XQuNwryKowI8KDDpIjUFWUI7Ifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ed1QGc1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2367C4CEC7;
	Mon,  9 Sep 2024 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725887309;
	bh=EgMs+TbVTeQGo2kimjC1q99O6NPUAD9k97y6im6JB8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ed1QGc1h6aTtYmiBuwJbQJm6rxM3VY/jX6mn6ksD/QB37N+osWcz8rFoXCr2QNmEv
	 bEPOlxkaRdidGYyfp7GOvy4ZF09lSLz0YUdJ2sPpC5C6OUZHYKujipxJ7Vg0E6qkee
	 xcBA0ndIsNYugrVOIS8G9lQPVR0jjccmT5NUumA6ePS9DU3zYNSmfcC614e+vocM0a
	 IffogVlqBq5MeRFRt6BfWPPpesgTm8yARmV0Gqcf64i8nzao3pQ0EQzOT5YeIBSxDy
	 GVa3lnsl5YUe6TSOz9lWqBGpNQ9/hxAvycpRLOQMyxdsDQqMY3vX5uOebH96kEyWJr
	 5AncAhFKAxqzg==
Date: Mon, 9 Sep 2024 15:08:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <traj5uhqbny5yro3hf72k2qpga7ez7cuqv2mesvl73fku2b5xq@uw5dqjdc6mms>
References: <20240909015646.2285-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909015646.2285-1-kimriver.liu@siengine.com>

Hi Kimriver,

On Mon, Sep 09, 2024 at 09:56:46AM GMT, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>

You forgot:

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> ---
> V6->V7:
> 	1. add Subject versioning [PATCH v7]
> 	2. change fsleep(25) to usleep_range(25, 250)
> 	3. Add macro definition DW_iC_ENABLE_ENABLE to fix compile errors
> 	4. base: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=master

Thanks a lot for following up! :-)

> V5->V6: restore i2c_dw_is_master_idling() function checking
> V4->V5: delete master idling checking
> V3->V4:
> 	1. update commit messages and add patch version and changelog
> 	2. move print the error message in i2c_dw_xfer
> V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
> V1->V2: used standard words in function names and addressed review comments
> 
> link to V1:
> https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/
> ---

...

> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -453,6 +453,18 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  
>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>  	if (abort_needed) {
> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> +			enable |= DW_IC_ENABLE_ENABLE;
> +			/*
> +			 * Need two ic_clk delay when enabling the I2C to ensure ENABLE bit
> +			 * is already set. Wait 10 times the signaling period of the highest
> +			 * I2C transfer supported by the driver(for 400KHz this is 25us)
> +			 * as described in the DesignWare I2C databook.
> +			 */
> +			usleep_range(25, 250);

I think there is a misunderstanding here. Andy asked you to use
flseep and improve the calculation: "Please, calculate this delay
based on the actual speed in use (or about to be in use)."[*]

Andy can you please clarify with Kimriver here?

Thanks,
Andi

[*] Message-ID: <6392ecd3f9934e9d8641b5f608ee6d60@siengine.com>

