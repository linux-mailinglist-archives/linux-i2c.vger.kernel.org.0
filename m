Return-Path: <linux-i2c+bounces-8868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C30A0038C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 06:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C5FD162AEC
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 05:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEC5169397;
	Fri,  3 Jan 2025 05:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGjl/axw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6821C20E6;
	Fri,  3 Jan 2025 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735881623; cv=none; b=bH96KYBiln6ggIJRyiBohJwNJmsKx2Xa5Fx9aoFsWRSRaNkxraceZpDJuVwA+QYoEdR3aPJblns6pvGnWGgvIjCqKZtyKm8HwYV4P+2hHzS5yQ9zogUeC1pc7xvCOs1Nnj+/uXuvxMkP1e6LMEH9Wv3Wa2rTJ97TJbC9+rADOZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735881623; c=relaxed/simple;
	bh=CCZSg0LpZCWknkCpLTNUMFfGRitT6YuIDiBgQItGHS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKW3/CeCk9G4K4joat+1lxWxYNaP5opRTSa1neFGsRNudwknfg8CkUsD3otr4LaC6kJJWlcIqpeBRHr5bTenmEi661tRRCw2HnSqxIQv2INO2Pbjg2yXsiYCLYHMDyN7MMmMDpvnOxOwVwIHSAuc0yb44QqZ7n/8pHSa+N/hr60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGjl/axw; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844ee166150so436228139f.2;
        Thu, 02 Jan 2025 21:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735881621; x=1736486421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTcxCh/SKuj1+MmzUqQvYOI6MPGJvoEQRsb0fTFH820=;
        b=lGjl/axwJp9j7fVBMbQtdPNEBP4kHfOMmVfXeBnkWul1TMX3VsYwTI0BaNBh9zAYFI
         XvPGqIcYTzI3bJq1+uO+i2ujTZm18obUc5kUhjQhz91zhe11Oejv7hEIOlpKiKpUOJgi
         ggsyIZT7JdAthgqorQU3S3/5plVEpbd3eyr/KetiWEFo+dFPoiPfjs8Y+qCNRSzvZ5QK
         nrUbcSlvTKkSHz5axQLCo2Q0N5Q0WS+q1FjdqjP9Ohx5dC5Y+IX2M1szzMl0WqhmfVMm
         IkDEKTaeb58E9Nok0sWS5q9q4v2rhO/c3CutHI1SHCjIMJSw0mbGTixSSj/jFTzcn3qP
         DWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735881621; x=1736486421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTcxCh/SKuj1+MmzUqQvYOI6MPGJvoEQRsb0fTFH820=;
        b=gV60vx0TLCAZpPUntDl4AaiHdAXFxFB4pN5g7JB5B5cZ5axWHlB7JfEbcZRF/pK/Is
         kYY4ODYWyBBqIG/QRPHvQSgUvlCYbILH3d/EGNJBExu6soF9qVm9Q7nUay5XPUZRnqky
         JwFu6mtupLyQEG6rDQ21UBO69BRyfF2mQ55mNr+Z20i3o82RDyCzQNr4ftnUz015DeTr
         WmsVRYZA2FwFanXbpQfbTAsvJYoh0HxFCUwtueO+oACZK2bTCc9R+w5E7ClZ4zYIn4v8
         uiRe3rZUzWkv141kk4vLxZtNyIU6alaAx1ztG+6eh/KRC9TY9JLD5147NY2cnW9jKGGI
         Z1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4nbtRIt52nGUJnPhmsl9TJ/Cg6Hc5FR59llfKXSsuR1qnQLcQeh2c5UElCLibezkc1GsPISc6P6Qz@vger.kernel.org, AJvYcCWvco0lmvMdPtH7PIS9SHADQmplJga+KICrVu/vJWIRp/ibJtPo+iPXgUbmalvl5FNMDJxZhe2q3mBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwYY50HJ98sa/+nk6HTc0aJm/sdnNgzGKnsQxTJgi3Qjqsa+nFm
	f0KjqyLx7ct1pILa+E2YPcDbjTVL5CsAVvlQ0SiUxLIbSqifbC0a
X-Gm-Gg: ASbGncsOz1ATXMVlp/GwzeD+qKRBiS3q1NOIviTlCIxbtcBwU8dbYMVLsU0bekvcAuh
	CTJTF0HLxL09UcrhjkG4lJIMAG3wDVc+iz7kzRUpM75MFo0Dr0L/oRspYemYzLaWhLdLT6xkBuc
	X+odEucWotJGpSxIQedP/8x28iew/Ssj35VCN/8WRiM9lzoB9+4mvtgC8BEeGak2SYBmRo8YzaD
	y1XKDtoRQV3UD8kKLpRQQ+UqEZP67MpwGfahmisdnhpRPjNQ3F6zmIdG1gpUK7+gZWm
X-Google-Smtp-Source: AGHT+IEpkNVmI/FoHtLAS3w6ZZg9728+l51SDIwTMFsZN2q6EAhxML1byJgp3DASEibkDLHdOt7H5w==
X-Received: by 2002:a05:6602:3c7:b0:841:9d3d:ea14 with SMTP id ca18e2360f4ac-8499e61e2f1mr4688829239f.6.1735881621561;
        Thu, 02 Jan 2025 21:20:21 -0800 (PST)
Received: from localhost.localdomain ([71.201.112.51])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf4f43esm7427972173.21.2025.01.02.21.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:20:20 -0800 (PST)
From: Randolph Ha <rha051117@gmail.com>
To: mika.westerberg@linux.intel.com,
	wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: trivial@kernel.org,
	Randolph Ha <rha051117@gmail.com>
Subject: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Date: Thu,  2 Jan 2025 23:16:52 -0600
Message-ID: <20250103051657.211966-2-rha051117@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103051657.211966-1-rha051117@gmail.com>
References: <20250103051657.211966-1-rha051117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices do not define valid bus frequencies for the ELAN06FA
touchpad in their ACPI table, and some controllers run them at
400KHz by default. The 06FA touchpad exhibits excessive smoothing
behaviors when run at 400KHz, so force the bus frequency to 100KHz.

Signed-off-by: Randolph Ha <rha051117@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 14ae0cfc325e..b10f52e12fe8 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -355,6 +355,18 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	{}
 };
 
+static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
+	/*
+	 * When a 400KHz freq is used on this model of ELAN touchpad instead
+	 * of 100Khz, excessive smoothing (similar to when there is noise in
+	 * the signal) is intermittently applied. As some devices' ACPI
+	 * tables do not specify the 100KHz frequency requirement, it is
+	 * necessary to force the speed to 100KHz.
+	 */
+	{ "ELAN06FA", 0 },
+	{}
+};
+
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 					   void *data, void **return_value)
 {
@@ -373,6 +385,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
 		lookup->force_speed = I2C_MAX_FAST_MODE_FREQ;
 
+	if (acpi_match_device_ids(adev, i2c_acpi_force_100khz_device_ids) == 0)
+		lookup->force_speed = I2C_MAX_STANDARD_MODE_FREQ;
+
 	return AE_OK;
 }
 
-- 
2.47.1


