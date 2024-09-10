Return-Path: <linux-i2c+bounces-6480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18AA97386B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E67AC1C2477F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3446B18FDDF;
	Tue, 10 Sep 2024 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQkDqtXB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E386D18CC1A;
	Tue, 10 Sep 2024 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725974161; cv=none; b=OkZLd0C6OisTH/+6DbD63sOAd/x8dcLdANCChKgf4wFPHskRLDUAAqnxX7/JRIdlfSPh3A3sen/zTTvuHksWn+Cdnn/Z1o1jB53us2NbOTZRo6gTKYrFlDSrIPTIIayiizSrSEwF26ZJIch//P3aeQEMU6rNX3YLkbHnPlqRj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725974161; c=relaxed/simple;
	bh=pA3WfyCvcUox1V8UZ8zntvA+e1BepjnNRZYmfnvhAAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkYyLJVht/hhU7EfSqZpLSEHuCyNe1O4i/DVkY81sDe1s+DrP651BNQiTKh0qhs2xyAIVAY4Xm31gAnpHlYGl4V+PU4kL9/i8ekpSvFBZOXVWXucua3LyXC3IL4+WIzMC5Hh3cxjV0PN32W6agrDsgzjyQBMU3YHFFbuhzhlPDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQkDqtXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5484AC4CEC3;
	Tue, 10 Sep 2024 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725974160;
	bh=pA3WfyCvcUox1V8UZ8zntvA+e1BepjnNRZYmfnvhAAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQkDqtXB1ec8DLXGnGVbF67VyIpOPxH1to6G21A5MVMa4glqaIjzWSfWU/PAoYRFY
	 7y+/cvl1UVkvw0ORLNlKKODkGtaHooEXKx3+QeTuSR4yigpUxvLc3NYYgQLwYkWRHA
	 /32tH0UnaPEuGDWnaoqXZKvTW7aSyf2lnm3VACbaizeCuN8Ely1KVaMc4Cb6jXK8h7
	 X57xPOWgIvmMmgNlYgNfQy+xbouOFDJ9CxFpehUGwZ6tDoxzqNIQWwyDLMVFCGi5zt
	 VwYjSy/TsqgcnO2xW+b+io+tC2OIwmLL9eettWYECOiyIV3x1MfZkE1oaYFvqqCX7+
	 wRQvsDlw0xH+Q==
Date: Tue, 10 Sep 2024 15:15:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@amd.com, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manion05gk@gmail.com
Subject: Re: [PATCH 3/3] i2c: cadence: Add atomic transfer support for
 controller version 1.4
Message-ID: <5hjezq5ag4etru6suzbntvg2fwn45acckiyxsujmsjxsrgqxrd@asub7zr2t3gd>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
 <20240801094408.2004460-4-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801094408.2004460-4-manikanta.guntupalli@amd.com>

Hi Manikata,

Sorry for the delay in reviewing this patch. Looks good, just a
few notes below.

...

