Return-Path: <linux-i2c+bounces-2395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3487EDF1
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 17:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701651C21EDB
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 16:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D8E55E6F;
	Mon, 18 Mar 2024 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezgxXPKU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC955E55;
	Mon, 18 Mar 2024 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710780517; cv=none; b=k5vkQLSu76ZdFE6S8pJEbIV2UxgSDNlHBy6PNtKiY/0WVigiL8ECiupWwEHG6CrIg6ETGp7oPf95Xk2S8J28ZIdZTwzwfnPKk82H2QzX34GzEAyudMo3yJDbc1bXesvjW91sXvACqD8pgEGOc+HfLYiGIA9L5ciBoVyB2LMKa1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710780517; c=relaxed/simple;
	bh=lU1C7DTp85JKeNgKskraiH+mdgY/2X4yC/gVSR1xvnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fHZwoEY7EH7/OIXuUfUYVvTY0LU6ieuPCMdYDH5eIJS4Z07xr+OEqAzywxH1nTib8U8IPD5vl2wLizc2CjXnFNXNQlQXI5DqdJTusGKixESX7Nv1lWWkTa9ouo+7g0WtDGxbaLVW8ZQ9VdF+iXPkuBMg+mLU4c7iy1j4mKu7aUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezgxXPKU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1def142ae7bso28414725ad.3;
        Mon, 18 Mar 2024 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710780515; x=1711385315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iZIqnQz5vGWxZVXKOkJZQyu5dPoIWDD5/kalhVDtvps=;
        b=ezgxXPKUlpRyMJ4S99HXbJ5HusOPCeNyCau+6UixsrOKBru9+4JtrP9RSTw9XMSEvQ
         /VR7JR9SRgm20Z7eQehWJNF28uOhc9kHS9nH1Bj4vEV/pVrA41o+iXTKRhElQ+UY/aRV
         JPfnwK99nr6bY0ZNEC92nAREj+VlggvtPvm8gIZReAQ9n6fgiYFzMvo6RRuIWh/ejEye
         tVhtPRw3d50RsxEHuHjlUE465VsqEktxKzFVwFc/bkSeXz1H/ucxoB7s2odwuGoSyHTA
         4FRhHE+0h+w/0U3TYRChsctkSHTYIsqoyCpLwIhniAHLetz67Z3pOSVBNO1umhHgD/ZS
         Oyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780515; x=1711385315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZIqnQz5vGWxZVXKOkJZQyu5dPoIWDD5/kalhVDtvps=;
        b=RI1a4tSn2iL2euxP5L6JtuFZ1oFB41RvG3DYsHyxmIhaJHpXe5fozvS8FH3w8i2EEM
         3v30QUSQtgbQ63j2gzS1+SuoNO6N/II/zSErbf/yx4UjH0XSSCwyK58e4rYgzJWXQP2N
         oCTE04bXlkUeqxh4l4+9gnHF+wlXDYt318l3fvm1FAXVOXGrXDDtBUjupkRCdSBU8W4A
         0IWsKHsVwm9v3vCF/ASi7mSbP9oNDYYa6llG37ubQgrY4uG6ReRF/pakdwPy1fmBtFqU
         kBLKQy6I61FC56xlFGjCWye8YsnbbuvA0H1zyQ6FG+LXbeYH+sBc/fLo0SNQxrdKajek
         NLow==
X-Forwarded-Encrypted: i=1; AJvYcCU1I1czZG0fkNK1c0COwfVAiIJr3kc4FIq928lPLMIBeTuHEMiBSOpExOohYO7jnMN/40NfYEtp+WcBJI6h6z+6NO9f1rNEKbDP6gvEGZIsTHR+JvZ829TA+ooykg1AL5zqcNFgKscXdCY/9K9poxlFGjVA0eVyVgm+hR4l39Xna+6i92BZMxzb5TDtfzQMiFxL0TL3IfTpuayM3XyGKZEXVf+qaXx2e57/Tc65SvAvKODrKk4DTVFlgE/i
X-Gm-Message-State: AOJu0Yye7uYGFfiwnEeZm/cJw5Pzlgfivqd7dVgP1537gnVo/BE+KeTc
	FFePzdyfGQd0u4DoVCF+14f5v0uGlZaoT8MjjR0+B3V7YlIqY9Fs
X-Google-Smtp-Source: AGHT+IG6M8/5lB2addB/juUQJBdlWWsB8Nf1BI7pBnm8QdHQjPXouIOnERH5hJQZWk8zecX3k6LseA==
X-Received: by 2002:a17:902:d512:b0:1e0:1355:c6b9 with SMTP id b18-20020a170902d51200b001e01355c6b9mr5063253plg.32.1710780515262;
        Mon, 18 Mar 2024 09:48:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902ce8900b001d949393c50sm2984482plg.187.2024.03.18.09.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 09:48:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8adceac6-9b23-4457-bb9a-8f7e55a581f9@roeck-us.net>
Date: Mon, 18 Mar 2024 09:48:33 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Radu Sabau <radu.sabau@analog.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240318112140.385244-1-radu.sabau@analog.com>
 <20240318112140.385244-3-radu.sabau@analog.com>
 <04b39945-e4e1-43bd-83bf-0d7eb3730352@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <04b39945-e4e1-43bd-83bf-0d7eb3730352@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/24 09:12, Krzysztof Kozlowski wrote:
> On 18/03/2024 12:21, Radu Sabau wrote:
>> Add support for ADP1050 Digital Controller for Isolated Power Supplies
>> with PMBus interface Voltage, Current and Temperature Monitor.
>>
> 
> ...
> 
>> +static int adp1050_probe(struct i2c_client *client)
>> +{
>> +	u32 vin_scale_monitor, iin_scale_monitor;
>> +	int ret;
>> +
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_SMBUS_WRITE_WORD_DATA))
>> +		return -ENODEV;
>> +
>> +	/* Unlock CHIP's password in order to be able to read/write to it's
>> +	 * VIN_SCALE and IIN_SCALE registers.
>> +	*/
>> +	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
>> +	if (ret < 0) {
>> +		dev_err_probe(&client->dev, "Device can't be unlocked.\n");
> 
> Syntax is: return dev_err_probe(). Same in other places.
> 

dev_err_probe() expects the error number as second parameter, so I don't
really understand how the above even compiles.

Guenter


