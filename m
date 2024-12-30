Return-Path: <linux-i2c+bounces-8809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5279FE1AD
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 03:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0A43A1A16
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 02:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08D52AD22;
	Mon, 30 Dec 2024 02:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="er9idcRM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7EB2905;
	Mon, 30 Dec 2024 02:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735524124; cv=none; b=nvWEt98qP2/DBr8TmnHayljTc2wl1le11Gy0+Uvh+/iZb1KYBHXLvq6JY34jpXy35yqZDA5ZYiQ3tRz5+u8IFz2nnw+DdtScfzEIXgeB8NOtaZVQmQ80HJNuytkZk6AZ10ZdbPwxmT7oDxrQhPUyj24xDkqm8bj8K9E6RtGlyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735524124; c=relaxed/simple;
	bh=cIMTaIWQP22lxD4w5uccVrK9JiGvXC+KewwIKgur0rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8eDaFUduq19zXwZ5sXiJu4/dJJXfke5z/s5vBeDN17v0k1SdWbEluAmni6X5CCMh2rcDLEDB1rC8OYszNFaEkbK9jrThz+V9/Kj+yiDIfIwThw+8Wpa5/15SHWdvkAYz8ZC+vzp7SxuZyzTQQB/L1kIR3L1bcXDxEIq0ucPlrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=er9idcRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E2CC4CED1;
	Mon, 30 Dec 2024 02:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735524123;
	bh=cIMTaIWQP22lxD4w5uccVrK9JiGvXC+KewwIKgur0rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=er9idcRMKTuWjY7CD9Wyph32phBi9WA1SFSNm464Ymm3sma/+JT+nq+qf930FaesG
	 Szb2t4DretQKxdMWAFvgj1tj763ANNrmwBetymVK/3UUN0qQ/YTsdOUBe/FgnlDHFj
	 +E+THvdowcaM0191QLokZ3V8k4NZB95TPtLO0eVEdeKPWa9QATkkOIgh3DInGKDFS0
	 1fhjSFdJzjhe+DjJAto4IZtrpwZ7+KuVXWMeDlLZE5855zWfQqj+dNpDtTHXQZKZCS
	 dm4uPHUlCHltARa7rAeFZxGJr2Dg42dQXiD4NmB/93x5mkfdVjPMRofZD1RmjKMe0L
	 FGokCUhIRZA8w==
Date: Mon, 30 Dec 2024 03:01:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Message-ID: <awtro3dlxmdhwfjr4kjtzurn24fmrvxvdnwzkesn7vca3c7yvd@ixkp2v4bmhmt>
References: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

> Ivaylo Ivanov (2):
>   dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
>   i2c: exynos5: Add support for Exynos8895 SoC

merged to i2c/i2c-host.

Thanks,
Andi

