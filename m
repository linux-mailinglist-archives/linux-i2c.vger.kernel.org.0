Return-Path: <linux-i2c+bounces-12451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A6B38A51
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 21:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85A337AA737
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 19:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AEE2EC561;
	Wed, 27 Aug 2025 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eP94gNjW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE9279798;
	Wed, 27 Aug 2025 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323592; cv=pass; b=GpZAxpblnidsq5dOEBav/NcC+XXYn+zwqbPvXoS4d5voaay5vdGqrDMC79Hg6tyln+8C1qLfJGL6x65CiH0gtCzEBCHfJp84QLdVokdGPzawWKnEw/fisXHslpzH2WqQ7u0+alMyhHH7S0e1VtmtoZrGzaxNMA7crp17c/xAh2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323592; c=relaxed/simple;
	bh=bhJGLOzcqCXeL1f+PbZNg5CJwwNVYLKvEfjnOQw8x/k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Y4yYLPFSIoKI0hwM44yb/TsU3BDGGFShVzUd/hVq1Pe3H97qACnyYtaicpPz3OyOuuSvi5CzJsovC34FeUznKdFX6SZWqodiyaLeEY0nS1veXz3P1unZbD80CoxIaNfq/FWSGw4G4K1lKwyBZg44F4zw0Lgq7mBjhLyexSKfOJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eP94gNjW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1756323554; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BjVD3vQBXkxIog1obtJpk2QOGYeHCPsjVUJte3k4LAS02jN43Roe30qKzepkZ4RXwiI0xBQ1I/znxSGEOeCQQMqX1qSf/4Ic8kVOzhpya+ebjd8GMFjJXaP8VzamxgLNcoyua9fhed+CPrKVMv8tB25uE0J7nLZV8TqplA8oXPw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756323554; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oVevfbBofNCl0bqpIo8jxzoWwPB9gpvBbBKAzwe387U=; 
	b=MY/Lf+z/wq0h3uXZoGjYoor4FB7dT5ESlIgVTO/BMDf6GP5CGSHxMnOaJ2Y/goJ2/TfKZx1uuSV68N5pT8npxA2tnm1yQDdTNmPeSu7E0OwfuypM8s4oqwhkYjxTnMn3MwY4KGLcxFmYAcBuwde78P2HaaxPQ1ki+r6tQkqUl+4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756323554;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=oVevfbBofNCl0bqpIo8jxzoWwPB9gpvBbBKAzwe387U=;
	b=eP94gNjWEqCTxRQXHUgUmhlX+3ghHUyLM6L+BPVzEehb11shXPJP70sW5QSKeFmu
	seoEeCftFG2tJ0qPpo5T6l9VJsn4MexCJfEPNvyFIKlx6Irli6/bF7U/EMcEtO+2eBr
	8pqlIEo4c3iNhBv4SPu8kcq52+oLZ1sr/S9lKVdI=
Received: by mx.zohomail.com with SMTPS id 1756323544718753.0565349742627;
	Wed, 27 Aug 2025 12:39:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 3/3] samples: rust: add Rust I2C sample driver
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250820152347.1815097-1-igor.korotin.linux@gmail.com>
Date: Wed, 27 Aug 2025 16:38:46 -0300
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
Message-Id: <C5AFA553-6EB1-453E-B396-DD19139E7228@collabora.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820152347.1815097-1-igor.korotin.linux@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Igor,

