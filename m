Return-Path: <linux-i2c+bounces-5365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC08A95122B
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 04:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87D432832E8
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 02:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012DE14EC6E;
	Wed, 14 Aug 2024 02:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFFvpTsY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC8214D433;
	Wed, 14 Aug 2024 02:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601742; cv=none; b=jOHPyD6pgzmsa7SykZx4uFwkbQFDugXje3eZ+t4FjKs9gCZ/g7vXfltfzUkxPPfQD7eqa5AjnWzg/0qkfQRUogt77N7QC/B8CnslFTQoiVaQrvY7AoEbDJ8ywiz/3mb1X+UcfKezbAZ5pKVcUHw7NLLPVeEtNkz9L2ve35Y+yDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601742; c=relaxed/simple;
	bh=zL1My/LyvD4GqY+p8d/F6K87Ouw7czJaVOUvZ867mTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hccZTzAKQgBfRu9wcpNr2aZnhS4v4AXzd45zWltreZAAZQQ9K+3jC3ADJohE5vRB4A+7WfxOUJ2P9QxXLIDElxtpYTP2unAgys+c6YnONQhwQ3IU+LthIMoVhaNjU8GmsE90Lj2QcnuCyn8QdBci0eoKJoNEi2PASgVcNwwbdzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFFvpTsY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11E6C32782;
	Wed, 14 Aug 2024 02:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723601742;
	bh=zL1My/LyvD4GqY+p8d/F6K87Ouw7czJaVOUvZ867mTM=;
	h=From:To:Cc:Subject:Date:From;
	b=AFFvpTsYNZSqcVs1F387S3ERomTi4+RCAWJXOs7fHXlN0ADyXP3jZHRWK70ErdyDJ
	 LXw9TikRLlczSO69PgZhOn5rLEsfmIPKo3Qdhq9UcYSel614/i/70ChzZv8FlSJgRn
	 lFNShvqYAKxvsPTTjurTwEiYiZRGl4tK+1uOt1xWRfDudlNtYIqJb4eQtB0Z4a/OoI
	 qR+rhGRt6F/aR45PFjv90b8qqDPEanP/p5er5HAW0NTuO7qns2XFc9V1w/6v7HWhXy
	 hFhMPtisgJ8+L5GJ14/iHz3bxZq4xKHv4I6Uue+E/kHeSl9PY37r7/pEKJ01EYK1th
	 01jYBb4wp5O3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/3] i2c: Fix conditional for substituting empty ACPI functions
Date: Tue, 13 Aug 2024 22:15:38 -0400
Message-ID: <20240814021540.4130505-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
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
index f071a121ed914..dbb6aa3daf89b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1025,7 +1025,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 int i2c_acpi_client_count(struct acpi_device *adev);
-- 
2.43.0


