Return-Path: <linux-i2c+bounces-13818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00690C0B106
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 20:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0366C189E508
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 19:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148832877E7;
	Sun, 26 Oct 2025 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPxUzkbG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01BA4A1E;
	Sun, 26 Oct 2025 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761506423; cv=none; b=sMNG6zcP4EGLe1Q/8WRM5RqvblewPMEU+Uoekfxbqczy2VKS7x8mlVf+QHBNtkSUbanAZ1aXRIKrZPcaET1NdKg5SFmTDkBMZSGCGVZQyUr1i/aXfJ9x0RrUlzUENm+tbd6swxyR6n8ajNqeoe4T/eIovBvZvn1tdJ/V88nVLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761506423; c=relaxed/simple;
	bh=pU8YzPsW1sbf/wDE+3x0lLRoVu/4j7nbLx0+1PXChjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyW2RxYIk3mcjMZuMIPDKGLFpAsm+UNf5GD8IuQX2w9n4EI6zxunqiEXDC2UG7655JyUcVUH4kQMYwVzIIxhvjbgtkCcLua+DyhdequQzbwdSwW3Nt/chMuAo/mbwgmxYhE71YadQF6qhOyTxG5sCNLK6aUdqeGIGebSuIqT6rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPxUzkbG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC15C4CEE7;
	Sun, 26 Oct 2025 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761506423;
	bh=pU8YzPsW1sbf/wDE+3x0lLRoVu/4j7nbLx0+1PXChjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fPxUzkbGJj7g13mUSKrhS+C9ilPucqHH9pbWTIdKZ5/OOZD6TLifA4WteDscV7QP7
	 FzCF8MljPTWUiJtj71x4DSPHUys5fGhKLZNlZx/RmlAxEW90xgkU+JdQIXajY7UBf/
	 cIORVdn85Buv7J7HKjafGfuAQXiZKf7YTpKKaYM963oxcIcoLbguMPZx1fAt4lcsV5
	 7yAoJCWMEoQPWXT5IjSnFz/5sVuC08EMggN9aPjmW6Fmh7j1EWoRw5KbmoNkpT91lq
	 gmxQhn5AWv1tGv4iG/bW2EzG4U4IESH1+0VWXoZM5dw8vG2b6VnhMEgwh/Hkuv6JQP
	 npWKcwQUBvWyg==
Message-ID: <4568187f-ab63-4c86-b327-90720ad20ac9@kernel.org>
Date: Sun, 26 Oct 2025 20:20:17 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: i2c: Add basic I2C driver abstractions
To: Igor Korotin <igor.korotin.linux@gmail.com>
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
References: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
 <20251026184143.280797-1-igor.korotin.linux@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251026184143.280797-1-igor.korotin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/26/25 7:41 PM, Igor Korotin wrote:
> Hello Danilo
> 
>> On 10/5/25 12:23 PM, Igor Korotin wrote:
>>> +impl Registration {
>>> +    /// The C `i2c_new_client_device` function wrapper for manual I2C client creation.
>>> +    pub fn new(i2c_adapter: &I2cAdapter, i2c_board_info: &I2cBoardInfo) -> Result<Self> {
>>> +        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
>>> +        // pointer or NULL. `from_err_ptr` separates errors. Following `NonNull::new` checks for NULL.
>>> +        let raw_dev = from_err_ptr(unsafe {
>>> +            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_board_info.as_raw())
>>> +        })?;
>>> +
>>> +        let dev_ptr = NonNull::new(raw_dev).ok_or(ENODEV)?;
>>> +
>>> +        Ok(Self(dev_ptr))
>>> +    }
>>> +}
>>
>> I wonder if we want to ensure that a Registration can't out-live the driver that
>> registers the I2C client device.
>>
>> This should only ever be called by drivers bound to more complex devices, so if
>> the parent driver is unbound I don't think I2C client device registered by this
>> driver should be able to survive.
>>
>> Hence, I think Registration::new() should return
>> impl PinInit<Devres<Self>, Error> instead.
> 
> Maybe I'm missing something here, but as far as I understand, Devres is bound to 
> an existing device. However `Registration::new` creates new device and registers 
> new i2c_client using function `i2c_new_client_device`. Created i2c_client uses 
> i2c_adapter as its parent.

Correct, but the question is what's the correct lifetime boundary for this
i2c:Registration.
> The driver that declares Registration doesn't own that i2c_adapter. `Registration` 
> itself is not part of the new client’s managed resources, so returning 
> `impl PinInit<Devres<Self>, Error>` wouldn’t make sense here.

It does make sense, it's just not required for safety reasons.

This is an API that should be used by drivers operating complicated devices
(DRM, NET, etc.) where there is no point in keeping an i2c::Registration alive
after the driver that registered the I2C client has been unbound itself.

For instance, a GPU driver may call this in probe() to register an I2C device
for some redriver, repeater, multiplexer, etc. So, it makes no sense to allow a
corresponding i2c::Registration to still exist beyond the GPU driver being unbound.

Hence, besides not really being necessary for safety reasons, it still seems
reasonable to enforce this for semantic reasons.

> Drop for Registration calls `i2c_unregister_client()`, which gracefully unregisters
> and deallocates the i2c_client.

Not quite, it unregisters the I2C client (which is why we call the object
Registration), but it does not necessarily free the I2C client. Someone else can
still hold a reference count of the I2C client.

