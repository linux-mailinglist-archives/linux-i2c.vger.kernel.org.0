Return-Path: <linux-i2c+bounces-9205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FEA1CB19
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 16:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89BF63AAC54
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 15:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716FA21322A;
	Sun, 26 Jan 2025 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5NZyX7J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CCF1A265E;
	Sun, 26 Jan 2025 15:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903771; cv=none; b=pKfWUgqufY9j+VXqG0HGjFiMBk3lkhj7+aNp2NCZ3y38HBxay1Z/5wEXtcCZD9YU5Am7iaLXYyMcI8Yau+8Ig4HcRFcU/8J5rc8PP+m2Q5PAVtoeG4k8LB8vUbQJjzYYGBWPSLjrUf5lA5vG64VZL/7T2MArgcULUNsRXUPjPHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903771; c=relaxed/simple;
	bh=dF7HPZSbkgrxzh5sqxclVB6t40ygODd2Dm3q7AduncU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZcL0OKwGLRIdmlQ4P4T+Z/l2gwnkrj5CcC2Y0ONBdA+mEjEGw2VtSeIsTnGBvIShqzcUHV6C4QEp43ZUAbIijvlPYhqIoh1KZlmU39Zl317alXlzbbJeRTQ4JNIx/UIkSMkGdgtgLpqEQ40OqyKzhD2f9+utAHE/tl9cMqtPKNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5NZyX7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B0BC4CED3;
	Sun, 26 Jan 2025 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903770;
	bh=dF7HPZSbkgrxzh5sqxclVB6t40ygODd2Dm3q7AduncU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q5NZyX7JLxP0PawEd3PsGXNBBC0Rn+YWvZh/7xT57SQE7G0G5L2tnHVXxwRuXRDub
	 qi8hJ5mZAsl6+ciHs1pXpwTIdYi0sqTZ8pXZToic59lwIews8oj+lkJwByYMp4bZsc
	 0di39jy0VDM5WqxSOwWvSs1oMy1wGUep4labJxXZ3+fS5BFb9bHoZbsXahyvU8Dqnm
	 JQoWnUdca1OlQtIa+i7S97xI9PiRM9j/nrdKS7VAwpv13P/hcP0AEvVMiWvRhezWto
	 /mga1jeu7x6nUXzLtU08YQDVxi9TvSQ0LTOkba/6U9P85yLemE6lwEf6WYKuKkHsW4
	 SlfYdk/yLjTdQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Randolph Ha <rha051117@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 17/29] i2c: Force ELAN06FA touchpad I2C bus freq to 100KHz
Date: Sun, 26 Jan 2025 10:01:58 -0500
Message-Id: <20250126150210.955385-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150210.955385-1-sashal@kernel.org>
References: <20250126150210.955385-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Randolph Ha <rha051117@gmail.com>

[ Upstream commit bfd74cd1fbc026f04446e67d6915c7e199c2bffd ]

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
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/i2c-core-acpi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 14ae0cfc325ef..d2499f302b508 100644
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
2.39.5


