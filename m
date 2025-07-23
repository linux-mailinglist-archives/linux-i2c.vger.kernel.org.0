Return-Path: <linux-i2c+bounces-12002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68068B0ED08
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 10:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 809E53B9836
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 08:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDFD279DA9;
	Wed, 23 Jul 2025 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccSo9uzS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C9B17BEBF;
	Wed, 23 Jul 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258815; cv=none; b=QDWZDt0vDbzEjMI8lIpSkm8VmOi8JeqH9oJ9W1oktc8l78Bmyd8QU+LWwWBugHvIpin8cX3BTD6WxRRyt/bGtJEkrGirJGGNlqGmrZx/WXp6oxXyp7P5qo948/DH0q8zOn34tZG4DGwEh9dfhXnHqtFhJJ2t/3inatHyfHyyqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258815; c=relaxed/simple;
	bh=+VAH1oPZaKTMRxEiDnWmTlypzS5GEurSvnDvL9UArgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkmFZkAJoWsRVn/k6jtD8B4aGYzE6PULbAXL85sqtUb9zN136SNnVWNrrbaMI1ULm95g9kKJht+f/ttSHTnAyqdb2No9HibXTWdk4sZOgyNSlXTQWXlAPsJMYVqO5FNZgb5la00n9De6Ck75D2lbmDxp1z1k10O/8LSdsd/4wJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccSo9uzS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F3FC4CEE7;
	Wed, 23 Jul 2025 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753258814;
	bh=+VAH1oPZaKTMRxEiDnWmTlypzS5GEurSvnDvL9UArgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccSo9uzSlkmxbB9yJENs2mmP8LvktBm7liVmV4nepuVaZWB1/LMMbTrD/k2h3G2Dz
	 Y9aPVAdQ8p23oEMwvX7nUpJ0pIqqYfbsM3w1DF+v/98cw062+iB1TgNb79sfftKJqW
	 Vq7vUH9XdUymml3LwReH4Zz/HNZtYTZYWDJqyHTTHBxO0i3nvW11WODSGMzUKOoRrO
	 gcpCDA2BrdVzZAaNL0Dohrx8EgGy96eYWbVzSFfkxxKsv3aHrEAis6Fj2PVWz+peAx
	 g23slysfzARHRmhtUKAtBKGsqC/m7t3HYDAKv8I4KSZ4ixkRnbXlLHb/pn3lCiIdIl
	 vFO4szo183s0A==
Date: Wed, 23 Jul 2025 10:20:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: i2c: exynos5: add
 samsung,exynos2200-hsi2c compatible
Message-ID: <20250723-auburn-dove-of-performance-f27235@kuoka>
References: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>

On Tue, Jul 22, 2025 at 03:14:34PM +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos2200-hsi2c compatible, reusing the autov9 support
> since it's compatible with exynos2200's i2c controllers.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


