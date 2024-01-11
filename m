Return-Path: <linux-i2c+bounces-1263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA2682A7DF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 07:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECEA4282054
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 06:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51022539D;
	Thu, 11 Jan 2024 06:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrSuoyWq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313F53A0
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jan 2024 06:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55745901085so6293127a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 22:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704955774; x=1705560574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd07QyDIoOP3gzmBg4u8BJA36mwkVT6PTALF/MNB+YA=;
        b=HrSuoyWqmV9eDnox8KI885CPg0+uS5UHOtat9v1r837rJgNH5eJauNfAuZF60MiCEm
         htu5QB5IMaL/Obob9brmaMIyS3OcPHYk7087IMOK5yDeAh/6rHSqpxZKUTMs/dg2N05+
         MO9ziWKHVyQyvvJrp+3xGdCrTW+/xSs18hRenAS5i9xZ38EMQ+7kd9sgtNRy1q5GagVg
         /JlUmTO247+dxDk0xihBEwWXr2tOjcT+u6I90aeIkl7vhk+D+Xl2UX8F6wrC26pklNR+
         CwZXsPKQPbIbDgvlnbyFZD3lkpOIPQsvq2ChNrDxIV8RkqRCex/qQ8iL9KUXsYsV6onI
         XT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704955774; x=1705560574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dd07QyDIoOP3gzmBg4u8BJA36mwkVT6PTALF/MNB+YA=;
        b=Mx2GCV6CBakFXg72XPZf+Uljj+2RjroM6Ior1cw5QfGmYwdL7T9KwS13BX2flxGTtS
         r/r/A/inRF3LCB6yMGrfIzAdD2AX8MmZA/3eMReO4W5kdurdrOWSUEaEHRAaUtMmd2gx
         bAmqHpbMxxGnp+hO3ENXOyfI/3Bc9MYzCmxxXDAgRXrp2B7UfbjC/32qGfksRkQKPpGS
         wUPLQO4hMTYow0fq15HmARa6SJQ7xBIJyfllPWbAOfExRGLWgfm/BnYFnocABFazOCXi
         xaHdPJUdE+utuWVzz3C5/2iEknlvqZgiTjbQl0eM9e0cQhgbD/XMMt8hVE6QYmV6wlDI
         CTBQ==
X-Gm-Message-State: AOJu0YwIhbsJjOEqcJyMKxOmq5pRbOXRDuYHiy5OzojZyVNpdzn+7X0X
	rFcD6F1/NtQsL0q0WaoTuWU=
X-Google-Smtp-Source: AGHT+IF5gBIDJFfQWndGQMtUIS0IcEMggkm6/fZMl7y5pB0NN6ixNRnVpFJ95NjcbtIGENBfPR72qw==
X-Received: by 2002:a05:6402:1299:b0:553:29f0:d4ad with SMTP id w25-20020a056402129900b0055329f0d4admr267203edv.82.1704955774271;
        Wed, 10 Jan 2024 22:49:34 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc57:a800:a010:8c1:dbe7:d401? (dynamic-2a01-0c23-bc57-a800-a010-08c1-dbe7-d401.c23.pool.telefonica.de. [2a01:c23:bc57:a800:a010:8c1:dbe7:d401])
        by smtp.googlemail.com with ESMTPSA id r25-20020aa7d159000000b005585d2361d3sm254178edo.48.2024.01.10.22.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 22:49:33 -0800 (PST)
Message-ID: <3d48b7b8-7644-493b-b8f7-820dc7abc813@gmail.com>
Date: Thu, 11 Jan 2024 07:49:34 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
To: Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <fc057deb-49f9-49cf-9549-13b2538ed92b@gmail.com>
 <74a310ba-bba8-40f8-82d8-fc0963840a36@gmail.com>
 <029a9957-0436-3a6d-e0d3-78fe2c2a9954@axentia.se>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <029a9957-0436-3a6d-e0d3-78fe2c2a9954@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 00:00, Peter Rosin wrote:
> Hi!
> 
> 2024-01-10 at 21:13, Heiner Kallweit wrote:
>> If this is an adapter on a muxed bus segment, assume that each segment
>> is connected to a subset of the (> 8) overall memory slots. In this
>> case let's probe the maximum of 8 slots, however stop if the number
>> of overall populated slots is reached.
>>
>> If we're not on a muxed segment and the total number of slots is > 8,
>> report an error, because then not all SPD eeproms can be addressed.
>> Presumably the bus is muxed, but the mux config is missing.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/i2c-smbus.c | 19 ++++++++++++-------
>>  1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
>> index 74807c6db..e94714d5a 100644
>> --- a/drivers/i2c/i2c-smbus.c
>> +++ b/drivers/i2c/i2c-smbus.c
>> @@ -351,13 +351,18 @@ void i2c_register_spd(struct i2c_adapter *adap)
>>  	if (!dimm_count)
>>  		return;
>>  
>> -	dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
>> -		 dimm_count, slot_count);
>> -
>> -	if (slot_count > 8) {
>> -		dev_warn(&adap->dev,
>> -			 "Systems with more than 8 memory slots not supported yet, not instantiating SPD\n");
>> -		return;
>> +	/* Check whether we're a child adapter on a muxed segment */
>> +	if (i2c_parent_is_i2c_adapter(adap)) {
>> +		if (slot_count > 8)
>> +			slot_count = 8;'
> 
> The comment "Only works on systems with 1 to 8 memory slots" above
> i2c_register_spd() is now incorrect and needs adjusting.
> 
Right, this comment can be removed.
I'll wait for more feedback on the series before submitting a v2.

>> +	} else {
>> +		dev_info(&adap->dev, "%d/%d memory slots populated (from DMI)\n",
>> +			 dimm_count, slot_count);
>> +		if (slot_count > 8) {
>> +			dev_err(&adap->dev,
>> +				"More than 8 memory slots on a single bus, mux config missing?\n");
>> +			return;
>> +		}
>>  	}
>>  
>>  	/*
> 
> The loop below this hunk is limited by dimm_count, but it is checked
> separately for each muxed segment. It is therefore now possible to
> instantiate a total number of slots larger than the dimm_count.
> That was not possible before. I don't know if that's a problem, but
> the check have been (silently) relaxed.
> 
That's intentional. Keeping the current logic would have required to
add some kind of counter at the parent level, keeping track of how many
memory modules were instantiated per muxed segment.
For the sake of simplicity this was omitted. Instead we may probe more
slots than needed, however only impact should be that i2c_register_spd()
may take a little bit longer on affected systems.

> Cheers,
> Peter

Heiner

