Return-Path: <linux-i2c+bounces-10765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE4FAA9139
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 12:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8CE1761B1
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 10:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193671FFC49;
	Mon,  5 May 2025 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBbCeq6b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF5D1E3DDE;
	Mon,  5 May 2025 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441227; cv=none; b=C9SPwljN1osMvw9XMJi4cm4C5k2k6hVaPRg4HCk7a2G0/tNR4Tq6Hr4pl4gqyon5eJ4NmUL1YZ6FTZHjqV14kGxFT/g0ZW4rsf6Kx++c6cnX9BAz52EB6kxFO6bN4U2BzFF0Q5QMs9qSQne2SlWVOBhfN502+hF9OfnGUBQ8P5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441227; c=relaxed/simple;
	bh=lCB/KU4EWmRirrJ0hLSCx6f6T2wqdHPLL7mAn7GHhOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqsGdjJDeFck8hQMId84M2GMsOVPPkOhNVoLSjXYo6k3K8mqWNES8h2QdDSx2lQ1ZDvn78kmnGQiN8N18zUspTp2ONLoND8GIWuxinCd2dmnV9FuaqoAZkP7szK2SIHJ1Bhp7qlnMZMKxu7WGAx0/qIuR+fd4LGK5SoBEUlz0Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBbCeq6b; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso6508466b.0;
        Mon, 05 May 2025 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746441224; x=1747046024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rJgSVSbuwbKeNzjeTI8qJhLYNYDZLXvbBBy/+u2XcQ=;
        b=MBbCeq6bSnLP7mvDkVFovD/ZXacWbjKHD9Qf49tFf5aUTaYlqx0FYK0b5rBgy2QOzS
         63/rok1Y+jmSMv/yO1WpgSCx6bwVsSVNVguDLw7/pjSaj6UNwJtKrYvs4GgPRvdRAO5K
         W3K/oVqWiY9f4YaGIaTglokZZ+OUt7hLdZjnu/DcZFinfg9xPWOCaOcvoQILQopwt9R2
         7OGYWb/qEdGjrhw6Nz0gBknVGirxzQTXx8nH2iyNc1CWCXMyd/V6upS6TF/Hu5N7QIUS
         u6ywOR8JyyT8ygE1pC0E3Hgaz1oKKjcyZNs3k9aw5z+d2JKmeaAGOMV6SolJTg8YxbIw
         I4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441224; x=1747046024;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rJgSVSbuwbKeNzjeTI8qJhLYNYDZLXvbBBy/+u2XcQ=;
        b=I7WMJDhM4cAyaWdhCWaBDwESkN28dbmf2PQQ3dARYPnAwlVOtuJo3A9K+GYDXwWwlX
         P5kApllzLnE8+69CjExrD+3FY9u56M9q3kfxu2rr6QxuckQRUDZegIzYP9F2zKyJivPt
         4fPJWoB+kQcU9s03F23ua8f1zTQSWve+FLP1tGZf7lLs/+Ht5dO2z+bzOVk+bJkLLjE7
         X0JGKfn8rOaGSykVfGsmOsh95q+U0R7jNMCcncMvzIUABglTksC01Jr1U3jD/iKZNyd4
         /oVGpBnHQeXFLz1F1iMf9PWYk6oR6+yqso6Xq5TtgdwqOyVjN87H00Tw6VC5vf8+rrbZ
         s+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Ajzcp4Z9SN80PJB9QCtxvaydL671g/ensXuTyZd+6AvAWuNUadsqtmYgWoaRJAA1tzaguhnPTw2TuWsz@vger.kernel.org, AJvYcCW259B6Bb8/ANxBljyAWoMbUK6C6PtS0NlTqiWnVOyeJyXuGMlCXbAuJ1mza16B4Vze1O5Gos+bOTaK8mU=@vger.kernel.org, AJvYcCXSnQWDrs6Ptl1FaFZkI7oZGCgsSCvWO4gpKFndaGJlc3tzGyibHXEcQ6tuigwg9iyvEltd4h/HxcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxglE6tq7CO4TYfBYx/BFDQdAVW+NIHteI9Q7lPLYOblqlG18af
	dV5Sv8j3y5nechjhOJPA3zmdRGhKe0dBMuk7dlxYcocRrsY12RMe8GmY5w==
