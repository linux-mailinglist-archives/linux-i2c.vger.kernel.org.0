Return-Path: <linux-i2c+bounces-5366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAF0951235
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 04:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A67E1F22FC0
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 02:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF171547ED;
	Wed, 14 Aug 2024 02:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b24F/xd2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9101547E6;
	Wed, 14 Aug 2024 02:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601748; cv=none; b=IxGwYzv+YwRfs7a4iDTKx4uEN0oI2S6hdaEUjLh+clrzATPjMiR8HzougYvPenIRVHG9bYNlnQo6xacWW3mZPa3RGqlftJJV2Dqj2G0Tzy8xiVe8OMTMXuM1y6BIKMwJs7YJwFs8qU2ZACA31P+Rj5DiMrq6snUV18FSKP4F57w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601748; c=relaxed/simple;
	bh=0hULqN0PF2FUtiMYWbQqWS5lCuhg3QQ3/2z+oWF1OV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YrYazo40wRDfRPSRfEuNZklz0e4a1zzAqrQcvHHAzxiyzRcP+8KlpmCEBAc7U7PAXbzKHa6+Iqe7vvQRoJkdI2U6of8Iy/tR8YS4GH6Nwe75wtWdXmRXxAHMYaH/x5G+AckaCp3+BML9WQgQuAbErfiXVffsMv9ppS2i+KhZQNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b24F/xd2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28870C32782;
	Wed, 14 Aug 2024 02:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723601747;
	bh=0hULqN0PF2FUtiMYWbQqWS5lCuhg3QQ3/2z+oWF1OV4=;
	h=From:To:Cc:Subject:Date:From;
	b=b24F/xd2Pwdl4KlNKuDwGHBrULiItftm8QEj6XpHVkgPUoNVfgFQ5oXcRuH60HEOU
	 JvEsAYzCx6JRQDrta61I4BwqOEFvblIzIH1tr+ZHR+48xuVlwobWTIHp6eAtE3I8+f
	 vcIWMcWAsa8+EdoKWl6Pi5rh0FCEaMWNQSmlb/o63ZFlhbAhvbXO7l+EiKAYzyYOR3
	 hsk883BTnM/WO+gOpvYpnWbVpi7iMi7XAW8/UTo9GXX17NfUDYDRpJCz3xCS3I7rBE
	 lzTDquV3um2m+/ZKdVa43ZvSF6sBy/a/55k82Qq0CxOB6D+m2S11sUArjy6nvLABlu
	 jrASQvZ1tZbkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/3] i2c: Fix conditional for substituting empty ACPI functions
Date: Tue, 13 Aug 2024 22:15:43 -0400
Message-ID: <20240814021545.4130580-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit f17c06c6608ad4ecd2ccf321753fb511812d821b ]

Add IS_ENABLED(CONFIG_I2C) to the conditional around a bunch of ACPI
functions.

The conditional around these functions depended only on CONFIG_ACPI.
But the functions are implemented in I2C core, so are only present if
CONFIG_I2C is enabled.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index a670ae129f4b9..cbd2025a002ea 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -991,7 +991,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 u32 i2c_acpi_find_bus_speed(struct device *dev);
-- 
2.43.0


