Return-Path: <linux-i2c+bounces-1092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65B8235B0
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 20:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 286752873C4
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jan 2024 19:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E631CABB;
	Wed,  3 Jan 2024 19:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MheeUQbH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E871B1CAB2
	for <linux-i2c@vger.kernel.org>; Wed,  3 Jan 2024 19:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A58DC433C7;
	Wed,  3 Jan 2024 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704310755;
	bh=UWCwGljtgW83UqZ//upyVlgNOqxEwvNiI3mDY5X5Psk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MheeUQbHN+8jxk++h09AL/eljq3TSiMSGyIujfU2YiFqZQ2zDV1PSmfm3dTc0Fts+
	 zcZ0ATQUQmTXIdW+iN+AdT/dyTepcO5vLfN9ZiIrEBvTriVl/gJNJAIl9VCnSZCfVU
	 6FwJYtOlxDny2DAOzbVHhNiwDVfHvvRqHhkQoS/3vhOCb1a/H0ztUN0atoAr578ONc
	 m1e5OHtU1S7JOOqnDUDcKENvHk03EN6nGr+0F2cvmLaFv703inTGyPO1UxnHwV+iRt
	 GESZvEF5Gvgj5QOyEn2itHRTX9ivevOAByeOJHOgsGgmuypcmU0Fxlr40tdu77Y0bN
	 P1wgP13aRydBQ==
Date: Wed, 3 Jan 2024 20:39:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: wsa@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v6 6/8] i2c: wmt: fix a bug when thread blocked
Message-ID: <20240103193911.qbc5m5yz7cbi5l7u@zenone.zhora.eu>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
 <b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com>

Hi Hans,

[...]

>  static int viai2c_wait_bus_ready(struct viai2c *i2c)
>  {
> @@ -25,12 +26,35 @@ static int viai2c_wait_bus_ready(struct viai2c *i2c)
>  static int viai2c_wait_status(struct viai2c *i2c)
>  {
>  	int ret = 0;
> -	unsigned long wait_result;
> +	unsigned long time_left;
> +	unsigned long delta_ms;
> +
> +	time_left = wait_for_completion_timeout(&i2c->complete,
> +						VIAI2C_TIMEOUT);
> +	if (!time_left) {
> +		dev_err(i2c->dev, "bus transfer timeout\n");
> +		return -EIO;
> +	}
>  
> -	wait_result = wait_for_completion_timeout(&i2c->complete,
> -						msecs_to_jiffies(500));
> -	if (!wait_result)
> -		return -ETIMEDOUT;

this change is unrelated. Why are you changing the timeout here
from 500 to 1000?

> +	/*
> +	 * During each byte access, the host performs clock stretching.
> +	 * In this case, the thread may be interrupted by preemption,
> +	 * resulting in a long stretching time.
> +	 * However, some touchpad can only tolerate host clock stretching
> +	 * of no more than 200 ms. We reduce the impact of this through
> +	 * a retransmission mechanism.
> +	 */

is the hardware sending the stretching on its own?

> +	local_irq_disable();
> +	i2c->to = ktime_get();
> +	delta_ms = ktime_to_ms(ktime_sub(i2c->to, i2c->ti));
> +	if (delta_ms > VIAI2C_STRETCHING_TIMEOUT) {
> +		local_irq_enable();
> +		dev_warn(i2c->dev, "thread blocked more than %ldms\n",
> +				delta_ms);
> +		return -EAGAIN;
> +	}
> +	i2c->ti = i2c->to;
> +	local_irq_enable();
>  
>  	if (i2c->cmd_status & VIAI2C_ISR_NACK_ADDR)
>  		ret = -EIO;
> @@ -184,6 +208,7 @@ int viai2c_xfer(struct i2c_adapter *adap,
>  	int ret = 0;
>  	struct viai2c *i2c = i2c_get_adapdata(adap);
>  
> +	i2c->to = i2c->ti = ktime_get();
>  	for (i = 0; ret >= 0 && i < num; i++) {
>  		pmsg = &msgs[i];
>  		if (!(pmsg->flags & I2C_M_NOSTART)) {
> diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
> index f171f81e4d0f..73a88398d763 100644
> --- a/drivers/i2c/busses/i2c-viai2c-common.h
> +++ b/drivers/i2c/busses/i2c-viai2c-common.h
> @@ -58,6 +58,8 @@ struct viai2c {
>  	u16			tcr;
>  	int			irq;
>  	u16			cmd_status;
> +	ktime_t			ti;
> +	ktime_t			to;

don't these need some arbitration?

Andi

