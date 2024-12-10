Return-Path: <linux-i2c+bounces-8423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 841419EB4AE
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 16:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72341881C18
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 15:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6111BB6A0;
	Tue, 10 Dec 2024 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPlq64R/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F84B78F23;
	Tue, 10 Dec 2024 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844148; cv=none; b=sC4RiQ9b81jIq4ivkfWzPJC7gbgBx0p8kqHIyFnRrCUGWKAQkljzxIvu3KUmI30tbPcnCWwo5jIx4MrJ9kMkskkXd1NYmkykfeuoKjEhGuUMyYMyMVjt3OZL/uLXYeXE8GFbJne81shOUFdq9cQKN9xyXXA7jsLwEwJ05wiZOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844148; c=relaxed/simple;
	bh=HVhiN2OBd6AGD8swy+GfRlzAmnRnYgAGWrQ6OR38Ccg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cD6FYPMNdD7HixjKLLPIYRUd8pAp0NKEXCfznBV+AHacXdLR/N78ZF9xgMDew5iGGG68vNXUYDTBmlvC3O8YYjlicguzOYEalOVrIwjOHxIWeLYCMF8qpii8YRuZrr0k5HPqMjqSI1qpv5/ZZZKIGvf4SRvNiVYo5cxst1mhARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPlq64R/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so2290129a91.3;
        Tue, 10 Dec 2024 07:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844146; x=1734448946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rVmwqWOa/zEr6Xgq+J3zkDZBkkOC/ONE9vJotzchERc=;
        b=dPlq64R/VnHWM1bOvw3DqR7NcByzUPGoXCV5GiKn7wex9M8NdMoqm0TeBjgkeU7f8d
         RCxoKiwECnxQB+CDbZSd+o29flMYgpMghEOLrSKzCQettrEu8mJjEJqwhNy43yYGAbdg
         VZs2TLHe7G3cWfmjFWm6JgeVl3VylUrVE6dyIe8a+WnYpoFhSadQF9+z7E9pSdQsj/4j
         S+yo5SiPs8Sx3BoCi0sR7zE7zfA4ZbSCt/XBe8Nl1x34UeAaW3YdCNvhaHzbnhhNrzuN
         xgEE88o9AwvUeGV3p6Fl6GAnGdaOz5dOa05IsoeWih0oVSg28olirIcNYA2CI8U+JTEF
         94Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844146; x=1734448946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVmwqWOa/zEr6Xgq+J3zkDZBkkOC/ONE9vJotzchERc=;
        b=T/nw5f+xL3+eM+sIZSo68XPyMpObrteSkkoVJUyTqu/RfIbqw+xIVx0akFZtKTMXRJ
         NiwFIYmC14lM3QwPmyeXNPLXAAMAYshfFGv2RY8xJ2PzX0pWwg0KVIoAzj/b8D3xO9si
         cZA94cWJg4Hm6R1GKr2k1fcoFDghY//nIZc3/xovqXhZnxC7Xn96iPe9ZgSRemif8T/q
         uypb9bzTR/rhydTQo8uaGU9zSfh9z18BI6odhmaCzQJqUF5d5UKafzK8yTcgE6DAyej0
         N7wXURIxDtBzMOJv+nVH8LxBEg0iK/ml/8sytF3i4hVoTucTrcMMOQ6kEGZFruJ2raRW
         sv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQweumVCZYoI29Em6efbMwYMjZDLB7LTJXK+a/qNTJj7VHVEVwZuf+JaafnDlxWXIHEVrxAdjcNfM=@vger.kernel.org, AJvYcCUxYtdtbXMpmPNvyAc2h77FyCvHI31O2u+QetYn0BF7ee4B3JjawhMhMA7UchRTKIWOQHvIRM1wJ27X@vger.kernel.org, AJvYcCVLOlHavfAmSgwfZIrLstrV3WAfmCYlski5mX6J/7mzaJR7UJl+/W00BS8VBfLjF7pbYANIyemt@vger.kernel.org, AJvYcCW2Ti3PLfgRU0jJ0CQd0lOoV353z4sz1FjMln5JSPWKw2JMIt1pKys+FjsIiWRtTyYn7pDZlZ1RCMH7oA==@vger.kernel.org, AJvYcCWjr30Qnt+HJh1gm5/xKVeLg+I3lX8j4U/IozXXXQVRvc/WNyhpGoQcj/VGuGrq82SaxczwdsExdRay@vger.kernel.org, AJvYcCXK1zm9lsO0eXMUu4wXRwMoWRtv9wIGTKnlFMiIDRZzEB1c28IgX5De//p+Dkytt8YV6iOdeOspEwmiyZU=@vger.kernel.org, AJvYcCXfjv4dgFszjK5q1cbBbpmcRAzcZzSUN/aNzH3dmkRmpB6fGQ7CY31s3ewJ+t3QxJaiEOAh+Aa0X6VfByN2tnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo152wzM+eZGy4rLEpih3aGigxP2TPTkSxmTi3Hk9jA+/+fjbm
	UOYd7mhtMlZZ23uIF1uhf2HqskHuLkUYWZgKUvV5XBSfIJ1MeIUQ
