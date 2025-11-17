Return-Path: <linux-i2c+bounces-14122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4842DC65176
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 17:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 169CC29A23
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 16:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB802D540D;
	Mon, 17 Nov 2025 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="pGV1gGAp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50DD2D3EE3
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396153; cv=none; b=DDnV6dl1iQO+KrARKUXk4r3xlrhDEVMKbwtSmmlff9a41FgU9ySt6HN54QEnTe0IJ5d8h3d8FgvGo/suiaTw9/ic50cTNXbmIqwN+rWuHORYbgRxue6VkZHFW36iyrSKq75wBpL6qgqwuHCWqobbPFi9JXM2atMoM5dQ9Xqu/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396153; c=relaxed/simple;
	bh=DC63mhLQw+mq8WEJPg++W/rpCgcxikuYGvKkysi5nTQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=coGH89RlvOmfg4hsRLH+l94mUW+aoZB/Zg0xwBuT0SAPMoBBG+YvVG/rI+OgLyeM71tZKOOcHSB7phHZYghzqxIVd9Z+pt0leaX7M4imDZl7NwHl1J8Qq2JloIXuOr//vzG5NCv7lSCYCO0zHftwfSqEZFZ1NYjJs4jD95HPtGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=pGV1gGAp; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1C366240101
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 17:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1763396149; bh=FY/Ok3pFDdSosiEQV+7wHuQLyfA6EB4okfzKtdsnE1Y=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:OpenPGP:From;
	b=pGV1gGAp/BFhCL37Z3Aunsn3KhS9JFq3yniLESnipLfKdQCgAzW2xZ8J5eBgq6rs2
	 B+cEpMmstWm/qAz/r58YmN0aEG65kkhBTjPB4NjsQrhzN8eKyKi4VxJR64vgAyojIf
	 dH35jNXPvBhbyKHqxFAAk2dEEHItvcPdiNFx/1FuuRWYrthRvFTYs1DISTKK1ECW+h
	 2QQWftiQtn4efVlAdvKOM9zKl+Y1GBdSR4Yoq5mlGyjKkbPdNeHuzBYjwIS7ERsAY5
	 NjFVUUnciX5ThN9/FPWZylxuDiZv4TEDl/Pa8VfTD3yqMFgDk3v30hR4c79SqOi7SI
	 pS/xMHpVGp11A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d9CXD1Mh1z6tm8;
	Mon, 17 Nov 2025 17:15:40 +0100 (CET)
Message-ID: <25c70010f67e9f0760840e35cc722d3bb89fd703.camel@posteo.de>
Subject: Re: [PATCH v8 0/4] rust: i2c: Add basic I2C driver abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Igor Korotin <igor.korotin.linux@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, Asahi
 Lina <lina+kernel@asahilina.net>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Alex Hung	 <alex.hung@amd.com>, Tamir Duberstein
 <tamird@gmail.com>, Xiangfei Ding	 <dingxiangfei2009@gmail.com>,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 linux-i2c@vger.kernel.org
Date: Mon, 17 Nov 2025 16:15:42 +0000
In-Reply-To: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 R3rOFHA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

add me to cc please.

My led driver currently relies on the i2c bindings.

Thanks
- Markus Probst

[1]
https://lore.kernel.org/rust-for-linux/20251008181027.662616-1-markus.probs=
t@posteo.de/

