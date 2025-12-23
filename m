Return-Path: <linux-i2c+bounces-14741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB692CDA125
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 18:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EEF2302D5D6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 17:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFFD346AEE;
	Tue, 23 Dec 2025 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="ydfrMiRj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9DA20FAB2;
	Tue, 23 Dec 2025 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510060; cv=none; b=vA6z6f2/e3YGVv/gaqwgbM5NDiWn5xtRbNc0Vdma8c6AziX3w9WdkYZdS/Y2Oq+rp9Yl295xWJC9PW/fe31hThG3fMxN5tbpGfxda2DhbsFybxRnRonpkb4b0bo2JFyecu+2A/8ql87EKDL/dlodg0mPrSf0GsPTsk+j2R0vR7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510060; c=relaxed/simple;
	bh=UiD+mo4KWYQpL9n9yd6wrVdCrMqYILRaDGBsoHNKJ2c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2UA01lfa8Bi6/oEIPkpdM7vWPHqHUYYBHeyZLHMTqg3r7fdjcYv3QG3ySH2nEyNs65/s2/tQZmy6KeD6iEc7n9p3MloBUj/10H4JDhAXo8jJ/rhbRB/q5xyKX1cYYTa7oUvsgqIZMPhzt8TC/23jyHGNXVY5AYIvJ1FlLFcvQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ydfrMiRj; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=W2QYj+Rp/ihQDRGeJxJWo7r32vv1mpFGwwybC+Tpkcw=; b=ydfrMiRjmmu47GyHyrYMYssfkJ
	HMcK/nzzXAgAFg3OTFQs7+aVFPGNiepo0KKdNVp9MhlTYE8XTq1euoC2O0S0c8SxyGepYV4BiEiNX
	W2UNq3AcPHQwbhVj+YaIGNoKK+H1ZzdsMCxPUZhP5p5nTnfBz3iZ3bnb7A2eU44bgbLbDabxF8KKD
	XOG9hzQkMoaQ2ub5lCTcF2UcM21MWJwJY1XsfDyFWlV9SrwFAzF2u7aKaxHI4/RPIza1tE0SV7Yom
	TolVoDNd6GD9w56z/QL3+6HrQSMQM24VqWDUP23VNW1H2ENDElUJrkb3hjpaAvHM2L8RRI3WcDZW6
	BKMfj8VA==;
Date: Tue, 23 Dec 2025 18:11:43 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Vignesh R
 <vigneshr@ti.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton
 <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 4/6] i2c: omap: switch to new generic helper for
 getting selected mux-state
Message-ID: <20251223181143.10d35211@kemnade.info>
In-Reply-To: <20251210-rz-sdio-mux-v3-4-ca628db56d60@solid-run.com>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
	<20251210-rz-sdio-mux-v3-4-ca628db56d60@solid-run.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 18:38:38 +0100
Josua Mayer <josua@solid-run.com> wrote:

> Multiplexer subsystem has added generic helper functiosn for getting an
> already selected mux-state object.
> 
> Replace existing logic in probe with the equivalent helper function.
> 
> This change is only compile-tested.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>


