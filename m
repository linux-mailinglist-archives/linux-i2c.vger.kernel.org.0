Return-Path: <linux-i2c+bounces-14381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5ACA0893
	for <lists+linux-i2c@lfdr.de>; Wed, 03 Dec 2025 18:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A25863009114
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Dec 2025 17:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66510347BD3;
	Wed,  3 Dec 2025 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojmrsYt4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15670331A46;
	Wed,  3 Dec 2025 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783503; cv=none; b=LiyuLMVRdm49SGwC/eGZHV2GNRYo3qX4qsMJfCQGl+1Z7MGLvg+BgfEkoeHLeaVSaV6wQB3K5zS6Tr8VDIeJx/oo+O4PbaK2bBBIgbXSA6ZZw5UUF25M0Yh00uzls8mu1jLLKZUa+MngrrU7WqVYrPUVX/+niGtUIXzE1D2CVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783503; c=relaxed/simple;
	bh=RzEw6BWOmV1DouIc83EocSU3SyBmZSD/eMwaVfr2Hug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCIO3Fep6oYNieZoYHKXmXaPb0iXveLS4aA3mSzBCecLqk2Nn9/gTwSzV/6NE+vhbu8xOzmxLSoQ6GjbWQrRd8exkJksJmFFvb3bMPfywGWKmS2YbVsmh3X0k8ehUjiriiiBtlxvgSvkkZICyyGv43v6RMHR/XuG5cPwcSyTZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojmrsYt4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64A7C4CEF5;
	Wed,  3 Dec 2025 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764783502;
	bh=RzEw6BWOmV1DouIc83EocSU3SyBmZSD/eMwaVfr2Hug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojmrsYt4tU1v0zhscwtLSTwQuVCJPRgbn4LY9xDKbRowzHMgYmX/kab34H3TaP0tX
	 NiVCHJiq+y9dNzA7osRRr6UJSrBN+ikL/gFPazuzVFseiwGA3niS9zR7hkwtbE90fA
	 E85toTr1RNP09HBYXqEKesoc7oGLKubT4RFY+GUVXSB3hddaS0YjlRpT9ejWhs1vn3
	 A7vY9QI1vOpMP0CJq9g2hpbBDrJfIGxjHVGP5qdX+sQzkQtqdvGYR4byGnnO+W74Aj
	 eqUtTnvqt4zXbyhW9kvVuLA8tfMxgUuiRvmkepurBuqh3bTIEa43+jpU4wNiyIburw
	 Zkg6FmWvcEslw==
Date: Wed, 3 Dec 2025 18:38:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast
 warning
Message-ID: <iwix6mjanmhqzuwunt3ium3cuuicfvdypvylykhm62mrwp57dg@fmuq6f7vmrcw>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzk,

All three patches merged to i2c/i2c-host.

Thanks,
Andi

On Wed, Nov 26, 2025 at 07:22:58PM +0100, Krzysztof Kozlowski wrote:
> 'type' is an enum, thus cast of pointer on 64-bit compile test with
> clang and W=1 causes:
> 
>   i2c-bcm-iproc.c:1102:3: error: cast to smaller integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> One of the discussions in 2023 on LKML suggested warning is not suitable
> for kernel.  Nothing changed in this regard since that time, so assume
> the warning will stay and we want to have warnings-free builds.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> kernel_ulong_t is the preferred cast for such cases.
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
> index e418a4f23f15..b5629cffe99b 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -1098,8 +1098,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, iproc_i2c);
>  	iproc_i2c->device = &pdev->dev;
> -	iproc_i2c->type =
> -		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
> +	iproc_i2c->type = (kernel_ulong_t)of_device_get_match_data(&pdev->dev);
>  	init_completion(&iproc_i2c->done);
>  
>  	iproc_i2c->base = devm_platform_ioremap_resource(pdev, 0);
> -- 
> 2.48.1
> 

