Return-Path: <linux-i2c+bounces-1345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0661F82F438
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 19:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85501F24A80
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 18:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A061CF80;
	Tue, 16 Jan 2024 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhYf6t5F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636FC1CABD;
	Tue, 16 Jan 2024 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429640; cv=none; b=QxELFMKCbh2lt/TPOM6Wapq+UFx8JL0kSUQpPh9APQg0DiTH41dNX5ioV5vMcGARNbhZCLdAhOQ6hisszlZpsMdL3pgnO3fdo4/5VyLbu1tZBzpx5f9C99AemoadRzbPMN45MVq4c6CxFLOmAlRfvTUcRxhcso14MPvSNaNyQSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429640; c=relaxed/simple;
	bh=GoV6P97mBKlY0A0OpxO//43jXPc+qh/qWkDvpufu9c4=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=ZYqy7vmdOmagPRmspeLDk/Ei57tPt3IjAB5OHAin0WIBo57bytiJm1L9yrv6ljMiUfYF0YsKlKN1ZL5gx7tcZHLbwRJjMo5XL8/7QPfrMNNKjEHmRtPzSLCpTsB/rWNsUnR7bEI2RXOLbQ/FLkp5s0P699sQy2qgp6tnXBemxN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhYf6t5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3F4C433C7;
	Tue, 16 Jan 2024 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705429639;
	bh=GoV6P97mBKlY0A0OpxO//43jXPc+qh/qWkDvpufu9c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhYf6t5FgUfLAIryawnsSZ+L2OdC8Nsbx9vp12EvS7On7q9ZjuiUXX9I+1WRSKVp3
	 sdhxCsWqQaZTjH4bOw7ATyxJziuqNLWUOQ0dLRlmqkdL0sulgbrzt/+u2wj+GD4PA/
	 y4Yfid0AFLqXt1u6aNmRY9Rj93kgYaQzV/MBb48i1Ogmu/p8mbEB04gkTJpGiPTuz8
	 QJbKAI9xl1OLPd3TvT/Ji+tPZ1QWyJ4uUN7OuPotOjk53bRIcyM80/CpykZw1I1K8v
	 E3Yb52cLXz8JbfFbJeWOj1BYIgjVEFynEzn4PUaBkGD9Pj4e4GDJETJhfugn+gUx+m
	 OHQxNXYoRYAsQ==
Date: Tue, 16 Jan 2024 12:27:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios
 for shared line
Message-ID: <170542963664.213464.16983216340118145853.robh@kernel.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112163608.528453-4-krzysztof.kozlowski@linaro.org>


On Fri, 12 Jan 2024 17:36:06 +0100, Krzysztof Kozlowski wrote:
> On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
> share SD_N GPIOs between two speakers, thus a coordinated assertion is
> needed.  Linux supports handling shared GPIO lines through "reset-gpios"
> property, thus allow specifying either powerdown or reset GPIOs (these
> are the same).
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Sean Anderson <sean.anderson@seco.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> If previous patches are fine, then this commit is independent and could
> be taken via ASoC.
> ---
>  .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


