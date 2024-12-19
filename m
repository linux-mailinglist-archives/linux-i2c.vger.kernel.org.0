Return-Path: <linux-i2c+bounces-8640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A04489F7BEF
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 14:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEDFA164D53
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC6938DFC;
	Thu, 19 Dec 2024 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giABaITE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E4801;
	Thu, 19 Dec 2024 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613405; cv=none; b=FGOQaAcqe4ddQMXe9ZmKtV/3CM8XagXTFHwxHc9neyphLHVPObnY4vB4QbQbaZj8a7eIe/n/olV1ggC95h+Mi9K1zXAGzU4r77cyggwU80413+rC9pehTyYc2ViZ+7kqNyhgpb7Z1jdPuky3QCZzu8jNhiHCHKKVzvMdJ3X0xTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613405; c=relaxed/simple;
	bh=5+x3QZVCzTq1Hf1gpxeuJv6OeqlteL217qDNjwEWRlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkgQ9fVHTGnwR0CExm+0qjGgkZ4rH1L23NemYC6CZaIrQ7ycuNGr2uyAKa4B797aelhTBi3fZUnzuM+DgeyT8FixaPDH9s+TMT7qJF9Lvdovvd95/fhLVREN3loRp2Pe3shWHlgRIvmtib69esjgJOwdZi0A6/7je8ap1ZOFjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giABaITE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B42C4CECE;
	Thu, 19 Dec 2024 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734613405;
	bh=5+x3QZVCzTq1Hf1gpxeuJv6OeqlteL217qDNjwEWRlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=giABaITEctE/wbnCg/2MLICDl1W+b+PAc1GAZkOjAmMAJuCMa81xyg99GcWrf3p3b
	 euH2NWPqYluq8TxZlN2C8M/Jn2DoK8Wv3LENzgIFj29Dq3TvpjLzU7XHlBUXxasGkK
	 9IKFSrEZOawhPRZ/gsh7htS0dkMHKZ6/csDgbQ8s5aTY+Uuxjrq448w5ZuHvBxleA5
	 VOXCfP7tKmb41Guc35Fw187V49JZymlT+kWxAYqoVrOEQOUot5zozYSbTuN+EQZEi3
	 H8dPIXmgJL+REFqc+uO2o0w7XJZ75r3VsU2xmsen8i0XovdiHLasPCqS1GkK5I+E8l
	 k6YgbeI8ImwRg==
Date: Thu, 19 Dec 2024 07:03:23 -0600
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <parent.f@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	vinod.koul@linaro.org, Fabien Parent <fabien.parent@linaro.org>,
	Fiona Behrens <me@kloenk.dev>
Subject: Re: [PATCH 1/9] rust: i2c: add basic I2C client abstraction
Message-ID: <20241219130323.GA4049504-robh@kernel.org>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
 <20241218-ncv6336-v1-1-b8d973747f7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218-ncv6336-v1-1-b8d973747f7a@gmail.com>

