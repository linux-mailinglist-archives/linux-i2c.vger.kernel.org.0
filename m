Return-Path: <linux-i2c+bounces-4249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A291345F
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC0E1F2232C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E1A16F26D;
	Sat, 22 Jun 2024 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WubyE8xN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB8916F28B
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719065282; cv=none; b=F/92JKTE2UA5PnCY0qqmVWIVnajTCKtWcS8RuR5Y/LhbH7WBOdOliE4+RAJVe0BGrnhiyIPn+sXIjIwpDWs0qN8M/s5ZFOBXGVe0ZcBaeF5YGlzJY5UpCdVL2nR2wRUm7A1G3bMK162oZCJX6owptTuyQUhOBdoCUbE7h+6X6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719065282; c=relaxed/simple;
	bh=qTFdmgO+j2Afdadsci9lT2KxmfwCbwy8CZNfczi2d8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eACkBXliyyqQcHzuegWsivqS1cvtkpBhYOhg2skhNGiTfSon92afw3hlfmZRTxs6tTshySc3mkNdepcDl6ZsXq4OihpQ/0xLCmLppd6wBRBVNk7ELJkgGxDDIIzF9drJLTAdn8FE3ehHvTfVc68Lg+mzZpVRa29tNNF3TU43Oe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WubyE8xN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719065279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9YGV0mWke+1yU4Fc9eQD30u5SJefbeYebz8h9sfdD/E=;
	b=WubyE8xNkkfKIZoB/AH5HFdqxU7iPlyy2IKifilBGVvGY1mkpEamsZqz0H34jYVMareIg2
	gim4uKouWJdrmHkgtfPPDCA2Qt0Il42fqr1rmepLFRX/sbFELrIRHjTuARoirqG5Sth851
	nkswvsUc62J/c/y13+9hECns4CU3WXk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-netXp-jRPsWMl2wmgcIToA-1; Sat, 22 Jun 2024 10:07:55 -0400
X-MC-Unique: netXp-jRPsWMl2wmgcIToA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a71e1625bdbso13610666b.2
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 07:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719065274; x=1719670074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YGV0mWke+1yU4Fc9eQD30u5SJefbeYebz8h9sfdD/E=;
        b=V0mIVgMHSQdNQEDt572gf7zH+jpYP4j+C6Me060doUkX8q8XYfUvt/oOLC0AFYShj0
         YFIxVngmE/y9hsEsS+v9rSpCmGdhIU+I9uLAUafYurHR28ouiX5myH6Gv4cPKJ/DP6c6
         9CA1T3UkH6vrkis6tzpQzUiQQuS1XKJhAWvkMTrmRqRzkN6cEhFKi+di0Zz6gXu2/npc
         F6HWlfg+YIelFa6HliSArz7X4ag9vCMxi8rV3SbiTn1DfzynNMoPdd3KaWHQc2mN7e/K
         lD2JAdqgCLL4a4nnLzlzb75mejq1V2RqokF8h3C1iEkWkYoICv4H2GaYTQLKMQbKHyVF
         wKrg==
X-Forwarded-Encrypted: i=1; AJvYcCUesr+uTH3EVuQeSPlxXYsrKGpqxwiIDWpSMpp3XbqBDT5SL+u2g4us35cF3V8XIiA91jkZIYTxgodxDJAmCmbDG2XHPWDO3L/c
X-Gm-Message-State: AOJu0Yyh53D5HuQYPaXMYbn4N/bFrjL8ME1q0YoaeEasQiXLjAMBUmvr
	r1DW6lJfN1y8gMyNv5YUDXT0KXkqVxhx37Gidk99k8MTdjHamSuDgxYMlWp8l3378A28ijd1meA
	w0dIODHmWMQ5dMuf7+mKBuNJMb53TNzFHr26+n4bkBh4MpIHC0omjIgMDvg==
X-Received: by 2002:a17:906:c096:b0:a6f:86fd:72b8 with SMTP id a640c23a62f3a-a715f97972bmr67087266b.42.1719065274709;
        Sat, 22 Jun 2024 07:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbg9d+V7WpcfGD/Rrm2N/8gPnsBpEQzQsHVv9M4tHZ/SVSNPw5mxkA5UYxM/TViLT8Idf8fg==
X-Received: by 2002:a17:906:c096:b0:a6f:86fd:72b8 with SMTP id a640c23a62f3a-a715f97972bmr67084866b.42.1719065274223;
        Sat, 22 Jun 2024 07:07:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf4bab45sm201463266b.96.2024.06.22.07.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:07:53 -0700 (PDT)
Message-ID: <5685ad31-f147-4478-b67f-d918b17ed9b9@redhat.com>
Date: Sat, 22 Jun 2024 16:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] platform/x86: dell-smo8800: Allow lis3lv02d
 i2c_client instantiation without IRQ
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-5-hdegoede@redhat.com>
 <20240622132045.tdm5os7ykdkdc3r6@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622132045.tdm5os7ykdkdc3r6@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 6/22/24 3:20 PM, Pali Rohár wrote:
