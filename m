Return-Path: <linux-i2c+bounces-6393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E151971514
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 12:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 111F31F239BC
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 10:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CECC175D38;
	Mon,  9 Sep 2024 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DPAloqnQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E631B3B2A
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725876910; cv=none; b=jzSDo3Y45f50dNXJbzqP6x27ueR1bnRLotZEXJpxFxs8g7Ix08GlxMYkOzVZpu6dCpy0SPQk70ZNy6ljgjVwwGm67ZSdFbjoslUJ5E4NFP2Wv+rBzuzi68pSzEK2cQld4X7lvSiSLjrgEkK/hLPhukQaBUj5Z0wSZWW5N3/MagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725876910; c=relaxed/simple;
	bh=iYiiZYMW5d5IKe5lxd4620eX0tj60EgR17w9m7jJkMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCwvBG6yV0MHIE457VExDSP6navuG+NLukAGM3NtQ1Y5fznZVjQvXCm2RGBC5twALfK+iIbPBr9wwQZD05F0QbizsrbrVeglRQhaCKF1mmnsEPckEL0aQZ5uyCqc1Yxc3hsKvglzSImZ/C1NAO6dogt6MlcqVCpmHCtFCAG4/dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DPAloqnQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=289U87GA3GSL5l
	cTchh+w4AZi32RduF8/gkTCqtLHyE=; b=DPAloqnQYxG5l4UGcCcv9ysjBXC42I
	vi0TwV0l24FXI6z2YltLyJn5YHExul1VnlLaSCiOag6/ZuyCQZutbBg8R5b4SqsA
	KviX3nXuvCvEZdUxf9kfq5eim8CAaiJVKFxStSBKhbR5c0AhXB0dgssiiIs3EkFy
	EgZ1367tUVCIXvFL7Q3vD7FI/2N9+iNLLgzQenqs7YkBG1jtzUNIIsceFoRYCfLO
	+cgkpWbe1wdgvaVHmc7GYvLQfCV338LeG1hlh+uxX/qz3O25rQIXZFiTs6xPSsoz
	3BHjuwJ6XBdwGCac56nDGPa32kEIEkYM4rY1FiHj8Gbud2VUkYoNWX1w==
Received: (qmail 2031615 invoked from network); 9 Sep 2024 12:14:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2024 12:14:56 +0200
X-UD-Smtp-Session: l3s3148p1@QINUB60hQJYgAwDPXwlaAFpYOMUD2VTJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: testunit: improve error handling for GPIO
Date: Mon,  9 Sep 2024 12:14:50 +0200
Message-ID: <20240909101449.22956-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bail out in probe if getting the optional GPIO returns an error. Bail
out in the test early if the optional GPIO is not present, otherwise the
timeout errno is misleading.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-testunit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index 9fe3150378e8..0d6fbaa48248 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -183,6 +183,10 @@ static void i2c_slave_testunit_work(struct work_struct *work)
 		break;
 
 	case TU_CMD_SMBUS_ALERT_REQUEST:
+		if (!tu->gpio) {
+			ret = -ENOENT;
+			break;
+		}
 		i2c_slave_unregister(tu->client);
 		orig_addr = tu->client->addr;
 		tu->client->addr = 0x0c;
@@ -232,6 +236,9 @@ static int i2c_slave_testunit_probe(struct i2c_client *client)
 	INIT_DELAYED_WORK(&tu->worker, i2c_slave_testunit_work);
 
 	tu->gpio = devm_gpiod_get_index_optional(&client->dev, NULL, 0, GPIOD_OUT_LOW);
+	if (IS_ERR(tu->gpio))
+		return PTR_ERR(tu->gpio);
+
 	if (gpiod_cansleep(tu->gpio)) {
 		dev_err(&client->dev, "GPIO access which may sleep is not allowed\n");
 		return -EDEADLK;
-- 
2.43.0


