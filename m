Return-Path: <linux-i2c+bounces-15167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D8D2110C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 20:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 918C9304A91A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 19:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736D7346AE5;
	Wed, 14 Jan 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmBYlfI5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3C934CFD3
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419640; cv=none; b=krsX+9rPEotkOSOI9K8YpHSmhH+lGT0A/P9DYNsa56NOw7U+7PRJmDEpbsMhY3LOFZYwJVU03yvXZI7biVKJs/EYs6HIf8g/UmZDDB+jaSot/jmoXIsXj3NyDu4F1TEKfX74aLQqQmv9AolvPvrdV9/cHoPFzofWeZXqrpzcie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419640; c=relaxed/simple;
	bh=ykLH2MgbCvBBlz1nfxnm2nxGWsprbZ68o9/wmnQtSQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzW4Ex8XGy9QwuN7nNiFj70GgdlFE2Gd6hKcSxa5UCTFTlldnEm6R/ATXZFNn7o+NLq/Sj8y8SD7Q9lYV9wQPyVrIi67z9hX96Wsw1bnZov2iHD05whuVitZlHZNYnZjV7c1wgMFlULz6WqAYYVT+0mm6o46eXyl98Yp2Hawtww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmBYlfI5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so111816f8f.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 11:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768419636; x=1769024436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Scpe9pFl2VETM92or+Eva19ojkvY4Xd+w6SP7ONyFrE=;
        b=ZmBYlfI51rt514x4jVU2s6nzIWHbuR43vHtcq+biRQMlpYpBCloeOyyme5NmOATh7f
         4eOGfT8J39lVkXBg5dmDCu5eWCwly3b3pGPU3h0xYnln/hUN5ApbGGKsymxNHETfuzP+
         mWsRJgCiEtAvCcFwaHx0BjvbCjF92XQs2LYHMCai0ptmbxmzoDuXhx1C533s2ATg8cKp
         HHJgx3U08ABQEUa8KM4N1CtFO1ZHbdqHE8lXKUc3pftbpmcuvhBs+Qke30KbCHjkDqxd
         fea20GF4JC05brbPuLg46oIqIN2yN/H5sbgL7QXZ3Q5Ydu6HB8FHZv6Plh4cFUy/owJE
         5LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768419636; x=1769024436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scpe9pFl2VETM92or+Eva19ojkvY4Xd+w6SP7ONyFrE=;
        b=UI44idwXZKNJlyJ3rQtGZZf+h/S9+NUV0baxMy7o1lCGU/CS252fAHaa3qvlFciiSl
         55hFTTggZw6LQF9DFTaXnsO9rdeFEdHQkVTvKfKFpAxoNxxww7ggWLkjmkm+nMUgNeOY
         CpjvCxjKQ3xjjFkPpZj4TAZNioDl2wMh9TPsl7OZ/KislXOpjPRhm06Hd8s0nqHANEtS
         n0HLfw8v3EOrWdU51K61g9M0R5X2ZauUncCBmNEIoFI6a5EkWHjxxNKWdkK7Eh/gwZmT
         mcWjkhDz5TQogtW9y04FFfb5ke648NsoCGu8IaNQWx3sm9WUqIc0xK6NHs+tBXFEKxX7
         d03A==
X-Forwarded-Encrypted: i=1; AJvYcCWWdGG3/nOMKWXQpNNYJFlnvJQvzZ8hjrq0eHYRak76m5pjSKWdQcgR747SSMjbfroO8oU9e7KSrkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7izyPV5I2EDiuUHQ5mpitNqbGxM4IBUpNiyyvtJxTz5kEr1D
	2pwLpN/TSsHccKwWmHS/pW6x7Z1w8PA69sY2qXERpmd2vC8wky1xyBn6
X-Gm-Gg: AY/fxX5SutM6ztPEv77xK800faj3NJWCGnDKwAM69n4e9aidwoAbBjLHGq2LOof3MKz
	gSuJVYjuD3AAeu5393cCIL2Piwx18L0XhR4xKLk+X+iiCDu0fxteGQlV2R6qPpBgxSP9PrjfIBT
	ScnkILY5XQWlrX1/+QWti/wBiVbPm4QijjfuOdutIGzw9C2UV47L4fIrmQlDO4V2mTsZp4hefaP
	lB6NhZDS9vLQ+q9bBZl7CGmZaslGdyK4f+ZWhoe0IUxFdOxrdYX6CZk74ndnLvNSts+aKbNlm+z
	PRHjs9OKQTB+KJHnwaCNiN5tssiaCz7tcc2lWYF43sPcJPiv1RZ7uBL6OKDw6w2DDjTR6KeJKoL
	asYceXNTq2BXe/kiupZ9qebhh3ZCceKMJm0OapQ3aJ09fuBSSMu8b09fcWpwpFTpA4TJCS557I7
	KxtuEaT9Km7y1LFcIcw+dn03fS1f0DHXCKJ71NkvZdyv7sw9KL0V8svCM+CcGiqDxg/bcG9eL7+
	0RO4A==
