Return-Path: <linux-i2c+bounces-3794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA88FB556
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 16:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D221A1F2253B
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 14:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEB013D635;
	Tue,  4 Jun 2024 14:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwbPk1Xu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496DA13CF96;
	Tue,  4 Jun 2024 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511497; cv=none; b=gNg4Pz1yhF8zX/L9/HuX+5bX8jrJ9IqZn1MX8W7X7Q1QRmPuU0rcr6/a5zioK+EJYUL+dyOgwIerWqAbO7dOmaW7JqWaNAEEUdsNxnzc1ztceQsva7D/y5hWp7flw7RnybR1aapsTCQguImUcPzxvaMbhTQ3q8rzntUaZvKk4b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511497; c=relaxed/simple;
	bh=1WSGdLp+UD5bFmugssJHEFegRhyeHsX2gBn93rXfMjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXdaJ2GB3r7zFOmn025reCw2ByRQklYc6Eph9QknquVUbUdHUJWWUtQs48ljZ/hHCJU01+SBa5/NkVpiTRKtYdQKJX1eWLs5lZWd4DcnnC3dx/MfemsFNLNd1iYCSByvjruYO8+zr5wDtLyJK6Ns6q8kBzYsOr7AOCcbnjDPv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwbPk1Xu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f61f775738so40110885ad.2;
        Tue, 04 Jun 2024 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717511495; x=1718116295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2VGDou59bdsH4zjlcFOpFMQmh8HN0lld2Fx8fUhnGKc=;
        b=HwbPk1XuDgpUQtV0EVFncMrLjSGHu+C55awmfaACjaMkcOvHsbRSylmfeHBs6ykZ7+
         CzA7HLz36nEZ5//qUpqRIY6Xo2PMAg/We/LSh2MbJ2X7BIMNS52UjtUn0vKzJrhLVVAT
         DCM/VeJ3ZBNVzU66SjTiJkEgkQcEqzp+94Rd3Oc0OZeuwB+fvbgf6W2QCCWZRIJDH7pa
         3lGDvUno+NeYVbncIZc0qCHcOCwr0u9L9t6ZsgkiNhFDPL7apTGg1wAAzrlX/nl0BMLP
         2kEJZG/V5r7HxfM028ScNH+GNU1UBvlDDHHDSgHivbN3JuxWJ1DX4uw/L3GM92sxba/g
         P1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717511495; x=1718116295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VGDou59bdsH4zjlcFOpFMQmh8HN0lld2Fx8fUhnGKc=;
        b=G5aVmMTwYu/mKjC+ODBz1s7kkFQymL7/3PoIqSZUplUFVz9f70hcYfAILiTIvPuqDB
         /xbp1DCk0jYw2OGi7IW12axsWPlprBA04gTU6hfGx6gusAkFIqtVaNWCANP3dad26EzN
         pyjq39oLveWII9mkJdgwSeM73y6P39+sKwReX0bxjtSwMzy6kgct/XNJ0iqII72y3Rng
         kdtr4JY+mHS+cO3ilD6Y0v53VVpU0/In0zX4ZgFJ0WKE143qRqSWBrkd9/qYAciZoGtj
         ugkHn0CeDHFHSTrRmU1Lwz/37KQogE7mP596Yu4T41NY95RMxuBOH7yqS9v2ebhqSaUg
         5Teg==
X-Forwarded-Encrypted: i=1; AJvYcCXpxdQHrgI1Ch+Dd8I0CPcK9+OHieaxTHbAAUd063GWjDuMuhb+W8aYgY/B8hQvFw1QP/qxITXQiGLFopX2YRiWWO/MdZR349ZGQbQa36TsZaAnq0sMzpXrSj6vavOwA+7rehjVcEexRjdPn8CazRwEk/eY7tzG/ZgKk95RW4qloLZrmRlF
X-Gm-Message-State: AOJu0Yyk1GCtWw79EDMDAf3+vkBg0xL1OebzA03OyTWIYRaqcZ4DAm/i
	+49g3Z58t9PZt8KkarWmHkIRtBHrSGeeyKJ2TgT5QgKmT/tc56B6
X-Google-Smtp-Source: AGHT+IEzDlys+F/jUx2MCmUjvjs8/ulEGsDBmvmCp+PXq8O1xr6iLx5sZJ5+LZBul55ULfaVgAXd1g==
X-Received: by 2002:a17:902:cec6:b0:1f4:8190:33c3 with SMTP id d9443c01a7336-1f637082698mr127997975ad.40.1717511495398;
        Tue, 04 Jun 2024 07:31:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323e9f2csm84612865ad.200.2024.06.04.07.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:31:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <14431116-84c1-4744-a84e-27e9605e7252@roeck-us.net>
Date: Tue, 4 Jun 2024 07:31:33 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] hwmon: (spd5118) Add suspend/resume support
To: Stephen Horvath <s.horvath@outlook.com.au>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-4-linux@roeck-us.net>
 <SY4P282MB3063FE1968B72C3187042917C5F82@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <SY4P282MB3063FE1968B72C3187042917C5F82@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/4/24 01:45, Stephen Horvath wrote:
> Hi,
> 
> On 4/6/24 14:02, Guenter Roeck wrote:
>> Add suspend/resume support to ensure that limit and configuration
>> registers are updated and synchronized after a suspend/resume cycle.
>>
>> Cc: Armin Wolf <W_Armin@gmx.de>
>> Cc: Stephen Horvath <s.horvath@outlook.com.au>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v4: Fix bug seen if the enable attribute was never read prior
>>      to a suspend/resume cycle.
> 
> I can confirm this works for my devices, so:
> 
> Tested-by: Stephen Horvath <s.horvath@outlook.com.au>
> 

Thanks a lot for testing!

Guenter



