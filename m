Return-Path: <linux-i2c+bounces-2514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83452886D1C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 376E31F26DDF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FFF60DD0;
	Fri, 22 Mar 2024 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i/lY9Qmd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45560898
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114023; cv=none; b=dJSM0EUlNkIzLKiNJEb+WRd6SmZrsocavvkWrSfoJomJGcfv2eTHS2yXpUb5jABlWwjLClf8ZDQF2O2wckbRPtlrUCP/yYS5Cyr1V4TUqNnHuNuBLMgjmHEITlW1vGFIeRc4d5Qg+vzMOxRUIsQKuxJvAWGI3FDgB9PVj9curDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114023; c=relaxed/simple;
	bh=GAY5ft5NyrayMYnRBVE9b/3C6FO7J6omqMboPfkPyJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3ypmuUj/dNREckQigcQwNfYcF6Y7wFtp4b1ip89onXh9led/beqJ/YVfaBiZGSUqQX4y3SRE9PVaJWj+ifAYJ2NQudcpgQSI+rCP6qbR1S0UDmkceqB+3U3qYKV80pyyw28V0DUD5QN8bd/Pz6wXrj2G3U1y2DYexP0wMky1Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i/lY9Qmd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ha2oisARdYVLXS1jZiTtFGRJALZMNbKy5spP2HTyWXA=; b=i/lY9Q
	mdnGtjoRzM/ks8HxUNOpzXZmGFanUtRHvykViSfKGPGEQ1PfWtcZdIyWdMo94hcF
	I3hA91jiWmW0zYazPTlLOCkkE/FUnGdq3kxGjOV5ztIRi7lmj74NGx5veDqBMKza
	lfaSmpfSbpVOmnzqj2iRPIhyQAnSJOYR4f8S5pu3/UBSqUX3pet5mdKu3EbzI1xm
	eim2LABOilzx1KHuDzU6xXanmUYpX6bvObS7tJAl3Z2HdeIqyxnjXpwGbKEyj3lE
	lCIZcaPhK+Sl3LnyT8GMd7BgkaqqJ3SiJfrKFdKVXJZmeLK4RJfEmpV+j3zB3oUi
	TTv/lAbovc1Zv+ig==
Received: (qmail 3870872 invoked from network); 22 Mar 2024 14:26:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:44 +0100
X-UD-Smtp-Session: l3s3148p1@zwlixj8UypRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 28/64] i2c: isch: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:21 +0100
Message-ID: <20240322132619.6389-29-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-isch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 416a9968ed28..389202625964 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -104,7 +104,7 @@ static int sch_transaction(void)
 		result = -EIO;
 		dev_dbg(&sch_adapter.dev, "Bus collision! SMBus may be "
 			"locked until next hard reset. (sorry!)\n");
-		/* Clock stops and slave is stuck in mid-transmission */
+		/* Clock stops and client is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		result = -EIO;
 		dev_err(&sch_adapter.dev, "Error: no response!\n");
-- 
2.43.0


