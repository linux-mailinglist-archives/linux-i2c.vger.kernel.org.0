Return-Path: <linux-i2c+bounces-4078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD690D4BC
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BA99B31488
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC4C19E7E7;
	Tue, 18 Jun 2024 13:52:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515B319E7DD;
	Tue, 18 Jun 2024 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718718722; cv=none; b=qQjrqAuXHHXu5Wu7EjhoTgbESzl56uAnyzDZHBEsC7NnO/7yCV6mYbHaRvQtHhfFb768e1V5GHPuwhRTW7hpvnX0Ib0DnLMIHyUAhWYpfNjRSYxZcAweg5tJOlVf+t9Sy2D4G8FfdJtUWZwZ+pAGu4hf0hw6uDOhHGCZWKSBbj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718718722; c=relaxed/simple;
	bh=VwKsrjIE10lvqke1zUsJ4ealB7C0M4kdJQQlSucPQmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtwD6zO1ZuhOJWEDQ66hZvEugzcbULAph58tsc5t5XOavdTmehz2NveUU+l+kM0JP5e6blO+3B7IJtzBbmGVEv6m+5ACKGXFTgaQ//gyULXQvA8AlCI82ZGjgPhpB4eydebYet/J5X2AOyc1qF8N5mt4MvFoo7m/O7X08GnbP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0328561E5FE01;
	Tue, 18 Jun 2024 15:51:16 +0200 (CEST)
Message-ID: <8719fc64-2b51-4b79-ba52-0a3b9216f2db@molgen.mpg.de>
Date: Tue, 18 Jun 2024 15:51:15 +0200
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
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <975af7e5-b1b0-400e-a1c3-6d9140421f25@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Guenter,


Am 18.06.24 um 15:32 schrieb Guenter Roeck:

> On 6/18/24 03:25, Paul Menzel wrote:
> [ ... ]
>>
>>      $ ls -l /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>      -r--r--r-- 1 root root 1024 Jun 18 12:17 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>      $ cp /sys/bus/i2c/drivers/spd5118/0-0050/eeprom /tmp
>>      cp: error reading '/sys/bus/i2c/drivers/spd5118/0-0050/eeprom': No such device or address
> 
> That suggests that the i801 driver got an error when trying some chip 
> operation.
> Unfortunately I have no idea what that error or the failed operation 
> might be.
> 
>>      $ od -t x1 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>>      od: /sys/bus/i2c/drivers/spd5118/0-0050/eeprom: read error: No such device or address
>>      0000000
>>
>>> sudo i2cdump -y -f 0 0x50
>>
>>      $ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
>>      No size specified (using byte-data access)
>>      Error: Could not open file `/dev/i2c-0' or `/dev/i2c/0': No such file or directory
>>
> This should work after you load the "i2c-dev" module.

Silly me. Thank you.

> If you get it to work, please provide the output. Maybe it helps 
> tracking down the problem.

```
$ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
No size specified (using byte-data access)
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 51 18 0a 86 32 03 32 00 00 00 00 00 ff 01 00 00    Q???2?2......?..
10: 00 00 00 00 00 00 00 00 00 00 00 00 70 03 00 00    ............p?..
20: 50 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00    P?..............
30: 00 58 01 00 00 00 00 00 00 00 00 00 00 00 00 00    .X?.............
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
80: 30 10 12 02 04 00 20 62 00 00 00 00 90 02 00 00    0????. b....??..
90: 00 00 00 00 a0 01 f2 03 7a 0d 00 00 00 00 80 3e    ....????z?....?>
a0: 80 3e 80 3e 00 7d 80 bb 30 75 27 01 a0 00 82 00    ?>?>.}??0u'??.?.
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
c0: 00 00 00 00 00 00 88 13 08 88 13 08 20 4e 20 10    ......?????? N ?
d0: 27 10 15 34 20 10 27 10 c4 09 04 4c 1d 0c 00 00    '??4 ?'????L??..
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
```

So (00,b) = 0x00 opposed to 0x07 in your example output.

     $ sensors
     […]

Then there is no change:

```
$ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
No size specified (using byte-data access)
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 51 18 0a 86 32 03 32 00 00 00 00 00 ff 01 00 00    Q???2?2......?..
10: 00 00 00 00 00 00 00 00 00 00 00 00 70 03 00 00    ............p?..
20: 50 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00    P?..............
30: 00 58 01 00 00 00 00 00 00 00 00 00 00 00 00 00    .X?.............
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
80: 30 10 12 02 04 00 20 62 00 00 00 00 90 02 00 00    0????. b....??..
90: 00 00 00 00 a0 01 f2 03 7a 0d 00 00 00 00 80 3e    ....????z?....?>
a0: 80 3e 80 3e 00 7d 80 bb 30 75 27 01 a0 00 82 00    ?>?>.}??0u'??.?.
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
c0: 00 00 00 00 00 00 88 13 08 88 13 08 20 4e 20 10    ......?????? N ?
d0: 27 10 15 34 20 10 27 10 c4 09 04 4c 1d 0c 00 00    '??4 ?'????L??..
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
```


Kind regards,

Paul

