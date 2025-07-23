Return-Path: <linux-i2c+bounces-12011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8978B0FD0B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 00:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 139C1168A39
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 22:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE28248897;
	Wed, 23 Jul 2025 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKTw81ZV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40048215F4B;
	Wed, 23 Jul 2025 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310713; cv=none; b=IWTKFMXxmEAozv/JYk0QOTm2RPE2ukLvBw9j2HyJda+rrHS9sxHAqqOUrxWYHgxy7GIKQwi2E7rtZFPcGZHL2TrJJLCQOai6r2lNBWpEpI3cOyERxclKjjeDXjgpNI4w7UchEqNQGlH/klE2Rd58tRT8xsZx61M+VaVrrC4T/Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310713; c=relaxed/simple;
	bh=nTH24QInstBeSS9klIPJ9Tu6HAN40AwJTI9RN1z/Fy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q5MITn5GDpmJc6s1unV5WnbN/gMqaSgPtO+ZrsHB8/QNd3cDE0VJK2C9yuTlzCGzdGWX+mGNASEHPjJ8nBcN+26jFWG9TNc5ZKR5FwMLHMRa5VNRsgimitYdsrHklByXP4IJ8+YwN4EEg6xxlGmbEY4pVKOjfG8SaE/4HtxaiEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKTw81ZV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B87C4CEE7;
	Wed, 23 Jul 2025 22:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753310712;
	bh=nTH24QInstBeSS9klIPJ9Tu6HAN40AwJTI9RN1z/Fy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKTw81ZVFdjj3tth36AXNrQ9C7QjHe9ODLhBLwnYa1BdrNrfc2puj2As/ssrX2huQ
	 V8jFST94jYBYC8wjxyblaHYVUkkwpBXRv0fRPsDLE+LQBJtX+w0Yy7ZqYTF2Ejeoge
	 6mM/e4SBpDTRu+CGv1F3kAnWaqnsKDMRMrB71P+Ifrr9KdOm+mgIaXT56y14wwS0G9
	 LSsNfm5Oc+LiAcdUisYrdOBo3ViQ2xpguhq/bBCxmjH199jag9FvJOxp6wPTNzeXOC
	 A68WTAySVdqetVcts88Q0hC3WMXfDc3K4u4ERbiXoMLpH7zOnEU/qdD6MLRsaNJsU3
	 JndhPTrDqN2Tg==
Date: Thu, 24 Jul 2025 00:45:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: i2c: i2c-rk3x: Allow use of a
 power-domain
Message-ID: <os7rxycm2tsganlvrffxvkcnkj2dcccsfcfxv6mhesvekeu6wb@ui6msrjmgtai>
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

Hi Jonas,

On Wed, Jul 23, 2025 at 08:56:44AM +0000, Jonas Karlman wrote:
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

merged to i2c/i2c-host.

Thanks,
Andi

