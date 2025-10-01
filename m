Return-Path: <linux-i2c+bounces-13293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDCBB210A
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 01:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D89166FCC
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 23:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75FB2BD037;
	Wed,  1 Oct 2025 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWU31JZD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259C29B8C2;
	Wed,  1 Oct 2025 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759361244; cv=none; b=S1Qw108nnLqxZ0z5phqq3xVsz2vrwvdaQ2F/bcLZCNxZhB4iyyOGucnGP/kgPHupoHIDN2tTRQm9PxSx0pKL4wi7r6woColltQamTHchonB/Ir+jk1jgGB8E2h/Gsx6S98jM4hV4eFNqWquP/OKv2ElbEv2K723pmU/ptkr89BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759361244; c=relaxed/simple;
	bh=mduMZQqMjPoJhKONezcsUhE5uEQzM3rq16kAXsXlO0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuwH9VjU6SUZT14Y1QKrwm1pIfkk18yLIbNg5d2R0kSXKkMC8f6pbsPdAOKcW+g4bDKnX3CmaQ75EMfLrqcQ79379WPPpscn9bxfTSmq1ZNczPAABeRX4UFlNKecEmi8xnBdoXedVQobgd6xBMyNSuICG5da5dbWOIweSIDusEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWU31JZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8249CC4CEF1;
	Wed,  1 Oct 2025 23:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759361243;
	bh=mduMZQqMjPoJhKONezcsUhE5uEQzM3rq16kAXsXlO0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWU31JZDOpR9QNL7V36J8wy1TKYbb0BHSFEhpu58k1nxQf8Z81gtPjnPYlDnh7L+P
	 Xg5UgZCy1yodnxaYx/6Lo6PsNNJTCVpizei+RM9aLRC0pXj+IcgK0DdwHLqEQKq82p
	 fjvHFyoU/XUB7kN1fisR9EUvEp32m0OI8lEI5acgKLJVHpj8oKBOI/2knxPZF2UpjB
	 vOKv0zdB6c1DYsqPUkAa9GI71v2kB/dLoIbkaDnTGc/TDcFUNAVxc7ijpemIGFw4VI
	 mxYhNb3gV3E6lbv/xnRpKpk2wMTASmAoBCIdqLpeZLoJ018RgB6pbO8+36/KqTOn1S
	 o/8s0WX4wHRuA==
Date: Thu, 2 Oct 2025 01:27:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Markus Stockhausen <markus.stockhausen@gmx.de>, 
	Sven Eckelmann <sven@narfation.org>, Harshal Gohel <hg@simonwunderlich.de>
Subject: Re: [PATCH v8 0/9] i2c: fix, rework and extend RTL9300 I2C driver
Message-ID: <kzvtchxd6uchwr2iaiypl66wsnl6zirxulc2szgn7iqukj5v5m@xlqw3odgmjz4>
References: <20250927101931.71575-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927101931.71575-1-jelonek.jonas@gmail.com>

Hi Jonas,

> v8: - dropped accepted patches 1-3
>     - fixed minor issue in last patch to make second master work
>     - rebased on top of shyti/i2c/i2c-host to make sure it applies
>       cleanly
> 
> v7: - included given Tested-By and Reviewed-By from Chris Packham and
>       Markus Stockhausen accordingly
>         - except for Chris' Tested-By on RTL9310 since he only tested
>           on RTL9302C
>     - fixed typo as mentioned by Markuf Elfring
> 
> v6: - patch 'i2c: rtl9300: check if xfer length is valid'
>         - renamed to 'ensure data length is within supported range'
>         - added I2C quirk for zero length as suggested by Wolfram Sang
>     - reordered patches to have backport-worthy fixes first and
>       enhancements/others after
>         - patches 'fix channel number bound check', 'check if xfer
>           length is valid' and 'remove SMBus Quick operation support'
>           were moved before all others
>         - added CC: stable to first three patches
>     - fixed commit message of 'dt-bindings: i2c: realtek,rtl9301-i2c:
>       extend for RTL9310 support'
>     - added a patch to use guard(mutex) instead of explicit lock/unlock
>       as suggested by Markus Elfring
>     - added Reviewed-by: Rob Herring ... to dt-bindings patches
>     - added Tested-by: Sven Eckelmann ... to all patches (except the
>       new patch in this version)
> 
> v5: - added more patches to fix further issues/do further cleanup
>         - remove SMBus Quick support (not supported by hardware)
>         - move setting SCL frequency to config_io
>         - only set read message format (RD_MODE) once on probing
>         - add check to avoid len = 0 being allowed as length
>     - adjusted cover letter
> 
> v4: - fixed an incorrect check for number of channels which was already
>       present in original code
> 
> v3: - narrowed vendor property per variant to be required only
>       for RTL9310
>     - narrowed usable child-node i2c addresses per variant
>     - no changes to driver patches
> 
> v2: - Patch 1:
>         - adjusted commit message
>         - retained Tested-By and Reviewed-By from Chris Packham
>     - Patch 2:
>         - simplified check as suggested by Markus Stockhausen
>         - fixed commit message
>     - Patch 3 (all requested by Krzysztof):
>         - use vendor property instead of generic
>         - add front compatibles to make binding complete
>         - fix commit message
>     - reordered patches, dt-bindings patch now comes before its 'user'
>     - properly add device-tree list and relevant maintainers to To/Cc
> 
> ---
> Jonas Jelonek (9):
>   i2c: rtl9300: use regmap fields and API for registers
>   dt-bindings: i2c: realtek,rtl9301-i2c: fix wording and typos
>   i2c: rtl9300: rename internal sda_pin to sda_num
>   i2c: rtl9300: move setting SCL frequency to config_io
>   i2c: rtl9300: do not set read mode on every transfer
>   i2c: rtl9300: separate xfer configuration and execution
>   i2c: rtl9300: use scoped guard instead of explicit lock/unlock
>   dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
>   i2c: rtl9300: add support for RTL9310 I2C controller

Thanks for resending and sorry for lingering on these. Merged to
i2c/i2c-host.

Thanks,
Andi

