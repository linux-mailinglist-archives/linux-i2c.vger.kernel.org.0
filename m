Return-Path: <linux-i2c+bounces-13958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F5C32A85
	for <lists+linux-i2c@lfdr.de>; Tue, 04 Nov 2025 19:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AE80462641
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Nov 2025 18:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BD633DEE3;
	Tue,  4 Nov 2025 18:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ntKSGPSE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412F33F8A2;
	Tue,  4 Nov 2025 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762280749; cv=none; b=bebZXKffSzLGwXqgZhte15Hm4A0wdbePbBDsIn96S91jj/6VROvm5x4mN5fq2Pp4rQPWZJl93v2zAFCv7zK2Obg2A8nvnsCs6P7x3YzqPOTSHqGTudIUbLwdht7pv8Rxs4f40qBsS/K+8C782+pgrIJVkecCi0QKjuRqqnx7pXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762280749; c=relaxed/simple;
	bh=i2N6U8gVZYZTsAyvftu+aK4B5nHv3/lncbA3GMHPvBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWYKnsyXS8Uyj+iQj9c2r418Mn2EN+cJZLdolW25jTYDpIA1lvJk6Qlcn7u53vsvMca+T0KweHQ8WKEDsTtVfe31FtGk7iX3kdOYpw2Fj96j3HXNkmDe6NVfBMmrAtg5uSnT1Gh7AMi4Pnv7ar1s+V0+wlZ87r8kiAiiL6HIYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ntKSGPSE; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1762280739; bh=i2N6U8gVZYZTsAyvftu+aK4B5nHv3/lncbA3GMHPvBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ntKSGPSEgIK4zbk3c6+PEk22FabumzO29uARsKz5Dh3EKkw6IfsIs2q3FlPZ3wsvH
	 QQ0CdHurvSPP/LntQSqf4c+cmB0k5j4UFBATGIkszvr1Fc2r7v9ZqRqBp/CRNY0gTN
	 sVe5ohZO4VdSV2Edpqeu0lKYmis2ZGozNfiWe0U0=
Message-ID: <670ddca1-9b0e-4755-95be-457ea855af45@lucaweiss.eu>
Date: Tue, 4 Nov 2025 19:25:39 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/7] i2c: qcom-cci: Add msm8953 compatible
Content-Language: en-US
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-10-2025 17:40, Luca Weiss wrote:
> Add a config for the v1.2.5 CCI found on msm8953 which has different
> values in .params compared to others already supported in the driver.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Hi Andi,

Could you please also pick up this patch? Since Wolfram has added
Acked-by I assume he's not going to pick it up?

Regards
Luca

> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 46 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index e631d79baf14..884055df1560 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -783,8 +783,54 @@ static const struct cci_data cci_v2_data = {
>   	},
>   };
>   
> +static const struct cci_data cci_msm8953_data = {
> +	.num_masters = 2,
> +	.queue_size = { 64, 16 },
> +	.quirks = {
> +		.max_write_len = 11,
> +		.max_read_len = 12,
> +	},
> +	.params[I2C_MODE_STANDARD] = {
> +		.thigh = 78,
> +		.tlow = 114,
> +		.tsu_sto = 28,
> +		.tsu_sta = 28,
> +		.thd_dat = 10,
> +		.thd_sta = 77,
> +		.tbuf = 118,
> +		.scl_stretch_en = 0,
> +		.trdhld = 6,
> +		.tsp = 1
> +	},
> +	.params[I2C_MODE_FAST] = {
> +		.thigh = 20,
> +		.tlow = 28,
> +		.tsu_sto = 21,
> +		.tsu_sta = 21,
> +		.thd_dat = 13,
> +		.thd_sta = 18,
> +		.tbuf = 32,
> +		.scl_stretch_en = 0,
> +		.trdhld = 6,
> +		.tsp = 3
> +	},
> +	.params[I2C_MODE_FAST_PLUS] = {
> +		.thigh = 16,
> +		.tlow = 22,
> +		.tsu_sto = 17,
> +		.tsu_sta = 18,
> +		.thd_dat = 16,
> +		.thd_sta = 15,
> +		.tbuf = 19,
> +		.scl_stretch_en = 1,
> +		.trdhld = 3,
> +		.tsp = 3
> +	},
> +};
> +
>   static const struct of_device_id cci_dt_match[] = {
>   	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
> +	{ .compatible = "qcom,msm8953-cci", .data = &cci_msm8953_data},
>   	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
>   	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
>   
> 


