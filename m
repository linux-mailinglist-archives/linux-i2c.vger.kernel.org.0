Return-Path: <linux-i2c+bounces-7314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C0D997758
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 23:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A32B21DB8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 21:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1C71E1A36;
	Wed,  9 Oct 2024 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFEuVeCv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B342119;
	Wed,  9 Oct 2024 21:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728508623; cv=none; b=pOAfgwRhc9IaSFkykqHUFPKuU5YhNW+X7gnU1X7G1ofdy/zgfBQuhbny5z3wewjPMfTLg0zlibSP171MHDmgDpgVvg34YwDKvc2hzieP7743x+kzeJttPC2ZvXqA/+4w6utzEy+Q+NJ9t41Gmp7pnhIrHa+jYcBSw2LMKUm4MX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728508623; c=relaxed/simple;
	bh=6uPEEux9dVSbfdFsuNQDuMdavJdAA8IW6x6/6G4B9Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snpDtHpY4C4tc3zy0qCOxAXpJUHgFn09E+JSsjWceKVBLzoqEuhM6fr7sfLzQHSXNbAp1ADD1AU33lYlj37RNaOgm8si5zFc4pVcKGhW2mVE82ujolnlQd9jr5mQFzSUf/iopT7bkC/dHZMJTswvoSt41vJbD5S6gsu+zzVz3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFEuVeCv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDCCC4CEC3;
	Wed,  9 Oct 2024 21:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728508622;
	bh=6uPEEux9dVSbfdFsuNQDuMdavJdAA8IW6x6/6G4B9Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFEuVeCvmpscAH9jE0r84dyBT3N9IGMdelQ8e/jtsrSXeFsoqbbzIOz8p2GQZAfGM
	 +i6di23xnM9jglRaD7KUQbQeXI7qR5OsthAzItogxLRv2b7e6710y0caE56xW1ZVH0
	 7iG8+9x9VfPjIiWx59tK/roTgWpFGV3gSNm6HhEM01ix08NgP2vomqkIxIWB4STgqq
	 hYDhNZerO24hn34UYLRJz9aGZr5oraifVFsWeyuik/U4RbKRP7baoepHG+ODfVLQvf
	 xtnk3va854z+Ye43Wv2/iqGK1FyyNXwuNGucJMRXhL+SwtDTlLltTrHm3fVYmxbNTa
	 b1n8sSYTG4hvQ==
Date: Wed, 9 Oct 2024 16:17:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: =?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-arm-kernel@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: i2c: nomadik: add
 mobileye,eyeq6h-i2c bindings
Message-ID: <172850862096.731062.11255027381297807098.robh@kernel.org>
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
 <20241009-mbly-i2c-v3-1-e7fd13bcf1c4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009-mbly-i2c-v3-1-e7fd13bcf1c4@bootlin.com>


On Wed, 09 Oct 2024 16:01:07 +0200, Théo Lebrun wrote:
> After EyeQ5, it is time for Mobileye EyeQ6H to reuse the Nomadik I2C
> controller. Add a specific compatible because its HW integration is
> slightly different from EyeQ5.
> 
> Do NOT add an example as it looks like EyeQ5 from a DT standpoint
> (without the mobileye,olb property).
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


