Return-Path: <linux-i2c+bounces-14029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA1C463ED
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 12:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A1934EBCC4
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD0130AD0C;
	Mon, 10 Nov 2025 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEWLxscV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4991530B518
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773886; cv=none; b=LU4zq4PJ4a+l/HGyCJEEzJuuam7DDTVVGXuo9QWztyR0PO7HEC3ze6/mxqqIn9IcCG3FJy+pAf6M4aC8spiUpz2DJV0UhcWlim3NGu+t3ElOMwwdKCiJs4Oi2OalEClIUWnwJ97fumhI87qm7cKJXZGeymo/6Po/XIMAkN8LA7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773886; c=relaxed/simple;
	bh=bXaL2Q/OOT0QZFrfeGCgOwFrFPBNuexxv54NnpqEnoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XOycELPbBTqDIZyRsymZQ1xjyZdT6fPpPrXnxyO5d7cCuGzOXZdbZAd7/trwNvtxnkOV+8fRqgGxs69hqQN4pn4mUcVNmPycX8flMk0Gqpncg36WNeqOhXEXbdRFewm70raI/7XPJInZa/6ZeHBuV6zOrE91TA9NIBGedz16n5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEWLxscV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47777000dadso10005385e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 03:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762773882; x=1763378682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqpcSIjTdOGkW8tI36rsEjRjMmrxJ/7uAGernKYST1s=;
        b=GEWLxscVVJAHclma32bOoXkMfrZmcP9MFUGf575DKxxiKHgT0X9IJ1UMCN4o4ztWm1
         8p+uHUuLcBJAf8LTcnepZhM7WpkzKaOW09BGMr2TuwqkNwMUVizH29iJEuaRnaM4IFPk
         ulEcEmli2TMQarJ9NoZKlRzYdTd8JIZ5HFu9ouwnPD4eE5uqwzcQn3Clw9P7v3995lMX
         +R/OAvVXxPS9dimjzqdHU30KDesqydQiFbYeHaTSYy/ztrJhwIaxY6yn299Ogdvo+QmT
         3sJF2T/3GyLcVNFLbpjAnKGY/EuUnnb/qjjHFpd0HMxRX1fin9+v6wo7qzF1SHdfqS8Q
         UXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773882; x=1763378682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqpcSIjTdOGkW8tI36rsEjRjMmrxJ/7uAGernKYST1s=;
        b=dWctZ2nclioRZdW89idCprg/AbEVctIHnplBIcO6MFaVAbNzl7OboUt75KwNj/Y0J0
         9ZKETr5hwdZyTB3ttgneYPar9y+sq329KRRKu4JeFFyN33Q2UEa9zIOE5OxvYPhfnvJU
         7oD0ta0xcqRkO9/I6XuCzcqf8Td2proTLygWVSWpuMpJG90cJx3fLKudfdv0QDaCe9yw
         u1mjD6XMCA+gZG1lB9zrs62NxUozk6mJtEJKhpr8PKjjGZmEebqmPilI6+t+EjYI1jEZ
         QTywcL9nRWfHGKzc5bTeR2MTCaiJiuwVa+Ws0w3mWd0nKYhN80nlhilWKbShdnxnIBw+
         9ulg==
X-Forwarded-Encrypted: i=1; AJvYcCXQXUpLAibnZB7p1Ka/cLq5Ol2KPcXNk4QpWS3R3zH1+8rFwDr2cPfrXGpVydeguX6wzRiP4nHo3+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDiZCX2SxsGmW0PDoqWGU0HZfjg1cYwkX18R1roeu4BdDFkYZA
	mK7Ss/x2bS2uMtbUd1AhpXqZr1YIcDZI+x2kdZ1sHEmOl7sWWKEe3DTd
X-Gm-Gg: ASbGncsb2J3GVnGirAqsDG444cL4ngPsGNqS0vq4Y9n55gWgbOOdXTZf8/pNjW2Bv70
	j6FLrqadZAzr5XDg7xMkHXyyiGr6YnXgceZyTynhRkiXnGVKIBYSiDl3QUP9YVQRnCL9wRgjY5L
	EHSvPOpD1c8064KguFLJcRjdubZ8ilmXGLwHJt2RGlZu1m/53h4N2ZMoLdWV6nMLfxPgYgyFl5m
	ltP4DuaaDs6E+95eL8sq9tSTXa2K6s/wAMaJ712Fcf0QKvnuG44PkTm5XfkykKMc/I69cGAqvNr
	eFH6hDPSVGpnfrtOL0dqcQlIxnUbY+kxkZeY8Lo5Rl0Dkmcwfd+OVYdEg/2Hxm3xVEIkp29WEss
	2mMp5Kme9fOcIogedj5fsxPNIInB+37pCRK9fKZ/CpYPxeL8PeWn1iewzByUfipL7+6eQ0RvCwR
	+Uom1mIvQMCXoD3AU=