X-Received: by 2002:a5d:5d0a:0:b0:430:fd84:3175 with SMTP id ffacd0b85a97d-4342c535d4cmr5459711f8f.38.1768419635614;
        Wed, 14 Jan 2026 11:40:35 -0800 (PST)
Received: from ?IPV6:2a06:5906:2639:e200:7139:7167:2ab3:2206? ([2a06:5906:2639:e200:7139:7167:2ab3:2206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a778sm1065645f8f.3.2026.01.14.11.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 11:40:35 -0800 (PST)
Message-ID: <ee4a31e1-f375-4c9b-aa1a-b056f40e0d91@gmail.com>
Date: Wed, 14 Jan 2026 19:40:34 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] rust: driver: introduce a common Driver trait
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, david.m.ertman@intel.com,
 ira.weiny@intel.com, leon@kernel.org, bhelgaas@google.com,
 kwilczynski@kernel.org, wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20260107103511.570525-1-dakr@kernel.org>
 <20260107103511.570525-4-dakr@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <20260107103511.570525-4-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/2026 10:35 AM, Danilo Krummrich wrote:
> The Driver trait describes the layout of a specific driver structure,
> such as `struct pci_driver` or `struct platform_driver`.
> 
> In a first step, this replaces the associated type RegType of the
> RegistrationOps with the Driver::DriverType associated type.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>   rust/kernel/auxiliary.rs | 18 +++++++++++-------
>   rust/kernel/driver.rs    | 40 +++++++++++++++++++++++++---------------
>   rust/kernel/i2c.rs       | 18 +++++++++++-------
>   rust/kernel/pci.rs       | 18 +++++++++++-------
>   rust/kernel/platform.rs  | 18 +++++++++++-------
>   rust/kernel/usb.rs       | 18 +++++++++++-------
>   6 files changed, 80 insertions(+), 50 deletions(-)
> 
> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> index 6931f8a4267f..4636b6f41195 100644
> --- a/rust/kernel/auxiliary.rs
> +++ b/rust/kernel/auxiliary.rs
> @@ -23,13 +23,17 @@
>   /// An adapter for the registration of auxiliary drivers.
>   pub struct Adapter<T: Driver>(T);
>   
> -// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// SAFETY:
> +// - `bindings::auxiliary_driver` is a C type declared as `repr(C)`.
> +unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
> +    type DriverType = bindings::auxiliary_driver;
> +}
> +
> +// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
>   // a preceding call to `register` has been successful.
>   unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> -    type RegType = bindings::auxiliary_driver;
> -
>       unsafe fn register(
> -        adrv: &Opaque<Self::RegType>,
> +        adrv: &Opaque<Self::DriverType>,
>           name: &'static CStr,
>           module: &'static ThisModule,
>       ) -> Result {
> @@ -41,14 +45,14 @@ unsafe fn register(
>               (*adrv.get()).id_table = T::ID_TABLE.as_ptr();
>           }
>   
> -        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
> +        // SAFETY: `adrv` is guaranteed to be a valid `DriverType`.
>           to_result(unsafe {
>               bindings::__auxiliary_driver_register(adrv.get(), module.0, name.as_char_ptr())
>           })
>       }
>   
> -    unsafe fn unregister(adrv: &Opaque<Self::RegType>) {
> -        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
> +    unsafe fn unregister(adrv: &Opaque<Self::DriverType>) {
> +        // SAFETY: `adrv` is guaranteed to be a valid `DriverType`.
>           unsafe { bindings::auxiliary_driver_unregister(adrv.get()) }
>       }
>   }
> diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> index 649d06468f41..cd1d36c313e1 100644
> --- a/rust/kernel/driver.rs
> +++ b/rust/kernel/driver.rs
> @@ -99,23 +99,33 @@
>   use core::pin::Pin;
>   use pin_init::{pin_data, pinned_drop, PinInit};
>   
> +/// Trait describing the layout of a specific device driver.
> +///
> +/// This trait describes the layout of a specific driver structure, such as `struct pci_driver` or
> +/// `struct platform_driver`.
> +///
> +/// # Safety
> +///
> +/// Implementors must guarantee that:
> +/// - `DriverType` is `repr(C)`.
> +pub unsafe trait Driver {
> +    /// The specific driver type embedding a `struct device_driver`.
> +    type DriverType: Default;
> +}
> +
>   /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
>   /// Amba, etc.) to provide the corresponding subsystem specific implementation to register /
> -/// unregister a driver of the particular type (`RegType`).
> +/// unregister a driver of the particular type (`DriverType`).
>   ///
> -/// For instance, the PCI subsystem would set `RegType` to `bindings::pci_driver` and call
> +/// For instance, the PCI subsystem would set `DriverType` to `bindings::pci_driver` and call
>   /// `bindings::__pci_register_driver` from `RegistrationOps::register` and
>   /// `bindings::pci_unregister_driver` from `RegistrationOps::unregister`.
>   ///
>   /// # Safety
>   ///
> -/// A call to [`RegistrationOps::unregister`] for a given instance of `RegType` is only valid if a
> -/// preceding call to [`RegistrationOps::register`] has been successful.
> -pub unsafe trait RegistrationOps {
> -    /// The type that holds information about the registration. This is typically a struct defined
> -    /// by the C portion of the kernel.
> -    type RegType: Default;
> -
> +/// A call to [`RegistrationOps::unregister`] for a given instance of `DriverType` is only valid if
> +/// a preceding call to [`RegistrationOps::register`] has been successful.
> +pub unsafe trait RegistrationOps: Driver {
>       /// Registers a driver.
>       ///
>       /// # Safety
> @@ -123,7 +133,7 @@ pub unsafe trait RegistrationOps {
>       /// On success, `reg` must remain pinned and valid until the matching call to
>       /// [`RegistrationOps::unregister`].
>       unsafe fn register(
> -        reg: &Opaque<Self::RegType>,
> +        reg: &Opaque<Self::DriverType>,
>           name: &'static CStr,
>           module: &'static ThisModule,
>       ) -> Result;
> @@ -134,7 +144,7 @@ unsafe fn register(
>       ///
>       /// Must only be called after a preceding successful call to [`RegistrationOps::register`] for
>       /// the same `reg`.
> -    unsafe fn unregister(reg: &Opaque<Self::RegType>);
> +    unsafe fn unregister(reg: &Opaque<Self::DriverType>);
>   }
>   
>   /// A [`Registration`] is a generic type that represents the registration of some driver type (e.g.
> @@ -146,7 +156,7 @@ unsafe fn register(
>   #[pin_data(PinnedDrop)]
>   pub struct Registration<T: RegistrationOps> {
>       #[pin]
> -    reg: Opaque<T::RegType>,
> +    reg: Opaque<T::DriverType>,
>   }
>   
>   // SAFETY: `Registration` has no fields or methods accessible via `&Registration`, so it is safe to
> @@ -161,13 +171,13 @@ impl<T: RegistrationOps> Registration<T> {
>       /// Creates a new instance of the registration object.
>       pub fn new(name: &'static CStr, module: &'static ThisModule) -> impl PinInit<Self, Error> {
>           try_pin_init!(Self {
> -            reg <- Opaque::try_ffi_init(|ptr: *mut T::RegType| {
> +            reg <- Opaque::try_ffi_init(|ptr: *mut T::DriverType| {
>                   // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
> -                unsafe { ptr.write(T::RegType::default()) };
> +                unsafe { ptr.write(T::DriverType::default()) };
>   
>                   // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write, and it has
>                   // just been initialised above, so it's also valid for read.
> -                let drv = unsafe { &*(ptr as *const Opaque<T::RegType>) };
> +                let drv = unsafe { &*(ptr as *const Opaque<T::DriverType>) };
>   
>                   // SAFETY: `drv` is guaranteed to be pinned until `T::unregister`.
>                   unsafe { T::register(drv, name, module) }
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 35b678b78d91..de35961c6903 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -92,13 +92,17 @@ macro_rules! i2c_device_table {
>   /// An adapter for the registration of I2C drivers.
>   pub struct Adapter<T: Driver>(T);
>   
> -// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// SAFETY:
> +// - `bindings::i2c_driver` is a C type declared as `repr(C)`.
> +unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
> +    type DriverType = bindings::i2c_driver;
> +}
> +
> +// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
>   // a preceding call to `register` has been successful.
>   unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> -    type RegType = bindings::i2c_driver;
> -
>       unsafe fn register(
> -        idrv: &Opaque<Self::RegType>,
> +        idrv: &Opaque<Self::DriverType>,
>           name: &'static CStr,
>           module: &'static ThisModule,
>       ) -> Result {
> @@ -133,12 +137,12 @@ unsafe fn register(
>               (*idrv.get()).driver.acpi_match_table = acpi_table;
>           }
>   
> -        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
> +        // SAFETY: `idrv` is guaranteed to be a valid `DriverType`.
>           to_result(unsafe { bindings::i2c_register_driver(module.0, idrv.get()) })
>       }
>   
> -    unsafe fn unregister(idrv: &Opaque<Self::RegType>) {
> -        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
> +    unsafe fn unregister(idrv: &Opaque<Self::DriverType>) {
> +        // SAFETY: `idrv` is guaranteed to be a valid `DriverType`.
>           unsafe { bindings::i2c_del_driver(idrv.get()) }
>       }
>   }
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 82e128431f08..f58ce35d9c60 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -50,13 +50,17 @@
>   /// An adapter for the registration of PCI drivers.
>   pub struct Adapter<T: Driver>(T);
>   
> -// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// SAFETY:
> +// - `bindings::pci_driver` is a C type declared as `repr(C)`.
> +unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
> +    type DriverType = bindings::pci_driver;
> +}
> +
> +// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
>   // a preceding call to `register` has been successful.
>   unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> -    type RegType = bindings::pci_driver;
> -
>       unsafe fn register(
> -        pdrv: &Opaque<Self::RegType>,
> +        pdrv: &Opaque<Self::DriverType>,
>           name: &'static CStr,
>           module: &'static ThisModule,
>       ) -> Result {
> @@ -68,14 +72,14 @@ unsafe fn register(
>               (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
>           }
>   
> -        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
>           to_result(unsafe {
>               bindings::__pci_register_driver(pdrv.get(), module.0, name.as_char_ptr())
>           })
>       }
>   
> -    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
> -        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +    unsafe fn unregister(pdrv: &Opaque<Self::DriverType>) {
> +        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
>           unsafe { bindings::pci_unregister_driver(pdrv.get()) }
>       }
>   }
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index ed889f079cab..e48d055fdc8a 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -26,13 +26,17 @@
>   /// An adapter for the registration of platform drivers.
>   pub struct Adapter<T: Driver>(T);
>   
> -// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// SAFETY:
> +// - `bindings::platform_driver` is a C type declared as `repr(C)`.
> +unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
> +    type DriverType = bindings::platform_driver;
> +}
> +
> +// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
>   // a preceding call to `register` has been successful.
>   unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> -    type RegType = bindings::platform_driver;
> -
>       unsafe fn register(
> -        pdrv: &Opaque<Self::RegType>,
> +        pdrv: &Opaque<Self::DriverType>,
>           name: &'static CStr,
>           module: &'static ThisModule,
>       ) -> Result {
> @@ -55,12 +59,12 @@ unsafe fn register(
>               (*pdrv.get()).driver.acpi_match_table = acpi_table;
>           }
>   
> -        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
>           to_result(unsafe { bindings::__platform_driver_register(pdrv.get(), module.0) })
>       }
>   
> -    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
> -        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +    unsafe fn unregister(pdrv: &Opaque<Self::DriverType>) {
> +        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
>           unsafe { bindings::platform_driver_unregister(pdrv.get()) };
>       }
>   }
> diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
> index d10b65e9fb6a..32f4b2d55dfb 100644
> --- a/rust/kernel/usb.rs
> +++ b/rust/kernel/usb.rs
> @@ -27,13 +27,17 @@
>   /// An adapter for the registration of USB drivers.
>   pub struct Adapter<T: Driver>(T);
>   
> -// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// SAFETY:
> +// - `bindings::usb_driver` is a C type declared as `repr(C)`.
> +unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
> +    type DriverType = bindings::usb_driver;
> +}
> +
> +// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
>   // a preceding call to `register` has been successful.
>   unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> -    type RegType = bindings::usb_driver;
> -
>       unsafe fn register(
> -        udrv: &Opaque<Self::RegType>,
> +        udrv: &Opaque<Self::DriverType>,
>           name: &'static CStr,
>           module: &'static ThisModule,
>       ) -> Result {
> @@ -45,14 +49,14 @@ unsafe fn register(
>               (*udrv.get()).id_table = T::ID_TABLE.as_ptr();
>           }
>   
> -        // SAFETY: `udrv` is guaranteed to be a valid `RegType`.
> +        // SAFETY: `udrv` is guaranteed to be a valid `DriverType`.
>           to_result(unsafe {
>               bindings::usb_register_driver(udrv.get(), module.0, name.as_char_ptr())
>           })
>       }
>   
> -    unsafe fn unregister(udrv: &Opaque<Self::RegType>) {
> -        // SAFETY: `udrv` is guaranteed to be a valid `RegType`.
> +    unsafe fn unregister(udrv: &Opaque<Self::DriverType>) {
> +        // SAFETY: `udrv` is guaranteed to be a valid `DriverType`.
>           unsafe { bindings::usb_deregister(udrv.get()) };
>       }
>   }

Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>

Cheers
Igor

