Return-Path: <linux-i2c+bounces-12882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B0B53821
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 17:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77965AA5106
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56783345729;
	Thu, 11 Sep 2025 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma8eQ+/z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE3328E3F;
	Thu, 11 Sep 2025 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605669; cv=none; b=jfJjs9uhdO0Kk/ORWQWrUBq9CCAzRMUCoyUW/pDjPGY52ptjliG3BakvQM0CmyKSpipoatBm+fdTMsGslVFtU0Et2eyd+mC+iiVDdZpVB66WYlqaJiZV4bFLm+WelkB8dpNGLHV/kXou/HhjZ19CO0HVTmaFJw7UOfOA8tWycqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605669; c=relaxed/simple;
	bh=KrD4lWSdecI/+3bwPZe4TX6Cn1GbTfULQTAKLOkD7LE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gjlJ6Px9i3XUj3bv9Yn61xvKu892Rm+LldzwS4nuFsBtX+XamkQeyrXcQlwF///sB4K8YWAcrfxh/5j9pNWv/MLzvR/FQimvuvjb7ERCFCiyv99WklkBFHP2TWv6OuLn3y4DOLpi8VAVMu//tn33rAn2Q6GV0+YW8g1ezpxh/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ma8eQ+/z; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so1218737f8f.0;
        Thu, 11 Sep 2025 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757605665; x=1758210465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6It5EKz33aRi1AJML35SuBmEOUc5T/In7sSeVq9N+wM=;
        b=ma8eQ+/z5JBXd4oAeAqrn8N/GKJM3i82x+i0TiLUyLTSfMCMGkU867CJBa2bSTFYN5
         bSkVYYmeZE17XbPWISF8UWBjZ+HgtIrclp4L78Syjvyh8mb/iI6IUV4DTkYknohJfnX9
         qBDImYfMaRC92aNglgM/Jbem3XbmD42LKt4/xxohXN4UFj5Rc5qUvrRq9pUfZnfwougA
         ga+1yCNGQmK9Lt/vs2lr1tsPckDbpOA3/nkpO7CTFNo/fyCEqDNF9WW5DFMbXt6hycHl
         lS5XqmpbphR+ehLZR7yuIa1uH/HbqI09gECN/hciOObZN2mwoq3DDnR6z4QUIckQorxu
         ocyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605665; x=1758210465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6It5EKz33aRi1AJML35SuBmEOUc5T/In7sSeVq9N+wM=;
        b=LNlkWrj/WEqmTRX8kLvWNMr6bqWRKxyGnDgTXB2WsUu/ZDaOHQJkUP76VqVP82oB42
         HKd1z7S5Bmuj+FOXFSvgfkpawoDSE2RFnnpjcjtrbjoW+53nS0/HlSxppv1Qw49luhLc
         autCHGunKM0pFnDniKe610FVAKQpa5m9mBUORq0hyLcsVNZXXLcSontWanc0jKla0Udd
         PTsEDRCxM4H8IqGqic33AQGbxd+NumYiyKVS4irn8jsKNuzQiId4Bctwkg8NzUkIP0bc
         Gb/mR5lWgNzu1MdgcNNxFfLf8mFRq1ZtlIXDnB6IiVGM37lpS6wM96zBZ/C/NF4HQU5u
         nI4w==
X-Forwarded-Encrypted: i=1; AJvYcCVz4aZ94dMOtaYnbqXuq0e/42vmdW+JwSbD64nqultNefBhAPxRcmXRUi2pjN4n6B4778NRim0yGyC9mLYolpk=@vger.kernel.org, AJvYcCWnDWvw0ANXFzC6vcFjYqvk5c+r1YfV1rThquWdd9jdo/XnLh5SEj/ekQWc5glT3dxpxQOqh9MIwm/55JBf@vger.kernel.org, AJvYcCWtV0VMldnJLa5+G8Z2Y/vjV5wpEdEKxFf+SStYb7ugQU5yJTnd/7bFpwZpfQO1v6PTWmtP5Vy4T8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEluU3XpNDERxBI2p1GoXgeId1u7pvftG2kuR2Ot2o530pYpSu
	I9Jyg9ZpRr2AdShUixE5QvXVt6i1QRaW0DdgXx5H76bJgHcruhPt8ArBD41lMw==
X-Gm-Gg: ASbGncuCHKdtd+DwgiWHNv0B5l8JWEu3ghGeN66Gsfn1M5SKabElL8S+dfLhL+dCyWS
	2nvhbuEXcebhTPSn18CW2w0JWQVDIja1K5Owdv/cYtkavpC856KyHvEDnuTcRZh60Eg8T+uU9sW
	pc/d3aDdKBBqMS15KFerU0Z+6/NL7pqKYvJFdO3glWeAyYMZ6MW5VO8V9LXkQTEu5zEmA2TSlp6
	Zoyvgabom+hH4wa4TMlEZBHH5rtQP1yBLOQOjna3hHRopFtxPkzBZKyIybZTrACxacFzVhjalcU
	U7zepVAG+Qq2WAuijnQbEsunEnF9M+gEebtdzL2k/cangf0Rkw561p17attRWwwzs/5auk/6WoW
	jNTvTHau4VeMVascHIdWw+bS13RrxPSvBnsALaH8zGs/8p44=
X-Google-Smtp-Source: AGHT+IGorxw+6+vyKtDRsWImO+qVuBEhRyUsI34lT7rPMpPKae3x0GLKWl+jIXB3rC0Tb7IKUutSxg==
X-Received: by 2002:a5d:64e9:0:b0:3e2:3717:cce5 with SMTP id ffacd0b85a97d-3e75e16b341mr3223389f8f.30.1757605665150;
        Thu, 11 Sep 2025 08:47:45 -0700 (PDT)
Received: from localhost.localdomain ([152.37.120.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03729c76sm28250545e9.6.2025.09.11.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:47:44 -0700 (PDT)
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
Subject: [PATCH v5 0/3] rust: i2c: Add basic I2C driver abstractions
Date: Thu, 11 Sep 2025 16:47:17 +0100
Message-ID: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
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

 3. Sample driver (legacy table, OF & ACPI)  
    Add `rust_driver_i2c`, a sample that:
      - creates an I2C client device using `i2c::Registration::new()`
      - binds to an I2C client via: 
        - legacy I2C-ID table, 
        - Open Firmware (device-tree) compatible strings, or
        - ACPI IDs.
      - destroyes the I2C client device on exit.

Together, these three patches:

- Establish the essential Rust traits and types for I2C drivers.
- Enable driver binding via legacy ID table, device-tree (OF), or ACPI
- Enable manual device creation at runtime.
- Ship a samples showing typical usage 

Igor Korotin (3):
  rust: i2c: add basic I2C device and driver abstractions
  rust: i2c: add manual I2C device creation abstractions
  samples: rust: add Rust I2C sample driver

Changelog
---------
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
 rust/kernel/i2c.rs              | 547 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_driver_i2c.rs | 128 ++++++++
 7 files changed, 699 insertions(+)
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.43.0


