Return-Path: <linux-i2c+bounces-11861-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DBDAFB22C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 13:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67B021707A4
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 11:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B5A295517;
	Mon,  7 Jul 2025 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgKaYjdz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2793F288C32;
	Mon,  7 Jul 2025 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887355; cv=none; b=mIC/Z2Bx6K9A6F+sPrmLweh1MIn1/K1hF5qCetMEgM6MnBR2xFJ6QL0ZCjSc/WEudqDtCHA7O5BFN5/FPViKoxv4AkVxMkM9eMudPNiKQKuy6PGLPME9rcJAkTVsP5ZjiGJmfUk4IyIH853pK1IULQlrcLB0XB9GpyvAj2X/Hv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887355; c=relaxed/simple;
	bh=auNc4q5k6WOOpCz8yUc9QQvG0PQvjGchvMgSYprHzEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTxX9NQqJJvzWqn9bNcX38NxFluefIOGbQb3X7N3Vxo94hoOW3dUhmvlFMFqHTxLI2Hr443jx6NCAsxpYiT6SCo6HuSauJW+778uEcBzcL5EAu3tjCJX64iSV008i0WIxwvOVtPGOgHw9iyA2kR5mo7iz2++D6cRcioFLUC3iUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgKaYjdz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d6ade159so25294075e9.1;
        Mon, 07 Jul 2025 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751887352; x=1752492152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzuNbdmGUYx5Y7Vkv6KzZL1Zh++TdqOfzMO1Yq9uvLA=;
        b=DgKaYjdzUkj5EtHWCYRokfLe5Iiv1tN+xl5OtzQvxN/JLtYrZGjDtID7Mdikvs5+XE
         rZZ8Nr1QczvDf3by10dPjWMSJr/aA1MR5kD3JLcF/s28nqRZ+aInEbldbpv4vNvzX+Tw
         str7pIthkeeBr5WiK7zunaLPBnDtDYl1RQYOR0NZJSAN8ZuSH4isHc1DixwO76kBGiPO
         lQwiYPoIuG33FBpWHCF2y4GHE4pU8JmCDlSUc6+xqcgzjW+gkHw3KNy8VGoNYklc1j+t
         +wi7jqzYs8Uq5VuUKpgvfY/0uWgZv4dt5NHQQihertRF2KQNpOkfFI+Pke3byswzzxHB
         jcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751887352; x=1752492152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzuNbdmGUYx5Y7Vkv6KzZL1Zh++TdqOfzMO1Yq9uvLA=;
        b=ajcfOoLBZ6ypAWl4BN6j47pPwgntZ1cCU/8/3WxK0T0Bq2ymIJsEayE4b+t6Liup8N
         S5ddCvYEmfYucIRbXi+EEjuP1sGwBl9PFvpgvsWumInInHJ/ShFWqBQSywGpXs5A1sMb
         lL/D+XiQTxUO54XtmTSXb4tdkea4WubfrLOiGXufckdX16QhXPNLQhrZVy7rXzudj2C/
         ajvUdsd/32Q4OwGulVsYv5EkIxe5pSU65bzZsi7GXKjWqJx44FUNHAq1lvQpegU9fE+0
         VnYGbDqJaijrq7fCT7RzcRx1ZSUrCjXkU4kDV1iV3hLrnvudzr/n25InGw7z6iivrqlb
         fk1A==
X-Forwarded-Encrypted: i=1; AJvYcCVN9k9zB7uXzsVSytJQ6MIi0py4vyLltHUkFuaDlG/c0RaVbF5qzVySjMPBgasl0ArwbcSkGLqcSymNE8ml@vger.kernel.org, AJvYcCViEpI/GZ6mZGbE/U6oiMJDhx8Fr9lDmQUGNebSqKTCTK1enYLi+pcPELZ3zHiQVFEkobyGxTXXZpI=@vger.kernel.org, AJvYcCW3c2ZAX1v3fL3AgJahmt9u4vriR+Zw+Jl07hrr4GUsL1Jmw0pnR/naeuWAAJXvNIHEPM9P/CQCKGK0sr0PEFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysuRVR758p35QLVoPcrgB7ZRLzMfX56UhMXKi4T8EXOiB03Tyi
	9hBXnYs3EniK9OMaEoNdbGQ5cSsUrsr2Uv8h3+oj5zUUAjdTeOe67HTe
