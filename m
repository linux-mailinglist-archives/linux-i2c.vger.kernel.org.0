Return-Path: <linux-i2c+bounces-6248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A14C796DAEE
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 15:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 590CC1F259CB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 13:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5132F19DF70;
	Thu,  5 Sep 2024 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3vjdln7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324719C573;
	Thu,  5 Sep 2024 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725544632; cv=none; b=GqpS1nkUb+3CQGNP147zCpE5RfrG9FD5eXISwXp0ZLa/IXsWP/sOTEWjbjCuZQcPoI5SyOGwTELZ3aCDOwQH8TmISsV8fZ8UaC4mSqTfOtrIx1MS9AJnxxQVmH4ol/m2GsaYX4eV8FWn9FGkBGg6NhD2EOWySLHZzeObsc0WMQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725544632; c=relaxed/simple;
	bh=YwhGNWwOD7YnFzp2eQqZuiFp3983dv8ZOgPhaiQXc7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeoiwK/KuhiQy2TTPv/jjLZoyp5qEU47/vPimFYuHCu6n3ieA1qVrzi8ueq9SU65mcl0TVU+NBYl+AxDt09C8OyDn9EqFs+XoLW1z0fHgZhn5KDbBRcSdBJIFBm2aCYQ6th02B1vFGsOSmD+KNxKRjpaw/BJ2NI8M8aaApIMkfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3vjdln7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE682C4CEC3;
	Thu,  5 Sep 2024 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725544631;
	bh=YwhGNWwOD7YnFzp2eQqZuiFp3983dv8ZOgPhaiQXc7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V3vjdln7r6k1XOFa4pcz7LpHWEbE50GKVoUw4p48poItjMSM82bAdCoDahnkzBkr9
	 U8K8Lq0rMH8J5JK5c0g1VlTenokujaM6UX2tVFhqlXVxt8tsbeR4lAzgr9fufsT4sW
	 kdEfncrje4xEi6mGuos7G4yK8i+c6VO1GXkdXKxVsCgGM7p6Nm+H+m+fWLBz0wgNjN
	 nEHiKadebk/KG+7sxxOjBC2UPudM2khxSXaSSxNzb/7vV2J0Jt1yOjDx+sExzjyv1+
	 BSRYCXHYcDdln1eNev5gxYvDYW5cCHvYMirDvejjYazpnCoayzsSeGOHJD5vnrixcW
	 Y0OTkw0YOqmww==
Message-ID: <917917cc-3e78-4ab6-8fa4-82d9a6fe3fdd@kernel.org>
Date: Thu, 5 Sep 2024 15:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] i2c: qcom-cci: Stop complaining about DT set clock
 rate
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-12-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240904020448.52035-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 4:04 AM, Richard Acayan wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> It is common practice in the downstream and upstream CCI dt to set CCI
> clock rates to 19.2 MHz. It appears to be fairly common for initial code to
> set the CCI clock rate to 37.5 MHz.
> 
> Applying the widely used CCI clock rates from downstream ought not to cause
> warning messages in the upstream kernel where our general policy is to
> usually copy downstream hardware clock rates across the range of Qualcomm
> drivers.
> 
> Drop the warning it is pervasive across CAMSS users but doesn't add any
> information or warrant any changes to the DT to align the DT clock rate to
> the bootloader clock rate.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Link: https://lore.kernel.org/linux-arm-msm/20240824115900.40702-1-bryan.odonoghue@linaro.org
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

I.. am not sure this is really a problem? On some platforms the core
clock is only 19.2 Mhz, but e.g. on sdm845 we have:

static const struct freq_tbl ftbl_cam_cc_cci_clk_src[] = {
        F(19200000, P_BI_TCXO, 1, 0, 0),
        F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
        F(50000000, P_CAM_CC_PLL0_OUT_EVEN, 12, 0, 0),
        F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
        { }
};

Shouldn't this be somehow dynamically calculated?

Konrad

