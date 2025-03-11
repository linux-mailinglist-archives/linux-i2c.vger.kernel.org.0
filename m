Return-Path: <linux-i2c+bounces-9796-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79069A5D2FF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 00:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCA70176C9B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 23:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F59225A29;
	Tue, 11 Mar 2025 23:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n72wMNa3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC51F09B4;
	Tue, 11 Mar 2025 23:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741734798; cv=none; b=V2fPvgfRkmruXTpe/b20+82QctCvW8T+UJmYdc+d4hqLTkvTQ0GGe/PfcAE20dtAT37lVdOG1XHmcl6M0Jk48zfL9d+SPJY27RIcAkQu+XlLL7MR5LiRSJEBotzuKnlVf38lr8VS2QiLlMARs4ktgQbCJvdSOexgZfuHbSO/ZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741734798; c=relaxed/simple;
	bh=8zqqrE6NewUBWLpJZUQ9TW4QDanmnleqtNEBYnbMVTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz4kQIth44eu4/G8nI4VFV3RApnFQiiIHYMr7ZImpjPFXvWDvtpgtz14NLn53/NQzm0nelyjZTlxBBVjPRx8XBXpQZnvu9+lJ7fsMtKwZZP9UNiUZmVrMTpLJVsZSLM6lDqt7ADeytEIaLGOJTm6fpwFk7rY4WBixgyTrJ4BPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n72wMNa3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16C4C4CEE9;
	Tue, 11 Mar 2025 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741734797;
	bh=8zqqrE6NewUBWLpJZUQ9TW4QDanmnleqtNEBYnbMVTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n72wMNa3Jz0xhi592qwthWXHm9rUyqJmj8Nr/TkskBp7IiNe3/ds1wy404etUxux9
	 vrkb8V8GqZiLBtTp4iWf9eCS2DEjEIA5LZNHJm4XsihtynVTav9pS1J/91Nue4CjS5
	 EEiLv0EXT7CYCs8sSFH4FHo3QIKJfBcN0L48Bzvj8YvVuXYJ/rAYO7hZaVJ1H8EVEJ
	 yxX9Ay8U1ETzjuP5dEx+uQ/Rc8ZDnKckGE/XmgV0/NtGAg4bqfubeKfaSdyI7PwDUS
	 QqHWh6Qn0PJROsbHrVf+0f1b5mwlQMgPasICv6DpmpyTjYFsuK6PZIBU3F9/eBBC7I
	 x6O1Hqzg4nGkw==
Date: Wed, 12 Mar 2025 00:13:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, igor.belwon@mentallysanemainliners.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add PERIC0/1 support for Exynos 990 and hsi2c
 compatible
Message-ID: <jwihm4ahyjluillz5szgvwj3ntjypqekjf43g4c2poa7r3v7ar@5uka5xftxjzf>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>

Hi Denzel,

On Wed, Feb 12, 2025 at 12:48:20AM +0000, Denzeel Oliva wrote:
> This patch series enables the PERIC0/1 (Peripheral Connectivity)
> and compatible hsi2 for Exynos990:
> 
> - PERIC0/1 feeds HSI2C, SPI and UART
> 
> This part tests one by one to see which clock hangs without
> the CLK_IGNORE_UNUSED flag.
> 
> Changes v2:
>  - Remove other unnecessary patches which is nothing related
>    to linux shipping style.
> 
> Denzeel Oliva (4):
>   dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock
>     management unit
>   dt-bindings: i2c: exynos5: add samsung,exynos990-hsi2c compatible
>   clk: samsung: exynos990: add support for CMU_PERIC0/1
>   arm64: dts: exyno990: enable cmu-peric0/1 clock controller

what is the future of this series? Are you planning a v2?

Andi

