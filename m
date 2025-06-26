Return-Path: <linux-i2c+bounces-11616-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00565AEA47A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0422564602
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0F22ED147;
	Thu, 26 Jun 2025 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC9+4I/l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7112ECD21;
	Thu, 26 Jun 2025 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959340; cv=none; b=tEGy+mcQE0dIJ6IWC+tnKVT3dRjDRjl91S2MGjhGlTDWla3GHC9s3atrZQ5ydlTfRs7G3JgOerJt7+iW5515Au8sPvDv5yfAzA99zPjNwHvzwQmHKgK/+HelSEKeMU8chpOGDnoW9bhD2jniuf4ptSbpDXvo1MyvDtiGorfcUPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959340; c=relaxed/simple;
	bh=LRec7XG15yYVqYXD4V+rr6o+ySekVyH57ZR0Z7yirGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGkzhbiViVBkYw8DcOpMv+fc9VdCyOPPwNc4f20HLXHAVvdK3Yydyr4tlZ17jKmVmBH++/X5EIc7iQf6ea2Dxij55WHMCIOOzNMYSptCe6qw1RdAOojUeTEPRDnQOjSaxOW2r70aNnVGOSw0NAyo0VOLrbnUOZgEebZtvB2Yu1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC9+4I/l; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso7608525e9.0;
        Thu, 26 Jun 2025 10:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750959337; x=1751564137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4IQo3oY1NUbU13/kHA6jBPwbWfvABXBa/vUplEI8Dw=;
        b=lC9+4I/lKk3+XliXGiQwFEZ3YiFLSijru5LH72jj3gHowan4/5cigOxCfpnvIf43eW
         0vjFACmGR+gBT1Eh0o7xECDZlh8AeQFemxRd9dA6jh229qsdZcAIFw7ty1iB8aLooUjb
         eW8InxET50RCK4GeobPuls9PmpGYCUdBl1vCbnHk2SIZ4i9xZDsja4PzrKl6zyjO3I3s
         doJFpfuBNsyJc4gBpbUTQK2KeghztLF6phHS72bRFT6hthoih6io3V5aSUULzm3D7PkL
         0kzxoZNzhg+vgfIlpvVPh6aSUxdcI3HQtnEIS19vmwyGL7RHqm9d9ZgggyIrLa3wGhRH
         vKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959337; x=1751564137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d4IQo3oY1NUbU13/kHA6jBPwbWfvABXBa/vUplEI8Dw=;
        b=cbPE/KLMpVKtHuzyhXELhCL2l3tSFd+06OWp7QfzxumWcLM1guTJyEEaP2Ou/MUYuQ
         MA1GyzfsagNkJ/L/SNOL6SFdfCHnifRAsZ759xhHLoZ3J4TggdGBb13mtr20IkUB3PEN
         E/mSJ/CEQ+QuUPKY2qIfEveQwlUxMsJjm2xUTQqgH8wiekhlxG+pMp9306K7dJsnHRx+
         4sjXt4weZyGwStYred3dpsMrNdDzCNgvm6GO5kJueONYX1vH1jVy9VWMAqJvJkwHAamV
         13RyogdtgTng0Ye3j9Kb2xHxj+yw7egr+e8EaARGP4bZZmBKR4U1BU71KOBPjP5NbcqJ
         l46Q==
X-Forwarded-Encrypted: i=1; AJvYcCWohAsBiF/9vjStSWQIll2FeZ8Yk+zg743S+4dJldQzfbT3DFOIZ5rgh1ypbmmc6b+hGjEBRTn6dJw=@vger.kernel.org, AJvYcCXOt8ZzECiXERa96eSxj+m2YNd5CVcJSZCjBGfJrtbs0NGrW5DnkNKnNCG4WWbaR4UM1qm6b8HCgGF+/LValx4=@vger.kernel.org, AJvYcCXXQEgBn/volgbFKnmYFGDmAhi1/Hegt02BFuBQlv/xSmVOO1UdfmDiAGP66zeEOrI334ohGkYGM7Gw350/@vger.kernel.org
X-Gm-Message-State: AOJu0YxH/oMT1K9ljl3e4NPleShxrny5EILDSnONgCyznRiRh881bzok
	HamggzGu11+FBmzKhtW6CK3bW7FDib7sQty17gwngBAX/tnX2Kt2cRUX
