Return-Path: <linux-i2c+bounces-10924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A89AB252D
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 21:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559FA1B67CA4
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 19:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0146C1E5202;
	Sat, 10 May 2025 19:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI+h+YBo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30F01D63CD
	for <linux-i2c@vger.kernel.org>; Sat, 10 May 2025 19:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746906652; cv=none; b=BYttJSL37eOK8lymFvymw+aGRdj+aVuGSuu2L+9lRHlK77JB1u66U54ZjGtALnvPUaG4VZrnlPiXn+ojgP/olcAQmDTtQQQ+7RRHAnizzNi/d5meJ0o5i3Z6jCiI+XUJzLJDuTBGPLl98ioysVER8dxzZ506cajLcFsbGjLe/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746906652; c=relaxed/simple;
	bh=55E4p6RKxCKEw5duDZUOzMNi2+zBEhTJChIy4pZVDsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2BfRtNu+1YPQxlse0BIZfeOiauSJcdXKeYh7lMp9qFMMNn7d3Q6t1nu2c1LsYp45Lc/L5ddyQjUQjz+DLL6+GVtTzqJ22CBdibDXVB2Aj0Whi65+0ir0UA6PkrznY9wUoVbEEFlnJ2398rnEQ0ggyGzZIsbeY1sz/AvWfOxH/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI+h+YBo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249B9C4CEE2;
	Sat, 10 May 2025 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746906652;
	bh=55E4p6RKxCKEw5duDZUOzMNi2+zBEhTJChIy4pZVDsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BI+h+YBoRHZIt3Jpp1A/zpn8MuGRAHoHhRKy8o1G1pD/H3w1exzTTAq1DnNp6286h
	 6qEH5UuNEj+ixf4t7q56cjAdsF+7LwD1NjuFuax7Y1PB5UMm9mqoBloeYt13kLVhLz
	 oUxTW7BAWfhJcmQD5dR2ghO7e0g10lBJtzmSeDQCjhZzHLjZ6kjJ5tG3B/KX+gQvRe
	 fytqpBeOiE3dMYKUdXQtFDg5LaWz6kh2R6MIbCCj1sd7n+qNdqhRHKwFXn6/jgaJC4
	 xUCGxaUl7xp1nSfBolDIgGcCE0neEPPN5MdSRnDd2wahupXe47dLnVx+lNGx2NSugC
	 tlxTmxRK+r3Jw==
Date: Sat, 10 May 2025 20:50:48 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>
Subject: Re: [PATCH] i2c: mlxbf: Allow build with COMPILE_TEST
Message-ID: <20250510195048.GA1513488@ax162>
References: <20250505215854.2896383-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505215854.2896383-1-andi.shyti@kernel.org>

On Mon, May 05, 2025 at 11:58:54PM +0200, Andi Shyti wrote:
> Extend the Kconfig dependency to include COMPILE_TEST so the
> Mellanox BlueField I2C driver can be built on non-ARM64 platforms
> for compile testing purposes.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Khalil Blaiech <kblaiech@nvidia.com>
> Cc: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index adb2910525b1..9f216d5db91d 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -855,7 +855,7 @@ config I2C_LS2X
>  
>  config I2C_MLXBF
>          tristate "Mellanox BlueField I2C controller"
> -        depends on MELLANOX_PLATFORM && ARM64
> +        depends on (MELLANOX_PLATFORM && ARM64) || COMPILE_TEST
>  	depends on ACPI
>  	select I2C_SLAVE
>          help
> -- 
> 2.49.0
> 

There are 64-bit divides in several places within this driver so this
patch breaks the build on 32-bit platforms when compile testing now:

  i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_calculate_freq_from_tyu':
  i2c-mlxbf.c:(.text+0x3e): undefined reference to `__udivdi3'
  i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_calculate_freq_from_yu':
  i2c-mlxbf.c:(.text+0x8e): undefined reference to `__udivdi3'
  i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_probe':
  i2c-mlxbf.c:(.text+0x1749): undefined reference to `__udivdi3'
  i386-linux-ld: i2c-mlxbf.c:(.text+0x1769): undefined reference to `__udivdi3'
  i386-linux-ld: i2c-mlxbf.c:(.text+0x17c0): undefined reference to `__udivdi3'
  i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o:i2c-mlxbf.c:(.text+0x17e6): more undefined references to `__udivdi3' follow

Cheers,
Nathan

