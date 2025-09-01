Return-Path: <linux-i2c+bounces-12551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E5B3EF45
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 22:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE12F2C112C
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 20:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3251F263C91;
	Mon,  1 Sep 2025 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFPBz21S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC135898;
	Mon,  1 Sep 2025 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757640; cv=none; b=TxfnTxuN+e1nkjIuOLDbsVjX7tDolbOBFCWDFq5PuuiAf7P2ETxP/efC/bs3yDZpAlw9m+AyW2v1W6OUUtEhDzZiq8XJTEs0eEBVD8sxpKzPruFAkBgPtUR1xWZRCzmgN9Pc6oEHIbPq9f4NBcyOBWTVlHs9m0MB0t2PhFp4Bcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757640; c=relaxed/simple;
	bh=xfKFW3dT4DK2EZgjD9Ro60zpauMsomYjUMvOcPcR4R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucg15tYiCaudodaQF05I2qkLDIQH0YbVRBK4nEJSmON0eFbkhtRbsHXMU/ikFc9Requ5t2X6dMA/9frON7fmlqBHlL/KXoXhKzQ5SoOOokbRB3lef/nJLI9HykQVBaPJaB2MA3VM7x8poLVv0ygL1PCxUtasGLteU1ZIeCty134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFPBz21S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906AEC4CEF0;
	Mon,  1 Sep 2025 20:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757639;
	bh=xfKFW3dT4DK2EZgjD9Ro60zpauMsomYjUMvOcPcR4R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFPBz21SGiBLttw1RgpyCzlDm1CUmvNxIwlEAUxspRmU8G7dZPQ987Ws51uwR3SSw
	 UHZ2c/g45PxA1rxetxW7+cs5Bzb3TAehqj+jd3IesTqK53Nf6Jr1YGBmtmbQCJFFtr
	 3o45o6nqFqjA9VTrkATtiyv0NMZVDkQaBg36+iqIxqlAG1KkA2DE4+cDZotrao3te/
	 +x0IJbrTXO0N5ctf3UsQRWrIEGi5BkwI0JwsFd83vxV7CUlbPlC9SW1Kpfg4xKZeky
	 BsFHGEarm+QCOrn90NiFM2Hth5mlY2gJeNj96oQJryIrTYWqu8mpzVTjXfHLXWYhay
	 Nv7/unNEQMKOQ==
Date: Mon, 1 Sep 2025 15:13:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: samsung,s3c2410-i2c: Drop S3C2410
Message-ID: <175675763746.266549.18104876330796347730.robh@kernel.org>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
 <20250830103601.82046-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830103601.82046-4-krzysztof.kozlowski@linaro.org>


On Sat, 30 Aug 2025 12:36:03 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C2410 SoC was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


