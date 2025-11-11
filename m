Return-Path: <linux-i2c+bounces-14043-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1779C4C62D
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C181425CA2
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 08:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F36A330D36;
	Tue, 11 Nov 2025 08:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am5yJ6ZA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660A1DF736;
	Tue, 11 Nov 2025 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848906; cv=none; b=MkeFpizmonAt0b657Jmw1CMDuIz4Y9HWrPpi2Rzt5HnFYmKY+jp29Ms5jg5okVSjor52Y0HWK2CC8OITR/8fSXppSQSAkrmNQR3MZp+FCua7tDrsfu/6ZjuwTYSEmYNsHuXW3AFYCBejMPHzZEyDXzyK7SaRYWgARgsVV9GWjC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848906; c=relaxed/simple;
	bh=CD0+NBPGFgKFv4iKAMYY2xRaK8tH6fB4P/vMm3nOkUs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=O5El8cU4pMAxxupsk0sLicdN289tsVc81GLeonZjnploomKOoohxtFxJhyBLizjjNW9/KHN3UzOm8UIaevHgkOSOSWFnzysGKLMtPcu4yODPRC12HA1tjAGkFqw0oM+TwtjnozUBz9P0Y6e61dCMe1YTW2wxL3O7y2ldh/8Z/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am5yJ6ZA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DECC4CEF7;
	Tue, 11 Nov 2025 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762848905;
	bh=CD0+NBPGFgKFv4iKAMYY2xRaK8tH6fB4P/vMm3nOkUs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Am5yJ6ZAWZOWpoHrkF0W0Kl58ZMWUgY7Ka11YtGDKwYXqwHvSZFWboBqx7IG5tCXI
	 M/kbLkRjtxBMQXJq0F4pX+0MyrG+q0x91nhpI/BVx4irjWbztwxn7+oFwlodNOS54C
	 vo5I+pVST0TUJOfugoSWbu9vB9kJabMGVZwCPEgw2o7TzyArmFrF4MEYvloJIGCjPJ
	 XYCQJzU/dp4dOw/K7gI6r8bglJZzaMTuzSE1pF49ejLASZ/kbWpoDWeHsNHANZn7WI
	 St/mRmKQbNphwOig+i8SOB7QceSJEaVvQ9zbrYmIu4dbhrx5EkUVpBdRvSyN8Xc6Ae
	 ksQGpESUaEJeg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Nov 2025 19:14:53 +1100
Message-Id: <DE5PS1PZX14G.5IL01JCLBJE6@kernel.org>
Subject: Re: [PATCH v7 2/4] rust: i2c: add manual I2C device creation
 abstractions
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Wedson Almeida Filho" <wedsonaf@gmail.com>, "Alex Hung"
 <alex.hung@amd.com>, "Tamir Duberstein" <tamird@gmail.com>, "Xiangfei Ding"
 <dingxiangfei2009@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-i2c@vger.kernel.org>
To: "Igor Korotin" <igor.korotin.linux@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
 <20251110113018.51510-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20251110113018.51510-1-igor.korotin.linux@gmail.com>

On Mon Nov 10, 2025 at 10:30 PM AEDT, Igor Korotin wrote:
> +impl I2cAdapter {
> +    /// Returns the I2C Adapter index.
> +    #[inline]
> +    pub fn get_nr(&self) -> i32 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct i2c_ada=
pter`.
> +        unsafe { (*self.as_raw()).nr }
> +    }

Missing empty line. Also, please try to avoid the "get" prefix for function=
s /
methods that do not increase a reference count. What about just index()?

> +    /// Gets pointer to an `i2c_adapter` by index.
> +    pub fn get(index: i32) -> Result<ARef<Self>> {
> +        // SAFETY: `index` must refer to a valid I2C adapter; the kernel
> +        // guarantees that `i2c_get_adapter(index)` returns either a val=
id
> +        // pointer or NULL. `NonNull::new` guarantees the correct check.
> +        let adapter =3D NonNull::new(unsafe { bindings::i2c_get_adapter(=
index) }).ok_or(ENODEV)?;
> +
> +        // SAFETY: `adapter` is non-null and points to a live `i2c_adapt=
er`.
> +        // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
> +        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal=
>>()).into() })
> +    }
> +}
> +
> +// SAFETY: `I2cAdapter` is a transparent wrapper of a type that doesn't =
depend on `I2cAdapter`'s generic
> +// argument.
> +kernel::impl_device_context_deref!(unsafe { I2cAdapter });
> +kernel::impl_device_context_into_aref!(I2cAdapter);
> +
> +// SAFETY: Instances of `I2cAdapter` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> +        unsafe { bindings::i2c_get_adapter(self.get_nr()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.
> +        unsafe { bindings::i2c_put_adapter(obj.as_ref().as_raw()) }
> +    }
> +}
> +
> +/// The i2c board info representation
> +///
> +/// This structure represents the Rust abstraction for a C `struct i2c_b=
oard_info` structure,
> +/// which is used for manual I2C client creation.
> +#[repr(transparent)]
> +pub struct I2cBoardInfo(bindings::i2c_board_info);
> +
> +impl I2cBoardInfo {
> +    const I2C_TYPE_SIZE: usize =3D 20;
> +    /// Create a new [`I2cBoardInfo`] for a kernel driver.
> +    #[inline(always)]
> +    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
> +        build_assert!(
> +            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
> +            "Type exceeds 20 bytes"
> +        );
> +        let src =3D type_.as_bytes_with_nul();
> +        // Replace with `bindings::acpi_device_id::default()` once stabi=
lized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c_board_info: bindings::i2c_board_info =3D unsafe { co=
re::mem::zeroed() };

pin_init::zeroed()

> +        let mut i: usize =3D 0;
> +        while i < src.len() {
> +            i2c_board_info.type_[i] =3D src[i];
> +            i +=3D 1;
> +        }
> +
> +        i2c_board_info.addr =3D addr;
> +        Self(i2c_board_info)
> +    }
> +
> +    fn as_raw(&self) -> *const bindings::i2c_board_info {
> +        from_ref(&self.0)
> +    }
> +}