X-Google-Smtp-Source: AGHT+IGMLUJXienf/8Q4HQ40EqQfXXYxXHdVd5b3XIxtGyOR9JOVmu9P7FhLecpRE27xYkvpT/yB+A==
X-Received: by 2002:a05:600c:840f:b0:477:54cd:200f with SMTP id 5b1f17b1804b1-47773236f0emr60309115e9.9.1762773882143;
        Mon, 10 Nov 2025 03:24:42 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47778daf2c3sm88877575e9.10.2025.11.10.03.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:24:41 -0800 (PST)
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
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
Subject: [PATCH v7 0/4] rust: i2c: Add basic I2C driver abstractions
Date: Mon, 10 Nov 2025 11:24:37 +0000
Message-ID: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series lays the groundwork for writing Linux I2C drivers in 
Rust by:

 1. Core abstractions 
    Introduce `i2c::I2cClient`, `i2c::I2cAdapter`, `i2c::Driver` and 
    built on the existing `struct i2c_client`, `struct i2c_adapter` 
    and `struct i2c_driver`, with safe Rust wrappers around probe, 
    transfer, and teardown logic.

 2. Manual device creation  
    Provide an API to register an I2C device at runtime from Rust using
    `I2cBoardInfo` and `I2cAdapter`, including automatic cleanup when 
    the driver unloads.

 3. Sample I2C driver (legacy table, OF & ACPI)  
    Add `rust_driver_i2c`, a sample that:
      - binds to an I2C client via: 
        - legacy I2C-ID table, 
        - Open Firmware (device-tree) compatible strings, or
        - ACPI IDs.
 4. Sample I2C client registration (OF & ACPI)
    Add `rust_i2c_client`, a sample that:
      - binds to a platform parent device using OF/ACPI table
      - registers new I2C client bound to the parent platform device
        using `i2c::Registration::new()`
      - destroyes the I2C client device on exit.

Together, these four patches:

- Establish the essential Rust traits and types for I2C drivers.
- Enable driver binding via legacy ID table, device-tree (OF), or ACPI
- Enable manual device creation at runtime.
- Ship a samples showing typical usage 

Igor Korotin (4):
  rust: i2c: add basic I2C device and driver abstractions
  rust: i2c: add manual I2C device creation abstractions
  samples: rust: add Rust I2C sample driver
  samples: rust: add Rust I2C client registration sample