> +static bool cdns_i2c_error_check(struct cdns_i2c *id)
> +{
> +	unsigned int isr_status;
> +
> +	id->err_status = 0;
> +
> +	isr_status = cdns_i2c_readreg(CDNS_I2C_ISR_OFFSET);
> +	cdns_i2c_writereg(isr_status & CDNS_I2C_IXR_ERR_INTR_MASK, CDNS_I2C_ISR_OFFSET);
> +
> +	id->err_status = isr_status & CDNS_I2C_IXR_ERR_INTR_MASK;
> +	if (id->err_status)
> +		return true;
> +
> +	return false;

return !!id->err_status;

> +}
> +
> +static void cdns_i2c_mrecv_atomic(struct cdns_i2c *id)
> +{
> +	bool updatetx;

Please move the udatex declaration inside the while loop.

> +	while (id->recv_count > 0) {
> +		/*
> +		 * Check if transfer size register needs to be updated again for a
> +		 * large data receive operation.
> +		 */
> +		updatetx = id->recv_count > id->curr_recv_count;
> +
> +		while (id->curr_recv_count > 0) {
> +			if (cdns_i2c_readreg(CDNS_I2C_SR_OFFSET) & CDNS_I2C_SR_RXDV) {
> +				*id->p_recv_buf++ = cdns_i2c_readreg(CDNS_I2C_DATA_OFFSET);

Can you please expand this operation to be a bit more clearer,
without asking people to check on operation precedence?

> +				id->recv_count--;
> +				id->curr_recv_count--;
> +
> +				/*
> +				 * Clear hold bit that was set for FIFO control
> +				 * if RX data left is less than or equal to
> +				 * FIFO DEPTH unless repeated start is selected

mmhhh... the lack of punctuation makes this comment difficult to
understand.

> +				 */
> +				if (id->recv_count <= id->fifo_depth && !id->bus_hold_flag)
> +					cdns_i2c_clear_bus_hold(id);
> +			}
> +			if (cdns_i2c_error_check(id))
> +				return;
> +			if (cdns_is_holdquirk(id, updatetx))
> +				break;
> +		}
> +
> +		/*
> +		 * The controller sends NACK to the slave when transfer size

/slave/target/

> +		 * register reaches zero without considering the HOLD bit.
> +		 * This workaround is implemented for large data transfers to
> +		 * maintain transfer size non-zero while performing a large
> +		 * receive operation.
> +		 */
> +		if (cdns_is_holdquirk(id, updatetx)) {
> +			/* wait while fifo is full */
> +			while (cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET) !=
> +			       (id->curr_recv_count - id->fifo_depth))
> +				;
> +
> +			/*
> +			 * Check number of bytes to be received against maximum
> +			 * transfer size and update register accordingly.
> +			 */
> +			if (((int)(id->recv_count) - id->fifo_depth) >

The cast is not needed here.

> +			    id->transfer_size) {
> +				cdns_i2c_writereg(id->transfer_size,
> +						  CDNS_I2C_XFER_SIZE_OFFSET);
> +				id->curr_recv_count = id->transfer_size +
> +						      id->fifo_depth;
> +			} else {
> +				cdns_i2c_writereg(id->recv_count -
> +						  id->fifo_depth,
> +						  CDNS_I2C_XFER_SIZE_OFFSET);
> +				id->curr_recv_count = id->recv_count;
> +			}
> +		}
> +	}
> +
> +	/* Clear hold (if not repeated start) */
> +	if (!id->recv_count && !id->bus_hold_flag)
> +		cdns_i2c_clear_bus_hold(id);
> +}
> +
>  /**
>   * cdns_i2c_mrecv - Prepare and start a master receive operation
>   * @id:		pointer to the i2c device structure
> @@ -715,7 +804,34 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
>  		cdns_i2c_writereg(addr, CDNS_I2C_ADDR_OFFSET);
>  	}
>  
> -	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
> +	if (!id->atomic)
> +		cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
> +	else
> +		cdns_i2c_mrecv_atomic(id);
> +}
> +
> +static void cdns_i2c_msend_rem_atomic(struct cdns_i2c *id)
> +{
> +	unsigned int avail_bytes;
> +	unsigned int bytes_to_send;

Please move these inside the while.

> +
> +	while (id->send_count) {
> +		avail_bytes = id->fifo_depth - cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
> +		if (id->send_count > avail_bytes)
> +			bytes_to_send = avail_bytes;
> +		else
> +			bytes_to_send = id->send_count;
> +
> +		while (bytes_to_send--) {
> +			cdns_i2c_writereg((*id->p_send_buf++), CDNS_I2C_DATA_OFFSET);
> +			id->send_count--;
> +		}
> +		if (cdns_i2c_error_check(id))
> +			return;
> +	}
> +
> +	if (!id->send_count && !id->bus_hold_flag)
> +		cdns_i2c_clear_bus_hold(id);
>  }
>  
>  /**
> @@ -778,7 +894,12 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
>  	cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
>  						CDNS_I2C_ADDR_OFFSET);
>  
> -	cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
> +	if (!id->atomic) {
> +		cdns_i2c_writereg(CDNS_I2C_ENABLED_INTR_MASK, CDNS_I2C_IER_OFFSET);
> +	} else {
> +		if (id->send_count > 0)

If you do:

	} else if (id->send_count > 0) {

we save a level of indentation.

> +			cdns_i2c_msend_rem_atomic(id);
> +	}
>  }
>  
>  /**
> @@ -818,7 +939,8 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>  
>  	id->p_msg = msg;
>  	id->err_status = 0;
> -	reinit_completion(&id->xfer_done);
> +	if (!id->atomic)
> +		reinit_completion(&id->xfer_done);
>  
>  	/* Check for the TEN Bit mode on each msg */
>  	reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
> @@ -841,13 +963,24 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
>  	/* Minimal time to execute this message */
>  	msg_timeout = msecs_to_jiffies((1000 * msg->len * BITS_PER_BYTE) / id->i2c_clk);
>  	/* Plus some wiggle room */
> -	msg_timeout += msecs_to_jiffies(500);
> +	if (!id->atomic)
> +		msg_timeout += msecs_to_jiffies(500);
> +	else
> +		msg_timeout += msecs_to_jiffies(2000);

You explained this in the commit log, can you add it in a
comment, as well?

>  
>  	if (msg_timeout < adap->timeout)
>  		msg_timeout = adap->timeout;
>  
> -	/* Wait for the signal of completion */
> -	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
> +	if (!id->atomic) {
> +		/* Wait for the signal of completion */
> +		time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
> +	} else {
> +		/* 0 is success, -ETIMEDOUT is error */
> +		time_left = !readl_poll_timeout_atomic(id->membase + CDNS_I2C_ISR_OFFSET,
> +						       reg, (reg & CDNS_I2C_IXR_COMP),
> +						       CDNS_I2C_POLL_US_ATOMIC, msg_timeout);
> +	}

You can merge this if/else with the one above, to save some code.

> +

Thanks,
Andi

