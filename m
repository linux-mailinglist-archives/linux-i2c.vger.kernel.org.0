Return-Path: <linux-i2c+bounces-12810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CAB504BF
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 19:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 363B47B162C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 17:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D6C258ECC;
	Tue,  9 Sep 2025 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="I86g5J2O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D6725B1E0;
	Tue,  9 Sep 2025 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440498; cv=pass; b=EvTCrOp95xos7GNne/v/L5Igea44P+Q6WIHVpnI18Dmyx2wXRawV/O9rqPV/wTLgMya4zY52u69kO5283IQIHjj4oJUZLsqDmVIVM8k/nvbWaymILYDvlhOBp1vj2r2G5SqBRZPj9mCJWFOAzxXDjcCDTDwE0mNeExfYup5aGLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440498; c=relaxed/simple;
	bh=bi3FzqBbDGwN+S84x5Yy8igL8ByIEyiiRi++2Iffi1s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ajImKZarSLBgT2Fm8mJAa3wV/dTFMmOojj4cyUeK4JS7Goo7vFCm5LHUTLcZFbCXD9Xpy969ZYyYq0eeBT+IIEeddRkoMUWjRXCp2cxf1AB4nKhsogBR8lK0PEYKHNe6mzOURr02Ptem6RnvJgkGLHkEWvpNpZUHKz9wql4UDRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=I86g5J2O; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757440454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c2sContwzi2EUk8oGNM1aMpIJKcOje4zU8RD+odgo2kVz0GPRahG3/D5LF6emOYpXphKz38P/fuHR199ijpoRFyj6A/dYpHZPySJY84ms4G37YkujynwmWZhqsQvhke/vcpwozkXRvGqt9Aa+jSpXX+X5M6/uHxdjxj6F1sSa+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757440454; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZexlUvzuh8BcVVQKwrBhxK1Lku6iKS7yCiVoXMY4Yas=; 
	b=FW7NKz+QGjBssqVYhQtFdSxVeMCNf/+VsC8QHj9gHhlYIklrwauj0EIVCImJC3fruX2rCHo5OEPIDAcMc9c0R1LEpeTuM4SqbqhG5aI7+o+zWJIhT0W4C6O9NpAyvLo8w5mGOmB41fJo5bde6H6w3LlolN8NMzBZO+ujX97P5WM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757440454;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=ZexlUvzuh8BcVVQKwrBhxK1Lku6iKS7yCiVoXMY4Yas=;
	b=I86g5J2OlK49zHbPszu2USloO12NGEFukteoHiSieOSpF5vjoKMB7x5tXyASG5bS
	cU4CiidIXJQLE/ZDmzLRDBZqP5dDbGeWrHeXjBaL5Loey3irVV6QJq9Cy6lfUakWFOO
	n8svMb8LbXgp8yWgtqt8MuHeo/Fx7ZfGBj71YcJw=
Received: by mx.zohomail.com with SMTPS id 17574404525881001.4507671242769;
	Tue, 9 Sep 2025 10:54:12 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 1/3] rust: i2c: add basic I2C device and driver
 abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <655ca23c-1fe6-498a-80b8-1b75044d9db3@gmail.com>
Date: Tue, 9 Sep 2025 14:53:55 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <467F4F57-9452-4B68-931B-4A55A7CBC268@collabora.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820151913.1814284-1-igor.korotin.linux@gmail.com>
 <CB269793-D165-4D22-95E5-F978C1ECC79E@collabora.com>
 <655ca23c-1fe6-498a-80b8-1b75044d9db3@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 9 Sep 2025, at 14:19, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> Hi Daniel