> On 20 Aug 2025, at 12:23, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> Add a new `rust_driver_i2c` sample, showing how to create a new
> i2c client using `i2c::Registration` and bind a driver to it
> via legacy I2C-ID table.
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
> MAINTAINERS                     |   1 +
> samples/rust/Kconfig            |  11 +++
> samples/rust/Makefile           |   1 +
> samples/rust/rust_driver_i2c.rs | 128 ++++++++++++++++++++++++++++++++
> 4 files changed, 141 insertions(+)
> create mode 100644 samples/rust/rust_driver_i2c.rs
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c44c7ac317b1..2654a7ea0c80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11523,6 +11523,7 @@ R: Daniel Almeida =
<daniel.almeida@collabora.com>
> L: rust-for-linux@vger.kernel.org
> S: Maintained
> F: rust/kernel/i2c.rs
> +F: samples/rust/rust_driver_i2c.rs
>=20
> I2C SUBSYSTEM HOST DRIVERS
> M: Andi Shyti <andi.shyti@kernel.org>
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index 7f7371a004ee..28dae070b365 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -62,6 +62,17 @@ config SAMPLE_RUST_DMA
>=20
>  If unsure, say N.
>=20
> +config SAMPLE_RUST_DRIVER_I2C
> + tristate "I2C Driver"
> + depends on I2C=3Dy
> + help
> +  This option builds the Rust I2C driver sample.
> +
> +  To compile this as a module, choose M here:
> +  the module will be called rust_driver_i2c.
> +
> +  If unsure, say N.
> +
> config SAMPLE_RUST_DRIVER_PCI
> tristate "PCI Driver"
> depends on PCI
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index bd2faad63b4f..141d8f078248 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_SAMPLE_RUST_MINIMAL) +=3D rust_minimal.o
> obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE) +=3D rust_misc_device.o
> obj-$(CONFIG_SAMPLE_RUST_PRINT) +=3D rust_print.o
> obj-$(CONFIG_SAMPLE_RUST_DMA) +=3D rust_dma.o
> +obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C) +=3D rust_driver_i2c.o
> obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI) +=3D rust_driver_pci.o
> obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM) +=3D rust_driver_platform.o
> obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX) +=3D rust_driver_faux.o
> diff --git a/samples/rust/rust_driver_i2c.rs =
b/samples/rust/rust_driver_i2c.rs
> new file mode 100644
> index 000000000000..6dfc299d5aea
> --- /dev/null
> +++ b/samples/rust/rust_driver_i2c.rs
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust I2C driver sample.
> +//!
> +//! This module shows how to:
> +//!
> +//! 1. Manually create an `i2c_client` at address =
`SAMPLE_I2C_CLIENT_ADDR`
> +//!    on the adapter with index `SAMPLE_I2C_ADAPTER_INDEX`.

Blank here.

> +//! 2. Register a matching Rust-based I2C driver for that client.
> +//!
> +//! # Requirements
> +//!
> +//! - The target system must expose an I2C adapter at index
> +//!   `SAMPLE_I2C_ADAPTER_INDEX`.

Blank here

