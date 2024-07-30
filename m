Return-Path: <linux-i2c+bounces-5089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6C94231E
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jul 2024 00:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 817381C21535
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2024 22:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4731917D8;
	Tue, 30 Jul 2024 22:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toTl3Ykp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC461145A11;
	Tue, 30 Jul 2024 22:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722380035; cv=none; b=lFNRg0O+UgPPS0IIBa9xL8CpQp5XmARgQp8iQIjlT677ds/8VfLmfV1AzN4Q0I8JtU+jVrSGcH7tkQ2m2y43iAok8vjscRqIJmpdsMLV+FG1wonUIrJJ3s+CHk4UkAGrZXhtHXANLjkgE6FeXQVQ3G4nfsK3NXBtMstRWrVwXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722380035; c=relaxed/simple;
	bh=HpXhV53Er0DLqL6TAISGEB0zOD1kAAYMDSkgzUGihCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntazAFaR7IPVulR4xIXsG6EE4K22lq9V+DsiiFcD7R0BuSrV0eimZJ1qM0Cxx5fLrreSFn8LX2eAtF7Bb8mueTSpY8VWSrX9HOzeOJgYaxNIVp9tzTF2V+qYaY0HAuFmQDds3Z10M2phv2vi2cDIyVLxC2fRJttfsXxZlYs1gqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toTl3Ykp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEF2C32782;
	Tue, 30 Jul 2024 22:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722380035;
	bh=HpXhV53Er0DLqL6TAISGEB0zOD1kAAYMDSkgzUGihCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=toTl3Ykpi6+D+r6/A1EbVI394RDQsGwlgf0Z29mCPKp8NZesVf6UjD8Weq5WgJDkW
	 +A0xGQNhlt6mJQ/vDYltwYNI71+AzlFI8GCKLp6GH13Sy7ZpV/fnZwot1Sh6BVOWVM
	 7NpJBWq881oEq0zEu/HmABcNPeQ6M+3cAMEGpmx2vjMUgmknKkO+kdSyu36czrvExL
	 yWEIo4/EiYAqfRHQ40FmRa9CcLl0KzFClMIzKoP8iB3BGA/WDDbZ/hxGK9aBj1pnzn
	 VT5Oa2aiZRsQwe4H52ly7wMTbd8zPtF5jpNks3wCGR1ShTVTALCbHon5S33tDwWEOL
	 c4NnWxoZ6U1IA==
Date: Wed, 31 Jul 2024 00:53:50 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Baruch Siach <baruch@tkos.co.il>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Vignesh R <vigneshr@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: don't use ',' after delimiters
Message-ID: <emgv23ln3n7kut7pc3xj2xynge3arjmeddhbd5jowsp62t4k2r@es6i352stdpk>
References: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Wed, Jul 31, 2024 at 12:01:59AM GMT, Wolfram Sang wrote:
> Delimiters are meant to be last, no need for a ',' there. Remove a
> superfluous newline in the ali1535 driver while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> @Andi: These changes are super trivial so I put them into one patch. Let
> me know if you prefer broken out patches. I think it is better if it
> goes through your tree, but I can also take if you prefer.

It's OK... I will leave it for a few days more and then merge it.

Thanks,
Andi

