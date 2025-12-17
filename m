Return-Path: <linux-i2c+bounces-14620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC87CC6909
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 09:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C09312F6D1
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 08:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EFD339877;
	Wed, 17 Dec 2025 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Dr0mjOxE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1633A9CB;
	Wed, 17 Dec 2025 08:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959380; cv=none; b=fiJhcaIXOjvdaPW7oeCEu/3UoDeN75zjnGiXyjqspB8hvQkS7cNmbAjGDaeYaCiEsr/wGNS8CSP3sj4noKraFjjbdmn3sNsaq898X/N0/2u+Ki7GVIlNYdboQ1krUvusEcd7Y5w0x29g09tRiKQ5TRhZKfLJVSekU7f5meOZQk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959380; c=relaxed/simple;
	bh=ndFj2/VBaLvB0PIaxljeZW+fwoxS9OjFWv+5Tz+R8f4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pMjQdiXAUgZsjejN/JNwG6OZaEVWPgSY5iFBnChSRyr18HOJHVKP3aN9Mqqt5OZnZdfNmET9GYK6aqWLD+DBppi0yh8JtvyvQEY9ebZK+0yvQH58eAqDsAEuWpCDoiNLCPAey5T7jj+HIEPmeTA46tyvk4hzlE7YKBqnQWjyEg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Dr0mjOxE; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765959367; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=EnjkgsuHneXoZUzoXJxbQZgrKKLC87jcGoRy+MS+Jaw=;
	b=Dr0mjOxEnane2onJUZkWFQ20fiF+AXUWXU+4D1i23PTfZIwc7YSLvFXufVz/+3qBk/5+28QCP7BWgEipxz+VMQjGVEValc8q8cfTVZ7BmCUBO2prlLSZUECwSZXDG/DGcZsPcj4nwQ2JXU2n92DH26KE0jamiuAhOhEEKuTodL0=
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0Wv2kLz9_1765959361 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Dec 2025 16:16:06 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] i2c: tegra: remove unused rst
Date: Wed, 17 Dec 2025 16:16:01 +0800
Message-ID: <20251217081601.93856-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 56344e241c54 ("i2c: tegra: Fix reset error handling with
ACPI") replace reset_control_reset() with device_reset(), the rst
is no longer used, remove it.

Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e533460bccc3..9e39ac7a0a69 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -240,7 +240,6 @@ struct tegra_i2c_hw_feature {
  * @div_clk: clock reference for div clock of I2C controller
  * @clocks: array of I2C controller clocks
  * @nclocks: number of clocks in the array
- * @rst: reset control for the I2C controller
  * @base: ioremapped registers cookie
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
@@ -269,7 +268,6 @@ struct tegra_i2c_dev {
 	struct i2c_adapter adapter;
 
 	const struct tegra_i2c_hw_feature *hw;
-	struct reset_control *rst;
 	unsigned int cont_id;
 	unsigned int irq;
 
-- 
2.43.0


