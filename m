Return-Path: <linux-i2c+bounces-9027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1427A0A486
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Jan 2025 16:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C38E93AA744
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Jan 2025 15:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3BE1B0422;
	Sat, 11 Jan 2025 15:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsHuyJ+p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A9A55;
	Sat, 11 Jan 2025 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736611100; cv=none; b=PKpjmEm70YwxPDHRKe922i7VeTZCnu4LQdMBw9NyO8J4XggZc494NJvnwmSYONdUB17VdN/ZrHB7/H5FcDUBjNpwXKkjj24rYhtJxiJomi/HWpac6jL9Tcj+Z2Xs6ThbKPL4uYkLtfNJR4pqhUDCyxh6vQoiUwkBwRG4SThG90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736611100; c=relaxed/simple;
	bh=FKSAYmn9f8zB+XoqOKWu/eej4fM52w0a7jmhqwNHrK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNn/0/yYASMaOV++C0bt2azmJ2rWrpkk5PgM6e/yFS6ZVbjQJ4rpo7FDtrrraWHreHqIeGoqNwqyYI+son0hcI+MDf+TO8TnABIqwAuAYCYBXXVsIi7ac8i/isoQPyqwgv04pN1dcswBw7ZkFrSmbG6DWqilGv/M/2x6cfSeKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsHuyJ+p; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844eb33827eso96477239f.2;
        Sat, 11 Jan 2025 07:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736611097; x=1737215897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dDTobUYMz8uiz4fQMAUEt5x2nQBXYlguiKUsGfi9as=;
        b=FsHuyJ+pTZfAP9ga4s++EyzNPYXkogHaPoRFEeWlouVHmjZV6nA1yMbCKXZET3tXP3
         K01XKhxqo5vzHXs2LflAMGruUufMVe6GvzR0ACTplk+YzCbjugiSQpKjERJbMC4xydjQ
         N1/8KKVkC1c64J1Oes9oDIrHG3a7PurfikRcrHiXg1QAVZOMsFrSEZZsc3wvzjEKs1r5
         WfnUpRd8RFu/6MHl3pThZ3UGHpi+QZa9t7DQXiXpaNiYz1OBzIKOGRdtbgSypizdCUmM
         sNzythlD/MBBGvlbSZrqDogA2RaJVLYSL6Jg/YMClWr3yaNEonXuRtAmE47md/yDcN3j
         S+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736611097; x=1737215897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dDTobUYMz8uiz4fQMAUEt5x2nQBXYlguiKUsGfi9as=;
        b=OufinPQ2layqa7/AUZJkR/ER1UtKrsjZixMo6IfXZTKnao6uSaDF6w7fKEDzbZNyCs
         W5EYiW0unOjqh9JzZ6mr/zIjd60mSj27qhDxE18neJCEmXIPAVoJFkcgbN+KdwRvPOKp
         PJXy12bNg412bv6636HreS/cO7MIkRWydRT89y5n8h2/ycoo8GNvsXnOkSUse447dkdK
         ijsNyVJ0K8cYYzt+VUfbCYDieMqUiY6CHu+nOhqoANm3y2g/t+MR9OpLh2+I2Jx+fwu0
         y8m2VnVlnW686m/l9JJehZNflsBJCAynb0NLLE+nIhoQ2eViahBj0pPQXRWKGGi9lKlA
         cr1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwpjy9t54C/LCsiADBH89amb2JS/QvicvMY1QJJpuZsde6Ja5wCUoKWr0RTDYMYRUhO4ZC9ZHXPYNq@vger.kernel.org, AJvYcCX+RFwzp+FA+4Q8xWM/mGgeh57q5EhKy1Kb9KoMX03y3wRPu4NynyCVG0ec5b2ttAUHgUaHBdKB5WxZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyAAyaFjlm89pu+oaftUegO6K9UvaVgdHjjc1frfUIWEdRPjV/f
	m4thYzGsPa6bcNeH9HXhbx87bWcMzobRzE7tWBtYi5uJuRTMXEhX
