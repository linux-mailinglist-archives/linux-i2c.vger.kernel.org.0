Return-Path: <linux-i2c+bounces-11617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59CAEA4B1
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD3FB1708C2
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652C92E5424;
	Thu, 26 Jun 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFtVBfcY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B2339A8;
	Thu, 26 Jun 2025 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960111; cv=none; b=QjZ0dtVh8lWZwu5+k1ongWwP1l29p7wJ5imWaskZfpKATGBcSLCICF7oedDAdBBPOdvwVFovzPuNxYrKfFEkHBa5fwhCFj2gWH/8eGCqkpBG9d3vVgijJOfxyNJEjwI6wQCqRh51YIpsJXXFPrS50ueuJrCPzJBu1yQLMhy/S/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960111; c=relaxed/simple;
	bh=LRec7XG15yYVqYXD4V+rr6o+ySekVyH57ZR0Z7yirGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iOkMJMOVfgbDrXQgEYX4MMn3UvlI2PDOiLVZpY4bMe95NLRXIiOC8DVZ3E24iPrXRQY7rgYbn/s6mM+poELCDMBUUfu3Hu89wPW03hhN9czx9ikoZzNBDMRXEKjBs/5rBtQsUyGd2ZyEi1DhqRL8B7DWHAO2/xWiNQS+fKEzrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFtVBfcY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso8603985e9.0;
        Thu, 26 Jun 2025 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750960108; x=1751564908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=d4IQo3oY1NUbU13/kHA6jBPwbWfvABXBa/vUplEI8Dw=;
        b=GFtVBfcY84Mb2yshMniEEk1Ri3iAEBSQ5IB/wjYQvJXN+rB06D5AQTj8fvOL6wwxj5
         v8gwkfOOApiSVNi+E0E7196UcKcLChsbtzlYab/CvCYR2Ffec9nNmlN4Xk4EnbkiHCyv
         t3qH46m/YQccqMUS5ao/v22DFSNe3CUzIhdacv3JE2zz6WKKqnsBOw1gf6dFggfASAuc
         iwsRriGnBQkDMYQQ0A+h2D2c69Fc6vIG4TFbG+PnqsuvsEOpLPLGl38dOYfiwDrRn40i
         lT1ZqgMQqzaXQlDxNJkJ9y2jpHSxJtegFADALh1D3CZD1+fJhp/DZdntoi/qh0GaJpAJ
         rwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960108; x=1751564908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4IQo3oY1NUbU13/kHA6jBPwbWfvABXBa/vUplEI8Dw=;
        b=LIetQ9111AigcSL1GcKzrqYLQK9FJMh2/TaaIZeQkE3VD7BpUn5CHUY33YLWPlAOXZ
         8oiKHLzwC3P1fszf3WSHHB/FOYk0+EW5OhOX6OTCnxkLXoM9zSlX+GJr6Fn1xSp5sjtr
         EQhroDMVMi/pEUrmsdgxhFK2vjBT564l4/dBtKY7t74gVUXRSddu85Py1oQkNc7s9DOY
         YTaFro9FMn1163osMA1aUENlUzRG3Oca+3q+V3rWdzhy2AuiNxER5opC0uyWXI6dR6jC
         wyPmFd/6904cgfb8CYbz/0A3vBuogco6KBOY835uHQboNtY9/T1N77FGlZ9XXU8kjOij
         J78Q==
X-Forwarded-Encrypted: i=1; AJvYcCVc3G1CVwrjcM+fUNlHBw1wJgTMATUvsxT3hsu4AXZ93vBTAgRRcby/lXpP1RM/3CqPbAIjh76PATs=@vger.kernel.org, AJvYcCVsgCjsud+BcU9dOeua9+V94YGFmSge+uCQpKAI0PrKumn1UNtvu8rka4m4XrpleguqCSgunfaZdg5PPMap@vger.kernel.org, AJvYcCW/WOCxVKMgsG/6xbK+aaZopeqBFMH/Qxj2Ds9mzSMvxgxn5z+n//jBtSyqcyT5q3eap9OKdRVYqYn7yDTkI60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7E2XUXsTw8rV9+B9FH3brXJXHVd6SFznvSe0QTVNxQJiktxqK
	afiU+S4COeCL1kHEkr5XpD2sJOzvyTu2qrFPURKl15YLyfjZMmQu7T7w
X-Gm-Gg: ASbGncvreEv+iHLtvUcRFAi3fyjo+fHbUuyr7+L9g92puySrlxQ5Dmtbekd3qlOt26V
	O4aG9wsHDWo9O18Htd3WTFqrSTfZ6Q8ZCWdPpwHLvnywQlJ7ZVJ9Q6tJMPzXWOapIGjgsqGgq3N
	Y+dEKZiWnmuUs+ZAlIIFV2vtAUfDsuAcBJcSMZpUteK75h2EjVaktISqFHOoV7b+CtLvCgyeyM2
	ORStPigmfSYf0LCZtEIxmzWwM+p5+wrdIaSRcjTTDzdBh/cHdFlmub9rym2GvWEpaEU6Xxqeqm8
	+oxiZW9EWhH9L2dNWlWRX9VcE7Yu4szW1Ws0jW/gz7/B6ggjARfv+DLTJQsvrLI8V4BbAqL/jqx
	9A9FH7ABsgKpfjgOzSI/fqx0WwvnrGc9Mef45
X-Google-Smtp-Source: AGHT+IEtQQDsCtrX7XpvEE3Zm7CcK8+iP9f0fNFYFZWyY02phYTfFomN9ziJ0aLLcUwjE6mDiO8Wzw==
X-Received: by 2002:a05:600c:8b41:b0:442:f904:1305 with SMTP id 5b1f17b1804b1-4538901ec48mr49592805e9.6.1750960107401;
        Thu, 26 Jun 2025 10:48:27 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c2esm494455f8f.53.2025.06.26.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:48:26 -0700 (PDT)
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
Date: Thu, 26 Jun 2025 18:46:22 +0100
Message-ID: <20250626174623.904917-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
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


