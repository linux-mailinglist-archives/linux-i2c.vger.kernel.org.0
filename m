Return-Path: <linux-i2c+bounces-10944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DAAB47AD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 00:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC97E3B6332
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 22:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B98B298CD5;
	Mon, 12 May 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJj6YK/5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1319CCFC
	for <linux-i2c@vger.kernel.org>; Mon, 12 May 2025 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747090543; cv=none; b=mbcQcnzj98Rlg+Q0qFfPvBMx4Uj/Eoy8P6NZQTVuP7Rg7y+0KdxXbQfN/VGwNviquKMLKDMsnZ7MYNJ2UWfiMnAZkeFg4PNb74HmLc+ppnJvMmJd3uKCih9uSZBKpWEMuq9AVi00w/2kCWswj96SLK+liAvwMgVfG7hI/apO4/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747090543; c=relaxed/simple;
	bh=zX7Zxo8tacP9VJatjUsrN+OG7Zmi6amLmud9mQ5Vtqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/M2QmIDms+sN+uDFLqPYYDHZo3vbrsXt6wdyLKqZxNG19lofcOd/mpxSJNPz45gRFM9wsuT65BQVRZX62jwRjld4tIzCIZ0JH9iJ5PrwazVRw82SV8AS0Uw2/M/NxSM66FVk5cppCzrmjIr6d9tApDnMdkvDetvtu97LSZmXrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJj6YK/5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2768CC4CEE7;
	Mon, 12 May 2025 22:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747090541;
	bh=zX7Zxo8tacP9VJatjUsrN+OG7Zmi6amLmud9mQ5Vtqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJj6YK/5lsdEVmwTBuubPOj0B8k8EXn2TbYse+mzQAYw9HiNEpUAxJIGJwI8+z6ax
	 JFp/BLKepLhl3LhRhKLNGDi9p3g9zCUiTK3fJCoMQzqowO6QJV0bP1Q/bIpkzXwoVL
	 U8pG01qt+Sz1D4mnWcxSRywjGmb1NsrZn+opa474J+7be7L2xgF2Tgd6povqBUWh8T
	 tUoBuOXKc1lscTmjEgcIbX4pPGEwvCpN4F8dIKUbYniq5wu66Ujoq9XSkboQRhvw/J
	 BntHgnYYsHk4zLscGP9npMSPzFyqC8iXNm788v/NO6pJn2azE7jWC3Qqf9+XoYRMtz
	 ixb1ef0tzMFVg==
Date: Tue, 13 May 2025 00:55:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>
Subject: Re: [PATCH] i2c: mlxbf: Allow build with COMPILE_TEST
Message-ID: <nmc7hrecn6kvpffe4exoed225iydsaridrccalbb3o6bioo4ec@vdlmlhn3xuwh>
References: <20250505215854.2896383-1-andi.shyti@kernel.org>
 <20250510195048.GA1513488@ax162>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510195048.GA1513488@ax162>

Hi Nathan,

On Sat, May 10, 2025 at 08:50:48PM +0100, Nathan Chancellor wrote:
> On Mon, May 05, 2025 at 11:58:54PM +0200, Andi Shyti wrote:
> > Extend the Kconfig dependency to include COMPILE_TEST so the
> > Mellanox BlueField I2C driver can be built on non-ARM64 platforms
> > for compile testing purposes.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> > Cc: Khalil Blaiech <kblaiech@nvidia.com>
> > Cc: Asmaa Mnebhi <asmaa@nvidia.com>
> > ---
> >  drivers/i2c/busses/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index adb2910525b1..9f216d5db91d 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -855,7 +855,7 @@ config I2C_LS2X
> >  
> >  config I2C_MLXBF
> >          tristate "Mellanox BlueField I2C controller"
> > -        depends on MELLANOX_PLATFORM && ARM64
> > +        depends on (MELLANOX_PLATFORM && ARM64) || COMPILE_TEST
> >  	depends on ACPI
> >  	select I2C_SLAVE
> >          help
> > -- 
> > 2.49.0
> > 
> 
> There are 64-bit divides in several places within this driver so this
> patch breaks the build on 32-bit platforms when compile testing now:
> 
>   i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_calculate_freq_from_tyu':
>   i2c-mlxbf.c:(.text+0x3e): undefined reference to `__udivdi3'
>   i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_calculate_freq_from_yu':
>   i2c-mlxbf.c:(.text+0x8e): undefined reference to `__udivdi3'
>   i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o: in function `mlxbf_i2c_probe':
>   i2c-mlxbf.c:(.text+0x1749): undefined reference to `__udivdi3'
>   i386-linux-ld: i2c-mlxbf.c:(.text+0x1769): undefined reference to `__udivdi3'
>   i386-linux-ld: i2c-mlxbf.c:(.text+0x17c0): undefined reference to `__udivdi3'
>   i386-linux-ld: drivers/i2c/busses/i2c-mlxbf.o:i2c-mlxbf.c:(.text+0x17e6): more undefined references to `__udivdi3' follow

arghh... you're right! Thanks for testing this! I reverted my
patch for now.

Thanks,
Andi

