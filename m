Return-Path: <linux-i2c+bounces-8642-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E49F7EB6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 17:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 064B17A3753
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 16:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F52D22688E;
	Thu, 19 Dec 2024 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntYaN73j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984F226194;
	Thu, 19 Dec 2024 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624038; cv=none; b=EHIubPfTc8zURJsXnCOcLMEWbf5WkrYTXeLk0RBuSnhUScqf2a9VrXZ6CJvCuY5u4LjdZ4DIEvOzOAaimWoJu/6a66OYFT/I+oBCxQFeU6h5TzZsjbxM2npa42SLn8GdlmjmRaZws/uQEHA/67wAtOBVYaEWDXcp0yHZYOQmuo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624038; c=relaxed/simple;
	bh=0QM2ti8i9s871qi0x4KwwxP8Df8XTk98Rm6A8u6ePfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0sCQFlQCkhnUofBYUSoxSJYg2D9BF13qPctKD0ze842fpXk0Gm8FEHVHcmsCVKDV3w8B40wk2pEP+oHs4qwiQTcbRksSIPu7rfXjNltqpm/BW9Y33I3Szb1f/mJ3avthJjU26QAtAaRGa/f63j2lF+h20N4UhToajhcebr5znk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntYaN73j; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa670ffe302so181256966b.2;
        Thu, 19 Dec 2024 08:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734624033; x=1735228833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZSF5Ysxh6AQqhA1lxPBEzFa3Vv/6I7Dne2knacYfHQ=;
        b=ntYaN73jpQBy+ZbcST/yyoBIh6BStxr9z2gGUDkGsqYWse9pY6kLdf62T+8A1Ayow+
         cz0E3P6oq2tVTsBBH2kYf1iF3WK9ElMHMm0ZUQoBg4hm1P81UB5DoEmfiu7kdguUmocf
         l5HDmyWYrTaLpnb1zfPMCxYq+MxiGgN6htXOFGALyjaOfQHj/zHCispZMj45gVaR02s1
         3RsztI4QvvSphWKtZFw3njDxyQTttetMXVJYwIa7hLBnq2N0q1rUQE5iBw9ps7h8T6Pw
         S6aChtx6Xl5rFL7IS+0730GaYSyCVYv0IP5Pks5+D4phtmeYofjXnRNE0CYP1xOZWMDU
         0J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624033; x=1735228833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZSF5Ysxh6AQqhA1lxPBEzFa3Vv/6I7Dne2knacYfHQ=;
        b=lJw5CuiQs2OM6tDhTP4Yz1uJHeXAec99IFyjDYZCGma0RUPdpB362TF1tUCLSyGHi+
         H5DuGhX/5nDGLpPWjkkiG9AKT1HMLZdBZshBzr3tulyRRoXVUZpVVavp+O/rYoHV7MwP
         iykdmVhV4dwMPliAUm2s8wZb1XB5Ztz1xxQKrdegwaSmosP1gzTqxN4uEQc76F/rIFlg
         9Mb4TumY9ahNsA0f+O4rYxG+oGzVF55/QdudKintHA1uSt7zrnYExTqRtafmwVj7nWZb
         OhNHLxZuoiuA6lQi+N/D50mCJ4LNt7NUfq4jGLRm0klnidPTrUnAeginwhB669WcE5+1
         j8yA==
X-Forwarded-Encrypted: i=1; AJvYcCWV0vCLbOs7kJBS5rRlE9csz7gH7ijc7hIFGmyf8cZK9kKQoH0COeyTKof9RA+a+SFMBeYcxHzXYFi4MqWRBIc=@vger.kernel.org, AJvYcCWcyxBwg/SPui3WWP3vGYrO/5bCbI08CrG9LFEtTivzN7Q3LxLIBBYntRXkQ7625albp5C4154T9UJS@vger.kernel.org, AJvYcCWtNX8WBglzH5MsR4GePQ43yc3G6cErAYSl12Ihu2Gu3ubOx5wxh7rgzvsTq5joGk0EylRv5Vqd3iy2C/t4vQ==@vger.kernel.org, AJvYcCXXTCPWVzA1iGS6sl/aw0BphLOkrTG6i3y15CpCgTgdbzxY5xIlTEb26n9Leizp+8C+bUCrLQ18DY1IADR5@vger.kernel.org, AJvYcCXn5JnjMB+7QJla7LWJ16bjDhXI5016VxSiXGzwhVkc7gm2RWuU/x1EzPWXliN9lCrVb9hM/E56uSLa@vger.kernel.org
X-Gm-Message-State: AOJu0YxlLHjkAPKwm0i3Em88/H3eGzcyAvOuKu9dZeIiX0m5sT3jjaPs
	iamFKDjx7Aypmm6+NTh67g2D3/Mxnd+kvZ3x0priMWaKNnOf5gYTWs8UzQ6+jLrEk4F8ZLIXGCU
	ylgqLF3KSwOBe3N/NFy9ZUl0Ncb4=
