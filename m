Return-Path: <linux-i2c+bounces-7652-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9EF9B4BB2
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 15:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 980F91F24286
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 14:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4FB206E7F;
	Tue, 29 Oct 2024 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipb9Fkmu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAE342A92;
	Tue, 29 Oct 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210657; cv=none; b=BxfH+8X55rKqhxSj5S4IwtTUJsINwIZCxs+g/yWuMdtKA5cfICXhh/T34fJYRTQfoMxsNrnu/yFCSOUmXPwD/Hm8ngt0W0ilkT2C4WUUuZDQcSh6pUIM+uxwHIjIBwbajOoGZ6c8GDtBdA1JfLMdf6j3rnvwHy76fXJvX3IQjh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210657; c=relaxed/simple;
	bh=TvuNTL7SyBUr5XzYcYROeWUrQug9uWaIiBGaGzcweKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdSDSMCUuSwTJ8lCf/zz3DVrtyNcTa4Xozyk3amS/000KMauYanGI1ekPxGhqw6oUKnMRGGkTcKrv17NcZK/8L80znYgWJPBaY6byRkJqXxw5WKJhZsU3DEpo/ZZUCLqRgo6Kb0zQ3zy768fWRZH7dnJ4/QILeINd1b3dJ4df8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipb9Fkmu; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso4128133a91.3;
        Tue, 29 Oct 2024 07:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730210653; x=1730815453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mbJq4aynNBIlp+QtSqztsSxSToGTnBQw+OLXV0uvZxU=;
        b=ipb9FkmutTOgn282bIcDG29oteNuW9wGcbxGt/xeicxJEco2vxaXElZwNxmFC73UNW
         uKK0rSMbmxRiXVVrtzJn4JK7im3uFJ7LlatPTvyE35HIuKT9CQ5SdQhevnGiOHMgabyh
         m+m4vwOA8moI6wAG8t2DuOzCwbd/hkzW2CLuOmNyo18MDpBNd+AONot66yniemwGWtYd
         qGIMfhLLo+vDYTzuqTSi1rcfESnOSPJYhjAtLSTaUdM89kFJfCn/n6eaL8d2TtDjnlBS
         voMpLUtXNC5lOv22amGCjugJdqN1i6W+aKesa2veJWg50eZ9D7VhAMEKqfbsusua3z4K
         lMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730210653; x=1730815453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbJq4aynNBIlp+QtSqztsSxSToGTnBQw+OLXV0uvZxU=;
        b=cGpXXg27KjzJRnBaiHNwbfl6XJVsl/CRf3MTDXy63uBTXlU7bqV5+FN8c92PATxa2N
         mqfX1pzGh0n3x4MT/+ptDhHbxOZ56JueUU/2SMRr7Uws3dCh2gtgmTF1+EdKsbylIpaw
         8w4eNGWI2QOm0iKD+hyLmiUDQJEZgZXr4WOjcQc4Ush38y0DiaWrrdF0USvRcahcog2C
         rhbZg3g8oAhIOUC0tfpy6oo/awKzS16gIy8rvBniF3Y7qUg/4z6jVkIkyoc2YVKGO6CX
         pkfJUNIPvJH7arS9MAbqOEX8DrxG2TNgCCmPlsKbrDcUQfjNxbcQLBHAWM68JJJFjWVd
         Ovdg==
X-Forwarded-Encrypted: i=1; AJvYcCUu5y3lU0lb5YiMgkedFYNySDg3xgHdlYoJcJWqPMjJotAksaOCbX6w+dB/LRpKJIHedWy5V5YddK/wbvA=@vger.kernel.org, AJvYcCUzS0dPrJLNOZlGxavBANJT7DU5Uo5PlgbrjZQMoIEWI97EK3e0LcjgaoOpmC5JkA24ojwR2te2Y6EK@vger.kernel.org, AJvYcCWlK1E1zvcr812AICdzuuEVXlzuwBMvRnE5MPTBjEPDUUh8FNWj9o7OH5XIja9BdMNDuMksJ9Hx5qjHXp9c@vger.kernel.org, AJvYcCX/OvLOZ/kikawvlSryyGKQOTDeIfYbf0sCZrrbbaELGJSqMWQzUS1UtKtOBnHFQANfVsLQilthWjsH@vger.kernel.org, AJvYcCXp1SFTTBkCtV4f35Xn/KO7Dh/jUv7Yg5OH2oFZO35sm/4ca7yf60RImAMnmo3Fc0eYVgtUtl1/3F6G@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDgWahLEiumbBAnzOgSe0HVhSYs8vvPjygvuXrPuNGvzct7uo
	YlxY8yQg6+9YvufkRsC0qnCt9NS/P+s0iex0AgZ/oX19AjBp2YxC
X-Google-Smtp-Source: AGHT+IEb1muRy0bzGGld0pHfL8s4Rd+CUSYo+Pjgo2ZFtcvZbZa4DodmpxNdighfGVGCfMUGDSePAw==
X-Received: by 2002:a17:90a:468c:b0:2e2:d3e9:eb33 with SMTP id 98e67ed59e1d1-2e8f106f579mr14573261a91.11.1730210653345;
        Tue, 29 Oct 2024 07:04:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4c08a4sm11477398a91.12.2024.10.29.07.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 07:04:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85afa3f3-1e6b-4f05-87f4-24c3aa309b66@roeck-us.net>
Date: Tue, 29 Oct 2024 07:04:09 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: add ltp8800
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241029130137.31284-1-cedricjustine.encarnacion@analog.com>
 <20241029130137.31284-2-cedricjustine.encarnacion@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241029130137.31284-2-cedricjustine.encarnacion@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/24 06:01, Cedric Encarnacion wrote:
> Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
> regulator.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>   Documentation/devicetree/bindings/trivial-devices.yaml | 6 ++++++
>   MAINTAINERS                                            | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index bd784f6bb38b..efd959708c75 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -43,6 +43,12 @@ properties:
>             - adi,adp5589
>               # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
>             - adi,lt7182s
> +            # Analog Devices LTP8800-1A 150A, 54V DC/DC μModule regulator
> +          - adi,ltp8800-1a
> +            # Analog Devices LTP8800-2 135A, 54V DC/DC μModule regulator
> +          - adi,ltp8800-2
> +            # Analog Devices LTP8800-4A 200A, 54V DC/DC μModule regulator
> +          - adi,ltp8800-4a

I don't immediately see why this chip would warrant three entries instead of just
"adi,ltp8800". Programming for all chips is the same. The only difference is
the power rating.

Guenter

>               # AMS iAQ-Core VOC Sensor
>             - ams,iaq-core
>               # Temperature monitoring of Astera Labs PT5161L PCIe retimer
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca7e827da33e..a6abf7243b94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13555,6 +13555,11 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
>   F:	drivers/iio/light/ltr390.c
>   
> +LTP8800 HARDWARE MONITOR DRIVER
> +M:	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +
>   LYNX 28G SERDES PHY DRIVER
>   M:	Ioana Ciornei <ioana.ciornei@nxp.com>
>   L:	netdev@vger.kernel.org


