Return-Path: <linux-i2c+bounces-11832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 443B3AF96E3
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 17:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DBEA7ABE75
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 15:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B8E2D29DF;
	Fri,  4 Jul 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NETME7G1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EED1E2614;
	Fri,  4 Jul 2025 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643343; cv=none; b=tOEMs6arljKZPPQ+/TCHVgT637XqO/A9z233ubh3P7rA1sjKG3JkdvCGXVb8Clkz9tn9rrG97l8rulS1Q0KnMngW1Hcfwt3SlaAXjnKz/lFae6JXf59jdeOc7c7D8UwJBFWueoAth89PjEGvSgAmgZv3pxZMrJwb+KLmud9SBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643343; c=relaxed/simple;
	bh=9XNM1qLRpm7fiyDmLGrtrcj/3GIaT6hkKfkqd71D2aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UoZrQijQiwVvOiwXO13eqADw/t5UckFJ8LkRd1A6qtbw18vdxH82olAwqOlYCiDhP13l1AyhnOp2fK0ZUbzsRPqgdoPG1EV0tc8R2bZFFhqea2DNsiyhaAxA/N2KA+gaINdVkzXfhBecDhmKVMSG4pdppmeCziwA/oIIVVT50OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NETME7G1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453398e90e9so7052685e9.1;
        Fri, 04 Jul 2025 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643339; x=1752248139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kN+P++wgn6VZ7R5SIjGo6LxITIRZcUIj55TIgiJeZPQ=;
        b=NETME7G1S2pSisRgv3NvVmxPSzKpnodkdZVbv9gJ/mN2Bt9lCiQ1O2M6dHs2lIHnn9
         o7OWiPnlofwkMteDQZFm2KJ5otOh0eXigfMakv13jtQZ286SNOZHGYLOZMSRIBlT6985
         DlXd3OtW6XK+k97QEfZR+RsoTWAG6heQ+oFzXoMoWYTNpT/sh63LEw8JCB/jruenXE6i
         i6iqsWjcYb/m11wo/tksPJ3jQMWqv7HOdsOuEp/UEPFd7wYbeYTOl0dtmSuEy3Cww++v
         2SD0dTn3dW7AO8lMJBGZjh1GpxIVBQ0ocfgkqooUAUgXXGgY25PwI/S0m22mZ8AAaRzp
         XAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643339; x=1752248139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN+P++wgn6VZ7R5SIjGo6LxITIRZcUIj55TIgiJeZPQ=;
        b=AMvLAOo6aFnBRKwFcfPYyCwRjLVKherUBIj7CkX5o+IcuJBFQfAR6BxSwBHi46LNnd
         wR8XKLR6ZCMYAKwiNHkI6J+xOqm0EmgrwZzbI+Vjh8RQaU4o+IU+xWTC/0A4LxLfZ6sA
         Ejc12Dh8q2bBwItijLLmJcMjjk/rXXtnkZWLKx1TMwYrtGDzxKTgLKhUX5lZHTqZeOpM
         EXW5XufJZneQt8fI//8FPp0ohqBsm2AFqMluqXkJ436RNBDgqpU/RQddUnh4I8P1C1vc
         RLzrQC270prfyh46aCM+icbu3FOUSyHnges8WUUQmmGtf6Snc+1puGfxIuSbSC9XHhiL
         AtZw==
X-Forwarded-Encrypted: i=1; AJvYcCU5HzdPX+jX9P+0FVetiwlUZfLFh8PJ+OA2bFpONGeoQd9S1sr5BHsEHOwyuuL3F7laf7n9TDAwwxy0cdlC5pI=@vger.kernel.org, AJvYcCWxpkFSRKfX1N3u+uCGIWVa9NIGajR/7YetUGym3EYYws1I/F/e3IF4Uvd3KpC8tvcL92a7DLtv7VM=@vger.kernel.org, AJvYcCXUG0rCs8B2v08NeX3ALzKgZKoDvmcEKWBxw27WN2CQ72nuZp3Ho11DBUQash1bYfheLUpXntMLHsyXPBdR@vger.kernel.org
X-Gm-Message-State: AOJu0YxnEkazbWncANCSBbaWRY9wok5v0p1/WNdMfS5VoFw7rZqPxxKs
	XhDPSC8ihGhev9dYB0OUxj0vwd0woGhhXt73VegXn5GsS4ohxUTL9adlWqJw9Pfbkn4=
