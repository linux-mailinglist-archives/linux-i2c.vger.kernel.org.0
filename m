Return-Path: <linux-i2c+bounces-2267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB3875AD2
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 00:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB4F4B222FF
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 23:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2AF3D549;
	Thu,  7 Mar 2024 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpEsJGHq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73423335C7;
	Thu,  7 Mar 2024 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709852665; cv=none; b=At4Fv/gSby+sT25P1jlIpDwBEv7EBItZHnHu6fz773XMCOCPxL2QeDulZMOkNXRiB3XnZFhAGwvBj9kUoIWJir6QZiOG2NORIe2/cIFjeaI2y6YL5l1bLB5fRYoR+7lI6sHVstzZpIp223YEF2BpVMo+kRWo8DxtLkquIOszTwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709852665; c=relaxed/simple;
	bh=DbczkzaJ/zVwOH/cmYk5kfCegYn64EBBaWeS225JXyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqMEom6h20wE1TQZLtUoik3ne74NYlciZToTamG3OdDd/1ifZ00F1h8nl3aTaCoiCbPDKa62L/UsfmpXOdoicuykg2ARhyFp8YBcNSH/F29e5OC2n38AHgVIQN/wK9y6ge4IyU1VxGKIWaOpN3lb6UyoVW9AJ6kSKRwCptBIiXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpEsJGHq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38828C433C7;
	Thu,  7 Mar 2024 23:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709852665;
	bh=DbczkzaJ/zVwOH/cmYk5kfCegYn64EBBaWeS225JXyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpEsJGHqAnxaZYLi2aIxnNiD/GovnhqIBT4sBgW3fjYxnD1poGQHNV8tyfilWxkys
	 momRdp2cmFgTmMsEeDXVlGcbSFmRIawDyouF9mMm/uZZIPU15QCWlvHFYu+858FNyE
	 31LLmPXgSYMnvCTRo3q86qAxCC1NP+BbjNZJC/0GbHdOuHZAlhSfEATlHjMxMnv9rH
	 5rocXxA4u6nRiji+n0yqVRC/goIdrtEllmsU33HXt0dOj9xTrAZIZF82684iRd/43K
	 lECfPybYr1KT6SZjNmxdgYBvip85ZReI87Fh9Dm3z/YVK+Nd+Yjmju6L5bFkpy3MnG
	 xMdRaAHRL9z7Q==
Date: Fri, 8 Mar 2024 00:04:21 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 04/11] i2c: nomadik: use bitops helpers
Message-ID: <jzevi2wh4v4c3qbkth55oa25h3taa4vgzvbokxp4wfaf577vw5@zrf47mxdqihp>
References: <20240306-mbly-i2c-v3-0-605f866aa4ec@bootlin.com>
 <20240306-mbly-i2c-v3-4-605f866aa4ec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240306-mbly-i2c-v3-4-605f866aa4ec@bootlin.com>

Hi Theo,

On Wed, Mar 06, 2024 at 06:59:24PM +0100, Théo Lebrun wrote:
> Constant register bit fields are declared using hardcoded hex values;
> replace them by calls to BIT() and GENMASK(). Replace custom GEN_MASK()
> macro by the generic FIELD_PREP(). Replace manual bit manipulations by
> the generic FIELD_GET() macro.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Thanks!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

