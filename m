Return-Path: <linux-i2c+bounces-4084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0490D743
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 17:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 040671C2383C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 15:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4225924B2A;
	Tue, 18 Jun 2024 15:28:33 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C49322F1C;
	Tue, 18 Jun 2024 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718724513; cv=none; b=OPLVGgfD2hxIzPFqNNcjBq1snW9n3T9dWPhYKE0WaqL6Yxt9HAAwjPS98LTQa6oQtwRsqB61QR1qd4aQnwuqGgSi9i601RqjQ96zkLiWnjP75oWuOp+IEFHfyl/S5kbiCSB6IWd9QM+ia1PGaNzjS3MsInXTS1IEN2grNX3JIkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718724513; c=relaxed/simple;
	bh=F+ED/OioFLnqOYlwF4WKTud/ZqoBQqoLpm+kzsS3g1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qu6jETLPh63DbRnaCIRhsrt9XpJ1NYbZkiIYNUayrdMZEjTkv0nJbEwRKC1uLBD9oCM8GJfGNTJY7yQuWZUzt29TJhjgZRdKQqZZQqOkXM5WkZeTg2EX/f9jKA4eFn5aUEmTbROCHl5Mtlr/bgMWO9O+6CTt+8HsDFgWcaCoPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 48A3261E5FE01;
	Tue, 18 Jun 2024 17:27:50 +0200 (CEST)
Message-ID: <c345a680-d5a3-4ca8-a9e2-8ac04f526284@molgen.mpg.de>
Date: Tue, 18 Jun 2024 17:27:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
 <efb77b37-30e5-48a8-b4af-eb9995a2882b@roeck-us.net>
 <33f369c1-1098-458e-9398-30037bd8c5aa@molgen.mpg.de>
 <4e09b843-3d2d-46d7-a8e1-2eabc4382dc7@roeck-us.net>
 <f20ea816-5165-401e-948f-6e77682a2d1b@molgen.mpg.de>
 <975af7e5-b1b0-400e-a1c3-6d9140421f25@roeck-us.net>
 <8719fc64-2b51-4b79-ba52-0a3b9216f2db@molgen.mpg.de>
 <f76a4d07-887b-4efb-b20e-52979db31216@roeck-us.net>
 <fd8868ef-6179-45a7-8249-ee17994a8e78@molgen.mpg.de>
 <2532ca4a-83dd-4ab8-af04-6ebcd5ca8673@roeck-us.net>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2532ca4a-83dd-4ab8-af04-6ebcd5ca8673@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Guenter,


Am 18.06.24 um 17:12 schrieb Guenter Roeck:
> On 6/18/24 07:59, Paul Menzel wrote:

>> Am 18.06.24 um 16:23 schrieb Guenter Roeck:
>>> On 6/18/24 06:51, Paul Menzel wrote:
>>
>>>> Am 18.06.24 um 15:32 schrieb Guenter Roeck:
>>>>
>>>>> On 6/18/24 03:25, Paul Menzel wrote:
>>>>> [ ... ]
>>>>>>
>>>>>>      $ ls -l /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>>>>>      -r--r--r-- 1 root root 1024 Jun 18 12:17  /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>>>>>      $ cp /sys/bus/i2c/drivers/spd5118/0-0050/eeprom /tmp
>>>>>>      cp: error reading '/sys/bus/i2c/drivers/spd5118/0-0050/eeprom': No such device or address
>>>>>
>>>>> That suggests that the i801 driver got an error when trying some 
>>>>> chip operation.
>>>>> Unfortunately I have no idea what that error or the failed 
>>>>> operation might be.
>>>>>
>>>>>>      $ od -t x1 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>>>>>      od: /sys/bus/i2c/drivers/spd5118/0-0050/eeprom: read error: No such device or address
>>>>>>      0000000
>>>>>>
>>>>>>> sudo i2cdump -y -f 0 0x50
>>>>>>
>>>>>>      $ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
>>>>>>      No size specified (using byte-data access)
>>>>>>      Error: Could not open file `/dev/i2c-0' or `/dev/i2c/0': No such file or directory
>>>>>>
>>>>> This should work after you load the "i2c-dev" module.
>>>>
>>>> Silly me. Thank you.
>>>>
>>>>> If you get it to work, please provide the output. Maybe it helps 
>>>>> tracking down the problem.
>>>>
>>>> ```
>>>> $ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
>>>> No size specified (using byte-data access)
>>>>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    
>>>> 0123456789abcdef
>>>> 00: 51 18 0a 86 32 03 32 00 00 00 00 00 ff 01 00 00    Q???2?2......?..
>>>> 10: 00 00 00 00 00 00 00 00 00 00 00 00 70 03 00 00    ............p?..
>>>> 20: 50 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00    P?..............
>>>> 30: 00 58 01 00 00 00 00 00 00 00 00 00 00 00 00 00    .X?.............
>>>> 40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
>>>> 50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
>>>> 60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
>>>> 70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
>>>> 80: 30 10 12 02 04 00 20 62 00 00 00 00 90 02 00 00    0????. b....??..
>>>> 90: 00 00 00 00 a0 01 f2 03 7a 0d 00 00 00 00 80 3e    ....????z?....?>
>>>> a0: 80 3e 80 3e 00 7d 80 bb 30 75 27 01 a0 00 82 00    ?>?>.}??0u'??.?.
>>>> b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
>>>> c0: 00 00 00 00 00 00 88 13 08 88 13 08 20 4e 20 10    ......?????? N ?
>>>> d0: 27 10 15 34 20 10 27 10 c4 09 04 4c 1d 0c 00 00    '??4 ?'????L??..
>>>> e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
>>>> f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
>>>> ```
>>>>
>>>> So (00,b) = 0x00 opposed to 0x07 in your example output.
>>>>
>>>
>>> Yes, that assumed that reading the nvram/eeprom succeeded, which it didn't.
>>> The value might also be 7 directly after booting and before loading
>>> the spd5118 driver.
>>>
>>> Anyway, it almost looks like setting the page doesn't work, or maybe write
>>> operations in general.
>>>
>>> Can you try the following ?
>>>
>>> dd if=/sys/bus/i2c/drivers/spd5118/0-0050/eeprom of=/tmp/eeprom 
>>> count=64 bs=1
>>>
>>> and
>>>
>>> dd if=/sys/bus/i2c/drivers/spd5118/0-0050/eeprom of=/tmp/eeprom 
>>> count=1 bs=64
>>>
>>> That should only try to read from page 0.
>>
>>      $ sudo dd if=/sys/bus/i2c/drivers/spd5118/0-0050/eeprom of=/tmp/eeprom count=64 bs=1
>>      64+0 records in
>>      64+0 records out
>>      64 bytes copied, 0.046002 s, 1.4 kB/s
>>      $ sudo dd if=/sys/bus/i2c/drivers/spd5118/0-0050/eeprom of=/tmp/eeprom count=1 bs=64
>>      1+0 records in
>>      1+0 records out
>>      64 bytes copied, 0.000215414 s, 297 kB/s
>>
>>> Also, please try to set a temperature limit, either temp1_max
>>> or temp1_crit. Setting temp1_max to, say, 56000, or temp1_crit
>>> to 84000 should do.
>>
>> I did
>>
>>      $ tail -3 /etc/sensors3.conf
>>      chip "spd5118-*"
>>          set temp1_max 56000
>>          set temp1_crit 84000
>>
>> but it stays with the defaults:
>>
>> ```
>> $ sensors
> 
> Did you run "sudo sensors -s" ?

No, I did not.

> I don't know if that would report errors, though.

It looks like it does:

     $ sudo sensors -s
     Error: File /etc/sensors3.conf, line 522: Failed to set value
     Error: File /etc/sensors3.conf, line 523: Failed to set value
     spd5118-i2c-0-53: At least one "set" statement failed
     Error: File /etc/sensors3.conf, line 522: Failed to set value
     Error: File /etc/sensors3.conf, line 523: Failed to set value
     spd5118-i2c-0-51: At least one "set" statement failed
     Error: File /etc/sensors3.conf, line 522: Failed to set value
     Error: File /etc/sensors3.conf, line 523: Failed to set value
     spd5118-i2c-0-52: At least one "set" statement failed
     Error: File /etc/sensors3.conf, line 522: Failed to set value
     Error: File /etc/sensors3.conf, line 523: Failed to set value
     spd5118-i2c-0-50: At least one "set" statement failed


Kind regards,

Paul

