Return-Path: <linux-i2c+bounces-2528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C8886D3C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD0A61C24D4A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB51362807;
	Fri, 22 Mar 2024 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j5w+mNFM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B562A08
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114036; cv=none; b=ksHwtTQvnhXLGfd5p7M5v3TUAQWs6MhLl/fqwyTsxH39m6/Rv7Ln3gLDDpEh+u0Tc5xiCf58/5808oChms693dmbZVfaWr/496RJ4tEuXppNL3hOr3SxtoUWgwbhikHG4slUFuxsnOSK8pubNMfWdWOtgB8HeWiQAf6kXQXOdM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114036; c=relaxed/simple;
	bh=DeTqKdsiejBH+wRIa/M4NTukOGyfLyvqMN1tQylxrUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FuUEuB9Y/DMG/FvXjXPnvzoX9p2H1zGJlk5cQcg+RKZx/F8UdsPHAikeZ2L5hIDe2XMopFzYhBbXWDLmHVrtpMsRIKQlObb3ztKWK1QFwwHe2buaPDuP8iTTP+NjfVbUTttHgvVxRha0sUs5xm7O9YgtVYskMGdq3+yHWTTK9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j5w+mNFM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=va8vNqc+zL5cgGG+Iw+afAtq26+B226YZpwpqFLNgOs=; b=j5w+mN
	FMDRK5YOf4guug8Ig9fZ1bSeTpXeJ7j/XXuEg4MIWvaY8dsq7cphzqVA5u1hhRdy
	9UQBj0LmMlscXjO0aGOU5eADSLZtwkU732kzjJ2rYmq5YsrL1XEnRLHizTepZNHi
	tNG6MFnCt50+MqHjI2tnI/Dfn3e0YytD8xEAY7ql1nJek5o+/7Y/f6ycDlCIYHrm
	7jGqGWkaITt6mHoKGz03HL0E2vzYq9IuxAjMvM774UoAC4UD2XqLwsFu16ZU8IBN
	5jXz/kDrygaz2ow2iqPhuWWQr0NerJLpOq1N2FJ9Cofsj4fxDdvJU31rArK7xWdX
	RtkV/+rHc99cBZSQ==
Received: (qmail 3871489 invoked from network); 22 Mar 2024 14:26:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:56 +0100
X-UD-Smtp-Session: l3s3148p1@NvkVxz8UgrBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 42/64] i2c: powermac: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:35 +0100
Message-ID: <20240322132619.6389-43-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-powermac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 8e57ebe595be..03abc5f3cb9e 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -25,7 +25,7 @@ MODULE_LICENSE("GPL");
 /*
  * SMBUS-type transfer entrypoint
  */
-static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
+static s32 i2c_powermac_smbus_xfer(struct i2c_adapter *adap,
 					u16			addr,
 					unsigned short		flags,
 					char			read_write,
@@ -127,11 +127,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 }
 
 /*
- * Generic i2c master transfer entrypoint. This driver only support single
+ * Generic i2c transfer entrypoint. This driver only supports single
  * messages (for "lame i2c" transfers). Anything else should use the smbus
  * entry point
  */
-static int i2c_powermac_master_xfer(	struct i2c_adapter *adap,
+static int i2c_powermac_xfer(struct i2c_adapter *adap,
 					struct i2c_msg *msgs,
 					int num)
 {
@@ -180,7 +180,7 @@ static u32 i2c_powermac_func(struct i2c_adapter * adapter)
 /* For now, we only handle smbus */
 static const struct i2c_algorithm i2c_powermac_algorithm = {
 	.smbus_xfer	= i2c_powermac_smbus_xfer,
-	.master_xfer	= i2c_powermac_master_xfer,
+	.xfer		= i2c_powermac_xfer,
 	.functionality	= i2c_powermac_func,
 };
 
-- 
2.43.0


