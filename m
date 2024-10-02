Return-Path: <linux-i2c+bounces-7166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E9298CF43
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 10:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E32AB21BFA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 08:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25F719752C;
	Wed,  2 Oct 2024 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIT0mz0u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC3515445D;
	Wed,  2 Oct 2024 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859236; cv=none; b=hPDOIeNOjhvrjsVZC3usHHqyN1kjyxvZVdZvYOsHgfz5iwyEmbPBB+9j+LBOe2c6CMMw89qR5I82RmYMUaSK8da5huIiDaNuPULxG8YVrcBFxjLc3AOsgiG3WAyuxJy+dg4HP/Kw4SFMwwsms4ctnjt/Rlwq8mDjxgEYcekaDzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859236; c=relaxed/simple;
	bh=BPR+545ikdvqW+oVlgVpPy+RnDjiMJ9fasDMUfLKVmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVuQHNRsHQPwxnDAdYb++kpDnLBXdrf2FdobWpBFkuU4Nj3ZXfLCgFLouaClaYc+OyGhaTBS+pG/84KdUphi8+Eww58gKNR3b/uGeFN/xWM7H5LpkE/B/X0I1oDvzzOZaBuMO4UolOdM/Ai1xmx4Du+D9zUxgvnuhbj5xfzlf2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIT0mz0u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F105DC4CEC5;
	Wed,  2 Oct 2024 08:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727859235;
	bh=BPR+545ikdvqW+oVlgVpPy+RnDjiMJ9fasDMUfLKVmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIT0mz0uUxmz11IE7piB44Q7exVttgt9hFEtcwq0cTBDdr+fTmv77mUhOQopR906V
	 VOSfw6jxHBncBeSoGw+7Z88c9m+ReTEuOV2x/y51TxKTxlgX1GAmwsyKjdc30b0gcg
	 fsp/v0+naj9aiDEEtRzzlhR0TflrGzV9W5hDQ1TVXZoswPte5iBZeWMGR0abr4erR/
	 EvwbxFqQVMGdWXFdH+8vnzS+IHNyp3e1GE7AbZ3YF/sup5lwMiG7/dzLsdnJCViAqa
	 CGE0Uw2kMA5oCv4xmODMmyMYRy8YIa7OBq2Eh6gPh003ps0um5edbS0fCo7oMW44eM
	 Tm9tFpZTng5iA==
Date: Wed, 2 Oct 2024 10:53:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v5 0/7] Add SDM670 camera subsystem
Message-ID: <lmc7q5tvsgyp4fordieualbs7yarc7iz2w4hp2hv7e5ty5erqf@glp3p5hi7i24>
References: <20241001023520.547271-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001023520.547271-9-mailingradian@gmail.com>

Hi Richard,

> Richard Acayan (6):
>   dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible
>   dt-bindings: i2c: qcom-cci: Document SDM670 compatible
>   dt-bindings: media: camss: Add qcom,sdm670-camss
>   media: qcom: camss: add support for SDM670 camss
>   arm64: dts: qcom: sdm670: add camcc
>   arm64: dts: qcom: sdm670: add camss and cci

I think this list is taken from a different cover letter. In any
case, I applied these two patches as they looked independent from
the rest of the series:

[PATCH v5 2/7] dt-bindings: i2c: qcom-cci: Document SDM670 compatible
[PATCH v5 3/7] i2c: qcom-cci: Stop complaining about DT set clock rate

I applied them to i2c/i2c-host.

Please let me know if I missed some dependency.

Thanks,
Andi


