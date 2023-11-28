Return-Path: <linux-i2c+bounces-517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A86077FC420
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 20:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D162282D0C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 19:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F2046BA5;
	Tue, 28 Nov 2023 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p57NzxC0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98DD46B81;
	Tue, 28 Nov 2023 19:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD616C433C7;
	Tue, 28 Nov 2023 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701199080;
	bh=SgFpPkvRLZH722x0Q2MvtZK1DcjJxLafBR+Y7mjLxR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p57NzxC0rRSaNC1yF4erIx7C/gTJjFfTBJfigTPSAXGEiABAsE9ucU9XuNAxvCrJj
	 9xPeIBiCqcPar1Cv/LHyJ/xNmlhiUCQO9xA3wiw5MVIWrOwmP5SIAU9Kg49V2gUmBD
	 dace5qSugrF8nFkLbOSWHZUc9n5DiBKI2VJ7UFJwNhHOJ4Caoa8wuf5Vx4IwzicuPA
	 SnMXuZwO/Ak8459BojKDQfsUcvfHGYPJJSur8wFb6RRNVaWWK7MC9mS1CsLbb1pFQH
	 lHelXtTBW7zVfo4IWbzIHH9dE9moP/5TfDKfzpfvAmOsCsw9MKIoHX/xKN7zyO0oi4
	 yNgw0d+fxayMg==
Date: Tue, 28 Nov 2023 20:17:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Message-ID: <20231128191757.67mlp2tp6wlxxta2@zenone.zhora.eu>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>

Hi Stephan,

On Tue, Nov 28, 2023 at 10:48:37AM +0100, Stephan Gerhold wrote:
> When the I2C QUP controller is used together with a DMA engine it needs
> to vote for the interconnect path to the DRAM. Otherwise it may be
> unable to access the memory quickly enough.
> 
> The requested peak bandwidth is dependent on the I2C core clock.
> 
> To avoid sending votes too often the bandwidth is always requested when
> a DMA transfer starts, but dropped only on runtime suspend. Runtime
> suspend should only happen if no transfer is active. After resumption we
> can defer the next vote until the first DMA transfer actually happens.
> 
> The implementation is largely identical to the one introduced for
> spi-qup in commit ecdaa9473019 ("spi: qup: Vote for interconnect
> bandwidth to DRAM") since both drivers represent the same hardware
> block.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

the patch looks good to me.

> ---
> The bandwidth calculation is taken over from Qualcomm's
> downstream/vendor driver [1]. Due to lack of documentation about the
> interconnect setup/behavior I cannot say exactly if this is right.
> Unfortunately, this is not implemented very consistently downstream...
> 
> [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/commit/67174e2624ea64814231e7e1e4af83fd882302c6

Krzysztof, any chance you can help here?

Thanks,
Andi