> On Friday 21 June 2024 14:24:59 Hans de Goede wrote:
>> The Dell XPS 15 9550 can have a 60Wh battery, leaving space for a 2.5"
>> sata disk; or a 90Wh battery in which case the battery occupies the space
>> for the optional 2.5" sata disk.
>>
>> On models with the 90Wh battery and thus without a 2.5" sata disk, the BIOS
>> does not add an IRQ resource to the SMO8810 ACPI device.
> 
> That is a pity, but OK, manufacturer decided that freefall sensor is
> enabled by BIOS firmware only if the SATA is present.
> 
>> Make the misc-device registration and the requesting of the IRQ optional
>> and instantiate a lis3lv02d i2c_client independent of the IRQ being there,
>> so that the non freefall lis3lv02d functionality can still be used.
>>
>> Note that IRQ 0 is not a valid IRQ number for platform IRQs
>> and this patch relies on that.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/dell/dell-smo8800.c | 67 +++++++++++++-----------
>>  1 file changed, 37 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
>> index cd2e48405859..2e49bbb569c6 100644
>> --- a/drivers/platform/x86/dell/dell-smo8800.c
>> +++ b/drivers/platform/x86/dell/dell-smo8800.c
>> @@ -310,33 +310,32 @@ static int smo8800_probe(struct platform_device *device)
>>  	init_waitqueue_head(&smo8800->misc_wait);
>>  	INIT_WORK(&smo8800->i2c_work, smo8800_instantiate_i2c_client);
>>  
>> -	err = misc_register(&smo8800->miscdev);
>> -	if (err) {
>> -		dev_err(&device->dev, "failed to register misc dev: %d\n", err);
>> -		return err;
>> +	err = platform_get_irq_optional(device, 0);
>> +	if (err > 0)
>> +		smo8800->irq = err;
> 
> This code should be rather change to fail immediately. If the IRQ number
> is not provided by the BIOS then the ACPI SMO88xx is not usable for us
> at all. So return error from the smo8800_probe function.

The goal of this patch is to still register the bus-notifier for i2c-client
instantiation for the lis3lv02d driver. Existing immediately here (as was
done before) means we will still not register the bus-notifier.

Regards,

Hans





>> +
>> +	if (smo8800->irq) {
>> +		err = misc_register(&smo8800->miscdev);
>> +		if (err) {
>> +			dev_err(&device->dev, "failed to register misc dev: %d\n", err);
>> +			return err;
>> +		}
>> +
>> +		err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
>> +					   smo8800_interrupt_thread,
>> +					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					   DRIVER_NAME, smo8800);
>> +		if (err) {
>> +			dev_err(&device->dev,
>> +				"failed to request thread for IRQ %d: %d\n",
>> +				smo8800->irq, err);
>> +			goto error;
>> +		}
>> +
>> +		dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
>> +			 smo8800->irq);
>>  	}
>>  
>> -	platform_set_drvdata(device, smo8800);
>> -
>> -	err = platform_get_irq(device, 0);
>> -	if (err < 0)
>> -		goto error;
>> -	smo8800->irq = err;
>> -
>> -	err = request_threaded_irq(smo8800->irq, smo8800_interrupt_quick,
>> -				   smo8800_interrupt_thread,
>> -				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> -				   DRIVER_NAME, smo8800);
>> -	if (err) {
>> -		dev_err(&device->dev,
>> -			"failed to request thread for IRQ %d: %d\n",
>> -			smo8800->irq, err);
>> -		goto error;
>> -	}
>> -
>> -	dev_dbg(&device->dev, "device /dev/freefall registered with IRQ %d\n",
>> -		 smo8800->irq);
>> -
>>  	if (dmi_check_system(smo8800_lis3lv02d_devices)) {
>>  		/*
>>  		 * Register i2c-bus notifier + queue initial scan for lis3lv02d
>> @@ -350,14 +349,20 @@ static int smo8800_probe(struct platform_device *device)
>>  	} else {
>>  		dev_warn(&device->dev,
>>  			 "lis3lv02d accelerometer is present on SMBus but its address is unknown, skipping registration\n");
>> +		if (!smo8800->irq)
>> +			return -ENODEV;
>>  	}
>>  
>> +	platform_set_drvdata(device, smo8800);
>>  	return 0;
>>  
>>  error_free_irq:
>> -	free_irq(smo8800->irq, smo8800);
>> +	if (smo8800->irq) {
>> +		free_irq(smo8800->irq, smo8800);
>>  error:
>> -	misc_deregister(&smo8800->miscdev);
>> +		misc_deregister(&smo8800->miscdev);
>> +	}
>> +
>>  	return err;
>>  }
>>  
>> @@ -371,9 +376,11 @@ static void smo8800_remove(struct platform_device *device)
>>  		i2c_unregister_device(smo8800->i2c_dev);
>>  	}
>>  
>> -	free_irq(smo8800->irq, smo8800);
>> -	misc_deregister(&smo8800->miscdev);
>> -	dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
>> +	if (smo8800->irq) {
>> +		free_irq(smo8800->irq, smo8800);
>> +		misc_deregister(&smo8800->miscdev);
>> +		dev_dbg(&device->dev, "device /dev/freefall unregistered\n");
>> +	}
>>  }
>>  
>>  static const struct acpi_device_id smo8800_ids[] = {
>> -- 
>> 2.45.1
>>
> 


