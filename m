Return-Path: <linux-i2c+bounces-7469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6599A3418
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 07:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 286341F2428A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 05:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F414F176AC8;
	Fri, 18 Oct 2024 05:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7gHx+DS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F33BB24;
	Fri, 18 Oct 2024 05:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729228656; cv=none; b=E9L5UiEnG9jp/1fkaVWl7JjY9ZP6Wn8iFnQUzVn6kwjKvHGtgwLom+cLLQ1ribzc2v1aeIOaLiU8QL3J3LBp2E39+Y3N+ozVFbIf4OpoHH72sJo5iBW2zI3y7XvN5b5vWvh54qrInXBKY+aYxXc/0c48eAiZkenpCKbTMppKkBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729228656; c=relaxed/simple;
	bh=0ZIV5ukQjY30pNaNo7kW7TW8B5X2VOAy6DL6Pc6wwM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpDTQ3AA2VIWhxIWWklHa2BKQtl6UpSIo3iOTDT4Iet70wajOUrD6IHUeWZNvFB4hl8Z6k1f5bC8YbqZWm8TuPQF8isziwV+xOF5Ze39h3Cz4fScU5xK0x3xwVU7fCqD/5xFZQZyqFNjHYemByBpoglWmY2Xx5I57X0LGCKQHqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7gHx+DS; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-431481433bdso17085115e9.3;
        Thu, 17 Oct 2024 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729228654; x=1729833454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LHREBNBNkmxhQ4JEcUk4PRuNqtZtmOAk0KjHkTVt/ao=;
        b=Q7gHx+DSwnkPyysKn99NZ/baKIF4U3bexzKkysGrILNa5ewvc/c65lGm3dPxOmM4bo
         tDtz7i8wOvKo7a4NTJRBktFN7h13G2XSHISbj66P5y9V5AXPFxNvLoVi1CB9jtixz2Qa
         gKr/Z8yux1B9hIFoWtJOWpTw16baXYb4Cz8kCpUxvl47VM4tmCWlL2eP046nJODdE49j
         wKsF+avluwgV4qpOrm2lBpXsejE0AVnXudCKDmE9090yrXLZRlt6J7Qj2O8Krmq6gAaX
         7EPYlugK89peStoLxYFBOYxEkcJ6aZS2jxjFOx6jzEsvfJ+RgnHWCu/3snpLHnZ1IZiE
         tGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729228654; x=1729833454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHREBNBNkmxhQ4JEcUk4PRuNqtZtmOAk0KjHkTVt/ao=;
        b=jigiYAW2HRGqyOrke+pSMmtXaKI6kx3f7JMzY/CWZdpv08tA9bcdBJGhMDxcpQp1DF
         Dk4vTwsWyOIPicOIlm8ERg7ODDC2GM8lBlVFXmwEO/OyWOm9Lv9wDuKis2po3Rs74MAE
         A5mA+szoYyZ5qdR2GC+d/SdZxHd1A5W2rMM7WMcEFYsINJm0dJMtsEhzngiJ+lbo4pEn
         0okTP3oATV/RWzop55SobtgoL/FZKtp3cQnoCa9GXdWUcW771lUn0cOKPxrmkDxniPMu
         92sWzdbMxA8WQ5gnBmpw9LH26ReeWqvjCKR4fgdT9TBhmL7QYqW4rVrZuxLiWLZEErJa
         sbHw==
X-Forwarded-Encrypted: i=1; AJvYcCWHU41l/CJEtWkhSDtFP1fSXoaz4jnLFAxgXjIbH/J34OVDeNciuxwMNBKA8azhrc/tGKRlhwlEY37Pqa5L@vger.kernel.org, AJvYcCWk3mv50B4gxghXffYP7WRC+OyQIlQD6fF/4Jz1MVbu9eCA7QiK5VypSBhmiK1lmIIGMDSvJvPd7JsU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxma+hN1QINiC9kZuK4jxuqE92CBHAEnAdQ6bNPG2WqfSza/TAl
	N1NSUFX3cMnjpZdosovWoHEJuyONt/+DUbv/tXaURmZ5KotGp+zg
X-Google-Smtp-Source: AGHT+IG7s8U0f9tFkkXvfr0+7AmebmQTQZpzng7cnmh8G56lS3RDeORnjaN1eRnoG0PtrdqwJxvyPg==
X-Received: by 2002:a05:600c:3b9b:b0:431:5aea:969 with SMTP id 5b1f17b1804b1-43161627fdemr7240165e9.8.1729228653324;
        Thu, 17 Oct 2024 22:17:33 -0700 (PDT)
Received: from [127.0.0.1] ([94.131.108.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160dbe80bsm13166195e9.5.2024.10.17.22.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 22:17:32 -0700 (PDT)
Message-ID: <193b9781-8782-42f6-8a43-2f17ca5a28e1@gmail.com>
Date: Fri, 18 Oct 2024 13:17:25 +0800
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
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <eb4112aa-21d0-4537-a18c-940d8832711a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/10/15 16:08, Krzysztof Kozlowski wrote:
>> +	disable_irq(i2c->irq);
> Why?

I just want to turn on the interrupt when the transmission starts,
and turn off the interrupt after the transmission ends.
The interrupt shutdown in the probe is a starting point
before the transmission starts.

Is this reasonable? If not, I will modify it.

