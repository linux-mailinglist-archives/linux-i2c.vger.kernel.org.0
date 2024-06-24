Return-Path: <linux-i2c+bounces-4294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D2914510
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 10:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 286CE1F213AA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 08:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C31F5EE97;
	Mon, 24 Jun 2024 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b="DVGrwhls"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.emenem.pl (cmyk.emenem.pl [217.79.154.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6834F201;
	Mon, 24 Jun 2024 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.79.154.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719218368; cv=none; b=t4Tw4fcB8VKi5I/sr/aHwSuYAO5aNHr2pvEi1tNPO8y1GZfHVTkEvKVIQ1y1PP80qjqfyPUrRkzYBi9vAzYAyNrUApDxpEFVDWdF+MYtcd5TRU2Krnleskf/S9UbZYV5XQBfyg76J2vFuCkUmZJKz73SdGe44ejonqsDgJone58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719218368; c=relaxed/simple;
	bh=EeByMmqv/4BudhVX/ufck5xtDHGs5+dVODbydkpdVW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRELq5bNgBNwhOIK2EdV3SvOKy0/fu6kt4ljrOmUzZmMeuhvms002JLwPC7vLg3zxJwdwKk1/JvRhtArAOnWM0qttJqPwn+38jpK9ZK1bX2hlU5hyjvkBkclSI0KYUxJ0LTjZs0Sn2zWWtF5iXpHwlVQhFbqYZ74+DaU8JTspqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl; spf=none smtp.mailfrom=ans.pl; dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b=DVGrwhls; arc=none smtp.client-ip=217.79.154.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ans.pl
X-Virus-Scanned: amavisd-new at emenem.pl
Received: from [192.168.1.10] (c-98-45-176-131.hsd1.ca.comcast.net [98.45.176.131])
	(authenticated bits=0)
	by cmyk.emenem.pl (8.17.1.9/8.17.1.9) with ESMTPSA id 45O8cqxu007335
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 24 Jun 2024 10:38:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ans.pl; s=20190507;
	t=1719218339; bh=NGZ9cnu+eI211OciJpJnI/vCKmWtAkXMO1gQPcPydxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DVGrwhlsZT3iclLlIVqG5SeQXfK/eg+veyG/li+r1DQ+BBDknTJo/MY9CpPZK9fJs
	 tfBsEF3CchW5c1i5GNzZZRStmac7V1IAlcCo6DfpHgt+LLScuWKAgWfgvfMzqDKyJ5
	 bwhieYgnlrhEXupjqWjTT/YEC1iantb9OuqVLNog=
Message-ID: <77c1b740-9e6d-40f7-83f0-9a949366f1c9@ans.pl>
Date: Mon, 24 Jun 2024 01:38:51 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: Guenter Roeck <linux@roeck-us.net>,
        Heiner Kallweit
 <hkallweit1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
 <0dfa2919-98eb-4433-acb4-aa1830787c9b@roeck-us.net>
From: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
Content-Language: en-US
In-Reply-To: <0dfa2919-98eb-4433-acb4-aa1830787c9b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.06.2024 at 22:33, Guenter Roeck wrote:
> On 6/23/24 11:47, Krzysztof Olędzki wrote:
>> Hi,
>>
>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>
>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
>>
>> Note that jc42 devices are registered correctly and work with and without the change.
>>
> 
> My guess is that the devices are fist instantiated through the jc42
> driver's _detect function and then again from the at24 driver.
> The at24 driver should possibly call i2c_new_scanned_device() instead
> of i2c_new_client_device() to only instantiate the device if it wasn't
> already instantiated.

i2c_new_scanned_device() also calls i2c_default_probe() at the end (unless
different probe is provided) which seems risky given the comment that explains
that it would use quick write for that address. However, maybe it is safe in this case?
I wish we had a way to just tell "no probing is needed".

We also know the exact address so no scanning is needed.

Perhaps it would be better to just call i2c_check_addr_busy() in
at24_probe_temp_sensor()?

Something like this:
--- a/drivers/misc/eeprom/at24.c	2024-06-24 09:16:11.251855130 +0200
+++ b/drivers/misc/eeprom/at24.c	2024-06-24 09:27:01.158170725 +0200
@@ -603,6 +603,10 @@
 
 	info.addr = 0x18 | (client->addr & 7);
 
+	/* The device may be already instantiated through the jc42 driver */
+	if (i2c_check_addr_busy(client->adapter, info.addr))
+		return;
+
 	i2c_new_client_device(client->adapter, &info);
 }

Unfortunately, i2c_check_addr_busy is not exported and declared as static,
I assume intentionally? Unless this can be changed, we are back to the original
recommendation:

--- a/drivers/misc/eeprom/at24.c	2024-06-24 09:16:11.251855130 +0200
+++ b/drivers/misc/eeprom/at24.c	2024-06-24 10:25:39.142567472 +0200
@@ -585,6 +585,7 @@
 {
 	struct at24_data *at24 = i2c_get_clientdata(client);
 	struct i2c_board_info info = { .type = "jc42" };
+	unsigned short addr_list[] = { 0, I2C_CLIENT_END };
 	int ret;
 	u8 val;
 
@@ -601,9 +602,10 @@
 	if (ret || !(val & BIT(7)))
 		return;
 
-	info.addr = 0x18 | (client->addr & 7);
+	addr_list[0] = 0x18 | (client->addr & 7);
 
-	i2c_new_client_device(client->adapter, &info);
+	/* The device may be already instantiated through the jc42 driver */
+	i2c_new_scanned_device(client->adapter, &info, addr_list, NULL);
 }
 
 static int at24_probe(struct i2c_client *client)

For now compile-tested only given the write-test concern above.

That said, I have some follow-up questions:

1. if the jc42 driver handles this already, I wonder what's the point of adding
at24_probe_temp_sensor()? Is there a situation where it would not do it properly?
Or do we expect to remove the probing functionally from jc42.c?  

2. I don't understand why we are also getting the "Failed creating jc42" and
"sysfs: cannot create duplicate filename" errors since i2c_new_client_device() calls
i2c_check_addr_busy() on its own and should abort after the first error message?

3. (unrelated but found while looking at the code) The comment for
delete_device_store() seems to be outdated as it mentions i2c_sysfs_new_device
which does not exist any longer, as it was renamed in
"i2c: core: Use DEVICE_ATTR_*() helper macros" back in 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/i2c/i2c-core-base.c?id=54a19fd4a6402ef47fce5c3a5374c71f52373c40 - 

For the Greg's question if it is also in 6.9: I have not tested that kernel yet,
but unless there have been some recent changes in the i2c code I would expect
it should behave the same way. If required, I should be able to do this next week.

Krzysztof

