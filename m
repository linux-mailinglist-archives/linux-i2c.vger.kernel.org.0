Return-Path: <linux-i2c+bounces-7872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 579939C0CA4
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 18:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CF81C224BD
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 17:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D66215F4D;
	Thu,  7 Nov 2024 17:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uULRFAyY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289EC20EA31;
	Thu,  7 Nov 2024 17:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730999675; cv=none; b=YFe1y3fOIImFIvachRFvqNMsCawSYl0xq2Mdd5LkfVr6PLs2Qkyg5fy1ESIlX0ugFJgaoyOw0oNmlz+lTGqKXkalSFRy8cx5qeea211bmVq6LegY/vgzRZfw8eKk0+3CKco2qT67rBlM9QVv2yb2zdTz/qrQoCJEiVr/aJcpQik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730999675; c=relaxed/simple;
	bh=s8InXNkjz+RkUSdZrAGt/lVrdMO2Ugj4585SCiiIGnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGtvoDkcM3F1rp/eHbOcBX8qEXONsIfaPoihf5dd7SKtCmQD4fyY+ozHhG7y1tcpG9qLPLpeMMT1wT73b1DEDjqCSuSUbbLXvBMl/fIRQb39aB6aaPe/B8sx5HcQDciMJWfjRfjIsj64dAxPcFtQQ7I/1mADaVrHLSfOczzxF4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uULRFAyY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBD1C4CECC;
	Thu,  7 Nov 2024 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730999673;
	bh=s8InXNkjz+RkUSdZrAGt/lVrdMO2Ugj4585SCiiIGnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uULRFAyYrsXZSdU8EBd42H5ClcH6eNbSP+EnWgaSm7492MWFWK3KMnPnhGTIDzQf2
	 IyfN6k257RmMUOVv1BdgEblo345mSGQ8oD5237eR10/eOfaxAsa4gsZ8jUjXQAzq5D
	 w/PCSuyFRX4bhW3rErWih/xCW6GM/yk43zoloW6T0ol+pg3aJLO4u0EW1gvsLacc6+
	 t5crRtPYvbvNhhBwD52rQfLnlKJJ7FVGvAuluQxPKpWyZPxrTjH82pUDfgF4O4ZzwF
	 eX1rjQcdyd6kJTvNtVqSMq+FDF9MSG4w3/fpnElokHNAC9lOK9sx0NpHvDWKGAHR6F
	 IjPppmTEvgsmg==
Date: Thu, 7 Nov 2024 18:14:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Igor Pylypiv <ipylypiv@google.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: dev: Fix memory leak when underlying adapter does
 not support I2C
Message-ID: <jc76qean5mqxba4nh5qdocxhl5aa7r4epryyviqkyktbu6grog@u43wzsaki23k>
References: <20241107014827.3962940-1-ipylypiv@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107014827.3962940-1-ipylypiv@google.com>

Hi Igor,

that's a good catch, but...

On Thu, Nov 07, 2024 at 01:48:27AM +0000, Igor Pylypiv wrote:
> i2cdev_ioctl_rdwr() receives a buffer which is allocated by the caller.

This needs to be a bit re-written. In the commit log you should
describe what the patch does. You are telling where the buffer is
allocated.

> Fixes: 97ca843f6ad3 ("i2c: dev: Check for I2C_FUNC_I2C before calling i2c_transfer")
> Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
> ---
>  drivers/i2c/i2c-dev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
> index 61f7c4003d2f..5d15519ef737 100644
> --- a/drivers/i2c/i2c-dev.c
> +++ b/drivers/i2c/i2c-dev.c
> @@ -247,8 +247,10 @@ static noinline int i2cdev_ioctl_rdwr(struct i2c_client *client,
>  	int i, res;
>  
>  	/* Adapter must support I2C transfers */
> -	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		kfree(msgs);
>  		return -EOPNOTSUPP;

Please, don't free it here, free it where it has been allocated,
i.e. in compat_i2cdev_ioctl().

Andi

> +	}
>  
>  	data_ptrs = kmalloc_array(nmsgs, sizeof(u8 __user *), GFP_KERNEL);
>  	if (data_ptrs == NULL) {
> -- 
> 2.47.0.277.g8800431eea-goog
> 

