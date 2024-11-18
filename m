Return-Path: <linux-i2c+bounces-8031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F929D1BAF
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 00:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A111281F87
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2024 23:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6823D1E7C3C;
	Mon, 18 Nov 2024 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEQ8vphv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5EE153BE4;
	Mon, 18 Nov 2024 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731971226; cv=none; b=VZaCbwdltJfK3AiCEiV48ChE5VSne0xP9JJIKFf79Bs00Aj4Gn+MOBPuHENLck7BneJaac1jiw4hGaq8DYdTT33qAsISEFFPwOekqaMqvwXa+BKwObeMbVaZ+L1Dikb7MOW0j918lHoeNIf3WYbVAg+J6UXZKelxTuExQ9ayrx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731971226; c=relaxed/simple;
	bh=fh5vfCSCeb43TV7A2AsjLqNdJNOU6PnEihKyQ0nQZ/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsM/V4DjzJZOKCjpF37o6uO56OBJ9akIjeErsIHq/YkiPl9NTK9ICWVLqNfRb4PbMnLaEkWXTilVHm9Go0kg0rtSaQsOMFi1P/XLX22ouE1FKAWbU9hzdhlVtSoR/9bnjl+yl7a0zVk3jafGH1Jb50hI7n9lU3kLKReuO4J5aRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEQ8vphv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94574C4CECC;
	Mon, 18 Nov 2024 23:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731971226;
	bh=fh5vfCSCeb43TV7A2AsjLqNdJNOU6PnEihKyQ0nQZ/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEQ8vphvSV9M2xhI6pJFo+o1vvf60WfjuFvPo06MLXAoQWvNgLjQsZQv6s7hL7dG0
	 /iGDEI24WczNIPkOvUaTut/JsIddtlTRH5bZFKvAbo7rNNvIpNV7vGYzoDhxy24biS
	 8SdnWloKmuOQheu5jeJtBiYGiFGyS5YolagUrg6nULepY/zCecRROUIJHdC4IphWwZ
	 6j6y9G4fAr5d6FhpBiP2ZzY1rHIGF4QmpGCP0pTK+rjjUtctlcEfkh/IKg01pgJyfK
	 S07nUMpToQ+jdVF2fOF94bK/bCzj66k40aaLWWQNarkVYo+6573W4fpYOHaX6pq/Gj
	 68Sb9Cyti4UvA==
Date: Tue, 19 Nov 2024 00:07:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/14] dt-bindings: i2c: mv64xxx: Add Allwinner A523
 compatible string
Message-ID: <vwwxve2juvplj7m6tvdmhmui32nrmjxslpxs26jyyb5r3mvspr@5xvvn5edr5bw>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111013033.22793-6-andre.przywara@arm.com>

Hi Andre,

On Mon, Nov 11, 2024 at 01:30:24AM +0000, Andre Przywara wrote:
> The I2C controller IP used in the Allwinner A523/T527 SoCs is
> compatible with the ones used in the other recent Allwinner SoCs.
> 
> Add the A523 specific compatible string to the list of existing names
> falling back to the allwinner,sun8i-v536-i2c string.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Just this patch 5, pushed to i2c/i2c-host.

Thanks,
Andi

