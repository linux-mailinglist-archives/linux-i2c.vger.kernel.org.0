Return-Path: <linux-i2c+bounces-7505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB19AA1B2
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 14:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01BDA28371A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 12:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B08E19D075;
	Tue, 22 Oct 2024 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opJmI1l8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383919AA53
	for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 12:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729598732; cv=none; b=nf9/ekG2LgGeKMsacDjMUsIiC4G6sY4U+9Iu4s3mA0mhiIOy2b502hADClXRWNDFer0BFwpvR0gp7cFsRsyNHkjnYjY/+FADwjHqsGew/TrMBQXoUe23mdptzmvZ+ZL1MYicgkxD7zvNDnTzC7w20rsnugtgi/h7+KZI6j7Zk1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729598732; c=relaxed/simple;
	bh=xAa35UEgyalTFRei9YaqIbZpH4Vbt4ugEAjxJ/AXAGU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=r48X/hUsC+a8hlzWDEx64GIjK1JzO5dnHZKDR8jGnXeZJfYhawYkLr6EnossL2d4oPiNg1CPViqGQ35eLXLxVjeJF95uSOeDI9LmGxGeQCRv45K5lf2gV+8Rfk6whaoSZxMbo8NUFa4SFojxd9Zztt0WoRlppsb9nOpBXxeOo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opJmI1l8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315abed18aso51784215e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 05:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729598728; x=1730203528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+rXM8YoCxSlmKFLltL+X2lgjTLpMqtyIwjJXBbz9u8=;
        b=opJmI1l8JCSPoha6axU22ENcj/I9GLB8GQR2xF35QQ6hI4tAbCBi3DTbN+WXG2PQMg
         nkmwcuv89hwFZTRUspKdKlDPgA49v/ktEw+40EUK/sgi+7votArWLJIXqP9gOZeI6VUa
         fidgjQhbfXSy6tYc22fHfd2zJ6xgD3+TcY9P8DcUkEm37qGCyBhwdViegL2yWkX4jg1S
         28k/Fs2qLDvjbtsRElaz4Qldgay1jXyDwSfoeq7FhjAv/SKuhGzUBaaBv+o3FPpfuQlA
         wgh+isG3Hpo+jNqStsFOVti3swwr51w2RdhD1mFR7J3BmJNQ+A3jqnPnByujjS7AHkTV
         EP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729598728; x=1730203528;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d+rXM8YoCxSlmKFLltL+X2lgjTLpMqtyIwjJXBbz9u8=;
        b=UAWOTr+pK5SMf+0Ur3O9sgUTW2n3zHoqCw5bkjCXcdtI7QOVL+pl4t71a4Vvz5DhnH
         E0mwf29YYkzb2W2r7ZDcQT8+HKMeWOwer/HRzAcxhQXuWItiYQNLxLuBby3BoSSuhXY2
         YF+kMv3UbDC91oFpwg4NKRtk/vQZXXJwJspKXX3QU4IIvs5wZkoGMdvxmPeklTV1Obo3
         oeg5nhaU1FjTVFRUpqrfzOzIrSwH8N/jzOZxjfj5w9rRvsofoKuQ7UklkXct6KqCQe2U
         OKQCKum3GK6f6XBgo/GjwyeCx9/jUfw4GaQauG50V948jwgfk5JeboQncwRPS1VocEmN
         sotA==
X-Forwarded-Encrypted: i=1; AJvYcCU2CRWrMbSYd2hC2ZI6URxRIZd2J0qRMO82mwbUJFymiz1ER60RIlFQ9QoBACNCMH66gQrCw5PsWJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHhauLR19RUa/05R07kucVw6gKdRbeU0C3GYLSk2FRNK/pDCeC
	00MU3D/5telkL4v5nB4Y9gVpl3uSqWnWoApiNeb4I2NGNNCCcVxwK5cg3EAQlXE=
X-Google-Smtp-Source: AGHT+IGOriYXOUTnFe0hK1xqAhG0+iTqWnSOGWteduSyNyhKdpHlOzUZIu4+hZqVlkKxd/tYNb98/g==
X-Received: by 2002:a05:600c:4e12:b0:431:4f29:9542 with SMTP id 5b1f17b1804b1-431616332a7mr122094945e9.6.1729598728173;
        Tue, 22 Oct 2024 05:05:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:43af:403f:2c26:9ea7? ([2a01:e0a:982:cbb0:43af:403f:2c26:9ea7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a477d9sm6494001f8f.26.2024.10.22.05.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 05:05:27 -0700 (PDT)
Message-ID: <55ecee09-196a-4c7a-b7cf-61c19737735b@linaro.org>
Date: Tue, 22 Oct 2024 14:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241008160947.81045-1-brgl@bgdev.pl>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241008160947.81045-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 18:09, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's no reason for this driver to use OF-specific property helpers.
> Drop the last one in favor of the generic variant and no longer include
> of.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/i2c/busses/i2c-qup.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
> index 86ec391616b0..da20b4487c9a 100644
> --- a/drivers/i2c/busses/i2c-qup.c
> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -17,9 +17,9 @@
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/module.h>
> -#include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/property.h>
>   #include <linux/scatterlist.h>
>   
>   /* QUP Registers */
> @@ -1683,7 +1683,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	if (of_device_is_compatible(pdev->dev.of_node, "qcom,i2c-qup-v1.1.1")) {
> +	if (device_is_compatible(&pdev->dev, "qcom,i2c-qup-v1.1.1")) {
>   		qup->adap.algo = &qup_i2c_algo;
>   		qup->adap.quirks = &qup_i2c_quirks;
>   		is_qup_v1 = true;

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