X-Gm-Gg: ASbGncvVAGT85j0qVqCI0n+oV1qrdAi0YU/V+wMX1Fpmpaw/F4VI95npiNg6VYQccYb
	a2bSOYr3uYcxENI1CN/MdaukqqjCHwsBRIZiPQSZgVnaRm9B2c3GoDUCkdlvTFhKykuc7sFkzJQ
	vKQfYugFa2wBDpYQH+lyOWJXOdNUd0n83d5JHIZIwpXqrOmSud1HuXrw6/QmN0ZL7b1v/Jyt65A
	qkDGBYXvFdoJ3K478B9jtxkKVVP3EGdE2av7uaQxIg913Y79tCva2SiXH15weF4toU8
X-Google-Smtp-Source: AGHT+IFZeCoo1YUNkt+wXCZQ1LcPxAfv685CE0tI3FdioaLQZqcDM7kGUgusXIw/qOli6oaFzEOEjQ==
X-Received: by 2002:a05:6e02:509:b0:3ce:46e2:429b with SMTP id e9e14a558f8ab-3ce46e24583mr57889285ab.10.1736611097351;
        Sat, 11 Jan 2025 07:58:17 -0800 (PST)
Received: from localhost.localdomain ([71.201.112.51])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b5fa30dsm1591194173.11.2025.01.11.07.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 07:58:17 -0800 (PST)
From: Randolph Ha <rha051117@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	trivial@kernel.org,
	jarkko.nikula@linux.intel.com,
	Randolph Ha <rha051117@gmail.com>
Subject: [PATCH] Force ELAN06FA touchpad I2C bus freq to 100KHz
Date: Sat, 11 Jan 2025 09:57:10 -0600
Message-ID: <20250111155744.2874-1-rha051117@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110120740.GH3713119@black.fi.intel.com>
References: <20250110120740.GH3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a 400KHz freq is used on this model of ELAN touchpad in Linux,
excessive smoothing (similar to when the touchpad's firmware detects
a noisy signal) is sometimes applied. As some devices' (e.g, Lenovo
V15 G4) ACPI tables do not specify a frequency for this device and
some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
force the speed to 100KHz as a workaround.

This problem may be related to the default HCNT/LCNT values given by
some busses' drivers, because they are also not specified in the
aforementioned devices' ACPI tables, and because the device works at
what appears to be a 400KHz frequency in Windows without issues.

Signed-off-by: Randolph Ha <rha051117@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 14ae0cfc325e..6f1c2377db0a 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -355,6 +355,24 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	{}
 };
 
+static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
+	/*
+	 * When a 400KHz freq is used on this model of ELAN touchpad in Linux,
+	 * excessive smoothing (similar to when the touchpad's firmware detects
+	 * a noisy signal) is sometimes applied. As some devices' (e.g, Lenovo
+	 * V15 G4) ACPI tables do not specify a frequency for this device and
+	 * some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
+	 * force the speed to 100KHz as a workaround.
+	 *
+	 * This problem may be related to the default HCNT/LCNT values given by
+	 * some busses' drivers, because they are also not specified in the
+	 * aforementioned devices' ACPI tables, and because the device works at
+	 * what appears to be a 400KHz frequency in Windows without issues.
+	 */
+	{ "ELAN06FA", 0 },
+	{}
+};
+
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 					   void *data, void **return_value)
 {
@@ -373,6 +391,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
 		lookup->force_speed = I2C_MAX_FAST_MODE_FREQ;
 
+	if (acpi_match_device_ids(adev, i2c_acpi_force_100khz_device_ids) == 0)
+		lookup->force_speed = I2C_MAX_STANDARD_MODE_FREQ;
+
 	return AE_OK;
 }
 
-- 
2.47.1


