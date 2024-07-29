Return-Path: <linux-i2c+bounces-5075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 330EE93EA4B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 02:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6A381F21E14
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 00:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A241C27;
	Mon, 29 Jul 2024 00:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLDNjHkU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91348F44;
	Mon, 29 Jul 2024 00:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722213118; cv=none; b=oMPf8N/bRoW97QhMfnh9Awu91GWiy9Ber+oaYmE0x/IaJKfzJMHFah+05q+r3P1GrxH8g3bQPdA53cY05/Uo6NUoZt0wOZfc6T0PQBduJ2b91fpSvdZyBoxtngUG9qHB8sccTYZ5zECjlt4Gc1VsRSY2/bT09QzMiivPb0min5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722213118; c=relaxed/simple;
	bh=K0YwkV5fW6aQKaWlzuGNgSBioIg5N9TdLDcjXVvm1BU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y5NsC1neY8qHmhtq1sQqok2wpn91UglOyQAIkqHgNnfM4NuLp2iSWsay2xPO/7mFNIMIGdGp3aVghqtj3uNWsJeJJAKidLkSKoMhksfssY9LvGDvlOOgYSingx8EIuPNs+14zDsqwApeb8gspwkvqTTfudvHVWqmKicniqVAs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLDNjHkU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc4fccdd78so13763535ad.2;
        Sun, 28 Jul 2024 17:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722213116; x=1722817916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=14Wkz12pSCKhCaoH0rXwqNOwK3NwmwyGWLkokGxMp2o=;
        b=FLDNjHkU+7lvv1MUUnEe/fWV9k5PB1mNxgRj0nJbTThthPb5PqEGxcjMYKFP5xFBpB
         bsGtE8E0TmNjej3Mn1MFcM+9xIEKRwVXrBjVlJPAVeQxG7hQ7QuuX4GvafCYRFXDlCd7
         pzzMJRRODqiie5VRw450IqkjxVx3uKQt/TG5Ax8cgMCHPt9kHz6aVVizvgYikLL/HF30
         1dl3QRNgbmOwmVDiebv2kOjbSI7dcVcHWuNsWc+EtHaODTIJg3p10pxt2DKgG0MmZX0Y
         R17bfyq6In2Pak+AnG7x3aw9KDYtzT+jFRWHXCEad976kCIjP33Qh05skMiwmfZHidyF
         dF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722213116; x=1722817916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14Wkz12pSCKhCaoH0rXwqNOwK3NwmwyGWLkokGxMp2o=;
        b=u59lJpIBhUXjO+ZG0/oT/Uqv3uiFp6ZY04tjj5hHbJIr64cOq+oxYvs/0ncqBaBSwp
         sCjmX0nLZCedSDu05DzgVrKGc63efFFFmn5Z8CiC07KyeeUU7TKjcnrcDIM/ETJTGO20
         6h52+cp16dxj27RFCw0GRI5oc4xOowpBJAHQ6E4R9LqlF2il8Aa1Vzd7Pxk1pOMIBYmC
         pyB5r/HrI8MiRZo0Oj9WKObuD+w27YUteLPmJXRmFO3/NYS6EUxyyxR7FurzdaJFzGUx
         azXm/HSRoufBxcesw15jdHMZqV92LbNCTMJRdyJBXZKp5Wm2mDXnTjsqlB8aSNvuK8Xg
         jJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy3GcCvrlW7Wgd9xTtCJbpzz7s+QeL0D94LfAZplNazxFxgQI+il13O/CkQ+GyTU/Z0qhL4CmJw6CZmdXHGJoMF6M/rH0z3Bu4z8d4iCIs2YF1KXunQSVcHQ974IUMfIAfNRy2iKrR
X-Gm-Message-State: AOJu0YzQD0ggDsZBbytHM4DYNXvi3tOLpjOcAmqHnYVLN2BypYXaADQN
	oir4LfQcBnS7D+EfKX1InC8dbKw24GWp3rrE0hIimL2ex8pye1ir
X-Google-Smtp-Source: AGHT+IEGmz3FqtuoW/lieh1+25sTAh77kL52CfqS9Wm27rYB+nR3DbtfdYEdLkSiZ/EOqbeXDN01tA==
X-Received: by 2002:a17:902:ec8f:b0:1fb:5407:22ac with SMTP id d9443c01a7336-1ff04809049mr60731325ad.3.1722213115879;
        Sun, 28 Jul 2024 17:31:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee6aedsm69988845ad.158.2024.07.28.17.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 17:31:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7ad68f35-2e90-41b7-a95d-efe5f7db8f3b@roeck-us.net>
