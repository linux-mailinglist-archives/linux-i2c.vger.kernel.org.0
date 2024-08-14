Return-Path: <linux-i2c+bounces-5367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A6395123E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 04:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A68A3283FEF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 02:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4BC156677;
	Wed, 14 Aug 2024 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6SpnSA8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787B8155C9B;
	Wed, 14 Aug 2024 02:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601753; cv=none; b=KlMhjAm4ok2xCYrRn0uggJvVB2ZyaC+qLHnuqXHBykxc7rSVAPjJNFALhlwi2QYLzgwBhQKAOJ4dG40Hwu5HKDhbofdgychxuvbU+IAj69zWDHpHKeBzKvTLWKtr6HPSgU5fiQyRZQXhbAC6XAQkASz+oT8lLax3bU0RsOSjvio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601753; c=relaxed/simple;
	bh=eJIFXPkQXIcqE85UJ3e7CdFtYuvDhidECh/7Iypk8rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJRuWky2PQ5lHUg0UKU4aPVbKqQy4YU2gLJK3QuzYwVeZT+tD+NVzp3/a6X8KV02pyiYXSVgOpfdSZCi1w1/fpH+mkLtxlNKxEVK+Xj68a65v/0ZHJyPIxQLmydMcScGmLCrsNi8sBlAFTRVSE8v1lCBYCwhtl12UQKhxgKCx2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6SpnSA8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0564C32782;
	Wed, 14 Aug 2024 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723601753;
	bh=eJIFXPkQXIcqE85UJ3e7CdFtYuvDhidECh/7Iypk8rw=;
	h=From:To:Cc:Subject:Date:From;
	b=d6SpnSA810YdmitKvKZbNmm6LnrQBk0iavrzxmqE6I2lg7MiXgrMyaQ6ssAm+GXoy
	 xCIgz7ep/NCO8AEyZrG3B3CE8keE1W3HTeg450QpIpQSdt/Pg+IocXjuKbSYiyUxZz
	 hUtaMJxZIujYryeOw9yqeI8HtsLyayp9kYNpdMVcVuD/xiqmdjUiYglaOw6ikt4XUO
	 6vg6R/EmYclDQFFknqaELrxy3NHKn7wGalzx3jmbAewldzNSmrBUR9eJDPjfNGeUBs
	 FLe9koPJU10FY8QhS++j8mmzBiTEkCdnBEorm05oTQuwj0sq/XnKqeNlJk2EL71e2n
	 ajoEFKQ9V50MA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/2] i2c: Fix conditional for substituting empty ACPI functions
Date: Tue, 13 Aug 2024 22:15:50 -0400
Message-ID: <20240814021551.4130652-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.281
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
index af2b799d7a665..fee64a24f9877 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -979,7 +979,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 u32 i2c_acpi_find_bus_speed(struct device *dev);
-- 
2.43.0


