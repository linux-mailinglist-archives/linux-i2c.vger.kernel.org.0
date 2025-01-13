Return-Path: <linux-i2c+bounces-9064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF291A0C22E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 20:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 855321881C9E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 19:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9570B1CB31D;
	Mon, 13 Jan 2025 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL5d+dpU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152124022B;
	Mon, 13 Jan 2025 19:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736798045; cv=none; b=SsTKZYCys1h/x93+D9KoV6pTRn6esP6LpMn9aFDkqOy/bZLtsCXICRGhSaL+mBej09c3MJ8sa8oqKY5mDcBW9TSKcMqztVS/eZV3tpMXgCQVX7/pk69Jy3pifU09pCuhMMXxbIpSLYcdshN8Cy0we6uVZnsAgFFgWKkZ9wQOkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736798045; c=relaxed/simple;
	bh=k4LKV03K423NSP5l/ihlxE8Wb1V7/r55T6m4NqGTao0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqiYs99i32IfAKxrJm6mf+RP/V6tE6Eg7EcErIKlE6gJmXCofBnrc2tP/jOy6VPLATl0B15Sg1mc/QAOH1kmv31M7gpd22KUO6bCUR+zjAL7wWd/PDvZ+T+q1+jzlVd+V71883STUWomZMK/CGF/Vip+YiaRuRt/yMFB9ldXCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL5d+dpU; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a8ed4c8647so31347955ab.1;
        Mon, 13 Jan 2025 11:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736798043; x=1737402843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKxXqQsXK67zY0f/rcAukBJy+7D1L/GVlyST+DZVEuM=;
        b=IL5d+dpUVtILLfoanroCsFjx3Boiti7wU1J9EgbTsFNFn4vwY6cc5zPeDZQRejFbJi
         Z1a5WoI4wvFByemxPbg3dFaeO9vzLiuXLCd4Gdx7nN1UPyM+b+jiWvVJKlCUGji4MXcj
         retcm9OzjIN+lBzKqqq2n9onCpda1UuIr0lsrG38E4n9YR06BjYVdjgTux1PTZ0AUaYk
         l5CNkIjLArYIvcXolTfli33GvLkK8NQXbNwJwTsTsqKjVKD3GLgAIbfNDZHZYgdZJykd
         AwTfLd3zaOlKZvJ/EZ2xxfXKRFphlyujnOXW9qRFmXFH2TUNMfRczdhZtH3lTFQVLqiX
         0djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736798043; x=1737402843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKxXqQsXK67zY0f/rcAukBJy+7D1L/GVlyST+DZVEuM=;
        b=r1ddkKrBA8YtGNOGdmczm/WTnhvqbLGapkh8U9/ncSk4Cx4cYYaZXhvJqVJ8DpDNdM
         Pu91GrGlHDiq5agsveWdGhAzkogl4aXGAbSeeTTZs7JK/JiGKLTgbWxtsRk8+xBt6aGT
         NEIn4A05kbAWADd2zBXu/8AZ/3rgWPMpai14Wgqjhzc8mh24/StbPY3y2iiQCkFfPTe2
         y9LYi+v7oKiZmD80gLHwIsoUyTlQQTb95prnlao0shH4MtEwWGTtvndCy3thxmZm/VSs
         A5juUBU4hgQMx9G+gT7ruORnOVThOJHG8KBcYCvWOv0dBa37rZ9PHQrxPNyTmj5RSSmh
         xJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4w7yDRsXvoxjAuYlkfFkZzj2ZE/SvzzE1k3i7oUO6aA7lEcVP6iZS2rr6AInY5J2Vxlz+1UqBXPRn@vger.kernel.org, AJvYcCWa0Xx8w1r5Hw9Qro0cnVJspdhJYYOhLDmiZuq5cSXfPfERX/dTbOck/qN43UBI2Awx4JnLrrSHGEws@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AYEqoUREJFi3P7edck73ng8dTe2C1I74EY2CGDaIifR8kot1
	zlM9UVJI5AJPqL05K68VpPGr8QpOfRydTyH2UOPPALsUIHEnVFyR
