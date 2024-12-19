Return-Path: <linux-i2c+bounces-8641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D35959F7E22
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 16:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FC111887E99
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 15:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02A7154C04;
	Thu, 19 Dec 2024 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsvrVD8s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EF286348;
	Thu, 19 Dec 2024 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734622414; cv=none; b=D3oi8gWHBuR6bCzNX/TVEqbNKHWLVK2aTCc/ju0hUobCdV/OScTYYLDLZr3PE09Y6JfzlJ8rCsWJ6Q0KOCaM483es04zLleuy5Akw40p3FYYLjn61MoV1jUzUGeXUQNfl7aN5MRemgNaEVGu9zgq8nLXavMH07k6s4W8OOpFQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734622414; c=relaxed/simple;
	bh=eg3dfe2a2VJ/1TkwR/APhHReQZey+HnZphRRuvDWBV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGKr+QTbYiqXyHzB+0m47S0KHkKfljeMhGJx1oo5BdZw1V4IwQokRlFqHTMeo9yApgZAeJI/igAqhRoOds8ydMIKVCbjMTCo9h6eFV/h+RuVjsJJFYSQu2w1zHCOQWpn9MC03sjML4TMCKVZF20QpiDIptwJMHQZYkVrx48fFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsvrVD8s; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6a92f863cso184605766b.1;
        Thu, 19 Dec 2024 07:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734622411; x=1735227211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOpLztTGrQi9imn7fNK1wmSK1nZbFILsVsxsH4Anurs=;
        b=QsvrVD8s+nOcPJdqB52VrMf9cYs4CFz0pdjvJrz3Gtf5cbNAQ877mddAa/HfAPCG1W
         8f8YmvcOmGJbtG2Wyhf0BroK8okKMloSdqFQ71ICJGsME+Bz886w8Q1enKGKAWHUeF9l
         B1FuWp4SuDHkbUk9DbRaOSoWUy9ZSd9CGpTcnG/6lg6D/vRalGqf5H8JfMy170v2oaSD
         8Px71kaLXmJd+wL37053dMx4KgizvWf7CQsNAoIEzD4h44V6mWxt3GnsC4ZI5ctr44lJ
         M0p89KVk6Ecv7YQfP/MbzDfNd9zFqAX3W1c/oADRTwdE6LdbALC9ICLpiVz2wk5M0i8q
         AqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734622411; x=1735227211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOpLztTGrQi9imn7fNK1wmSK1nZbFILsVsxsH4Anurs=;
        b=DO1dXyAzU3hwhfSAbjYYC7P3arN1ysjmQx/gfxOzo061suDLBU5K68PuyW/hX4c11/
         ze0bplWGxBKSjFGxhIn7GbTsDd90JwPWQ9Vx2y3oHLuAld/kosEq6PYQxXcvDZrBj6jr
         QPzcp3nmjtOxlDXobyOq+7LLkR1NJVi+XIY6D/Gi35aZQsaGewOM9artbDgvGdRMyMzo
         xUTc2B3eQyNFlrX82SgX2eh4UK7niITRKyQEqbCRzS6likF9Tl7/4Gj7+2LgE2Iso7t2
         ewwDUnrS2xwz6J3XK3Vc3bgfNtiy++k3SdKRI8zhTijnMadouiGRWKORgGOLw5qWvMKi
         xC7w==
X-Forwarded-Encrypted: i=1; AJvYcCU/bTulO7LnaqNI+TIuyLYaKFYc2c9pS+6MH2Za4IYBxH41ehG/Vb0AkeRS+XCQnywcDlY6+P4Y+l6C96bfTtQ=@vger.kernel.org, AJvYcCUwktKLdN9bUYpoCl0J4b5ChDSTQKnw/UQoMEbIHhl6WUGuUChVs0ukKyE7rVyhV95ewI0glOzwkuT/@vger.kernel.org, AJvYcCVeIksV0VDI8dTnxPUz67QzrRS6K6c6v0Ve93iUaHadgDHlxyuEW8lwKo2TuhIhPVWjVL3PT1WmmCRnyDKa0A==@vger.kernel.org, AJvYcCW6bXTq+E5rT0E6A5jvIMKyRLTlaEVQ0P87W5AwBoynPY2hn50bmUMGbNLYVylKiBZdMX56c91xMtYskhOz@vger.kernel.org, AJvYcCX+b3pfiLYrpsLmhEioz9JKNN4+XWj/G6QDLz9zvzLl967IrjmYGjFvKqW/qGVuCVBCmApT4145aEbI@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi4xtxRagnmykrbiFufVMxbHEPOul6VCPWyGUK+c3Xi8Qm6XNe
	DAVvoyS1MrzzgNzwb0q/wZojRGVoFZYBvv5hHgHsZ8GXrU7uoKPW6kx+SF6nAq56Nr7SBLfkiJG
	zKY2NYAzrDMySYNRu2OVW4aVlmHw=