>=20
> On 8/27/2025 7:37 PM, Daniel Almeida wrote:
>>> +
>>> +        let i2c_table =3D match T::I2C_ID_TABLE {
>>> +            Some(table) =3D> table.as_ptr(),
>>> +            None =3D> core::ptr::null(),
>>> +        };
>>> +
>>> +        let of_table =3D match T::OF_ID_TABLE {
>>> +            Some(table) =3D> table.as_ptr(),
>>> +            None =3D> core::ptr::null(),
>>> +        };
>>> +
>>> +        let acpi_table =3D match T::ACPI_ID_TABLE {
>>> +            Some(table) =3D> table.as_ptr(),
>>> +            None =3D> core::ptr::null(),
>>> +        };
>>> +
>>> +        // SAFETY: It's safe to set the fields of `struct =
i2c_client` on initialization.
>>> +        unsafe {
>>> +            (*idrv.get()).driver.name =3D name.as_char_ptr();
>>> +            (*idrv.get()).probe =3D Some(Self::probe_callback);
>>> +            (*idrv.get()).remove =3D Some(Self::remove_callback);
>>> +            (*idrv.get()).shutdown =3D =
Some(Self::shutdown_callback);
>>> +            (*idrv.get()).id_table =3D i2c_table;
>>> +            (*idrv.get()).driver.of_match_table =3D of_table;
>>> +            (*idrv.get()).driver.acpi_match_table =3D acpi_table;
>>> +        }
>>> +
>>> +        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
>>> +        to_result(unsafe { bindings::i2c_register_driver(module.0, =
idrv.get()) })
>>> +    }
>>> +
>>> +    unsafe fn unregister(idrv: &Opaque<Self::RegType>) {
>>> +        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
>>> +        unsafe { bindings::i2c_del_driver(idrv.get()) }
>>> +    }
>>> +}
>>> +
>>> +impl<T: Driver + 'static> Adapter<T> {
>>> +    extern "C" fn probe_callback(idev: *mut bindings::i2c_client) =
-> kernel::ffi::c_int {
>>> +        // SAFETY: The I2C bus only ever calls the probe callback =
with a valid pointer to a
>>> +        // `struct i2c_client`.
>>> +        //
>>> +        // INVARIANT: `idev` is valid for the duration of =
`probe_callback()`.
>>> +        let idev =3D unsafe { =
&*idev.cast::<I2cClient<device::CoreInternal>>() };
>>> +
>>> +        let info =3D
>>> +            Self::i2c_id_info(idev).or_else(|| <Self as =
driver::Adapter>::id_info(idev.as_ref()));
>> I wonder if these should be private member functions?
>>> +
>>> +        from_result(|| {
>>> +            let data =3D T::probe(idev, info)?;
>>> +
>>> +            idev.as_ref().set_drvdata(data);
>>> +            Ok(0)
>>> +        })
>>> +    }
>>> +
>>> +    extern "C" fn remove_callback(idev: *mut bindings::i2c_client) =
{
>>> +        // SAFETY: `idev` is a valid pointer to a `struct =
i2c_client`.
>>> +        let idev =3D unsafe { =
&*idev.cast::<I2cClient<device::CoreInternal>>() };
>>> +
>>> +        // SAFETY: `remove_callback` is only ever called after a =
successful call to
>>> +        // `probe_callback`, hence it's guaranteed that =
`I2cClient::set_drvdata()` has been called
>>> +        // and stored a `Pin<KBox<T>>`.
>>> +        drop(unsafe { =
idev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() });
>>> +    }
>>> +
>>> +    extern "C" fn shutdown_callback(idev: *mut =
bindings::i2c_client) {
>>> +        // SAFETY: `shutdown_callback` is only ever called for a =
valid `idev`
>>> +        let idev =3D unsafe { =
&*idev.cast::<I2cClient<device::Core>>() };
>>> +
>>> +        T::shutdown(idev);
>>> +    }
>>> +
>>> +    /// The [`i2c::IdTable`] of the corresponding driver.
>>> +    fn i2c_id_table() -> Option<IdTable<<Self as =
driver::Adapter>::IdInfo>> {
>>> +        T::I2C_ID_TABLE
>>> +    }
>>> +
>>> +    /// Returns the driver's private data from the matching entry =
in the [`i2c::IdTable`], if any.
>>> +    ///
>>> +    /// If this returns `None`, it means there is no match with an =
entry in the [`i2c::IdTable`].
>>> +    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as =
driver::Adapter>::IdInfo> {
>> Again, perhaps a private member function? I=E2=80=99m trying to =
simplify the syntax here.
>=20
> Can you, please, kindly clarify what do you mean? If a function is not =
pub/pub(crate),
> it is a private function.
>=20
> Thanks,
> Igor
>=20

I mean a function that takes &self or &mut self as applicable.

=E2=80=94 Daniel=

