Return-Path: <linux-i2c+bounces-12263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE32B2477E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 12:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72245684F3C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9342C2F6597;
	Wed, 13 Aug 2025 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyapTp3l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6F2F658A;
	Wed, 13 Aug 2025 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081410; cv=none; b=Y32yWlVD1wRX7xcllLQaM+YAco512g72op4GLPI/2xoDnX+ZG0RiCEwJk/ikJ3LM+T3r2aR+AMaRP8brTOW707cHFCQLr4he3VZJUxsQ4nTKLQHhjYfCmBNd+dMU81MwXpqXCkE0OvcoHflQu5Gti9XiDk61IXw4tGr895N+clQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081410; c=relaxed/simple;
	bh=vvi2IOEQ7Mqyn9jRBUDqaUkk3JMkwu31s9PZlTL2hII=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H/A4V79rhDTaNvns52ML+yCdDx7yKRhDtFu9iFYNr1JLdOEAy8HYUM/HoClFHxfqJ/US3NPTbM4Wrz/nQQtOPSDcGeVU1iJeakbMpVTAAwQ6NGQseBpBe7HXmTUWM4LRO5MMMelAfFELYdfkPdNDDqtOt5+G7hiZuVghbkxG19g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyapTp3l; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459e20ec1d9so62232645e9.3;
        Wed, 13 Aug 2025 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755081407; x=1755686207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQ3oRqQ+8vYvglVmqAsoCg5Z9YqosZmgqcxx5cVr1YU=;
        b=FyapTp3lI11sUmTGqWFL3owxyOVn4k8oRZoihZKaR8cBCjmfAgR0+1xh+9mW76Ej+6
         tD0QCesoBaI2q2rc0VE70dBduzHiV5BR1n2Du+ZonC2I6f6N+d/MJv5ElSCPZBU6UQZc
         R/HARHiteC7QpEmXut92QWjBJg52Jwz3s5aZAqfdFCtjGiNNI2K9NMoBuGHSWeTQsSm3
         IOUtiNTo+MuJtRKTxffjJKl3N909gPAjP9pdL8yflBbHc0POB3U6SkIloY82TpxAoKE0
         Vpe7u16oXrFF9rdaFSOMcOQnJmSdjp1XxFs48cjhjSw/ZNCLwOzKvLYHJ2g736P+nqfd
         AerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755081407; x=1755686207;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ3oRqQ+8vYvglVmqAsoCg5Z9YqosZmgqcxx5cVr1YU=;
        b=BmYa2fgvdaD+/5d9VC8oahmLUh5aI60yTLF3ePrisbgqjgPxaI3jZtCuPSLJyUISDN
         E9jSbwKNPS5wGfBzkGbTLk3kyHyrILBwEiDmjgNULgxe287C9UOlvhrcq2m9lKHzx7wt
         kZxJbTS1hFrXeRl+FZETRJ6g5ueujzpiVGRtm5YkJCsTrZcfX12XNlfT54kIqX79skS5
         DsoCmHYxa6okZtw0mznC7+IO1TwWhY8zBOl4phO91oelXiPHl+TlgFf44581ctKCUn7F
         IgB8/uXp32PopzDWild5GJhAo1npRSitJay2oT09V29jLmthENayHOe2/cC8qJEtQ83Q
         a9ag==
X-Forwarded-Encrypted: i=1; AJvYcCW7WidE+svvlaglqXbY6N3N9TMPf1+mY+0fcVpSKjIHDDJErP/8001bb9XZDf+IijVEyKpmlf+U@vger.kernel.org, AJvYcCXYmdR5SjEHL3wKqb0QZrcz37H+D2SbCOKQv77EmF1Nyne5YldciFazIzvuf1OIRce+ELszrHQaRrY=@vger.kernel.org, AJvYcCXgOe6F5GXIBVRyy3oKNAje+SM4rSesJrpIVFy7DLeAzyMbIe5/FsItTDeveAx89YUA4yzYl8vtyJfQBJvE@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSQNDrdSQ9XiQguYJN2jiltN+sn3tvYYw8h3cMuJ53eq7Dc2f
	cyBU6SDaaFGR5AuQA4sSFciuvqtIVMcHNyqpLbghSYuPHBL2/2NtNi8g
