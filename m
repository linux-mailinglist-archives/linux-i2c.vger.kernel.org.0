Return-Path: <linux-i2c+bounces-14990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A19D01852
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 09:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5559D30AF9F6
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 08:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC74D38BF6B;
	Thu,  8 Jan 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PV3GGcoI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B4D38A735;
	Thu,  8 Jan 2026 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858850; cv=none; b=Egqs8nDWHztciRdLap3g/vXkSHc1ZhVc/C0x87WdnaaGaGViSVJJA3bgx09nJqRf2yvH/HzFX612ls0RM4LttK3sKIXDXZUJh2o6DRNkwneLU1GkjPY4VgwCOnwxCiAv4WBNSkrmDeghH/J5iwZOak/Xx/vWKh9JaSfTcE5DOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858850; c=relaxed/simple;
	bh=tbIGjlDaxXLlK3CGW7YL2KnO3OY9L0q1RD5Ci1tLoMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JppijklmXvMrbtqb0IsguYksk5afHinSSa1Xl7TeKTdOAHmhIX/cwu/8kZPoK+AZAj3nfnXXK1XlVkJfUyCWDw8K+rJ0EG29s2HtuMMG/gIKip95LsbYcvAoNwIypFW70TQPVr2tAFUvxEx/WNhbry+P9PrYLKcoQmk/rq7x7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PV3GGcoI; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767858746;
	bh=OQKF6a57dtViu/PGidKs4z6esTer4gYIuSWOBB4u8V4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=PV3GGcoIxrpqBrul5/SOSdwzsQhkHR3PwHlm2aQmSNs9aPciOMHeKn/EVHv6qUv6t
	 s1olHfcjslBhsLZ6WMok6xTuvKm6Gox5G8cOGU7E70s3RF8ZFSV8nOUCz3e4IzCigj
	 +7b84JoTNw3MfAB8xl9E+B5AkMQvWl/9pGKbsjyo=
X-QQ-mid: esmtpsz20t1767858739t501e3a4a
X-QQ-Originating-IP: Q9MYu1rJefOIBIX0EiUlNYVnMd56z1u5UxopIxrdviM=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 15:52:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5555458612639012329
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 15:52:11 +0800
Subject: [PATCH v6 1/2] i2c: spacemit: move i2c_xfer_msg()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-k1-i2c-atomic-v6-1-41b132b70f68@linux.spacemit.com>
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
In-Reply-To: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767858732; l=2987;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=tbIGjlDaxXLlK3CGW7YL2KnO3OY9L0q1RD5Ci1tLoMc=;
 b=iv/VwVfba0jDgoFizy6ZVeTjzmJ9+RmrC3djzGroqWNBoCPOXZzhHQns5VDd6AZILvSXRWNte
 nt8twu9OoMPB3dl9G71r4gb3tSN7vXpAHfytLh+hu7OScEUfnXdyV9J
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NoTnWcAlB075yW1wVq4GDLMNSMnq2O1vkNmA15iSvqoA0z4x7bZuRtQe
	2hn4Dc/JrMOA0P1of2hdx/ZvdKnN8N1JHmAO1y8pOgOUv04jWro26e8jSYW8B1Nuuok/4tR
	gQ6h+kcVHOd9ohy0gK9ycI3MBW1LTpY1/qgQA5oibhrGcsElH7CtR8bIFroXlifnbxUEgKn
	8BBLgTSTpVKHSREUJJDgEzhCSjyeuSNUiP0DF/27WbZk5mXA8dU3P489a15nNyNypMYAdeR
	2wua+6Z0A0y6RHsL8//8RAsjNWw61yF6Y8ypmgpW1+52Z1TQsDDKbRCYFIdl3399IIVZ4oy
	xiZ5fbcXP3/fbP9rKUmhyqsLMk3tD4tgbRh0GcCbOPktwv7rKq/hGprBOdZ2WRenqZ3Lmy3
	+IZmKck2Yi9wObwucmCaChrYxLiJQHLLqKkSKC8zCJJl2/Y6Wb0Zx3bp49vn4OZeNUg8zxt
	UMY6fE4pnhbYtq+ZUTlhN3La2FwP6Qs56Wc/85HcCIGK9b48cuQQheWZdBzyj78eYZx5aQ4
	cbP0lUXLXoa+iQ9fCnO/UkVOuaWm/M4DpZDJNnjWJMmmjT75gc+mg1W/LBNa3+saLGi9ejZ
	H/asqZg4xH07W4eDrSJwSI6nwRk9jB8ZrHHfb5H5AeNvnvKLZH6hVdDBZVLpUA987ws/Tym
	B2SYgWQ3+mPUuRcBKRA8G2ZkFmA0650Q+m7LRf2w9bq0LDH+JF3Fd9TIgdY5OLERHU+Y1jx
	TGqztGjf6nnN8vXQVAjyZ1u3Wp+NcfFlFCMsp3wtDsurnlHNHB2DDTPO5BmXACxYbZGQwkF
	x6AJpAvX4dT0SXJ44NspY0loU4n0jvHDwsbEWNYf49Com6uhB103rDdIyZISxSCmeSprKe/
	qcsDx+99AJN2h+AXHpdVgcKeVwWM9uecVD1w5nHP0pbma+SBjqHqKYmK4Jrkyl7nvXzG0TZ
	7pZ3AJIRo/J7Bel5mEGBM+Rrbo9LwpuBK1G8KZX2qTm3CdZKKKlmOlariS1Ho39YopB4rmF
	Dh9L2KnYTVSzxfgCn45V8wLrjayCnikLk3naBv+5w9WvGc235RN/oKImnLdZm9oD6zsOmkr
	dlrVvG7qcuFtF8rOicPAwTLFoB+lXU99HSXrdWX1MPyKco4cy+3MQZCPCBOvH99jw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The upcoming PIO support requires a wait_pio_xfer() helper, which is
invoked from xfer_msg().

Since wait_pio_xfer() depends on err_check(), move the definition of
xfer_msg() after err_check() to avoid a forward declaration of
err_check().

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v6:
- fix wrong subject
- Link to v5: https://lore.kernel.org/all/20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com/
---
 drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..accef6653b56bd3505770328af17e441fad613a7 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
 	writel(val, i2c->base + SPACEMIT_ICR);
 }
 
-static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
-{
-	unsigned long time_left;
-	struct i2c_msg *msg;
-
-	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
-		msg = &i2c->msgs[i2c->msg_idx];
-		i2c->msg_buf = msg->buf;
-		i2c->unprocessed = msg->len;
-		i2c->status = 0;
-
-		reinit_completion(&i2c->complete);
-
-		spacemit_i2c_start(i2c);
-
-		time_left = wait_for_completion_timeout(&i2c->complete,
-							i2c->adapt.timeout);
-		if (!time_left) {
-			dev_err(i2c->dev, "msg completion timeout\n");
-			spacemit_i2c_conditionally_reset_bus(i2c);
-			spacemit_i2c_reset(i2c);
-			return -ETIMEDOUT;
-		}
-
-		if (i2c->status & SPACEMIT_SR_ERR)
-			return spacemit_i2c_handle_err(i2c);
-	}
-
-	return 0;
-}
-
 static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
 {
 	if (i2c->msg_idx != i2c->msg_num - 1)
@@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
 	complete(&i2c->complete);
 }
 
+static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
+{
+	unsigned long time_left;
+	struct i2c_msg *msg;
+
+	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
+		msg = &i2c->msgs[i2c->msg_idx];
+		i2c->msg_buf = msg->buf;
+		i2c->unprocessed = msg->len;
+		i2c->status = 0;
+
+		reinit_completion(&i2c->complete);
+
+		spacemit_i2c_start(i2c);
+
+		time_left = wait_for_completion_timeout(&i2c->complete,
+							i2c->adapt.timeout);
+		if (!time_left) {
+			dev_err(i2c->dev, "msg completion timeout\n");
+			spacemit_i2c_conditionally_reset_bus(i2c);
+			spacemit_i2c_reset(i2c);
+			return -ETIMEDOUT;
+		}
+
+		if (i2c->status & SPACEMIT_SR_ERR)
+			return spacemit_i2c_handle_err(i2c);
+	}
+
+	return 0;
+}
+
 static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
 {
 	struct spacemit_i2c_dev *i2c = devid;

-- 
2.52.0


