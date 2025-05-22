Return-Path: <linux-i2c+bounces-11099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D9AC04DA
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A4E8C7FA1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 06:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A233221FCC;
	Thu, 22 May 2025 06:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YTLC1lPu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D8221DB3
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896933; cv=none; b=cIvRLwXt0pX0DxPx1wFVWB6puvpYqliOeBfFp6oxkOlEySfjlYX5XewwsSP53z1EOod6KJHSJQOxZ+XtK4M+ht7I3AELCf5JjuBBZqafA0vxSNnks19mjZUpw7hK6CmfR5O25mfqad+sfkevSAOpF+Hi2oaqnBKR13Qj23glRvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896933; c=relaxed/simple;
	bh=gpj+3cjRv3HmbbnsOpqoyBOJfpbE4u+wX4LfmMfK6X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lg2eTZLA5xMIKUraLDtmObJuRNNqLwNCjUlJ9NFHlU2uhVDi9jVmnm35wm1oAAjBLgNIxu0cXrfL2GY+qosWYeKDNBC0qXy1jD1D0OJyvXHY6w9PwlDC/tk/QXDgshfArkJ8ZtpeqVb29UG7SqTZKPgF481mwkGoiq+HyuVhHuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YTLC1lPu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=lqUtLuV8Bla+oujeY8nytTfc7R3csikgKbUrK0Ja+IE=; b=YTLC1l
	PuF3nKRfboySHc4FxkGjl7d6NJMws3+BJfTrhFlhZn3cGSc0FhzDyZ7+KuGBjNkr
	30FQ63jSZb/hXkB5shg/ddzTGPAWPb6c9uwrh0U3p8uFJLG4GXbK1cabixF8Y+oT
	gfSI+zL0S/wosRNU+IywAt+hMtmmizK4bdPJ1gfK1xaHv+WHw6QouzzSbr/w7NYk
	aHnHZoURnc1eBDn7/oB1kwyeUfPVSnYMbzsQyzpkDW/kL+0M5e/oSLAdDOhZ5bhQ
	Q75nAM1xGO7mMMYi8dblsiAFirnGlYFsKuSh25rH153DCe4sUKsAY0W2DvUFDvC5
	/aTMMk4MxE2SGhaQ==
Received: (qmail 3537970 invoked from network); 22 May 2025 08:55:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 08:55:29 +0200
X-UD-Smtp-Session: l3s3148p1@9WmN97M1QuYgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: usb: hdpvr: use I2C core to handle only supported messages
Date: Thu, 22 May 2025 08:55:21 +0200
Message-ID: <20250522065519.4138-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250522065519.4138-4-wsa+renesas@sang-engineering.com>
References: <20250522065519.4138-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HW can only do write-then-read transactions. This is a common
limitation, so we can add an adapter quirk flag to let the I2C core
enforce the checks instead of open coding them.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/usb/hdpvr/hdpvr-i2c.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index 54956a8ff15e..3c5e6c33bee4 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -124,29 +124,10 @@ static int hdpvr_transfer(struct i2c_adapter *i2c_adapter, struct i2c_msg *msgs,
 		else
 			retval = hdpvr_i2c_write(dev, 1, addr, msgs[0].buf,
 						 msgs[0].len);
-	} else if (num == 2) {
-		if (msgs[0].addr != msgs[1].addr) {
-			v4l2_warn(&dev->v4l2_dev, "refusing 2-phase i2c xfer with conflicting target addresses\n");
-			retval = -EINVAL;
-			goto out;
-		}
-
-		if ((msgs[0].flags & I2C_M_RD) || !(msgs[1].flags & I2C_M_RD)) {
-			v4l2_warn(&dev->v4l2_dev, "refusing complex xfer with r0=%d, r1=%d\n",
-				  msgs[0].flags & I2C_M_RD,
-				  msgs[1].flags & I2C_M_RD);
-			retval = -EINVAL;
-			goto out;
-		}
-
-		/*
-		 * Write followed by atomic read is the only complex xfer that
-		 * we actually support here.
-		 */
+	} else {
+		/* do write-then-read */
 		retval = hdpvr_i2c_read(dev, 1, addr, msgs[0].buf, msgs[0].len,
 					msgs[1].buf, msgs[1].len);
-	} else {
-		v4l2_warn(&dev->v4l2_dev, "refusing %d-phase i2c xfer\n", num);
 	}
 
 out:
@@ -165,9 +146,9 @@ static const struct i2c_algorithm hdpvr_algo = {
 	.functionality = hdpvr_functionality,
 };
 
-/* prevent invalid 0-length usb_control_msg */
+/* prevent invalid 0-length usb_control_msg and support only write-then-read */
 static const struct i2c_adapter_quirks hdpvr_quirks = {
-	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	.flags = I2C_AQ_NO_ZERO_LEN_READ | I2C_AQ_COMB_WRITE_THEN_READ,
 };
 
 static const struct i2c_adapter hdpvr_i2c_adapter_template = {
-- 
2.47.2


