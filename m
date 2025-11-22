Return-Path: <linux-i2c+bounces-14234-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A076C7D20F
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 15:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7DC4834A26D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 14:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F64E25F988;
	Sat, 22 Nov 2025 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g49oc6cP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10A26B74A
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763819998; cv=none; b=bQSfGRK9QHhUktM9fg50L/3CCTtlhHbSqiw1msjVftlJRUhjGCyD8HskkIVHM8wKSUCgB2ZO5Yfzny16Bp8HXI7ceWYJdZ9DAL2+fPW8mROSXOE0NaqDaWxMbQk2xmd3xv6SwnIMtloSFanI2Mf2mf9xkzF2DJSgwMdJAhM0d6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763819998; c=relaxed/simple;
	bh=vKCXMz04DeLJnwEKF8S98dT02xv8eOJK0ArCHIYcYFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObTLZfi9wqXGl731rtJy7+Dm2PVSg1CWFWUj6Wt04r2Zk9Gcye9x57yVti8jAvm5RxUQsp5pyHUbxmQPSH5omXDsu73W4zsODZHQcDD/CbTQaSntTFIkxI09ajg3usHQZjxUd10E+Y+1NThZJUyCXiV+Zk1N2mt23+1Cqq3ruHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g49oc6cP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso27669995e9.3
        for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763819994; x=1764424794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3RDHdAOWTPHz680YM/cr1HvFmiWY++575d9xo1fZrs=;
        b=g49oc6cPE/+QHtjyh2nlPblChS/L0kRZ4Wau5nCW/OxFr+t77EuANv/5GnKoVA2RnZ
         U3t4K8+wCfKsh7UY8h1tuEkK3py4pCoOZSGnFRf3f9mRN4EtAsUu7nyxzG0LInuEvj0p
         DjUNi319sATk3buxrvArAJEM0UfSRWaEjIhQbhNVrtSSmdj3DcPkHtuvn8s3ht/h6MSe
         gSXjVFfajx/PSnBhBzXfrESS9pq34IA4aLdUTXdMY6ZotVmPmpzEgw1T+BfnPssvCU9C
         owikGzCqaYW7M3NmrWTqtRiZ1sxF3U2HI4UsVXwCOxRcXTd0P5M3CFRptAHnRp8NzTXx
         6MAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763819994; x=1764424794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3RDHdAOWTPHz680YM/cr1HvFmiWY++575d9xo1fZrs=;
        b=KC1IS5kOx0ztaaZojFY7htfaJZ8sOg64giLLZdJHMMtueX/UqK/yNGu9KztPgAMAIm
         bfW/84rewyEyAaj8O0WKGKfMUynmlmzPlC8igtLLlrc01qKf3G2hpwGUomY58VhjlIuT
         pEJVBuOFYw2RC0lpf7MlT7Z5xBaSPGmxpO1u1c/dwOeXqnP7+PpwLjYh1vFHcY5BXe47
         w2EcgKfek7dU5iMlZUKGBg8eycXtrViSY9GWvfWWG8gySZvEG+rH1OKSx40XRTCWgvXB
         lG+1M0iGRpKBz/yiaqbnyriYGNd5Wq5vFZfuN58lT+i50yaoQwvVz1CNT8rVUULrKgM4
         ZAqw==
X-Forwarded-Encrypted: i=1; AJvYcCVIByEM4rw3rWbh5N04iJlTg2gimwIs3FM0z+sSrj8Gro1MeExKAIgXSBjCd7TeYoj9B5z3r/VRgv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqqGdqfTkzqDJ0DSxuaPTyR7o8FG4U7c/unINVk2IyaaLpD+B
	NpYRQxtlc4sPeoCDp8POEPWrXRwlqxagftk5p0vZXDoQAW+eC860T9pH
X-Gm-Gg: ASbGnct1524X5+YTIPAu4KYpIGCNhOwzoQNioeK1vL9PGxPtLN49TudxRH8cCk8ZbNr
	fW9DkTf3nOaB5aPNC0HsMxKk/1dUKX7XHfexxKUAS1o3FhYudrfwiVqJPfCMo9Hi37f32xn2vfG
	UsIGNYe5UrOTzbTsT0Z+fVbyIC+N123+py05JihV6IomoEzZmnUCnNG0bLAH3+a0N0441B83VRC
	ClURnrKABOasozXlDxqRKEmgmrlVJqh4Yjog/Bky1wNoM5POTf1fj+wdcR7YW/TyvuQhf+wwSom
	2vtJOmgoi8B6azuUfrpjN8aYcRZtssaxL9owuaejH1bBcg49gfDBXCg4Tm1EAzfGqCl6ePUnzFR
	XKUR7gODfAMJHXXidMsxp1ZKB9tkjIpp5jDA3Wy7M0dtMkqxrwhQVsdGFcUqNctbQu2Va57Qopa
	d4KVblb1h4S2EYv6yX+LPjogySqMkPkEEC6PWoUWv1s2dTzAGmW3RH2oCMqIpUiH/URB8tPxKDi
	TCa99B03kTkwWLy
X-Google-Smtp-Source: AGHT+IGYuA3JTqfejqsIhzZHqJz3Ln1oqoniCKUclnrBoDL1DrIFTZ/UyM8tSRO8lbfuTmQFjQVKMg==
X-Received: by 2002:a05:600c:4e88:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-477c01d4af2mr60178185e9.18.1763819993601;
        Sat, 22 Nov 2025 05:59:53 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:9815:cfad:3c92:4b87? ([2a06:5906:2618:cb00:9815:cfad:3c92:4b87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deb126sm106372255e9.9.2025.11.22.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:59:53 -0800 (PST)
Message-ID: <1cb23033-1fa5-4c6b-9cf2-23d26ded18d5@gmail.com>
Date: Sat, 22 Nov 2025 13:59:52 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] rust: i2c: Add basic I2C driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 Markus Probst <markus.probst@posteo.de>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
 <DEBAOI46JIOO.B0TGI5HFLVJ2@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DEBAOI46JIOO.B0TGI5HFLVJ2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello Danilo

On 11/17/2025 9:40 PM, Danilo Krummrich wrote:
> (Cc: Markus)
> 
> On Mon Nov 17, 2025 at 3:21 AM AEDT, Igor Korotin wrote:
> 
> Applied to driver-core-testing, thanks!
> 
>> Igor Korotin (4):
>>    rust: i2c: add basic I2C device and driver abstractions
> 
>      [ Remove unnecessary safety comment; fix rustdoc `Device` -> `I2cClient`.
>        - Danilo ]
> 
>>    rust: i2c: add manual I2C device creation abstractions
> 
>      [ Remove unnecessary safety comment. - Danilo ]
> 
>>    samples: rust: add Rust I2C sample driver
>>    samples: rust: add Rust I2C client registration sample
> 
>      [ * Remove dependency to I2C_CHARDEV, depend on I2C=y.
>        * Remove unnecessary impl Drop for SampleDriver.
>        * Rename i2c::Registration, import Devres.
>        * Fixup module description.
>        * Add new source file to MAINTAINERS.
>        - Danilo ]

Thanks a lot for the review and all the fixes of yours.

Cheers
Igor