X-Gm-Gg: ASbGncuZUMyXdXpQSFNaI+6SKcpFpvdZQLae+BwO6oneLDlBANehXhm7k+KXvNzz0yt
	zWRK5el9Lnhg1kVmtL4T/QiX7aZPnBTEfDmFCK1Kk7m88leTM/7NdA7cxo78ZepofHbKJfpVE6h
	voWc5wCrzVLMIW7OP73ZyDWO6cmcsfyb0QgPy/gzdxY7+cRnojDvvR0G6UqRkiMcJJDEEDWL7ge
	wS+7p/iF9Muc6nlRR1oWEaC5hcwXsJ0KvLy+uhyH4PK0wQYXsctFdgzMG+6lxTiHQueRY0XIBVT
	VMKlAilBU+fxRQGWBtas+giYyR89wh0NtMoSrav2p06qMn9U+ATzWF8g7aEuHGXP6p/FbqNsFMb
	kXDFOjydRMRpFocaoAcLyXH8gERdvlpyjBsEZSdxThv7QA+zOwthdfMyPg4UdWQU=
X-Google-Smtp-Source: AGHT+IE8WeKKOgBp5vzp5Q2PpKaxjTyK+WTuLbyXBXngT5e/LuA9NlvZe1k5fxp4u22Kge47Qc9xEQ==
X-Received: by 2002:a05:600c:3b09:b0:456:a1b:e906 with SMTP id 5b1f17b1804b1-45a16614befmr18524185e9.33.1755081406323;
        Wed, 13 Aug 2025 03:36:46 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16de5f27sm25743625e9.13.2025.08.13.03.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:36:45 -0700 (PDT)
Message-ID: <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
Date: Wed, 13 Aug 2025 12:36:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Russell King
 <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
