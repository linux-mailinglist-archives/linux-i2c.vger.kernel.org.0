Return-Path: <linux-i2c+bounces-9925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E3FA69D29
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 01:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83B0462C78
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 00:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E18979F2;
	Thu, 20 Mar 2025 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3SqfcKx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC37846D;
	Thu, 20 Mar 2025 00:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742429845; cv=none; b=CrVXRzQU7moXnN2+cgB5dQfudLq5MpwX+D6f+N2m90UweRNiOnuhHEQ9HTePmaSlDE4uQGhO9vrpmHG7pFh8uV8AWLY1WNDcaIZleSMMYYiocb/WwXNNy+XKJ1Oo2h/0mdvDLybx/aCgYQlQ7X9gRkDzGLRGapj/z8DfqZvNqTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742429845; c=relaxed/simple;
	bh=2y/dJ4wHb2mrgocbKn8ljT/pAiya0DW13gSxj/rI8uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay21ZESff2WqdSX+R7F9wFwNpfuxi8bVAF9f/Okr18vYjcJ3yqfG8LkSFN5penQy/p8n97k9tyootMeWcSybCm0CbLoQ4NEgzYmG2JrcCgSxaMh8ip3cX8b9CTJOI4q3QKL0xgStkgJ5f5BP6e4DdguDWebyw3KIfcNEaZUaDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3SqfcKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB01CC4CEE4;
	Thu, 20 Mar 2025 00:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742429844;
	bh=2y/dJ4wHb2mrgocbKn8ljT/pAiya0DW13gSxj/rI8uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3SqfcKxCqyPMWOJ9NSQgdINsa8TSI+AC7nYUeOzvewHqrjYbPtrCfZqG8vF4llvd
	 VStA0W9qBho0AXDAlUqtgpDNjrPn2s4989Ep5n92bGGDBD3wkS7SpVPcgXDSN2gXnT
	 YxMNGFCLb6tMir0ZgRn0cMuZvHTa31OY0nb9BbZbfctJzDnZFFqmXnoUHXG8qy5tVd
	 FM7wP8tueJ8HyI8tpLFcPuU9cy6HA4poytqqiXVIhy5klZEjNGc6K+VWVLuEgx4sgV
	 1GFNx6GOZW5Bww9hVt5eLJFOh3Og7UczOlJ6fraJC4Hot7PvuZb1zgoaJ/kL/kRZX+
	 sYYjiUchVfQDg==
Date: Thu, 20 Mar 2025 01:17:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/4] i2c: pasemi: Improve error recovery
Message-ID: <mp77oombs4xgr6sjj44ne7muybfrwejgehzv5xupeanh6udui3@ymgfesctindh>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>

Hi Sven,

On Sat, Feb 22, 2025 at 01:38:34PM +0000, Sven Peter via B4 Relay wrote:
> The hardware (supposedly) has a 25ms timeout for clock stretching
> and the driver uses 100ms which should be plenty.

Can we add this lines as a comment to the define you are adding?

> The error
> reocvery itself is however lacking.

...

> -static void pasemi_smb_clear(struct pasemi_smbus *smbus)
> +static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  {
>  	unsigned int status;
> +	int timeout = TRANSFER_TIMEOUT_MS;
>  
>  	status = reg_read(smbus, REG_SMSTA);
> +
> +	/* First wait for the bus to go idle */
> +	while ((status & (SMSTA_XIP | SMSTA_JAM)) && timeout--) {
> +		msleep(1);

Please, use usleep_range for 1 millisecond timeout.

> +		status = reg_read(smbus, REG_SMSTA);
> +	}

You could use here readx_poll_timeout() here.

> +
> +	if (timeout < 0) {
> +		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);

if it's an error, please use an error.

> +		return -EIO;
> +	}
> +
> +	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
> +	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
> +		!(status & SMSTA_MTE))

Please, fixe the alignment here.

> +		pasemi_reset(smbus);
> +
> +	/* Clear the flags */
>  	reg_write(smbus, REG_SMSTA, status);
> +
> +	return 0;
>  }
>  
>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
> -	int timeout = 100;
> +	int timeout = TRANSFER_TIMEOUT_MS;
>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
> -		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		/* XEN should be set when a transaction terminates, whether due to error or not */
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN);
> +		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(timeout));

what happens if the timeout expires?

>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
>  	} else {

...

>  	struct pasemi_smbus *smbus = adapter->algo_data;
>  	int ret, i;
>  
> -	pasemi_smb_clear(smbus);
> +	if (pasemi_smb_clear(smbus))
> +		return -EIO;

Can we use

	ret = ...
	if (ret)
		return ret;

This way we return whatever comes from pasemi_smb_clear().

>  
>  	ret = 0;

This way we can remove this line, as well.

Andi

