Return-Path: <linux-i2c+bounces-4944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561D92F2AE
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 01:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01435282A0D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 23:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D0915AD95;
	Thu, 11 Jul 2024 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqtAbveb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8976034;
	Thu, 11 Jul 2024 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720741142; cv=none; b=pXUmp9EYq+KhRQk0XL+zJ6fbpp8ipctfqk3/HvpSZASFNx/TowG8BNcRBFaMCw6tiDTTMxtDRgl3/S9f6+6ISs/UqENmWz7895Cm1Bpc8BdDjwEXKTTkxg4MaNXDs/aFTlwEGIPaomusqaXZ4qf8woLCBew/p/u212nkifIbbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720741142; c=relaxed/simple;
	bh=Yk7HUr5GQdgB02Nt1DDc0rXfh22Cpu2JKupZSKBHLOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0PpAVftiIfvx2J5vk4crOUfkmHS+s8Vvr0OsNVqiqTxuJJjRtff/MeKeR0E8KY3Np2xpBYOnAyTrkWjnh62Xbhj6NORkNjOh7DqGDXf1YWrP0mrzEXvPVIZBj6XhIFNwMFMpIXxzHSgVRcd5rG3KoGrPuHukeVZA77yeSHJZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqtAbveb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DACDC116B1;
	Thu, 11 Jul 2024 23:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720741142;
	bh=Yk7HUr5GQdgB02Nt1DDc0rXfh22Cpu2JKupZSKBHLOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HqtAbvebFFypxquvSGVV1iT8R+y1E80OfCi1Ddu3BRDWHaHTTB6AK1ON9gSgiHJP6
	 QhG6b8Ur/3LW4S27kYkQRDN6MioPoE1W8ZMovrWCEAwQHiOuPHHhcq/M8vGieMT6+L
	 tBPWvdhgI+nlKBd9DbSKXqiFdh4jy0/tEV0yqYlKvwrAS6m38PE/fOCGcNV0G6r9J4
	 ynlNkCklFbQ8TuCCqs5TCmLcjTZ9ngG7YzOt9uqDSwmBpJHDx9l1Nynm2am1/NM0MN
	 65sLeiDpPEAMNJVNMYjJyeARKhK+pJvKZ3v1zCHHRG3M0X4GkjBp/85c+rtkoh9f+b
	 j7KEvxWaMyTkA==
Date: Fri, 12 Jul 2024 01:38:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: nicolas.ferre@microchip.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: at91: Add sama7d65 compatible string
Message-ID: <pivsmeqh26bdicgonegmrnmrzvzojznizewbmo3nseesx6lllj@mnxk7ot4b4mp>
References: <20240710162615.332888-1-nicolas.ferre@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710162615.332888-1-nicolas.ferre@microchip.com>

Hi Nicolas,

On Wed, Jul 10, 2024 at 06:26:15PM GMT, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Add compatible string for sama7d65. Like sama7g5, it currently binds to
> "microchip,sam9x60-i2c" compatible string for this driver.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

pushed to i2c/i2c-host.

Thanks,
Andi

