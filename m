Return-Path: <linux-i2c+bounces-12342-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4AB2CE80
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 23:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C15A4E2B0A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 21:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1DC3451B0;
	Tue, 19 Aug 2025 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r3d1VArU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BAF343D99;
	Tue, 19 Aug 2025 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755638936; cv=none; b=Qa6G3qrn7wnP630M3cn1fK5QYWuaURXDpugOMa5tRbiuXilVSYM2wMQ3aG1zQmfDT1PxpjPO4K6Qn17V2sfpjNdPkHufPBItiTAbs5rKUeLnw9SupU3m6s1PJrmkb/WYxAAHkQLE0qcZkrXWYljsP96pymS16wzFIs6Ogk4PJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755638936; c=relaxed/simple;
	bh=UXnRb7ueW84O4fCrVk1HQwhQucxOKfe8NmEqnIv8GjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUgD6X5dBttb5RB12ppB1C9KvE/RjORgDZ9SfVlCHMgC0QIwyJeYf53hKcSAN0mcKY+i8yi2v9LBV7VW2ylxm7dDx1h4dE4gZdODER/K2rUtD3dwFrD/NnI3gdtiwxMQRkX5wu0seXhLid7XGpYJm9f9/6GupONG3GVL3Hrshoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r3d1VArU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6553CC4CEF1;
	Tue, 19 Aug 2025 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755638936;
	bh=UXnRb7ueW84O4fCrVk1HQwhQucxOKfe8NmEqnIv8GjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3d1VArU1nYH+4ijJgtN6Weg4cjVSP2ELS2L9CrP7vn4qYh4ZVE2LvgG55uVxtlMm
	 LPgSL9jhEWyBaoFAudfNo76H7X2JyWwSocIhsVtGS4yp12BaWI7G5QQ0WsC8HVI5KF
	 66jUQNZYr38xTcIHO8YqHqrnArWXbeBohzFHW5TsaPEqH6E6WgYMPvYaLU4UBG0/Ck
	 lxQ2x5//+KNjFfjhOfL18ZT7td1GabryhKrRl1yKwrAE9KP+gvnQbYBtHFBd3bEYJ/
	 1Rxikg9hWY0UgtWpaDgElU9E4j0osqrb5R31LIBtf7eWMOetHB2X6aMk0EsLYrF3qb
	 /rvSTZElRZR0g==
Date: Tue, 19 Aug 2025 20:28:51 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonas Jelonek <jelonek.jonas@gmail.com>, Harshal Gohel <hg@simonwunderlich.de>, 
	Simon Wunderlich <sw@simonwunderlich.de>, Alex Guo <alexguo1023@gmail.com>, stable@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v5 0/5] i2c: rtl9300: Fix multi-byte I2C operations
Message-ID: <a422shurtl3xrvnh2ieynqq2kw5awqnmall2wjdpozx336m26i@54ekftmkwvrv>
References: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>

Hi Sven,

> Alex Guo (1):
>       i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer
> 
> Harshal Gohel (2):
>       [i2c-host-fixes] i2c: rtl9300: Fix multi-byte I2C write
>       [i2c-host] i2c: rtl9300: Implement I2C block read and write
> 
> Sven Eckelmann (2):
>       [i2c-host-fixes] i2c: rtl9300: Increase timeout for transfer polling
>       [i2c-host-fixes] i2c: rtl9300: Add missing count byte for SMBus Block Ops

All merged into i2c/i2c-host-fixes except for patch 5 which has
been merged intou i2c/i2c-host.

Thanks everyone for the reviews and tests.

Andi

