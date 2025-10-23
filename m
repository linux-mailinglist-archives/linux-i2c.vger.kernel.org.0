Return-Path: <linux-i2c+bounces-13746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60406C009C0
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 13:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4FB814E8289
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 11:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB74830C608;
	Thu, 23 Oct 2025 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Khbqm+8S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A538130C348
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217301; cv=none; b=XyXwhtZPQgtQdeU8A/862p/hBy7jQxJuOdG7FX0gF/XGHVht7hwaqn5XZ/NGKB99aNEoYPX12tWUPvseXYPuUqPyER5cZP/eKRu2jgrO5SBNEYoveWXCkOnskPm94WCceNEp8+MKbEUEMDegCeNTbyRCN8k5nqDOb0CrGuopzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217301; c=relaxed/simple;
	bh=acORxjDGKnORTx6j/7QmmdQ6i6FPsWUKCG5ztHHl6+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jp5PsRYSxyybQyORtc0SGz92iaSiMaCx2AWLESh4cWT/pe6yeiGSuUS33k8LhtNu4ULrAk2IQjWT7v6C6cQR2bzPsHrl1WusnSjRQTm0JyaZGV5A21azeIvyITavLMn13ogrmRV+clCLv8VwVV0lkHQPbakn7LQnSpifXY8qn/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Khbqm+8S; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-427007b1fe5so586446f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217297; x=1761822097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6U9a2Cy7mjvoZRssEb49g74q+K1a1YNWMrOof4a154=;
        b=Khbqm+8S8Fk6eJsngpqEsoGwd/6TaRKYz3qrk78hEmlHPLUQcFMB5pKFM+1xoIAWuj
         QYS9WYxuRxvFM1P1L97e/oBJe9D3zClbY/kscDF4ZUxysOjRGxierRSbxpG3enMygAoD
         UgIXh4GnhklYDe+SoMco8IVMciFRikkZM2gDIEmA0PmQukVPwdQLfJrJ/Q+OFu5ME2Qt
         OsAn6/RFQGsCfJ/r29L+RqU3bk7OclWGH2n62lu8ik7jLsG1QTtQqUI6r0qV0ctGukuB
         GXgcKDDPx/GFEQ3tSjl3wQjTArdng3rZFxAyuwlZ194EHJ+E2JXKLriq7ZWf2p5ytwqC
         +RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217297; x=1761822097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6U9a2Cy7mjvoZRssEb49g74q+K1a1YNWMrOof4a154=;
        b=HIbry9pBV1GfRMwkz/OIRIpfkGuIiuw6XRFWxrmtBW+efVcZgS8q6wYCQo3C19MlZs
         LUXfDdlHqLRgji1VrrxwgPw6SguWq2dhcq99O81eYGH37Ddms4PWDVzMx8zNh22l4lOf
         LnbG8gee31Qv7yZAHPEhFZIiIBtQQyuyfgFmvn7o9VzoGAC625bFZMRjS248cTmhjoRt
         h9aR+bQSV4Z+OxCWpBe1NYNI63NYmiXnJ0Gkpg68uz1puOiGmdMP7HNU0dS3wEXhm2g8
         fiq3fdigox8QBawneUpJHsbDZbda2+xJDulEyg1YnK6QRBQThaRviY2Jek7QfOE9X5M5
         YChw==
X-Gm-Message-State: AOJu0YxxllWeEdvlFD3Bh6Kjlal20M/HJ4XxmIGOMQtleAIV83KVeJ6D
	rpKjgL7BAMKoa9yPk1gM3KBgoaRiRzYjjgTfZVFd/x0T71cmaoi2RD1Y
X-Gm-Gg: ASbGncsjzRjEJ9AIcFxwd5p8PW4GeCtoGCraje1pek3cQx80YGQ1NrR6wxA9MGEO6ZG
	obtDFXA1RzNBL3b7H+R73Jv1aEmFQFPFdH6eKkUMQwXFcIQtQEEA7evrL6GfomGU7GixpnIBLXg
	mJK4RuOeR72UB0mKcr0txpPiRuOdKGS+67endI4dpj5reXITJ5JY/YeAoTWbTDwdagjZ5a8qSg4
	WW0NkDjWcSZ1sT66wTdnXJVHWKHjDK+6H+qttt1v9FL2HltkdF9niMXHad2+cY+31PAGNc8vKlU
	7GmtT/XxCuzn2TPy/nMKdV2a85y74TrPnRouGND4+X/ElhiM9FO2Xsouvy7ybv8JeNbrUeOMp7d
	xxcnfEghXlNH4a+zH8vnoGL6If4RSG2nvlMmA+88qvk+iKowSzEN/YTVplCC/6JMrbC8oWjuDM9
	1FROq/NCKiO6weP/U=
X-Google-Smtp-Source: AGHT+IEapGdsnbsARzHgqMt7pwyPik5jNaiTQ3NpmdvCWaP+cQHwZuOZPDEe5IzRDcAqcGtZcpPuiQ==
X-Received: by 2002:a5d:5f82:0:b0:40f:288e:9968 with SMTP id ffacd0b85a97d-42704db9eb7mr16255793f8f.51.1761217296901;
        Thu, 23 Oct 2025 04:01:36 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf78sm3596420f8f.32.2025.10.23.04.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:01:36 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v1 2/2] i2c: pcf8584: Make pcf_doAddress() function void
Date: Thu, 23 Oct 2025 14:01:17 +0300
Message-ID: <20251023110118.7940-3-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023110118.7940-1-chiru.cezar.89@gmail.com>
References: <20251023110118.7940-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change pcf_doAddress() function's type from int to void as it is always
returns 0. This way there is no need for extra assignment and extra checks
when the function is called.
Remove assignment of pcf_doAddress() and replace it with a simple function
call.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 06b9fd355bff..6352314e48ed 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -253,7 +253,7 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 }


-static int pcf_doAddress(struct i2c_algo_pcf_data *adap,
+static void pcf_doAddress(struct i2c_algo_pcf_data *adap,
 			 struct i2c_msg *msg)
 {
 	unsigned char addr = i2c_8bit_addr_from_msg(msg);
@@ -261,8 +261,6 @@ static int pcf_doAddress(struct i2c_algo_pcf_data *adap,
 	if (msg->flags & I2C_M_REV_DIR_ADDR)
 		addr ^= 1;
 	i2c_outb(adap, addr);
-
-	return 0;
 }

 static int pcf_xfer(struct i2c_adapter *i2c_adap,
@@ -288,7 +286,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		int ret;

 		pmsg = &msgs[i];
-		ret = pcf_doAddress(adap, pmsg);
+		pcf_doAddress(adap, pmsg);

 		/* Send START */
 		if (i == 0)
--
2.43.0