X-Gm-Gg: ASbGnct7BtNwDx1JtO0T9hWcP3OIlSE7eRj15yEQS8dgayLcip68f4WKpZaJH2KQuBF
	SLlGZ7Hq7mAYosnTwCuniVd2Bhwl0J4ujEJx6mDs69iLY1VrFs1xPGKP3p7iAk9MC0Zs/ZiSsEB
	s30GP0CySymM7IGfcbycNw1msNto3kUCRu6B/IOwDGqFyjOnxWL3ZNJFZgK26osOc7XhvsGRVH5
	PLfEnN+/oyehheEo9T+G7R2+wbEZ0LOgTfBm6Hz06JMQK3qXZ6sK0l7eRI0HEuIZy/s
X-Google-Smtp-Source: AGHT+IEiwvzn83fg1Frt3wf+UWSofVoJHAie5XO+is/r7E1bOzADaXMj6y0grvmwXjN8wODaDURw8w==
X-Received: by 2002:a05:6e02:194c:b0:3a7:7ec0:a3dc with SMTP id e9e14a558f8ab-3ce3a88a2femr183819145ab.14.1736798042856;
        Mon, 13 Jan 2025 11:54:02 -0800 (PST)
Received: from LENOVO-V15-G4-L.lan ([128.211.252.159])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b5f93ffsm2922575173.18.2025.01.13.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 11:54:02 -0800 (PST)
From: Randolph Ha <rha051117@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	trivial@kernel.org,
	jarkko.nikula@linux.intel.com,
	Randolph Ha <rha051117@gmail.com>
Subject: [PATCH] Force ELAN06FA touchpad I2C bus freq to 100KHz
Date: Mon, 13 Jan 2025 14:52:37 -0500
Message-ID: <20250113195308.244372-2-rha051117@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113064802.GJ3713119@black.fi.intel.com>
References: <20250113064802.GJ3713119@black.fi.intel.com>
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
V15 G4) ACPI tables specify a 400KHz frequency for this device and
some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
force the speed to 100KHz as a workaround.

For future investigation: This problem may be related to the default
HCNT/LCNT values given by some busses' drivers, because they are not
specified in the aforementioned devices' ACPI tables, and because
the device works without issues on Windows at what is expected to be
a 400KHz frequency. The root cause of the issue is not known.

Signed-off-by: Randolph Ha <rha051117@gmail.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/i2c/i2c-core-acpi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 14ae0cfc325e..d2499f302b50 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -355,6 +355,25 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	{}
 };
 
+static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
+	/*
+	 * When a 400KHz freq is used on this model of ELAN touchpad in Linux,
+	 * excessive smoothing (similar to when the touchpad's firmware detects
+	 * a noisy signal) is sometimes applied. As some devices' (e.g, Lenovo
+	 * V15 G4) ACPI tables specify a 400KHz frequency for this device and
+	 * some I2C busses (e.g, Designware I2C) default to a 400KHz freq,
+	 * force the speed to 100KHz as a workaround.
+	 *
+	 * For future investigation: This problem may be related to the default
+	 * HCNT/LCNT values given by some busses' drivers, because they are not
+	 * specified in the aforementioned devices' ACPI tables, and because
+	 * the device works without issues on Windows at what is expected to be
+	 * a 400KHz frequency. The root cause of the issue is not known.
+	 */
+	{ "ELAN06FA", 0 },
+	{}
+};
+
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 					   void *data, void **return_value)
 {
@@ -373,6 +392,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
 		lookup->force_speed = I2C_MAX_FAST_MODE_FREQ;
 
+	if (acpi_match_device_ids(adev, i2c_acpi_force_100khz_device_ids) == 0)
+		lookup->force_speed = I2C_MAX_STANDARD_MODE_FREQ;
+
 	return AE_OK;
 }
 
-- 
2.48.0