X-Gm-Gg: ASbGncs11hP2JuWfHMOUnboqyHmJNoRcqs6Zonws3C4IrxGg2Ga/ara8DfbNEK34bg5
	c0kOySTYNSd2/KMSF5V4gBPYnhMX9t9e0yF1IlYhhbTWa7dvui2eThIyEHIs49C4Y9tpmGg==
X-Google-Smtp-Source: AGHT+IFYDL/9C4e5CUzxDL/No54s0+NFqF5OPjvIwwjBIGiy6wBvLb6HqZ4Oy+HTJ7tP68ZVwv/vffdGlt2qZO2lRHk=
X-Received: by 2002:a17:907:9557:b0:aa6:7c8e:8085 with SMTP id
 a640c23a62f3a-aabf474a2b4mr597203366b.15.1734624031826; Thu, 19 Dec 2024
 08:00:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com> <20241218-ncv6336-v1-5-b8d973747f7a@gmail.com>
 <Z2P00_DCL5H6Zwor@pollux.localdomain>
In-Reply-To: <Z2P00_DCL5H6Zwor@pollux.localdomain>
From: Fabien Parent <parent.f@gmail.com>
Date: Thu, 19 Dec 2024 08:00:20 -0800
Message-ID: <CAL6vTrgmL9GUbS5RpTgAKSHy=tN6EO+BusEPvmxxhstiwmRJ8g@mail.gmail.com>
Subject: Re: [PATCH 5/9] rust: regulator: add Regulator Driver abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	vinod.koul@linaro.org, Fabien Parent <fabien.parent@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 2:26=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Dec 18, 2024 at 03:36:35PM -0800, Fabien Parent wrote:
> > From: Fabien Parent <fabien.parent@linaro.org>
> >
> > This commit adds a Rust abstraction to write Regulator drivers. Only
> > the features used by the NCV6336 driver were added to this abstraction.
> >
> > Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> > ---
> >  MAINTAINERS                     |   1 +
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/regulator.rs        |   4 +-
> >  rust/kernel/regulator/driver.rs | 850 ++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 855 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 90c231f0aa7381aa8d206fb94c5d1f013dfcae41..87da43251bf0f20d2b58313=
45778ead592c407dc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25160,6 +25160,7 @@ F:    drivers/regulator/
> >  F:   include/dt-bindings/regulator/
> >  F:   include/linux/regulator/
> >  F:   rust/kernel/regulator.rs
> > +F:   rust/kernel/regulator/
> >  K:   regulator_get_optional
> >
> >  VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> > index b18d772bc3a0e78d749cc9e5ae81a4237a57f8c5..124129daea73c143c919d05=
814fc02bb4460ddfd 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -30,6 +30,7 @@
> >  #include <linux/refcount.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/regulator/driver.h>
> >  #include <linux/sched.h>
> >  #include <linux/security.h>
> >  #include <linux/slab.h>
> > diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> > index d695ac955193efcfda62770784a92d70d606b93d..bd8202fe5702b944201e765=
53b9496e1d42cb429 100644
> > --- a/rust/kernel/regulator.rs
> > +++ b/rust/kernel/regulator.rs
> > @@ -2,12 +2,14 @@
> >
> >  //! SoC Regulators
>
> Why "SoC", could be a regulator for anything else too, right?

I used "SoC" to match the C headers "include/linux/regulator/driver.h"
and "include/linux/regulator/consumer.h". But as you
mention this, I just noticed that "SoC" is nowhere to be found in
Documentation/driver-api/regulator.rst, so maybe I should
indeed remove it.

