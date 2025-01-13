Return-Path: <linux-i2c+bounces-9054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEFEA0B78D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469A1164767
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD2422A4EA;
	Mon, 13 Jan 2025 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LK2IrmC9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AAD22CF12;
	Mon, 13 Jan 2025 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773057; cv=none; b=CIKENcDRMoyNVsc5DsrT9h1+x5wC78qzzivIUXllM83RwICpcNcdggrzbQEt8xeadrPo4LENrNbR0ajC9CZX8GUt7K5Unv6BbdTDJ7L2jzf007DKbHmqKZcnRGQswDIWgQtKAdkclcu0MVACaWXUDbgaE1hd3RDFhkKmgpgo2Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773057; c=relaxed/simple;
	bh=8Pxmz3/wslt/GXv4SvnITuLsRe5BEc3kxpKCrh8bJcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rDyQNISj63fhagDj3HoPng3VNBd80RePnkK4tiaUanhN13GfN1HC3I69GLCCab2UrnyBbzCriINvwO6MLZ1HPNVDCZyexJlydyfJ2aP78Z2UYaHVLNU8+Zogbwk6Jd5VYyURzUvoPSdsa45dTd73QAZqalrXmJwWr4AyWwrh6P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LK2IrmC9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216728b1836so71672785ad.0;
        Mon, 13 Jan 2025 04:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736773055; x=1737377855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1R/bLp86r/JMT2wpX9Zm2eBD+/DAfIxf1jd8zU+u2k8=;
        b=LK2IrmC99kwAC0p1ffl+A3ZIZr4UJLptJqdleZdFqsb6VKoZtCxvuVIgm0DnNE3x3k
         gQxPFb0prfHSlajqN4MW7XD1VbeFSwpyO+oTdin72uIye4KBifptNPF764HS8SF8ATPC
         lQ4vwAJL/Txm6gZX12C+NgNVaU+G/fMsaupZVY+mH8jIpUad+LkM6X6gsMpItJf+7QeR
         uUmZF88m9GTxkjIkPwm3G29yc0gwfcS/Qg1fjy3GNtGel5+y0lcH422S/sjanUWKcnut
         88xA4g46MxYmrpR9vv3eWNDzJccGiZagckxqWs/LSD2XnLfzUKGYTzH2Iuny+Xa1sefl
         WDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736773055; x=1737377855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1R/bLp86r/JMT2wpX9Zm2eBD+/DAfIxf1jd8zU+u2k8=;
        b=M0Cp8pkqx8Lcj1Yixr0/tYXG4dh0B+z/Xw3ZywJt8o8k4digwPLJpUKcrFXYK6v6Wz
         mJkjXS6IUqQCoDj73qzPFJAtZzE3jfK435+GqE2tPsm6t03kdapQ7eqLYYAoKOSF7l5U
         oZjkGaBFtOAaCuGcsesHEzMGZEJTeJAPpg7vEKDbFB9BA/CVNaLBCsA8dfkSYgytEfVZ
         agfekmL0iKCaApvzA1vnun652hmoQ6hZJ5UD3fFSxNFC4FKKLr1hxWocEqYzPceXwHbK
         BNcWz+QEm5gXOqklTrZVbwxl/efJjksh9R9ZCLwb9Dm+z3SVbR40e0LR6MO7mAjGkwzu
         YLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAQTY2ie+I7+X8kyxrMFomXHA8FQ8WXMAM7rbQxKMCXpuH43KSF2DH0LsfMfPvl8z8hyNrcQqwAM0=@vger.kernel.org, AJvYcCXlMxd0awp4RY9ye3xm5Fhk2/gkvOtUfoMmM9wA38hVLVXNrTNsCnhAGNocgrbd1wLpds1WndAPC4OboJ1r@vger.kernel.org
X-Gm-Message-State: AOJu0YyI7O69/3zKll8oS/Oye10VCYO2yUoEMDzBpnzMorT9hFittwMA
	LGHtEAq0SjJ2ZZKBkM8eOGoT2RkZTWtSr3p1POyu/AI4CZzhuySz
X-Gm-Gg: ASbGncvscvQ5cdA2D6hfOpNM3CXdgxF+HEviTSDmPeCBZeU0JbAYfjPXk+18kX7A9/m
	pYSssHGyxp2iTagDlWOPhqX6AR9E2A6vT6aWPWoQRNAvPaOvuashGuo2FW7dbGp4N9D+ndr7Ber
	hmuc1uahiKLpxU1fQa0r/TDx37uOPbi0YVqP9kc9MAe7HGmQkJddQyZzIIvOIbQi3cyUHYn8Yml
	RN/EnAMle/mwrBRlgzLS3Sfi1LBvgqsHy00ktK7RPeAZmP3RWewIUdaRKk/80s5GzMjCkgxDHFp
X-Google-Smtp-Source: AGHT+IEg5CYmfkzu99LVarSHGPk8js/juoNXMheXmtTW0p/UzjqiFwoLk2OiCvgZuzl0a4xEAulIvA==
X-Received: by 2002:a17:903:2806:b0:218:a43c:571e with SMTP id d9443c01a7336-21a83f69672mr249362035ad.28.1736773055458;
        Mon, 13 Jan 2025 04:57:35 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:3753:de2e:4f32:3096:e3c0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12f93fsm53816805ad.65.2025.01.13.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:57:34 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: amd756: Remove TODO
Date: Mon, 13 Jan 2025 18:27:28 +0530
Message-Id: <20250113125729.3014-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

removing TODO in i2c-amd756.c because Andi Shyti said on
https://lore.kernel.org/all/ovddzx2zitp6lqjdasinn2zaaefp35y4mspol3v3x5rk3tddgo@kgcwexuai2ir/
: "I think the real solution would be to just
remove the comments altogether" so yeah this patch
just removes TODO

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/i2c/busses/i2c-amd756.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index fa0d5a2c3732..3621c02f1cba 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -211,7 +211,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		       SMB_HOST_ADDRESS);
 		outb_p(command, SMB_HOST_COMMAND);
 		if (read_write == I2C_SMBUS_WRITE)
-			outw_p(data->word, SMB_HOST_DATA);	/* TODO: endian???? */
+			outw_p(data->word, SMB_HOST_DATA);
 		size = AMD756_WORD_DATA;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
@@ -256,7 +256,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		data->byte = inw_p(SMB_HOST_DATA);
 		break;
 	case AMD756_WORD_DATA:
-		data->word = inw_p(SMB_HOST_DATA);	/* TODO: endian???? */
+		data->word = inw_p(SMB_HOST_DATA);
 		break;
 	case AMD756_BLOCK_DATA:
 		data->block[0] = inw_p(SMB_HOST_DATA) & 0x3f;
-- 
2.43.0


