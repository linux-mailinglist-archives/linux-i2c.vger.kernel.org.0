Return-Path: <linux-i2c+bounces-13119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C8B9679B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 17:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1AC3B4B7A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 14:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76462246BC6;
	Tue, 23 Sep 2025 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWXo/5rY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE791F5846
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639503; cv=none; b=SfsVVGJpK5e3sGSlYCMSm5OGAbKOycmM4hkZ6+GGO6s/rW0gx3Iib2Wl+BxpToEoLgYQy0Q+xab3JoEG+C+Uz2s0IEyOErgROHJg8dJeJeyxtBuIkAk3e6qP2PGeMihzIobMwJIQD2nf3RKtZLOejqIRzI763JCmF2lOsSSPFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639503; c=relaxed/simple;
	bh=gRBqSBgSa6OthtUzDtiNR0zF7w4r08SIGeb3mkOaZf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8J4zKcbb5PtTszJp18yIi23fFK7YtTanwG8atvL8OtrbmJwB72BEqXveV27QerFAdifqwwGNcD741/v+mRwgAOoKGZ77ICpvu/mPQ3uTtUKiWmecDmymbUilKWOCirA0gW+YvhdH+Fl7CqD07nlg2deYYcgLqmJ576TeuRSPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWXo/5rY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-25669596921so61195905ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758639500; x=1759244300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4ImXSi7R3if4rDxtPDuHh3gasiZze1yOROTcvFaBJ0=;
        b=HWXo/5rY11+dYX9/DzT4nd61BQkbCsUibCAiX2SkcbG2z16n5I0V0nl22/soTJQz9g
         ian3JT272UrqW7QregjIb5p3mtH9OWEr6mzu8Aayp3NjVWrXWwHfRul6ghCKGsnWBqAR
         Dmz4bfZG4RRju4hzSEZqjXfjTiizqVOEAmrgY1L+6+ZNVjqb9tIEA4YSJ1jj160ri+VW
         Y5y+GpP6/eCwkPsKGBq6jcneTjqcojYjvPKz3eKIGJaFBtmzngpSAmzNrJcQq97XI3vK
         js8SjNAgnr1AqtBx+ESkUdUnXyUggHRavqhh2evj7oVj1FZdpt643sbwTQEUVqh0+g+I
         rtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639500; x=1759244300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4ImXSi7R3if4rDxtPDuHh3gasiZze1yOROTcvFaBJ0=;
        b=A1AEyQRLh5Pp5EU0Dd4EIZGFlxN1B/eERYxID1WY1HQE8duQbMwHEe1UNZWPGeuyaR
         vLw3ti+tBCy2DbN7RjubruyvUr8BuX/dtLmh/KRwlT2dswc1Fz+h+O03dn9UihZ/zvD8
         sgF3lgY2u9DOKMD95GQEmH3sACRJLCSx7AlifNyiGRj6gnAnYyurDx/cjuFWHl6wAvCq
         AM6xAvAWc5/QIwwKDMZPZZfRGE2FKB98M0HWD3+6ChOCNFE4gi774A59EQsW32JOSIQ5
         RDDatW7f7w1OXwDweyDsQY9j5IIGDGHzNVoqMn5uUm/QJ+PobQwenUAYkH43P68ArM6B
         +yjA==
X-Forwarded-Encrypted: i=1; AJvYcCVcLqSAWEviBQBnxUvjO3bFLzwG98o0NGWZ8fuaMaABX0rWxVOSLhuoY5jSLsRhTVB2eVykYKamSqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0sDtNG16TGVAutWFVl6xRZODe8aXI8nPFCwkFzLquK4rcPPzC
	uJRwPjl9ACsr6AkgE6CgKe1snYy5FxRuSkVJhCLZcbhaXbY3bpVZuAzy
X-Gm-Gg: ASbGncvb06K3aZpa6GHnPpVnPCfwOK91nG9g2MIm64sHIbR8UlbDmOCKw4t0tk7t0/A
	0xsgej4FU8lr7VReuKLe+DuXc4if+gdwK8Ru+pSlBxZhiYGpo3q2jNL+O3YTR3yQpdT+IZXXpBk
	SQUM6XHCi/Ih77i31bRevA8+uV470OypV2EBq/ijz92ukByaxAoJiBMjngrj6nsS+Eqq+nJ0oQJ
	dwK+qHDDBR/8Apwrv3lKU+quLISHalmGRvoqFiLa0GWM27do1Dkjq7cNGgvYMTEt10yFEeZSszf
	cuEID8AhXQQg02JPDHI8cFR8grm8EXCDPPNiozaxCHviFfV9v6FkCBXKzQ20lwJDzHlL/ILLfzb
	QPrH34v98VWi1sTxLki57ifwkfCGasSN4ZiarTD9bWew3u5J9gf8qVUGXYw==
X-Google-Smtp-Source: AGHT+IF/zZclFSEgpiyYayQeOXrzChZJj4MnQ21sLwn2CDDgyVrjtxcXUaNDM9WgSRffhfGpsMsI+g==
X-Received: by 2002:a17:902:e80e:b0:267:af07:6528 with SMTP id d9443c01a7336-27cc48a2813mr39477455ad.35.1758639499884;
        Tue, 23 Sep 2025 07:58:19 -0700 (PDT)
Received: from [10.0.2.15] ([152.57.99.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bea0sm165554175ad.40.2025.09.23.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:58:19 -0700 (PDT)
Message-ID: <65c32c82-d744-4477-8a6d-10ce9a4cd295@gmail.com>
Date: Tue, 23 Sep 2025 20:28:12 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: ft260: Use sysfs_emit to write formatted data to
 user buffer in sysfs show function.
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250923144926.307315-1-bhanuseshukumar@gmail.com>
 <2025092316-pasta-parachute-737e@gregkh>
Content-Language: en-US
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
In-Reply-To: <2025092316-pasta-parachute-737e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/25 20:26, Greg KH wrote:
> On Tue, Sep 23, 2025 at 08:19:26PM +0530, Bhanu Seshu Kumar Valluri wrote:
>> Inline with sysfs documentation, sysfs_emit is used in show function
>> to write formatted data into user buffer. sysfs_emit is already PAGE_SIZE
>> aware.
>>
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>  Note: Patch is compile tested and verified with checkpatch.
>>
>>  drivers/hid/hid-ft260.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
>> index 333341e80b0e..8677bea46bea 100644
>> --- a/drivers/hid/hid-ft260.c
>> +++ b/drivers/hid/hid-ft260.c
>> @@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
>> +	return sysfs_emit(buf, "%d\n", *field);
>>  }
>>  
>>  static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>> @@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
>> +	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
> 
> There's no need to change existing users in the kernel for stuff like
> this, only try to do this for new sysfs files.  We've had too many bugs
> where "simple" changes like this cause problems (recently in the USB
> core for example.)
> 
> thanks,
> 
> greg k-h

OK. Thanks for the prompt feedback on this. 

