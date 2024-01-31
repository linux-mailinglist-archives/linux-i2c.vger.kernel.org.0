Return-Path: <linux-i2c+bounces-1547-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2B8437DD
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 08:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D0228BB2F
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 07:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673CD67E60;
	Wed, 31 Jan 2024 07:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrbO/iHu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8C0679E7
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685840; cv=none; b=i0OzD4fSB70Ki0oKJx1iioZcONV+D9n1gWL4vSZ1LxXjC1PBOxGYtP1gHAbvVO203zBBAtDbrN1+YW58ZzpfdoT9QBSrcDb9LA3Isp1+n+AVsIi08X8QzzhQUmsEfdUiXOheR72N+sG2sn7vt/lBw85241qYjEvqL6KHxvHxjRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685840; c=relaxed/simple;
	bh=pCGtVdy2bkyAPxODiao/fHm6E4LPRS//gzvXTAaFKOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHKMnCIQsU2zPvfXKqtwtQOnoWiB8EK9R7oiJR9SLBxTl5bF1F95Aq3sf+ERtIdzDtXXaSails5AvBnyWxqBvz0Y3IflGi5jhdmeeBf1FI+m/63NCJ1fGkXg4pUWB9KmweLFXt1L3ZO4WRF3ngf6mzf9pzEApUH8nnWCSo65wZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrbO/iHu; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso610819366b.2
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 23:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706685836; x=1707290636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCxmw1O95GyMDWg0apzdLTD26EDr+5r2296x9E0sWHk=;
        b=CrbO/iHubTjAkNhElVAkYlS6XBM4odsH69yX/5ZNCoMbAIEc4WZFGdoNK6vuwOvE3c
         +lIISRineuxXolzKAkbOTIPOFRIAEXbOGqWcCRYIcdVy2avtq52TMlV9P4Jv3xhL8tXr
         mxRyXw+j9lJrErdTCnhKhe1qxnyDx1t0O+MEfTP+YzDN/sFtmzNbNWc9LWkI7DkMrxif
         PgUbGt5B3i4KKIYLYYquXIlPBAZ4HIoCZ442S9B/j/KZiguYSyA0X4sYjV5dzjRQDUoH
         9YLx+86ABcob81T371IFvyv6nibVrnzx9jpjwIb8E9/QVMpVNpX77dRNd8w2u6Lkm490
         pCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685836; x=1707290636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCxmw1O95GyMDWg0apzdLTD26EDr+5r2296x9E0sWHk=;
        b=rPuzku/inuAl2JD1OtuqfBTSZG+ragHoKR37ur8mMWV/r3EjAkiPnQtAku7KN+4mOU
         6UnmbgUoniRM551HNNn96ayT7cSscyvG/caPig4BdVMXZcZyf6fdvVdDDCWKHoerWXKB
         u9eVZ1gdgNCQiRt0koGaXYjdoElrn+tckU9iO7p4eUbxc0yBRoK73giJ6yRh2nJAZYhu
         0zT8ZC+Em216kqHkC9jmoq844Nkulmh29d7VfnIZw3RSU3AO7/GCbb3UNu5oUw8sHiAX
         Ru0BHR3SW8wLALwV/JJR+60FFRx7Rh7AX6WlzuR396YsXdON3YpAs70rH9uGJ6yW9ZvJ
         t5Lg==
X-Gm-Message-State: AOJu0Yym0j6thG1HM9YtD303+jb1dmHTJnAvwcVR9hCE7OoQCscEVAGl
	wxiSmQfZxhcvamIG5ECZuYLdxV1rX8o29yIjvulqaGC6RUS7IoCR
X-Google-Smtp-Source: AGHT+IGRy4jGLsIW+ycU1/NE6ftVdMQMrv0794ZpUPW/Ex4DHUodjQiL+x4uHmgPmWBmGAWJ4t4JSA==
X-Received: by 2002:a17:906:80cc:b0:a34:d426:1bec with SMTP id a12-20020a17090680cc00b00a34d4261becmr452480ejx.12.1706685836216;
        Tue, 30 Jan 2024 23:23:56 -0800 (PST)
