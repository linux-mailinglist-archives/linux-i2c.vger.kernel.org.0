Return-Path: <linux-i2c+bounces-8769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB649FD4DD
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 14:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B58B5188424A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 13:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCB31F2C52;
	Fri, 27 Dec 2024 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWj/NLbL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857011F191D;
	Fri, 27 Dec 2024 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305779; cv=none; b=XyyDul0y1WXH7WLSNx5j0BhkAS6yNceyXMzR33OOTG85aSEenweXJoJdxN5FpHl6M7sfRTEMaqT3lmVNP2hXNABsWKypaLrWFNxXdWtK555c+xT+vNDAJtlSug4/uHSnIsKTas6VSWyy8DiQMI7tV60LFDbwAjzUS/fZQ1whpBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305779; c=relaxed/simple;
	bh=R04LozXieA+gErXvQ46hEyr8/M1MinESFs+sTYEy/CE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q1C0KkoIvHqeJh6+eqo7pd/ujvY1AcTXriJVhp9B0XnTOCSMeF93zNKCR4XnfKkEeVSGrvTbSvJKq9yAFB9gGy4gaDc66KlLlmj4uE3ly+gGbrmwWVSIdMinO4IOvpVkmuZXpp/xmA//e8xbTOS4qB16mzSc6p0Lj9g5Z7Up5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWj/NLbL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2164b1f05caso86957175ad.3;
        Fri, 27 Dec 2024 05:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735305778; x=1735910578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XFgPWnpQomgWNPMlEKC3A6WYBI4NvbOjTUZxx211CA=;
        b=OWj/NLbLxKCFkATHdJp17SankSTFnT0bga0GQUmGZD6TB4bYlPbfmMPi4f5Jrmnxki
         N3oVhd/nDXikuDA/dYRLQAHr0rHkpaRZJuh/jSjhGsyIFZJ0UXediQmcBk+nva0JRfZX
         xLLJzelp0EYEeSXdv91vbuUdRhqcrV01gvoSdeEH93XXilnkXydnfRrC3+0bgeB7jv3I
         NZpSH9h0JJu+eNsmmmcnaGHZgZXURb4GO5DNvflXYYS10z4m+Wc7y49eGOHijfjIiQ7M
         BtIdlhn3yAyT/sAoBVOsBmSjlpdyT7eg8vQ8Re298tce+oKtCFWJEWG/QPi8y+f76jgE
         Z91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305778; x=1735910578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XFgPWnpQomgWNPMlEKC3A6WYBI4NvbOjTUZxx211CA=;
        b=IJPXCSnxvsgFYbmQxkJUyMHdaynn+RXVlDIIIRIfS2fvr29t1tbKOFC//5fjqecPWE
         ca6Nf8/MJrLXBVNdFGZUsuKhoa9Rbp5lDuD/Q9dkL+hNiuJ7MYO4g6v/+jg95nFv8Trw
         8ffxo07wr9JaDYd3jzfn4fT8qoma2n1y0dFTdJCIPasjjNnJ9XTC6F5VmUBi/rH24lIB
         b/HnOB4zIB4fkYejH1AZcS16h4MRSQSgIC/ZMcXq4db38+lqH0ZsQullzXtG5r2OthAy
         LQNGbuJ5IdaLuUVaYnfzRKTOkFFFcYi7WeFs4QNkjpYaUIVQb7hDe4PmKSsZyem7pVQG
         aZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWM2yUgfHWOubuQRPZqBJrGx4iHRGHcIbXDO+zHxIgGaUwdtoO6JtxoIaOo7lWOPSwF0Nd7OcW+AW2y78gs@vger.kernel.org, AJvYcCWZFwLc6kXj6RVZlMPfB+j322o0Ei8WbWpLP4iL0ReXpugCfNZFHeUBpFexJZpeuFBtOicnWopGap8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFghT2e3FcxH0mXHHRGq5AjKqKXwSeevwg+pW1SRpKA+Y508ef
	4PYbBEG3RtfP3hz52d4KQVmBc9irJYkVudLEolXAL5FRlMPHhcisb955zA==
X-Gm-Gg: ASbGncvbPVroMlQrT/bPBTMf4FY8+km5BC9BuctdkL4rkTqJDQ2NfredGwSFrB3o1n3
	o1K1A+hvtajXMCioo0nNu5xWd2vIsObP1d9rCnuodi9QsEeGJ1xGNdqkD1AMpGr+oMUSGP3h2kT
	PkAwLhyfxGJQ5RapJnIPzacAWu2pHHYKQakLCRwl3+WnCgkWIlQofHJAyih6AH4uR7iAg+fiinl
	aviSYjwBUVCz5+PUCud1VjRTU56Qil8/WleIVu9vNTtGwseTC2Nmlp5FYB9gjdYQmp8JQwTzfw=
X-Google-Smtp-Source: AGHT+IG6LZOhgcPQUw2hXaunnPzWsmUYdm0ravej1GzPcwVmBeT/hvu7ffE3YrBM+j+jCCnr31fcGA==
X-Received: by 2002:a17:902:c951:b0:216:4a06:e87a with SMTP id d9443c01a7336-219e6f12d84mr446797715ad.40.1735305777670;
        Fri, 27 Dec 2024 05:22:57 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:45c1:e17b:c31e:1a10:429e:9666])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc972ff1sm135287825ad.106.2024.12.27.05.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:22:57 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: amd756: Fix endianness handling for word data
Date: Fri, 27 Dec 2024 18:52:49 +0530
Message-Id: <20241227132250.14435-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure correct handling of "endianness"
for word-sized data in amd756_access

 - Convert word data into little-endian using cpu_to_le16
 - Convert word data from little-endian 
   to cpu native format using le16_to_cpu

This fixes poteential issues on big-endian systems and
ensure proper byte ordering for SMBus word transacitions

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/i2c/busses/i2c-amd756.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index fa0d5a2c3732..f6fe4c32af04 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -31,6 +31,7 @@
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/io.h>
+#include <linux/byteorder/generic.h>
 
 /* AMD756 SMBus address offsets */
 #define SMB_ADDR_OFFSET		0xE0
@@ -211,7 +212,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		       SMB_HOST_ADDRESS);
 		outb_p(command, SMB_HOST_COMMAND);
 		if (read_write == I2C_SMBUS_WRITE)
-			outw_p(data->word, SMB_HOST_DATA);	/* TODO: endian???? */
+			outw_p(cpu_to_le16(data->word), SMB_HOST_DATA);
 		size = AMD756_WORD_DATA;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
@@ -256,7 +257,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		data->byte = inw_p(SMB_HOST_DATA);
 		break;
 	case AMD756_WORD_DATA:
-		data->word = inw_p(SMB_HOST_DATA);	/* TODO: endian???? */
+		data->word = le16_to_cpu(inw_p(SMB_HOST_DATA));
 		break;
 	case AMD756_BLOCK_DATA:
 		data->block[0] = inw_p(SMB_HOST_DATA) & 0x3f;
-- 
2.39.5


