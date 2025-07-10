Return-Path: <linux-i2c+bounces-11901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB05B004C4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 16:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181BA64311E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 14:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA19986359;
	Thu, 10 Jul 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOezLADa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40A5270552;
	Thu, 10 Jul 2025 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156438; cv=none; b=qKDBExODVQaq87EhgPRjjBdkX7cMNt83/K10jXzD+5BrZFFATEIWKvyh0uOrtfmlwrnsh37zQSTSSkT8DF+ZGMZ+7redUu8IBM4p1anpc/wNN9B7VmrbUUAfKqRj2fpv0NNr0wFYmiRJNT21twpyEYxGzXQXzvUTIB1xeJ5g0Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156438; c=relaxed/simple;
	bh=YpUIlnVX18vUrhXKaq83Q1Cvx4LaW7PKMg/2Q6O/gQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFCe/Q1sgmC0OM/hhjU/MOO4ba+rOg3f0fFNoBNk1BWgi/cokch9E3/WWOJilRimA4ttejf81QeCi9QRl9f4FzUIId3kRc2pV5w2kbML6GuImg8pZB/ebRm8P50c00whtvjy7BTNcfP6PIxBHb0Ew59bWi/AzhRs1nlp4y0ZRKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOezLADa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5257748e1so832367f8f.2;
        Thu, 10 Jul 2025 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752156435; x=1752761235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkH5D2yTeKtqsP3Kkn65OGOaWxvX3yQ9gDnCFmnTyDk=;
        b=OOezLADaHA0eZ+utNqqHfzPqkGsARUOmmN/kDWfJa36GEF4EJmke3bH62Vs3TJ54m2
         8xTi9rlnFWvAzo9T1Xt/+0+fZfBJxHKhSbKeRz/mxUFqs+j8KTjWOFjwJeH11VIdYXhg
         IF0/ayxNyDjQw0l4rOEeXJwK+6yNWlZayj2qXt9DQDRlinQFCi1tU4pCALwKvKU5c+os
         VRda1z2HChSl1FSD+rB4UQ6JlBHL2pgtX2xMjiPDl1wTnCCUbDv5VT2IWdL9XC6zE8JL
         Bz236vEnfrsEu0C5wHBH8+5seo+JzirNFITyuXQvSjFnFzKix4q3PS88FZ7QFkmqoEGv
         f/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752156435; x=1752761235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkH5D2yTeKtqsP3Kkn65OGOaWxvX3yQ9gDnCFmnTyDk=;
        b=l0FXazlf3mBxmoLy7emkCOh83IpOEEefm5/B5/ac0wx34dOaWR/Qd8Ub22Zacj0WtX
         JXtDXKKCueF27rs6ZPGCLyhv0iAVRqNLuldMV5+IziRP0Mal9xMDu2Rxbou65vnw6wBA
         cK615bLkGUKMUR3p+m/oKCudTODry283cJbywUGaW8rG9SJUDc+nwXk7qL+4Cqzt6SAI
         mlzz0rlWUfRWR5+D4L31cJApTtaiRpC6Eu9U/nG450VW7XJ/6/NvXBw9hWyZ1BfbUlsZ
         +6bpVPmbpYbfl6UupyT39cigHkVy6x1tdB5B6n/Zw2nbwdxJI4X9pgzYpxbM4H/iocxR
         Kp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxsiehJya71LfC5O2RnH3JzOBTM0bsda5Qv9S+u/QjeKHVAnkwFI2UR85j1n8+NHQJnv9kIvK/wU7NSkcI@vger.kernel.org, AJvYcCVCdKSJ7lmXjCBYrZQfxzQaPIWZEqUTJBgW3/xkZMX8jQKnpfYyBMYcPzjOoxpq41k7yghc70sOF+lo8fxKNRM=@vger.kernel.org, AJvYcCW9AJZSCilt6bjg2+0mhDv/q67bXhibo1YhzwbLhXWxwi8cYA4gkFKD9P/czbwx18Gl9YbsYeGoSFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoY4fMEKoT3kpnQ8j0nPWt+OVwZj9q7DJs6pP88e+xU6fCS4bV
	VJlkf7wxCixxaYv87Rhueo6mKt2Tshd7FgNztPmNmbBNOVuYVj6+ykldZQ+mxg==
X-Gm-Gg: ASbGncsYqKJHeqW9rSYAQVsuIf5KT3Xa67OVu3QjhhrZWmJfapqabOBT369mwoFjlqo
	682u+cchveP1NxmFAIzfCs+Ewjc3247eHpx98NcpHgvNvGluysR99NVuHU2bgjRDqg1vLRmUh4l
	0Cuj5dgEr60/UcbaVlzFMEtp2O/BSRJCiXIvCp8skOtKsJXNdRAg31ILV3y3q9h0o6Tnm+5D6tb
	F7s6Wl6yrqNE9sIqRNieHR21C6X06yZmbLfZnx9Q+RQ92EeWsfwrs2DG0VhHxlT1js7+qHMzkjI
	KTftdf7zb1v28v2l1OajJQr4IzVgUX6w7gC+rCVG5i0xvG1SUesf0KeJhQUQK7YQhsvx8dQ=
X-Google-Smtp-Source: AGHT+IGjez2SNgNCYmZ0Jlw10C2JNG4uevbVN0NcIHGZ15GkF2ZzKz+TF7OSoxW+cLofnGQdfvtbUQ==
X-Received: by 2002:adf:a394:0:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3b5e86c4f5dmr2108836f8f.39.1752156434760;
        Thu, 10 Jul 2025 07:07:14 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50fa9b4sm61706965e9.27.2025.07.10.07.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 07:07:14 -0700 (PDT)
Message-ID: <dd850b46-1e9f-4812-a356-41ae6fd0ce59@gmail.com>
Date: Thu, 10 Jul 2025 15:04:59 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] rust: i2c: add basic I2C device and driver
 abstractions
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
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153657.1195687-1-igor.korotin.linux@gmail.com>
 <aGg2qkyrKBIPiSeE@cassiopeiae>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <aGg2qkyrKBIPiSeE@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/4/25 21:16, Danilo Krummrich wrote:
>> +
>> +        0
>> +    }
>> +
>> +    extern "C" fn remove_callback(pdev: *mut bindings::i2c_client) {
>> +        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
>> +        let ptr = unsafe { bindings::i2c_get_clientdata(pdev) }.cast();
>> +
>> +        // SAFETY: `remove_callback` is only ever called after a successful call to
>> +        // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
>> +        // `KBox<T>` pointer created through `KBox::into_foreign`.
>> +        let _ = unsafe { KBox::<T>::from_foreign(ptr) };
> 
> I like to do that as well, but I usually get asked to use drop() instead, let's
> do that here as well. :)
> 

Danilo, could you, please, explain this one a little bit more? I see the
same pattern for all the implemented subsystems so far: auxiliary,
platform, pci.
If this pattern for these subsystems is to be changed, then I'm fine.
Otherwise I'm not sure I understand the difference between these 3 and
I2C Adapter abstraction

Thanks
Igor




