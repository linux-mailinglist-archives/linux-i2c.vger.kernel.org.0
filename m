Return-Path: <linux-i2c+bounces-9300-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1209DA28581
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 09:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B313A1916
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 08:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C10229B33;
	Wed,  5 Feb 2025 08:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLmmQolW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A5229B0D;
	Wed,  5 Feb 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744024; cv=none; b=SuI5ajBHi7VVgFdV5gtNs8BzwpjzH9yLY6VHZbeN3qFDO3G/enKA5cscl6wiNJ+1bX5MOnu2ouabUP4Nr6YSp5l0OoXXPCiRgJFTZNpBAZsJKdyyd5EwGiYo97k2QfdMp+lXBfdR/nTmdAuU5WoWE7mJEjmNIrkbe2P0rlLSw/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744024; c=relaxed/simple;
	bh=fYIY2EVBNOIAb8SVUkw/eXZE0aOWEkEiJNpdJo4l7fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEHI7O2uR2DA+OnjKOzmm+LSY1tWiya8SIeRO7jBIigNM/Sw4U5eCQY4VS8hM41EEIYnB6ColjCirevLU/qKCtZ4Vt0Vk0NOsV0o/W2Cp+pah6PwAJ/NFoag2/5+IDFtUGyLzdr5UkbyqnJQkf7KZi6yRl/8reeS9YsQgGsSCZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLmmQolW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E18C4CED1;
	Wed,  5 Feb 2025 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744024;
	bh=fYIY2EVBNOIAb8SVUkw/eXZE0aOWEkEiJNpdJo4l7fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLmmQolWDqSbEZsNHmMnGiosQPzZspePvQTDKKov2RufVKPNlM7hclKPtyYnGR+9C
	 xGSYj8rNGJd8Sz/lf996VNRwMgn7Ydd11CUQ6cdkIIOc1vew3OeU72GrI7v//TvXsC
	 oaUthW3V0ZKNP8qsibVWEw4lql/e8oznkipVd26Z65LRT5m1ZJ/tM4GKBD7/BZ7/Ad
	 nIhAwTyvTaquLZPluDntegKrEw6F3pKR1hYfqQ8GBqlLDuf+jFe4Wuwex77xBsdtHO
	 9msIzeHDQ2nsnzAFOEQe7Ad//ZpgM/A6op+sSk+jAFvvwEeTmhjU+o0VHSuVo79iUw
	 d2ZgRpUB0norw==
Date: Wed, 5 Feb 2025 09:27:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: samsung,s3c2410: add
 exynos7870-i2c compatible
Message-ID: <20250205-whimsical-industrious-vicugna-3edbda@krzk-bin>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
 <20250204-exynos7870-i2c-v1-1-63d67871ab7e@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-i2c-v1-1-63d67871ab7e@disroot.org>

On Tue, Feb 04, 2025 at 02:03:32AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870's (non-HS) I2C controllers are entirely compatible with
> samsung,s3c2440-i2c. Document Exynos7870's compatible string
> appropriately.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


