Return-Path: <linux-i2c+bounces-2549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB9886D70
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A97B4B22C7E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9166569962;
	Fri, 22 Mar 2024 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VT6kn430"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D667C5C
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114056; cv=none; b=RFyHADg9iUlIIJFlDM2jrnKJLGVEPFcxh9AkmtdNW0TQ2lG6ATZBnETOKHWQL2vF0reQwGvK9HlkA5dZQ5lKxCeCWM1ABnttR5ws6NiJ3cXn0QEL6ZR80PQDulZ8O4238iwBM1wVzRLBCcYfVgTnxzMDEPNk92Ia5QPNJPDNGkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114056; c=relaxed/simple;
	bh=3SYrWo907vsAxN9nNRVA1UFj//np9nL10OQCf9WRfD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8Ig3j3lgHkYAwhHJ/35di+Bd0yPG7Yi1lL3bCnFkocA+S2O+J6EGM/Hv9WudlHjZrEp+ynriU0X+zOXqEi2KCu1dL6FFbsZ53BSme72plhErqLJCNS78lZWEPQv42gABIjMYjxHv3B5m5ElAdHStu3pnLQskpMuXluRV2pTwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VT6kn430; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Mc+kkfqmbWeBgun419lGDhT1G5v018HjE/DNf0WDLT4=; b=VT6kn4
	30eDKn9BBGnx/dKE4FI8SNsCOADo0k0+EWC0q1O+6IorhRyNVmvj+bnsHP9srqtd
	5pxcsYrm0XHcOsPX//JFQlehqHfsuY737It4lxyZhp+zqJuNCZwGwk41Rt01m1nh
	hEi6sOKKs8TZLVAOg5/k1GwO0561m0Zs2By/tpMOMqqDXIbaVvNS7V97dwib4uLP
	QjrouLjQsM3UT4BzHHii7DveB1wO78YtDw3y9k0QtpvDLhK5ZYAF/epXHw6lyojz
	K5XrhZv+dgEHTIXELsUc3Ur52VXqhk518n53mYiFsmrH6/k3ACEGs8ZD3VhvnSwm
	kfup9LQTjU7EAqwA==
Received: (qmail 3872340 invoked from network); 22 Mar 2024 14:27:13 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:13 +0100
X-UD-Smtp-Session: l3s3148p1@z3QeyD8UmoVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jim Cromie <jim.cromie@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 63/64] i2c: scx200_acb: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:56 +0100
Message-ID: <20240322132619.6389-64-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/scx200_acb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
index 3648382b885a..0d773210f9be 100644
--- a/drivers/i2c/busses/scx200_acb.c
+++ b/drivers/i2c/busses/scx200_acb.c
@@ -110,7 +110,7 @@ static void scx200_acb_machine(struct scx200_acb_iface *iface, u8 status)
 		goto error;
 	}
 	if (!(status & ACBST_MASTER)) {
-		errmsg = "not master";
+		errmsg = "not host";
 		goto error;
 	}
 	if (status & ACBST_NEGACK) {
@@ -251,7 +251,7 @@ static void scx200_acb_reset(struct scx200_acb_iface *iface)
 	outb(0x70, ACBCTL2);
 	/* Polling mode */
 	outb(0, ACBCTL1);
-	/* Disable slave address */
+	/* Disable target address */
 	outb(0, ACBADDR);
 	/* Enable the ACCESS.bus device */
 	outb(inb(ACBCTL2) | ACBCTL2_ENABLE, ACBCTL2);
-- 
2.43.0


