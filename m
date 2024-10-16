Return-Path: <linux-i2c+bounces-7416-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F099FECD
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 04:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E6161F21891
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 02:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B98115B987;
	Wed, 16 Oct 2024 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0z6ESJj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BE1859;
	Wed, 16 Oct 2024 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729045600; cv=none; b=XjuNDc3GodT+D1G0ddCVjLNBiiPoEOqGtHL5Jpz8TiA0bc9mFKoiKkFFK+Zrsaen7NDil6x9uNfaGPCzbJjx+39UWcf5R5MiBjwrpGk78PDJNswsVlnRg84oUj3SiRun4u92PZ6JKV1bCTe9Ik8dVQhm7bTqcj6jri9Wwj81NGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729045600; c=relaxed/simple;
	bh=ZPLcrgkpA3DOluLYRzuvfvWdMH3+rXQ5FoHycyywNa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=h2WHnwB8E7tNhSy7aFQCQnImHmFCrV7sZ2TjgvjpYJXx421mzVB+l+sfrt1KGcc/4jch7Yrsp+adEleyTb/rYRXBTVtx9/cg1/nS+1HDlaomREfTyV9+0wRRCgNIla1WeWBa2WOcnwAuIc9pigTIfWgUWG1U/4cm8FhBmJ9uzTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0z6ESJj; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4311420b63fso45876995e9.2;
        Tue, 15 Oct 2024 19:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729045596; x=1729650396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSxi1jizS1Wxc9UqPR+m8hcJCSAhRZESwhZTU5hM5qc=;
        b=F0z6ESJjWzmkFBDtH3AOKGaFbwWpa6d+enf+h+rJgYZxk5w6LjTBFO8+yz2CNZsttn
         OKmUSfY/VUhMnc3ElTCQLqq74SRcvETfqOAVdBBQvzAA1wJgSfEtILc8apxms4taHnKv
         +T7+/SpmK2B9a8aG5uN2UibC+ePy3Lw/K5Pv8dNKhyeQoBmmteFdO5mDmTnmaAgjzGkq
         oe9ia01J0Cg0FpVFasTKJyD/S1TwOmLY5bfF8ptadIWAODh0ag+0mOBcUfgyrtvYPUCp
         672MbI4qo6LaM7Uib5Zj9XM3xm+ohOuwUJGuZ0hmrJCWxaIc+mcSTM4+MRKmwjBU0aL9
         mKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729045596; x=1729650396;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSxi1jizS1Wxc9UqPR+m8hcJCSAhRZESwhZTU5hM5qc=;
        b=gazFp7LnycET8xC1A5aO8jqo/vSN0zMbvI0N1ERw4AOuNJM+e12hfq7lIOko2P+drj
         KBFGldoMLY1Ghjq+YnKRWZisVK2FTlFu27VDOwkSIrNgsdtnDNYMaH25ghlwjgGtBm91
         sDik0t9ncg8o7ayxTOckrqMme4jWJaECYjxEg2NwSGxnLGLzJNM625lxRWrq5YYz/cOP
         Ty+Xb65OcsQdg9npFxVRbDSqL2rBi7c/Xjl3jHVUbac5H0PW6AD3XT/va6wIWUgG+kXu
         v6JTRU/4tFTeuKP4pnmreFHRwWfr6iypwcu0H+DtRZIc8syTJ1WV8dzHatv3GP4Gi/I/
         Adtg==
X-Forwarded-Encrypted: i=1; AJvYcCV4dWOHg3CBMb8kthtdw3cctYLPI1zrUwfsc/OFvE+GoDCJtgy5wM4AJZK7RPyII+3WpmAuk9OezhQC@vger.kernel.org, AJvYcCV6wtMEOV4PvXnK8Us4YP4JSVVDE0HJdTOkr7cuxId21Ky2QO0CzVafs8HDBIiyrjTah1LCEWWAZ/k4@vger.kernel.org, AJvYcCXTgjinAq4OPaIwJ24BtKOswr3YZV2tGrgXTB9hT5fhwLN10niIyh4bPOuXx/CAHfiUW9z8FhK2oYPfvIdU@vger.kernel.org
X-Gm-Message-State: AOJu0YwuYqn2OX1bzC4oW9M/YvoR59ohF2yviCmvz6eVEhJs+UUlzBaJ
	brhmRjVntpPzvIQDgemTY6MNnLUFILbJwugSS9Xpxxjw7xfYoBiRtPQ5ZZOtgZWjuw==
X-Google-Smtp-Source: AGHT+IG5LlEae23Kuhx11vVm5Eh+uJbiVwS7UM9JBBcCaLE7bfJm0VfpTpVXYo+3+W9ajJxcUUPKLg==
X-Received: by 2002:a5d:4d8c:0:b0:374:bd48:fae9 with SMTP id ffacd0b85a97d-37d5ff2a6fbmr9708805f8f.20.1729045596271;
        Tue, 15 Oct 2024 19:26:36 -0700 (PDT)
Received: from [127.0.0.1] ([94.131.108.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f55defbsm34640475e9.7.2024.10.15.19.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 19:26:35 -0700 (PDT)
Message-ID: <6015d35d-6d91-4ac1-8ebf-4f79b304370f@gmail.com>
Date: Wed, 16 Oct 2024 10:26:29 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-3-TroyMitchell988@gmail.com>
 <Zw4zPOXSJIWEMd2Y@shikoro>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
In-Reply-To: <Zw4zPOXSJIWEMd2Y@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024/10/15 17:17, Wolfram Sang wrote:
> 
>> +/* spacemit i2c registers */
>> +#define ICR          0x0		/* Control Register */
>> +#define ISR          0x4		/* Status Register */
>> +#define ISAR         0x8		/* Slave Address Register */
>> +#define IDBR         0xc		/* Data Buffer Register */
>> +#define ILCR         0x10		/* Load Count Register */
>> +#define IWCR         0x14		/* Wait Count Register */
>> +#define IRST_CYC     0x18		/* Bus reset cycle counter */
>> +#define IBMR         0x1c		/* Bus monitor register */
> 
> These registers look a lot like the ones for i2c-pxa. Can the pxa driver
> maybe be re-used for your I2C core?
> 
Only a small number of bit definitions in the registers are the same [1].
Even if the logic is roughly the same. it still takes a lot of work,
and i2c-pxa cannot easily add the fifo and dma functions that k1 has.
Just my opinion, I don't think it's worth it.
of course, if you think that multiplexing i2c-pxa is a better decision.
I'd be happy to adopt it

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part2065 [1]

