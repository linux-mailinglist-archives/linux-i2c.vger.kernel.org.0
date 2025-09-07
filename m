Return-Path: <linux-i2c+bounces-12708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8DB479F6
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 11:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745D11B242B4
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0781D2206B1;
	Sun,  7 Sep 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojIDPb2Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A822A1DF979;
	Sun,  7 Sep 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236351; cv=none; b=YJZgampXC/VQU2J1rTA7JKKqawH1LtokwhHyWGej2nmqD4pHBVDmsA24A7urJyXjRO4rJGz3Zq6udQ8K+wyioW8e6DmSRZ8vYKX94XaPSZ50BwNqd7cfyZprfxnMbR8kloj5sAx/CB45xBilf4/RB7X3L3W2osj3zKoZ2+aViD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236351; c=relaxed/simple;
	bh=mfGSVCyqkFfhc9bRNihF8aTujKJxsawJCfMEkmaqVJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFFGKjXamnOHu8rs82qGFz9TcUkJdjNlGj9raplYor7syCl8nvRZBQuayQnujRKCWOrLRbMSYoVPHZqjSBYN9LL6rcAATdCe3LR1sh6O9XCtamsGkp3Edcnk94iJbn+iXNi3vjmbYqGYOTteRRs9pawN9nB2d0eadS5ghMrlFUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojIDPb2Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A54C4CEF0;
	Sun,  7 Sep 2025 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757236351;
	bh=mfGSVCyqkFfhc9bRNihF8aTujKJxsawJCfMEkmaqVJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojIDPb2ZIBmvtvGTbN/hags6A2eFZ9ypaCQhQMLtpHLmRaCAi3qwER218gM4IPmFp
	 hLNGCO4Rm2RssSlPwjK1FhWljoCBDUOi90NAHaWi+0Dri7pC14nq8zrl4gIypuQXUM
	 FPOZS4vWGNM3+7/lhrBneaiamVQgi45WVJB38N40S9Nsg6tHPkwWs94ICXxpLTpvpA
	 lsKtiqJH7BKTjpnoiAXjABHMLiiGTWUgnk3iUPn5Ca3LBTYQ2meIzbrC5AeL8NCGfQ
	 VF7Vgf69FbZd7pUXUgS2UhaOHMjcADb4A6/l4VisQoscCZxUb+l/7ZgtnVp6OEd4qJ
	 koheN36AO2oAg==
Date: Sun, 7 Sep 2025 11:12:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/4] clk: samsung: exynos990: Add PERIC0 and PERIC1
 clock support
Message-ID: <20250907-provocative-roaring-butterfly-cfaccf@kuoka>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>

On Thu, Sep 04, 2025 at 02:07:13PM +0000, Denzeel Oliva wrote:
> Add clock controller support for Peripheral Connectivity 0 and 1 blocks.
> These provide clocks for USI, I2C and UART peripherals.
> 
> Some clocks need to be marked as critical to prevent system hang when
> disabled.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos990.c | 1152 +++++++++++++++++++++++++++++++++++
>  1 file changed, 1152 insertions(+)
> 

CHECK: Alignment should match open parenthesis


Best regards,
Krzysztof