On Sun, 2025-11-16 at 16:21 +0000, Igor Korotin wrote:
> This patch series lays the groundwork for writing Linux I2C drivers in=
=20
> Rust by:
>=20
>  1. Core abstractions=20
>     Introduce `i2c::I2cClient`, `i2c::I2cAdapter`, `i2c::Driver` and=20
>     built on the existing `struct i2c_client`, `struct i2c_adapter`=20
>     and `struct i2c_driver`, with safe Rust wrappers around probe,=20
>     transfer, and teardown logic.
>=20
>  2. Manual device creation =20
>     Provide an API to register an I2C device at runtime from Rust using
>     `I2cBoardInfo` and `I2cAdapter`, including automatic cleanup when=20
>     the driver unloads.
>=20
>  3. Sample I2C driver (legacy table, OF & ACPI) =20
>     Add `rust_driver_i2c`, a sample that:
>       - binds to an I2C client via:=20
>         - legacy I2C-ID table,=20
>         - Open Firmware (device-tree) compatible strings, or
>         - ACPI IDs.
>  4. Sample I2C client registration (OF & ACPI)
>     Add `rust_i2c_client`, a sample that:
>       - binds to a platform parent device using OF/ACPI table
>       - registers new I2C client bound to the parent platform device
>         using `i2c::Registration::new()`
>       - destroyes the I2C client device on exit.
>=20
> Together, these four patches:
>=20
> - Establish the essential Rust traits and types for I2C drivers.
> - Enable driver binding via legacy ID table, device-tree (OF), or ACPI
> - Enable manual device creation at runtime.
> - Ship a samples showing typical usage=20
>=20
> Igor Korotin (4):
>   rust: i2c: add basic I2C device and driver abstractions
>   rust: i2c: add manual I2C device creation abstractions
>   samples: rust: add Rust I2C sample driver
>   samples: rust: add Rust I2C client registration sample
>=20
> Changelog
> ---------
> v8:
>  - Rebase commits on top of [1]
>  - Applied kernel vertical style [2]=20
>  - Replace core::mem::zeroed() with pin_init::zeroed()
>  - Rename `I2cAdapter::get_nr` to `I2cAdapter::index`
>  - fixed some minor format issues
>  - Link to v7: [3]
>=20
>  [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git/log/?h=3Ddriver-core-next
>  [2] https://docs.kernel.org/rust/coding-guidelines.html#imports
>  [3] https://lore.kernel.org/rust-for-linux/20251110112437.50405-1-igor.k=
orotin.linux@gmail.com/
>=20
> v7:
>  - Rebase and update `i2c::Driver::probe` function based on patch=20
>    series [1].
>  - use `i2c::Driver::unbind` instead of `drop` in=20
>    `i2c::Adapter::remove_callback`
>  - Implement and use `i2c::Driver::unbind` for I2C SampleDriver
>    instead of Drop.
>  - `i2c::Registration::new` requires a parent device to which a new
>    I2C client will be bound.=20
>  - `i2c::Registration::new` returns `impl PinInit<Devres<Self>, Error>`
>  - The existing rust_driver_i2c sample has been split into two:
>    `rust_driver_i2c`, which demonstrates the implementation of an I2C=20
>    driver, and `rust_i2c_client`, which demonstrates registering a new=
=20
>    I2C client bound to a parent platform device.
>  - Link to v6: [2]
>=20
>  [1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/
>  [2] https://lore.kernel.org/rust-for-linux/20251005102226.41876-1-igor.k=
orotin.linux@gmail.com/=20
>=20
> v6:
>  - Add implementation of unbind for `i2c::Driver` trait;
>  - Add argument `Pin<&Self>` to `i2c::Driver::shutdown` method;=20
>  - Adjust usage of `i2c::Driver::shutdown` in=20
>    `i2c::Adapter::shutdown_callback` in `i2c::Driver` trait code=20
>    example and in rust_driver_i2c code;
>  - Remove dummy AsRef implementation for I2cAdapter. Adjust code=20
>    in rust_driver_i2c;
>  - Add `i2c::I2cAdapter::get_nr` method that returns I2cAdapter index;
>  - Optimize unsafe sections in inc_ref/dec_ref in AlwaysRefCounted=20
>    for I2cAdapter implementation;
>  - Remove unnecessary Drop implementation for I2cAdapter, because=20
>    I2cAdapter is always a reference;
>  - Remove unnecessary type definition `Ops<T>` in rust_driver_i2c
>  - Simplify call of `i2c::I2cAdapter::get` in `try_pin_init!` macro=20
>    for rust_driver_i2c
>  - Link to v5: https://lore.kernel.org/rust-for-linux/20250911154717.9663=
7-1-igor.korotin.linux@gmail.com/=20
> v5:
>  - Rename missed pdev variables to idev (thanks to Daniel).
>  - Import `crate::device_id::RawDeviceIdIndex` and=20
>    `crate::types::AlwaysRefCounted` in i2c.rs.
>  - Switch dev_dbg to dev_info in the sample I2C driver messages.
>  - Make `I2cAdapter::get()` return `ARef<I2cAdapter>` instead of=20
>    `&I2cAdapter`.
>  - Remove `TryFrom<device::Device<Ctx>> for I2cAdapter<Ctx>` (unused;=20
>    to be reintroduced in a later I2C series).
>  - Remove `AsRef<device::Device<Ctx>> for I2cAdapter<Ctx>` (unused;=20
>    to be reintroduced in a later I2C series).
>  - Add `AsRef<I2cAdapter> for I2cAdapter<Ctx>`.
>  - Use i2c_get/put_adapter instead of get/put_device for=20
>    `AlwaysRefCounted<I2cAdapter>`.
>  - Update safety comment for `unsafe impl Sync for Registration {}`.
>  - Tweak comment for `I2cBoardInfo::new`.
>  - Adjust build-time assertion message in `Adapter::register`.
>  - Link to v4: https://lore.kernel.org/rust-for-linux/20250820151427.1812=
482-1-igor.korotin.linux@gmail.com/=20
> v4:
>  - Renamed `i2c::I2cAdapterRef` to `i2c::I2cAdapter`.
>  - Renamed `i2c::Device` to `i2c::I2cClient` for consistency with=20
>    `i2c::I2cAdapter` and to avoid confusion with `i2c::Adapter`
>  - Reworked `i2c::I2cAdapter` to be an Opaque around `i2c_adapter` struct
>  - Implemented AlwaysRefCounted trait for `i2c::I2cAdapter`.=20
>  - Fixed numerous comment mistakes and typos all over the code, thanks=
=20
>    to Danilo and Daniel
>  - Got rid of all unwrap() use-cases in i2c.rs and rust_driver_i2c.rs.
>    This covers 0-day kernel panic <202508071027.8981cbd4-lkp@intel.com>
>  - Removed unnecessary casts.
>  - Replaced all addr_of_mut! macros to &raw mut.
>  - In `i2c::Adapter::register` method build assert if all ID tables are=
=20
>    None.
>  - Renamed all pdrv and pdev instances to idrv and idev respectivly=20
>  - Implemented an ealry return in `i2c::Adapter::i2c_id_info`
>  - Added all missing Safety comments.=20
>  - Removed `unsafe impl<Ctx: device::DeviceContext> crate::types::AlwaysR=
efCounted for Device<Ctx>`=20
>    implementation which came to v3 from v2 by mistake.
>  - Added more details regarding i2c-stub driver usage in rust_driver_i2c
>    comment.
>  - Changed `i2c::I2cAdapter::get` return type from `Option<Self>` to=20
>    `Result<&'static Self>`.
>  - Added Daniel Almeida as a reviewer to the "I2C Subsystem [RUST]" entry=
=20
>    in MAINTAINERS, per his offer.
>  - Link to v3: https://lore.kernel.org/rust-for-linux/20250801153742.1347=
2-1-igor.korotin.linux@gmail.com/
> v3:=20
>  - removed unnecessary i2c_get_clientdata and i2c_set_clientdata rust=20
>    helpers. Using generic accessors implemented in [1] instead.
>  - Reimplemented i2c::DeviceId based on changes in [2].
>  - Using from_result in i2c::Adapter::probe_callback
>  - Using explicit drop() for i2c client private data in=20
>    `i2c::Adapter::remove_callback`
>  - replaced device::Device::as_ref() with device::Device::from_raw in=20
>    `i2c::Device::as_ref()`. It is renamed in device::Device.
>  - Build Rust I2C only if I2C is built-in
>  - Reimplement overcomplicated trait i2c::DeviceOwned the same way it is=
=20
>    implemented in auxiliary [3].
>  - Merge rust_device_i2c and rust_driver_i2c samples. Resulting=20
>    rust_driver_i2c creates pined i2c_client using i2c::Registration::new=
=20
>    and probes newly created i2c_client.
>  - Created a new entry in MAINTAINERS file containing i2c.rs and=20
>    rust_driver_i2c.rs in it.
>  - Link to v2: [4]=20
>=20
>  [1] https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org=
/
>  [2] https://lore.kernel.org/rust-for-linux/20250711040947.1252162-1-fuji=
ta.tomonori@gmail.com/
>  [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/rust/kernel/auxiliary.rs?h=3Dv6.16-rc4#n299
>  [4] https://lore.kernel.org/rust-for-linux/20250704153332.1193214-1-igor=
.korotin.linux@gmail.com/=20
>=20
> v2:
>  - Merged separated ACPI support patches since ACPI-table support is=20
>    merged into driver-core-next.
>  - Added I2cAdapterRef and I2cBoardInfo abstractions=20
>  - Added DeviceState generic parameter which is used for `i2c::Device`
>    as a sign if the device is created manually
>  - Added `DeviceOwned` abstraction which is a safe reference to a=20
>    manually created `i2c::Device<Ctx, state::Owned>`.=20
>  - Added Rust manual I2C device creation sample
>  - Link to v1: https://lore.kernel.org/rust-for-linux/20250626174623.9049=
17-1-igor.korotin.linux@gmail.com/
>=20
>  MAINTAINERS                     |   9 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/i2c.rs              | 589 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  samples/rust/Kconfig            |  23 ++
>  samples/rust/Makefile           |   2 +
>  samples/rust/rust_driver_i2c.rs |  74 ++++
>  samples/rust/rust_i2c_client.rs | 157 +++++++++
>  8 files changed, 857 insertions(+)
>  create mode 100644 rust/kernel/i2c.rs
>  create mode 100644 samples/rust/rust_driver_i2c.rs
>  create mode 100644 samples/rust/rust_i2c_client.rs
>=20
>=20
> base-commit: ededb7bcdfdbcfbb7af93e3a543165a9553e1683

