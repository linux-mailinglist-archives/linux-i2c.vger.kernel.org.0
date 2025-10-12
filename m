Return-Path: <linux-i2c+bounces-13456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D006BD0C85
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Oct 2025 23:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6C2E1897263
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Oct 2025 21:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D2A2248AF;
	Sun, 12 Oct 2025 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx6a30N6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A72022A4F1
	for <linux-i2c@vger.kernel.org>; Sun, 12 Oct 2025 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760303115; cv=none; b=KFx9y0CzWPbZp2/LpeTpxRpOyYH5POC3AUlpf5r7MzBQE3ie1TO0cNs7GaIPUvFlUjGuPWHVW5C1RI6cf1uLKjCXBd8eCFSRuVt+6JlIJPN9/F+/RM++ok/zdT3OGlZr1hklx9jJfv+POmfx97Vk3PHeRaFPB/yrMP9x171mN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760303115; c=relaxed/simple;
	bh=p+4rBTXVQyMrPvL4cx1EdD0lfCbti3H34V3PNwY4ubg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zl5aTHVdzKLswdghG4LNNTnFWFW3JZDog/d+cANNNrs8dJYMvtCJIB7itYVnHt1EJod+8rz+kNa4samS82GKtlD7wKWE8+bpsF6hYScBWvOzJmXGrrf8fkFqUsRQplGjA4Bj6zVmFKdVnhPysltFtwapbhhdDVBCB0FU/3bD5r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx6a30N6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso3034297f8f.3
        for <linux-i2c@vger.kernel.org>; Sun, 12 Oct 2025 14:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760303112; x=1760907912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y607lL7w8CvU9EVcPgw/dysyVLw5yY3mBOkdMO0V7BE=;
        b=Gx6a30N6r7L/mqrSb+iHo+48421vzySMXkszehGnIfcaB5J5umNotmrrqsTOp1qKsJ
         hR8qnap/zesiGCWaNh4B28ds4J3Jql/scg6t0rnFF4cFy2uhJkwzW2dhMcHh9IEt6GaH
         uRKGmove/IJ4ZL5K34oO36oUAxoURNP5HuCfFuQKHib+Tti9LNauF8L9JzqcNcCTK6T9
         aQzfg0SYSrFCSN36jJLi+bS6qUza/nJe1dccrdrryiDbY0/GbV+8qj7U+v/akBdG1kRS
         co3U5DFRvyRiGbpo8QgPgj3vJAw2A3L5WsVGjHkdKo7EeOpWjTglILP9/HdCVzAtpyrz
         zDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760303112; x=1760907912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y607lL7w8CvU9EVcPgw/dysyVLw5yY3mBOkdMO0V7BE=;
        b=WK7N8/t5A4zw1HOI7/CWBNMFSAuvI9mC2iQcFk2IZdyqk/peuTtiMsYQDLlww/ra0r
         ymtqGSDV40UGbrfT6O5ylR0RWdK2vpxbTQtnRIiYRwaEh210AbJ2tCW2GTXNap5rISRy
         QrxHF1m3O0IFNdvj/Kr0Fr9adiCkUJ+aF4l5duasszrJeC16fYRi41FsqEfHsCVvPQ6Y
         4VAiu2sX+8eD/D0DLoSWGcwrcJpcAk3BVciBp5pazWuwYGHigxT1ZKxRR8bFpYPSE5uy
         XcyfLNE/I7zaCQDUztVyi+gK1M2CVPQ8TG3DuHJh05tnqbYTEj7RxIbeUBMxjNLeSjVo
         bEfQ==
X-Gm-Message-State: AOJu0YyAw5gtv1RimV5jPR7JrdIWgsaZXFk5aHvHgEy3zC/pTW+RE3hl
	thQ/HVPVKMv1XEhgqY/UD6rVIBbHotfUZFjz80LCrQ54HEfm1/hTDeX6
X-Gm-Gg: ASbGnctm+A7SlzI95dqj3LjTBe6izpP1Gl4fgSosvkrmj7VuWo4lzMxjxjEoziD/UdF
	+kze0TQn+tBTO6MzOD1BXRwEHP0GIp5haO5IOnAH9aHg67z8So7PbjEv+hxNOFS+h1LSUmUpRdo
	8rM2VfqPT9MIw4Xec+ZyU01+NKSKuZFErsoRg/9SxGnMduHdcPFYi26sjgdfiU8+c7DfgabyVRZ
	2RW18XYnMxg3AS+u2nHyponNKs17j9opvdbgj1UI1S8hgMeNJ5kQKz3CktwkPLrWYY1pJhHIKwQ
	8mGFHpCZG5tpP7ocQP6HplTC/hqErt4Sg9e4rj2KkB+6YgAq2tsnQq2kCW+mwCdMM3L+xuOstTD
	XYJeotvUX+g026exyj/zXKLY9k70Iiw5yscmAWteYLImKxB2jNXySILbL8OUxM10LRBK2d+J4Ip
	ZS9pvsF3ufzeyXMXJm1sCPT0uCEK9uNuAZBkIqweYfK1+uBPU5brEripyn+6mSzeFzP8AzJ5VtR
	WeuZC/WTwfkoJv5MM8=
X-Google-Smtp-Source: AGHT+IH845vTHD6hzjSq+rpplsz8A6uX3U5UZyR9/C8hjNLB39+XRvqKaDPmeWmM9GKivk1LLLAc2g==
X-Received: by 2002:a5d:588b:0:b0:3ee:1368:a8e9 with SMTP id ffacd0b85a97d-4266e7befe4mr12329928f8f.17.1760303111544;
        Sun, 12 Oct 2025 14:05:11 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f04:5200:9878:fefc:dd7a:1ff4? (p200300ea8f0452009878fefcdd7a1ff4.dip0.t-ipconnect.de. [2003:ea:8f04:5200:9878:fefc:dd7a:1ff4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb484c71csm156492655e9.8.2025.10.12.14.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 14:05:10 -0700 (PDT)
Message-ID: <f62b6230-520c-40f8-a593-a5e2a0537ea6@gmail.com>
Date: Sun, 12 Oct 2025 23:05:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
 <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2025 9:50 PM, Konrad Dybcio wrote:
> On 9/14/25 10:24 PM, Heiner Kallweit wrote:
>> Annotate two places in boardinfo code:
>> - __i2c_first_dynamic_bus_num is set in init phase. Annotate it as
>>   __ro_after_init to prevent later changes.
>> - i2c_register_board_info() is used in init phase only, so annotate it
>>   as __init, allowing to free the memory after init phase.
>>   This is safe, see comment: "done in board-specific init code near
>>   arch_initcall() time"
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
> 
> Hi, this seems to break booting on Qualcomm X1E80100 Surface Laptop 7
> (arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi)
> 
What means "seems to break"? Is it or not? Did you bisect?
Where exactly does the boot break/stop?
Can you provide a full dmesg log for success and error case on this device?


> gcc-14.2 and clang-20.x
> 
> Funnily enough when I build this (albeit on another computer, but also
> with clang-20.x) and boot another X1E80100-based device (x1-crd.dtsi
> in the same DT dir), it boots up fine
> 
> Konrad