X-Gm-Gg: ASbGncuT2MK1M8ZdAFj/RUvH4EAtCDC47y/IXyxLJr9UcbPptuOAedp4Eppjb1Iuny2
	lHH15YDzRLXvC6ME9auD1Wx1NNb6hboAdW1OJzSsxVjM33Ot35m9iHgdMhrXKNCmNNZ8aLMCk7e
	niWcxB+Q9IsoqhX6Wchowduak2V4vY6/y7l94dTFcBZD8DcUqoBUhhMFqFZbNM0vy7C1pgc17E/
	vT72iYmvUujzHNUa5rWjenxoED4u8CI2296jQJ6W7GtRtNwSmHgiFWfFC+57F9++JIUJupY8QYH
	ZsWb8AUWAohS+P3WrLJG4MSDwdxLYhMJZZA0UeQYi+oTKrFAZAXHMCfKuI9H64SyEzaD6gsbjn8
	wxqWYLh1d07GzdbPH0nfTLlXPZp+GOcf+X1FeJRDcfK4QAQE=
X-Google-Smtp-Source: AGHT+IGqs1dKVsAQOBkG0uJKKW00BG6gEADd0HuE55Je6HtpWaL4l7R+DN33oTHYLVPnIixxTCjkUQ==
X-Received: by 2002:a05:600c:3e8e:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-4538ee5ce0cmr2085345e9.8.1750959336485;
        Thu, 26 Jun 2025 10:35:36 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52af3sm460609f8f.50.2025.06.26.10.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:35:36 -0700 (PDT)
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
Subject: [PATCH v1 0/4] rust: Add basic I2C driver abstractions
Date: Thu, 26 Jun 2025 18:33:33 +0100
Message-ID: <20250626173333.897333-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620150914.276272-1-igor.korotin.linux@gmail.com>
References: <20250620150914.276272-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces basic Rust I2C driver abstractions 
and optional ACPI match-table support and provides a sample driver 
demonstrating both OF and ACPI binding

Currently Rust I2C abstractions support only Open Firmware OF device 
matching. This series splits the work into four patches so that the 
core abstractions and sample driver can land immediately while ACPI 
integration may be reviewed once the ACPI macros are upstream

Changes include
 - core I2C abstractions `i2c::Device` `i2c::Driver` `i2c::Adapter` 
   built on `struct i2c_client` and `struct i2c_driver`
 - a standalone Rust sample driver exercising Legacy I2C ID and OF ID
   matching
 - optional ACPI ID-table support in the `i2c::Driver` abstraction
 - ACPI-enabled sample driver showing `kernel::acpi_device_table!` 
   usage

This separation lets maintainers review and merge the non-ACPI portions
immediately while patches 3 and 4 both depending on the ACPI 
infrastructure can be queued once the ACPI macros are upstream

Patch series:

1 rust: i2c: add basic I2C device and driver abstractions
2 samples: rust: add I2C sample driver (OF only)
3 rust: i2c: support ACPI match-table in driver abstractions
Depends-on: 20250620152425.285683-1-igor.korotin.linux@gmail.com
4 samples: rust: show ACPI ID-table in I2C sample driver
Depends-on: 20250620152425.285683-1-igor.korotin.linux@gmail.com

Igor Korotin (4):
  rust: i2c: add basic I2C device and driver abstractions
  samples: rust: add Rust I2C sample driver
  rust: i2c: ACPI ID-table support for I2C abstractions
  samples: rust: show ACPI ID-table in I2C sample driver

 MAINTAINERS                     |   3 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/i2c.c              |  15 ++
 rust/kernel/i2c.rs              | 386 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_driver_i2c.rs |  69 ++++++
 9 files changed, 489 insertions(+)
 create mode 100644 rust/helpers/i2c.c
 create mode 100644 rust/kernel/i2c.rs
 create mode 100644 samples/rust/rust_driver_i2c.rs


base-commit: 63dafeb392139b893a73b6331f347613f0929702
-- 
2.43.0


