Return-Path: <linux-i2c+bounces-6627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E688E976EDC
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90C9285389
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 16:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3B51AF4D3;
	Thu, 12 Sep 2024 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGdZb7tt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF23187340;
	Thu, 12 Sep 2024 16:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726158985; cv=none; b=FoWvrGzPrjQ3lUkZMoGm53FLTw0UdbJoGVg2k+GutjZObSwnFXkvbyxmx3OaWQOA1ttE9v6Fh6aLgk0PztS/AeOM4AP34B5h7HbM0nvSp36jNItmjQvlD3Gu6tpwfDlsUSfeFOFhuwBNDNtKrKTDOoRi20zBTQrFOUs7va0cU1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726158985; c=relaxed/simple;
	bh=5YsN9KvVZm5f0UHgFkyHZ3wBKgWIeKr3oPHz1mRnP8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cpghAUQ2ejCCGelE8dpM+JuWkg6Fj4H0dyiQfr+2NLqoqzTl4Grqio1Jmb0JP0+1pKk5FMn7E2uYjezumnoQs78Ak1O7fDnUvulmh0IHY7YJRQc7qFrgf9NdvtN+M3H5HDZDUG85+wKd5ApLnSp26oqehCB13le+zcHIFt//8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGdZb7tt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7F4C4CEC3;
	Thu, 12 Sep 2024 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726158984;
	bh=5YsN9KvVZm5f0UHgFkyHZ3wBKgWIeKr3oPHz1mRnP8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DGdZb7ttrJGYS3zUhQ9GzFUpOrNCETt1m70nyFK+q9jwcdAttdpNfZzxZeFTlul8c
	 /jxueAgAT1VI4kHRZekIb5SOpdRUK96Jo2HI4caXtVjCJ/ikyUR9ibcRNJscbzsxSl
	 upRQ+y2Q0QlzWN6ggB70d6LiWBdMrQOhwFFnKYYYK3GTQUDovQO30Wwhkxwa39S3zk
	 PuWe6eN642wCyeLeGf7OXeJAO5u7kmdinA+Sr9khWb5UCa+3r24uMKaTC7ChQ+HjbV
	 GT24CiSCS8856EwjRbrKhNwpnT+w1CDYrQkVCK2DUaf44FamFrWWOiVOM5xwj6e/ac
	 E14gJv6OQG0SQ==
Date: Thu, 12 Sep 2024 18:36:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kimriver Liu <kimriver.liu@siengine.com>, 
	jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Message-ID: <fpa7ufcpazewftgeoj72t3m7jumddvt23dzmqpr4znqx663yl7@4vckpbls2iyy>
References: <cd5f6b0a57adf6fdff7bf3c24cb319bf778d61d6.1726121009.git.kimriver.liu@siengine.com>
 <ZuMJoHWLU1FIznZR@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuMJoHWLU1FIznZR@surfacebook.localdomain>

On Thu, Sep 12, 2024 at 06:32:48PM GMT, Andy Shevchenko wrote:
> Thu, Sep 12, 2024 at 02:11:12PM +0800, Kimriver Liu kirjoitti:
> > It was observed that issuing ABORT bit (IC_ENABLE[1]) will not
> > work when IC_ENABLE is already disabled.
> > 
> > Check if ENABLE bit (IC_ENABLE[0]) is disabled when the controller
> > is holding SCL low. If ENABLE bit is disabled, the software need

/need/needs/

> > to enable it before trying to issue ABORT bit. otherwise,

/ABORT/the ABORT/

> > the controller ignores any write to ABORT bit.
> > 
> > These kernel logs show up whenever an I2C transaction is
> > attempted after this failure.
> > i2c_designware e95e0000.i2c: timeout waiting for bus ready
> > i2c_designware e95e0000.i2c: timeout in disabling adapter
> 
> > The patch can be fix the controller cannot be disabled while
> > SCL is held low in ENABLE bit is already disabled.
> 
> There are English words but a complete nonsense together.

We could reword this to:

The patch fixes the issue where the controller cannot be disabled
while SCL is held low if the ENABLE bit is already disabled.

>   Fix the condition when controller cannot be disabled while SCL

/when/where/

>   is held low and ENABLE bit is already disabled.

/ENABLE/the ENABLE/

If you agree with the changes, I can apply them before merging.

> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thanks a lot, Andy! I really appreciate your reviews!

> ...
> 
> > +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> > +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> > +			/*
> > +			 * Wait 10 times the signaling period of the highest I2C
> > +			 * transfer supported by the driver (for 400KHz this is
> > +			 * 25us) to ensure the I2C ENABLE bit is already set
> > +			 * as described in the DesignWare I2C databook.
> > +			 */
> > +			fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz));
> 
> > +			/* Keep ENABLE bit is already set before Setting ABORT.*/
> 
> 			/* Set ENABLE bit before setting ABORT */
> 
> 
> > +			enable |= DW_IC_ENABLE_ENABLE;
> > +		}
> 
> ...
> 
> > +/*
> > + * This functions waits controller idling before disabling I2C
> 
> s/functions/function/

I can fix it before merging.

> > + * When the controller is not in the IDLE state,
> > + * MST_ACTIVITY bit (IC_STATUS[5]) is set.
> > + * Values:
> > + * 0x1 (ACTIVE): Controller not idle
> > + * 0x0 (IDLE): Controller is idle
> > + * The function is called after returning the end of the current transfer
> > + * Returns:
> > + * False when controller is in IDLE state.
> > + * True when controller is in ACTIVE state.
> > + */
> > +static bool i2c_dw_is_controller_active(struct dw_i2c_dev *dev)
> > +{
> > +	u32 status;
> > +
> > +	regmap_read(dev->map, DW_IC_STATUS, &status);
> > +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> > +		return false;
> > +
> > +	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> > +				       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
> > +					1100, 20000) != 0;
> 
> 	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> 					!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> 					1100, 20000) != 0;
> 
> (in the second line replaced 7 spaces by a single TAB to fix the indentation)

I can fix it before merging.

Kimriver, if you agree, i can merge this and queue it for the
next week's fixes merge request.

Andi

> > +}
> 
> ...
> 
> > +	/*
> > +	 * This happens rarely (~1:500) and is hard to reproduce. Debug trace
> > +	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> > +	 * if disable IC_ENABLE.ENABLE immediately that can result in
> > +	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low. Check if
> > +	 * controller is still ACTIVE before disabling I2C.
> > +	 */
> > +	if (i2c_dw_is_controller_active(dev))
> > +		dev_err(dev->dev, "controller active\n");
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

