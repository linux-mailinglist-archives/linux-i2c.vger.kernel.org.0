Return-Path: <linux-i2c+bounces-2464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF9881C75
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 07:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2592836C1
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 06:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BE43A1DE;
	Thu, 21 Mar 2024 06:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b="ZO6fpmlz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845CAD48
	for <linux-i2c@vger.kernel.org>; Thu, 21 Mar 2024 06:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711002287; cv=none; b=V7C3g+GxaKDeLHv5HaySb2fxsradVv3ibsTz6pJcKpzSWCkrWJ1xfxZB7xomLxY5udUqznXeveBiajHS76xi1AG/S/equGIRF3G1CHOZzH71nO08NWpS2hGnpYlP5A4CP5nFYchs4GXJwNpkavtb+QCqIULIig3lgzFyS5SSabc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711002287; c=relaxed/simple;
	bh=u7gy52Zr4WALCYWAKNUwux0AGgQz+4tJN82RhdfsWxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZ/qAO0FrE3SHD6vq7vaDvlpP3Si/t/Uqv2rJtYEvakMWiCia4X0vX5b+95rlg+59bwQFjANUZjx8+bM3//JBZWGOMy9VlN/t8Lq52CbW/b3l1Tx3z5ziy0Mjrnx7TFVglIh2ZXqwlpicaR+dHxouzhxbCLvHfDprY6o2NVue5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com; spf=pass smtp.mailfrom=turingpi.com; dkim=pass (2048-bit key) header.d=turingpi.com header.i=@turingpi.com header.b=ZO6fpmlz; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=turingpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingpi.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-366b97b5796so2283815ab.1
        for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 23:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=turingpi.com; s=google; t=1711002285; x=1711607085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3cOWF0tnWKn5tL69BGnqb4RHaXGsDQKgBLpXfmTfh8=;
        b=ZO6fpmlz+NwI3f6e6V/qRAjLt46nbGHzxRMSqwO2I9smXsYzp/E/uFkDdbqOpouPz3
         7wZv1KzUXdmb0WIqWIm1rRPjiodtZ9mCYHgUme2sISdRVnBJU6QQLndacDaRWBi4bNiH
         XT+OleSiRlaX4h6X51i+eUMRIPGW2HP0DzI7MwLUma7VyASnomERF7E8X2qCt7pQxttI
         NSgYjZy4jAyuAaFTV68t1bQSmcVhBv1oUT3IMyyvma71OGb6EyTF/B97RNE1RRGmbWs9
         6PIjFRqMt9C0mRxMCBv0C3smefzofB13pz7VSaSosT6mFIfdmm7AyDRJgRoNwUcnxIiQ
         diRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711002285; x=1711607085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3cOWF0tnWKn5tL69BGnqb4RHaXGsDQKgBLpXfmTfh8=;
        b=GfGewHH5bBETPLjtSPnUDUIn1wunsJEblvy/fdtwzXBNBW69K7KcSKxSaP11oqrcwi
         WEdOSz5C7e3+0QlnJcvvv9LhH/KhGROlwU7Naqe/MTrZIDjftgaBCHKU4ZFmxp4rzv3s
         ql88XtxcvBptZlhf5edWE+2um4dWQBMwVuRD9a3FZqiQ4+st6LTtN+Dt+parDQZDaFf9
         VaNXEcmceqdHG/tW78jcxFT2zrlqntqv6GoaZg6hjAYkxFK93cINbuxjUs+v+5vLUZfW
         OIWy5Xc0GMIIhwGn2qM21ZQ82kRyuOLL0MQG73h9F1JAcZ388MyOiVVfZKksHy9YV8kZ
         fZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmcAHmDr40lN9rGSzpSS8Wxm9NUp9N9Qb2AQXUccTmD3WqOEWxvGB7PfBKbTg+U0MXxv0zGPRFC8MHxV1rqYc8hxdt+AVseHp3
X-Gm-Message-State: AOJu0YxHStymwbZ2IhwL1WdAZkF++OtcJsxNwTPZdkAnJLLrv+Al9wSM
	oGPunw5AKTKGKYz9ucL343efhYsTlTgOzzmsUPxZdPv2vf3i6Lr9r17/nCPkcPs=
X-Google-Smtp-Source: AGHT+IFl+3GQbbjSbfeFHZiRrzLet8mSgYnqao2atBSVQewHsUtzoSIIKIiJkL5hOdodXy8uTkCifA==
X-Received: by 2002:a05:6e02:f05:b0:366:b269:f4dc with SMTP id x5-20020a056e020f0500b00366b269f4dcmr1291438ilj.14.1711002284703;
        Wed, 20 Mar 2024 23:24:44 -0700 (PDT)
