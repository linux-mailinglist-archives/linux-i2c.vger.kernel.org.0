Return-Path: <linux-i2c+bounces-4494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AB91CB9C
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 10:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD05F1F22709
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 08:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAD439AEB;
	Sat, 29 Jun 2024 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="7OYeSst2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FCB2AD38;
	Sat, 29 Jun 2024 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719649368; cv=none; b=TpVR+X7o/GNiIMwceEqueSH7FzZ5W5vinrK7QXfirR9a9NK+fir7tVv9EPjc9SvEsvtMGmMfA6d0G2IwkJ4H/AbgIeXxCV3koBk5euIUGrd7w3YF/Cy64mempOpl+YL8c2OU3+duzO1z7M6l5exV1RJ5q5Ez4rAznDMW1dV5O/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719649368; c=relaxed/simple;
	bh=FHKzh/Kr8vmSuI5zyQKcUxH/uadsHSfsj4Vf0FgJiUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FgAGJnjMHAH8YFPszjmG7GvRpU3uLMFYjQwibw1QRwjB7xOFWu/uHeSQKHruxSLjQkjsSHF7kupltdS0RrOzLxe6iQNCYU6Wk+06osMeUtIEBSK7C3KDgOaVa70P5uRZ4QMCLWixoTYrTrW/EHQNc0Z3mQNDAuMcUCjB+4cD8yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=7OYeSst2; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1719649363; bh=FHKzh/Kr8vmSuI5zyQKcUxH/uadsHSfsj4Vf0FgJiUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7OYeSst2GC9T+UK9Uap/Y07wy9fcsIK5ydPiu5IrDxVsbfvl5mzlU24pRGBcCHEUq
	 0DJ6jDPtDgrdM2gEkS2HVQU7/xvh2fHuvoEkRhPKq4qwJxzipbFJDsN+J1Zf50Rzn6
	 OalsITB6xnz7hRYRgNaU4QRt2gKzhkied12a/H7I=
From: Luca Weiss <luca@lucaweiss.eu>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Hariram Purushothaman <quic_hariramp@quicinc.com>
Subject: Re: [PATCH 5/6] i2c: Enable IMX577 camera sensor for qcm6490
Date: Sat, 29 Jun 2024 10:22:40 +0200
Message-ID: <2902343.mvXUDI8C0e@g550jk>
In-Reply-To:
 <20240629-camss_first_post_linux_next-v1-5-bc798edabc3a@quicinc.com>
References:
 <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-5-bc798edabc3a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Freitag, 28. Juni 2024 20:32:39 MESZ Vikram Sharma wrote:
> This change enables IMX577 sensor driver for qcm6490.
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 414882c57d7f..10e6df566ae3 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -817,6 +817,7 @@ static const struct of_device_id cci_dt_match[] = {
>  	 * Do not add any new ones unless they introduce a new config
>  	 */
>  	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
> +	{ .compatible = "qcom,sc7280-cci", .data = &cci_v2_data},

Please read the comment above qcom,msm8916-cci.

And sc7280.dtsi already uses

  compatible = "qcom,sc7280-cci", "qcom,msm8996-cci";

So qcom,msm8996-cci with the same match data (cci_v2_data) gets used, so
just drop this patch.

Regards
Luca

>  	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
>  	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
>  	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
> 
> 





