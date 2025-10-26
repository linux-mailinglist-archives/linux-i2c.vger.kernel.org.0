Return-Path: <linux-i2c+bounces-13815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE448C0ACF1
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 16:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FF993B1C31
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 15:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65D4207A0B;
	Sun, 26 Oct 2025 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbhP5d2d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1EF1D5CEA
	for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 15:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761493807; cv=none; b=DPYnPl0luPi9O7HeXd9+aHzm5OpNkrrwWwshZLR4jxk72dXUJP4+YDOymHTey37tGWC9G1iC5tcojiqQKfg6GjSTpDWqd364h5TczkTfRNpq7S/WJfo0zDvZj95xXM1a4rMZayLjVyzBDCa9Cs8uLb7ESU8F/BhjqWCg9ma10sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761493807; c=relaxed/simple;
	bh=BxE4AMPL/vcJ70cwNaercB49PFvdWpZrZz54n4I+Tss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZ2ZfPOu9eOCrjeJSK09s6L2CTnYIaKbc8k+7BbXsrHWopV6Sxx5NFVBxX6mO5Vyo/Y9RPPrdfHpDRebHS+52vLcKjtmm9+K78v4HqGZAisuJ2HroZAJ+CNaxTlNw/Li41C4tgvqudJR/EzorBJYejGtcmxxU2jWejq6rZQ+REo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbhP5d2d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47106fc51faso48491265e9.0
        for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761493804; x=1762098604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwoH7I232gTPCmP7qEpxtY2g6Hfq6kq4uW779mwS/Vc=;
        b=WbhP5d2duYs8xkDO7p8JdxampWS/y2CiGTizWyXKgdMfPqLCpnvV+VAsqSVeGVtH0g
         I3BTSqmbj9OonrEdMZhfVw5PGlQj5MnmAKq3tr1jE8aAjP1NOkUx67f5uXWlN/cuxVGa
         q3NmxRlFFW7woW6V86EkXkKC2dIK4LrxVADwtn6lzxIP+42J+TC8MDcFJ59ERCqMWHZ2
         AAu1Xu0VU2NaHsq0hoR6Juc/cfw8EYjxPvcIJYDuxdVHKr1uXH1jX9Gi1p7PaY88V/l9
         Bx6A+NDJ0sFMO2aoloiN8NGY2P+MEMIvh77xiebDeRXFWmfo3LrPj4Ccrg+TbWzUc4ck
         44iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761493804; x=1762098604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwoH7I232gTPCmP7qEpxtY2g6Hfq6kq4uW779mwS/Vc=;
        b=MzDgezMuoe2AXnFMe6gfCBpCV+xG5z3gCmrSAlf7D+nMAJAB7A1Ba5t+s4BTVPrfhw
         47vELg5B0SWRMao6jEOLc4pJ6XFFEP4x/xcW+39yGliizo8cVUVPimiIpbTJuBbjCgI4
         ohwgpVE5UhbC70W0rtRQwlp4vUSvZlo+FUZ0U+9NPS1BR09C4Lpf1BSdlfBnz2NQSguy
         H4vNw3a6B4NlxvdeWnrQg+gtqrYpYV0+uv3ySFlzn/g2AO/+PZLToJgPYhuhwi2CsZH9
         Z0BsYe63wUisNBHHwYWRNejWCyvlKKH1/vfEZ8WBhhxmGxRImRCb0mDBKrWtfxbB620y
         3cqA==
X-Forwarded-Encrypted: i=1; AJvYcCVzsUo0tLBjdNIH8lfTnlC/SMbWxE1kPfXN1vV1+oFLu7xzC/YMcIidcJcZyGsHMVXHxjtQgOldtkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7F3WgRbKezhPTFPE2k1+L1HmK7SK0flPOYpj13z0/pIdRe8D
	Wxo1b+ewCbHEMu3cxphZa5rlG3KpgIepmmXiDZZW1j6rBynlttw1Yabk
X-Gm-Gg: ASbGnctHvGNTNxhjTDBoK4q4p9mNNC781JyziFLDYoboTDlJjv5Siw78N33gHmfgafH
	nN+Z2t+SX/Kbx+4vUf+GjvippHpUfXhVVO4Y4KhmD5g3jurcQomx8OaHrvA16HxuXlKkMoRkAJL
	36+oFA5gWnjFil7EIt1L+KxafhT+7A7zcdCU2afJVOIbftDfUj7X3Lyp4C/NFzXI2b2Z1xCBYao
	IQmidQhdRpYaiESWlYZ4a/AD4rszGCgxzJuiprh+JmuDerwWAOHrpbibXaEGzFdLNpSl7n9+fC1
	gaU/t27ZzxZvOFvCN8MDCAAf7HhVIbT584zN/klw3m2mAU2750k9+Qm9pmLDdFN+pXCaggRgRlI
	s74/wayEP4fo2oiKxrzvYcGwCG3gbSjT2MtwCUmRjDnAQN3PSKxLIqtHyTqL/hjEbCm43BXI0sa
	/Ir0DZBEHU0xnZEY+8/JyCpQGxoplOPMp9sl5yihIvuV4jcLnDX08BnrPTChcuQg==
X-Google-Smtp-Source: AGHT+IHkA2M3SX4HhxxTJ6SEKSHdbNns6ue18wHnx7W7S0nv87PUUK8aoI/2+ta3S9khmo30OxGG8Q==
X-Received: by 2002:a05:600c:3e07:b0:46e:4783:1a7a with SMTP id 5b1f17b1804b1-471178705bbmr270697435e9.3.1761493804087;
        Sun, 26 Oct 2025 08:50:04 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7? ([2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475de57b156sm77916985e9.13.2025.10.26.08.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 08:50:03 -0700 (PDT)
Message-ID: <0d8cd0ef-01bd-4996-a146-404a677ad935@gmail.com>
Date: Sun, 26 Oct 2025 15:50:00 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] samples: rust: add Rust I2C sample driver
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
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
 <20251005102348.41935-1-igor.korotin.linux@gmail.com>
 <b09c7c91-b801-40df-8cd8-731837ba2553@kernel.org>
 <72e286cb-7517-494d-a8ed-769b5fb8baee@gmail.com>
 <2d9a8196-8d66-4238-a807-b1ff9fd84519@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <2d9a8196-8d66-4238-a807-b1ff9fd84519@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/26/2025 3:43 PM, Danilo Krummrich wrote:
> On 10/26/25 3:06 PM, Igor Korotin wrote:
>> Hello Danilo
>>
>> On 10/26/2025 10:48 AM, Danilo Krummrich wrote:
>>> On 10/5/25 12:23 PM, Igor Korotin wrote:
>>>> +impl Drop for SampleDriver {
>>>> +    fn drop(&mut self) {
>>>> +        dev_info!(self.idev.as_ref(), "Remove Rust I2C driver sample.\n");
>>>> +    }
>>>> +}
>>>
>>> NIT: Please use the i2c::Driver::unbind() callback instead.
>>
>> Thanks for the feedback.
>> I’ll move this into the i2c::Driver::unbind() callback.
>>
>> Should I send v7?
> 
> For such a minor thing I can usually do it when applying the patch, but given
> that for the other patch the change is a bit more significant, I'd say please
> send a v7.

Just for the clarification: by "the change for the other patch" you mean 
rebase and update this patch series based on [1], right?

Thanks
Igor

[1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/



