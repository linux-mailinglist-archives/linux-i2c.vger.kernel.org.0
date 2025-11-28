Return-Path: <linux-i2c+bounces-14336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D2C91B21
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 11:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B3E3A8448
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 10:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C1D30BBB9;
	Fri, 28 Nov 2025 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NYKh2crl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1F2F28E2
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326555; cv=none; b=Juh36Sl/BCDQgWA2AV3ZaANFWNi3zfZx6ZHAG1gsy/bs36HEASCS86joJ2q6RbjeoWVNwJz0wMknVhTkAtodn844G4/oU+IA8R2bfR2lVqca5h9kwFQZp2yHXHOEdK5wt6d0W6MeXKFcvN+q6UeFI5SCEoScgU6TPglak7PbJGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326555; c=relaxed/simple;
	bh=3IMkVmGSMYvUDDeh6yxFErC4eVe7SC/IvKNxl35TdWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHixwIk0K3zlHHcwBv/jt+/MFGD+IhSBKoZii17LkTBzlY2qxMWSu4uIPnDQWW1O0m0lk6n8wEQ8Zum0WE5B/gFlMhn1B3azdtqtcXOLjrguGjdtMxoIRizg4ylcDeMtHHw6r2vRMSl0a3H2HBuaXyO+azndV34wVhqdEYatkDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NYKh2crl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 622651A1DF3
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 10:42:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39C0260706;
	Fri, 28 Nov 2025 10:42:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59AF3103C8F8B;
	Fri, 28 Nov 2025 11:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764326550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0aDNrJ76T3ry44+9Cy7nDXEbONQg+FsvPstGEphdCio=;
	b=NYKh2crlZlLEuJtRGhbqe9XCjoZrBHtWtRUYEnzcITmmPOrHBUmDszsVlRbd5e8MG2nAhr
	S8sBJHNb8oYvWMU238zPV2sohwcul47km4CSjJNy3nhLKNAMeUWOTcFBvPIq7h987A8mqI
	5StjFt7wAu9sWmZ3gwJ9BiLDT9LrZeb2jtqq7AUQe4AP7FfdDlnRMEoz42iajQWBDnM5XO
	GclDyzdtpg28qy+9Qd/OGp5YmANY3AxSXX+ECk4um+fG0VPv0uEmx5drrPWacinxvKTCvq
	LZz0jV4VRsKLZReuNoz2DmiKOBtRla+bIweIkx6FiUfxvupJvJhz9S9thghZQA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 28 Nov 2025 11:40:09 +0100
Subject: [PATCH i2c-tools 1/2] i2cdetect: Display mangling and nostart
 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251128-msg-flags-v1-1-6353f26fa6bc@bootlin.com>
References: <20251128-msg-flags-v1-0-6353f26fa6bc@bootlin.com>
In-Reply-To: <20251128-msg-flags-v1-0-6353f26fa6bc@bootlin.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Show the support of protocol mangling and repeated start elision in the
list of fonctionnalities displayed with '-F'.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 tools/i2cdetect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
index bb2f146..70b585d 100644
--- a/tools/i2cdetect.c
+++ b/tools/i2cdetect.c
@@ -165,6 +165,10 @@ static const struct func all_func[] = {
 	{ .value = I2C_FUNC_SLAVE,
 	  .name = "Target mode" },
 #endif
+	{ .value = I2C_FUNC_PROTOCOL_MANGLING,
+	  .name = "Protocol mangling" },
+	{ .value = I2C_FUNC_NOSTART,
+	  .name = "Skip repeated start" },
 	{ .value = 0, .name = "" }
 };
 

-- 
2.52.0


