Return-Path: <linux-i2c+bounces-3462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 116118BFDB1
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 14:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93971B23A84
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 12:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7434C5FB9A;
	Wed,  8 May 2024 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+wYYErv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305075C8F4;
	Wed,  8 May 2024 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715172698; cv=none; b=KGlxgCF+n6uYrOOkp0wKnU/Rbk2AaW9PK7J+HpNmD6ItAC7NtHSMN1F4AZbg79qDjwhAQ1Zi4ZMwYllxkHtUjVEzLvNRY24pYUKtQHT8MHZ1szjTOc5ocKpR4dF/Ny+Y2y2z2x7dAsfxkxHz/iyllVH1OUqNlhShSbsGFNBnoFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715172698; c=relaxed/simple;
	bh=IuMR0WzGssFWCdB3kp6DpjezXdcQqzHxncfUeFUz8rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eih4uk7905wVFNGKcaQgsjKyiu+5mJJtn27OE6Ma7CxoufLqy3NZoiCDtnLD/mEDvuwGz2Bgxj6dV5P28fSMk8Oos+BIRgIXmLBI/VIkTSX6JT5AzLVJ8FgxXNMTUpoaD9HWdYvo37Kzwg6KBvXVv2sS3l/Ym9pcD4NbI25kpVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+wYYErv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8A4C4AF63;
	Wed,  8 May 2024 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715172697;
	bh=IuMR0WzGssFWCdB3kp6DpjezXdcQqzHxncfUeFUz8rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+wYYErvSCkfV+3Fv1Z+xaki7HRzIeK9BQec+115VBUjo+vXp7MUXTja1QBu8dCg1
	 P/SFgIWSwDM0o07QM3v4dorxNvIdkAUeTv2388YoHJE/v7po0qRsW76+bMb6K1lsUd
	 MHk1GjQj7/nHXNIXLE9TSsFYz59UIxP9rALBIV+ZeC8S/A7ebIKZQSYt2/AeNeczuQ
	 7fhnrwvzEoJmgRDep4M31YOtyA3rN/1VrdH0wPa7XVgAhbsWxqGtvoghPmqTxwHTmD
	 D/8UGQh043B3nAWEm9P389YLFJ0sDXvdtxotmZIKc24vFGkEFtrusC4PJMZEXbXenf
	 R0BtLjhrI6ZGw==
Date: Wed, 8 May 2024 14:51:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: marc.ferland@gmail.com
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Subject: Re: [PATCH] i2c: xiic: print error code when xiic_start_xfer fails
Message-ID: <h6mggdcri53rq65jzi5ov6n7oqdvaldtpofh6eina6gos2wyyw@crjmnmfpynw4>
References: <20240506154520.3886867-1-marc.ferland@sonatest.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506154520.3886867-1-marc.ferland@sonatest.com>

Hi Marc,

On Mon, May 06, 2024 at 11:45:20AM -0400, marc.ferland@gmail.com wrote:
> From: Marc Ferland <marc.ferland@sonatest.com>
> 
> xiic_start_xfer can fail for different reasons:
> 
> - EBUSY: bus is busy or i2c messages still in tx_msg or rx_msg
> - ETIMEDOUT: timed-out trying to clear the RX fifo

Wolfram has recently removed all the error printouts caused by
etimedout.

> - EINVAL: wrong clock settings
> 
> Printing the error code helps identifying the root cause.
> 
> Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 71391b590ada..73729f0180a1 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1165,7 +1165,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  
>  	err = xiic_start_xfer(i2c, msgs, num);
>  	if (err < 0) {
> -		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
> +		dev_err(adap->dev.parent, "Error xiic_start_xfer: %d\n", err);

I don't see the end user being interested in having the error
number printed in the dmesg. In fact, I doubt the end user is
interested in this message at all.

We could print the debug messages (or warnings) where the actual
failure occurs. For example, in the setclk case, a warning is
already being printed, and I don't see why we should also print
an error here.

Does that make sense?

Andi

>  		goto out;
>  	}
>  
> -- 
> 2.34.1
> 

