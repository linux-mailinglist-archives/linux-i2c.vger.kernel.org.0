Return-Path: <linux-i2c+bounces-7769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A99BC263
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 02:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D768B1F22847
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 01:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB36D1CF8B;
	Tue,  5 Nov 2024 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG0Wh4ag"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF4A1862A;
	Tue,  5 Nov 2024 01:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730769302; cv=none; b=c19e2fYzLldm2qGHr+QB2PpHvXqDkJyDm3FApQydF7+aL1g2veyWj2ZCZ6r5sqh0eTb+/R31c79eVp77luHBg+fVlIkEE/ELuWSUJpwD71w5K0f19+E/FYW+TciP1E/4ke/PTUUTP95v7mw4J20K8xtZQK4b7m/3YDUyB7xwMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730769302; c=relaxed/simple;
	bh=55po1Ly185ptJHFwAG7rk+MNxrM1YSdwN105ijD9dKg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MozENl3VuhZAXRmVrSxKdNcfSsjjYM8uYRmx1nwm6xTQNtKQ6klSHx9VPWT6jdsgNq/JWg/P91LLB2oBN6KPbMgNP+8fVUqBSPbVXiKQ3aNWdlmLQrtxfHeCNXLC6hEg2BYTZLPl4SJYOs1gWdITZ6qonCL7AzqWmhOzgKFRXLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG0Wh4ag; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-20c805a0753so45341975ad.0;
        Mon, 04 Nov 2024 17:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730769300; x=1731374100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmSZDJ+VfbjL+FInE4jqatZi0P6NlfcMiliJP8Vq75k=;
        b=XG0Wh4agfdzbTo61wpM3rUsvFH3uK912k2ESQLxsi86aU57qhnTvvo13qQx6pePX9Z
         XEvfuOyGdtWYBn91sEc2/iSdCbifYGKy3LBrOSLrZU64PMObxlHJxJZMNJPKCTJbIvNd
         f5cFVrTLZFzDR1njH5iVphe/BcNiMUlMcm5aJ9Iia5/crDNABGcxg9jhq0UiYJ1olRGl
         mOTBKM1L+dTDSezO0iuzhnaoLAiGAJbwSYohyYYOxkWCS8pxFPiHoIBIMJE9JzFSOgBb
         HQ1z1f5k5yqu/PsN1FACGbkZYDaTEqvHFoo6ugMdYn/ksv/kyAqk4UNbC7EZt2whkyPd
         5Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730769300; x=1731374100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmSZDJ+VfbjL+FInE4jqatZi0P6NlfcMiliJP8Vq75k=;
        b=FfWOE8WjnM4QHgMJrrG2+0yJmYIJdzUxfl6+Sf5+UmZ8WDdU4CEsr4HrgN6tkpf0XH
         iQ8UDwYMKfa/gVhUbVw8EgCcIkT0aEfpNFZRi+v9oJnX+Ynk1LGo8UkxCrHGCncZVWqW
         OMFpa08RZJU8mhpjn3iI2DWF2laNeFiBWOwa6XB37AApqP1eCzePPeiIYFKysMvNuTNA
         G7cUvG6ufVAdNMCpc6RPIf7E/7rmWr+wps8lv2/ftw3LAjM+WjX2w1BmQaZXcWSjkXic
         jjKdeXcUtFGWgB/rwm2H2OFDkRNyFTErVjqOFWkDXeKOoyQWTD4/I/P1RujoCRN4zy+X
         HLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCXGoOp7R7/dyN6BgXNgxOFvF0Yv0vCvGIo742kwOjMH7eDb7SlVL7mXjo2B2/6b9wNE/Pcx+BHhCI@vger.kernel.org, AJvYcCWORlXVSj1WO9/+PxLQFjvO6QBsjvW3j71lSJ6BgBYkx1aKpGSAwRcoUiY8LtGVnL9H8iPvBcguTfuU@vger.kernel.org, AJvYcCWr0H1bFIJagVMsTQfK5XY8q1dXt1D7CYKr+gkKnjS9IuoJDyPUucaBI/WejdMrZ1tZXvlnwC6YxIXmioYN@vger.kernel.org
X-Gm-Message-State: AOJu0YxJKN97SORFcUv0t1OIv8VLgoht/xYarBBnQZbPX2g2eYftnVwZ
	boBeyleeJrUkcY+KI+dpL1UdBmPYR4K/kGTRR4bOinONN7pNDZjF
X-Google-Smtp-Source: AGHT+IFPlCW/2yJN4y81zz/dY+QI1q450fTiiDbolhkdNOOfXKhGNXtiKw133Yda+TQppPatOPznFA==
X-Received: by 2002:a17:903:1108:b0:20c:e262:2580 with SMTP id d9443c01a7336-210c6c3ffb6mr408256265ad.44.1730769300267;
        Mon, 04 Nov 2024 17:15:00 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a2c23sm67083465ad.143.2024.11.04.17.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 17:14:59 -0800 (PST)
Message-ID: <a08384bf-6747-4975-b025-f8fd3685fc30@gmail.com>
Date: Tue, 5 Nov 2024 09:14:51 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
 <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
 <6cce463e-25cc-4a07-971f-6260347cb581@gmail.com>
 <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <502b0b14-0e1f-4a59-85ad-7edeb9d3033d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/11/4 22:48, Krzysztof Kozlowski wrote:
> On 04/11/2024 14:01, Troy Mitchell wrote:
>>
>> On 2024/10/31 16:00, Krzysztof Kozlowski wrote:
>>> On Tue, Oct 29, 2024 at 04:36:00PM +0800, Troy Mitchell wrote:
>>>> On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
>>>>> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>>>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>>>> and supports FIFO transmission.
>>>>>>
>>>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>>>> ---
>> Change in v2:
>>  - Change the maxItems of reg from 1 to 2 in properties
> 
> Why?
I need the address and size. In v1, I wrote it as 1, and I got the make
dt_binding_check error.
> 
>>  - Change 'i2c' to 'I2C' in the commit message.
>>  - Drop fifo-disable property
>>  - Drop alias in dts example
>>  - Move `unevaluatedProperties` after `required:` block
> 
> Rest look ok.
> 
> Best regards,
> Krzysztof
> 

-- 
Troy Mitchell

