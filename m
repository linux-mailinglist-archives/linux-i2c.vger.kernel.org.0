Return-Path: <linux-i2c+bounces-4669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAAA9292CE
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39F9A282C13
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFDF7D401;
	Sat,  6 Jul 2024 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jhVTylJy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471077101
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264899; cv=none; b=DaCREZ2sbL9lOWJXt543HxCGgUhNtnzpr3kGunBW+xZHFR6ldHM/RtvHyCtEZRjRvuVRT2rsuJaNCLsNOXWZh+eDruvXRIk/hRm4O5lFDGYmDJd/qKru2WLJi7Ll0BYiQTMB2I78SapLyQ0PUbuXYRGupGm/7FNEniM7YmjNST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264899; c=relaxed/simple;
	bh=qGjn/9vTh/gZgy0r2AUJ6EZ66gGJ5gA1BuXG36z44Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMBWBuYQgFDWYQABChTh5lemNmGbnBrmJuduGuUteYrNffxWLYX6gwmu36CpDL3gOQKXLPnPOFxWaGpoG+rnjy38i6THy8E+7m8I4NS6UE0IomeswqzsDFgHX2lG+6NxtbXClEBLoGR/UogXN0VmswngMqXorQ0f/BYZLmtyhNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jhVTylJy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=wqXQ54qgkglZuSLbby20q12AVh90trs55zU4JL0dlCY=; b=jhVTyl
	JySgtkBJt6FxOL3C+iiDL6F00t9rwPXqNz3AZvbYKUlmurWl8GzzpBpXuk+48LcO
	j0pVldoRxKL9fqDLvVNlbnxIm1y2SqGlcAgCKqmC2ryTucvh4asT2xnmE9mSrUcr
	0jm6TVOSrB8w4vW/Jg52ZRD7bCpLy8WS5jge7dyLRUTX+xMGnnichBnnxL2Y5IKF
	+z/kOSMhAT0WMZw1MN7kcA481jYl0Rsiwq2cJy7Z2vBxRdiXNGl1eJ1/oGnOdZog
	DA8DsGgSf6eEDjfJnKzkFZXV6O75uSkHJuJd4g+NXpKbhXwUr1KhOaXzwdVr99Zr
	CjRE1K3LfMVOCzWg==
Received: (qmail 3809485 invoked from network); 6 Jul 2024 13:21:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:23 +0200
X-UD-Smtp-Session: l3s3148p1@gZFMYZIcttJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/60] i2c: ali15x3: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:02 +0200
Message-ID: <20240706112116.24543-3-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-ali15x3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 956e5020d71e..4761c7208102 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -39,7 +39,7 @@
     We make sure that the SMB is enabled. We leave the ACPI alone.
 
     This driver controls the SMB Host only.
-    The SMB Slave controller on the M15X3 is not enabled.
+    The SMB Target controller on the M15X3 is not enabled.
 
     This driver does not use interrupts.
 */
-- 
2.43.0


