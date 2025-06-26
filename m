Return-Path: <linux-i2c+bounces-11622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC2AEA4CA
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 521D74A131D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A371B2ECE8F;
	Thu, 26 Jun 2025 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lN52fw08"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C24A33;
	Thu, 26 Jun 2025 17:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960658; cv=none; b=GzZdpuurolmTMCafaqY2VFX1tp/kiYx5EZT4Tfel/2gGFmk1yyzWAMdOSzgYUukL3lyYo3DRcGIR4cAbxxv3RylH57XEi8F5mVhYz0fOZGCNSC3U2M7D7NshazhllwkGkzozoTsmLZMiP0OAGNORJLC+BZtKJ9Y5IwWT7AnVysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960658; c=relaxed/simple;
	bh=nAsTYlNlsKoQoRIBxmtqCsE8i3UtjyaiMo3nR3fH1kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrKx5qcsYtIsCCx+xmRfi0XOkZhE4TTMQylIXzUsDgAns0hw/g5SLrwmGYyAPbWwFU7ul5aBjHItqcKvkBrDjegHP4rr5A81zLH9SIIFzXDSHnSbVSCp7Vlq+pOD94pc9y0dvH0bw4M9B7M3FgxAz3fIAusIE+OuOLAZnc4wDTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lN52fw08; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453398e90e9so9327865e9.1;
        Thu, 26 Jun 2025 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750960655; x=1751565455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/JMMKJYJJnaalmSUe6TK9/m1Tf4VynpgQ2NjLenDxQ=;
        b=lN52fw08dhj42h8qKvJO91vxnJSTy0RnXJryfL1HI7iUtaxoYSP1lHCicWxlIQgrf2
         q9fBXt0uPY8SoM9QxSsg790hgNtt1mAjCw5Di6Y/wD6ikpTGk2lyNxiQk43CzIR5UpX1
         EJ+bY+q2m5Oh+lRB32viB7d7h8sD3hZIJS2+cIbBfBL5CdHBTwBs2e9RuxvATFZHSEEU
         ivxugxXEoC6D0cbbuozfqJNuguz4udgYuVvw/F54wbpRDXhdA2ZB++B2jQwU5WONrIdQ
         JW/7hhndmqMZUd1VRS9Pr0ZMeyLzQsjUxNDPyjj2ivre5ZXb+ZPH9cthJkdpL+bU/lLK
         kJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960655; x=1751565455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/JMMKJYJJnaalmSUe6TK9/m1Tf4VynpgQ2NjLenDxQ=;
        b=UTGv5FaAJNByQTxJoAZrZB8v8S1C37W40D3Qg7A6WycrkYCMDuufQZpXqbdpnF2Jw5
         SBenm/rlFnq+RYwc/RypKzvKjIoyPgPOcdatIZl3VcSuPwIJrtPg0N99SSpFe22ZcufJ
         gwoNJYX5LMGtYfS2V1qydzqDhg3S5jcOwXOnTbAWUeEpGGHluU6sJ7wIWHVQXvbQPzbP
         Zfu+MvLXDM3n+vpKydysnowWjcdwS0JgnFguUbOig0p42RWuIz14sOHLMcYqtF7x+if4
         YlgtkJJI9BwM7zkBYekPABwxnkW7JQxq2ggW4HkD5Z16J63VHKOb6mtPz7G7c0NKAThX
         /O5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+PyblhOoknqoo0xa/S9qCeaTHnz8HszKlT9f3Yk+7fIxw4/fUYFZ0o50Ll5k1AQN4p/5xC0hbN8BhebOce/Q=@vger.kernel.org, AJvYcCXDaI2T7fBgoHgw4M9ooeaBX11IsCT25DSqgr4q8dXZliQjmsGjK7COqCptwulG3ubF3DqKpfh2sIeyfByS@vger.kernel.org, AJvYcCXv+dy//4K7pp4Vy1OW3teOz/T1sPimDMKeJLuE3dxx1lk/tb5QNpPAKKqVPgnl+p887InQeoTd8/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pa4DW2ygoTvDReGMEgoRBA+Ja+2htyweSrEBDmqW0Jiu3PSG
	sPHVDtcoZVHK7JHUgCXnWAY/ZNy4kMLDJLEw78QmFlCCuRB8gYWNafa1
X-Gm-Gg: ASbGnctnatFmZ3KXY+5J0T0Sij6amEJPvwQqNlXuwPXp72MMARrNGhxMojNs1lbI1hs
	f/t9LT9Nufri5mmHxqm55R08HTi7ZsfDS3VJfCe0/um6ZEsYMTqp4Nhm6LKsWSUVwYYrwqolsps
	QvDG2po2scqcUnaEiUd67Zh2sejngGbBD/pw907nEvxhA82a3jWbzqMjy6eIfmx4ftUK6zwNFB4
	c8kNvelvCcHsj9898djK0jN43bBViTUk6+AsrkOlWahre6b4sQJqa4Q/G9VuuBdo6vmUYDt51n5
	DR/bNaocMsSKL35CAxsnj+9arZp2apy6IlmgEUMp8Htqu01OkOFeSIk4GyHhGJ/LbljQa2+9j1E
	aEajiUkF86+3MASBeEWum1g0IiC53vhvh+0/TiqP5QguzbxU=
X-Google-Smtp-Source: AGHT+IF+L5+lFftiKxjMEYMZ+2kfG8sBKVLw/AlWLt7CRtqKdtY0gU2Rq1RqhRFd2kLjCo44YjAIlg==
X-Received: by 2002:a05:600c:6745:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-4538ee41d76mr2736045e9.14.1750960654976;
        Thu, 26 Jun 2025 10:57:34 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ba553sm55198365e9.31.2025.06.26.10.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:57:34 -0700 (PDT)
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
Subject: [PATCH v1 4/4] samples: rust: show ACPI ID-table in I2C sample driver
Date: Thu, 26 Jun 2025 18:55:32 +0100
Message-ID: <20250626175532.909732-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626174623.904917-1-igor.korotin.linux@gmail.com>
References: <20250626174623.904917-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an `acpi_device_table!` example and set
`SampleDriver::ACPI_ID_TABLE` to demonstrate ACPI usage.

Depends-on: <20250620152425.285683-1-igor.korotin.linux@gmail.com>
Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 samples/rust/rust_driver_i2c.rs | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
index 7c5def930fe0..98bda18fd098 100644
--- a/samples/rust/rust_driver_i2c.rs
+++ b/samples/rust/rust_driver_i2c.rs
@@ -2,12 +2,19 @@
 
 //! Rust I2C driver sample.
 
-use kernel::{c_str, device::Core, i2c, of, prelude::*, types::ARef};
+use kernel::{acpi, c_str, device::Core, i2c, of, prelude::*, types::ARef};
 
 struct SampleDriver {
     pdev: ARef<i2c::Device>,
 }
 
+kernel::acpi_device_table! {
+    ACPI_TABLE,
+    MODULE_ACPI_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(acpi::DeviceId::new(b"TST0001"), 0)]
+}
+
 kernel::i2c_device_table! {
     I2C_TABLE,
     MODULE_I2C_TABLE,
@@ -25,6 +32,7 @@ struct SampleDriver {
 impl i2c::Driver for SampleDriver {
     type IdInfo = u32;
 
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
 
-- 
2.43.0


