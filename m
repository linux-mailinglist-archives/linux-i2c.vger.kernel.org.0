Return-Path: <linux-i2c+bounces-10434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FAA90D5B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 22:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9695C7AF733
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 20:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DA223BF96;
	Wed, 16 Apr 2025 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W36KkY2E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECC238C2E
	for <linux-i2c@vger.kernel.org>; Wed, 16 Apr 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836168; cv=none; b=f1kVgSZQNq6NOeavGCFXHyn5lqw8kvZVJis/QVVqveTn80xqNsMCr7aE0oiHdmduIUMa9AvFKLSOKAArETkh/avjmKs0QW6xovOKmo28vOP24FQQrzGQzMZWIpcfvHxhU2Vys5WFincmUbmeOSDgznORbisFhpq6NKR8NZdxfyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836168; c=relaxed/simple;
	bh=aUt84t8XnWv8zs4QC3FrBfu2gK4jDeUs+7ZO/7Cx2So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGl2prx2z+jBMAg/AnlxqRA5hXzSil606R7hohydnjC7FOyH8IOmNI3Y0GUwSfVOJoZaOxEHvymH+Q7YOpFMZOme4x4ZYMxvC17s1xGXe7ts7etDpE+iRqiRdDOq/DWgcjUCvsEWp8/n0MSqmQv9Zh9bpy93uBTLD5aAXp3bqoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W36KkY2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09131C4CEE2;
	Wed, 16 Apr 2025 20:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744836167;
	bh=aUt84t8XnWv8zs4QC3FrBfu2gK4jDeUs+7ZO/7Cx2So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W36KkY2EIzsSlwIlDRRDy8mzcaUuzTCVPg64b2ihi5TK4Q8uEOmsIgbI3TRJXGzcy
	 jfx1eGT8sKJyJ+gR51kBDqnKkPNRgEzZ4e33W3UkhOhU/U7vGcO8xzLtMOnA2/E4NJ
	 8VcLRXSOHtluQZjGW/Y0lsq2TMUiTZRF8EUpumGK9qfp7NqSVhTSmALvzsv0ink4IG
	 fpH7SKlU8RoIgRb2PBYAf+91XOafCh23cA3kgOdipXRbwycZB18CM+peQm3qkRY/W2
	 UgE/p4Sb8ZXxcOXPD8oMVzNpFLEwF+b6GNLAOjtM5DeSnBTYyZqz7UU/tudcxy2+iK
	 9kCK9qiFyb3EQ==
Date: Wed, 16 Apr 2025 22:42:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Enrico Zanda <e.zanda1@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 04/10] i2c: viai2c-wmt: Replace dev_err() with
 dev_err_probe() in probe function
Message-ID: <rycxzatwyq3yoavajz533xv572sjshv7xb4ps2bdmainul5sex@mxfk4lomxqvt>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
 <20250415183447.396277-5-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415183447.396277-5-e.zanda1@gmail.com>

Hi Enrico,

...

> @@ -139,10 +138,8 @@ static int wmt_i2c_probe(struct platform_device *pdev)
>  	adap->dev.of_node = pdev->dev.of_node;
>  
>  	err = wmt_i2c_reset_hardware(i2c);

reset hardware is only called by the probe, so that inside reset
hardware we could alraedy use dev_err_probe() and...

> -	if (err) {
> -		dev_err(&pdev->dev, "error initializing hardware\n");

just remove this printout which is redundant.

Andi

> -		return err;
> -	}
> +	if (err)
> +		return dev_err_probe(&pdev->dev, err, "error initializing hardware\n");
>  
>  	err = i2c_add_adapter(adap);
>  	if (err)
> -- 
> 2.43.0
> 