X-Gm-Gg: ASbGnct2lAp4T+h2hJuKG84hWf2bCNXCyGJrJi+7EyR3bRWBL4+1dZBUHb4FpzAmN3i
	9EWQ7wvdqxONxcxjQBMBf2Gnet9ydj/O/lEm1zMFbIIaqx0+1b8nE58aMMd4oyRLVLjLTlyXkZm
	mfaoS1d92knbkuF7XQjWyX0bnpyLOaD7Q2yohaY2uU+GokdwnpEhgTgLRrt9GiTKdDhGMXd2qcc
	R2qR/w7+dcbsM+/OCaKgPi2nfznqepfalBFbw8VhpcQRk9maX3mTQDAP9vtyaUnIJID1oPiAwaG
	CDoGkKetVUhEx+RzCsJtt8X5B60XSnel8w+l0FgrFSeTIqI51KvD56AFSSrJEWuyDndL
X-Google-Smtp-Source: AGHT+IEHeL1XoVCWaQmmQo9Sa1mjZcf1RV3n52Bddt+fuIeociziWR7HAGkg1jsESIwXlO3SJyYdkQ==
X-Received: by 2002:a05:600c:5247:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-454c0fc516bmr45761905e9.27.1751887351874;
        Mon, 07 Jul 2025 04:22:31 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161fb78sm109255405e9.1.2025.07.07.04.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:22:31 -0700 (PDT)
Message-ID: <954a40a4-2f5a-4ef8-84ea-3d2ba2c85cfe@gmail.com>
Date: Mon, 7 Jul 2025 12:20:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rust: i2c: add manual I2C device creation
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
 <20250704153912.1197034-1-igor.korotin.linux@gmail.com>
 <aGgxfNh-sgkJls_h@cassiopeiae>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <aGgxfNh-sgkJls_h@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/4/25 20:54, Danilo Krummrich wrote:
> On Fri, Jul 04, 2025 at 04:39:12PM +0100, Igor Korotin wrote:
>> -pub struct Device<Ctx: device::DeviceContext = device::Normal>(
>> +pub struct Device<Ctx: device::DeviceContext = device::Normal, State: DeviceState = state::Borrowed>(
>>      Opaque<bindings::i2c_client>,
>>      PhantomData<Ctx>,
>> +    PhantomData<State>,
>>  );
> 
> I see what you're doing here, but I think you're thinking this way too
> complicated.
> 
> I recommend not to reuse the Device type to register a new I2C client device,
> it's adding too much complexity without any real value.
> 
> You also don't want the DeviceContext types for a device registration, since the
> registration will never have any other DeviceContext than device::Normal (see
> also my comment on the sample module).
> 
> DeviceContext types are only useful for &Device (i.e. references) given out for
> a specific scope, such as probe(), remove(), etc.
> 
> The only thing you really want to do is to register a new I2C client device, get
> a i2c::Registration instance and call i2c_unregister_device() when the
> i2c::Registration is dropped.
> 
> This is exactly the same use-case as we have in the auxiliary bus. I highly
> recommend looking at what auxiliary::Registration does [1].
> 
> Also note that if you want a reference to the device in the i2c::Registration,
> you can also add a i2c::Registration::device() method that returns an
> &i2c::Device, which through into() you can obtain an ARef<i2c::Device> from.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299

I took a quick look at the auxiliary Registration abstraction and I see
that it is not applicable for I2C subsystem. The issue here is that I2C
C code doesn't provide with an API that can registers an I2C client from
already existing `struct i2c_client`.

All the APIs provided require `i2c_adapter` with some other inputs
depending on a specific API, they return `i2c_client` being allocated
and registered by the Kernel C code.

Since I'm not controlling initial object allocation, I need somehow to
mark created i2c_client to be dropped automatically and that's why I
implemented `Borrowed/Owned` generic parameter along with this
`DeviceOwned(Device<Ctx, state::Owned>)`. One of the main purposes of
this Borrowed/Owned to prevent accidental casting of `i2c_client` structs.

Alternatively, it could be an implementation of `unregister` method that
user should call explicitly to de-register manually created
`i2c_client`, but as far as I understand this is not Rust "way".

Best Regards
Igor



