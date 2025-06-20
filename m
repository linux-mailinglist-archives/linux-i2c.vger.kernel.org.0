Return-Path: <linux-i2c+bounces-11536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6411AE1343
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 07:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6571A18999E6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 05:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76110202C5A;
	Fri, 20 Jun 2025 05:44:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from out28-65.mail.aliyun.com (out28-65.mail.aliyun.com [115.124.28.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AA31DED53;
	Fri, 20 Jun 2025 05:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750398285; cv=none; b=Xq0D5szUZCKgxE1YcpRkAISqpr4u7AnXhLYlIS396SHZi4e4C4t3HPaLHCYck92Vq0cAs1uiVNmunqZOKOsC2b+6HAwS1MiLXZJnhwhWc1apVIG59zl2ps5FT2b1HvfkfSO9uQPXGkGJ5Zny5xp1m3S4roD51apiN8wAdephDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750398285; c=relaxed/simple;
	bh=7k8+Y/w2qZUhh6BqouZYxeP0tLwrf349HJCudLLDX88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQEMcj34NLJARu+TRUBJDOF3STpTGwcgIFg6jtHTJye5ysTEfSNq3aYqlhrSH2PFR47DDAcm8zYQ5tjjt8M7/GS0tGHqj6S3d9I8rOqDnoaPl8JEmmjSgOL6IicsN0BZrC5s8Cnudqj6rsocp9mFiKHPU1jyFbCxRV2vys6Fbqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=myth5.com; spf=pass smtp.mailfrom=myth5.com; arc=none smtp.client-ip=115.124.28.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=myth5.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=myth5.com
Received: from precision-5560..(mailfrom:myth5@myth5.com fp:SMTPD_---.dQz1H9s_1750397323 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 13:28:50 +0800
From: "fangzhong.zhou" <myth5@myth5.com>
To: wsa+renesas@sang-engineering.com
Cc: westeri@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"fangzhong.zhou" <myth5@myth5.com>
Subject: [PATCH] i2c: Force DLL0945 touchpad i2c freq to 100khz
Date: Fri, 20 Jun 2025 13:28:31 +0800
Message-ID: <20250620052832.26614-1-myth5@myth5.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: fangzhong.zhou <myth5@myth5.com>
---
 drivers/i2c/i2c-core-acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index d2499f302b50..5b424637bbaf 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -371,6 +371,7 @@ static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
 	 * a 400KHz frequency. The root cause of the issue is not known.
 	 */
 	{ "ELAN06FA", 0 },
+	{ "DLL0945", 0 },
 	{}
 };
2.48.1


