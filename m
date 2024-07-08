Return-Path: <linux-i2c+bounces-4779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4F92AC4E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 00:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CEB1F22C41
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 22:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA73152176;
	Mon,  8 Jul 2024 22:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHgp85fY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19E56452;
	Mon,  8 Jul 2024 22:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720479389; cv=none; b=WZSfql/4daQu2YAuOroz9dbhJUdHFCx061J/8JbkcaVTK24RRjjaZEMc6VX/fn3kOBJiOaFvk1VvoVQc/dwiV9qGnyiGyjCkixYuApwditDCUivXKbojtgfpknHN0YRIZfL93KN/XNfmF2rr/MPK+8xa/Zg4skplukToU6OVgqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720479389; c=relaxed/simple;
	bh=rlZAk0kZAJiaCngMbVFik5uVJ1rapRR4BRamWVIq5gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2NL2SZ5zyP0U4OxOdpcubgQM9p/dNYFQUXWuG/nvdRemynQ54Dcri8b3s4OYQT2goWpOqRAVZIFV5fguhZKIwWLW5ReROU2aO912DURFIOo5Imys4grSSz1v7tppnMz4rtaO2QFpMvruK9N9cb3ELhdYgrf4pE+bxdf1Zsa3hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHgp85fY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F199EC116B1;
	Mon,  8 Jul 2024 22:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720479389;
	bh=rlZAk0kZAJiaCngMbVFik5uVJ1rapRR4BRamWVIq5gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHgp85fYv8pnhCLOvUenNezIYXWbyJzF0w8HGxxu4W3p0wAAhJS+O+RVpRfXF7ruy
	 CuVt3V8M31ioa6R9EYHkNjnaemYzkOmOW41/s552jI0XYXp4BH4htWwl6iCkTpagPO
	 XukmWEGj6Peq6rVGW9LOS2DOVRSwpSBePlLLBiCns2Kj1ZDzGNaOxbcGJOkgKU4GVp
	 6xXBW6DcsMzK4ycHIay0yQnswhOo2cslyXS7dLcsjC5rC103aKwniqOMGLIFEASxgi
	 kpax8lyBUyirtTeAiCqUp9nrBF2KXCHgSxB+Nv+gqogR8xWCvH7Qvf9rhSkPg6Xu06
	 TJ59A7KdVeVcg==
Date: Mon, 8 Jul 2024 16:56:27 -0600
From: Rob Herring <robh@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 1/8] dt-bindings: i2c: add support for tsd,mule-i2c-mux
Message-ID: <20240708225627.GB4092671-robh@kernel.org>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
 <20240708-dev-mule-i2c-mux-v5-1-71446d3f0b8d@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-1-71446d3f0b8d@cherry.de>

On Mon, Jul 08, 2024 at 06:12:12PM +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which devices that are reachable through an I2C-mux. The devices
> on the mux can be selected by writing the appropriate device number to
> an I2C config register.
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>  .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

