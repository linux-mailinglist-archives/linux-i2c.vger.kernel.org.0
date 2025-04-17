Return-Path: <linux-i2c+bounces-10459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A51A91D52
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 15:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B283C7A2EF9
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 13:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7696424167C;
	Thu, 17 Apr 2025 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/aFT4KA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBAC64A98;
	Thu, 17 Apr 2025 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895282; cv=none; b=rn79A6Z/mKawtsMCLsn8LoYZSXrJg+/2JEFclDWaH1+Na2gQrqLIIj7d/83FgXs6QU9Iv4VvDEKodq3zUfp/ujjzimuL7KCgsvei9d9YniOmTRZClc2H+z4K186AByuO8OFfs0LNZcUzXH4Frlx+NyU7beRhfHpvkxZTsV2/Vhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895282; c=relaxed/simple;
	bh=qXwSbKoa+3CLa3KQktU6eGBwQ/lN3JxTlgMWrtWYA4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEYDRpLEB/KEuNDITnFGzUXDfNSiLbTQKFxbSW+r2KqD9ahl5Emv+RnKdVraFXO9tdnF7v8Adu0Z7htNeInUG489Lf8xpz4kOltVLISEoMwSYAxjPbY31taIp8H2mwxx5jl1r9sxyUtDl++fqfnmYVH7QPV1tUh8upekcgxiAvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/aFT4KA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F24DC4CEE4;
	Thu, 17 Apr 2025 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895281;
	bh=qXwSbKoa+3CLa3KQktU6eGBwQ/lN3JxTlgMWrtWYA4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/aFT4KAzeo3foK4z0YCpKh70KkL/axv2rszxLiM/7DEfhxQfevMVARGd5oVb7ySp
	 f53s/xg3FmPkXNdnvkuSopX2+5BJ97mWX2J+VpUnX+FKBe8DLy0OMfKCwgyIKqP9Xa
	 Y944DXO1gMXLyeG8utxvdSDatJpGPMQl8xloeFrs/FwlJsQSztxK+8aPBIYJoMNhmb
	 iPmLVgWQw72SlVGGuOBq6t1nKd630l50OMaVX24lpwpdUCIAUIp+VOeCrLk/HfnqCU
	 QtwPtobCRC5i8G1j2hadf9La2MWbV7sja8SWxagGFV0YItyY2hG3osM4vanhx4qyiv
	 p+xPtSl6yGXVQ==
Date: Thu, 17 Apr 2025 15:07:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] i2c: pasemi: Improve error recovery
Message-ID: <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>

Hi Sven, Hector,

...

> +/*
> + * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
> + * use 100ms here which should be plenty.
> + */
> +#define TRANSFER_TIMEOUT_MS	100

Please use the PASEMI prefix here. TRANSFER_TIMEOUT_MS it's not a
naming belonging to this driver.

100ms looks a bit too much to me, but if you say it works, then
it works.

> +

...

>  	unsigned int status;
>  
>  	if (smbus->use_irq) {
>  		reinit_completion(&smbus->irq_completion);
> -		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
> -		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
> +		/* XEN should be set when a transaction terminates, whether due to error or not */
> +		reg_write(smbus, REG_IMASK, SMSTA_XEN);
> +		ret = wait_for_completion_timeout(&smbus->irq_completion,
> +						  msecs_to_jiffies(timeout));
>  		reg_write(smbus, REG_IMASK, 0);
>  		status = reg_read(smbus, REG_SMSTA);
>  
> @@ -123,9 +150,35 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  		}
>  	}
>  
> +	/* Controller timeout? */
> +	if (status & SMSTA_TOM) {
> +		dev_warn(smbus->dev, "Controller timeout, status 0x%08x\n", status);
> +		return -EIO;

as before, these warnings are treated as errors. Can we just
print error?

The rest looks good.

Andi

> +	}
> +
> +	/* Peripheral timeout? */
> +	if (status & SMSTA_MTO) {
> +		dev_warn(smbus->dev, "Peripheral timeout, status 0x%08x\n", status);
> +		return -ETIME;
> +	}

...

