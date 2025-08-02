Return-Path: <linux-i2c+bounces-12121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B78F4B19095
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 01:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FFF518985F6
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 23:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BC31C2334;
	Sat,  2 Aug 2025 23:16:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from out28-63.mail.aliyun.com (out28-63.mail.aliyun.com [115.124.28.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F872BAF7;
	Sat,  2 Aug 2025 23:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754176581; cv=none; b=MMQwv4qRxxig2qtsMXxl+bdXJOv1jumoviQIHcB45k2xXl92ZfP5SZolCmFxBirseJTai5uu7OS3Wbn4dTgBr8Qe4H3UIOCG4A/K8sbJJyVpJYrVJpCRnSrIVg2S7wE6iBgqWAEiH1SmtFEpy2w/WdsYpOQ0FDH15QApnOfbzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754176581; c=relaxed/simple;
	bh=HCclWy8DKnHGYD/vBeYYhYHKVZ4J0XsnSgLnWfrRbPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhso+zIIImLrJRYo8UL2W1dXFUpB4en6oK8WtWqhdT4D1phQp+ll9Bq/trNmu5ENan227dgxw5aC5OwFWG/r295+z5JS9VihX6z0zQwXdxRMb+eQQKDq3Lo+XIeC/giYxCTjBPMv96/Uv7FifAEQbvUkETpfQZqQ9JvPRza6HIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=myth5.com; spf=pass smtp.mailfrom=myth5.com; arc=none smtp.client-ip=115.124.28.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=myth5.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myth5.com
Received: from precision-5560..(mailfrom:myth5@myth5.com fp:SMTPD_---.e4WzbAK_1754176557 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 03 Aug 2025 07:16:03 +0800
From: "fangzhong.zhou" <myth5@myth5.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	myth5@myth5.com,
	westeri@kernel.org
Subject: [PATCH v1] i2c: Force DLL0945 touchpad i2c freq to 100khz
Date: Sun,  3 Aug 2025 07:15:54 +0800
Message-ID: <20250802231554.9920-1-myth5@myth5.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250801145405.11445-1-myth5@myth5.com>
References: <20250801145405.11445-1-myth5@myth5.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes an issue where the touchpad cursor movement becomes
slow on the Dell Precision 5560. Force the touchpad freq to 100khz
as a workaround.

Tested on Dell Precision 5560 with 6.14 to 6.14.6. Cursor movement
is now smooth and responsive.

Changes in v1:
	- No code changes from first commit.

Signed-off-by: fangzhong.zhou <myth5@myth5.com>
---
 drivers/i2c/i2c-core-acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index d2499f302..5b424637b 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -371,6 +371,7 @@ static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
 	 * a 400KHz frequency. The root cause of the issue is not known.
 	 */
 	{ "ELAN06FA", 0 },
+	{ "DLL0945", 0 },
 	{}
 };
 
-- 
2.48.1


