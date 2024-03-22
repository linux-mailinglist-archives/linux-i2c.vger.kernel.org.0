Return-Path: <linux-i2c+bounces-2563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D698871C0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 18:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E600282ED7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98085E091;
	Fri, 22 Mar 2024 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="TJH1vFnZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07975D752;
	Fri, 22 Mar 2024 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711127475; cv=none; b=RrZ/sFxn4R4kSmwTYFlioV12N2v7SlfhuPydKbolFMkhfKElcoUckVxAla33ZHGFzYwWXAE3FZFzRi5oxPXNpTnKpeKlbJGzWoUQ1v9quhZMw6Yau0YwYHZp9iQmeOyyRNklW+cB75Z5N42Nc8laS8CcnQL+VDYaVbu/s85/5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711127475; c=relaxed/simple;
	bh=EtfWf8L3P6/6G9JdSlM63ngvMJjTK2/myg+A1nTwSuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTjdsTQ9nqTztNAELafMjIY6ospyguago2GtdL6lGO1OEASrn4NqmDAfwkhEf88/0Xa7HBQdaVgkN7Y2vJmPw1m/a3kQPXup0pNtWiILu/kNWJOT/nS9/3OlwCjEvdXgYs9pxcKHGJV4u9r5CGs1aIei6QQeozhpgnbRnPqfF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=TJH1vFnZ; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [100.64.224.211] (unknown [20.29.225.195])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4321E20B74C0;
	Fri, 22 Mar 2024 10:11:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4321E20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711127473;
	bh=A1TVEJpLHHHN82us12nZFBECo9Q2m63RNd7pytTA8vQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TJH1vFnZkA/hZ797UCRMWR1g35B0Z0Nqvyg4pF7+SezxJKCGxFvqhHqZL5K4LslAJ
	 KwD3RIpaJbGSBlcjj3T3yupxQvjVdBwSFoGjjEeLGK2tlQxdVQR0D5E0bpSDPmieHL
	 nRX3X+evl41FkSyF0+wVPdTDwopmj/fdijND48wM=
Message-ID: <f94f293c-4756-458e-8ffa-a10baa8379d0@linux.microsoft.com>
Date: Fri, 22 Mar 2024 10:11:11 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 53/64] i2c: st: reword according to newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-54-wsa+renesas@sang-engineering.com>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240322132619.6389-54-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/22/2024 6:25 AM, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-st.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
> index ce2333408904..9bd45ae83c0c 100644
> --- a/drivers/i2c/busses/i2c-st.c
> +++ b/drivers/i2c/busses/i2c-st.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 STMicroelectronics
>   *
> - * I2C master mode controller driver, used in STMicroelectronics devices.
> + * I2C host controller driver, used in STMicroelectronics devices.
>   *
>   * Author: Maxime Coquelin <maxime.coquelin@st.com>
>   */
> @@ -150,7 +150,7 @@ struct st_i2c_timings {
>  
>  /**
>   * struct st_i2c_client - client specific data
> - * @addr: 8-bit slave addr, including r/w bit
> + * @addr: 8-bit client addr, including r/w bit
>   * @count: number of bytes to be transfered
>   * @xfered: number of bytes already transferred
>   * @buf: data buffer
> @@ -647,7 +647,7 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
>  {
>  	struct st_i2c_client *c = &i2c_dev->client;
>  	u32 ctl, i2c, it;
> -	unsigned long timeout;
> +	unsigned long time_left;

Thanks for doing this. Is the timeout v/s time_left language also due to the specification change?
A link to the specification(s) in the commit message would be nice to have

>  	int ret;
>  
>  	c->addr		= i2c_8bit_addr_from_msg(msg);
> @@ -667,7 +667,7 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
>  		i2c |= SSC_I2C_ACKG;
>  	st_i2c_set_bits(i2c_dev->base + SSC_I2C, i2c);
>  
> -	/* Write slave address */
> +	/* Write client address */
>  	st_i2c_write_tx_fifo(i2c_dev, c->addr);
>  
>  	/* Pre-fill Tx fifo with data in case of write */
> @@ -685,15 +685,12 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
>  		st_i2c_set_bits(i2c_dev->base + SSC_I2C, SSC_I2C_STRTG);
>  	}
>  
> -	timeout = wait_for_completion_timeout(&i2c_dev->complete,
> +	time_left = wait_for_completion_timeout(&i2c_dev->complete,
>  			i2c_dev->adap.timeout);
>  	ret = c->result;
>  
> -	if (!timeout) {
> -		dev_err(i2c_dev->dev, "Write to slave 0x%x timed out\n",
> -				c->addr);
> +	if (!time_left)
>  		ret = -ETIMEDOUT;
> -	}

Why did we lost the dev_err() here?

>  
>  	i2c = SSC_I2C_STOPG | SSC_I2C_REPSTRTG;
>  	st_i2c_clr_bits(i2c_dev->base + SSC_I2C, i2c);
> @@ -769,7 +766,7 @@ static u32 st_i2c_func(struct i2c_adapter *adap)
>  }
>  
>  static const struct i2c_algorithm st_i2c_algo = {
> -	.master_xfer = st_i2c_xfer,
> +	.xfer = st_i2c_xfer,
>  	.functionality = st_i2c_func,
>  };
>  


