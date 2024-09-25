Return-Path: <linux-i2c+bounces-6995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF1986131
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EBD728D2A2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CC618A6BA;
	Wed, 25 Sep 2024 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPyKYrM7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F450187344;
	Wed, 25 Sep 2024 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727272927; cv=none; b=knsiaXJs17xEsW2e64dXk1yBwhnfWtJ9QKE6QrxamIctGB+Bj9OynkicI23eJoP9LV67pq3/SSE2co40Xa9iMpqKtczl1f7LmE+B4o2XYpKCde7P+SvJKi/13zQB+KdGKWdUM+s4mcacVXveHAu7WhBqO5wt3affSOg4nu4FU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727272927; c=relaxed/simple;
	bh=cTPFJVZM/FQBlf2mGrnq8DJMJQI3eHlNtx/nF3jaPsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsEmobIVUcjaeIMYfdhTt+NzmW8rNDYPhM36D1HLWAl7au6dXQDhIC/oLjlztwsD7fKUg+r3YhYwp097/LBioZ+i1NdlmbCh+YVHqpIq6i6qQP+6TpIYum0fddqnkIg7nZyevpFDFswYNTo4PquidfCh2+synQfOs8P5bwUuvNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPyKYrM7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13E8C4CEC3;
	Wed, 25 Sep 2024 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727272927;
	bh=cTPFJVZM/FQBlf2mGrnq8DJMJQI3eHlNtx/nF3jaPsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPyKYrM796V0dUhDPF5+DeiU9UWdHBzLU1mEdO8Rt4ckWRzkV9lmmqHWC+/bPPUKX
	 o1qf2UbIIeOCJkPTqX0YLOsW+NS/gKkLWhEaZGHWclqZKOIT0AC8wKSoeGpo9V+M9t
	 Qp6yi9hpN682rpBAgwN+91o8gXsmcrTv3hDVORMFMIoFB12IIlnPBMpsVRckyJYDtn
	 qKP9aOeEL8uL33oP7KpEndRVndGF4aE8cHoeJDx1x89egceDoYQ/OwMu4nRuYKRwwB
	 gdDglxdozpezfnV/LLA2D7g6UB+kks0SKn9MWrnM/A0zED/66q974ihgQmCdmYNnKC
	 5Qta3pMvfLf5g==
Date: Wed, 25 Sep 2024 16:02:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: michal.simek@amd.com, shubhraj@xilinx.com, wsa@kernel.org, 
	robh@kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: Fix pm_runtime_set_suspended() with runtime
 pm enabled
Message-ID: <ogqyyahwtd24ckvcqcdx2amm6uzxajeuya2p6555vjubjqtjtb@oqq4gxgwr5lu>
References: <20240923034250.3008055-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923034250.3008055-1-ruanjinjie@huawei.com>

Hi Jinjie,

On Mon, Sep 23, 2024 at 11:42:50AM GMT, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() for devices
> with runtime PM enabled because it returns -EAGAIN if it is enabled
> already and working. So, call pm_runtime_disable() before to fix it.
> 
> Fixes: 36ecbcab84d0 ("i2c: xiic: Implement power management")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 4c89aad02451..1d68177241a6 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1337,8 +1337,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_pm_disable:
> -	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);

Good catch Jinjie! Applied to i2c/i2c-host-fixes.

Thanks,
Andi

>  
>  	return ret;
>  }
> -- 
> 2.34.1
> 

