Return-Path: <linux-i2c+bounces-10888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 918ACAAF769
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 12:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC491BC3965
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 10:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A381C84CD;
	Thu,  8 May 2025 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bB4zz8a/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5D2CA9;
	Thu,  8 May 2025 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698777; cv=none; b=qlBYImGaVHXy8LD4Sd3+FWPfPaarDlK8nINj15U9aj5XJa+lHJnhAKIjc/0bn2Ds4dOlGuWbjP1KbceFd/8EzL4si5ZcuuOSkYFsHFWEmivIe54Y0ZTIij8LbTgZsZzur/p/509hKd5oam7o/pmLs40jYbpxRgwRZ8SmJUqnOP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698777; c=relaxed/simple;
	bh=+1pEXBF1258Pp3PHELU63IN7LmoWKBY6nfm8mVmjdgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcCBJP9nlsxDMvT2PqlpuMx4276Rvzkz7vG24KJol032y/xiaaHt7+cqCuDxIaBgy/Jkn560h9gxddBTODbnhDt7wbUxbMNvDsK1IXxhHFQADsA2ucr0EnczSoPau1UO5JezC+nbZl6pqaCWi9DXlrmqz9PpN9z25rFP9Jhf/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bB4zz8a/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C79C4CEE9;
	Thu,  8 May 2025 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746698776;
	bh=+1pEXBF1258Pp3PHELU63IN7LmoWKBY6nfm8mVmjdgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bB4zz8a/5Igoir8crk0ufxo31bjqgP6jQHtIhQU3eYTmZEGf/0RVswVyzgGmis+zr
	 U2FA4G+7+5zpLlWQrmlprvLYOsE951EoQXvoYQLpddp8DK1q8+ESqYBbviotOTgVDB
	 Hu0FuozZXblN45WyHHDbublcNN9p445quyIZGJJMWnwAvoj9mvonbybQJMBEDasI98
	 ZTBJJgtlYCtQEwmjc9eSr80GqLe6cttCh58ywjVqklKy26FKICFTtbzku7qsh2RWTn
	 Q7zKZvvETNOzgu+W3oS19ki1tRaiIt7rkHCvuhvLPKQM4fV2S2XbHYhjQcyNndkPX0
	 U9TVjxDKKWuKw==
Date: Thu, 8 May 2025 12:06:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Venkata Narendra Kumar Gutta <vengutta@amd.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP
Message-ID: <xndngewp6cursdet5hjyz6an5us2yzy2b4r2eje47dzkl7bjwx@4iuvxf3764mu>
References: <3888f892b8c4d8c8acd17e56581e726ace7f7092.1746536495.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3888f892b8c4d8c8acd17e56581e726ace7f7092.1746536495.git.geert+renesas@glider.be>

Hi Geert,

On Tue, May 06, 2025 at 03:02:06PM +0200, Geert Uytterhoeven wrote:
> The AMD Image Signal Processor I2C functionality is only present on AMD
> platforms with ISP support, and its platform device is instantiated by
> the AMD ISP driver.  Hence add a dependency on DRM_AMD_ISP, to prevent
> asking the user about this driver when configuring a kernel that does
> not support the AMD ISP.
> 
> Fixes: 63f0545cb1bf0840 ("i2c: amd-isp: Add ISP i2c-designware driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

merged to i2c/i2c-host.

Thanks,
Andi

