Return-Path: <linux-i2c+bounces-10153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4AAA7E291
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 16:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44000178FB3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4BD1E5B74;
	Mon,  7 Apr 2025 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ignIfY8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2D61DE2B2;
	Mon,  7 Apr 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036576; cv=none; b=Q8CNCM9ks2JDxSs+yovLMXFdHQ+S5GaKDHmbTb4uArXxODoVvou/LJFdSyfgAJ79HlFb3HYoJ0J9GABRPuYsIwUxVZAtH9/kbWJh7b1ctmvdsbg4NMsX47K87eQwNnnzRbK8RJkJJgzQMb7MHLmrPgmTkkHkVxxXYAk5GI7DWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036576; c=relaxed/simple;
	bh=XUA0zVWrHlZO+FF4p78x85Zq2L2yWcFCnii0eC5/hF8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qcPLvC7XxJ0xRuukNffuQi/Ks2OzURFACSHzOnbgBAGfTHSx69m2sSdF1QPoUg02QMKJq2VsE7x+Cu6oqCYJl30kqlmv1kA70KKy7/asYIKcosTD0zGR8jUxmxa/+Z8Z/h7MV5NGm9dhqr5A8FDddB34s8ScZIxjzMvg53mCzn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ignIfY8m; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227b828de00so42683525ad.1;
        Mon, 07 Apr 2025 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744036573; x=1744641373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JCoVDc3K2m9XDolRJ94jmRluAJx7CvSqbnmFjmwERaA=;
        b=ignIfY8miD9iRRO9vomDU8GiDOGpuzVrPo3aDPJdZB3L3DXxaNZfl261oCOAzNsz+8
         KrKLPcYyPP8pMrz1pCVD0ZXdbYz5vTw4pd+9sNCE5/4ksQxR43yFVbqMHSGipuM32wnJ
         lOuqqWybX8jqvLTABnJDgNuPAe/W7VbGKNyDQmP0z/AkZyv1N5tY4PsK/n+k1bZrV3P4
         TPv0tjJrqbgwG9fPEgDbwdk9hwMWZJ+eVxb/EH1OjNPMciTbemBIJY575HGxI3vr4VGy
         6qTbG2ksMDwPA/pU2HU2ZIeFBxsVQvDcS7pxEcR+21lukYDXDHEHJmj/9crgcP1vxeGg
         gB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744036573; x=1744641373;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCoVDc3K2m9XDolRJ94jmRluAJx7CvSqbnmFjmwERaA=;
        b=ndybVmiWu7QUahl+J12pWvqeQafEQCQdLMYLQtoAoGKYVQawUIHOAmEX6OjgqWo620
         w33RBEJM5GQ3o8a5yrIylg5jbUvGv8xPB59bxzrDfZlMI0qRQ19Tsb0z7vN3cbwb8B3M
         fGMWO0bi9sELqDRZy/JKuvL7OXDzOANhiwIuRQkFOVNX0GNWNDJyMTpwZzhGLihx+0M6
         bmpOrjZGetrR2R+SUK7DAUYX0nq1o4DAKil+wMHUcfCclDvy5HouuLHXkJ0X1UX/I3Nf
         6aiVOQvdqFSiK2ort+iL35n3Qr8unfz9hBmojyB9duXWXXi+neonBwimLsv9l7JTqJd1
         aQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCV8v1jOGDRqO2lqIRo+okQ62LzoXI3LI+Oq3W9hQqM5uCKLs28Blesp+h6L53URNqwGB5UeGX61NHXC@vger.kernel.org, AJvYcCX3L+mKzvEUsgKar0k21yQ3KTnKCI2ydTgmrsp2Xrsg1nl8Ayv5HAe0DAkLkihOoa5drD/NOMvnd6c05Ro=@vger.kernel.org, AJvYcCXE6D+6n7kb+oOsaHsbbhmIodSFhikgRIsO50bIzBVp+Wn1gzOztdrf6k5GOmZ4kEs63ns06OfHpOmm@vger.kernel.org
X-Gm-Message-State: AOJu0YzpfkqNz4Moyyykt/k1fFblgxHBvL2z3sYGiuDqkE0u0oaRPIqS
	dOMBWgluyWQBHeT2wmZCWkfd1f6UaJWX1OAhTeojcI8hovbPyhgb
X-Gm-Gg: ASbGncskp4TIbVNXodfTEjqESALdyeJpttCyTRwFES2vYHtTqn7YK2/blgQQ4/b0cre
	k60yeTz7pXBCl8jEjYYMUwAyZ453qyH6obO87rBQieQfwseoH2CrTrXQWtx33xOTR6Dkksyt0i8
	1P+IWNXqrq3C5snpGYy7fAFzobiJPdmL1mIp3yeaYJMKfMFxK9R3BzggZxa8uiwJIEtxM2GXoO3
	N2D+3MyfKkSkseoHVRtvBodFnhIMBQdUaj6ke32llaCr+zHXy4CDfGXHw5fgaHvZFonYOuvNo4o
	NStJKH2nLvgMGkCJ+wrfnmwbbHOpXWfGbiLmppwDjamyAK9AEWEwQIydkaSaDHNTOC63lUfVPrQ
	tOzfdbXTKk1MxHu1Ifw==
X-Google-Smtp-Source: AGHT+IH6zo5xaWpF7/mtxzqx1NNSKJcxMdANrUcYYb7Ay3K0hHtZkvliqWIO6H6tnx5F50lntr6Ueg==
X-Received: by 2002:a17:903:1665:b0:223:35cb:e421 with SMTP id d9443c01a7336-22a955a19e8mr135805225ad.49.1744036573372;
        Mon, 07 Apr 2025 07:36:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787778c7sm81757545ad.255.2025.04.07.07.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 07:36:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3df0bfff-413d-4ad5-a3a8-39a7bb7a90ba@roeck-us.net>
Date: Mon, 7 Apr 2025 07:36:10 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Update driver xdpe152c4.c
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Shirley.Lin@infineon.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net,
 patrick.rudolph@9elements.com, bhelgaas@google.com, ninad@linux.ibm.com,
 festevam@denx.de, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, Mills.Liu@infineon.com,
 Ashish.Yadav@infineon.com, Ian.Fang@infineon.com
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
 <Z_NteUAIeuDdDPls@shikoro>
 <69c8cf7c-b334-4f13-ba36-a2248686b419@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <69c8cf7c-b334-4f13-ba36-a2248686b419@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 07:01, Guenter Roeck wrote:
> On 4/6/25 23:15, Wolfram Sang wrote:
>>
>>> Please help to review the attached Linux Kernel patch for xdpe152xx driver.
>>
>> To shorten things, you could return -EAGAIN as an error code, then the
>> I2C core will retry the message for you. Within the configured limits
>> for the controller.
>>
> 
> The patch neglects to state the _reason_ for the change.
> 
> I'd like to know what causes the problem before applying a change like this.
> I suspect that the chip needs either a delay between accesses or a delay
> after a write. Both are supported by the PMBus core.
> 

And this is a complete no-go:

+	if (ret < 0)
+		pr_warn("PMBUS READ ERROR:%d\n", ret);

It isn't even dev_warn(), and I am not going to accept patches which will
clog the kernel log for every single error return. Just imagine how the
kernel log would look like if every driver would log errors like this.

Guenter