X-Gm-Gg: ASbGnctH8uO1oTB1tfzxXFlSqUnJJiQ9eabfY0sEe8k9rA9bCWxVO0j6/B+9rGrTaYe
	+1OB+HBaoVyr6sOSDnhZSM+N7XZQfkVNhASXW/9dqAplvoa27MVwYAKZNrDDIrqR1iSM0g8EoVF
	bSRo110Ag8XaJw5a7GMFcuqUQGtSfkXp1LdV9waKNKDhNeFSalOulXywWkZvplFTDpKfosqA8Sp
	Uk+Xyj3w6bM7J/MvZWlxLh6t27XZSgRiKnx2iC8PmgeTwXsC5STy2mmgF/XJJs9m7s/f7XpIpea
	LGSEaE7h+cAT603pA7SV7xoXcLjF9IfsRJ3OjWcIqLcNscp+TyMtVDqD4jAo/m3Tl2B3odYu0eR
	41TooJ+OLLhRZL1jamGf5/EC0s3fq/e3n/FlL
X-Google-Smtp-Source: AGHT+IEHIbq3wa0/hRtNzOKHvuH2gq3hNf1lEbKvJ0ODKMYcW/0PWbprq6rFKyYvjTZywbgsSFgcfg==
X-Received: by 2002:a05:600c:35cc:b0:450:d3b9:4b96 with SMTP id 5b1f17b1804b1-454b76ad107mr19002375e9.13.1751643339074;
        Fri, 04 Jul 2025 08:35:39 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b188e84dsm28976375e9.38.2025.07.04.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:35:38 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
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
Subject: [PATCH v2 0/4] rust: i2c: Add basic I2C driver abstractions
Date: Fri,  4 Jul 2025 16:33:32 +0100
Message-ID: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series lays the groundwork for writing Linux I2C drivers in Rust by:

 1. Core abstractions 
    Introduce `i2c::Device`, `i2c::Driver` and `i2c::Adapter` built on the
    existing `struct i2c_client` and `struct i2c_driver`, with safe Rust wrappers
    around probe, transfer, and teardown logic.

 2. Manual device creation  
    Provide an API to register an I2C device at runtime from Rust using
    `I2cBoardInfo`, including automatic cleanup when the driver unloads.

 3. Sample driver (legacy table, OF & ACPI)  
    Add `rust_driver_i2c`, a sample that binds to an I2C client via:
      - legacy I2C-ID table,
      - Open Firmware (device-tree) compatible strings, or
      - ACPI IDs.

 4. Sample for manual registration  
    Add `rust_device_i2c`, a sample demonstrating how to create an I²C device
    on a given `I2cAdapterRef`, and how to unregister it automatically.

Together, these four patches:

- Establish the essential Rust traits and types for I2C drivers.
- Enable driver binding via legacy ID table, device-tree (OF), or ACPI
- Enable manual device creation at runtime.
- Ship two samples showing typical usage: one for firmware- or table-based binding,
  and one for manual registration.

Igor Korotin (4):
  rust: i2c: add basic I2C device and driver abstractions
  rust: i2c: add manual I2C device creation abstractions
  samples: rust: add Rust I2C sample driver
  samples: rust: add Rust manual I2C device creation sample

Changelog
---------
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

 MAINTAINERS                     |   4 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/i2c.c              |  15 +
 rust/kernel/i2c.rs              | 565 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 samples/rust/Kconfig            |  24 ++
 samples/rust/Makefile           |   2 +
 samples/rust/rust_device_i2c.rs |  50 +++
 samples/rust/rust_driver_i2c.rs |  69 ++++
 10 files changed, 733 insertions(+)
 create mode 100644 rust/helpers/i2c.c
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 samples/rust/rust_device_i2c.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs


base-commit: b75e1f0619bd707e027812e262af3fbce445e71a
-- 
2.43.0


