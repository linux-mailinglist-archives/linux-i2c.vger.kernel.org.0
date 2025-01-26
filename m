Return-Path: <linux-i2c+bounces-9209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB53A1CBD1
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 16:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C9C5161958
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jan 2025 15:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7571F63CE;
	Sun, 26 Jan 2025 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LLq6hrwP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3006422D4DE;
	Sun, 26 Jan 2025 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903919; cv=none; b=bkbGuynr1wNucRc9V7dqvM9imxfPXLQhTcy0EyP59sPJnkYOYoftznIoKRq1kEOlg80kU5VcFJpYVDEGLZvj5LmjYfb4CsMEI3h63HhABlqO3zFKh0ugIBYOXxLdXagln6TxgIiirG32U6Bypd1EaRShlWzTqJifCKEEp1IeHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903919; c=relaxed/simple;
	bh=68Rkbo41p1kK5kzWtd3r+gIYoICKoegxrvwzklKYj7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nhdgiLXh1ol1jLgw1KNce5mPA9yKYS3zThfMzQCpdaBAP+1SJBCqRmZXp42GnXvj8U5/ssVp1Y4ofLEDGKkit378U+N4VAgXn5VNS//coh4hS6GOuta/3RJh2EwONyJNtR8+XtdP2mMFp164+ynaArzs+CxHczxVpKcZvJN+cHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLq6hrwP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4131C4CEE2;
	Sun, 26 Jan 2025 15:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903918;
	bh=68Rkbo41p1kK5kzWtd3r+gIYoICKoegxrvwzklKYj7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LLq6hrwPmKLlMOwTLuMIns4YYX5uJfbbKUxV4KcdwY1piKkrsXOUZuvQ+iXks4MTZ
	 IVX0Q6w/KcUl7K3dS/VHLW4RQaYbRAA91dqjMowMQzXJYPQd/fTuw5UHOSvrDL26ib
	 +uOGZzlgcNh+NHvXv8v+mUFmeNmcpGDL2haYYuQNvHUy8IFNgFCcDiBgN5intxoLKc
	 KwFVVQe+yAOK5LRdVzViXtf2I8eIzjPsQoEPDvjH22M8sNByMpxC01yAWZbK1K5LEo
	 z+l0IBHE5B9ECEVfzWxdVT6cTsvsVgE3gn1pEZbAObzkR133nlK0GSax+kGztVMXsV
	 CrtgatjCy1BBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Randolph Ha <rha051117@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/12] i2c: Force ELAN06FA touchpad I2C bus freq to 100KHz
Date: Sun, 26 Jan 2025 10:04:56 -0500
Message-Id: <20250126150500.959521-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150500.959521-1-sashal@kernel.org>
References: <20250126150500.959521-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.233
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
index 4b136d8710743..e7aed9442d56d 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -299,6 +299,25 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
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
@@ -320,6 +339,9 @@ static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,
 	if (acpi_match_device_ids(adev, i2c_acpi_force_400khz_device_ids) == 0)
 		lookup->force_speed = I2C_MAX_FAST_MODE_FREQ;
 
+	if (acpi_match_device_ids(adev, i2c_acpi_force_100khz_device_ids) == 0)
+		lookup->force_speed = I2C_MAX_STANDARD_MODE_FREQ;
+
 	return AE_OK;
 }
 
-- 
2.39.5


