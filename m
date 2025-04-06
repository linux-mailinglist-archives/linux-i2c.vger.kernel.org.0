Return-Path: <linux-i2c+bounces-10102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB0A7CE34
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Apr 2025 15:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64FEA7A5901
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Apr 2025 13:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865711B0409;
	Sun,  6 Apr 2025 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lETP044n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158314A4F9;
	Sun,  6 Apr 2025 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743947366; cv=none; b=OcVilfP6M5sTfeVMCUWsmJpeM6XATMy85pgkbeysVTsxa5gc8XwJ1hrVAxh66NCHPQBvxXJUbZo8SZTa079DLSk/7t/Fvzl/ZA30a7fhf4i4RNkP94M1yEIaqODTJb+35w+yEaW6dFC2lOTPQvvwcUqSbWAsCkS2jTr3mXraRWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743947366; c=relaxed/simple;
	bh=ArgTWo4x2CFscJFkuLJcGxeqCgmy5qAUc5MwffAw1Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SI5D2zY/oood3C7KuGeNApvrydGCODLkspmKIjLqN8P+P9kJBje9imM7Sfz5TmOesik+dm+69JUvyo1UU/DlRDLEqu6P5UHUdA7dEddSZ59Gs1pW3p44QePskLOq/DWKdMbDRX08qN/5NfXselPzAHS6GWm8nuXFSDf2aQFAPTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lETP044n; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225df540edcso46460105ad.0;
        Sun, 06 Apr 2025 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743947364; x=1744552164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XJJwHD/DSdygcA+azSZln/silKp7gLNndAvbGA0vLs=;
        b=lETP044nP84Oq2C1DiI2O8NdeAXpebREuFsqf1f3PPChlQxjIKAeJNaaiF1+0WYr0l
         v7sDYowkUu52Aeo5TOKUHIYdZXuD0/hfs/XIwt6RYtNW+WIGPO8Lx/ai8GiB8mWcAphC
         wcXUUAJ/W/lT/trysyyY/0fRLqc6Jsa9oSQ1MjzOe5hsdvfSmVEio2yNUckh8ergKwm1
         WENqTdJU6gBZCylgzjGU07zq5rTD8Y+QHC0/JPC74JNAWfL1VSvTWPzEW5Ta3tqFGRLI
         33WMRGosDO1ssulDZTzxO4DXrB37StPViC/Z7fY/00tuaxJ3NAQnqu+8mlyo5y3ovq/T
         ZcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743947364; x=1744552164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XJJwHD/DSdygcA+azSZln/silKp7gLNndAvbGA0vLs=;
        b=VAfyeSB6EJZnT9COrQP5aHdxSEbEba/Dj1tYfjPgFtsmCnMPUyEYaZMt2UyJFN3Vgf
         ypcXnps2VfVuHNRtntAcVD9AlZHUSbIGVFqaj2i9TcpDya4coEiTKH5H/UDNCm7SJeLs
         kAlfTbz9qxv4ODOw5o/AyLPO16KIMeaDdXV903udwKYt62AzojHRUDlTRwZrcCYuIb7S
         OYxvS+dnnle8S4B289s2Hjd9WucVtl7AlW5t3WECLaSBjHuUHhXcgqWa15FRT0OWq7bp
         jg5DHvR5fgD1rvBUjnT4DT23z9x5m03j6Ia/HKXLKS+wzQqcPhT8OJeP+TJmMVtlfrHi
         4BPA==
X-Forwarded-Encrypted: i=1; AJvYcCXs+Dy43htf1rtGT94bD4eloAEfbTEdntXp+SBWFL1rDvllPNCz3REdod9JAGQLTzGarnEE8izLgEeZbTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/gNVPU5beCbTheOcqkFYwoclNgYxLT1OU/letBzeNvnVs8Vk
	8k79CUmpXENgYqFISTltlA6mJyMUIAJaTwdFkY5wJkDr8KAF0my9Y1eSOvzp
X-Gm-Gg: ASbGnctdFIU1faIZzLOMNx11rQGQzjmi3yiJXsXqY4npyoY7l9MQUSqyMD9iW6DeMzh
	UTap628DtfW/jkLOVM96Vryk/zYXKIpDzPEGbFcdH2sl7/fFIFBV1NSaazMBTormMhhVsIa/fAU
	JWdO7wVEYqJPOMg3VmKozOmr3faSC7pF+kwdXMqp3kKePwlqBHcjwaSgaVkqN+CB9VKR6smCrJu
	HaGlg6yN3xrV2bn0iFbktJQJn2OdR2p1URpqzrudu68Utmvl64j+yyfE4c6m21VN4aqXSZOBngd
	erkq3hV2nl+J33QHESx9UyZJQUk420epOaRyIRmLPdW1RuW1GR3a8ZkosY/z+g5sc73U
X-Google-Smtp-Source: AGHT+IHhxQyzcJjmfjcUf+7IIE5KBMswZTaMesP3rbbfL0Nt6hI5f/R0zPxqX37RyPVsPWjqzutlfQ==
X-Received: by 2002:a17:903:2406:b0:21f:6d63:6f4f with SMTP id d9443c01a7336-229765a492amr188388945ad.2.1743947364113;
        Sun, 06 Apr 2025 06:49:24 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.134.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41ae31sm5709960a12.72.2025.04.06.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 06:49:23 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] i2c: Fix reference leak in of_i2c_register_devices
Date: Sun,  6 Apr 2025 19:18:43 +0530
Message-ID: <20250406134843.67702-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a potential reference leak in of_i2c_register_devices where the
reference to the node is not released if device registration fails.
This ensures proper reference management and avoids memory leaks.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---
 drivers/i2c/i2c-core-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 02feee6c9ba9..7c50905de8f1 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -107,6 +107,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 				 "Failed to create I2C device for %pOF\n",
 				 node);
 			of_node_clear_flag(node, OF_POPULATED);
+			of_node_put(node);
 		}
 	}
 
-- 
2.43.0


