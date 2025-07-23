Return-Path: <linux-i2c+bounces-12009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECAAB0F468
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 15:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 529F23AB41B
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 13:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B222E88A7;
	Wed, 23 Jul 2025 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0tkOPL1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F303F2E8885;
	Wed, 23 Jul 2025 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753278439; cv=none; b=RAtmdS5MrSqZNeVVsLJ6rw2hL6CVKkYOCyF3rOqks8xsmP8kEh6l1eLwcvnd38j/bs2zviSPqQZAPqSKKD7vUbMJinarAj6Gl4hf8EcKL78v2KBzonHQ9DX12T36S3swc1ZhT3g6kLHLshxKPzj1C9vGjqAcRLVjDbZa59AaA14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753278439; c=relaxed/simple;
	bh=mDf9hGRa+hZOj+1JrXcwZtqq2caWcW+UkVVFTPkikUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJ9I6eFBQABo+4PguuFlJeCgI+TdHq7RLbEKGssMKzS+v3SSkvyDEcfyxuduaC61WAJPITTtqd+3dJebO12Z4w+1NLo/iGzIg53UO4laZeTyApzO0GS62Ss9Dbe2Faq0SkUJoeDzBaMs9D9+hh5K7DXdsWhi33XUjGEJk4xJioY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0tkOPL1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F62EC4CEE7;
	Wed, 23 Jul 2025 13:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753278437;
	bh=mDf9hGRa+hZOj+1JrXcwZtqq2caWcW+UkVVFTPkikUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0tkOPL1ASB54sO5jqP7x9+WdFZC59SO7sY4RYhnU5AOW06Ba11S8nQQgcq/qvy4K
	 tjCVdaZHfYr/pr6eLE8g4wP20uUvKGTwjop/mcO/8AXyGkuJPZZQr9czN5VblY+3XI
	 pVPrVn27a7B+PCMPPmV1dDk2XopBsMfwzV6lyjQInjWCLgjDbC+PiQA5oG9oyqnKXy
	 jV1U2nW78n2WeNNLtScDG+Qos/tnaEFoYK4TAZY/mmmGmmHu9kf6KYQRIu+mIRIpsM
	 zfmU5Bvr/rW1PGGADs+SVjUydWW3De9gkmOZNLGZBqcqkFabZXtbFv64FMAOihOOlv
	 10o65FCTGsWng==
Date: Wed, 23 Jul 2025 08:47:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: linux-arm-kernel@lists.infradead.org, Yao Zi <ziyao@disroot.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: i2c: i2c-rk3x: Allow use of a
 power-domain
Message-ID: <175327843600.2144777.12217048091920354736.robh@kernel.org>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
 <20250723085654.2273324-3-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723085654.2273324-3-jonas@kwiboo.se>


On Wed, 23 Jul 2025 08:56:44 +0000, Jonas Karlman wrote:
> The I2C controllers in most Rockchip SoCs are part of power domains that
> are always powered on, i.e. PD_BUS or PD_PMU. These always powered
> on power domains have typically not been described in the device tree.
> 
> Because these power domains have been left out of the device tree there
> has not been any real need to properly describe the I2C controllers
> power domain.
> 
> On RK3528 the I2C controllers are spread out among the described
> PD_RKVENC, PD_VO and PD_VPU power domains. However, one I2C controller
> belong to an undescribed always powered on power domain.
> 
> Add support to describe an optional power-domains for the I2C
> controllers in Rockchip SoCs.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: Update commit message
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


