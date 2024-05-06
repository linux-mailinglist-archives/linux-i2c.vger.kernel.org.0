Return-Path: <linux-i2c+bounces-3418-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF618BC81F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 09:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017101F21CE0
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 07:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCEB455E5B;
	Mon,  6 May 2024 07:08:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8445524AE;
	Mon,  6 May 2024 07:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714979293; cv=none; b=pOsBlBi7weTbrDCsygxittUmUELOZvBmKelWKtrM+V3YBjuekhONFDERE+Ex00XQfFnzwgMVqxjMQwzXt5TQyeifjwVDQRZaJcNK2UvrDu96cTFKfe20nlHVrhR7ZYDk35c/K750elBf5uC7kCmvEU4BHnEuNAwiOUcZXqhwMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714979293; c=relaxed/simple;
	bh=ouXFlxXz/N0EJSDtJ4JAA9CLLRGoAnsAgPcAw4wQRk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXgAZNTVdEQaKMQXqTGSyiuuIZYxg+K4dN4F2re1em7QAkjWH0jVqU+akx4EgGj2ztkWj02S6VK3CZDud5/fo94LJ02Qtmgr4G899lbwGsbTYt439k8fzOKQ7b3sdR2Cgvqy1kuLHMCO2+rm4KBUQqszWRmrG0SyHD+QsNeexUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.4] (ip5f5af40c.dynamic.kabel-deutschland.de [95.90.244.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 839C561E5FE01;
	Mon,  6 May 2024 09:07:45 +0200 (CEST)
Message-ID: <920294a9-b073-4ec5-93e9-e8135b407f9a@molgen.mpg.de>
Date: Mon, 6 May 2024 09:07:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: i801: Add lis3lv02d for Dell Precision M6800
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Patrick_H=C3=B6hn?= <hoehnp@gmx.de>
References: <20240312193132.26518-1-hoehnp@gmx.de>
 <20240312194938.mxmip456xnjdlrbo@pali>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240312194938.mxmip456xnjdlrbo@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


Am 12.03.24 um 20:49 schrieb Pali Rohár:
> On Tuesday 12 March 2024 20:31:31 Patrick Höhn wrote:
>> On the Dell Precision M6800/OXD1M5, BIOS A26 06/13/2029, Linux prints the
>> warning below.
>>
>>      i801_smbus 0000:00:1f.4: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
>>
>> Following the same suggestions by Wolfram Sang as for the Dell Precision
>> 3540 [1], the accelerometer can be successfully found on I2C bus 0 at
>> address 0x29.
> 
> Just to note for other users in future. I2C does not have to be assigned
> with number 0. This number is chosen by the kernel at runtime as the
> first unused number. So in case you have VGA adapter (or GPU) for which
> is i2c driver available and loaded + probed before i801_smbus is loaded
> and probed then kernel would report accelerometer at different bus
> number. On the other hand, accelerometer address on I2C bus normally
> should not change (configurable device can change it but we should hope
> that it does not happen).
> 
> The correct number of bus can be found by the i2cdetect command too:
> 
>    # i2cdetect -l | grep I801
> 
> For me it prints:
> 
>    i2c-0   unknown         SMBus I801 adapter at f040              N/A
> 
>>
>>      $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-0/new_device
>>      lis3lv02d 0x29
>>      $ dmesg | tail -5
>>      [1185.385204] lis3lv02d_i2c 0-0029: supply Vdd not found, using dummy regulator
>>      [1185.385235] lis3lv02d_i2c 0-0029: supply Vdd_IO not found, using dummy regulator
>>      [1185.399689] lis3lv02d: 8 bits 3DC sensor found
>>      [1185.449391] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input371
>>      [1185.449577] i2c i2c-0: new_device: Instantiated device lis3lv02d at 0x29
>>
>> So, the device has that accelerometer. Add the I2C address to the
>> mapping list, and test it successfully on the device.
>>
>> [1]: https://lore.kernel.org/linux-i2c/97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de/
>> Signed-off-by: Patrick Höhn <hoehnp@gmx.de>
> 
> Otherwise looks good,
> 
> Acked-by: Pali Rohár <pali@kernel.org>

Is there anything else to do from Patrick’s side before adding the patch 
to the git archive?


Kind regards,

Paul


>> ---
>>   drivers/i2c/busses/i2c-i801.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 2c36b36d7d51..c1fee2c61da1 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1231,6 +1231,7 @@ static const struct {
>>   	 */
>>   	{ "Latitude 5480",      0x29 },
>>   	{ "Precision 3540",     0x29 },
>> +	{ "Precision M6800",    0x29 },
>>   	{ "Vostro V131",        0x1d },
>>   	{ "Vostro 5568",        0x29 },
>>   	{ "XPS 15 7590",        0x29 },
>> --
>> 2.43.2

