Return-Path: <linux-i2c+bounces-3293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9638B55DF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 12:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C169928265D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 10:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF923B295;
	Mon, 29 Apr 2024 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="GNODwKgZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947022EEB
	for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 10:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387972; cv=none; b=SlRq+tiIjPu7oAoMZaYkO/Q7qSAA1V+XeRjZV48t4bLAQMLRoyvIadU/pD6P9P0B6Mm/+YkBWvP2zIzBSNTe97gcl/874VjEzEn4rKPfdX1Ezd6LqAd0vIwh4raqE5AbpWVN1Lh8HZrnRwleElVtDF1lRfLuWp/6exPbsV93xbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387972; c=relaxed/simple;
	bh=o8wOtjyB4H1XLEyLHIcG4C34RaapqzbqcWqjwmC6atY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNc4/oK3OM9kOzLWReVVGcCBYJtHiW2l0Lq69jWrSxFSEPtFO79x57yfI4kHQbA/+Ybl9Ca0Awlee13d9SLVf54QkCnI/QE01rTUuLo6p27EHmCg4nXJLyZWn/d+g13wwL7CMpA8tuA25h6KnMztMpo81T6niehtU14cB6cAMH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=GNODwKgZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b9dff6be8so19174675e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1714387967; x=1714992767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fgJIL5pu/9arRZ3qBAu3NHtnfRP0VZyCjshY2QEahY=;
        b=GNODwKgZ8qxgDyBjqNpbV6crvy/5yO6L5GzuaBGENOTv19bIbGLeGmhR87AOaHmvKM
         dd1/YKV71GmPeKRwXSI6nF4VMWw5CBmuf3j9N9oCNCNvf1f8SP7WVx3rCbRDTQbQtUs2
         1lbT5/t1+DIUFO5oUv/KKX8GkiHFUDP8hEYMEyr+tE8KkLBpglCMkCpKXgA5ZXOO5/og
         9mofVD9Un0J28W0xHP5k76qkXjA9+ad6j+KmaPBwEongRrrhdq5fgIEHYoiwpAxobhkb
         PfdWwWHiYB/8idL8GyaJOZ335lU/CIW+115Dxq5MODWSd6WOO3Nc/ko42nSzZ2gAWLPV
         LuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387967; x=1714992767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fgJIL5pu/9arRZ3qBAu3NHtnfRP0VZyCjshY2QEahY=;
        b=YoC9R3EhVKejED2OE6oEC0yues+Aq5wnZ5odsxiCDegByJs1x80DuTIv0kSebJV9B7
         s1zeEE0KaaqpipBO40xeM3I0P0gOU/o1945J9RBqLph3NdhE1Yg/E3bSfAbJ0eIZziAu
         5m96ZVs7hWPnhRP0LVIcxJF42z9iLNbMv1advKcGgbhHRdkBJZv2ERVvqSzFHikaZukz
         UFUNCOsNFeHsmnJQnvzbHGRvl+5iiAmwE6Xnjqp+OLezNgS5P1QV8e+ggTld4AuzkVbU
         7ArmNyH3wJGha4Za+IthzSJsGfZ3B1lsYY5VkNKmKD6qUCU+TGbCDCUQASQZckkn26tq
         7StQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3dsZMzIEMJn22jwhTeppSivmzyQ+cr5HG+KfQAEIAeIijaXCj3m2napVxc+WZMJxP4bNEA6zOpDkYSKuhW9/876E6cI2t6zsD
X-Gm-Message-State: AOJu0YzEdG49YbrRZaErHL/sMYs/dokmfQkxiq5GnH2PKhz/waqKa+uA
	iG21jfgvITuyrTFliuVStp+icMyEA1LqWTezUattuizznqpObbxc0XiDoDPrbBmR1f4v5FHQIqY
	N
X-Google-Smtp-Source: AGHT+IHr/wzLkphA1zzTirAeTnU83OYcBlmoMRkY4gcRgafVZK8SRhnGsx09GRSLiXv2nSUK4zoAbA==
X-Received: by 2002:a05:600c:1f94:b0:41b:83bc:e9ba with SMTP id je20-20020a05600c1f9400b0041b83bce9bamr7105320wmb.23.1714387967438;
        Mon, 29 Apr 2024 03:52:47 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id e8-20020a05600c4e4800b0041bf7da4200sm7095641wmq.33.2024.04.29.03.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:52:46 -0700 (PDT)
Message-ID: <0703c962-727f-439c-ba56-ff70288f7224@nexus-software.ie>
Date: Mon, 29 Apr 2024 11:52:45 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] i2c: qcom-geni: use 'time_left' variable with
 wait_for_completion_timeout()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
 <20240427203611.3750-13-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240427203611.3750-13-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/2024 21:36, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 090b4846ed62..0a8b95ce35f7 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -586,7 +586,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   {
>   	struct dma_slave_config config = {};
>   	struct gpi_i2c_config peripheral = {};
> -	int i, ret = 0, timeout;
> +	int i, ret = 0;
> +	unsigned long time_left;
>   	dma_addr_t tx_addr, rx_addr;
>   	void *tx_buf = NULL, *rx_buf = NULL;
>   	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
> @@ -629,8 +630,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   		dma_async_issue_pending(gi2c->tx_c);
>   
> -		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> -		if (!timeout)
> +		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +		if (!time_left)
>   			gi2c->err = -ETIMEDOUT;
>   
>   		if (gi2c->err) {
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