Received: from ?IPV6:2a01:c23:b988:d300:e5d3:e87e:2ada:d09b? (dynamic-2a01-0c23-b988-d300-e5d3-e87e-2ada-d09b.c23.pool.telefonica.de. [2a01:c23:b988:d300:e5d3:e87e:2ada:d09b])
        by smtp.googlemail.com with ESMTPSA id k4-20020a1709061c0400b00a349e943828sm5879794ejg.75.2024.01.30.23.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 23:23:55 -0800 (PST)
Message-ID: <ab6f3126-b9af-4a4e-b2b5-9ea7f1829cc9@gmail.com>
Date: Wed, 31 Jan 2024 08:23:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] i2c: i801: Use i2c core default adapter timeout
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <380b592a-cb28-47ef-b110-e2ee6e8550fb@gmail.com>
 <dgctw2imnpwhlef72pkcubaok2zi7s3ej3m3cdvlhmjv6xv3be@sltjtakw24jt>
 <5816ddf4-1623-4bbd-9178-342a79eab768@gmail.com>
 <7ljbyo7slq74nnwelifdtjhfopy2vozo4qy7cfvrzbeqderpox@ijrb5fqwfztn>
 <b86980f9-add0-4e59-bb4b-4353344d5f2d@gmail.com>
 <h3opuzzid76qeiwe2ghxpkshj7my27pkrmblrds6kxrvvqvzyw@5ow6ceypibwe>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <h3opuzzid76qeiwe2ghxpkshj7my27pkrmblrds6kxrvvqvzyw@5ow6ceypibwe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 22:58, Andi Shyti wrote:
> Hi Heiner,
> 
> On Tue, Jan 30, 2024 at 11:25:33AM +0100, Heiner Kallweit wrote:
>> On 30.01.2024 11:00, Andi Shyti wrote:
>>>>> On Fri, Sep 22, 2023 at 09:35:55PM +0200, Heiner Kallweit wrote:
>>>>>> I see no need for a driver-specific timeout value, therefore let's go
>>>>>> with the i2c core default timeout of 1s set by i2c_register_adapter().
>>>>>
>>>>> Why is the timeout value not needed in your opinion? Is the
>>>>> datasheet specifying anything here?
>>>>>
>>>> I2C core sets a timeout of 1s if driver doesn't set a timeout value.
>>>> So for me the question is: Is there an actual need or benefit of
>>>> setting a lower timeout value? And that's something I don't see.
>>>
>>> yes, that's why I am asking and I would like to have an opinion
>>> from Jean. I will try to get hold of the datasheets, as well and
>>> see if there is any constraint on the timeout.
>>>
>> The datasheet for the 7-series (doc# 326776-003) states:
>>
>> 5.21.3.2 Bus Time Out (The PCH as SMBus Master)
>> If there is an error in the transaction, such that an SMBus device does not signal an
>> acknowledge, or holds the clock lower than the allowed time-out time, the transaction
>> will time out. The PCH will discard the cycle and set the DEV_ERR bit. The time out
>> minimum is 25 ms (800 RTC clocks). The time-out counter inside the PCH will start
>> after the last bit of data is transferred by the PCH and it is waiting for a response.
>> The 25-ms time-out counter will not count under the following conditions:
>> 1. BYTE_DONE_STATUS bit (SMBus I/O Offset 00h, Bit 7) is set
>> 2. The SECOND_TO_STS bit (TCO I/O Offset 06h, Bit 1) is not set (this indicates that
>> the system has not locked up).
>>
>> It's my understanding that the chip will signal timeout after 25ms. So we should never
>> have the case that the host timeout kicks in (as long as it's >25ms).
>> So the host timeout value doesn't really matter.
> 
> This driver is used by many platforms. I scrolled through the
> datasheets of few of them and they differ from each other.
> 
> This was set by Jean[*] that's why I need to hear from him from
> where this 200 ms comes from. 
> 
> As this change doesn't change much to the economy of the driver,
> I would take it out from this series or place it at the end.
> 
> As of now, I'm going to take patch 1 and 2 in and you can
> resubmit a v2 without the first two patches.
> 
Sounds good. Thanks!

> Thanks,
> Andi
> 
> [*] b3b8df97723d ("i2c: i801: Use wait_event_timeout to wait for interrupts")

Heiner