Content-Language: hu
In-Reply-To: <aJpR96Kkj12BwW-M@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
>> The I2C communication is completely broken on the Armada 3700 platform
>> since commit 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery").
>>
>> For example, on the Methode uDPU board, probing of the two onboard
>> temperature sensors fails ...
>>
>>   [    7.271713] i2c i2c-0: using pinctrl states for GPIO recovery
>>   [    7.277503] i2c i2c-0:  PXA I2C adapter
>>   [    7.282199] i2c i2c-1: using pinctrl states for GPIO recovery
>>   [    7.288241] i2c i2c-1:  PXA I2C adapter
>>   [    7.292947] sfp sfp-eth1: Host maximum power 3.0W
>>   [    7.299614] sfp sfp-eth0: Host maximum power 3.0W
>>   [    7.308178] lm75 1-0048: supply vs not found, using dummy regulator
>>   [   32.489631] lm75 1-0048: probe with driver lm75 failed with error -121
>>   [   32.496833] lm75 1-0049: supply vs not found, using dummy regulator
>>   [   82.890614] lm75 1-0049: probe with driver lm75 failed with error -121
>>
>> ... and accessing the plugged-in SFP modules also does not work:
>>
>>   [  511.298537] sfp sfp-eth1: please wait, module slow to respond
>>   [  536.488530] sfp sfp-eth0: please wait, module slow to respond
>>   ...
>>   [ 1065.688536] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
>>   [ 1090.888532] sfp sfp-eth0: failed to read EEPROM: -EREMOTEIO
>>
>> After a discussion [1], there was an attempt to fix the problem by
>> reverting the offending change by commit 7b211c767121 ("Revert "i2c:
>> pxa: move to generic GPIO recovery""), but that only helped to fix
>> the issue in the 6.1.y stable tree. The reason behind the partial succes
>> is that there was another change in commit 20cb3fce4d60 ("i2c: Set i2c
>> pinctrl recovery info from it's device pinctrl") in the 6.3-rc1 cycle
>> which broke things further.
>>
>> The cause of the problem is the same in case of both offending commits
>> mentioned above. Namely, the I2C core code changes the pinctrl state to
>> GPIO while running the recovery initialization code. Although the PXA
>> specific initialization also does this, but the key difference is that
>> it happens before the conrtoller is getting enabled in i2c_pxa_reset(),
>> whereas in the case of the generic initialization it happens after that.
>>
>> To resolve the problem, provide an empty init_recovery() callback
>> function thus preventing the I2C core to call the generic recovery
>> initialization code.
>>
>> As the result this change restores the original behaviour, which in
>> turn makes the I2C communication to work again as it can be seen from
>> the following log:
>>
>>   [    7.305277] i2c i2c-0:  PXA I2C adapter
>>   [    7.310198] i2c i2c-1:  PXA I2C adapter
>>   [    7.315012] sfp sfp-eth1: Host maximum power 3.0W
>>   [    7.324061] lm75 1-0048: supply vs not found, using dummy regulator
>>   [    7.331738] sfp sfp-eth0: Host maximum power 3.0W
>>   [    7.337000] hwmon hwmon0: temp1_input not attached to any thermal zone
>>   [    7.343593] lm75 1-0048: hwmon0: sensor 'tmp75c'
>>   [    7.348526] lm75 1-0049: supply vs not found, using dummy regulator
>>   [    7.356858] hwmon hwmon1: temp1_input not attached to any thermal zone
>>   [    7.363463] lm75 1-0049: hwmon1: sensor 'tmp75c'
>>   ...
>>   [    7.730315] sfp sfp-eth1: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
>>   [    7.840318] sfp sfp-eth0: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
>>   [    7.850083] mvneta d0030000.ethernet eth0: unsupported SFP module: no common interface modes
>>   [    7.990335] hwmon hwmon2: temp1_input not attached to any thermal zone
> 
> TBH this sounds to me like trying to hack the solution and as you pointed out
> the problem is in pinctrl state changes. I think it may affect not only I2C case.

It is not an error in the pinctrl code. I have checked and even fixed a few bugs
in that.

> And I didn't get how recovery code affects the initialisation (enumeration).

Without the fix, it is not possible to initiate a transaction on the bus, which
in turn prevents enumeration.


> Do we set pin control state back and forth during probe? May be this is a root cause?

Yes, basically. The state gets changed back and forth twice. Once in driver
probe before the controller gets initialized, then once again in
i2c_gpio_init_generic_recovery(). The problem is caused by the second state
change as it runs after the controller gets enabled which confuses the hardware.

> ...
> 
>> [1] https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr
>>
> 
> Can you make this a Link tag?
> Link: $URL #1

Sure, I can change that.

>> Cc: stable@vger.kernel.org # 6.3+
>> Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
> 
> ...
> 
>>  static int i2c_pxa_init_recovery(struct pxa_i2c *i2c)
>>  {
>>  	struct i2c_bus_recovery_info *bri = &i2c->recovery;
> 
>>  		return 0;
>>  	}
>>  
>> +	bri->init_recovery = i2c_pxa_init_recovery_cb;
> 
> This is unfortunate. I would keep the naming schema consistent, i.e. rename
> existing function and use its original name for the new callback.

I agree, but since the change is targeted also to stable kernels, I wanted to
keep the change as minimal as possible.

> 
>>  	bri->prepare_recovery = i2c_pxa_prepare_recovery;
>>  	bri->unprepare_recovery = i2c_pxa_unprepare_recovery;
>>  	bri->recover_bus = i2c_generic_scl_recovery;
> 

Reards,
Gabor

