Return-Path: <linux-i2c+bounces-2791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BBE89A4CD
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 21:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8126FB2110F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 19:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E40F172BB7;
	Fri,  5 Apr 2024 19:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMsddfXk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54017279E
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 19:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712344901; cv=none; b=CWJXgzD2KOp0xPIgOSbtVnxXW7Bb5iLoCcYCCW2Dv46iaigySfQNkG6yCnXfXamdyecdtCCn9HGuGjcE00DxqhUgiKtlBCV5JpFW04a4D2LaKAA5I2os735ihR2ObVOJ9ICyVNT5Xlr4CtBtCEajd5JKKzTA6lJHkcVNjbK/JsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712344901; c=relaxed/simple;
	bh=065Kz3j1z/Uk9NYVqQ+gAFSi+A7sc6L6QLPoL8cHCb8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=AH+jPv80p4wwtH/9z9MpX4TcNE8aPyreC4kL42+kNa6r+J95aCEegOM5C4/hXDO4b9rxEVvwKFRZ0jQ+Req/sYbaLuaCRA2+haBLp9W7gx1m5kGd05/4R6qiva9VglvlsFjq/ZGnHyrVpzaH4qPIp65zjZREguJYd0k5tvcEV4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMsddfXk; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56e136cbcecso3395689a12.3
        for <linux-i2c@vger.kernel.org>; Fri, 05 Apr 2024 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712344898; x=1712949698; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3k7uMA0qUXHG0vLmk3nU4uO+OynQmj58ZvaWadIlHkE=;
        b=OMsddfXk03EzTxnrhS9JVNQWj5/p0XIXVw2zWK6CG251IFjZwjJRMgDK7G0i71E+gV
         E1RZ4+UlNA6pTH50OcfTnWFZuIbAtTJeXrCoQHClfiS0U8RJMKt4V/YK/Zybq7G+xa/h
         7yuxGzUTN8x+dYIest79RpjMKVkjMMC0H6UqzIYhQWYd90zsNs5e6bim6J8VrqU7DAeH
         BrfAXAAxMyf6pJ1jlEcKU9Pha/Nke9fThdrdh9IefzoTHvNyMH8AC8FNqjL4jUXvHxQb
         ALo5BSqaWs3ogG/QxRhEd8TrnpD1SWdrGz6gGi8vCm+E9tWIWh5QjEXfevcSkzbYnmIa
         GXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712344898; x=1712949698;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3k7uMA0qUXHG0vLmk3nU4uO+OynQmj58ZvaWadIlHkE=;
        b=YFUvTKZujJFbxdx5Xx6l3OeJLapWJ3NtjSV/N/5tcK9nL3NzHhpU4GXnMSwVdESvS8
         cLAXIPNkDENsH3b96+Kxp0MbU2kEKtTH00XWR7Hqh3JJyMUud20Vql5/wTLySterT12Z
         /XQ0fGqqzoSQrHvM6bps5++wbzJcu7d3oBgQ2D8z/VeCx4jL7KiI+aC/dV9OO8jyzNwX
         nZ1awgKkI6ujapS7DTmDxuHzHztnVNDTEMZeoS4dAD5wTaTeibkJdSPSTWoxv6QVu5Uh
         Ax1Qt7iw62c3EUphENbtItAb2eB5/tS9dr/m6b1ncJnKyj7uHjtwm1DEHiz1hEKD3VVd
         DOXw==
X-Forwarded-Encrypted: i=1; AJvYcCU6O2N10rAEyoYZdzOiGdzsqanbV3KYFZiTrGQ7m5WrFI3NNSOJGXNM0xBCTBW82SvEn4ePjr82ccK77FCZr99E7+5L1Y2daezr
X-Gm-Message-State: AOJu0Yx3PQobBh/Fuvje8I2RBeRpgQs8+fgIjUoYJDowUpgVn+6uZWAv
	v5l4T4PHYNaFta144bQPcOoIxQJg8rkJHquZMh8XaGiH/AduPY4r
X-Google-Smtp-Source: AGHT+IFEyCtKLfuUEY6bWcOaHqnCT9uMP8Vw3zEUcAW07cZg/+Ywx53jZwyFOYDG4Vz2/mvMjSReWA==
X-Received: by 2002:a50:ab55:0:b0:56e:22bd:7e90 with SMTP id t21-20020a50ab55000000b0056e22bd7e90mr1328706edc.40.1712344897335;
        Fri, 05 Apr 2024 12:21:37 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79? (dynamic-2a01-0c22-72bb-b200-e0e0-cd27-7a04-5c79.c22.pool.telefonica.de. [2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79])
        by smtp.googlemail.com with ESMTPSA id y19-20020aa7d513000000b0056e134d5966sm1111705edq.44.2024.04.05.12.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 12:21:36 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------05AK4tPUKbXCJwuTQdTIwwVe"
Message-ID: <01f34fa6-b19f-47aa-b4f9-3859e77af3ea@gmail.com>
Date: Fri, 5 Apr 2024 21:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
 <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
 <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
 <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>
 <ef403546-f696-4adb-a441-1d8c71712704@gmail.com>
 <Zf2vVsiW2KCEQU-U@smile.fi.intel.com>
 <2cc45e8e-558d-4e7b-a370-1187bac939fa@gmail.com>
 <ZgxuubE3MZbZDlOj@smile.fi.intel.com> <ZhAgSSWHxQKesX0o@smile.fi.intel.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZhAgSSWHxQKesX0o@smile.fi.intel.com>

This is a multi-part message in MIME format.
--------------05AK4tPUKbXCJwuTQdTIwwVe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 18:01, Andy Shevchenko wrote:
> On Tue, Apr 02, 2024 at 11:46:49PM +0300, Andy Shevchenko wrote:
>> On Fri, Mar 22, 2024 at 08:28:08PM +0100, Heiner Kallweit wrote:
> 
> ...
> 
>> Okay, from these and DSDT I see no active device using GPIO from DSDT.
>> So, the behaviour you have is definitely is a BIOS bug.
>>
>> Let me and maybe others think if we can to work this around in the kernel
>> and if so, how.
> 
> Can you share output of `dmidecode`?
> 
is attached

--------------05AK4tPUKbXCJwuTQdTIwwVe
Content-Type: application/octet-stream; name="dmidecode.txt.xz"
Content-Disposition: attachment; filename="dmidecode.txt.xz"
Content-Transfer-Encoding: base64

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

--------------05AK4tPUKbXCJwuTQdTIwwVe--

