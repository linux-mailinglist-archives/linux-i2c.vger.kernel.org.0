Return-Path: <linux-i2c+bounces-4316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A30C91574C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 21:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED290280E9F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 19:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F811A01C6;
	Mon, 24 Jun 2024 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtGEgcHa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE319F488;
	Mon, 24 Jun 2024 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719258028; cv=none; b=LyJwY9DWEGrv1NvtME9uprCIOY9m39hv/g9MzlW4pzBt+d0rcMDjYoQL3Gwm/ptBXcTt458qRRGCaRio6SHGcV0m+rgrAakEb6sRwa5FZ+HNExm5A2VpxIsvjOHpN8/0EdwQW/UnQ9c0+pBTJ8dHUB/r9nQjtqdqIyXlxnThqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719258028; c=relaxed/simple;
	bh=OCorXMmyCZsRKY8LkMblQdVV7eIcpGG+td+4CZApCec=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nV+eZ7sl/kyPPGa+Ppce5Eo0d6jbY/dB08KtwFNiq8c0JJwyr3QvU9qetDLwsNNxUcEuHB+cB0RZVWmaz2UDZ3D9kyfFwiur+cGLM0bUp/f8S0RzXwMjIXoTIo6roC2yFx3ltZeFnYQqyx9mc+EYYep7eo9ud54lzvNuOIreY/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtGEgcHa; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a72477a6096so210052566b.1;
        Mon, 24 Jun 2024 12:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719258023; x=1719862823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6cT1wNH3RL5ysP2jUvx0j99sE2SmsmYSUC3XeK/VX8c=;
        b=BtGEgcHaPPHtnQjQORh9h65EECrQ3TxNTR5m7cP+OUFnC4KKKWBuBgQjFdE9vEZQRx
         +XPBXUn6DpiGKuD8ucm3xNEZkoAZ0dW2sv3Ow0GQVOV3qg455huNOo9AHVZgMOZU8PvZ
         JAD52HPwqK0XyecgjanQOdQeuN86erDFEfyBlcTZj4NcEhVyPCL1I8rUZ/OjJJB/VxFI
         uuWUJsIq0u0UxpcOITUw9LwDIBxJhFphpOv3oMvAn2i6mLtDTdaR8m4PjHw5KKJrGPC3
         gAxs+VGhEH5At+5GJEuhVDf0M4gwNKpIPy2Vxd5G9DtqjlBSK9jOSowlvn0u1GeI+OnC
         Rz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719258023; x=1719862823;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cT1wNH3RL5ysP2jUvx0j99sE2SmsmYSUC3XeK/VX8c=;
        b=nbyBKzXTDVVkYFPkn1uNy/CC7KprsI9W1guuZrVERjqqFJ9w87YQNY1NGE6+yZE79e
         JEzOvy/6rmco4O770hYIsp4wTxxswM4aLBspv6HfbKWaclI4VlVZSPVmKo2q/AHyw4Gy
         Zd+39p7GxPGuPm571m+iDr4vv1CSmcM9d5TCPrF01hFYlhdxxe30F2v4FsSrafaEyj8T
         F560ABP52dQdFmF+KvEFoA2w5Xhxqh8us6HA6MxO/g3uU2w4ottRLqScc8tkfza7h3aB
         1N/j02Z/+rLGwnP6znEWJf0kHot/WYell4Z0vb3HWi7Obw1lP7YznWvskB/g/D6Ne1qJ
         cAwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuHVBWJXePkkS+DUwy8oiWbpfw3mX2i3GjTdL5rdRWHAe1DtNWxToeF45jYuD0U7OJ5uORwOH/RW6qCUutxGfY8KkMbuCD5wJIQl/j5PD67LeJQZT6+3mN+Gt5Ed/sGcNVmBm724bk
