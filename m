Return-Path: <linux-i2c+bounces-12329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEB6B2AC66
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 17:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79E19167144
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 15:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA10424DD1F;
	Mon, 18 Aug 2025 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzdqxzQx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAD723496F;
	Mon, 18 Aug 2025 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755530003; cv=none; b=kwUYo5MZvZbJD4Wwluy7TfS6/hPXAF5RZoAWyPxwHfDRkZW1HVwWQMan3OktHdiSaTHfvMBs7HgPLGT0/aXADH/mQ1GWLq9Ie69bC6NVbi8NxMocxkLyHpEuuUBZLF8TQuEFhbdmCaR9zpwqqzkRlUCP44qS3punVemY1KuhrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755530003; c=relaxed/simple;
	bh=UCAs4ULuiNhnWYhDghacFMCWQoF1yKcSvAOtsGXpXG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrH2uorF8nQ/I+/lWFCxIB8+UveIB9Q/cvJ/Sa88k4HKlCed7TmTBp0MwaEvwJfmvABTlYmsxWXrgnI4zNTyGjuq7PRmY7b8LGCzfWfBOc5hnsjjPABzi8N/It4Auj2TvnyriJ84I7OyUXcy09UHl2zD/W+Agc2JCpWmNaaNI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzdqxzQx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCA0C4CEF1;
	Mon, 18 Aug 2025 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755530003;
	bh=UCAs4ULuiNhnWYhDghacFMCWQoF1yKcSvAOtsGXpXG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzdqxzQxBVeJeSM1lHDMlGyeMM4eC7tJDQ5AIXiu/fJSG3TXLobnGs6dDLBp686GV
	 t74vsqi/Nuz8+YMY/8F5XjMkETsFpTshQsY7fvlUVlT+OXH/807C9QOCzq03ny6806
	 Ezf/DIujcDsN8o8lLRqfcY2oLlet/B0rLFlocCc1YsteuZZFp3SpQ2h/QQ6mBkFO9b
	 F0+IOWryfD5sU+1bZ6vpQH1fCetiewHRmCz62uBSHvkcS0AYy7gKLD3sCnF2AngJ+C
	 3E9bMTaVXinQI30RN/OI+6cCwWS4SSX0q9Vv7CqtY/z/Zy9W7vqo7vpwGhFvKd2nh4
	 JpKWHzAtHvTVg==
Date: Mon, 18 Aug 2025 10:13:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	devicetree@vger.kernel.org, Harshal Gohel <hg@simonwunderlich.de>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v5 10/11] dt-bindings: i2c: realtek,rtl9301-i2c: extend
 for RTL9310 support
Message-ID: <175553000181.1238221.13542000411422182955.robh@kernel.org>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-11-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809220713.1038947-11-jelonek.jonas@gmail.com>


On Sat, 09 Aug 2025 22:07:11 +0000, Jonas Jelonek wrote:
> Adjust the regex for child-node address to account for the fact that
> RTL9310 supports 12 instead of only 8 SDA lines. Also, narrow this per
> variant.
> 
> Add a vendor-specific property to explicitly specify the
> Realtek-internal ID of the defined I2C controller/master. This is
> required, in particular for RTL9310, to describe the correct I2C
> master. Require this property for RTL9310.
> 
> Add compatibles for known SoC variants RTL9311, RTL9312 and RTL9313.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
>  .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 39 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


