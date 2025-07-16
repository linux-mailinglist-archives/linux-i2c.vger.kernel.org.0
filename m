Return-Path: <linux-i2c+bounces-11951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C0B08063
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jul 2025 00:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CEDB1890AED
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jul 2025 22:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02032EE5EB;
	Wed, 16 Jul 2025 22:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSjrje0n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A257729292F;
	Wed, 16 Jul 2025 22:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752704284; cv=none; b=qSNhi3ty/JAAFh/AlvNx4IkXjFmFEndIjnGft96hL7vT9BdxfBR4DcxE9CMus3mIef5CN8IF0tk0xBZNurE3ImX8N8ZPpMyj6Npcvx0vuExlHzWfOq+4TpcSNvLqekT8cKjaPCQ9yrNmVR0Ne1DQowzutqe13sY9rpsLqoHtYdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752704284; c=relaxed/simple;
	bh=s0XeFi4M45UhztDB8nNFt5fpQOlFtgg3p1lNOevOBQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9wGcUpnxutB9mxXD9quDYBJBXfy4qKZ964iv36u6ITtZGKCFCN16J+dBp3jka0amoqPR3MiBH0blX5wU5PhuhAldnQ9xgB4upv5lehj75nwN0yFT+VrUUEqD3xuy8G5ll4BtdAdmQ4daCKsXft19rXFNvNEO8Y69SRaXbdxRTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSjrje0n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CDFC4CEE7;
	Wed, 16 Jul 2025 22:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752704284;
	bh=s0XeFi4M45UhztDB8nNFt5fpQOlFtgg3p1lNOevOBQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSjrje0nyo4eij7hffvPVv094KgbCYp0h+Y3Lqdg2Lv+F0ADlh3f/IdqIBQUaA8CS
	 QhFbg01H0sNSO2dTFqM+t0DFc5Jc7X600UrED+s7FuNEgn7xDlYqeTM+UNbPSdgwU3
	 QCO1clzQ5EwyOhig2arFjvGn4c2nFzwz1HOrbKMLwccQXLX4LMYrlVnFxqz1Oe9Qyk
	 Qntl4kNlsH+O52IvS64roJOznAf94vTtfSEbaJv1S6qp00bMKohj5483Sm+qd5akKG
	 FzLlQaJyuWEH0gF/9ixrZ8Y6WyGkxuljlacOgEPvMTKAafFEmg0hFeH1X/BvAPwuLI
	 3BuQ8KJ0GMMTw==
Date: Thu, 17 Jul 2025 00:17:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: forbidden405@outlook.com
Cc: Stephan Gerhold <stephan.gerhold@kernkonzept.com>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: jump out of the loop in case of timeout
Message-ID: <7up54twtzt2ljricy6pf4xfggi5ztcuspr3tysb43rqreminrc@tjqmujuglhnl>
References: <20250616-qca-i2c-v1-1-2a8d37ee0a30@outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-qca-i2c-v1-1-2a8d37ee0a30@outlook.com>

On Mon, Jun 16, 2025 at 12:01:10AM +0800, Yang Xiwen via B4 Relay wrote:
> From: Yang Xiwen <forbidden405@outlook.com>
> 
> Original logic only sets the return value but doesn't jump out of the
> loop if the bus is kept active by a client. This is not expected. A
> malicious or buggy i2c client can hang the kernel in this case and
> should be avoided. This is observed during a long time test with a
> PCA953x GPIO extender.
> 
> Fix it by changing the logic to not only sets the return value, but also
> jumps out of the loop and return to the caller with -ETIMEDOUT.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>

I think you also need:

Fixes: fbfab1ab0658 ("i2c: qup: reorganization of driver code to remove polling for qup v1")

> ---
>  drivers/i2c/busses/i2c-qup.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 3a36d682ed57..5b053e51f4c9 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -452,8 +452,10 @@ static int qup_i2c_bus_active(struct qup_i2c_dev *qup, int len)
>  		if (!(status & I2C_STATUS_BUS_ACTIVE))
>  			break;
>  
> -		if (time_after(jiffies, timeout))
> +		if (time_after(jiffies, timeout)) {
>  			ret = -ETIMEDOUT;
> +			break;
> +		}

Well spotted Yang! I think this was the original idea, as well.
Merged to i2c/i2c-host-fixes.

Andi

>  
>  		usleep_range(len, len * 2);
>  	}
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250615-qca-i2c-d41bb61aa59e
> 
> Best regards,
> -- 
> Yang Xiwen <forbidden405@outlook.com>
> 
> 