X-Gm-Gg: ASbGnct90AnBzCP9SyzE1p4FmF8jDkRIBF7xG/S6b5tSwgVu+eK1WQSDYe7SeHXlZTT
	DFPFCW5c1/2FNCzViRLfeVnHAaM2fdvS0ksB+dP8cTyXMeET/Mk7BL1AIq15pXs71tvLDOImIOO
	vYaZthOvVqTobGuDc3U1FsnKMpDa0Cc1lgRnYW2XbxSC2ZKMvhlR/RjuAB74AUrdFdvBn12lCJJ
	Wc5xaFr6v4dTdrgKkYWlgVi1icCEV2894U2Y120GOmb/Gp9hvqU3pnTMp0xkW43lJVDpxxi+xm/
	HxxJInOQm+MH0EMQvjH/NL66Q2c=
X-Google-Smtp-Source: AGHT+IE69d+SUpUCbyXFidBraWIC6ZOeXjpJlhEVcNtxdVDV4xbV+c0aS0/OIIKn6yXac6dM5U2V0A==
X-Received: by 2002:a17:90b:3d87:b0:2ef:1134:e350 with SMTP id 98e67ed59e1d1-2ef6ab2739dmr25065458a91.35.1733844144217;
        Tue, 10 Dec 2024 07:22:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f95899sm9954572a91.12.2024.12.10.07.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:22:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e8165e99-9770-4287-8a05-709a9a7bb701@roeck-us.net>
Date: Tue, 10 Dec 2024 07:22:21 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
 mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
 <20241210104524.2466586-6-tmyu0@nuvoton.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241210104524.2466586-6-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/24 02:45, Ming Yu wrote:
> This driver supports Watchdog timer functionality for NCT6694 MFD
> device based on USB interface.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
...
> +static int nct6694_wdt_probe(struct platform_device *pdev)
> +{
...
> +	wdev->timeout = timeout;
> +	wdev->pretimeout = pretimeout;
> +	if (timeout < pretimeout) {
> +		dev_warn(data->dev, "pretimeout < timeout. Setting to zero\n");
> +		wdev->pretimeout = 0;
> +	}
> +
> +	wdev->min_timeout = 1;
> +	wdev->max_timeout = 255;
> +
> +	mutex_init(&data->lock);
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	/* Register watchdog timer device to WDT framework */
> +	watchdog_set_drvdata(&data->wdev, data);
> +	watchdog_init_timeout(&data->wdev, timeout, dev);

This is pointless since timeout is pre-initialized with a value != 0.
That means a value provided through devicetree will never be used
unless the user sets timeout=0 as module parameter. But then the above
check for pretimeout is useless.

Guenter


