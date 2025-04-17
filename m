Return-Path: <linux-i2c+bounces-10458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FF9A91D13
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 14:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAF6D16D5B1
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 12:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A8524500E;
	Thu, 17 Apr 2025 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR3HJlu1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4B243968;
	Thu, 17 Apr 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894668; cv=none; b=uJarJGn3RUE+fountnydvGTW5Gyq1l9wlNKb4fMPMrIfoZkCjFMb3M+zmybv7znZVtdxL8ng2RZHePhUMt1rINntFM0tDKaOSyvXsqGaCkH5F6cJmLRDtvYR1+hifTl9d2v5EFSWpYSEMh+DfBcHjN/QlMrZbRMeif7YDbS7I7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894668; c=relaxed/simple;
	bh=jC0ewz2A/v8CrSY20r308WeEKgKCaEyIUxe/Hk7E6J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cE+wtDvXyXE0cfem9wXAUP21nTQzcJ81jJpFplV/07u8kxThap4VNm2V/nIEqpTc1rx9/ZAc7F2iY2FmMXTeoT0W4ZUqElImOSZgHAya+QBZCk3P4S8xEOMX7HgRBXUuKhjVrCYZ7fOcWtrsn8Tgh5a9xUaRO+xbSJcIl729R1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR3HJlu1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC70C4CEEF;
	Thu, 17 Apr 2025 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744894668;
	bh=jC0ewz2A/v8CrSY20r308WeEKgKCaEyIUxe/Hk7E6J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VR3HJlu15hmEx3pclURVQi97YKgePzYYoTA2ePOiGAW/6HvipNyAy9RUECrGMMQmU
	 b7lCeIFTHxUiRMDFzvMlxtB7jzfFC5OP/8NEJm8DlFDx5cBmlXkbSvbXRyzl1atFPA
	 gdqvlxTrq/wACQK5ixXKtHAXyhlF9P1cRe52/qkvBDGY9jdguA5Kx6TJijGg2/UWPt
	 tO4l9mEtcQ7iwQ4y/TBf1nEF92o7pjBRWVm/b0lmgLqqS6bcr+A9vuHYd4IlBRrHBc
	 rYnvFVvvyXYcGM44GwzxDngKB2VyRtvDNj9ryLJv0fvfKxvQz9OMtvzqEHQ6bOFzdt
	 0E0r0U3UBbHhw==
Date: Thu, 17 Apr 2025 14:57:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
Message-ID: <s67nprw4a4xu3eqgom4hu6tvabt52l3aq6hp7klnkb4mocbzeu@rsyvaykn3e2j>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>

Hi Sven,

>  static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>  	int timeout = 100;
> +	int ret;

can you please declare this "ret" inside the if() statement
below?

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

this is an error and it's treated as an error, can we please
print dev_err()?

Andi

> +			return -ETIME;
> +		}
>  	}

