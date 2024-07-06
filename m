Return-Path: <linux-i2c+bounces-4707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FAF929320
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFF6EB22506
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9D2161326;
	Sat,  6 Jul 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i5o4V6U9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CE15F41D
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264930; cv=none; b=Ru000K9b7Tj2gJgFaIyeYUCB75ikJC9EZXUDnR0ypHfZ12LDexy91iTyfULpvqG3yzpUqsO97qsxX1HQjHp7z7lHhuwByMB0NWf6y/ECOntuMjZW5vBlA2oNTxQkLH+8Irlg2s7TNC5YrpBeGvYPiGJ/P1qi5mj8/Vo73TU8s84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264930; c=relaxed/simple;
	bh=LC9274zYZNNoIDjW9gtVpFmKwtZgBHWPcK2ESnBlMIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3+1B5NIoB7fM1eNLWkebVHC4W1OYOhKcmW1MMb0GbUWzxE6XlHcg3UZ9BsxJDpuwWthcdN78ks6nxhGpOvmcwXYWWEiKWTVq0WwNcTWAZQQK31kGk3qMnr9eJOdwmkoL0nrdoTpzz33V+qPQdPTGNgIr5lw+kicrF/YGymC/h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i5o4V6U9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xIfP0ObNR3Sa4KA9WJrJhsOmA19adO8Gkgz3gqnCOiU=; b=i5o4V6
	U9dZy30EU5m8SCenoLQBqZOoF2vq3Z7B9coBjQIYHubLkP77ImknPpAaL1h2xlbY
	l09GI6TV+Wfh/uh7jmwSGv7AohEEJmbnuEfKZ9MfA/X0D8eLWDaPDetcVKck9pmn
	65r3wlN9HEbiM1w8P7J7+FVUnqDU3yguYy5SG4rKv94wtKSs2O09aAhyAjeQdvF/
	exZ4GBCVXW+RwzWp+ZOte95i5pi4Dg5HTLqkHdgHERGFnchxXs0mrDwFl3HEye5W
	4GCsEaj4HreiH1aqgCP4yV86CZu49Aw2hQMVlVLNINd5KaOv7aO75QS/oQQSBF1i
	XIYUburcWFEEDCZg==
Received: (qmail 3810663 invoked from network); 6 Jul 2024 13:21:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:50 +0200
X-UD-Smtp-Session: l3s3148p1@KSXnYpIcNMJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 40/60] i2c: pxa-pci: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:40 +0200
Message-ID: <20240706112116.24543-41-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-pxa-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-pxa-pci.c
index 08b3229c443d..6b3c6a733368 100644
--- a/drivers/i2c/busses/i2c-pxa-pci.c
+++ b/drivers/i2c/busses/i2c-pxa-pci.c
@@ -4,7 +4,7 @@
  * Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  *
  * The CE4100's I2C device is more or less the same one as found on PXA.
- * It does not support slave mode, the register slightly moved. This PCI
+ * It does not support target mode, the register slightly moved. This PCI
  * device provides three bars, every contains a single I2C controller.
  */
 #include <linux/init.h>
-- 
2.43.0


