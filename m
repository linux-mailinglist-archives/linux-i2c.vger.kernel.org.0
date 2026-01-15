Return-Path: <linux-i2c+bounces-15195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 306ECD25642
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 16:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EC7730CFAA5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 15:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981623ACF1C;
	Thu, 15 Jan 2026 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDE0zP5A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582873009E1;
	Thu, 15 Jan 2026 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491069; cv=none; b=HF1q+CRHlYsJS5t8UJLK3PJBmJm6RiahqSD+CrtUxgEQq4p1eTNUDmpu+ny7x6Kj7UuezMRlq418XRjHS0OxqgdLcfyMpY26qmY4lDGKs7qf9OXfx51pNJeBRy7n6FUBip2IpqVIMgTrP7/PCPLq9aBL+iP7nk3U4719hqS/p7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491069; c=relaxed/simple;
	bh=jU8ASm4NXUrmCL8l9JFWkAyRljXX2GMBYXvcGizejBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mtm1eWUiIlye5Yz0HKZTmG9kDu24qFtl9UoFWEEAcluIxlbeAHgtR7HOH56tK3LNGmLZjXqn2GM+9lJrNUgCKKa8eMGPrYWKrCbNs4bJs+PBkoiOszpMGM1Kc3nZjsmSNrIf5yn5odHhrhM0bnc4lAzNiDhHo0QmfMJ/LnBjd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDE0zP5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5EDC116D0;
	Thu, 15 Jan 2026 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491069;
	bh=jU8ASm4NXUrmCL8l9JFWkAyRljXX2GMBYXvcGizejBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDE0zP5Ak1m4vaZNwi8vZDfqExQ8nVbCNDN4JN30nXyOKhbcg3ZUbRVtlxgj7Ci4z
	 olLDodvRJeMfY/07bMnxjUZ3sWxqINgDQ0g7c0gCvJmCWQ/+rvET/+s6Bt/OgRODbQ
	 xTGppXkr7WDzFhAgLCxRgxhK1PMnUO/qeO2UCvZFEyuTSCn4fbnNPCrvK0v9CVWEQ8
	 XlU4boa5YYWAXp3iA8yJZz75PIJAecGM5NMFz+lUdDJlHvkJCWFWlY5LXddhU059sr
	 5vQLykxco4tVSMERg2QTro6p42YG7uvnHevCG1uj36KwHNHT0Yc3zUOF4isX01ILGR
	 cYGa0R6hdrHOg==
Date: Thu, 15 Jan 2026 16:31:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-i2c@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: exynos5: simplify probe with devm
Message-ID: <aWkHI_dBwPuKo-Qr@zenone.zhora.eu>
References: <20251217204944.10862-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217204944.10862-1-rosenp@gmail.com>

Hi Rosen,

On Wed, Dec 17, 2025 at 12:49:44PM -0800, Rosen Penev wrote:
> Cleans up probe a little bit and separates preparation from enablement.
> 
> Also use devm for i2c_add_adapter to get rid of the remove function.
> 
> Fix return code for failed clk_get_prepared. It returns PTR_ERR.

The patch is good, but this commit log is messy. Please send a
new version of the commit log where you describe or list things
you have changed using the imperative form (sentences like
"Cleans up probe a little bit" mean very little).

No need to resend, just reply to this email and I can update the
log before merging.

Thanks,
Andi

> Signed-off-by: Rosen Penev <rosenp@gmail.com>

