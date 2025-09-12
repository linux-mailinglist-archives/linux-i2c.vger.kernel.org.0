Return-Path: <linux-i2c+bounces-12936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB809B5595D
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Sep 2025 00:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B4951C2712E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 22:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE361258EC9;
	Fri, 12 Sep 2025 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Um4WpDQH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE56B19B3EC
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716915; cv=none; b=ohoP11WLqcgeWa/6eKPOut/pSCRx+TNJS7WvoYcCkwKdUXsbRbgIPABfX0zkchSfBew6q/FNIRp8nM4X1AWViaqkIKSSBA9K8T26s0nyh+743DI5hazh3SbrTbaD43QhWpKbSu5spqnUQeMoIFLupELatMiPpETrBW6ZjYg/5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716915; c=relaxed/simple;
	bh=41CPMeB5cMst8rFTr0hIwHXN/45oJmRQ3gqFpa1x3y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GthLg7y/YUOJRyMuC3wbZ0/kUQ3243G0eWcwN/T2tTMDCnLrn9l3PM0O/qplGG4SPpS2Ocy4P8C1hMUQxyKTgKKJtVFlWvu/GmHDKUebPGd3ZSvkVEr4yxLddYheNaog2ymU8pbOpiavigSUYjaskwxvIk4XZrh3+YTB/kyseM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Um4WpDQH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=B7vC
	Hc3e+Jy8US7hTTy4b9nsVzGf6UZv+0sVA7/a1y0=; b=Um4WpDQHJJyoDGQGUJlI
	toL1eJ4r/frk7kDy23UEC+FfwIbkQz4MH6fuLgWvXFnQduOCP5AoGVhUs39qkWr3
	9ylizJqtxlvx0xAlC/TQCGxQ8hsYkxw+hVAf6f6dLucBZTPJdQ6qEJ1wAYsPd89B
	t1ZkgBrTCdMg5XVpi/QmQz7vjWDanBQ6xeBdnj8Z40H9V03PzIYAOiK1Q1NKWXvi
	m8+1B6eiVmNMaemuGDOlZEU7TrGi2cyxePRXVPDRhFT0grEQhbQ2gH3hO1q5lmY/
	uY7NwOdVj651c0bX4GJzSW042wt+udthFxosn9FeRvj/aYA4cD0WuEXRh8H9KbNM
	CA==
Received: (qmail 1506839 invoked from network); 13 Sep 2025 00:41:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:41:46 +0200
X-UD-Smtp-Session: l3s3148p1@rqzUW6I+mq0gAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:41:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2.1 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <aMShqlBgHXHIExDC@shikoro>
References: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
 <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>

Hi Laurent,

On Wed, Aug 13, 2025 at 12:49:23PM +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property for camera sensors is discouraged
> in favour of using assigned-clock-rates (and assigned-clock-parents
> where needed). Mark the property as deprecated.
> 
> Update the examples accordingly. In DT examples where the sensor input
> clock appears to come from a programmable clock generator, replace
> clock-frequency by the assigned-clocks and assigned-clock-rates
> properties. Otherwise, just drop clock-frequency.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes since v2:
> 
> - Don't remove clocks property in samsung,exynos4212-fimc-is.yaml
> 
> Changes since v1:
> 
> - Adapt examples in bindings that reference sensors
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--

Can I have this i2c change seperately to avoid dependencies?

Happy hacking,

   Wolfram


