Return-Path: <linux-i2c+bounces-8612-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDF49F70E5
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1CC816E179
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DD11FE466;
	Wed, 18 Dec 2024 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkHhOFvt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815C41FDE2F;
	Wed, 18 Dec 2024 23:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565046; cv=none; b=tWB73yeTtWMdiYZU+mqCiJ15C0/RwUfkkv5K8M26pV0RAYVbUpZCRIBHD8d8rVI8Uv4Rzlz/BqQi7flwjYy6rtXrwnsxdufGdNXEbCu2cVm7WxHiZ0L7dPgMj2u0dppuP0QW31CQvG11LtFxI8iJXCe7SvIgGz/GBm593IqplOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565046; c=relaxed/simple;
	bh=NsdvfP9WuPfbdehzdnnHkfOaZjm7jFfiAr29jiutkkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmXAhy2pZX71lBRaAWbu989qeg+JQ7Ys5DaGf8NABfUtkom5jOVXpCi29rRf3IrPvmi4IhV3OxUjRvSr7Pj92tAL2X3LlYtQY8HTOUjALYrO/IdZGRviwf362dmS+JTiAmw/fCdaRDzG6XjIyAhdb1ki9X1/Q2sNax03lAfE5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkHhOFvt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163b0c09afso2234055ad.0;
        Wed, 18 Dec 2024 15:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565044; x=1735169844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9P/lUP2PRS4x/+lQSUCJv9QrZZ4hdzqovCNaqVm/erI=;
        b=VkHhOFvtsIASR5tR5256MvEWgPNb9V4/hNsKZikl7Y4xXm8VXzrk5haEB3NTWgJseI
         EXDNe1C9xnAGY5KMKj2PJpyPLXhKNHFKVYukC8Hk7snxnLKoEkA6o+1RJK8cOmEkUWm/
         l+Pd80iUs1UR69aAeVXEDtywoqlEcjT1JW9xEnIU803FxhG3UY+5xKODQ+NZi47Nf8hQ
         DNnazpPpnyIx3MWS4Mim2//ZwZlqGojDBqLmweC+uX1FSvq88z/QYQlbqG/sIvuiOkqF
         6EImdTcik7KxzJW+/G0LO+tX9fB9Y6Szho8BMV3+6B9ZbMpjZwBmFAcNjF70Yv9TmFsm
         nEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565044; x=1735169844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9P/lUP2PRS4x/+lQSUCJv9QrZZ4hdzqovCNaqVm/erI=;
        b=NltHkA+c/lDL4+gqlPnwfPSi7LLQZAvVbMk32ZcnCaxFCTb4rKS7uTZFJVMYdaFZQq
         hK4JwXY70aTkRgZpx3CMWSMAgY1yQGxi6fYZfGljbUvdiqGsIzmJb64sBhhCVPUPhbNh
         Guib2TaA76WKt4CtNsmcWWz0XxoPSDTF72v+JIcBllJGbY6itZsk9/z/llmMoFZ6ODmB
         J5jMz5RmaQEFOUpDxeWPMZQPo91jjIzJlSwHUP0aRV/71oes+cxoXYTFF9wFfrfS8JtD
         vqoEEkWAaofCkCv2rO3udlB3R9mC/uhyODZ8qTPYSQYVh3KUrPkB6FX9Z2pIoqLdEma+
         FJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1uFziu4TbN72kuGtqT2Cgoh0jQykB5Mx2+sSKRvfF9EEJDWHLfTL1VgSJhDkt0jEOTO9SvcHW4t8hNbSN@vger.kernel.org, AJvYcCVCndBonKs6/xq/vH5b5GsML+ycF1Dc2p0ngXt3pAvxCUh9ZXPxlGAQbziBsCgxeIGKmSk0b5Dw7kyj@vger.kernel.org, AJvYcCWhorU7mzRNSRciUe1hEwu2gOMmubYGURHZ69/atJk+0KoogIcgl1Q4ZviPdwjnXuXUfhDPdgphQrQzXwFH@vger.kernel.org, AJvYcCXDlYVmjR12BkKszTCE7ngsxWy/k/uF1mrZ2bWRV7cE9tVIZ0ySpYRF+V+Uh9j6rpwpaDXWQslB6dxOKmobrqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdc3UuCXPHxjUdHIGJppsAsvivC0iOVk6LCXoSEiw3lkM/lt5y
	a2FlRlqx/cLwx+RJHxFepJK+IxlCCip5MFX4qX/+BILAgDw1b5lp
