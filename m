Return-Path: <linux-i2c+bounces-5363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 439FF951213
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 04:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E29DC1F23DE6
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 02:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CC71422CA;
	Wed, 14 Aug 2024 02:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK2QtcvP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9841419A9;
	Wed, 14 Aug 2024 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601723; cv=none; b=vDcyXsDH5QYNGsh6fRPFZv6xvyEhtMspm3XWB6ML4JbHbxWKDORCg2ov3TTMbxmo+0dcXXO+7jAotjS6XIMA4tlnVXX+8hn7PvRhgoJLvjMfIsN9fLDwWVI9JMuIfxdlB//6K901ZxgdPzn6rBKJyXADZiBac8MaZjkyaQ2ndBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601723; c=relaxed/simple;
	bh=M1d0cuB26UxfGsqNygD3iEsVrnVQKsorXrrI3VbpWu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaCFbVpQbymcRHvl8hjTfz6ecIkxROGYD0MPGZIlzWIRqhyx3yM9piMWI1hxE8rdDBwuGwmSj7sw85gvv/Uq2ILG584RlncPFC4kVyJbVvaL85p9X0hQ5wO36nDxd2xvsgsqg6YYPX9erohVow+I/a6ahXmkxDzktGj2WY06A1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK2QtcvP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133E8C4AF12;
	Wed, 14 Aug 2024 02:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723601722;
	bh=M1d0cuB26UxfGsqNygD3iEsVrnVQKsorXrrI3VbpWu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oK2QtcvPGZDvxLJJ23NB1Nz7lZPl25T8yVnd2VG2QJ8TKis4y/IaZbv2dxoYmrvur
	 Agbcr9kvgt+CHBAQxQTWWYvH08RnKmyGNa4kRNkyR1OnZff7q+kIaBSLzLFLblyyck
	 nn1gZCmuqfx+wSgzZ/kxnbi55NkOKUsbEfEp19Ot4Gk5ickFHmY9seif5ipHkH61Ez
	 lxPYN+r6r/GKx+OpqoBQ1GyA8D5ZvdfDsMxjw40p9KQiZsfluKaSmwuWQDVMzTUUvZ
	 46wQc7DsYXBmueJV0fOYpC3gzoBz/toVnBw8oDkve/PjRHzse4yXfZw09gOSy+l8qh
	 0rbccEqydmLJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 3/7] i2c: Fix conditional for substituting empty ACPI functions
Date: Tue, 13 Aug 2024 22:15:09 -0400
Message-ID: <20240814021517.4130238-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814021517.4130238-1-sashal@kernel.org>
References: <20240814021517.4130238-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.45
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
index 0dae9db275380..296e7e73a75ef 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1033,7 +1033,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 int i2c_acpi_client_count(struct acpi_device *adev);
-- 
2.43.0


