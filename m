Return-Path: <linux-i2c+bounces-12353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F85B2E108
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 602FA1CC25FB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B5D320CBA;
	Wed, 20 Aug 2025 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEiaRut0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED57277CBD;
	Wed, 20 Aug 2025 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702994; cv=none; b=gByD++/vujHPFuyvOUjV5sE6Felv7nhelkr1DWEJRqj2JoAzx7/+3YxjlbjCGVl2H2feGrF6kKx6jS/qei1C8WibQzs2KAyErlhq9b2suMSbw0ePBzRYaFFFrnSrOxQBMrRtlqNXl/rNxdWRUEJDM7boYFll03Xj4fI3abuU+0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702994; c=relaxed/simple;
	bh=749uBb/pGmAeIug/3o3yzGW/ONKGvlx613eaMiN+VUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eLQTTH/ippaO4o031upe/cKMhgODzfnasK8Evp4Rpy2aGLcTI2LKqDQD2f0xGp07t0yDr2dnTi55lJdU7uXNbdWRUFrPXSSYxz5gIZcLBYvKUkoC97SEhGtsNp4ob0SpnWduITNXe93Oie5Bw1tKnUGcjQU9EtnkJIvRU5gOC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEiaRut0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9e4148134so15750f8f.2;
        Wed, 20 Aug 2025 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702990; x=1756307790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DB4csv4Nx/Xcf5lG8xF6sSN64vv18qzmEaSXMDFFpNE=;
        b=BEiaRut0cZMRzahNfN4/BSfI5KUAHU6FNZJUeyG/knXxb9/AA0NqCfGtIhh1vWc0Es
         hKhDdkcWfr70TRWW0ljGc3DT/w2SNOizhgXS/k5bFy/1e8di7I6x1fTeRIaYztd88vJe
         /d4P3katvAuGSmfVXeBX7Fn9lBBPg+2mATSwAXeIJyJKBv+6pHkS2/Y3w8Q/7V8C/R5l
         1QH7s2IROwurlWRiQOln8SPTEJZdbsDqcwbJ63wCTqVONCBccR4hd9s4ytwCEFyEuUt0
         Z363MuZ8obyAurJP62JXNwhka/4eJoETBOjLvdaXf7vtYwjbLd5ISif7wu7rCLaOppvJ
         8u+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702990; x=1756307790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DB4csv4Nx/Xcf5lG8xF6sSN64vv18qzmEaSXMDFFpNE=;
        b=w8JKrHhiM8bjwzXSA25TM3CVa/6ZPZnR9EIjjF1oN9ylbpXqyNYlL/XILxBU+81N38
         KD1R0nXT2H3XxSXiGV6yXEWR1uQ4iJej4BSm+KexkX0/vThxScakWUgpQSifBZiYQQ3M
         vw1P6SwscebqA4eMCr4W259D/urVjb0tONPUaizVhUQLwzpByAxciMbzHhlIIRyxenLM
         E/gs0TXH5EA0szHnazJXDH2Sq3fL7OApBpE+O4OE72ozcIJ5Alv1B6te51QpAOSgwWpq
         lgqsIlL9RcWCmoT150Qx9BHood/Dn3PBwTtFX9Alkx6Mz89Rk0Ds3QUVePz1Xd5lnijQ
         bCPA==
X-Forwarded-Encrypted: i=1; AJvYcCUukryxKQI02CS7o7vFKbxML4V3JPIG9tPk/eiWUTQaf85jB5CLGPaXUd3urS8q/FKknLaECxprE0kXrrj1sJs=@vger.kernel.org, AJvYcCUzDXRhziih3aoL1n2npWmnfcpN+ea3iKmuAePCxClS4uJaPv49RrCgJP5rCCklalU7aibR2vpiR1U=@vger.kernel.org, AJvYcCXudmwTfN2LW0prHotg7qmjjrF95FZp9bxCCbtr8wnwT6i+V1GvvSR4vnB5DIPBt+Befc0jYm7VD/UJgC/p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qJtMJ5mzXY+eGaoCMFENsBWTB5SuVA/d4DqLwwFLLksoGtrB
	dbTrENRx1d5jrTE+tYjzAS2G5f+HEOuzKmTooU1PYT3PwEhVk4JIxJIg
X-Gm-Gg: ASbGncuaDkVQ6t1rY3pTtcTM2gb/cJ+69yOvXlxISEZyoQStVfqrWQXiZLl96Cs45np
	Xx0kLpJSCU5wWMEfKj0SU5dg1iRYPEih0MtKzj/zkc/uRyELwfr7ztQ7AVQYDGQ49VgPE1b1+Ub
	VBodOx1filQM/O8efT7gDR0k19tjA5ZupjvjVHeOn/fsVvMZd22KyqaPHZuF7Fo/WP1A9X6A8w9
	Xs1pcAfWhlUAKItYpMt+rE3kGAHwkJ1q/+so8saZ+Uo7s7V7480j/v2yhzlgdzbJci+iKM6RXRx
	QUARs7HxuZ6iuRnf8o9uZXpUjanJSRK56HzvZ2XIeloaN8jbBhvTo6DQ+rO6fJ8w5pT+BEgMmAv
	RkN2ev1S3ogOmAmqOTzrJBLIpKkepia4xyX1ONF1RhBmlabidAgiQVJ2mPIXWg7JA1PfRyeorzB
	3UMrPQ+/g=
X-Google-Smtp-Source: AGHT+IG2EmyrtA3+Awe0MPJpGt/5Kb3fCYM2EU9OIxcdorGYPmlsLQnNfC0XyjImEO38VIWiI3ClSA==
X-Received: by 2002:a05:6000:24c1:b0:3b7:96c0:4172 with SMTP id ffacd0b85a97d-3c32da77504mr2511732f8f.11.1755702990185;
        Wed, 20 Aug 2025 08:16:30 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c8e379sm41806665e9.13.2025.08.20.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:16:29 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Subject: [PATCH v4 0/3] rust: i2c: Add basic I2C driver abstractions
Date: Wed, 20 Aug 2025 16:14:27 +0100
Message-ID: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
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
 rust/kernel/i2c.rs              | 568 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_driver_i2c.rs | 126 +++++++
 7 files changed, 718 insertions(+)
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.43.0