X-Gm-Gg: ASbGncs5xnAoUB/TvAQdf7srPB5ky3kVJ6KCRxRPDcwoLQIX1sapoHUWaZY7R9iNpIR
	7hClrDsd7oMGZVMmCQBujiaXfq2G/E5sO10aypDfZWq5Tk7V9/zE3S66kwRkiemfxgVCGQxkyEG
	wB1vNzHcSEWLBTnVplrCFIsvKgRHmc5wu7ijyPmT2+WquVs0eN4QIv2Oqoge//CPDTAxe86ayGv
	PaQ+Xp0TkvEcOKgs93NdmCitJRgdKP3h8+Fr29b/xRO7apUc7sZkQwq
X-Google-Smtp-Source: AGHT+IGfZAqlhj0audMtxGa1Hunn/puU2OflMnZRL01UUIPkYNN49aM+qmpVt7uyRf0pK9RvPlUfGg==
X-Received: by 2002:a17:902:cec7:b0:215:781a:9183 with SMTP id d9443c01a7336-218d7269af1mr77074055ad.38.1734565043733;
        Wed, 18 Dec 2024 15:37:23 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:22 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:33 -0800
Subject: [PATCH 3/9] rust: error: add declaration for ENOTRECOVERABLE error
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-3-b8d973747f7a@gmail.com>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
In-Reply-To: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Fabien Parent <parent.f@gmail.com>
Cc: devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, vinod.koul@linaro.org, 
 Fabien Parent <fabien.parent@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=vynuSFjbYPtMJhL+ID8YRu8L0WeE0IXWsYbO1p8vUJg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtUaDR0bFM0bm9HUVFtSTFkR0YvZE5UCk1HR0h0bmZoVXFHQ0N2SkQw
 VmhDdW9rQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeWt
 BQW9KRUlpYklNUVMvYXlrNjdnUUFNWGw5R2xzR2lJRjc0Wm9jbzdldTdsN0hIT0hWbG9ibVpXMg
 phQ2ZqT2NoYUZLUFo3dHlUSCs2dko4L1NzZnpDRlljZW5wUlBMQzdsNDZhcHdiT24yVFRlbGFwb
 kE2ZDQvc0hXCm8yK0lvQ01Db0xOa1pzVXFzWndCVlpaS3pwMGpGeGc5aVU1cHQ2N29jL0RzcXpr
 MDZGR0ErSzQyU3BTNUQ3SlEKbXR4aHlpcCtQc2l5TGJtZ0x5eWw2UUpyYUhxTmxvMGdGUG5tUHB
 YUmdPVHNub2JtOWlUZ0ZVWU03aE5qYWJocwpjOFV2MVE3RGZHNGU1eGpvaitaQVdrVUdUT0FUdU
 1INEloWjVJKzNHeUFIeWh0SDNjYWxZOTU3aG5yN1lva1dDCjJpWTcrMjQzcHhodGttd3M1SGVmV
 zg5dVNuSkVzNGxFRkc5WDdrWFZMc1dhd3RqeTdxbnNRN0FheUJ3Rm1nWmgKSmU4UitRQkEwaFpX
 eVREdTZDSmZDYytuVlF1TVpHdE1OdytMZVhlekVLbzRPckRETTA3OTUyOGEwVEFPb0FUTgoycjQ
 1cGtOdXpuV3h5RTNpdjNGNnkzWi9IZitqdlJzMVZkMWtuR0pIbEszZHEwZEZUQ3JHb2JOK00xTk
 FmWHIrCjVySWR2L0xOc2xWbERsQ0dFb3FBeE52QUptZ05DVGQ4SHhmeUkzMFVsbHEzazdJbzZMV
 2VHZFA2OGNxbGRQTkUKb3E4UDU4TnNwdjBtWHZSMGlWcUQzdEZ2L1RvclR3Yk1mZTFyN2gxamlX
 aGNvMFI3OUQ2eEl6WCtsOWtKMHBraQp4WEtkb2R6UmNOL2dFTVFEMkVNR3VUWWNxdkxoMUVqa2V
 yVkFYY0RkeG9sZjdSZDhxTVNtODdidFIvZS83V1hsCkJJcG5yTks5RWkwNU93PT0KPXFZYnUKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fabien Parent <fabien.parent@linaro.org>

Add a missing errno for ENOTRECOVERABLE.

ENOTRECOVERABLE is returned by get_voltage{_sel} from the Regulator
driver API when a voltage cannot be read at bootup and hasn't been
set yet.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 52c5024324474fc1306047f3fd7516f0023d0313..19c8287032631ee8c4afd3c9c3f1e0709591ba3d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -82,6 +82,7 @@ macro_rules! declare_err {
     declare_err!(EIOCBQUEUED, "iocb queued, will get completion event.");
     declare_err!(ERECALLCONFLICT, "Conflict with recalled state.");
     declare_err!(ENOGRACE, "NFS file lock reclaim refused.");
+    declare_err!(ENOTRECOVERABLE, "State not recoverable.");
 }
 
 /// Generic integer kernel error.

-- 
2.45.2


