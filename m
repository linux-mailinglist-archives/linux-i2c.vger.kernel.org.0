Return-Path: <linux-i2c+bounces-11278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB260AD1862
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 07:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81012168A6A
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 05:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3374827F74E;
	Mon,  9 Jun 2025 05:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr+ubNrO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17F17BD3;
	Mon,  9 Jun 2025 05:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749447504; cv=none; b=aSRG5R0TMI0vxCX4zYU0tkDiclV9lWK+1DaX3/HakDTj+Ah1Lhycj+hyd/L9UkWNPxiS4wwbphxE/oBmX6aFGAygQwXHryL2Yc0o45M/ju0l519yZJOk8uz52vrW0HQOJlstTNTVGqo0TXiSK3f6F5TpMxJxQhDfc90sxqjfe4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749447504; c=relaxed/simple;
	bh=E7t4ziTT3wF/689+gwT++HqhjP1/cK2PxAJ+YqFkDgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PVEHNHCrdA3cQAcOOpCrecLDtHbIA/YMszKo6njruYDOjW/i5qEDsAm4oZ3F2P33s7GV5vOAyoTrD94ItT6dM6i8jk3PLzTMy2TYgD4X0Nj+TmQGH6MCxXWzY+lw7BZaoLHvwNg10Nx87X8c45PtSQ9TpXt5bGpaNv2q/h+IhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr+ubNrO; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7304efb4b3bso2431314a34.0;
        Sun, 08 Jun 2025 22:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749447501; x=1750052301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wECMIUhZX+RAEutiSlsIQW+PxVMgIoUiBXiClAXqQgA=;
        b=Qr+ubNrOLrFP/PftEWMJN4EUdVxIZB43Mh56iD+7O0/JNt560JAnYzDC+32bmgmvzs
         n8QDnvlg1Niky+QsMThp5hwXWYai15IOGuEzJKl8M3705Ogu7OOlthHX/DfRgVcl8hRQ
         RIGfv8srfFQBkSIGIcxmg+wkCNshxEKPD///i+sbMbi3P9XBnNnHlN68Kug1o6didsnG
         oTQKj7jnzepsPl1FpqVdHqjK9/f83oWqnC0RbUl26l4KN5++se+EqfOP9swyPb/zHO6w
         p21PAN9kzKzX5CEew6o5tNhElyv6hOV6ccb6EcF8h/f0/uZ9Keb5xeGn+6UZfakHzWnH
         3eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749447501; x=1750052301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wECMIUhZX+RAEutiSlsIQW+PxVMgIoUiBXiClAXqQgA=;
        b=skES91IqoM+A8l/XQxzD97ERkuRkqM21ZrkBqJDoj5OYpNLqm6Fr4emNdgCSxONhIU
         TIOZ0pUnG7q8KYYwqQULRq6DQOTJAPmmJyJwE0o9SaORvTTJg7uoXutdrZulzU1J75JY
         OhOHUQIF2ikM2oOkdfVmyO3M2c5+mUWUSdyGuSauD3RV4yH03M3yf2/YUwm67AZxae4x
         /PDA1n2O86FTMAxEmifphAuQ7krqcEU133CZNDiZFyzTyBiR+zjZnnr/RU5WJpx90Rw6
         jCvG6bQofUpjmQGYBFEf2CXbtk9C9K1A2YewmuQYhmaEkAdJs5s1IDc4DgD0by80ekmw
         4/CA==
X-Forwarded-Encrypted: i=1; AJvYcCWjtlVbOTfBQia2sz5C09FV/l+eQGiUXCGKTVxU8+g0j9m9D8AR49VHzn18uqFmw0IPz92GNA+lr3cvXBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0khjFwBRO8Z8n/A834BCzHcHFsxv4f6UmQBU3C+rZ1pJucRj
	6UHtc/n8E0Ip5iHMiepDZxUKhb6uO2rfCQhAAfHseBOIgmmCDEfjzdPCUYlLiwuhCzo=
X-Gm-Gg: ASbGncsGgJ4wE51plD7fauozJJoRCy4VHOxxXtZMdLLgbuRy1SYLvj0hcjY/Xucy2fN
	amVGoeHo/R3g7CoUOyRnjp3cvIJaU2Qd+hQ6GTzxswnSCJwbDumY/qt2XvM2I35qX/mCV7XnFG/
	gzxNGofILvXfauHay0uU+wwY8GJkXX+N9ZfEEi0srpzoNkivL0aN0Ycm4q7Sp0VgidDrgulu2pf
	OFlODG/t5S8+LgNMJvX1pbY/Ejv3QwLfZUBu7UIJLEv3UL8A/goW3X0rds7tI/4nU0FE942uRkA
	kd1IDX9yyefr9amn62TNOtk2orDOjvuoJUToCMFtlABJq+dtTBg3uE7QtBt/G4yl
X-Google-Smtp-Source: AGHT+IHEPMW4QL4R4mIdsXB9cYzCYRxWgcw8Mv10xqxysGpCwOek+8N7wQFeVEF5+DwJeA8kLp1PwA==
X-Received: by 2002:a17:902:d4cb:b0:234:ba37:87b2 with SMTP id d9443c01a7336-23601cf094amr176200675ad.10.1749447491085;
        Sun, 08 Jun 2025 22:38:11 -0700 (PDT)
Received: from pop-os.. ([2401:4900:1c97:ddea:418d:d481:617b:9b03])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f895274sm4545659a12.68.2025.06.08.22.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 22:38:10 -0700 (PDT)
From: Abhinav Ananthu <abhinav.ogl@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com,
	Abhinav Ananthu <abhinav.ogl@gmail.com>
Subject: [PATCH] i2c: core: Fix uninit-value in i2c_smbus_xfer_emulated
Date: Mon,  9 Jun 2025 11:05:08 +0530
Message-Id: <20250609053507.10628-1-abhinav.ogl@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BUG: KMSAN: uninit-value in i2c_smbus_xfer_emulated drivers/i2c/i2c-core-smbus.c:481 [inline]
BUG: KMSAN: uninit-value in __i2c_smbus_xfer+0x23e7/0x2f60

KMSAN reported an uninitialized value access in i2c_smbus_xfer_emulated at
drivers/i2c/i2c-core-smbus.c:481, triggered during an SMBus transfer via
i2cdev_ioctl_smbus. The issue occurs because the local buffers msgbuf0 and
msgbuf1 are not initialized before use, leading to potential undefined
behavior when their contents are accessed.

Initialize msgbuf0 and msgbuf1 with zeros using memset to ensure all buffer
contents are defined before they are used in the SMBus transfer. This
prevents the uninitialized value access reported by KMSAN.

Reported-by: syzbot+0a36c1fec090c67a9885@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0a36c1fec090c67a9885
Fixes: 02ddfb981de8 ("KMSAN : Fix uninit-value in i2c_smbus_xfer_emulated")
Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e73afbefe222..a3ee30b72f75 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -332,6 +332,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	 */
 	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
 	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
+	memset(msgbuf0, 0, sizeof(msgbuf0));
+	memset(msgbuf1, 0, sizeof(msgbuf1));
 	int nmsgs = read_write == I2C_SMBUS_READ ? 2 : 1;
 	u8 partial_pec = 0;
 	int status;
-- 
2.34.1


