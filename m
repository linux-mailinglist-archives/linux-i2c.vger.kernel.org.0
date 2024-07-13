Return-Path: <linux-i2c+bounces-4977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43680930633
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 17:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0640128293C
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 15:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89796139D16;
	Sat, 13 Jul 2024 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="PoG2L/ip"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380F13B5AD;
	Sat, 13 Jul 2024 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720885214; cv=none; b=kLMXyLkpcSZCWkCl9h4Atv1fWvb9jzF/NFmfqpefuZe2gv99V7eEIuPIymHXeNOaBYP9X7eZMHa5wKwB80P1oykcjLzF5uc+wNURbqEVe2D01y8/OjW/JZNkUyEcvTD5Nh5G0GDjEo0Kkry6L5KaJE1QUda2uDElTDjVVnukt74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720885214; c=relaxed/simple;
	bh=UnDgELUOseieRhly1bQM49zOdrIaykYhBjADLgTPgaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KaVv3XG9ih/8G5mOpN4CypSiONlH/D647078tjWTAtf3Z71L3gqlyDPdVkXyuPROvEwWIYElsS/4Ntvk4fnv2ZUmPmqHjANMRY/NfR6fNrkM24Gb8jYkkowxRj1K76qRP4/B8B3JqhMYTfeVOj2KhVOBu61pHe0F7+vln6ldRAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=PoG2L/ip; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0D87887DDF;
	Sat, 13 Jul 2024 17:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720885211;
	bh=2+9zF85Oopni265DT5OazqIvnJbAeaAPYeBfqOpSJLw=;
	h=From:To:Cc:Subject:Date:From;
	b=PoG2L/ipTghgioIxbIO+ykgHhZHMxybROcatOLCFXgfT9GBq4tX2Ja2HAOGXVBOMM
	 xZ6B2o/+4kFLczOBKlUyx3Rl1Nf2thhXfT0dA3uyKvSzQcsU1rhd1AoWCnvSeCQfYt
	 Xg5/NuxcVgLRtOGH26ylUOW/XO+g5P8ywZ5vQ5TZncSRZMThAxHlO8Fb7neo0HiZYt
	 II729wicoXZ0dioYpK9yfKIDIa/yWrc85ASNj40PnAeTTgMwBZ4jg/YVriWD9wAYhD
	 I7mpWlPpBN9daiiNTG/SpXzz2H28testHMXY1rnYo5x4HwvBIH5xyFhCkVEbc6T8f+
	 OXtMzoa5xBRtA==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: core: Check read_only flag for force_ro in bin_attr_nvmem_write()
Date: Sat, 13 Jul 2024 17:39:35 +0200
Message-ID: <20240713154001.107439-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The bin_attr_nvmem_write() must check the read_only flag and block
writes on read-only devices, now that a nvmem device can be switched
between read-write and read-only mode at runtime using the force_ro
attribute. Add the missing check.

Fixes: 9d7eb234ac7a ("nvmem: core: Implement force_ro sysfs attribute")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 516dfd861b9f9..9cfe7d4bcda39 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -267,7 +267,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 	count = round_down(count, nvmem->word_size);
 
-	if (!nvmem->reg_write)
+	if (!nvmem->reg_write || nvmem->read_only)
 		return -EPERM;
 
 	rc = nvmem_reg_write(nvmem, pos, buf, count);
-- 
2.43.0


