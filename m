Return-Path: <linux-i2c+bounces-4815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4C92CB74
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4C151F23E7F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 06:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2857581B;
	Wed, 10 Jul 2024 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lJoCwOd0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4DB7E76F
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594522; cv=none; b=TRLRTPn00/pm0c+yARQRZ+atuSIhNZ9sdotyQvbWUppYELk/2qrpyVZxMj/pgOAt/6dqc0zMX7F0Z+SDdMezn805VN8bXPemHFRI2ffGhdC3g2rGG+TltPVbmIV0hTs7KipX3cbuVQ49y4wRE2pq2qeL4KBbI7fPTtXfeVUdrq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594522; c=relaxed/simple;
	bh=KbdMepuNrhkFRBmI543ibcDePFPi7tCtF4NBcNDMLFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SU9BXZBsOQKj4fuCtSTaO1rf8SCL35ey45X7M6Vm/s1BWkOqEP0UgIU2bVe8Q4hYpyITTwVlrwfSdbvMIyIt2dZhMIn8ZpXICSyghZ0ry/EosaLqXphPivxifnftDRI7DLDDFfyZdOFg6TfH1DcQooTc9SQGnMcSFAOQf8oIGI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lJoCwOd0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=s9h35fbW8V6D7n
	tkkyFlFvI8VOfXD54oFEpbsUZ5vSE=; b=lJoCwOd0x9Xgrz1fDanGg5NtFy+WCn
	X61Re7B0ESzs2WZUWluh3icnjvCL0heU5kgAarded2N4GoxbJf4r2wE1eHcThiiL
	HpNEPFMXlqqvR9nvgdMHkB1m7x4y47wvphGt+bFWIPMz76vlV4Jwqih3mHtBG5zt
	+THRW/JU8ApF117ECGdzHTu0PYy1vA1Lm/WUz++NI+LgnaBXRIazDY38GO+0e5vn
	GOD62gOCcdKT+pK859kX/DgDEcqTUN5y+nQxk0zg+jMeJmDgq4Y4jbEzeEx0JanN
	BWkyJhe8WrFAyUgVzhW9ChmYUSwqWNwshOvlesQA/yMau41LaYaBeQAg==
Received: (qmail 436451 invoked from network); 10 Jul 2024 08:55:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jul 2024 08:55:17 +0200
X-UD-Smtp-Session: l3s3148p1@BQsHId8c8OUujnsa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: testunit: correct Kconfig description
Date: Wed, 10 Jul 2024 08:55:11 +0200
Message-ID: <20240710065511.10330-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The testunit has nothing to do with 'eeprom', remove that term. It was a
copy&paste leftover.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 9388823bb0bb..44710267d669 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -135,7 +135,7 @@ config I2C_SLAVE_EEPROM
 	  Documentation/i2c/slave-eeprom-backend.rst for further details.
 
 config I2C_SLAVE_TESTUNIT
-	tristate "I2C eeprom testunit driver"
+	tristate "I2C testunit driver"
 	help
 	  This backend can be used to trigger test cases for I2C bus masters
 	  which require a remote device with certain capabilities, e.g.
-- 
2.43.0