>
> >
> > +pub mod driver;
> > +
> >  use crate::{
> >      bindings,
> >      error::{code::*, Error, Result},
> >  };
> >
> > -/// Regulators operating modes
> > +/// [`driver::Device`] operating modes
> >  #[derive(Copy, Clone)]
> >  #[repr(u32)]
> >  pub enum Mode {
> > diff --git a/rust/kernel/regulator/driver.rs b/rust/kernel/regulator/dr=
iver.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8079ea28fd5bf7b6871a0b1=
d2cea7a6fffcb43ca
> > --- /dev/null
> > +++ b/rust/kernel/regulator/driver.rs
> > @@ -0,0 +1,850 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! SoC Device Driver Interface
>
> Should rather be "Regulator Device Driver Interface".
>
> > +//!
> > +//! C header: [`include/linux/regulator/driver.h`](srctree/include/lin=
ux/regulator/driver.h)
> > +//!
> > +//! # Examples
> > +//!
> > +//! ```
> > +//! use kernel::regulator::driver::{Config, Desc, Device, Driver, Type=
};
> > +//!
> > +//! static DESC: Desc =3D
> > +//!     Desc::new::<MyDeviceDriver>(kernel::c_str!("my-regulator-drive=
r"), Type::Voltage);
> > +//!
> > +//! struct MyDeviceDriver;
> > +//!
> > +//! #[vtable]
> > +//! impl Driver for MyDeviceDriver {
>
> I usually prefer to keep the module prefix for the `Driver` traits, i.e.
> `impl regulator::Driver for ...`, this makes things a bit more obvious.
>
> > +//!     type Data =3D ();
> > +//!
> > +//!     // Implement supported `Driver`'s operations here.
> > +//!
> > +//!     // Example:
> > +//!     fn is_enabled(reg: &mut Device<Self::Data>) -> Result<bool> {
> > +//!         Ok(true)
> > +//!     }
> > +//! }
> > +//!
> > +//! impl MyDeviceDriver {
> > +//!     fn probe(dev: &mut kernel::device::Device) {
> > +//!         let _ =3D Device::register(dev, &DESC, Config::<<Self as D=
river>::Data>::new(dev, ()));
>
> Like below, this is confusing, the device is immediately unregistered aga=
in.
>
> > +//!     }
> > +//! }
> > +//! ```
> > +
> > +use crate::{
> > +    device,
> > +    error::{code::*, from_err_ptr, from_result, Error, Result},
> > +    macros::vtable,
> > +    regulator::Mode,
> > +    str::CStr,
> > +    types::ForeignOwnable,
> > +    ThisModule,
> > +};
> > +use core::{marker::PhantomData, mem::ManuallyDrop, ptr::NonNull};
> > +
> > +/// [`Device`]'s status
> > +#[derive(Eq, PartialEq)]
> > +pub enum Status {
> > +    /// Device is off
> > +    Off,
> > +    /// Device is on
> > +    On,
> > +    /// Device is in an error state
> > +    Error,
> > +    /// Device is on and in Fast mode
> > +    Fast,
> > +    /// Device is on and in Normal mode
> > +    Normal,
> > +    /// Device is on and in Idle mode
> > +    Idle,
> > +    /// Device is on and in Standby mode
> > +    Standby,
> > +    /// Device is enabled but not regulating
> > +    Bypass,
> > +    /// Device is any other status
> > +    Undefined,
> > +}
> > +
> > +impl TryFrom<core::ffi::c_uint> for Status {
> > +    type Error =3D Error;
> > +
> > +    fn try_from(status: core::ffi::c_uint) -> Result<Self> {
> > +        match status {
> > +            bindings::regulator_status_REGULATOR_STATUS_OFF =3D> Ok(Se=
lf::Off),
> > +            bindings::regulator_status_REGULATOR_STATUS_ON =3D> Ok(Sel=
f::On),
> > +            bindings::regulator_status_REGULATOR_STATUS_ERROR =3D> Ok(=
Self::Error),
> > +            bindings::regulator_status_REGULATOR_STATUS_FAST =3D> Ok(S=
elf::Fast),
> > +            bindings::regulator_status_REGULATOR_STATUS_NORMAL =3D> Ok=
(Self::Normal),
> > +            bindings::regulator_status_REGULATOR_STATUS_IDLE =3D> Ok(S=
elf::Idle),
> > +            bindings::regulator_status_REGULATOR_STATUS_STANDBY =3D> O=
k(Self::Standby),
> > +            bindings::regulator_status_REGULATOR_STATUS_BYPASS =3D> Ok=
(Self::Bypass),
> > +            bindings::regulator_status_REGULATOR_STATUS_UNDEFINED =3D>=
 Ok(Self::Undefined),
> > +            _ =3D> Err(EINVAL),
> > +        }
> > +    }
> > +}
> > +
> > +impl From<Mode> for Status {
> > +    fn from(mode: Mode) -> Self {
> > +        // SAFETY: `regulator_mode_to_status` is a `pure function` tha=
t is only doing integer
> > +        // to integer conversion, hence this function call is safe.
> > +        let status =3D unsafe { bindings::regulator_mode_to_status(mod=
e as _) };
> > +
> > +        if status < 0 {
> > +            Self::Undefined
> > +        } else {
> > +            Self::try_from(status as core::ffi::c_uint).unwrap_or(Self=
::Undefined)
> > +        }
> > +    }
> > +}
> > +
> > +/// [`Device`]'s operations
> > +#[vtable]
> > +pub trait Driver {
> > +    /// User data that will be accessible to all operations
> > +    type Data: ForeignOwnable + Send + Sync;
> > +
> > +    /// Return one of the supported voltages, in microvolt; zero if th=
e selector indicates a
> > +    /// voltage that is unusable by the system; or negative errno. Sel=
ectors range from zero to one
> > +    /// less than the number of voltages supported by the system.
> > +    fn list_voltage(_rdev: &mut Device<Self::Data>, _selector: u32) ->=
 Result<i32> {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Set the voltage for the regulator within the range specified. =
The driver should select the
> > +    /// voltage closest to `min_uv`.
> > +    fn set_voltage(_rdev: &mut Device<Self::Data>, _min_uv: i32, _max_=
uv: i32) -> Result<i32> {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Set the voltage for the regulator using the specified selector=
.
> > +    fn set_voltage_sel(_rdev: &mut Device<Self::Data>, _selector: u32)=
 -> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Convert a voltage into a selector.
> > +    fn map_voltage(_rdev: &mut Device<Self::Data>, _min_uv: i32, _max_=
uv: i32) -> Result<i32> {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Get the currently configured voltage for the regulator; Return=
s
> > +    /// [`ENOTRECOVERABLE`] if the regulator can't be read at bootup a=
nd hasn't been
> > +    /// set yet.
> > +    fn get_voltage(_rdev: &mut Device<Self::Data>) -> Result<i32> {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Get the currently configured voltage selector for the regulato=
r; Returns
> > +    /// [`ENOTRECOVERABLE`] if the regulator can't be read at bootup a=
nd hasn't been
> > +    /// set yet.
> > +    fn get_voltage_sel(_rdev: &mut Device<Self::Data>) -> Result<i32> =
{
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Configure a limit for a current-limited regulator.
> > +    ///
> > +    /// The driver should select the current closest to `max_ua`.
> > +    fn set_current_limit(_rdev: &mut Device<Self::Data>, _min_ua: i32,=
 _max_ua: i32) -> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Get the configured limit for a current-limited regulator.
> > +    fn get_current_limit(_rdev: &mut Device<Self::Data>) -> Result<i32=
> {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Enable or disable the active discharge of the regulator.
> > +    fn set_active_discharge(_rdev: &mut Device<Self::Data>, _enable: b=
ool) -> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Configure the regulator as enabled.
> > +    fn enable(_rdev: &mut Device<Self::Data>) -> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Configure the regulator as disabled.
> > +    fn disable(_rdev: &mut Device<Self::Data>) -> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Returns enablement state of the regulator.
> > +    fn is_enabled(_rdev: &mut Device<Self::Data>) -> Result<bool> {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Set the configured operating [`Mode`] for the regulator.
> > +    fn set_mode(_rdev: &mut Device<Self::Data>, _mode: Mode) -> Result=
 {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Get the configured operating [`Mode`] for the regulator.
> > +    fn get_mode(_rdev: &mut Device<Self::Data>) -> Mode {
> > +        Mode::Invalid
> > +    }
> > +
> > +    /// Report the regulator [`Status`].
> > +    fn get_status(_rdev: &mut Device<Self::Data>) -> Result<Status> {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Set the voltage for the regaultor when the system is suspended=
.
> > +    fn set_suspend_voltage(_rdev: &mut Device<Self::Data>, _uv: i32) -=
> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Mark the regulator as enabled when the system is suspended.
> > +    fn set_suspend_enable(_rdev: &mut Device<Self::Data>) -> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Mark the regulator as disabled when the system is suspended.
> > +    fn set_suspend_disable(_rdev: &mut Device<Self::Data>) -> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +
> > +    /// Set the operating mode for the regulator when the system is su=
spended.
> > +    fn set_suspend_mode(_rdev: &mut Device<Self::Data>, _mode: Mode) -=
> Result {
> > +        Err(ENOTSUPP)
> > +    }
> > +}
> > +
> > +/// [`Device`]'s descriptor
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::{
> > +///     c_str,
> > +///     device,
> > +///     regulator::driver::{Config, Desc, Device, Driver, Type},
> > +///     types::ForeignOwnable,
> > +/// };
> > +///
> > +/// struct MyDeviceDriver;
> > +///
> > +/// #[vtable]
> > +/// impl Driver for MyDeviceDriver {
> > +///     type Data =3D ();
> > +/// }
>
> This seems incomplete.
>
> > +///
> > +/// static BUCK_DESC: Desc =3D Desc::new::<MyDeviceDriver>(c_str!("my_=
driver"), Type::Voltage)
> > +///     .with_of_match(c_str!("buck"))
> > +///     .with_enable(0x24, 0x1, 0x1, 0);
> > +///
> > +/// fn example(dev: &mut device::Device, mut config: Config<<MyDeviceD=
river as Driver>::Data>) {
> > +///     let _ =3D Device::register(dev, &BUCK_DESC, config);
> > +/// }
>
> `example`? This should be within a driver trait with `probe` instead.
>
> > +/// ```
> > +///
> > +/// # Invariants
> > +///
> > +/// `self.0` has always valid data.
> > +pub struct Desc(bindings::regulator_desc);
>
> I think this needs `#[repr(transparent)]`.
>
> > +impl Desc {
> > +    /// Create a new [`Device`] descriptor
> > +    pub const fn new<T: Driver>(name: &'static CStr, reg_type: Type) -=
> Self {
> > +        // SAFETY: `bindings::regulator_desc" is safe to initialize wi=
th 0s.
> > +        let mut desc: bindings::regulator_desc =3D unsafe { core::mem:=
:zeroed() };
> > +        desc.name =3D name.as_char_ptr();
> > +        desc.type_ =3D match reg_type {
> > +            Type::Voltage =3D> bindings::regulator_type_REGULATOR_VOLT=
AGE,
> > +            Type::Current =3D> bindings::regulator_type_REGULATOR_CURR=
ENT,
> > +        };
> > +        desc.ops =3D Adapter::<T>::build();
> > +        Self(desc)
> > +    }
> > +
> > +    /// Setup the register address, mask, and {en,dis}able values
> > +    pub const fn with_enable(mut self, reg: u32, mask: u32, en_val: u3=
2, dis_val: u32) -> Self {
> > +        self.0.enable_reg =3D reg;
> > +        self.0.enable_mask =3D mask;
> > +        self.0.enable_val =3D en_val;
> > +        self.0.disable_val =3D dis_val;
> > +        self
> > +    }
> > +
> > +    /// Setup the register address, mask, and {en,dis}able values. {En=
,Dis}able values are
> > +    /// inverted, i.e. `dis_val` will be use to enable the regulator w=
hile `en_val` will be used
> > +    /// to disable the regulator.
> > +    pub const fn with_inverted_enable(
> > +        mut self,
> > +        reg: u32,
> > +        mask: u32,
> > +        en_val: u32,
> > +        dis_val: u32,
> > +    ) -> Self {
> > +        self.0.enable_is_inverted =3D true;
> > +        self.with_enable(reg, mask, en_val, dis_val)
> > +    }
> > +
> > +    /// Setup the active discharge regiter address, mask, on/off value=
s.
> > +    pub const fn with_active_discharge(mut self, reg: u32, mask: u32, =
on: u32, off: u32) -> Self {
> > +        self.0.active_discharge_on =3D on;
> > +        self.0.active_discharge_off =3D off;
> > +        self.0.active_discharge_reg =3D reg;
> > +        self.0.active_discharge_mask =3D mask;
> > +        self
> > +    }
> > +
> > +    /// Setup the current selection register address, mask, and curren=
t table
> > +    pub const fn with_csel(mut self, reg: u32, mask: u32, table: &'sta=
tic [u32]) -> Self {
> > +        self.0.csel_reg =3D reg;
> > +        self.0.csel_mask =3D mask;
> > +        self.0.curr_table =3D table.as_ptr();
> > +        self
> > +    }
> > +
> > +    /// Voltages are a linear mapping
> > +    pub const fn with_linear_mapping(
> > +        mut self,
> > +        reg: u32,
> > +        mask: u32,
> > +        min_uv: u32,
> > +        uv_step: u32,
> > +        n_voltages: u32,
> > +        linear_min_sel: u32,
> > +    ) -> Self {
> > +        self.0.vsel_reg =3D reg;
> > +        self.0.vsel_mask =3D mask;
> > +        self.0.n_voltages =3D n_voltages;
> > +        self.0.min_uV =3D min_uv;
> > +        self.0.uV_step =3D uv_step;
> > +        self.0.linear_min_sel =3D linear_min_sel;
> > +        self
> > +    }
> > +
> > +    /// Set the regulator owner
> > +    pub const fn with_owner(mut self, owner: &'static ThisModule) -> S=
elf {
> > +        self.0.owner =3D owner.as_ptr();
> > +        self
> > +    }
> > +
> > +    /// Set the name used to identify the regulator in the DT.
> > +    pub const fn with_of_match(mut self, of_match: &'static CStr) -> S=
elf {
> > +        self.0.of_match =3D of_match.as_char_ptr();
> > +        self
> > +    }
> > +}
> > +
> > +// SAFETY: `Desc` cannot be modified after its declaration and owns it=
s data, hence it is safe
> > +// to share references between threads.
> > +unsafe impl Sync for Desc {}
> > +
> > +/// [`Device`]'s Config
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::regulator::driver::Config;
> > +/// # use kernel::regulator::driver::{Desc, Device};
> > +/// # use kernel::{device, sync::Arc};
> > +///
> > +/// struct DriverData(u32);
> > +///
> > +/// # fn probe(dev: &device::Device, desc: &'static Desc) -> Result {
> > +/// let config =3D Config::<Arc<DriverData>>::new(dev, Arc::new(Driver=
Data(128), GFP_KERNEL)?);
>
> Why does this need reference counting?
>
> > +/// let reg =3D Device::register(dev, desc, config)?;
> > +/// #     Ok(())
> > +/// # }
>
> I think this example is a bit misleading, the regulator device is immedia=
tely
> unregistered after probe() returns.
>
> Here you have to rely on the driver to keep `reg` alive until the device =
is
> dropped. Instead you can use `Devres::new_foreign_owned`, like I do in [1=
].
>
> [1] https://cgit.freedesktop.org/drm/drm-misc/tree/rust/kernel/drm/drv.rs=
?h=3Dtopic/rust-drm#n173
>
> > +/// ```
> > +///
> > +/// # Invariants
> > +///
> > +/// `self.cfg` always hold valid data.
> > +pub struct Config<T: ForeignOwnable + Send + Sync =3D ()> {
> > +    cfg: bindings::regulator_config,
> > +    data: T,
> > +}
> > +
> > +impl<T: ForeignOwnable + Send + Sync> Config<T> {
> > +    /// Create a [`Device`] config.
> > +    pub fn new(dev: &device::Device, data: T) -> Self {
> > +        Self {
> > +            cfg: bindings::regulator_config {
> > +                dev: dev.as_raw(),
> > +                ..Default::default()
> > +            },
> > +            data,
> > +        }
> > +    }
> > +}
> > +
> > +/// Regulator device
> > +///
> > +/// Abstraction for `struct regulator_dev`.
> > +///
> > +/// # Invariants
> > +///
> > +/// * `self.rdev` is valid and non-null.
> > +/// * [`Self`] has owns `self.rdev` memory allocation.
> > +/// * [`Self`] has owns memory of type `T` that can be retrieved throu=
gh `rdev_get_drvdata`.
> > +pub struct Device<T: ForeignOwnable + Send + Sync> {
> > +    rdev: NonNull<bindings::regulator_dev>,
> > +    _data_type: PhantomData<T>,
> > +}
>
> I think you should split this into a `regulator::Device` and a
> `regulator::Registration` structure instead. For regulator this seems to =
works
> as well, but it gets confusing if we do not stick to the same representat=
ions
> between subsystems.
>
> > +
> > +impl<T: ForeignOwnable + Send + Sync> Device<T> {
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be valid and non-null.
> > +    unsafe fn from_raw(rdev: *mut bindings::regulator_dev) -> Manually=
Drop<Self> {
> > +        ManuallyDrop::new(Self {
> > +            // SAFETY: The caller of `Self::from_raw` must garantee th=
at `rdev` is non-null and
> > +            // valid..
> > +            rdev: unsafe { NonNull::new_unchecked(rdev) },
> > +            _data_type: PhantomData::<T>,
> > +        })
> > +    }
> > +
> > +    /// register a Regulator driver
> > +    pub fn register(
> > +        dev: &device::Device,
> > +        desc: &'static Desc,
> > +        mut config: Config<T>,
> > +    ) -> Result<Self> {
> > +        config.cfg.driver_data =3D config.data.into_foreign() as _;
> > +
> > +        // SAFETY: By the type invariants, we know that `dev.as_ref().=
as_raw()` is always
> > +        // valid and non-null, and the descriptor and config are guara=
nteed to be valid values,
> > +        // hence it is safe to perform the FFI call.
> > +        let rdev =3D from_err_ptr(unsafe {
> > +            bindings::regulator_register(dev.as_raw(), &desc.0, &confi=
g.cfg)
> > +        })?;
> > +
> > +        Ok(Self {
> > +            rdev: NonNull::new(rdev).ok_or(EINVAL)?,
> > +            _data_type: PhantomData::<T>,
> > +        })
> > +    }
> > +
> > +    /// List voltages when the regulator is using linear mapping
> > +    pub fn list_voltage_linear(&self, selector: u32) -> Result<i32> {
> > +        // SAFETY: By the type invariants, we know that `self.rdev` is=
 always valid and non-null.
> > +        // The C function is safe to call with any selector values.
> > +        let ret =3D unsafe { bindings::regulator_list_voltage_linear(s=
elf.rdev.as_ptr(), selector) };
> > +        if ret < 0 {
> > +            return Err(Error::from_errno(ret));
> > +        }
> > +        Ok(ret)
> > +    }
> > +
> > +    /// Get regulator's name
> > +    pub fn get_name(&self) -> &'static CStr {
> > +        // SAFETY: By the type invariants, we know that `self.rdev` is=
 always valid and non-null.
> > +        // The C function is guaranteed to return a valid string.
> > +        unsafe { CStr::from_char_ptr(bindings::rdev_get_name(self.rdev=
.as_ptr())) }
> > +    }
> > +
> > +    /// Get regulator's ID
> > +    pub fn get_id(&self) -> i32 {
> > +        // SAFETY: By the type invariants, we know that `self.rdev` is=
 always valid and non-null.
> > +        unsafe { bindings::rdev_get_id(self.rdev.as_ptr()) }
> > +    }
> > +
> > +    /// Retrieve driver data associated to `self`
> > +    pub fn data(&self) -> T::Borrowed<'_> {
> > +        // SAFETY: By the type invariants, we know that `self.rdev` is=
 always valid and non-null.
> > +        unsafe { T::borrow(bindings::rdev_get_drvdata(self.rdev.as_ptr=
())) }
> > +    }
> > +}
> > +
> > +impl<T: ForeignOwnable + Send + Sync> Drop for Device<T> {
> > +    fn drop(&mut self) {
> > +        // SAFETY: The type invariants guarantee that `self.rdev` is v=
alid and non-null,
> > +        // so it is safe to perform the FFI call.
> > +        unsafe { bindings::regulator_unregister(self.rdev.as_ptr()) };
> > +
> > +        // SAFETY: The type invariants garuantee that `self.rdev` is v=
alid and non-null, and
> > +        // that `rdev_get_drvdata` is valid memory of type `T` stored =
there by calling
> > +        // `T::into_foreign`.
> > +        unsafe { T::from_foreign(bindings::rdev_get_drvdata(self.rdev.=
as_ptr())) };
> > +    }
> > +}
> > +
> > +// SAFETY: `Device` has sole ownership of `self.rdev` and is never rea=
d outside of the C
> > +// implementation. It is safe to use it from any thread.
> > +unsafe impl<T: ForeignOwnable + Send + Sync> Send for Device<T> {}
> > +
> > +// SAFETY: It is OK to access `Device` through shared references from =
other threads because
> > +// the C code is insuring proper synchronization of `self.rdev`.
> > +unsafe impl<T: ForeignOwnable + Send + Sync> Sync for Device<T> {}
> > +
> > +/// [`Device`] type
> > +pub enum Type {
> > +    /// Voltage regulator
> > +    Voltage,
> > +    /// Current regulator
> > +    Current,
> > +}
> > +
> > +pub(crate) struct Adapter<T>(PhantomData<T>);
> > +
> > +impl<T: Driver> Adapter<T> {
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn list_voltage_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        selector: core::ffi::c_uint,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| T::list_voltage(&mut rdev, selector))
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` and `selector` must be non-null and valid.
> > +    unsafe extern "C" fn set_voltage_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        min_uv: core::ffi::c_int,
> > +        max_uv: core::ffi::c_int,
> > +        selector: *mut core::ffi::c_uint,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        match T::set_voltage(&mut rdev, min_uv, max_uv) {
> > +            Ok(v) =3D> {
> > +                // SAFETY: Per this function safety requirements, `rde=
v` is non-null and valid.
> > +                unsafe { *selector =3D v as _ };
> > +                0
> > +            }
> > +            Err(e) =3D> e.to_errno(),
> > +        }
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn map_voltage_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        min_uv: core::ffi::c_int,
> > +        max_uv: core::ffi::c_int,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| T::map_voltage(&mut rdev, min_uv, max_uv))
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_voltage_sel_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        selector: core::ffi::c_uint,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::set_voltage_sel(&mut rdev, selector)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn get_voltage_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| T::get_voltage(&mut rdev))
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn get_voltage_sel_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| T::get_voltage_sel(&mut rdev))
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_current_limit_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        min_ua: core::ffi::c_int,
> > +        max_ua: core::ffi::c_int,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::set_current_limit(&mut rdev, min_ua, max_ua)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn get_current_limit_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| T::get_current_limit(&mut rdev))
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_active_discharge_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        enable: bool,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::set_active_discharge(&mut rdev, enable)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn enable_callback(rdev: *mut bindings::regulato=
r_dev) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::enable(&mut rdev)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn disable_callback(rdev: *mut bindings::regulat=
or_dev) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::disable(&mut rdev)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn is_enabled_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::is_enabled(&mut rdev)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_mode_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        mode: core::ffi::c_uint,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            let mode =3D Mode::try_from(mode).unwrap_or(Mode::Invalid)=
;
> > +            T::set_mode(&mut rdev, mode)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn get_mode_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_uint {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        T::get_mode(&mut rdev) as _
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn get_status_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| Ok(T::get_status(&mut rdev)? as _))
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_suspend_voltage_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        uv: core::ffi::c_int,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::set_suspend_voltage(&mut rdev, uv)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_suspend_enable_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::set_suspend_enable(&mut rdev)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_suspend_disable_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            T::set_suspend_disable(&mut rdev)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    /// # Safety
> > +    ///
> > +    /// `rdev` must be non-null and valid.
> > +    unsafe extern "C" fn set_suspend_mode_callback(
> > +        rdev: *mut bindings::regulator_dev,
> > +        mode: core::ffi::c_uint,
> > +    ) -> core::ffi::c_int {
> > +        // SAFETY: Per this function safety requirements, `rdev` is no=
n-null and valid.
> > +        let mut rdev =3D unsafe { Device::from_raw(rdev) };
> > +        from_result(|| {
> > +            let mode =3D Mode::try_from(mode).unwrap_or(Mode::Invalid)=
;
> > +            T::set_suspend_mode(&mut rdev, mode)?;
> > +            Ok(0)
> > +        })
> > +    }
> > +
> > +    const VTABLE: bindings::regulator_ops =3D bindings::regulator_ops =
{
> > +        list_voltage: if T::HAS_LIST_VOLTAGE {
> > +            Some(Adapter::<T>::list_voltage_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_voltage: if T::HAS_SET_VOLTAGE {
> > +            Some(Adapter::<T>::set_voltage_callback)
> > +        } else {
> > +            None
> > +        },
> > +        map_voltage: if T::HAS_MAP_VOLTAGE {
> > +            Some(Adapter::<T>::map_voltage_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_voltage_sel: if T::HAS_SET_VOLTAGE_SEL {
> > +            Some(Adapter::<T>::set_voltage_sel_callback)
> > +        } else {
> > +            None
> > +        },
> > +        get_voltage: if T::HAS_GET_VOLTAGE {
> > +            Some(Adapter::<T>::get_voltage_callback)
> > +        } else {
> > +            None
> > +        },
> > +        get_voltage_sel: if T::HAS_GET_VOLTAGE_SEL {
> > +            Some(Adapter::<T>::get_voltage_sel_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_current_limit: if T::HAS_SET_CURRENT_LIMIT {
> > +            Some(Adapter::<T>::set_current_limit_callback)
> > +        } else {
> > +            None
> > +        },
> > +        get_current_limit: if T::HAS_GET_CURRENT_LIMIT {
> > +            Some(Adapter::<T>::get_current_limit_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_active_discharge: if T::HAS_SET_ACTIVE_DISCHARGE {
> > +            Some(Adapter::<T>::set_active_discharge_callback)
> > +        } else {
> > +            None
> > +        },
> > +        enable: if T::HAS_ENABLE {
> > +            Some(Adapter::<T>::enable_callback)
> > +        } else {
> > +            None
> > +        },
> > +        disable: if T::HAS_DISABLE {
> > +            Some(Adapter::<T>::disable_callback)
> > +        } else {
> > +            None
> > +        },
> > +        is_enabled: if T::HAS_IS_ENABLED {
> > +            Some(Adapter::<T>::is_enabled_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_mode: if T::HAS_SET_MODE {
> > +            Some(Adapter::<T>::set_mode_callback)
> > +        } else {
> > +            None
> > +        },
> > +        get_mode: if T::HAS_GET_MODE {
> > +            Some(Adapter::<T>::get_mode_callback)
> > +        } else {
> > +            None
> > +        },
> > +        get_status: if T::HAS_GET_STATUS {
> > +            Some(Adapter::<T>::get_status_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_suspend_voltage: if T::HAS_SET_SUSPEND_VOLTAGE {
> > +            Some(Adapter::<T>::set_suspend_voltage_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_suspend_enable: if T::HAS_SET_SUSPEND_ENABLE {
> > +            Some(Adapter::<T>::set_suspend_enable_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_suspend_disable: if T::HAS_SET_SUSPEND_DISABLE {
> > +            Some(Adapter::<T>::set_suspend_disable_callback)
> > +        } else {
> > +            None
> > +        },
> > +        set_suspend_mode: if T::HAS_SET_SUSPEND_MODE {
> > +            Some(Adapter::<T>::set_suspend_mode_callback)
> > +        } else {
> > +            None
> > +        },
> > +        // SAFETY: The rest is zeroed out to initialize `struct regula=
tor_ops`,
> > +        // sets `Option<&F>` to be `None`.
> > +        ..unsafe { core::mem::zeroed() }
> > +    };
> > +
> > +    const fn build() -> &'static bindings::regulator_ops {
> > +        &Self::VTABLE
> > +    }
> > +}
> >
> > --
> > 2.45.2
> >
> >