On Wed, Dec 18, 2024 at 03:36:31PM -0800, Fabien Parent wrote:
> From: Fiona Behrens <me@kloenk.dev>
> 
> Implement an abstraction to write I2C device drivers. The abstraction
> is pretty basic and provides just the infrastructure to probe
> a device from I2C/OF device_id and abstract `i2c_client`.
> The client will be used by the Regmap abstraction to perform
> I/O on the I2C bus.
> 
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> Co-developed-by: Fabien Parent <fabien.parent@linaro.org>
> Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> ---
>  MAINTAINERS                     |   1 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/i2c.c              |  13 ++
>  rust/kernel/i2c.rs              | 288 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  6 files changed, 306 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b9e10551392c185b9314c9f94edeaf6e85af58f..961fe4ed39605bf489d1d9e473f47bccb692ff14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10796,6 +10796,7 @@ F:	include/linux/i2c-smbus.h
>  F:	include/linux/i2c.h
>  F:	include/uapi/linux/i2c-*.h
>  F:	include/uapi/linux/i2c.h
> +F:	rust/kernel/i2c.rs
>  
>  I2C SUBSYSTEM HOST DRIVERS
>  M:	Andi Shyti <andi.shyti@kernel.org>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index e9fdceb568b8f94e602ee498323e5768a40a6cba..a882efb90bfc27960ef1fd5f2dc8cc40533a1c27 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -16,6 +16,7 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/i2c.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0640b7e115be1553549312dcfdf842bcae3bde1b..630e903f516ee14a51f46ff0bcc68e8f9a64021a 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -15,6 +15,7 @@
>  #include "device.c"
>  #include "err.c"
>  #include "fs.c"
> +#include "i2c.c"
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> diff --git a/rust/helpers/i2c.c b/rust/helpers/i2c.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8ffdc454e7597cc61909da5b3597057aeb5f7299
> --- /dev/null
> +++ b/rust/helpers/i2c.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/i2c.h>
> +
> +void *rust_helper_i2c_get_clientdata(const struct i2c_client *client)
> +{
> +	return i2c_get_clientdata(client);
> +}
> +
> +void rust_helper_i2c_set_clientdata(struct i2c_client *client, void *data)
> +{
> +	i2c_set_clientdata(client, data);
> +}
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..efa03335e5b59e72738380e94213976b2464c25b
> --- /dev/null
> +++ b/rust/kernel/i2c.rs
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the I2C bus.
> +//!
> +//! C header: [`include/linux/i2c.h`](srctree/include/linux/i2c.h)
> +
> +use crate::{
> +    bindings, container_of,
> +    device::Device,
> +    device_id::{self, RawDeviceId},
> +    driver,
> +    error::{to_result, Result},
> +    of,
> +    prelude::*,
> +    str::CStr,
> +    types::{ARef, ForeignOwnable, Opaque},
> +    ThisModule,
> +};
> +
> +/// Abstraction for `bindings::i2c_device_id`.
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::i2c_device_id);
> +
> +impl DeviceId {
> +    /// Create a new device id from an I2C name.
> +    pub const fn new(name: &CStr) -> Self {
> +        let src = name.as_bytes_with_nul();
> +        // TODO: Replace with `bindings::i2c_device_id::default()` once stabilized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c: bindings::i2c_device_id = unsafe { core::mem::zeroed() };
> +
> +        let mut i = 0;
> +        while i < src.len() {
> +            i2c.name[i] = src[i] as _;
> +            i += 1;
> +        }

You can simplify this now that char maps to u8 (in rust next).

> +
> +        Self(i2c)
> +    }
> +}
> +
> +// SAFETY:
> +// * `DeviceId` is a `#[repr(transparent)` wrapper of `i2c_device_id` and does not add
> +//   additional invariants, so it's safe to transmute to `RawType`.
> +// * `DRIVER_DATA_OFFSET` is the offset to the `data` field.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType = bindings::i2c_device_id;
> +
> +    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::i2c_device_id, driver_data);
> +
> +    fn index(&self) -> usize {
> +        self.0.driver_data as _
> +    }
> +}
> +
> +/// I2C [`DeviceId`] table.
> +pub type IdTable<T> = &'static dyn device_id::IdTable<DeviceId, T>;
> +
> +/// An adapter for the registration of I2C drivers.
> +#[doc(hidden)]
> +pub struct Adapter<T: Driver + 'static>(T);
> +
> +impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> +    type RegType = bindings::i2c_driver;
> +
> +    fn register(
> +        i2cdrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        // SAFETY: It's safe to set the fields of `struct i2c_driver` on initialization.
> +        unsafe {
> +            (*i2cdrv.get()).driver.name = name.as_char_ptr();
> +            (*i2cdrv.get()).probe = Some(Self::probe_callback);
> +            (*i2cdrv.get()).remove = Some(Self::remove_callback);
> +            if let Some(t) = T::I2C_ID_TABLE {
> +                (*i2cdrv.get()).id_table = t.as_ptr();
> +            }
> +            if let Some(t) = T::OF_ID_TABLE {
> +                (*i2cdrv.get()).driver.of_match_table = t.as_ptr();
> +            }
> +        }
> +
> +        // SAFETY: `i2cdrv` is guaranteed to be a valid `RegType`.
> +        to_result(unsafe { bindings::i2c_register_driver(module.0, i2cdrv.get()) })
> +    }
> +
> +    fn unregister(i2cdrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `i2cdrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::i2c_del_driver(i2cdrv.get()) };
> +    }
> +}
> +
> +impl<T: Driver> Adapter<T> {
> +    /// Get the [`Self::IdInfo`] that matched during probe.
> +    fn id_info(client: &mut Client) -> Option<&'static T::IdInfo> {
> +        let id = <Self as driver::Adapter>::id_info(client.as_ref());
> +        if id.is_some() {
> +            return id;
> +        }
> +
> +        // SAFETY: `client` and `client.as_raw()` are guaranteed to be valid.
> +        let id = unsafe { bindings::i2c_client_get_device_id(client.as_raw()) };
> +        if !id.is_null() {
> +            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
> +            // does not add additional invariants, so it's safe to transmute.
> +            let id = unsafe { &*id.cast::<DeviceId>() };
> +            return Some(T::I2C_ID_TABLE?.info(id.index()));
> +        }

You aren't handling the DT based matching.

Rob

