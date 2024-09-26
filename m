Return-Path: <linux-i2c+bounces-7026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04E987183
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 12:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 729E2281354
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 10:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FF81AD40D;
	Thu, 26 Sep 2024 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGc/O1BO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25301171675
	for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2024 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346524; cv=none; b=u+vajYMEyQljXnfxGRlch2bVU9vOrORoLG0590lcZQFZnM0E0h0plEMAi9Fah3wl8I5URkLjtnSo25Luus0FvmaaJBToLhqM26zaAuTw5+8fDIWblcYP23CARmnzJGspa+ltcnbJ/2xTMoK9ghHGE8E8ZYL6To4CCrY0wR/dYQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346524; c=relaxed/simple;
	bh=JQ3SXkLOPNuuMrXaUBUFpbj7KM6YeRCqp0vOwhtJFrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIkkeG6L9LUXXYh1OmX94ueeoaDxbtpW3sDlJQFIq5tMizUYEazzVIPxl+bFKS5oMf6WeBOrDpwJDJHJiCXfjiVNmYX398JNe8y/9UsO0vufc9z3wIBrRyvlAyNGPSulQEBwYfFtA/G+GyJXKykH62hOEYV5dqEy4beXW8WKNhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGc/O1BO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53658e2d828so84844e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2024 03:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727346520; x=1727951320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQ5h9IqgeF5qA+YygNEyEh8NIJAn6Orkt4Kv+rh7BNM=;
        b=jGc/O1BOlj9D0N0GgcdWKCxpVSnSFvjjCr5Ift+ASbiyCLDHHUFqmTd/AKTxXZHXY8
         YduikUNAuuGiwA0o9/Mesxd87Ivmnxuqzyka/iBKzFMKDPJcKL82uHayqo26aQ+El04j
         n55kxVFgExks1Sg/4/6R0+rvmslTH+VNeYki9vF3K0OvX9oPKj3KPoRf1wiijGAPn5VA
         4212qHTp5w4qVcTvGKdILkdKBuFKmQ06GIs8Imcj0brFWTifiUSrKE5B0a17FLfL0aaG
         3/nsswaO88uggb7u5u51ZTrYRCUJ0x91RZTIfYcezcl/hzUy9HdnSO/nXIuiD+tNyohl
         7hVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346520; x=1727951320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ5h9IqgeF5qA+YygNEyEh8NIJAn6Orkt4Kv+rh7BNM=;
        b=kwytDPj1DxB9P3F2Hzqts3mx4oEtPbsYV8YtGDPBbsjX+5PXLxVRxdxB8/nWWtOZQU
         GHJR+VZ+CDVIW0/axwzkrGPtqLRVraDsj1mwwu6/d4+DdK2iHHVbqcZLexRrob8sTZTL
         /1hNUqVcHJVdaH8c3A0TaNinttV+XvGXU8VqxReCgKFgebR6nws5tuQ5mBM46LfIZjca
         L1bMREMjBM78jZTdYwKLCrVDURr/AGkFGSaXFzx1qPxuKN5fwDScTHIs1Id83h2eZPzJ
         VoFdDjjR2Ru7sxlSjZzMc4+UXH+Tq8AVg6ajL4Q3zAeDYoF/u4cdw4Ur8soH8j34g41L
         XBVw==
X-Forwarded-Encrypted: i=1; AJvYcCVZadG/WnyGMfhbUdHa4uFMPKTHVPaHkIKKMIce6+BBMEfxTfStEDQL2QIjzx9E+bE8IRnrY6HJzNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHSfx2lstQn5u6mw5Dvs+NctwlOW4YlZiofiC+qU6foqRVhXjf
	zhwqD0hdbuNuh/Qfl9B+omx0IE5gUCZJTLSkqejlmSyIGjRclbKjgeEjkMGTAtt7Sq7NCGWibVz
	7
X-Google-Smtp-Source: AGHT+IHs2wZ0knluYwSQyv0Tm/Y+QWOXzamBc3yFHQU7pcagrgsOZH/5SuL/NKxmV+OONPmsciuL7Q==
X-Received: by 2002:a05:6512:ac5:b0:52f:10b:666c with SMTP id 2adb3069b0e04-53877530f7dmr993235e87.5.1727346520224;
        Thu, 26 Sep 2024 03:28:40 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8648b4esm753786e87.221.2024.09.26.03.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:28:39 -0700 (PDT)
Message-ID: <def1c338-8e41-4622-83d5-7a377d780d76@linaro.org>
Date: Thu, 26 Sep 2024 13:28:37 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
Content-Language: en-US
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Manikanta.

On 9/26/24 06:43, Manikanta Mylavarapu wrote:
> In existing socs, I2C serial engine is sourced from XO (19.2MHz).
> Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
> 
> The existing map table is based on 19.2MHz. This patch incorporate
> the clock map table to derive the SCL clock from the 32MHz source
> clock frequency.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in v2:
> 	- Dropped IPQ5424 from the commit title
> 	- Added else part to assign geni_i2c_clk_map_19p2mhz to itr
> 	- Dropped MHZ macro and used HZ_PER_MHZ macro
> 	- Expanded SE to serial engine
> 	- Added the reason for 32MHz clock in commit message
> 
>   drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 212336f724a6..22f2a0d83641 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -16,6 +16,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/soc/qcom/geni-se.h>
>   #include <linux/spinlock.h>
> +#include <linux/units.h>
>   
>   #define SE_I2C_TX_TRANS_LEN		0x26c
>   #define SE_I2C_RX_TRANS_LEN		0x270
> @@ -146,18 +147,30 @@ struct geni_i2c_clk_fld {
>    * clk_freq_out = t / t_cycle
>    * source_clock = 19.2 MHz
>    */
> -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
>   	{KHZ(100), 7, 10, 11, 26},
>   	{KHZ(400), 2,  5, 12, 24},
>   	{KHZ(1000), 1, 3,  9, 18},
>   };
>   
> +/* source_clock = 32 MHz */
> +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> +	{KHZ(100), 7, 14, 18, 40},
> +	{KHZ(400), 4,  3, 11, 20},
> +	{KHZ(1000), 4, 3,  6, 15},
> +};

Please double check the values.

This is what I get:
* for 100KHz: 32000000 / (40 * 7) ~ 114286, apparently 32000000 / (40 * 8) would
be a better fit, however it's unclear what would be proper t_high / t_low values,
* for 400KHz: it seems good,
* for 1000KHz: 32000000 / (15 * 4) ~ 533333, which is almost 1/2 of the wanted
bus frequency, so this one looks very wrong.

Do you have any ideas how to get better bus frequency settings?

> +
>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>   {
>   	int i;
> -	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
> +	const struct geni_i2c_clk_fld *itr;
> +
> +	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
> +		itr = geni_i2c_clk_map_32mhz;
> +	else
> +		itr = geni_i2c_clk_map_19p2mhz;
>   
> -	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
> +	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map_19p2mhz); i++, itr++) {

Struct/data organization here is so weak, that here it's implicitly assumed
that sizes of two arrays are equal. It could be kept as is of course, just
pointing to it.

>   		if (itr->clk_freq_out == gi2c->clk_freq_out) {
>   			gi2c->clk_fld = itr;
>   			return 0;

--
Best wishes,
Vladimir

