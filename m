Return-Path: <linux-i2c+bounces-13572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B5CBE23D0
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 10:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A39D3ADF8A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 08:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03D230DEA4;
	Thu, 16 Oct 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7jC1FQs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD6530C378
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760604939; cv=none; b=sjMcCLlDJqUcD4Zv6PdzmqluntyLKckwxT6R57iBYsFNVrfk2gJos6NEGiqLLX/SrekRnJNkex0hfByp4tDqDtRafnvNp8vMBIUW6jikUHhrFTcNbvC9yhW605NegAaigUtjrD5qBmEIT1EOla0CxRbpBUqQHHjpQES0X+MptIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760604939; c=relaxed/simple;
	bh=VnQz3tD5fL1+HIoA2SNYDkA9Yt4wrKPvx5cxJ2QaVMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nx2NtKlzaKgFIDq/CE7ZICHT5xe9tMcUBj/gIPoRliSvzlFw8cX8n5Vsr6uowQJnXBLIWP4p/PTW5C74znde6XoFVe2bHt9kDgAQ7T6lqMTVRbDO2qdfZbGEG8IsXvNysTRLNdBSxdzSy1bncDZuDC3cGOkPeDNBCKhtnMZhFH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7jC1FQs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso491534f8f.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760604936; x=1761209736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsrVJFlpunpde7Grn4QhbslhAz4SkbZMhPQmJfh5ifo=;
        b=J7jC1FQsia1Ozl10hqIc4820I8fK2dmnbTgS+4izjsjoPjwS5UO3BL9sjUqxqk95dp
         aZVcLB9coP7RrbCVwk54KNwcIfy2cN6qp2i7VYPPIl4rPWMy/whg1PPNxHkR3gNcvLfj
         5JHylF32mCMprnaAODuDTxI78uuHmmDI1g+3UI3Iyq2ObVGPRqkpMpqdf9s9Tsi4NfjK
         wyI4bMYfEufYtV7ors4pkCCG7niU/PigtohpPCG5Z7E+z5aUIds4PDgYS7EJkXPXT12k
         156b5v4PjEO+cbrVC9ONZFlO+YhNyn4MyfW1LK0Q+jK1M4T3VmxXEuoufcsZ4mGBgsV7
         WEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760604936; x=1761209736;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsrVJFlpunpde7Grn4QhbslhAz4SkbZMhPQmJfh5ifo=;
        b=wJJYevv7kdVaScg4eM/2g7Hf0777WDiumjq759J2/oq0lwjt3/AwN6sEmcT/OGCcSB
         mf6SE8LNSSJWvBQFfVYHj/B3qgwmERrPUb1ox3Nnx5ZfItecDvA2+ahkT4wE3+Wlzk8x
         RLnUADNhkVGPO9R+zMb8yOaui6KF1f0HQI+uDJtRczsrftTLU6xDm0y+tdMV/W6rz7fh
         sCsaIiOAA11/FhZUnOq4g7UwqLI5E5y5Dt88+kQd9nEVxDsprI3V/7U0nVeBZUsosiNu
         tzHynovk0d47hhWKWIRV/euYQq7zpffOM0HR9+Bhocb2H65cSjO26mHhPaIXDjDdykkx
         BNYQ==
X-Gm-Message-State: AOJu0Yw21FU1ogwae9sK3b6tNrPAXIyU3LRskSnOo1kcUfIliv31KpRp
	HXS+ZGn7pFS2Z3DCELKO4cWMNvgb3yOSZhytMEeWfxrtKAx9+9r+CE6YbybZ6GmAjVI=
X-Gm-Gg: ASbGncsd7nnu1v4xF99k1ADAMqIdw0fQU41KhiDuUYMxZDx1A06EeGFpqIEIftqIRlp
	FWt19Elo9mVLktPhQaPxXt0OqseVsssIs5evcCiwi7VzzeNXLUixcEhr2qa2/D0Q8AtyePvBmkj
	/q9T2YVEORZf5FKD4eAjY0TN2TTc7D+KgWfVwRUAAbf6XQYZaOjK/i8sxo6No0wFwYRjA821ya/
	QIoIsweh82xy+ItEbV+qTWMWCEj8s8VGBYevF/KzBUYHKZENhXK1XKo/npFQHFBgUUmEvZL+OVR
	WB0G/S6/3GtuqQ85SGhqXxMP1eHMVg3+5BgukYHkI4FqPn9s4jWnwZolkig2Y7sYEYFguMd3s85
	ym4n4fNxpEwj0GPphiZejSC6HE6ONDLYeFrlvYC9gRUphFgLqAslXtjJRTqRETq1l7s2LLGAQB+
	RorvQ6Tj4um5qN0es4z+ln1U5dBeh1KLjd5keMNPPoXFIKda68ly0PxcdZ
X-Google-Smtp-Source: AGHT+IHAmY3cKpb9sKauDzAPuMRSBw4scaCwVsJY6UgUsWKiz8av6DfzkDhrWM75GsjBU5op+ncafw==
X-Received: by 2002:a05:6000:2207:b0:426:d5ab:789 with SMTP id ffacd0b85a97d-426d5ab07a9mr13486191f8f.53.1760604935890;
        Thu, 16 Oct 2025 01:55:35 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8141sm32874494f8f.48.2025.10.16.01.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:55:35 -0700 (PDT)
Message-ID: <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
Date: Thu, 16 Oct 2025 09:55:34 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 03:56, Hangxiang Ma wrote:
> +static const struct resources_icc icc_res_kaanapali[] = {
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 925857,
> +		.icc_bw_tbl.peak = 925857,
> +	},

Looking at other implementations I realise we've been adding avg and 
peak without too much review however, wouldn't 925857 / 2 => 462928 be a 
better value for the average ?

---
bod