X-Gm-Gg: ASbGnctUxoAOqkabQAotJ5xYOqU8wkUfh/EolqoY3itEMXiLKg7O/BAl+AS/lDP7fjC
	oOlRLlbKs/GLsl5g/gxC+/sPWFdWMdbeRvuZuNFvjH0dUnQ7aB0RnGogYXx2906tSgt5gcA==
X-Google-Smtp-Source: AGHT+IEO/lZAywCTKr7DVZ7W7rFExD2nJ9XBby6vZc4gEVGXW1oykWToRQP+0LMsYn6+q1jgvuzXnlll/zAAOzAnkSw=
X-Received: by 2002:a17:907:7747:b0:aac:439:10ce with SMTP id
 a640c23a62f3a-aac07950e3dmr315470666b.27.1734622410417; Thu, 19 Dec 2024
 07:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com> <20241218-ncv6336-v1-1-b8d973747f7a@gmail.com>
 <20241219130323.GA4049504-robh@kernel.org>
In-Reply-To: <20241219130323.GA4049504-robh@kernel.org>
From: Fabien Parent <parent.f@gmail.com>
Date: Thu, 19 Dec 2024 07:33:18 -0800
Message-ID: <CAL6vTrga0bN591VT0JJq8cd-kUgedsmRCMu=ST=NyZijT7dXQA@mail.gmail.com>
Subject: Re: [PATCH 1/9] rust: i2c: add basic I2C client abstraction
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	vinod.koul@linaro.org, Fabien Parent <fabien.parent@linaro.org>, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 5:03=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Dec 18, 2024 at 03:36:31PM -0800, Fabien Parent wrote:
> > From: Fiona Behrens <me@kloenk.dev>
> >
> > Implement an abstraction to write I2C device drivers. The abstraction
> > is pretty basic and provides just the infrastructure to probe
> > a device from I2C/OF device_id and abstract `i2c_client`.
> > The client will be used by the Regmap abstraction to perform
> > I/O on the I2C bus.
> >
> > Signed-off-by: Fiona Behrens <me@kloenk.dev>
> > Co-developed-by: Fabien Parent <fabien.parent@linaro.org>
> > Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> > ---
> >  MAINTAINERS                     |   1 +
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/helpers/helpers.c          |   1 +
> >  rust/helpers/i2c.c              |  13 ++
> >  rust/kernel/i2c.rs              | 288 ++++++++++++++++++++++++++++++++=
++++++++
> >  rust/kernel/lib.rs              |   2 +
> >  6 files changed, 306 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6b9e10551392c185b9314c9f94edeaf6e85af58f..961fe4ed39605bf489d1d9e=
473f47bccb692ff14 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10796,6 +10796,7 @@ F:    include/linux/i2c-smbus.h
> >  F:   include/linux/i2c.h
> >  F:   include/uapi/linux/i2c-*.h
> >  F:   include/uapi/linux/i2c.h
> > +F:   rust/kernel/i2c.rs
> >
> >  I2C SUBSYSTEM HOST DRIVERS
> >  M:   Andi Shyti <andi.shyti@kernel.org>
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> > index e9fdceb568b8f94e602ee498323e5768a40a6cba..a882efb90bfc27960ef1fd5=
f2dc8cc40533a1c27 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -16,6 +16,7 @@
> >  #include <linux/file.h>
> >  #include <linux/firmware.h>
> >  #include <linux/fs.h>
> > +#include <linux/i2c.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/jump_label.h>
> >  #include <linux/mdio.h>
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 0640b7e115be1553549312dcfdf842bcae3bde1b..630e903f516ee14a51f46ff=
0bcc68e8f9a64021a 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -15,6 +15,7 @@
> >  #include "device.c"
> >  #include "err.c"
> >  #include "fs.c"
> > +#include "i2c.c"
> >  #include "io.c"
> >  #include "jump_label.c"
> >  #include "kunit.c"
> > diff --git a/rust/helpers/i2c.c b/rust/helpers/i2c.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8ffdc454e7597cc61909da5=
b3597057aeb5f7299
> > --- /dev/null
> > +++ b/rust/helpers/i2c.c
> > @@ -0,0 +1,13 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/i2c.h>
> > +
> > +void *rust_helper_i2c_get_clientdata(const struct i2c_client *client)
> > +{
> > +     return i2c_get_clientdata(client);
> > +}
> > +
> > +void rust_helper_i2c_set_clientdata(struct i2c_client *client, void *d=
ata)
> > +{
> > +     i2c_set_clientdata(client, data);
> > +}
> > diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..efa03335e5b59e72738380e=
94213976b2464c25b
> > --- /dev/null
> > +++ b/rust/kernel/i2c.rs
> > @@ -0,0 +1,288 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Abstractions for the I2C bus.
> > +//!
> > +//! C header: [`include/linux/i2c.h`](srctree/include/linux/i2c.h)
> > +
> > +use crate::{
> > +    bindings, container_of,
> > +    device::Device,
> > +    device_id::{self, RawDeviceId},
> > +    driver,
> > +    error::{to_result, Result},
> > +    of,
> > +    prelude::*,
> > +    str::CStr,
> > +    types::{ARef, ForeignOwnable, Opaque},
> > +    ThisModule,
> > +};
> > +
> > +/// Abstraction for `bindings::i2c_device_id`.
> > +#[repr(transparent)]
> > +#[derive(Clone, Copy)]
> > +pub struct DeviceId(bindings::i2c_device_id);
> > +
> > +impl DeviceId {
> > +    /// Create a new device id from an I2C name.
> > +    pub const fn new(name: &CStr) -> Self {
> > +        let src =3D name.as_bytes_with_nul();
> > +        // TODO: Replace with `bindings::i2c_device_id::default()` onc=
e stabilized for `const`.
> > +        // SAFETY: FFI type is valid to be zero-initialized.
> > +        let mut i2c: bindings::i2c_device_id =3D unsafe { core::mem::z=
eroed() };
> > +
> > +        let mut i =3D 0;
> > +        while i < src.len() {
> > +            i2c.name[i] =3D src[i] as _;
> > +            i +=3D 1;
> > +        }
>
> You can simplify this now that char maps to u8 (in rust next).
>
> > +
> > +        Self(i2c)
> > +    }
> > +}
> > +
> > +// SAFETY:
> > +// * `DeviceId` is a `#[repr(transparent)` wrapper of `i2c_device_id` =
and does not add
> > +//   additional invariants, so it's safe to transmute to `RawType`.
> > +// * `DRIVER_DATA_OFFSET` is the offset to the `data` field.
> > +unsafe impl RawDeviceId for DeviceId {
> > +    type RawType =3D bindings::i2c_device_id;
> > +
> > +    const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings=
::i2c_device_id, driver_data);
> > +
> > +    fn index(&self) -> usize {
> > +        self.0.driver_data as _
> > +    }
> > +}
> > +
> > +/// I2C [`DeviceId`] table.
> > +pub type IdTable<T> =3D &'static dyn device_id::IdTable<DeviceId, T>;
> > +
> > +/// An adapter for the registration of I2C drivers.
> > +#[doc(hidden)]
> > +pub struct Adapter<T: Driver + 'static>(T);
> > +
> > +impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> > +    type RegType =3D bindings::i2c_driver;
> > +
> > +    fn register(
> > +        i2cdrv: &Opaque<Self::RegType>,
> > +        name: &'static CStr,
> > +        module: &'static ThisModule,
> > +    ) -> Result {
> > +        // SAFETY: It's safe to set the fields of `struct i2c_driver` =
on initialization.
> > +        unsafe {
> > +            (*i2cdrv.get()).driver.name =3D name.as_char_ptr();
> > +            (*i2cdrv.get()).probe =3D Some(Self::probe_callback);
> > +            (*i2cdrv.get()).remove =3D Some(Self::remove_callback);
> > +            if let Some(t) =3D T::I2C_ID_TABLE {
> > +                (*i2cdrv.get()).id_table =3D t.as_ptr();
> > +            }
> > +            if let Some(t) =3D T::OF_ID_TABLE {
> > +                (*i2cdrv.get()).driver.of_match_table =3D t.as_ptr();
> > +            }
> > +        }
> > +
> > +        // SAFETY: `i2cdrv` is guaranteed to be a valid `RegType`.
> > +        to_result(unsafe { bindings::i2c_register_driver(module.0, i2c=
drv.get()) })
> > +    }
> > +
> > +    fn unregister(i2cdrv: &Opaque<Self::RegType>) {
> > +        // SAFETY: `i2cdrv` is guaranteed to be a valid `RegType`.
> > +        unsafe { bindings::i2c_del_driver(i2cdrv.get()) };
> > +    }
> > +}
> > +
> > +impl<T: Driver> Adapter<T> {
> > +    /// Get the [`Self::IdInfo`] that matched during probe.
> > +    fn id_info(client: &mut Client) -> Option<&'static T::IdInfo> {
> > +        let id =3D <Self as driver::Adapter>::id_info(client.as_ref())=
;
> > +        if id.is_some() {
> > +            return id;
> > +        }
> > +
> > +        // SAFETY: `client` and `client.as_raw()` are guaranteed to be=
 valid.
> > +        let id =3D unsafe { bindings::i2c_client_get_device_id(client.=
as_raw()) };
> > +        if !id.is_null() {
> > +            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper o=
f `struct i2c_device_id` and
> > +            // does not add additional invariants, so it's safe to tra=
nsmute.
> > +            let id =3D unsafe { &*id.cast::<DeviceId>() };
> > +            return Some(T::I2C_ID_TABLE?.info(id.index()));
> > +        }
>
> You aren't handling the DT based matching.

It is handled with the first line of this function:

+    fn id_info(client: &mut Client) -> Option<&'static T::IdInfo> {
+        let id =3D <Self as driver::Adapter>::id_info(client.as_ref());

This Adapter driver::Adapter is implemented by the I2C bus:

+impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
+    type IdInfo =3D T::IdInfo;
+
+    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
+        T::OF_ID_TABLE
+    }
+}

This function is first using the adapter to retrieve the IdInfo, and
if nothing is returned then we perform our own match based on
i2c::IdInfo.

>
> Rob