X-Gm-Message-State: AOJu0Ywjd6VrMWDYqAeuEEos/usXAKOih3bo2JfLMDo7qpbo6yz4nW1p
	HiFBDQ1yPOEHkN76dKH62+NtgdtlMHE1ttFgjokBXiKtqmrJSUjV
X-Google-Smtp-Source: AGHT+IHp+pAVouYnRk9KiE9mElbpdbsNMHSCr7y6GWgDjEcr8B5m6RLNnc5nMId/xfFc3Cdq6ZeftA==
X-Received: by 2002:a50:ab1d:0:b0:57d:4d12:61bd with SMTP id 4fb4d7f45d1cf-57d4d1264b8mr3197624a12.37.1719258022258;
        Mon, 24 Jun 2024 12:40:22 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c07d:2d00:ad78:a407:846a:969b? (dynamic-2a01-0c23-c07d-2d00-ad78-a407-846a-969b.c23.pool.telefonica.de. [2a01:c23:c07d:2d00:ad78:a407:846a:969b])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57d30534c05sm5036146a12.75.2024.06.24.12.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 12:40:21 -0700 (PDT)
Message-ID: <27e28354-5658-4be8-a7fe-31dacd40586e@gmail.com>
Date: Mon, 24 Jun 2024 21:41:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell PowerEdge R930: `i2c i2c-0: More than 8 memory slots on a
 single bus, contact i801 maintainer to add missing mux config`
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.com>,
 linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Dell.Client.Kernel@dell.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
References: <b45ec360-9f3d-4f17-9d39-78f60890e865@molgen.mpg.de>
 <ykeksv7wbrxvuju37vdrrnalrbkvtvq3fqjsbhcaqtm3uignzj@ihuihrgxsq3t>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ykeksv7wbrxvuju37vdrrnalrbkvtvq3fqjsbhcaqtm3uignzj@ihuihrgxsq3t>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.06.2024 03:31, Wolfram Sang wrote:
> 
> Adding Heiner to CC...
> 
> On Tue, May 14, 2024 at 12:45:04PM +0200, Paul Menzel wrote:
>> Dear Linux folks,
>>
>>
>> On a Dell PowerEdge R930
>>
>>     DMI: Dell Inc. PowerEdge R930/0T55KM, BIOS 2.8.1 01/02/2020
>>
>> Linux 5.15.131 warns:
>>
>>     i2c i2c-0: Systems with more than 4 memory slots not supported yet, not
>> instantiating SPD
>>
>> and Linux 6.9 warns:
>>
>>     i2c i2c-0: More than 8 memory slots on a single bus, contact i801
>> maintainer to add missing mux config
>>
>> What information can I provide, so the mux config can be added?
>>
See Asus Z8 mux support in i801. At first it's relevant whether the system
uses a GPIO to do the muxing, or some other mechanism. Then the mux config
parameters are needed. Supposedly only Dell can provide all this information.
Therefore +Pali who maintains certain Dell drivers, and +Dell.Client.Kernel@dell.com

