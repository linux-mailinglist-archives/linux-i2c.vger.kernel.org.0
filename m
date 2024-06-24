Return-Path: <linux-i2c+bounces-4288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7F913F96
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 02:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F6FC1C214AF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 00:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A463F33F7;
	Mon, 24 Jun 2024 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ReWukp+3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975BA1361
	for <linux-i2c@vger.kernel.org>; Mon, 24 Jun 2024 00:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719189373; cv=none; b=ZDtcUw+gexIGaMmtBbi97G9W6JZNNduliQeMnwo7d04r3XcD+XUiyeoe9hmgQBykQxA/x1D4HyAJKh0Z4t0UsAGjJ7Y28rwxWF+/snG8pQVBrVEWD6pmLaIdnmyiihUQkG6koOJ0VjzyDOel9K5vMQjdgva9/Cxyn6uK/Uxt+Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719189373; c=relaxed/simple;
	bh=/tee2svwDy00/cVVtGjmtN3BDu9PhC2QMMbhTRXD89k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ggk4KyET47Hw7bSwmOccfoCSc3jGDaWTSYfNwwCDkKNEoh8kMXIvkIoBkAIdhOjv/C5P/K9OIk0DArQEeMGORMi1TcxXvzMuWkiv566Hh7VwHOi8NjJX9AkzA7Je9eIz3ocEweMrPshRKTo9j2JCmcrsV+QxGihxweSo/B8eeRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ReWukp+3; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 31843882BE;
	Mon, 24 Jun 2024 02:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719189369;
	bh=Sc9ZLJIEOY9SUeXHN5D4bOanHzh9hxkilMQWfyLlwYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ReWukp+3zl9GU5QDZacSBBMCA8e+giEOEPBDA6oZ7YIm77+pBD+timF/BAkxEfdE1
	 J3WSD7fO6x0VH4K2rev7OCMjKlBwOu3EJtGyb3nnB+VU62exc/EzICMs+DatY0ltEf
	 BBZREUb0YenVRWVChq9qdnig/Uv8BrK2Y0vol6vKdgR7trHQ9rpsqDS4KIBz3S7sko
	 46mojORqcFeLs3jxE/rcjegi0X9zbRHLwefUKP1zFdVsmBViZmlHQZUR/6pJG9fHuw
	 unw/Sjr1ND+xEv8bPXxqcbZFrR2jGbnCGN5b3YpvEcJGUTE4yGXsn6dYyynZBfwUIm
	 P1G+lMnp1jx+A==
Message-ID: <3c696ae1-44a8-42d9-a521-f02be779bb51@denx.de>
Date: Mon, 24 Jun 2024 02:19:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] nvmem: core: Implement force_ro sysfs attribute
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-i2c@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20240623031752.353818-1-marex@denx.de>
 <20240623031752.353818-4-marex@denx.de>
 <2024062330-pound-endeared-b07a@gregkh>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2024062330-pound-endeared-b07a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/23/24 8:13 AM, Greg Kroah-Hartman wrote:
> On Sun, Jun 23, 2024 at 05:15:47AM +0200, Marek Vasut wrote:
>> Implement "force_ro" sysfs attribute to allow users to set read-write
>> devices as read-only and back to read-write from userspace. The choice
>> of the name is based on MMC core 'force_ro' attribute.
>>
>> This solves a situation where an AT24 I2C EEPROM with GPIO based nWP
>> signal may have to be occasionally updated. Such I2C EEPROM device is
>> usually set as read-only during most of the regular system operation,
>> but in case it has to be updated in a controlled manner, it could be
>> unlocked using this new "force_ro" sysfs attribute and then re-locked
>> again.
>>
>> The "read-only" DT property and config->read_only configuration is
>> respected and is used to set default state of the device, read-only
>> or read-write, for devices which do implement .reg_write function.
>> For devices which do not implement .reg_write function, the device
>> is unconditionally read-only and the "force_ro" attribute is not
>> visible.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Cc: linux-i2c@vger.kernel.org
>> ---
>> V2: - Document the force_ro attribute
>>      - Use sysfs_emit()
>> ---
>>   Documentation/ABI/stable/sysfs-bus-nvmem | 13 +++++++
>>   drivers/nvmem/core.c                     | 44 ++++++++++++++++++++++++
>>   drivers/nvmem/internals.h                |  1 +
>>   3 files changed, 58 insertions(+)
>>
>> diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
>> index 0e3a8492a1082..c713c4e6cecb1 100644
>> --- a/Documentation/ABI/stable/sysfs-bus-nvmem
>> +++ b/Documentation/ABI/stable/sysfs-bus-nvmem
>> @@ -1,3 +1,16 @@
>> +What:		/sys/bus/nvmem/devices/.../force_ro
>> +Date:		June 2024
>> +KernelVersion:	6.11
>> +Contact:	Marek Vasut <marex@denx.de>
>> +Description:
>> +		This read/write attribute allows users to set read-write
>> +		devices as read-only and back to read-write from userspace.
>> +		This can be used to unlock and relock write-protection of
>> +		devices which are generally locked, except during sporadic
>> +		programming operation.
>> +		Note: This file is only present if CONFIG_NVMEM_SYSFS
>> +		is enabled
> 
> And what exactly are the values that can be read or written here?

I expanded it to this:

  This read/write attribute allows users to set read-write
  devices as read-only and back to read-write from userspace.
  This can be used to unlock and relock write-protection of
  devices which are generally locked, except during sporadic
  programming operation.
+Read returns '0' or '1' for read-write or read-only modes
+respectively.
+Write parses one of 'YyTt1NnFf0', or [oO][NnFf] for "on"
+and "off", i.e. what kstrbool() supports.
  Note: This file is only present if CONFIG_NVMEM_SYSFS
  is enabled.

But I wonder, wouldn't it be better if write only supported '0' and '1' 
too, instead of the whole list of stuff that kstrbool() supports ?