> +//! - To emulate an adapter for testing, you can load the
> +//!   `i2c-stub` kernel module with an option `chip_addr`
> +//!   For example for this sample driver to emulate an I2C device =
with
> +//!   an address 0x30 you can use:
> +//!      `modprobe i2c-stub chip_addr=3D0x30`
> +//!
> +
> +use kernel::{
> +    acpi, c_str,
> +    device::{Core, Normal},
> +    i2c, of,
> +    prelude::*,
> +    types::ARef,
> +};
> +
> +const SAMPLE_I2C_CLIENT_ADDR: u16 =3D 0x30;
> +const SAMPLE_I2C_ADAPTER_INDEX: i32 =3D 0;
> +const BOARD_INFO: i2c::I2cBoardInfo =3D
> +    i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), =
SAMPLE_I2C_CLIENT_ADDR);
> +
> +struct SampleDriver {
> +    pdev: ARef<i2c::I2cClient>,

FYI: the pdev nomenclature is still here.

> +}
> +
> +kernel::acpi_device_table! {
> +    ACPI_TABLE,
> +    MODULE_ACPI_TABLE,
> +    <SampleDriver as i2c::Driver>::IdInfo,
> +    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), 0)]
> +}
> +
> +kernel::i2c_device_table! {
> +    I2C_TABLE,
> +    MODULE_I2C_TABLE,
> +    <SampleDriver as i2c::Driver>::IdInfo,
> +    [(i2c::DeviceId::new(c_str!("rust_driver_i2c")), 0)]
> +}
> +
> +kernel::of_device_table! {
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    <SampleDriver as i2c::Driver>::IdInfo,
> +    [(of::DeviceId::new(c_str!("test,rust_driver_i2c")), 0)]
> +}
> +
> +impl i2c::Driver for SampleDriver {
> +    type IdInfo =3D u32;
> +
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D =
Some(&ACPI_TABLE);
> +    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> =3D =
Some(&I2C_TABLE);
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D =
Some(&OF_TABLE);
> +
> +    fn probe(pdev: &i2c::I2cClient<Core>, info: =
Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
> +        let dev =3D pdev.as_ref();
> +
> +        dev_dbg!(dev, "Probe Rust I2C driver sample.\n");
> +
> +        if let Some(info) =3D info {
> +            dev_info!(dev, "Probed with info: '{}'.\n", info);
> +        }
> +
> +        let drvdata =3D KBox::new(Self { pdev: pdev.into() }, =
GFP_KERNEL)?;
> +
> +        Ok(drvdata.into())
> +    }
> +
> +    fn shutdown(pdev: &i2c::I2cClient<Core>) {
> +        dev_dbg!(pdev.as_ref(), "Shutdown Rust I2C driver =
sample.\n");

This should probably be dev_info!()

I know that in general people want drivers to be quiet but:

a) this a sample driver that is probably the only way to test the =
abstractions
for the time being, so we must know whether probe() and shudown() are =
working
by inspecting these traces.

b) Unless something changed recently, there is no way to get dev_dbg() =
to print
in Rust for now, as there is no support for dynamic debug. Andrew was =
working
on it recently [0], but I don't think the patch was accepted yet.

> +    }
> +}
> +
> +impl Drop for SampleDriver {
> +    fn drop(&mut self) {
> +        dev_dbg!(self.pdev.as_ref(), "Remove Rust I2C driver =
sample.\n");
> +    }
> +}
> +
> +// NOTE: The code below is expanded macro module_i2c_driver. It is =
not used here
> +//       because we need to manually create an I2C client in =
`init()`. The macro
> +//       hides `init()`, so to demo client creation on adapter =
SAMPLE_I2C_ADAPTER_INDEX
> +//       we expand it by hand.
> +type Ops<T> =3D kernel::i2c::Adapter<T>;

I am not sure I understand. How is a type alias related to =
module_i2c_driver at
all?

Do all drivers need to introduce the alias above?

> +
> +#[pin_data]
> +struct DriverModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
> +    _reg: i2c::Registration,
> +}

I was expecting this to be ARef of something, most likely I2cClient?

This is where my knowledge of i2c drivers start to fall short, but =
others will
probably chime in :)

> +
> +impl kernel::InPlaceModule for DriverModule {
> +    fn init(
> +        module: &'static kernel::ThisModule,
> +    ) -> impl ::pin_init::PinInit<Self, kernel::error::Error> {
> +        kernel::try_pin_init!(Self {
> +            _reg <- {
> +                let adapter =3D =
i2c::I2cAdapter::<Normal>::get(SAMPLE_I2C_ADAPTER_INDEX)?;
> +
> +                i2c::Registration::new(adapter, &BOARD_INFO)
> +            },
> +            _driver <- kernel::driver::Registration::new(
> +                 <Self as kernel::ModuleMetadata>::NAME, module
> +            ),
> +        })
> +    }
> +}
> +
> +kernel::prelude::module! {
> +    type: DriverModule,
> +    name: "rust_driver_i2c",
> +    authors: ["Igor Korotin"],
> +    description: "Rust I2C driver",
> +    license: "GPL v2",
> +}
> --=20
> 2.43.0
>=20
>=20

[0]: =
https://lore.kernel.org/rust-for-linux/20250611202952.1670168-1-andrewjbal=
lance@gmail.com/