>>
>> Kind regards,
>>
>> Paul
>>
Heiner
>>
>> PS: Some output:
>>
>> ```
>> $ ls -lR /sys/bus/i2c/devices/
>> /sys/bus/i2c/devices/:
>> total 0
>> lrwxrwxrwx 1 root root 0 May 14 12:20 i2c-0 ->
>> ../../../devices/pci0000:00/0000:00:1f.3/i2c-0
>> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-1 ->
>> ../../../devices/pci0000:00/0000:00:1c.0/0000:03:00.0/i2c-1
>> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-2 -> ../../../devices/pci0000:00/0000:00:1c.6/0000:06:00.0/0000:07:00.0/0000:08:00.0/0000:09:00.0/i2c-2
>> lrwxrwxrwx 1 root root 0 May 14 12:42 i2c-3 ->
>> ../../../devices/pci0000:00/0000:00:1c.0/0000:03:00.1/i2c-3
>> ```
>>
>> ```
>> $ sudo dmidecode -t memory
>> # dmidecode 3.3
>> Getting SMBIOS data from sysfs.
>> SMBIOS 2.8 present.
>>
>> Handle 0x1000, DMI type 16, 23 bytes
>> Physical Memory Array
>> 	Location: System Board Or Motherboard
>> 	Use: System Memory
>> 	Error Correction Type: Multi-bit ECC
>> 	Maximum Capacity: 12 TB
>> 	Error Information Handle: Not Provided
>> 	Number Of Devices: 96
>>
>> Handle 0x1100, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 1
>> 	Locator: A1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125734A
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1101, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 1
>> 	Locator: A2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573BF
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1102, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 1
>> 	Locator: A3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257315
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1103, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 1
>> 	Locator: A4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572D4
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1104, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 2
>> 	Locator: A5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257318
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1105, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 2
>> 	Locator: A6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572D2
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1106, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 2
>> 	Locator: A7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257350
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1107, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 2
>> 	Locator: A8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257349
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1108, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 3
>> 	Locator: A9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1109, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 3
>> 	Locator: A10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x110A, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 3
>> 	Locator: A11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x110B, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 3
>> 	Locator: A12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x110C, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 4
>> 	Locator: B1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572A7
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x110D, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 4
>> 	Locator: B2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572A1
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x110E, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 4
>> 	Locator: B3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125728D
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x110F, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 4
>> 	Locator: B4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125728C
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1110, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 5
>> 	Locator: B5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125728F
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1111, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 5
>> 	Locator: B6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257352
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1112, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 5
>> 	Locator: B7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257294
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1113, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 5
>> 	Locator: B8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125728E
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1114, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 6
>> 	Locator: B9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1115, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 6
>> 	Locator: B10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1116, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 6
>> 	Locator: B11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1117, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 6
>> 	Locator: B12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1118, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 7
>> 	Locator: C1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125734D
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1119, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 7
>> 	Locator: C2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572AB
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x111A, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 7
>> 	Locator: C3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125734F
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x111B, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 7
>> 	Locator: C4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572D6
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x111C, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 8
>> 	Locator: C5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125734E
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x111D, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 8
>> 	Locator: C6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125731D
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x111E, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 8
>> 	Locator: C7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573FF
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x111F, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 8
>> 	Locator: C8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572D5
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1120, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 9
>> 	Locator: C9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1121, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 9
>> 	Locator: C10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1122, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 9
>> 	Locator: C11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1123, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 9
>> 	Locator: C12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1124, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 10
>> 	Locator: D1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257409
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1125, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 10
>> 	Locator: D2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257293
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1126, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 10
>> 	Locator: D3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125740D
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1127, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 10
>> 	Locator: D4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572AD
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1128, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 11
>> 	Locator: D5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125740C
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1129, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 11
>> 	Locator: D6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573C1
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x112A, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 11
>> 	Locator: D7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112572A6
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x112B, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 11
>> 	Locator: D8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125740B
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x112C, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 12
>> 	Locator: D9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x112D, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 12
>> 	Locator: D10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x112E, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 12
>> 	Locator: D11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x112F, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 12
>> 	Locator: D12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1130, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 13
>> 	Locator: E1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573E6
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1131, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 13
>> 	Locator: E2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129AD64
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1132, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 13
>> 	Locator: E3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573D3
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1133, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 13
>> 	Locator: E4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573D7
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1134, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 14
>> 	Locator: E5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573A1
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1135, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 14
>> 	Locator: E6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129AD20
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1136, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 14
>> 	Locator: E7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573D4
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1137, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 14
>> 	Locator: E8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 112573D8
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1138, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 15
>> 	Locator: E9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1139, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 15
>> 	Locator: E10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x113A, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 15
>> 	Locator: E11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x113B, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 15
>> 	Locator: E12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x113C, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 16
>> 	Locator: F1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125740A
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x113D, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 16
>> 	Locator: F2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257292
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x113E, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 16
>> 	Locator: F3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125740E
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x113F, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 16
>> 	Locator: F4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257408
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1140, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 17
>> 	Locator: F5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257414
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1141, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 17
>> 	Locator: F6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257406
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1142, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 17
>> 	Locator: F7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125741A
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1143, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 17
>> 	Locator: F8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257314
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1144, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 18
>> 	Locator: F9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1145, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 18
>> 	Locator: F10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1146, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 18
>> 	Locator: F11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1147, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 18
>> 	Locator: F12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1148, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 19
>> 	Locator: G1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129AD1F
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1149, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 19
>> 	Locator: G2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257417
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x114A, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 19
>> 	Locator: G3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129AD36
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x114B, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 19
>> 	Locator: G4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129AD38
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x114C, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 20
>> 	Locator: G5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129AD1B
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x114D, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 20
>> 	Locator: G6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257319
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x114E, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 20
>> 	Locator: G7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129AC49
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x114F, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 20
>> 	Locator: G8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1129ADB0
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1150, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 21
>> 	Locator: G9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1151, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 21
>> 	Locator: G10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1152, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 21
>> 	Locator: G11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1153, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 21
>> 	Locator: G12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x1154, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 22
>> 	Locator: H1
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125740F
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1155, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 22
>> 	Locator: H2
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125731A
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1156, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 22
>> 	Locator: H3
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257316
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1157, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 22
>> 	Locator: H4
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257411
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1158, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 23
>> 	Locator: H5
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257287
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x1159, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 23
>> 	Locator: H6
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257412
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x115A, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 23
>> 	Locator: H7
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 1125728B
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x115B, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: 72 bits
>> 	Data Width: 64 bits
>> 	Size: 16 GB
>> 	Form Factor: DIMM
>> 	Set: 23
>> 	Locator: H8
>> 	Bank Locator: Not Specified
>> 	Type: DDR4
>> 	Type Detail: Synchronous Registered (Buffered)
>> 	Speed: 2133 MT/s
>> 	Manufacturer: 002C00B3002C
>> 	Serial Number: 11257317
>> 	Asset Tag: 0F154830
>> 	Part Number: 36ASF2G72PZ-2G1A2
>> 	Rank: 2
>> 	Configured Memory Speed: 1600 MT/s
>> 	Minimum Voltage: 1.2 V
>> 	Maximum Voltage: 1.2 V
>> 	Configured Voltage: 1.2 V
>>
>> Handle 0x115C, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 24
>> 	Locator: H9
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x115D, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 24
>> 	Locator: H10
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x115E, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 24
>> 	Locator: H11
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>>
>> Handle 0x115F, DMI type 17, 40 bytes
>> Memory Device
>> 	Array Handle: 0x1000
>> 	Error Information Handle: Not Provided
>> 	Total Width: Unknown
>> 	Data Width: Unknown
>> 	Size: No Module Installed
>> 	Form Factor: Unknown
>> 	Set: 24
>> 	Locator: H12
>> 	Bank Locator: Not Specified
>> 	Type: Unknown
>> 	Type Detail: None
>> 	Speed: Unknown
>> 	Manufacturer: Not Specified
>> 	Serial Number: Not Specified
>> 	Asset Tag: Not Specified
>> 	Part Number: Not Specified
>> 	Rank: Unknown
>> 	Configured Memory Speed: Unknown
>> 	Minimum Voltage: Unknown
>> 	Maximum Voltage: Unknown
>> 	Configured Voltage: Unknown
>> ```
>>
>> ```
>> $ lsmem
>> RANGE                                  SIZE  STATE REMOVABLE BLOCK
>> 0x0000000000000000-0x000000007fffffff    2G online       yes     0
>> 0x0000000100000000-0x000001007fffffff 1022G online       yes 2-512
>>
>> Memory block size:         2G
>> Total online memory:       1T
>> Total offline memory:      0B
>> ```
>>


