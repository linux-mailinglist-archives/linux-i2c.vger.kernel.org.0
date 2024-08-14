Return-Path: <linux-i2c+bounces-5362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE49511FD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 04:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA241F23637
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 02:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77627D3F4;
	Wed, 14 Aug 2024 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOFWMJhS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AFF6F305;
	Wed, 14 Aug 2024 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601703; cv=none; b=N1zkrWenq1yTcvx3HDPcxhLEnDbto0O/ipHVO5V57xaFIqQy2SBCzCvK5bSiVDaCh5qzW08Ohfg5wU6k4deWM+SM/REic0gR6uG3yRIBX3vP09Rt7p+iI3rHnO8FtkwktUqXxpfY3vqAu4xmOy/DHmvbjhoom00eQwUfhsIdLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601703; c=relaxed/simple;
	bh=smoPsyL0hkIuPP1MAxFEuTShBY5VcUvwBvCVrOPCp5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbMlTelGKl5zWedWhN5tpe/AQfB0+3xFEI3/vAV6budrnARf7WTZBDh+m+qIgj83A23y0YN3T0raoAydcgEzQnnPPf8cu66s8bL8LBABZGgA/Yh4GvbkN52g4tTEjIVZkZGTvMAkzB8HYEc6kFXp3pO0Zlu2dPP4KqFFifuRZmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOFWMJhS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9E8C4AF10;
	Wed, 14 Aug 2024 02:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723601703;
	bh=smoPsyL0hkIuPP1MAxFEuTShBY5VcUvwBvCVrOPCp5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eOFWMJhS0AI6GFx5oLqTnSRq7zzyM3j9sUQIrWnIM2DpRbCNKIX5J7vvITtB1HT+o
	 TdsqP+vdnuR7HSD4B+wR6gY4mXLIwEnOLtt/e66Jad9aDy9qq9C/ZYrlSPW7G99vmD
	 VbwDSQW+mEqnn4dF05ReMTzje5FsvCNkECKy9R/ARltFXKXymNERCMSZh77Jr0Mzb3
	 beYDNkEgwftz48a++tGHNk4XfPxd2SxSsKZJgPNS73OcdlpOPKeD2KFc5US+9pNBJW
	 V+55Epnp7SFGdhpdacodXUTDzwA3krlXRr439+XuBF4ALiwKG/H6xjNmKvuYVthTqL
	 JB5WcgM1ikDZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 08/13] i2c: Fix conditional for substituting empty ACPI functions
Date: Tue, 13 Aug 2024 22:14:39 -0400
Message-ID: <20240814021451.4129952-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814021451.4129952-1-sashal@kernel.org>
References: <20240814021451.4129952-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.4
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
index 424acb98c7c26..97b18dff3a4fc 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1053,7 +1053,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 int i2c_acpi_client_count(struct acpi_device *adev);
-- 
2.43.0


