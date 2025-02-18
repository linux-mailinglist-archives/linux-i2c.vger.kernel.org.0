Return-Path: <linux-i2c+bounces-9486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E8A3ABAC
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 23:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1BA97A3218
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 22:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF60C17A306;
	Tue, 18 Feb 2025 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLtI10uE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB962862BC
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 22:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739917847; cv=none; b=b5vK5h5A44CwXAe+RNkwZI7aRsuuRgkOEOD5DBZO3gEkw2joUxcgrb3PM2VMjhaExoZcWtzU4w50JlHaf+biyrapV9OcImBDSfQNJefwUP1xUBHe5/13Z6xq2Jt2jEcMhM6eA2wkHci7AtciGn1NEVIGomCJFnREl5iQcwR7IP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739917847; c=relaxed/simple;
	bh=tNHeb6edtLGBpo0sOGUFCfqhsSa8O8VwZ9ruR6sAETk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWdDZlLnfUfYPMRutMg+FGaqy7TiRR7fArqgbkR/26JM5VRhMWNnfr71vqG5/KGmcaBqCEa/6C4IWfdDsncwufzYV6RCSWImHdDbrlnzlcY8pJwTQvFm6X7eiZWyOou+iFoh5/HGGfGUlJz42VIzgPScm35Dv8XNgLajPys0jlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLtI10uE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7ACC4CEE2;
	Tue, 18 Feb 2025 22:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739917847;
	bh=tNHeb6edtLGBpo0sOGUFCfqhsSa8O8VwZ9ruR6sAETk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLtI10uEJIr6YuV8wFG1bNi9MXSEbjdt1Gjs8kCdRSCRW7qb/9jHBVJGiJwnxNd4u
	 VxSOtdMXODR1CdPR5V1QFpB2+fq/qbBjoxW0O3wA45yAXQuwsQtpzLHVIUndxqQuob
	 U9kZAtZb0/cps5dKsS4dtXbdOhUO6KQ92BV7pZGzHgMPNR5xrldrrwkxALXbhiu3kd
	 gu/XjO6Eu4diKeCeMDslux6d4aBkZKG+Ay2laR/JkTUBy5U4AgGFbOBdyK4FzOSfbM
	 abXlcSYMiGDpPhHG7BLp+mkHbYX6URofe58uMXhH+RUTKw1XKhwSBAM3Bm4qVfO01U
	 3/sChMqQKfKQg==
Date: Tue, 18 Feb 2025 23:30:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	Sanket.Goswami@amd.com
Subject: Re: [PATCH 3/3] i2c: amd-asf: Clear remote IRR bit to get successive
 interrupt
Message-ID: <bpgx4co5tpmeycqo73pu2ystlw4umnqsblpxhgbiz6dieegjvg@rewe6gyo5e7b>
References: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
 <20250217090258.398540-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217090258.398540-3-Shyam-sundar.S-k@amd.com>

Hi Shyam,

On Mon, Feb 17, 2025 at 02:32:58PM +0530, Shyam Sundar S K wrote:
> In order to get the successive interrupts after receiving MCTP packet,
> it is necessary to clear the remote IRR bit by writing the interrupt
> number to the EOI register.
> 
> Fixes: b1f8921dfbaa ("i2c: amd-asf: Clear remote IRR bit to get successive interrupt")

how is the current patch fix the one above?

Can it be:

Fixes: 9b25419ad397 ("i2c: amd-asf: Add routine to handle the ASF slave process")
Cc: <stable@vger.kernel.org> # v6.13+

?

If that's the case, please resend just this patch and don't
forget to Cc the stable kernel.

Thanks,
Andi

> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/i2c/busses/i2c-amd-asf-plat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
> index 438db5a9d0ed..ca45f0f23321 100644
> --- a/drivers/i2c/busses/i2c-amd-asf-plat.c
> +++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
> @@ -293,6 +293,7 @@ static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
>  		amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
>  	}
>  
> +	iowrite32(irq, dev->eoi_base);
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.34.1
> 

