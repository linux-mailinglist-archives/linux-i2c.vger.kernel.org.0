Return-Path: <linux-i2c+bounces-7315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E699775B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 23:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 514EA1C218C8
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 21:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6851E1E1A13;
	Wed,  9 Oct 2024 21:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcHnxDZ6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209F019C563;
	Wed,  9 Oct 2024 21:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728508661; cv=none; b=lm9R3VThPAmIktM6DJhMEf3ETYfOC+Td8MotGA3XgwWExEHWi9/gUeQ2D+xkSeI/eiOmmrhmMv1VYWde1ouIu+sAO7+uTfAipn9tyvmVXnL2c0E4WUiw9PV17jq1qN0pLzhOpTExa7v8m5rnHFM5wa0DVvKpnLA/OIE+vEYo5OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728508661; c=relaxed/simple;
	bh=PeGgpuw2h6B6d511IkUAztNTH5VoRqnb1sCSe1yg7II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmPX7ep0l1AKjTc+dhaE0a02FJqRHE2IjRE+NKU7cHsztto1Pz5lPHbLmbNMEar3Sdag7N2GqEqLevRKNmJVewEs9kFoJN0p+qOZYHaewj7+LY6whVD3RifkclHElZJIXOgJZbUxJiBi4un8E8uEMAdODVprT+bWlyJTC01RHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcHnxDZ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE11C4CEC3;
	Wed,  9 Oct 2024 21:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728508661;
	bh=PeGgpuw2h6B6d511IkUAztNTH5VoRqnb1sCSe1yg7II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcHnxDZ6AchLwju2OZlF2O6JJ6z+34uayHJpJWMt0wYuFduAkaAVDXq8yM/ttujwX
	 pKHS/qFT9tqo3eJs5h8Zcv9pHpsBSmiyJoo1Igpriiyrm8Fh0aVx3Nrd8FXxDQlUqH
	 u8pEQ6wSbikWHKUT/hUcjWtbxxAkF8Kx8kPgpmLYDWF3Avh29VFmVHxFmppPeOq4xA
	 aYO7c26aE45V9aB0f8H+4v3BWGJnUGHcFw6gCGZZdfF8srDwHEbohxJwMyDTSfGsK1
	 ISxvMeLRd6Ti8NiWSVZbiQQ+eFGaWLgWg1AAqLQUgUw1KKFzVFQU3TSXi0vnJt11x/
	 q0cTTkj+LZkUg==
Date: Wed, 9 Oct 2024 16:17:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: =?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	linux-i2c@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: i2c: nomadik: support 400kHz <
 clock-frequency <= 3.4MHz
Message-ID: <172850865946.731856.7512114270634333579.robh@kernel.org>
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
 <20241009-mbly-i2c-v3-2-e7fd13bcf1c4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009-mbly-i2c-v3-2-e7fd13bcf1c4@bootlin.com>


On Wed, 09 Oct 2024 16:01:08 +0200, Théo Lebrun wrote:
> Hardware is not limited to 400kHz, its documentation does mention how to
> configure it for high-speed (a specific Speed-Mode enum value and
> a different bus rate clock divider register to be used).
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


