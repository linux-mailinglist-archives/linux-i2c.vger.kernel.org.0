Return-Path: <linux-i2c+bounces-4588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBD92479D
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 20:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D3228922B
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 18:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069E4481D0;
	Tue,  2 Jul 2024 18:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KLjCJSMT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486731CB32F
	for <linux-i2c@vger.kernel.org>; Tue,  2 Jul 2024 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719946456; cv=none; b=eMIONoG1RtQdIRbk8yv0ruIiysKYohCr9cY8N6X1KpBl5Ko1lJgsGjvxrleNmgmal2i3Yc+hTWOkj3A5Nc3U/y3yGA+tAZPFb7B/irHhrgYI1FJQbM2fpllyPhSZwrSl8Nk/GxGuA1X5Q58RAD5hv0/3vT7R6n/o85aOXDaNn8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719946456; c=relaxed/simple;
	bh=4qE85VTHRed9N7yZCyphRi6j9bwjl4sHj+pTdwh7MZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2Q918xWuQgLDpHg3SeFFjxFPgkVxR/PDkEvpfxQUVqHeCaDvf2PX3YtoRjKoQqT3rDEpBgLe89YT8burrA4aZtJ5VSJlL93j1sEDEW8nbJv04AQYKrIhCVfRX4W0VuTikozLOJPMO+vbFBYB0v8RA5sgXndtjenrUMqXSShRJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KLjCJSMT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719946454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LD1rDI7vzH+BUNwJvqoLJztb1cQFJWc/R9BsKURQaEk=;
	b=KLjCJSMTqTSsZI54KsuFjYSPY/YK6G5UfnAaCHKHfVeOVNLVlIhGZRp2LodDd0IuQgGVhj
	fujdDNnxHHPsXnW6klxCasyABoCtSbU7NiccI7shVe1x0GM9h5rUcuom9/kLs533funkIO
	aitWaFMgLdufL093F1AXDuZQXNVbl5E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-Xty6rN0LN8CG7v_J7clF7A-1; Tue, 02 Jul 2024 14:54:13 -0400
X-MC-Unique: Xty6rN0LN8CG7v_J7clF7A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a725eed1cecso283338266b.3
        for <linux-i2c@vger.kernel.org>; Tue, 02 Jul 2024 11:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719946452; x=1720551252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LD1rDI7vzH+BUNwJvqoLJztb1cQFJWc/R9BsKURQaEk=;
        b=of67dGTm2f3P6StY5Jx3LSDR3xEXrKslkD1vMzeKDWe364xc5F8TxM3RS3wq5Zbz25
         tFWAgeLKOZapLf9s2IK+H0moqSGfKLHiXwEjnF9yLfEVSnFkn3jEvFh5vGCCFdfe6fep
         yA1xQRC05uwCMqQ5YJh2xxTyIB6mlUyRwrQqB3W+aqUdK/Ye5jpTIRCM6d6sQ3G3sTu/
         opKISl+PbhzXLNrzy33170ioz5oz1jnmmpVKV3zOyfpy36lE2Me/hnyrGwwFykQXGgp+
         A1Fy5ISvKMqqIQsY5PiORRTNshn/Q9vRzrJEG0yW7DjFaeQ7IjljT5XOWemuRk3vnkGb
         sEog==
X-Forwarded-Encrypted: i=1; AJvYcCU0FBxFt1scAh+r+ZxAsc7u+YTAoUpRvi75OQ7N5VSmHBnSaS13LRRoV9e3wMuLwTYHAc6OyjRVSxu6Q94AfBYf9HvniAVNUmo9
X-Gm-Message-State: AOJu0YxYCctK8Cr/ycwhjvIJ0pVSgBMvRy5sl0or6/ylQtqINMMnAEUy
	uggDlB1WOf19XV9WshVBgBPVTzbk7Mm+DGUOf8383Mmk6XgZ4P+9WUQi4+aWiyMwEg2EIZIsw/x
	5owCK7nggLCy9789HThV4IHu99cSXYNgv53R5bxtYe2p6y3JokgdQOYaIrA==
