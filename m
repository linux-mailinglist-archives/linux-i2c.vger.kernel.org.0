Return-Path: <linux-i2c+bounces-6998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC498679C
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C5B2847F5
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 20:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6C31482E7;
	Wed, 25 Sep 2024 20:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhbC+J/t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384A214600F;
	Wed, 25 Sep 2024 20:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727295869; cv=none; b=shdKF1jDsjciQQECcB9/T/Mcw9HB5CDXh5ii0Hf0CpVVZ+Lg5QEA/BGwRVEQcXeVzrx4fXq7R1wQVHHAlCD5EPaXQGaXce7umDsxWG+h/sLgMRtZ2xe883PPYRS6JVnqzr3aPQJIY6ICiDdduYT0JBpiuhwG9LQVHwmvKDjOq+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727295869; c=relaxed/simple;
	bh=eF5LP5/MDlE2ovTR7G62APQbt2APjNBnDJBCBg8A4RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNqIDSHWAF/LUcNkYYlmG6kiUnVUlSUu9EzbSt3jR25ph0Ed4V+MqNjSe2gTrsWaXRT5GL0VIV+ieg3zzTjE3SH2/afD6zgzMos753VY/+zy8Ih2YKi2QtUaiizwwUhZReg127QXQhLnYIBceKW9aHfVS/Empskxb71kpDuV8VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhbC+J/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6697AC4CEC3;
	Wed, 25 Sep 2024 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727295869;
	bh=eF5LP5/MDlE2ovTR7G62APQbt2APjNBnDJBCBg8A4RI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhbC+J/tEPihqzxq/2I1xXH96g/4GU1fX+Wc8BDhEwggy1LKBQSBcmDXk8aRyf4PD
	 4SSSxA0wBwQrfy1yD4hz5/3jA8klY48Bt0lKBrBcy/stwoyl+3H+PRuX0er6r51xwg
	 lyT9QAfkSL3Zy77PWWh7cbQF9RL4ZxGuF/bX5U9YljPLjoUeLcZYYf4HObd6JDd6FY
	 ZpJvGAxwPGAmOqeDGTZqX4qWiw81ZhQk+fPNxLmDX3n06l2TXs2DpGlibkwFGFZpMz
	 4mevOTO8dSZU3FlAA5vJzesU5l9UswSbRrHoOcQj/t2jMMvJY30L6DUJEh25SXoQRt
	 O1WjNPHH98HfA==
Date: Wed, 25 Sep 2024 22:24:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: warp5tw@gmail.com
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] i2c: npcm: Modify timeout evaluation mechanism
Message-ID: <z4g5alkk3cug7v5bsmrmzspgvo4hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-4-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-4-kfting@nuvoton.com>

Hi Tyrone,

...

> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2d034503d8bc..68f3d47323ab 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2132,19 +2132,12 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  		}
>  	}
>  
> -	/*
> -	 * Adaptive TimeOut: estimated time in usec + 100% margin:
> -	 * 2: double the timeout for clock stretching case
> -	 * 9: bits per transaction (including the ack/nack)
> -	 */
> -	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
> -	timeout = max_t(unsigned long, bus->adap.timeout, usecs_to_jiffies(timeout_usec));
>  	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>  		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>  		return -EINVAL;
>  	}
>  
> -	time_left = jiffies + timeout + 1;
> +	time_left = jiffies + bus->adap.timeout / bus->adap.retries + 1;
>  	do {
>  		/*
>  		 * we must clear slave address immediately when the bus is not
> @@ -2183,6 +2176,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
>  				       write_data, read_data, read_PEC,
>  				       read_block)) {
> +		/*
> +		 * Adaptive TimeOut: estimated time in usec + 100% margin:
> +		 * 2: double the timeout for clock stretching case
> +		 * 9: bits per transaction (including the ack/nack)
> +		 */
> +		timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
> +		timeout = max_t(unsigned long, bus->adap.timeout / bus->adap.retries,
> +				usecs_to_jiffies(timeout_usec));
>  		time_left = wait_for_completion_timeout(&bus->cmd_complete,
>  							timeout);
>  
> @@ -2308,7 +2309,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
>  	adap = &bus->adap;
>  	adap->owner = THIS_MODULE;
>  	adap->retries = 3;
> -	adap->timeout = msecs_to_jiffies(35);
> +	adap->timeout = 2 * HZ;

Same here, I need some good description of why timeout is set to
2 seconds. If the datasheet says 35ms, I do not exclude that
someone in the future will send a patch saying "we don't need to
wait 2 seconds, wait 35ms as per datasheet".

Thanks,
Andi

>  	adap->algo = &npcm_i2c_algo;
>  	adap->quirks = &npcm_i2c_quirks;
>  	adap->algo_data = bus;
> -- 
> 2.34.1
> 