Received: from ?IPV6:2001:470:42c4:101:5977:3c90:314a:e5da? ([2001:470:42c4:101:5977:3c90:314a:e5da])
        by smtp.gmail.com with ESMTPSA id l5-20020a92d945000000b00366940cfba6sm3786271ilq.58.2024.03.20.23.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 23:24:44 -0700 (PDT)
Message-ID: <4a043be8-8e88-4b92-913c-abd8f138b90d@turingpi.com>
Date: Thu, 21 Mar 2024 00:24:43 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAF8uH3tYaUwhkkeFuY+PdsnSPqeTtWtOsB_hy9oOjF=f-2Hdaw@mail.gmail.com>
 <p37qqpplxgmfzlq6wz7fvmvnrsumy6ra5nivzi4hd2gbvlbezx@dlh6ygyjbk24>
Content-Language: en-US
From: Sam Edwards <sam@turingpi.com>
In-Reply-To: <p37qqpplxgmfzlq6wz7fvmvnrsumy6ra5nivzi4hd2gbvlbezx@dlh6ygyjbk24>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/20/24 20:28, Andi Shyti wrote:
> Hi Sam,
> 
> Thanks for your patches.
> 
>> Sorry about the resend; it seems my mail client "helpfully" swallowed the
>> newlines on any line consisting only of whitespace, garbling the patches.
> 
> I received three series from you:
> 
>   1. [RESEND v2 RFC 1/5] i2c: mv64xxx: Clear bus errors before transfer
>   2. [RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
>   3. [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
> 
> By the versioning, 1. is good, the rest is not good. Standing to
> the time sent and comments in patch '0', 3. is good, the rest
> not.
> 
> Which one should be discarded? Can you please state it clearly?

Hi Andi,

Thanks so much for your patience -- this is the first series I sent with 
this particular mail client and it really didn't go as smoothly as a 
plain git-send-email. I'll get it nailed down in time for the non-RFC 
series.

I sent the series in the order 2-3-1, so 1 is the version to look at 
(though I made no content changes between resends as I was only fighting 
my mail client's formatting).

> 
> Besides, youre mails are not threaded, They look like:
> 
>     Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
>     Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 1/5] i2c: mv64xxx: Clear bus errors before transfer
>     Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 2/5] i2c: mv64xxx: Clean up the private data struct
>     Mar 19 Sam Edwards     ( 15K) [RESEND RFC PATCH 3/5] i2c: mv64xxx: Refactor FSM
>     Mar 19 Sam Edwards     (5.2K) [RESEND RFC PATCH 4/5] i2c: mv64xxx: Allow continuing after read
>     Mar 19 Sam Edwards     ( 11K) [RESEND RFC PATCH 5/5] i2c: mv64xxx: Implement I2C_FUNC_NOSTART
> 
> instead of
> 
>     Mar 19 Sam Edwards     (2.3K) [RESEND RFC PATCH 0/5] Enhancements for mv64xxx I2C driver
>     Mar 19 Sam Edwards     (2.3K) ├─>[RESEND RFC PATCH 1/5] i2c: mv64xxx: Clear bus errors before transfer
>     Mar 19 Sam Edwards     (2.3K) ├─>[RESEND RFC PATCH 2/5] i2c: mv64xxx: Clean up the private data struct
>     Mar 19 Sam Edwards     ( 15K) ├─>[RESEND RFC PATCH 3/5] i2c: mv64xxx: Refactor FSM
>     Mar 19 Sam Edwards     (5.2K) ├─>[RESEND RFC PATCH 4/5] i2c: mv64xxx: Allow continuing after read
>     Mar 19 Sam Edwards     ( 11K) └─>[RESEND RFC PATCH 5/5] i2c: mv64xxx: Implement I2C_FUNC_NOSTART
> 
> Which is the default of "git format-patch".
> 
> Can you please make sure, next time (unless someone asks to
> resend them again), that the patches are threaded? You can send
> them to yourself first and see if they are really threaded.

Yes, definitely. I take it from your phrasing that you're willing to 
collect the scattered mails yourself this one time only? If so, thank 
you for cleaning up after my mess. :)

If not (and/or if someone else doesn't like the mess), I can always 
resend. I have already made one cleanup (removing the useless `default:` 
at the end of the FSM) so I guess it would technically be an "RFC v2" at 
this point.

> If you are using some weird mail client, you can also check the
> mail header, making sure that mails from 1 to 5 have the field:
> 
>     In-Reply-To: <Message-Id of patch 0>
> 
> Andi

Cheers,
Sam