X-Gm-Gg: ASbGnctorMTdJiFV+gAxs3a60j61QPQIFIs9rRpxGzogfyXng5vfATMWPpwmMOIKbVm
	VoxXMSD4PVFbRtvG7H1/5m+pMFAysElO7t1PlM3fjNi2T8UhffD9ZjWTI0tu63jmQ3AXaWQJ2uN
	vsSyCQA7/ROO+VEz26Kha/Yt3bdB7DIuMHya1mocErOho20xe5H5kKMU/oAWjH45zYTi8eJvkP2
	ZFS0tI2NHZAlZPipnJRpcbLcZDC8MtWCZeEuCo1+Xlb2/RWBWWyn6DmwR7Ed6J7V6yBop1xcgK3
	O4HbBNgP/DFA2uDqUpbR1bDEl9iJpsRCI1gE1kp6m34TNg==
X-Google-Smtp-Source: AGHT+IHmzgCa5RowX3J77I/UZtYyTmrm+8dfGqaf3Norp3zDOkDEToegqxSiZxR7VeeC8E3ppl+pow==
X-Received: by 2002:a17:907:6e94:b0:acb:ba01:4a4 with SMTP id a640c23a62f3a-ad1a48bcf72mr690834266b.3.1746441224193;
        Mon, 05 May 2025 03:33:44 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891f3c76sm471755166b.83.2025.05.05.03.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:33:43 -0700 (PDT)
Message-ID: <312c3e05-13d3-46ad-8231-6d60969b4aa5@gmail.com>
Date: Mon, 5 May 2025 13:33:39 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] i2c: atr: allow replacing mappings in
 attach_addr()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250428102516.933571-1-demonsingur@gmail.com>
 <20250428102516.933571-7-demonsingur@gmail.com>
 <20250430163356.17eedc2f@booty>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250430163356.17eedc2f@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/30/25 5:33 PM, Luca Ceresoli wrote:
> On Mon, 28 Apr 2025 13:25:11 +0300
> Cosmin Tanislav <demonsingur@gmail.com> wrote:
> 
>> It is possible for aliases to be exhausted while we are still attaching
>> children.
>>
>> Allow replacing mapping on attach by calling
>> i2c_atr_replace_mapping_by_addr() if i2c_atr_create_mapping_by_addr()
>> fails.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   drivers/i2c/i2c-atr.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
>> index bf7b2ac5e9cf..7214a59ddf15 100644
>> --- a/drivers/i2c/i2c-atr.c
>> +++ b/drivers/i2c/i2c-atr.c
>> @@ -543,6 +543,9 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
>>   	mutex_lock(&chan->alias_pairs_lock);
>>   
>>   	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
>> +	if (!c2a)
>> +		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
>> +
>>   	if (!c2a) {
>>   		dev_err(atr->dev, "failed to find a free alias\n");
>>   		ret = -EBUSY;
> 
> Looks like this should be squashed into patch 5, no? I might be
> wrong, but IIUC the change in patch 5 is introducing a "bug" ("It is
> possible for aliases to be exhausted while we are still attaching
> children") and this patch fixes it.
> 

Patch 5 doesn't introduce a bug, this is just how things were before.
If you look at the diff in patch 5, the error case of
i2c_atr_reserve_alias() just returns an error.

The logic in i2c_atr_attach_addr() didn't handle the case where a
mapping is not able to be created, matching the logic in
i2c_atr_create_mapping_by_addr().

This patch adds handling for that case.

> Ah, nitpick: I wouldn't add that empty line.
> 

I can remove it I guess.

> Luca
> 


