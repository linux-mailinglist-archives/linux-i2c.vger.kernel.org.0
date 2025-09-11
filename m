Return-Path: <linux-i2c+bounces-12894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C335B53D2B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 22:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD73B1B22FF1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 20:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EB32C21F6;
	Thu, 11 Sep 2025 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvjyN5vx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AE7261B71;
	Thu, 11 Sep 2025 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757622863; cv=none; b=I1RAYNDyyQ+TgW2IpVsUcS2k7OinL4H6xN+blLzslu4meQIzprBQDxaI21ETCFjepuPhCUrb9mLLhV5zE8/SUCxgN7KR8snWvhQqflQnO/7JKqhuz3M4PMY3ej3RWMhDdr2fAppzuRvg6wexTksmVJzHjZIaRUshakjrBY3gplk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757622863; c=relaxed/simple;
	bh=PwiTUdsdKjtwPrO614rq/+6R+VG37tYxbhPVowLUnyc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=JSgHJszvNE6gb4qc/2jqiOybK2CVdeUZjTy2JEk7kada18CCXZB8EyincBuXU6VveQ86BneYhaL6BEsGEP7eDKBmwReyueMgusVa/KzxZetZKXq5np4EPIATvVumxHyAw07nDA2hkp+/X477OgcAiXC82APlLII9EfEaoYvA5VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvjyN5vx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C539C4CEF0;
	Thu, 11 Sep 2025 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757622863;
	bh=PwiTUdsdKjtwPrO614rq/+6R+VG37tYxbhPVowLUnyc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=CvjyN5vxeViqPaDQv2IiF+KNe/or8yTABIe5zBmvFsUcfgvmgKIOvO9OEFZeNMYJV
	 zjR5fnn7mt2dIvbseba9zV0igdXIUlfBKufrhnDpmvB7WXulMdmyBW1CnimrVwODC9
	 PLZp0g+5NRv6a+xelxbdRu7jYKf93woBjrQ4mcnaBbWS+/kwbvy4lw4vijkUZuNZBe
	 1oOHnluxF47wWpZV5jjWi2yuWEt9HU+R0uOo5PspzuV6YlInnQawCcJcv8pOAvQRBN
	 FMHB312KtzQJw8yVhYHpCUJEbAGkaCpqyHw+QfBlRPBk0ogVFm/RBzgXXYhoSzFreH
	 SYPKLm8tK350g==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 22:34:17 +0200
Message-Id: <DCQ9AXZ5APKN.1835AK0PVA3S5@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 2/3] rust: i2c: add manual I2C device creation
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
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
 <20250911155015.97250-1-igor.korotin.linux@gmail.com>
In-Reply-To: <20250911155015.97250-1-igor.korotin.linux@gmail.com>

On Thu Sep 11, 2025 at 5:50 PM CEST, Igor Korotin wrote:
> +impl I2cAdapter {
> +    /// Gets pointer to an `i2c_adapter` by index.
> +    pub fn get(index: i32) -> Result<ARef<Self>> {

Where do we get this index usually from? OF, ACPI, etc. I assume? I feel li=
ke it
could make sense to wrap it into a new type. Even though it is not safety
relevant it eliminates a source for mistakes.

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
> +impl<Ctx: device::DeviceContext> Drop for I2cAdapter<Ctx> {
> +    fn drop(&mut self) {
> +        // SAFETY: This `I2cAdapter` was obtained from `i2c_get_adapter`=
,
> +        // and calling `i2c_put_adapter` exactly once will correctly rel=
ease
> +        // the reference count in the I2C core. It is safe to call from =
any context
> +        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
> +    }
> +}

The Drop implementation is not needed, you only ever give out an
ARef<I2cAdapter>, but never a "raw" I2cAdapter, which is the correct thing =
to
do.

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
> +        unsafe { bindings::i2c_get_adapter((*self.as_raw()).nr) };

Please make accessing the nr field a separate inline function, or at least =
put
it in a separate unsafe block.

> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.
> +        unsafe { bindings::i2c_put_adapter(&raw mut (*obj.as_ref().as_ra=
w())) }

Same here, separate unsafe blocks please.

> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<I2cAdapter<Ctx>> for I2cAdapter<C=
tx> {
> +    fn as_ref(&self) -> &I2cAdapter<Ctx> {
> +        &self
> +    }
> +}

This AsRef implementation doesn't seem to do anything?

