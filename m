Return-Path: <linux-i2c+bounces-2396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD187EF64
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 19:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F0F1F228D0
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 18:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1F255E4E;
	Mon, 18 Mar 2024 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poUywc5M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B556447
	for <linux-i2c@vger.kernel.org>; Mon, 18 Mar 2024 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710784844; cv=none; b=uNWSO4IU4OcPDybBPVP47+840DRyeUe1npomXMIOtHShFHWlkwHQJDxfFLhuovAfv6IK4462DBleaS2zxYNsbVAcbM7gs/m5tQNOANWz1i/xmuoaWBdXe6amQjFe2YNUXxz4Gqs9DP3GXZ0cteEH17ih0CfZZ9bqK8S2OHC2QTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710784844; c=relaxed/simple;
	bh=JZTERrfhGHZ98bdsXf2rYYX8wFraHwMFYnZf4nSwBO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BcFUSGfPoOCZkqD3qYZbGx4uzWWz8synPCeApf6Uuh31JW7YizqjTr9/lI2yJ6QN8ZBOnrpULPUDgrStSdveh0nULIsw34VAlU+GrNpuHm6m9a9ulDQFFyy4pXzunDUAbUia5StpDwWVGoV+qxT1AZcW/GohbjlmHRSOV65N4lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=poUywc5M; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a44f2d894b7so548688866b.1
        for <linux-i2c@vger.kernel.org>; Mon, 18 Mar 2024 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710784841; x=1711389641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSD1BKkDRKT4zNl8Y1a8A4oIxqi6RhgxEsOmyYNbPCo=;
        b=poUywc5MXljQ2hP7OarBtF/S6327rzsXvlTMN8pdPS6y0AHsyMzxk47ZvSx4tq/ErR
         xbQFrgZOnk1PMEXjuGVSd9JdLqmiSHu4f2V3a2byAnoxA5RviP16kJJAUu/7gtCDvGsn
         ga1Hs1AiyRvCvVdCoXY/tuCAnBzMTQUwZiCbgyNrs6RsE01bmH7Js5N8kBkrezEfUYgk
         ajuETanJINB9SHM+AluAJRvtSnBzSksdsdrKE60a8Rd8VpOiXwrTGLS7jirx8gAQXb2G
         tc2qarHx8spFZ9xEPzMuXx+OOw2cosg1Lzvx9rr4kneiv2bflpM6xTPndUpd4Bn/vD7L
         tfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710784841; x=1711389641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSD1BKkDRKT4zNl8Y1a8A4oIxqi6RhgxEsOmyYNbPCo=;
        b=a9Zws1X04QaWegPMpNyoSpenhceS/PpifKNOaFZ094wybeHYybXBw+dl5DVVz3VdI8
         kfURHDOgKqrtFBi58hkwuTrmfrDU8T8fGjFwA9mq1qEtI1rgDdz/nsVbtbxT4PsQnJA3
         wyvdzvNcHo0DGimhA9ksH62T3kNSWElDeSW94UYryICOMMu1LJ3nKAJpcuZ26+5/K5WR
         c2FWUiJhzwYi2KkRWfkftIix2ECDf+UrQjlGpT5pvaiU0XQZ8m6fLCfI+S83RYS4UaQY
         yEOPXj7vtR/1F4tNmzTob+Q64MeDsJucKA2k/9SUpEOj4oKrEqi4OaXQ4uqTE2gr6pRz
         l5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCPc9O0pTaMfbRPrOrFlKeJYlpq8tEpqlWXzYO+uO9icrs6282+Qj4LaEezOlol1yHpSAGjZ/zxtKnPSKdETsPkGspj9qQsU5V
X-Gm-Message-State: AOJu0YwVhqlK5A34Sbfs7KwpQllhzMW1NoMOt1Uacz6qdZUD+yTrBUhV
	cwapL3vSS1/ZYLAsatH9EaLCIHZkIjhmY+7Mgyrn4qD2YyptSF3YajBoEDmQoDM=
X-Google-Smtp-Source: AGHT+IGSsuCCHT+xvdzHHjGgx7IFJRlVzUlz+T9lZi1dvi3o6LaK3eFNhUeCRsLXsrkKn/j+5UO+dw==
X-Received: by 2002:a17:907:94d1:b0:a46:8846:5abe with SMTP id dn17-20020a17090794d100b00a4688465abemr8273080ejc.62.1710784840993;
        Mon, 18 Mar 2024 11:00:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id jw10-20020a170906e94a00b00a46c743bc6bsm969288ejb.32.2024.03.18.11.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 11:00:40 -0700 (PDT)
Message-ID: <ba01a372-b012-4b39-9494-f13b2a80123f@linaro.org>
Date: Mon, 18 Mar 2024 19:00:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Radu Sabau <radu.sabau@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240318112140.385244-1-radu.sabau@analog.com>
 <20240318112140.385244-3-radu.sabau@analog.com>
 <04b39945-e4e1-43bd-83bf-0d7eb3730352@linaro.org>
 <8adceac6-9b23-4457-bb9a-8f7e55a581f9@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8adceac6-9b23-4457-bb9a-8f7e55a581f9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 17:48, Guenter Roeck wrote:
> On 3/18/24 09:12, Krzysztof Kozlowski wrote:
>> On 18/03/2024 12:21, Radu Sabau wrote:
>>> Add support for ADP1050 Digital Controller for Isolated Power Supplies
>>> with PMBus interface Voltage, Current and Temperature Monitor.
>>>
>>
>> ...
>>
>>> +static int adp1050_probe(struct i2c_client *client)
>>> +{
>>> +	u32 vin_scale_monitor, iin_scale_monitor;
>>> +	int ret;
>>> +
>>> +	if (!i2c_check_functionality(client->adapter,
>>> +				     I2C_FUNC_SMBUS_WRITE_WORD_DATA))
>>> +		return -ENODEV;
>>> +
>>> +	/* Unlock CHIP's password in order to be able to read/write to it's
>>> +	 * VIN_SCALE and IIN_SCALE registers.
>>> +	*/
>>> +	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
>>> +	if (ret < 0) {
>>> +		dev_err_probe(&client->dev, "Device can't be unlocked.\n");
>>
>> Syntax is: return dev_err_probe(). Same in other places.
>>
> 
> dev_err_probe() expects the error number as second parameter, so I don't
> really understand how the above even compiles.

I did not explain the arguments, because they are obvious... but if you
need so:

return dev_err_probe(&client->dev, ret, "Device can't be unlocked.\n");

Best regards,
Krzysztof


