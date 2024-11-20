Return-Path: <linux-i2c+bounces-8094-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D337A9D41C4
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 19:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECBEFB25BD6
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 18:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0891AB6FD;
	Wed, 20 Nov 2024 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHo1a+x2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8FB1F931;
	Wed, 20 Nov 2024 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732125625; cv=none; b=p0Wr32OqgA1TQrp3LScrr2/0lbYsa8ybK7CvN3X7/WHYpwvQcsYrAsMXnyCYT/Ub8i/P2YWOTh13BV/lZyeIyk4VGq+mxx8ImegAmBriLCgiPcT/wLA5LvsxN0UvzEeLa8nx3qysElUtEThQkF0IDBJ/BP9vHn3oLKPDlOfsIAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732125625; c=relaxed/simple;
	bh=i6R8kkJssIDgVcwuxFE7H4ZdlZSb15xvvuSUmk2sGwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YY0kH6n8Ia3y06mh18bb//VK6K1BnZjjKS1+kNFQKk9WCiIxVwTcdAEYP4XWDOPOc08MYfYO3KeLSRoceuK3mc3NceQmFWUJMzCfs/96p1kLeabsFsqy+mxIFT5ylV+RFNPkR9mjp2fhd6ZsBam7zzMFsDIHGNhuFsMb3p4VmVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHo1a+x2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso47679b3a.3;
        Wed, 20 Nov 2024 10:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732125623; x=1732730423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pFC7gRuwEUwIU3goRx6tJJxo1gNezEBJEX3ODkGVP7Q=;
        b=ZHo1a+x2MMRNIbzUTjLn62v6KS6C20iMtmZqPgDQ7H0AVjeKewV1kNcr+8rwooq4xH
         6SDHOo6ny2SJV4+p7bPlxN1tpGSyiP1Gv3h5oYy4ShdN/P40KfHnQwDqVd9P2UhOAHx+
         jpADAModaux+FVrlz3/wb+RtMAN+/dWm+wX/RKDKcUI8GmrDytUSCjt9C9/tIEl3wI6h
         fwNBOXE2S0/2a4UhwoXAoO9l9MrKhoglCvYSYqRT4GuKapsYyn5VxrA3TCBofEhM5q/K
         8epbvEO3VuLJ40nmVv78WmNPwopO6i+6y9v9IHpUTk5/r0gWSusF8QiXvo9gBxrNNHH9
         cAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732125623; x=1732730423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFC7gRuwEUwIU3goRx6tJJxo1gNezEBJEX3ODkGVP7Q=;
        b=ajP7jk4+I9uo+R3JN07XxlzJm+Vygj92GcFjTVz2zxApPlTfuqrqreKEVD2tvIiU2O
         eCOpPAZ9cDxK0+6M8LAXty6l5NDO8KuuujM5pxpuVMevN5jCMxg3FChZbomycOfdbQ3v
         IFa9xwE7A/Nz54yhTUiujJVN8yPCeawWn6VE9ZAVwlGBn/gsYf+AXMcOwOr83a7VBia9
         +iV4Z9t7pojfqhIjfNyTXYceuuFfe9NauK91bhy1jnKCEwHPICv3CqIVF/S+T2ZOQkwm
         2KrHf1qpwpqDOlg8Z+VFr+bP5a+BL3zEW2xPANePN156Pdou8O6TAxswU8omec7pzYrW
         /KaA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjHYl9uEFB128Eeg+bE0zmkddbQ535O/XoxM5KgPK9UILPa5u1ktbGnoMvKDCC5boN9CN/lcWbqmw@vger.kernel.org, AJvYcCW4AbHbbuRkMdoLPps5UH9TejNDxh6Lrm8mWG8PSRTRdmfdBomnRWZMP0whNQi/ZVlvS9HP4eVeXPBiSOn0@vger.kernel.org, AJvYcCWkAKTrZtBqDPEDEt3Cb2cCqrtdQ+tZnig4eXSBbS7XAjQ60Of7aar2CoEPvYDzznZDrOmtHu/i+G8=@vger.kernel.org, AJvYcCXwDCRi10x2K9P7sv5opvAMa+M07Y1BgERvhNQwtNq+q0r3KRfZr4DqkFO9cvgHq5aZjeUQ0bE+JKtmtqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbPaaT87LfqZpxwJsqFjtR6DK9p1E6okOt29wYfcDpAPkYN8CX
	velLVqtclRJfKQ25M/IuBR1yNr8aal1GB5J1LLDSEsLMp84o9s1D
X-Google-Smtp-Source: AGHT+IGtBHU21hYZhI1zWHbxZDyKvXruQ8NMzZ+kLATwW64vi9AkorIQBMfuokaW5BaMWWjJNBy/LQ==
X-Received: by 2002:a05:6a00:1495:b0:71e:108e:9c16 with SMTP id d2e1a72fcca58-724becb837fmr5156189b3a.12.1732125622771;
        Wed, 20 Nov 2024 10:00:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dce9afsm9756598a12.82.2024.11.20.10.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 10:00:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e2e10b1e-cce3-409c-9327-178cbf4b0d64@roeck-us.net>
Date: Wed, 20 Nov 2024 10:00:19 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings for
 adp1051, adp1055 and ltp8800
To: Conor Dooley <conor@kernel.org>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Radu Sabau <radu.sabau@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241120-process-hulk-ecedcbf088f7@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/24 09:11, Conor Dooley wrote:
> On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
>> add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
>>      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>>      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>>      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
>>
>> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> 
> Why did you drop my ack?
> https://lore.kernel.org/all/20241106-linoleum-kebab-decf14f54f76@spud/
> 

There:

 > +    enum:
 > +      - adi,adp1050
 > +      - adi,adp1051
 > +      - adi,adp1055
 >

Here:

 >> +    enum:
 >> +      - adi,adp1050
 >> +      - adi,adp1051
 >> +      - adi,adp1055
 >> +      - adi,ltp8800   <--

This is a combination of two patch series. I'd personally hesitant to carry
Acks along in such situations.

Guenter


