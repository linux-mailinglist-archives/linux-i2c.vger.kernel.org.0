Return-Path: <linux-i2c+bounces-577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13B800AD5
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 13:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5663281AB5
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 12:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D4D24B58;
	Fri,  1 Dec 2023 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="s8MKHaE9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1130D4A;
	Fri,  1 Dec 2023 04:26:16 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ShXNM0vmpz9sT5;
	Fri,  1 Dec 2023 13:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1701433571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O13BqXsPnQO1PbT/F6uF65SCmRU0WwrOFSVmm4rcPpE=;
	b=s8MKHaE9PJWQi33hx9ofSOoTM151D0zrWqJ+oCXk0Ls/eaosnHz9rNuS/zcV+U9SLeLuJr
	gydfF7F8PmkAF9kcHCY2wm4OPBu0YBseuJip9+TBAdG0W3xb44mEmFyRdJquYWr7zs5g46
	VyIAbcSFNgcyiqE4LJTLgEgX7XuLH3fgnEP47rcWE/w5QgIESRZr6Sb/U1gcfcSlskHDdR
	hut9d8tp2SIv0MjOvgQ+5UeZ9acl7OQNHZDQl3Uf+s5Nla3X91l6EN684dBBHRBBTg9TMI
	iOhvcUOh6fRV0ziOvKUgDVlHE+Ve+OvtAomNNgXSBNjw3DmWDUU6H29czv5ehQ==
Message-ID: <6fb5d126-1c66-412a-a1a2-6c4e5725f7fb@mailbox.org>
Date: Fri, 1 Dec 2023 13:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [Bug Report] [6.6] i2c: No atomic i2c transfer handler
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org
Cc: benjamin.bara@skidata.com
References: <13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org>
 <621c7d60-8953-1d7e-b4a1-f4fc510ba9d6@collabora.com>
From: Tor Vic <torvic9@mailbox.org>
In-Reply-To: <621c7d60-8953-1d7e-b4a1-f4fc510ba9d6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 39be58300fbcbcd9d35
X-MBO-RS-META: xmiqkr47qf87y9he6nixwayn9jrhccu1



On 12/1/23 12:50, Dmitry Osipenko wrote:
> On 12/1/23 13:48, Tor Vic wrote:
>> Hi,
>>
>> Since Linux 6.6.3, I see some warnings in the late phase of shutdown.
>> Unfortunately, they are not logged because syslog has already shut down
>> at that point.
>>
>> I used a camera to capture a small part of the warnings:
>>
>>    No atomic I2C transfer handler for 'i2c-0'
>>    [trace follows]
>>    i2c_smbus_xfer
>>    [...]
>>
>> After checking the changelog, the culprit was found quickly:
>>
>>    (3473cf43b) i2c: core: Run atomic i2c xfer when !preemptible
>>
>> Reverting that commit made the warnings go away.
>>
>> This is a voluntary preemption kernel running on a Skylake laptop.
>>
>> Please tell me if you need more info.
> 
> The warning says that I2C bus driver used by your laptop doesn't support
> atomic transfers while it should. Which driver it is?

'i2c-0' is
SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus
using 'i801_smbus' driver.

> 
> In your case the warning is harmless, still the I2C driver likely needs
> to be improved.
> 

That's good news, I was a little worried because of the several (I think 
it was 3 in total) large warning splats.

