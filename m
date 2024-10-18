Return-Path: <linux-i2c+bounces-7471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC29A389F
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 10:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 549F3B202F4
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 08:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2735618F2FA;
	Fri, 18 Oct 2024 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6tv1oKU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D518E77D;
	Fri, 18 Oct 2024 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240416; cv=none; b=ftlDl+JMyA9WEj8dWDy8PO6goDx3jhk0dICn+lAap1Z8GAc6e+PioM0ORYx+Y99kG69ZwmfKmU/6MeFiXwfJ5DwatgQY01W6kZc8UWfQ6Fmumc5WcVs64GP9HdvzaqjDqBqcnS6D3zM7uGGyMWAQwRQioa6n1RC+QataMFv1Sgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240416; c=relaxed/simple;
	bh=bPvtgka4O70SNp1BvWsCpGkXUvDdkM+axfV4IqdxJIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWOYNSQp9ZdUBhswmggLzNJ6nMh4Gjtgm1NMsDv7BCs4aLIhIsdZFzTfd4/AKNmtdDx1wfKFSwsJwp2rSc7y/9TwN30Gebpk5/ELTQxFBYpN4NJkU2YShvaRCMgPP2hLa6p6lHBAy2fQRv5x53rzWLNly8hYvvkvfN//mP2qs20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6tv1oKU; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-43152b79d25so17598095e9.1;
        Fri, 18 Oct 2024 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729240413; x=1729845213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSDIC5cCYjy8xP5Lawl698UmJHuow/FjNAYXQDDyW44=;
        b=L6tv1oKU+uy9BYPZDabqB5bdfFyvIL6JetypyOGjdzPk2VO0eVoqCTZTWGaAkoNAqx
         31WJfQnsVwXhePP5v4JuHueVhRlj9YOPQcSVeuXB5AiD8anzA+3zpURVcW0N2ZGqYnJa
         J5D4hpZBm5W+dX8yyJQ+SF2XAoxhWjOCHSb/fDa4+YArYibGM23XcAIgYDvWTVGaBxTk
         TsYbubWEcIQDn4zJ5JNfSy5SYeYNOVH9FIzdgyxM0gGu6aVihmKkTYt932is4xvFsUss
         kvHFJgVr4FZ7E+oKqqCoPdw0orquzMsoBeyaEDk7KH/1axhLgnwNupV6X5zGh+6cowLc
         npAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240413; x=1729845213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSDIC5cCYjy8xP5Lawl698UmJHuow/FjNAYXQDDyW44=;
        b=QZsnTUviiSp+IhgcdBkoY8zQODml/xkr3sB+p7ftpkxU1TILGp7IAh0mN11cQOgMke
         A44p4md9xK8yun+cJvpEBRkHZtoSQSe/kK1O4I5f9Fo1SApySKquelkEGmC8kA/bMnDr
         TAgi3RaLlraIKjUjmpX1yFpcCJ9rCk7dFiD4q76HmlDhvLBL0AGwgIQ+nM5nLy91HLyo
         NwlXAciBso8I3t6hpHpm7kwdoChfZ9DjzWONqdvClCnDWxnf0FTPTFYOmUX6BmVqMdjR
         LjrGCuPm+wAilvtlLOmYyIKMLoSDuniy1XYoegWl0ofc+ablEJ96KrmG/xsNDfXT/zaG
         0w/g==
X-Forwarded-Encrypted: i=1; AJvYcCX/Z2xp2DOy6Cfu1akp0xqlyQRZxGTkwW5bRlgscUHHRPifMXn2oYkSH76p3XfCLZw3PaMAcl+bT3ZyrW/d@vger.kernel.org, AJvYcCXMRzlb13nllYMWUYV+ae2yOO4JTdPlljT7wx1A2trqnjQUyLm1BX51hjA4/qTJ5z9yb2oYKA54tjAp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz31W0VC5xTpYKC4LsO88udHsKF5TOzQsU/+BrMYqHD1GBTlmn
	URmYkqq5htSu7RuO1hfi1ViC6iZoGn8zF6zBy23FbwgHSsZWMFHS
X-Google-Smtp-Source: AGHT+IEJQAPEWtmckvmmWURpZY7JSL9sn0otA0oqd8tk+ckP8fSLTYisVZqpPk2GfGopsXm6A+vKwQ==
X-Received: by 2002:a05:600c:3b08:b0:431:55af:a22f with SMTP id 5b1f17b1804b1-43161657d65mr11248875e9.13.1729240413317;
        Fri, 18 Oct 2024 01:33:33 -0700 (PDT)
Received: from [127.0.0.1] ([94.131.108.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf027d09sm1310740f8f.18.2024.10.18.01.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 01:33:32 -0700 (PDT)
Message-ID: <6545eabc-1956-4e55-be99-e0b35650a773@gmail.com>
Date: Fri, 18 Oct 2024 16:33:25 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 troymitchell988@gmail.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-3-TroyMitchell988@gmail.com>
 <eb4112aa-21d0-4537-a18c-940d8832711a@kernel.org>
 <193b9781-8782-42f6-8a43-2f17ca5a28e1@gmail.com>
 <e457d0f6-8403-40a2-afb4-c3d3d4a25ae8@kernel.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <e457d0f6-8403-40a2-afb4-c3d3d4a25ae8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/10/18 14:05, Krzysztof Kozlowski wrote:
> On 18/10/2024 07:17, Troy Mitchell wrote:
>>
>> On 2024/10/15 16:08, Krzysztof Kozlowski wrote:
>>>> +	disable_irq(i2c->irq);
>>> Why?
>>
>> I just want to turn on the interrupt when the transmission starts,
>> and turn off the interrupt after the transmission ends.
>> The interrupt shutdown in the probe is a starting point
>> before the transmission starts.
>>
>> Is this reasonable? If not, I will modify it.
> 
> You cut so much context I don't know what this refers to. I will leave
> it to I2C maintainers, but toggling interrupt on probe is weird.
> Toggling it for every transfer as well.
> 
> Best regards,
> Krzysztof
> 

In addition to this problem, should I send v2 after
I fix all the errors pointed out in the email,
or should I wait for I2C maintainers?