Changelog
---------
v7:
 - Rebase and update `i2c::Driver::probe` function based on patch 
   series [1].
 - use `i2c::Driver::unbind` instead of `drop` in 
   `i2c::Adapter::remove_callback`
 - Implement and use `i2c::Driver::unbind` for I2C SampleDriver
   instead of Drop.
 - `i2c::Registration::new` requires a parent device to which a new
   I2C client will be bound. 
 - `i2c::Registration::new` returns `impl PinInit<Devres<Self>, Error>`
 - The existing rust_driver_i2c sample has been split into two:
   `rust_driver_i2c`, which demonstrates the implementation of an I2C 
   driver, and `rust_i2c_client`, which demonstrates registering a new 
   I2C client bound to a parent platform device.
 - Link to v6: [2]

 [1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/
 [2] https://lore.kernel.org/rust-for-linux/20251005102226.41876-1-igor.korotin.linux@gmail.com/ 

v6:
 - Add implementation of unbind for `i2c::Driver` trait;
 - Add argument `Pin<&Self>` to `i2c::Driver::shutdown` method; 
 - Adjust usage of `i2c::Driver::shutdown` in 
   `i2c::Adapter::shutdown_callback` in `i2c::Driver` trait code 
   example and in rust_driver_i2c code;
 - Remove dummy AsRef implementation for I2cAdapter. Adjust code 
   in rust_driver_i2c;
 - Add `i2c::I2cAdapter::get_nr` method that returns I2cAdapter index;
 - Optimize unsafe sections in inc_ref/dec_ref in AlwaysRefCounted 
   for I2cAdapter implementation;
 - Remove unnecessary Drop implementation for I2cAdapter, because 
   I2cAdapter is always a reference;
 - Remove unnecessary type definition `Ops<T>` in rust_driver_i2c
 - Simplify call of `i2c::I2cAdapter::get` in `try_pin_init!` macro 
   for rust_driver_i2c
 - Link to v5: https://lore.kernel.org/rust-for-linux/20250911154717.96637-1-igor.korotin.linux@gmail.com/ 
v5:
 - Rename missed pdev variables to idev (thanks to Daniel).
 - Import `crate::device_id::RawDeviceIdIndex` and 
   `crate::types::AlwaysRefCounted` in i2c.rs.
 - Switch dev_dbg to dev_info in the sample I2C driver messages.
 - Make `I2cAdapter::get()` return `ARef<I2cAdapter>` instead of 
   `&I2cAdapter`.
 - Remove `TryFrom<device::Device<Ctx>> for I2cAdapter<Ctx>` (unused; 
   to be reintroduced in a later I2C series).
 - Remove `AsRef<device::Device<Ctx>> for I2cAdapter<Ctx>` (unused; 
   to be reintroduced in a later I2C series).
 - Add `AsRef<I2cAdapter> for I2cAdapter<Ctx>`.
 - Use i2c_get/put_adapter instead of get/put_device for 
   `AlwaysRefCounted<I2cAdapter>`.
 - Update safety comment for `unsafe impl Sync for Registration {}`.
 - Tweak comment for `I2cBoardInfo::new`.
 - Adjust build-time assertion message in `Adapter::register`.
 - Link to v4: https://lore.kernel.org/rust-for-linux/20250820151427.1812482-1-igor.korotin.linux@gmail.com/ 
v4:
 - Renamed `i2c::I2cAdapterRef` to `i2c::I2cAdapter`.
 - Renamed `i2c::Device` to `i2c::I2cClient` for consistency with 
   `i2c::I2cAdapter` and to avoid confusion with `i2c::Adapter`
 - Reworked `i2c::I2cAdapter` to be an Opaque around `i2c_adapter` struct
 - Implemented AlwaysRefCounted trait for `i2c::I2cAdapter`. 
 - Fixed numerous comment mistakes and typos all over the code, thanks 
   to Danilo and Daniel
 - Got rid of all unwrap() use-cases in i2c.rs and rust_driver_i2c.rs.
   This covers 0-day kernel panic <202508071027.8981cbd4-lkp@intel.com>
 - Removed unnecessary casts.
 - Replaced all addr_of_mut! macros to &raw mut.
 - In `i2c::Adapter::register` method build assert if all ID tables are 
   None.
 - Renamed all pdrv and pdev instances to idrv and idev respectivly 
 - Implemented an ealry return in `i2c::Adapter::i2c_id_info`
 - Added all missing Safety comments. 
 - Removed `unsafe impl<Ctx: device::DeviceContext> crate::types::AlwaysRefCounted for Device<Ctx>` 
   implementation which came to v3 from v2 by mistake.
 - Added more details regarding i2c-stub driver usage in rust_driver_i2c
   comment.
 - Changed `i2c::I2cAdapter::get` return type from `Option<Self>` to 
   `Result<&'static Self>`.
 - Added Daniel Almeida as a reviewer to the "I2C Subsystem [RUST]" entry 
   in MAINTAINERS, per his offer.
 - Link to v3: https://lore.kernel.org/rust-for-linux/20250801153742.13472-1-igor.korotin.linux@gmail.com/
v3: 
 - removed unnecessary i2c_get_clientdata and i2c_set_clientdata rust 
   helpers. Using generic accessors implemented in [1] instead.
 - Reimplemented i2c::DeviceId based on changes in [2].
 - Using from_result in i2c::Adapter::probe_callback
 - Using explicit drop() for i2c client private data in 
   `i2c::Adapter::remove_callback`
 - replaced device::Device::as_ref() with device::Device::from_raw in 
   `i2c::Device::as_ref()`. It is renamed in device::Device.
 - Build Rust I2C only if I2C is built-in
 - Reimplement overcomplicated trait i2c::DeviceOwned the same way it is 
   implemented in auxiliary [3].
 - Merge rust_device_i2c and rust_driver_i2c samples. Resulting 
   rust_driver_i2c creates pined i2c_client using i2c::Registration::new 
   and probes newly created i2c_client.
 - Created a new entry in MAINTAINERS file containing i2c.rs and 
   rust_driver_i2c.rs in it.
 - Link to v2: [4] 

 [1] https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org/
 [2] https://lore.kernel.org/rust-for-linux/20250711040947.1252162-1-fujita.tomonori@gmail.com/
 [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299
 [4] https://lore.kernel.org/rust-for-linux/20250704153332.1193214-1-igor.korotin.linux@gmail.com/ 

v2:
 - Merged separated ACPI support patches since ACPI-table support is 
   merged into driver-core-next.
 - Added I2cAdapterRef and I2cBoardInfo abstractions 
 - Added DeviceState generic parameter which is used for `i2c::Device`
   as a sign if the device is created manually
 - Added `DeviceOwned` abstraction which is a safe reference to a 
   manually created `i2c::Device<Ctx, state::Owned>`. 
 - Added Rust manual I2C device creation sample
 - Link to v1: https://lore.kernel.org/rust-for-linux/20250626174623.904917-1-igor.korotin.linux@gmail.com/


 MAINTAINERS                     |   9 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/i2c.rs              | 576 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 samples/rust/Kconfig            |  23 ++
 samples/rust/Makefile           |   2 +
 samples/rust/rust_driver_i2c.rs |  69 ++++
 samples/rust/rust_i2c_client.rs | 142 ++++++++
 8 files changed, 824 insertions(+)
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs
 create mode 100644 samples/rust/rust_i2c_client.rs


base-commit: 8f3d55856900d0fd87aa8f4f2cac10320485dd38
-- 
2.43.0