Date: Sun, 28 Jul 2024 17:31:54 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices
 if source not found
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-3-linux@roeck-us.net> <ZqakaAn3f9Kg6Lgy@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqakaAn3f9Kg6Lgy@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/24 13:04, Wolfram Sang wrote:
> On Mon, Jan 10, 2022 at 09:28:57AM -0800, Guenter Roeck wrote:
>> If a SMBUs alert is received and the originating device is not found,
>> the reason may be that the address reported on the SMBus alert address
>> is corrupted, for example because multiple devices asserted alert and
>> do not correctly implement SMBus arbitration.
>>
>> If this happens, call alert handlers on all devices connected to the
>> given I2C bus, in the hope that this cleans up the situation. Retry
>> twice before giving up.
> 
> High level question: why the retry? Did you experience address
> collisions going away on the second try? My guess is that they would be
> mostly persistent, so we could call smbus_do_alert_force() right away?
> 

I honestly don't recall. I had some brute force code to trigger alerts
on connected chips. Maybe the idea was to catch situations where another
alert was raised after or during the first cycle.

As for "call smbus_do_alert_force() right away", I am not sure I understand.
Isn't that what the code is doing twice ?

Thanks,
Guenter

>>
>> This change reliably fixed the problem on a system with multiple devices
>> on a single bus. Example log where the device on address 0x18 (ADM1021)
>> and on address 0x4c (ADM7461A) both had the alert line asserted:
Side note: That was ADT7461A, not ADM7461A.


>>
>> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
>> smbus_alert 3-000c: no driver alert()!
>> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
>> smbus_alert 3-000c: no driver alert()!
>> lm90 3-0018: temp1 out of range, please check!
>> lm90 3-0018: Disabling ALERT#
>> lm90 3-0029: Everything OK
>> lm90 3-002a: Everything OK
>> lm90 3-004c: temp1 out of range, please check!
>> lm90 3-004c: temp2 out of range, please check!
>> lm90 3-004c: Disabling ALERT#
>>
>> Fixes: b5527a7766f0 ("i2c: Add SMBus alert support")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/i2c/i2c-smbus.c | 38 ++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
>> index 533c885b99ac..f48cec19db41 100644
>> --- a/drivers/i2c/i2c-smbus.c
>> +++ b/drivers/i2c/i2c-smbus.c
>> @@ -65,6 +65,32 @@ static int smbus_do_alert(struct device *dev, void *addrp)
>>   	return ret;
>>   }
>>   
>> +/* Same as above, but call back all drivers with alert handler */
>> +
>> +static int smbus_do_alert_force(struct device *dev, void *addrp)
>> +{
>> +	struct i2c_client *client = i2c_verify_client(dev);
>> +	struct alert_data *data = addrp;
>> +	struct i2c_driver *driver;
>> +
>> +	if (!client || (client->flags & I2C_CLIENT_TEN))
>> +		return 0;
>> +
>> +	/*
>> +	 * Drivers should either disable alerts, or provide at least
>> +	 * a minimal handler. Lock so the driver won't change.
>> +	 */
>> +	device_lock(dev);
>> +	if (client->dev.driver) {
>> +		driver = to_i2c_driver(client->dev.driver);
>> +		if (driver->alert)
>> +			driver->alert(client, data->type, data->data);
>> +	}
>> +	device_unlock(dev);
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * The alert IRQ handler needs to hand work off to a task which can issue
>>    * SMBus calls, because those sleeping calls can't be made in IRQ context.
>> @@ -74,6 +100,7 @@ static irqreturn_t smbus_alert(int irq, void *d)
>>   	struct i2c_smbus_alert *alert = d;
>>   	struct i2c_client *ara;
>>   	unsigned short prev_addr = 0;	/* Not a valid address */
>> +	int retries = 0;
>>   
>>   	ara = alert->ara;
>>   
>> @@ -111,8 +138,15 @@ static irqreturn_t smbus_alert(int irq, void *d)
>>   		 * Note: This assumes that a driver with alert handler handles
>>   		 * the alert properly and clears it if necessary.
>>   		 */
>> -		if (data.addr == prev_addr && status != -EBUSY)
>> -			break;
>> +		if (data.addr == prev_addr && status != -EBUSY) {
>> +			/* retry once */
>> +			if (retries++)
>> +				break;
>> +			device_for_each_child(&ara->adapter->dev, &data,
>> +					      smbus_do_alert_force);
>> +		} else {
>> +			retries = 0;
>> +		}
>>   		prev_addr = data.addr;
>>   	}
>>   
>> -- 
>> 2.33.0
>>


