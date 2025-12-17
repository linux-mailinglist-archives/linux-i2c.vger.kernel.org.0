Return-Path: <linux-i2c+bounces-14621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A8CC6A0E
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 09:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAD753061E9B
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 08:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49947336EC5;
	Wed, 17 Dec 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RR3WUVhi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC7257829;
	Wed, 17 Dec 2025 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960762; cv=none; b=PyoTb7zNUfTGJK5zUArg5O9gc+P+jP2wAie5YZTIdFIQkQtSYRhujU4FjWWn7HLizXN8O81OWAjfASyXpeBCGj4L31PfNvv4LOfkAc0BU6qf05W3XvkFy6n6lwo8hibn2gguoj+TSleeudHDvyjM1TXkejcyN7AI/mziAsAuvhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960762; c=relaxed/simple;
	bh=P1/AuVYmxD5Hc7VivtWTqrUgU3GCgwxZ6VxvvVURvEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7WRI0vUmyjHpzyvtaheo/7aL2ydZFfPe0UjRofjYJa9l0lb7BqYE8LyBzXgP7G4rtHr1C49KJIOJ0xdRQ71xFUb6PPaL3Fv4wZbdwj0oqqJPAq1ECrDv7ftD5YaWlDDcMowTZLz2B1ONQ8Y9f+Obe17x5JUr7u6eMP9MGjx3J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RR3WUVhi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1016CC4CEF5;
	Wed, 17 Dec 2025 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960761;
	bh=P1/AuVYmxD5Hc7VivtWTqrUgU3GCgwxZ6VxvvVURvEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RR3WUVhihr6Jgvo/DDzh/2DLXMO1r7qMT4yZ+O367/+F08RxAAMch2EUAeNgndaoM
	 xYYqXCYdIImjEBKdimX+YPl+anPqY9mXT2R8mURlyyEHPFVfB35AKDf/GAo7Cx0Um3
	 TRkEl74aCpA/YliDb24TDQl3CNhjhKLn21eqs5DK4Fkd+3AK5DQPSgG5EolNqHPLvT
	 tBaA5Gd3QVQXaV3+OgaN/KrcIGym/+PlwW2SaobWRpOK65bVdgWKAkVjCMJTUdRqqu
	 9E84GgEbenm3v/P6fdAEgNxXPL8KIkC+L8gOQwRwRO5P6CcTdrRCOTGe20Ch100e4t
	 bIKeQGko5V5Nw==
Date: Wed, 17 Dec 2025 09:39:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: st,stm32-i2c: add 'power-domains'
 property
Message-ID: <20251217-realistic-pug-of-glory-dd4fb1@quoll>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
 <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>

On Mon, Dec 15, 2025 at 01:19:40PM +0100, Alain Volmat wrote:
> STM32 I2C may be in a power domain which is the case for the STM32MP2x
> based boards. Allow a single 'power-domains' entry for STM32 I2C.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


