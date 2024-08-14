Return-Path: <linux-i2c+bounces-5364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD5951221
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 04:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBFF1285DF2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 02:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0315E38DCD;
	Wed, 14 Aug 2024 02:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3pZm7vx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0F383BF;
	Wed, 14 Aug 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601734; cv=none; b=IW9OOUkPhIsfQXpePHv5xCEODLQeY8WXV7quKbzM5nMPH6kuYBw8LbXOCsMY+ozo9TXIecgge7mSIVErrLBoxvlfNhi+1GwfIdc2hTsLT8Vcbzd0LsDNRcMl048VW4U6Y55XwqHAOsKRRiB1x+ht0b+pnqp5jTEUpAzXHLyxWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601734; c=relaxed/simple;
	bh=g7khX8F2a724400AFywCT1LDcS64ibhAjY4KcHSE76s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bkL+gQLpUuxHgOCR9Z8fTFtce7tbvsmpugDOAYkFs5fvEvHJ4EbixAIO4tNS1kp41Ic0ULhyXw5vqC2hwP2eICx0v7+MRywe+geQpHg8iyWVNpkOkF0TNACqjHrfjp2HuODfHdjugYYGrXbyiO8Aoalebqfcp3UaF14dZuabIIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3pZm7vx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895D5C32782;
	Wed, 14 Aug 2024 02:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723601734;
	bh=g7khX8F2a724400AFywCT1LDcS64ibhAjY4KcHSE76s=;
	h=From:To:Cc:Subject:Date:From;
	b=S3pZm7vxxD/wF931iwbIMgUYWu7fGjvD+uwf/BFqLq2yuoEl3DGOdgaNFli6A3SGU
	 ohMYld79n3Xobb8o6XwzVpM23c6rIXueFvQ9zisUgKPtPZQTFZ+StVHbnj5EquJ0Xt
	 L4IYBgYLiU0eQpyL7dOwGRtiv+LhDipjHJv5N/vdxqnrIICXvMPRRmqrD4PsDf5FwP
	 Z0KYgGCe4vdH15yh72nFKSxxmgjm84jJiM9cHFXCfVw6Ao7emAb4Q6rO08OysKz3OC
	 +1JdKpG48X/5PnuV+4ZUYDnChfr1Dgl7H+u8hd5dveM+Pbv4/uYBNhmGhEX5RUobE6
	 aM544PDCywI3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 1/4] i2c: Fix conditional for substituting empty ACPI functions
Date: Tue, 13 Aug 2024 22:15:27 -0400
Message-ID: <20240814021532.4130407-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.104
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
index cfc59c3371cb2..aeb94241db52e 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1035,7 +1035,7 @@ static inline int of_i2c_get_board_info(struct device *dev,
 struct acpi_resource;
 struct acpi_resource_i2c_serialbus;
 
-#if IS_ENABLED(CONFIG_ACPI)
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_I2C)
 bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
 			       struct acpi_resource_i2c_serialbus **i2c);
 int i2c_acpi_client_count(struct acpi_device *adev);
-- 
2.43.0


