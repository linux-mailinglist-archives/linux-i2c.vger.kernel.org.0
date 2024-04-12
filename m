Return-Path: <linux-i2c+bounces-2916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCA8A2CCC
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 12:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9FB31F222F9
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 10:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6FAB3FE3D;
	Fri, 12 Apr 2024 10:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bnb+ODYq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280103CF79
	for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918917; cv=none; b=mwE4EMKBQVtF2XxLuZny/XlkX45+BfZGYsrDmzVYM6KBCnbO7kTFE2v326ULXAsySeenBPyO0hVAxH/ep62txTkabOYcLds5LnF5MkHdELtrpA4lD3gGVR4Z4eT7OF4m+VkoDDcIiM0RB9ZEubEUQqYUMzmh/fcXFsC13zlVRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918917; c=relaxed/simple;
	bh=9BWuqc2Un7wm7PZgo2D7sAxES3abOooEKxBrST993LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=R990FHS3wcVlW3uRRS016i8CxI7SBGeSVABMk7NmtcWauN7X4juALeCng6DcpKEsUYHvGRij32MlV1UbCspKYuxVww4ubdmLDJDzaTi6PpwVzafooKdjJ1ZipVCTACBaN1/AI3NhuW1Ph1BU1BQJo4ystQk4c5UkeyxZZaPAfFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bnb+ODYq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a523625409aso67202066b.0
        for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712918914; x=1713523714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T4Va4jM/iKN/PJf2H2ukm6LRnl7W8YR6UPrhneOL0Ok=;
        b=Bnb+ODYqok2aUSkjc9VtoVeVqSgG0eGsW7OiUEO1TisgffpUhDiZn+hujV9IfZsGrf
         v7oiLG38K9j7l58FO2+N6j7UF4a6+qVMNdCLCMHJ2K6N0HDe0mu6IZavip1TtqQs6Tts
         RuvsNlO6YQkDaCHElYxlPFRHUW4U4GphHIFZKvLJDZT++gG+X4PDDQX1JR+RP7VaX5Fh
         pHTvxFx1a+GuhDM1/yJYB9SwWE6IYVZWM8jSY0dTP2N/nNzb7hU3Y7hhKPv16NhKccQS
         eIRhCWLiLbeFoCGOke9VrHvkDmdUqni0rA06VIOO0+dDKaaUcvMUB4DSDf0biyeeJRZ6
         8gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712918914; x=1713523714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4Va4jM/iKN/PJf2H2ukm6LRnl7W8YR6UPrhneOL0Ok=;
        b=WJDse07XNnYUOvVJByj4qW2+LeJr82s8Gh8//I/8eH7jcY2xXNk5brmGUDEIhFElR0
         WpXVMBuwBYirO3W0gQ+Wvg7fdgPiF1OYhJzuRHiGWbPfRjPlE664ZnhXVWNvWsVUplVl
         NMAlBsE+vk2UPzfxRsV2g8BgrllVQC+A142IcNrony7GotRiigyPLcF4lxzQ27hGA/El
         HSybK6PmWATquPCvP9WM/lE2iibhqbzErUzcjnbvAOGTpfAo5pjpgWLr/Auq3rhVaZ7B
         jFnXXshkq5QCfNWCUXJ6Z+sOHKKo6P1rD4cBA/npLeQ1l+/exGsgOPd1llYvUn4oTjl6
         9lbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOvE0G/KCWidLiZbJVHPArfqLUJn5/SnXi53o40Qf9wv8wLlE4q1aaCukOIO/PxbVxBsV4sEjWYPCiNKE/5HSPGBlUqnhY6XQC
X-Gm-Message-State: AOJu0YyYl4UgoBMD8jbS7nIubsIZEjQhON9sm5lJqphE+6YM1svwQ3Vx
	yglDJxqjIpcTS4VIas1Pice/oL+hSeKtb4gi82UgPUYOwgt96U5A
X-Google-Smtp-Source: AGHT+IFP0jX94ax5Vm7c1Wav8r84jaggCBYnhoho4WwntNBKSoxg4fQW5sKbxXY8GyOF1e7SQBr5EA==
X-Received: by 2002:a17:906:719a:b0:a52:39e8:5e5c with SMTP id h26-20020a170906719a00b00a5239e85e5cmr648273ejk.65.1712918914313;
        Fri, 12 Apr 2024 03:48:34 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7a91:3c00:7438:ddfe:2573:311f? (dynamic-2a01-0c22-7a91-3c00-7438-ddfe-2573-311f.c22.pool.telefonica.de. [2a01:c22:7a91:3c00:7438:ddfe:2573:311f])
        by smtp.googlemail.com with ESMTPSA id a19-20020a1709062b1300b00a52321ae5bfsm721517ejg.21.2024.04.12.03.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 03:48:33 -0700 (PDT)
Message-ID: <84b674d4-b80d-4bc8-85db-389e94747af0@gmail.com>
Date: Fri, 12 Apr 2024 12:48:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Annotate apanel_addr as __ro_after_init
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>
 <egljtjmzcn25yqu4mkqahi2vcav6pd5vietiextxtocsjntcie@siyyjnjy43lc>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <egljtjmzcn25yqu4mkqahi2vcav6pd5vietiextxtocsjntcie@siyyjnjy43lc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.04.2024 12:30, Wolfram Sang wrote:
>>  #if defined CONFIG_X86 && defined CONFIG_DMI
> 
> Shouldn't that be on top of "[PATCH v2] i2c: i801: Fix missing Kconfig
> dependency" which Andi already merged?
> 
No, this is a different code part here. The other one was
protected with:
#if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI


