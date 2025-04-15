Return-Path: <linux-i2c+bounces-10362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5184A8A517
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 19:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1D33B8D04
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7BC21930B;
	Tue, 15 Apr 2025 17:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="oFlrKFE4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACEC19AD8C
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737121; cv=none; b=PvKfHxgGdz4mdP+FSssNjrKEc682YK+qLmU+FqaWC/OAXvcQGEvL/YdPhhfbjPRP0Hh/qnon3dQU4CBWgntES1MfNN7e++1vby9zu2E6KOYXrDwQeMHhFlRyxtgppPCuQqJ62cUsCeyexvtRQtccuIUqDvhZ7cT1urNGGmkl3Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737121; c=relaxed/simple;
	bh=bSf+8q+0tWGyLow2FlL0byyEBGTzi+RQNMFqsQYOag0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPTx+D9ft21aiBHVQmAeEj35wFMbghMAAAdSjGwj+NeSre/ruVVMDZgjOfh8xzzQ+GYWJQx670cQVjxhpg56YWrX7Aa+bnslDBEac9yaxiXi1IKk5rTD1A2CGhUzXHWKjuqBM5tS8vBfK2e8iG0rIG3Cd5zCwXQZvsV/mj8qpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=oFlrKFE4; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Tue, 15 Apr 2025 13:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZ5TeuXVlqIBcTKnyUPN6n6PTqhb3E+xVpAkmmqWBI8=;
	b=oFlrKFE4LAVCgIG+lnbBcjPxf379TP8S57q7VeZGqKPSLoMsXkqz8/bW4DFZwGljq48SIS
	5JGRUASghmHz8I2DS3FnnTTUgSbCY0OVjCB44yrdsBbb6gaQTdplmXNS7Pr3MbmMic8/il
	u/gK8rVWZGtJCJgA9lA6cPzx7TsCgtf3DtsLBSv1Gcjmtj3lA+cWhzUf/0ySFFQGq0uivf
	3+nDtOlNfKhzPEd1yBjoNewkC6tThMgDjJvj06zeuH71hXyaGylesqRmtdzFBQtaBWdSW/
	xuR/GbERtUk8S47AzQ2lxF5NDnBA447wq2R7byXt74R3ZcoszoXceD0TmqeMaQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
Message-ID: <Z_6TV-tPU2wRdfFf@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:57PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> Add proper timeout handling for the interrupt path.
> Previously, this was only correctly done for the polling path.
> Note that we drop reg_write(smbus, REG_SMSTA, status) here which
> will be done anyway whenever the next transaction starts via
> pasemi_smb_clear.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..9b611dbdfef23e78a4ea75ac0311938d52b6ba96 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -91,32 +91,42 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>  	int timeout = 100;
> +	int ret;
>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
>  		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
> +
> +		if (ret < 0) {
> +			dev_err(smbus->dev,
> +				"Completion wait failed with %d, status 0x%08x\n",
> +				ret, status);
> +			return ret;
> +		} else if (ret == 0) {
> +			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> +			return -ETIME;
> +		}
>  	} else {
>  		status = reg_read(smbus, REG_SMSTA);
>  		while (!(status & SMSTA_XEN) && timeout--) {
>  			msleep(1);
>  			status = reg_read(smbus, REG_SMSTA);
>  		}
> +
> +		if (timeout < 0) {
> +			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> +			return -ETIME;
> +		}
>  	}
>  
>  	/* Got NACK? */
>  	if (status & SMSTA_MTN)
>  		return -ENXIO;
>  
> -	if (timeout < 0) {
> -		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
> -		reg_write(smbus, REG_SMSTA, status);
> -		return -ETIME;
> -	}
> -
>  	/* Clear XEN */
>  	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
>  
> 
> -- 
> 2.34.1
> 
> 