X-Received: by 2002:a17:906:f88f:b0:a6f:e19:6fb2 with SMTP id a640c23a62f3a-a751443ba6fmr662056466b.29.1719946451741;
        Tue, 02 Jul 2024 11:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXL6gF9jlO+SjQOVwahEtjMkFL6WJuUJ/B/YJlxXCeGU7FUrCdCASvs2XA2/W01kXfugboLg==
X-Received: by 2002:a17:906:f88f:b0:a6f:e19:6fb2 with SMTP id a640c23a62f3a-a751443ba6fmr662054866b.29.1719946451353;
        Tue, 02 Jul 2024 11:54:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b033f3a3sm416843766b.187.2024.07.02.11.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 11:54:10 -0700 (PDT)
Message-ID: <64f9103b-becf-4a66-908b-c655b3c37a38@redhat.com>
Date: Tue, 2 Jul 2024 20:54:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624111519.15652-5-hdegoede@redhat.com>
 <20240624181420.nvdszjycejdc5fer@pali>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240624181420.nvdszjycejdc5fer@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/24/24 8:14 PM, Pali Rohár wrote:
> On Monday 24 June 2024 13:15:16 Hans de Goede wrote:
>> +static int match_acpi_device_ids(struct device *dev, const void *data)
>> +{
> 
> You can mark this function as __init as it is called only from
> dell_lis3lv02d_init to free space.
> 
>> +	const struct acpi_device_id *ids = data;
>> +
>> +	return acpi_match_device(ids, dev) ? 1 : 0;
>> +}
>> +
>> +static int __init dell_lis3lv02d_init(void)
>> +{
>> +	struct device *dev;
>> +	int err;
>> +
>> +	/*
>> +	 * First check for a matching platform_device. This protects against
>> +	 * SMO88xx ACPI fwnodes which actually do have an I2C resource, which
>> +	 * will already have an i2c_client instantiated (not a platform_device).
>> +	 */
>> +	dev = bus_find_device(&platform_bus_type, NULL, smo8800_ids, match_acpi_device_ids);
>> +	if (!dev) {
>> +		pr_debug("No SMO88xx platform-device found\n");
>> +		return 0;
> 
> Is zero return value expected? Should not be it something like -ENODEV?

This is a module_init() function returning non 0 leads to an error getting
logged and the modprobe command to return a non 0 value which is not what
we want.

>> +	}
>> +	put_device(dev);
>> +
>> +	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
>> +	if (!lis3lv02d_dmi_id) {
> 
> You can cache the value lis3lv02d_dmi_id->driver_data instead of caching
> lis3lv02d_dmi_id pointer and then you can mark lis3lv02d_devices array
> as __initconst to free additional space not needed at runtime on x86
> machines without accelerometer where CONFIG_DELL_SMO8800=y.

This is a good idea, done for v5.

Regards,

Hans


> 
>> +		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
>> +	 * i2c_client instantiation.
>> +	 */
>> +	err = bus_register_notifier(&i2c_bus_type, &i2c_nb);
>> +	if (err)
>> +		return err;
>> +
>> +	notifier_registered = true;
>> +
>> +	queue_work(system_long_wq, &i2c_work);
>> +	return 0;
>> +}
>> +module_init(dell_lis3lv02d_init);
>> +
>> +static void __exit dell_lis3lv02d_module_exit(void)
>> +{
>> +	if (!notifier_registered)
>> +		return;
>> +
>> +	bus_unregister_notifier(&i2c_bus_type, &i2c_nb);
>> +	cancel_work_sync(&i2c_work);
>> +	i2c_unregister_device(i2c_dev);
>> +}
>> +module_exit(dell_lis3lv02d_module_exit);
>> +
>> +MODULE_DESCRIPTION("lis3lv02d i2c-client instantiation for ACPI SMO88xx devices");
>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.45.1
>>
> 



