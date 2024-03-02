Return-Path: <linux-i2c+bounces-2109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A157586ED84
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 01:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AC4AB22423
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 00:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C041878;
	Sat,  2 Mar 2024 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiFmYhpZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F180C;
	Sat,  2 Mar 2024 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709339984; cv=none; b=RTV+IXxFKyI5LG9LnYzoNS1t7kgOBYfMDYKvwf9QYsGFsf/RTfHsHngL5ZA+Jpfc7JrT8CKHUsWI2ZKx2rjk6hiaZ1+jsZ27SeKWUUfaXEWMB8Hc6CalcNdAuhh4CS+ezBt0owgu7WFiB7jUamdAhCtOW8MquA4lg3GKo76LLvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709339984; c=relaxed/simple;
	bh=jyKjPvT/EkJla/5n/qmQEJ23pdly8CYhhVUOSg4aClA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhzKBnqVqsyo+8ymkBTUaE4va7n3EWWnCiP4pa4d/nHpWGc/hJf67cvpyv9QVjFHJ4tCetWZV/yYkD1V0mroGeZwYtJJYpRf9BC+Brw7WKEIof+3TDx9qgXW/3CH/MroEWeS7ryjcbuFWnWAV2dkuMu9sSl3QcHSDGgrvtj+dmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiFmYhpZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C75DC433F1;
	Sat,  2 Mar 2024 00:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709339984;
	bh=jyKjPvT/EkJla/5n/qmQEJ23pdly8CYhhVUOSg4aClA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiFmYhpZjNSKGHgK13j3O4ixxb1b/aST6+7AGT/EFIPL2Ktp/CQqdvZOzfixrMiNw
	 NYS1h5hVOUnPnpJEt4x+7Wgr3R9/3JoZj8jTNqXWMuOwGP2x7pVPnsgA1EprtCSUTE
	 FY/jb0yFSeh/+lDBQKbMZrohKTrl9wmurE4lP0hTAAgBQInK4eE5r8LoQzp4B/e9A0
	 XVR6C8Y+gN/rlcLnCg+45mlhIEBR2DaBPuhOsu/Ji4o6oWgNamMx7rba9RPQj/hedY
	 TRzHgYJc14r4p1OyZQufKX5Xr8qAonCx1J3GRnzL1VkMbF2hat9wn3a18y8ODcmVOY
	 lHncka/Hr5m8w==
Date: Sat, 2 Mar 2024 01:39:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [SPAM] [PATCH v2 04/11] i2c: nomadik: simplify IRQ masking logic
Message-ID: <hbnkcqjgykfzivqvjnr5ixmp57am43mxslfnpxhro27kzd2pyt@q35uhgkxn5cv>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-4-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229-mbly-i2c-v2-4-b32ed18c098c@bootlin.com>

Hi Theo,

On Thu, Feb 29, 2024 at 07:10:52PM +0100, Théo Lebrun wrote:
> IRQ_MASK and I2C_CLEAR_ALL_INTS are redundant. One masks the top three

if I2C_CLEAR_ALL_INTS is redundant why don't you remove it?

> bits off as reserved, the other one masks the reserved IRQs inside the
> u32. Get rid of IRQ_MASK and only use the most restrictive mask.

Why is IRQ_MASK redundant? What happens if you write in the
reserved bits?

Can you please explain a bit better the change you did?

Thanks,
Andi

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

