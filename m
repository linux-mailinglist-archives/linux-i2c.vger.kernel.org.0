Return-Path: <linux-i2c+bounces-5551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D42957594
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC1F1C23050
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1BE158A37;
	Mon, 19 Aug 2024 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glyyYZ5k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACB49627;
	Mon, 19 Aug 2024 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724098991; cv=none; b=e0BT0rBvarWzD/QtAK7aTx+g4v/VrZJI989mturqHoAcaW4BwRQ/i8QMis6ajKECLZX4mesxCRoDq1iyi9Jt0JpyNeq27MNmPS2BFARx32J0dqY4y+4iGk3BIb1P2frSG2DT5vHXU6U8L25a3zfpYfE9V5FKOOUulscJw+X1qKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724098991; c=relaxed/simple;
	bh=qgOnWKyhE7TZ0F0VP20FkdBXRSgJ1ZWdDXyyfz9CUow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnrTXXRI76jhsCUxck83pisDSmNcKVhDvUC6TdvkkmR2mYgzaqWUAinVvZzsINMwm1gJG7R5PK2re8jiGVbmBq8YvZShzOSTla7h11nAyhT7c7Ius2mkimXIH3UynK4HuKl90qRowEhxtyBhKDKaRe7RN61lcIDGRA4o0KOD1U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glyyYZ5k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037DCC32782;
	Mon, 19 Aug 2024 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724098990;
	bh=qgOnWKyhE7TZ0F0VP20FkdBXRSgJ1ZWdDXyyfz9CUow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glyyYZ5kSiGAYrbMuzCqQVIVlfxLIkKT/S4IDWi5ytmOh5OaHaIeRZJgPW5WIBpc9
	 vp2brNu80de0uAbRVtDGO1XP/sikvAbpNa3OCtn31lj6d1OjI9xglYFTx6fokN6m6R
	 iznwanI6J922p3KsMhiJ1BAekvG4FWpYsLBL256y4G+1Knbgk2rkQ+lngIUQGyU6R5
	 Q6hvNpqbIe6eyQasojUbhlATpO+dX/FgCqp8r9vW3upkHGMweAp4cT9LDlQFM82Dqn
	 KU8RHLj/2eBB3g/7zXDhn+wPK6+0M/kMIT2m8cNFCdYWjFrarIWuvb7M0bJQPNl8Hb
	 M03OZmwo/KK0w==
Date: Mon, 19 Aug 2024 22:23:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 00/11] i2c: riic: Add support for Renesas RZ/G3S
Message-ID: <gc3fqib4iflzmwu2wv33436anbrfywxoj5p7ah3m67sqp3u4h4@2ttbj7kgmjyx>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

> Claudiu Beznea (11):
>   i2c: riic: Use temporary variable for struct device
>   i2c: riic: Call pm_runtime_get_sync() when need to access registers
>   i2c: riic: Use pm_runtime_resume_and_get()
>   i2c: riic: Enable runtime PM autosuspend support
>   i2c: riic: Add suspend/resume support
>   i2c: riic: Define individual arrays to describe the register offsets
>   dt-bindings: i2c: renesas,riic: Document the R9A08G045 support

Looks good until here, do you want me to apply these first 7
patches to unburden you a bit?

Unless Geert has some notes on patch 6.

>   i2c: riic: Add support for fast mode plus

Small things here

>   arm64: dts: renesas: r9a08g045: Add I2C nodes
>   arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
>   arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node

I'd like someone to ack here.

Thanks,
Andi

