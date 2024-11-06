Return-Path: <linux-i2c+bounces-7818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D4E9BDDFC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 05:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B85FB225A9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 04:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D1518FDBE;
	Wed,  6 Nov 2024 04:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw+4AYHM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C7A16A943;
	Wed,  6 Nov 2024 04:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730867647; cv=none; b=MQSF2M+ykAW3R+5Zk/rfK0y8iw05u0FYh6qnTCxyfXZxfqrbL4Apx2ndj7hGM1s8TlIFm4/btY6dFVnKU/aQgYHAlmZ0aEHUmfePfV1Q2TOlffQFyNBiDtDVfrroQd6rp4+9czb745dzYBX2vHahEgixWe6UKN3glDe0zPDwkoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730867647; c=relaxed/simple;
	bh=HheYRP+RgsWn9uNIev/5lyG8eqoOCfRT8hOdlJ3GEsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffyb7yd5Ixvn4jJhY57D9fc2XP53cNJrtFWbufxcyLASy0qcWGeUflsv4L2YhPJuMoqOXcZL8I9Mzu0/remWy0ZQfdevPjcY1wCB5mRPB9SCl8TYzUWiSKh1NrszuR68CdYPP58PwQJmImxUE8plsPdeg8XoYWtxdCcpJ8WEHAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw+4AYHM; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so4947564a91.3;
        Tue, 05 Nov 2024 20:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730867645; x=1731472445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=87jVHtd1KnAMU7ICz51A+0/GbUj8xK29s4iCvFn6sec=;
        b=Bw+4AYHMm7+G5e9X22Q+cdV/a047hd4qDpug6yD/Lyx3R98vGoAb4AmJnropMDERVt
         3smkUkzo0n6GtW0q7LglkW4+imfo5eKCI7MkoBP2HZtu9xrb4zEHFymgkMKLzCMUVVtF
         6Xo3c/N1a4M7xFR/zjxcs76XWKkhRPgudlj0IoJoyTO6qb89+h6SoQMferqj1p7PtZUY
         4eW/TFoe0QVHrsXfHKhUdgqcZAmoDDEWzgf6P2YIzCWW0xU956OLz9xefhgG2Y1QF+T2
         VIqdnIK9YylmGVoTmGZoxZt3XaJ85SqwT1d8FU2K+5J2lB9NJUm8E5iRBgZ3p0k0097w
         ivTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730867645; x=1731472445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87jVHtd1KnAMU7ICz51A+0/GbUj8xK29s4iCvFn6sec=;
        b=t2hFkOJr74d2A7Moc34oRiCyTuXDJOQsiy/sX53T7+TeHJXlQDPAV9ZxQk4yUKBIe5
         uGG73mX2JxUQIMYp/1TtHlatlUJCYwBBJ2CA1a9X30ZMOhiyWGbGmAbcRI4mrWWWcHHr
         zT4zlBKlxX1atEn49VRnwJoB0t3k4smh2BHiO7PQBVxOQRTZGJeedMNAXOsQ3r9HXsHU
         itkbGcpjUK5jqg8yMr1dQxMPl6AGWgyJwJVpB90/pRo8HtVIOesSYTDCV1RVzUnG3+mP
         KJA8VcaphBgaAkxGjolfvaitcsAogQQ5vG7yrLgyrnjvcaI5QB1q9UKPRq1E+1oY5hh8
         AK/A==
X-Forwarded-Encrypted: i=1; AJvYcCUMrfI4Zl8lUKgtPwIbLfjLHVGAQ7Z9orsEE13ALr7hP+kzq6z8NkTVwmhE/UzwaCO4XNNHDLgd3faG+ygZ@vger.kernel.org, AJvYcCUVqNNVRY2Y2/TE5wWTq78U5eZcTuIXWLzUq3KeNkI+grorBFlfCDPGT9iKPpNGkZ2uoff+Ps1UUmY0z2k=@vger.kernel.org, AJvYcCVVX9MLTwJpmQnbDR8OrTlT8ShZ7xmWO6VgQ4cP5hC1Ah9RCl8QiY4hQDPvr4IFSBj7MI6j9p4XIJ3t@vger.kernel.org, AJvYcCVz0btiFBgQCJ0MqltaxAjUpruWu9519i3x60H+QWKMUWJCnnkAPvwFRiEKR3yD9RkMLOYUrl62mvVF@vger.kernel.org, AJvYcCXgPqMB//GjzjR0VXcFFMzsvReoB+MbiIsmIV/k79G+6xvHkxngl6W2bjy3jY97ZTNQgTXq9VExLSnG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4X1uOm1bVUZqg5v+YX5KK2334dc+HAvNlI0celmlNqUtcMPP
	LkR4FqyEgDCnXnioRxZCS3X3Kq53ojdz5KPeXV6hUxHO4z9XEZgn
X-Google-Smtp-Source: AGHT+IESFCvZDl/6c+yFKwLdqcJSIb4eE2eXBWbzf541CLu50KDraET1/2dT5FhwK79ymVWXadVEVw==
X-Received: by 2002:a17:90a:f406:b0:2e0:d693:7884 with SMTP id 98e67ed59e1d1-2e8f0f55a2bmr42611639a91.5.1730867645184;
        Tue, 05 Nov 2024 20:34:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a4f97b2sm424422a91.8.2024.11.05.20.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 20:34:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
Date: Tue, 5 Nov 2024 20:34:01 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
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
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/24 19:09, Cedric Encarnacion wrote:
> Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
> regulator.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>   MAINTAINERS                                            | 5 +++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 90a7c0a3dc48..72877d00b8dd 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -43,6 +43,8 @@ properties:
>             - adi,adp5589
>               # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
>             - adi,lt7182s
> +            # Analog Devices LTP8800-1A/-2/-4A 150A/135A/200A, 54V DC/DC μModule regulator
> +          - adi,ltp8800
>               # AMS iAQ-Core VOC Sensor
>             - ams,iaq-core
>               # Temperature monitoring of Astera Labs PT5161L PCIe retimer
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c357800519a..6ca691500fb7 100644
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

This entry doesn't make sense in this patch.

Guenter

>   LYNX 28G SERDES PHY DRIVER
>   M:	Ioana Ciornei <ioana.ciornei@nxp.com>
>   L:	netdev@vger.kernel.org


