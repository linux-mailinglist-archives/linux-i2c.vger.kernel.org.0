Return-Path: <linux-i2c+bounces-7821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 741239BDFDC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A725B23656
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 08:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B59D1D270B;
	Wed,  6 Nov 2024 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ6GxUS3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8871CC8A3;
	Wed,  6 Nov 2024 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730879996; cv=none; b=HR9A4wTmKcxlraDpd9eQsg1Re58Hc6/N22ZyIwk79gmk/VPy6d2fuie2TEJdcG2A4MqAoqrIyP2YrocKzwbHBS3GCptwRkwD2FwTPyQSos3VUPa/b32kwWs0G0J+eMn8HcDzWdVOpDJjU4LAlRUR1XsKMFqCThhFAj6ohqOwm6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730879996; c=relaxed/simple;
	bh=M+ECQcMCVLFi9fLwmcp5X8hGJhNmL2Yy0/vORCO6s68=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c1g7bUgcoDDJIJXSsnoi23tvyNkCMsvFZOm4AGQaiOtv80oZWajj7IVXBkr9slPPtRwEhl92v8hdgzcvJJmw2Y1u7a5SAlAgwuwJHc8QDq1PbgGiK8ogEYNUbxfcUr16peM3UMHeorsY5YDT0YF2crj0OmxDTUdHUuKCrCHlVok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ6GxUS3; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-20e576dbc42so66806665ad.0;
        Tue, 05 Nov 2024 23:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730879994; x=1731484794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxeNK5t7CfGOlB6qBbFwH4xASU+xK3fI87OxOC6j0kA=;
        b=nQ6GxUS3xhwNscYyumHIddvAXTO9sVkHX8iKjPOYpQNsxpI/zj0ymfswj3yqOzWA31
         o7oDXmzSpOkuT/R5Oal5nTTK1A6WOBradsF2e3v0HwkMRoBvgXqQjqsaMKpQ0b/TzFu6
         Cnth+as8KQeqFRrQ6ShhqQGZKNeDZzBVkacMA2lhS3W41uDynnAslJYVhCcyB7YZzn5e
         jchFvk9IIk2xP5loAUzUuDboo2xvr7/T4RgFv1P/fwnmeXBP9R9K8H1A04EEUXqv0BzW
         1UbiSEaCEP6j8Qc+UOzTEy5xuXUFbNhpsOdXxeQ5YJuyogwTqTtAPFyyX6J7Tar3H4iB
         /Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730879994; x=1731484794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxeNK5t7CfGOlB6qBbFwH4xASU+xK3fI87OxOC6j0kA=;
        b=M5M2qD4Ck+r3DzqsnXOY2p2PeelMr6xcdFm+9I70q2Gk5RYXmoIhhVT/vQbZzWBdOw
         Ois2NcBWfvd33jmv/0Cm7tUHJkSW09YK4e8yfSjI1Edhs2wdObtSW8+pdLMWm4qpFY4c
         udfoHFkWr2eI7JpRfhbwPdsInAN+NTtA7K2RJVbDLGUcagIqvBhQCVFL4nhF5etpbAZb
         xPL/h3Y7nuZ/m2YqTxgbYRndKzrPyutiR0ue8su4Umqb5dkhGtFjbpoNjaMmFchyxZtZ
         LpvuHR3khTXWrvj2pUSWyB9BS4Lft2CUvOleorX+joE/W1AWv9jR7AXHhEijLkp6P6cG
         stPw==
X-Forwarded-Encrypted: i=1; AJvYcCUcK7u8+HPAzKGV85TKNnW/L4fNrvg+eR8Dj5oXFBcBgiH+QL79odifYNtrTrWb/AUE8zEc+1z73fIZnKoq@vger.kernel.org, AJvYcCWpHJ8wKqRT6NiTYL7PqZecbk9IaNAP0jQQWIDnmqPs4bPBmRhG4FRssxO4/WB8or8RPDgIxGDyXGMK@vger.kernel.org, AJvYcCXBDDT7FaY/aUBsJZFs98hU257uvQuKcvOxguJesEJJrZhzZkC1s8wY9kqnX9tcXuLqqcL2zPPFi5AY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5ReJu+EJO54Mi76V27JJrDBHYNaegROifZ3Rqd9mFF75aFHQ
	oYHM2MIjsH2IdMX0Kw7W0JAUEjnAUuNqFIuW9qJcd5V5wAjSQujl
X-Google-Smtp-Source: AGHT+IGdUmH8GzeKzxo8Se6JpdbU41SzCRP9as3jCkSxf4igM8ZAicZPCcbsg5EEVD4fY1rEZXHrNg==
X-Received: by 2002:a17:902:e890:b0:20c:e169:eb75 with SMTP id d9443c01a7336-21103abcfbbmr319126455ad.2.1730879994195;
        Tue, 05 Nov 2024 23:59:54 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:100::2b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21105706886sm90012895ad.68.2024.11.05.23.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 23:59:53 -0800 (PST)
Message-ID: <97096021-db00-4b4c-98f7-4c4a11f2c144@gmail.com>
Date: Wed, 6 Nov 2024 15:59:48 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
 <edfaccd7-ac96-47fc-a174-912c8aaf0f5e@gmail.com>
 <o55tg4zybyfroh7on7b6pxwbkw46fgafryzlc2gczmgecxr4ph@lptxs2timypu>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <o55tg4zybyfroh7on7b6pxwbkw46fgafryzlc2gczmgecxr4ph@lptxs2timypu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/11/5 22:21, Andi Shyti wrote:
> Hy Troy,
> 
> On Mon, Nov 04, 2024 at 08:23:23PM +0800, Troy Mitchell wrote:
>> On 2024/10/31 19:43, Andi Shyti wrote:
>>> Hi Tony,
> 
> Sorry, I misread your name :-/
It doesn't matter
> 
>>> On Mon, Oct 28, 2024 at 01:32:18PM +0800, Troy Mitchell wrote:
>>>> Hi all,
>>>>
>>>> This patch implements I2C driver for the SpacemiT K1 SoC,
>>>> providing basic support for I2C read/write communication which
>>>> compatible with standard I2C bus specifications.
>>>>
>>>> In this version, the driver defaults to use fast-speed-mode and
>>>> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
>>>>
>>>> The docs of I2C can be found here, in chapter 16.1 I2C [1]
>>>>
>>>> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
>>>>
>>>> Troy Mitchell (2):
>>>>   dt-bindings: i2c: spacemit: add support for K1 SoC
>>>>   i2c: spacemit: add support for SpacemiT K1 SoC
>>>
>>> As Krzysztof has asked, please do provide the changelog, it's
>>> important to track the progress of your series.
>> I saw a compilation warning sent to me by the robot, and I've
>> fixed the warning. Should I resend V2 with the changelog
>> what I miss or send V3?
> 
> Please send a v3. When there are compilation issues, normally
> patches are less keen to be reviewed.
> 
> You can add the changelog in the Patch 0/2 to avoid editing all
> the .patch files.
Thanks! I'll send v3 after I get a response from Samuel.
> 
> Thanks,
> Andi

-- 
Troy Mitchell

