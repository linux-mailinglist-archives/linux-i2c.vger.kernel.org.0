Return-Path: <linux-i2c+bounces-8846-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC059FF3AD
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jan 2025 11:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14C991882535
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jan 2025 10:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BB842AA3;
	Wed,  1 Jan 2025 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQGbaLxH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A82E2F29;
	Wed,  1 Jan 2025 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735727671; cv=none; b=G7I9ymum/+xiCdpMRp+uydgIi6f1v21WK0zZx8r4gcVd+H4rULwmHVqwpLhiJRMArlWu4vICDrqeSrfq/pPFbdqExrXPGEjndY44+Xdq2I9JKyYwl/8yRC3j0W728rAy6gu3YkwXL/FlcLoeyBab4HaUHYHSbFpbF6wuHBXaIRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735727671; c=relaxed/simple;
	bh=DFOMUtBdbMy3oT5XzvdVkf1mvA4+EwJdLPbUTX5bXkM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tVUaIX7pOjadK/AUwl4AxzQ+T6il2z8NWjac9bOPl4SI2MpbS6lA5wegULck9kLWy5TnVNJoHSNG1H2Pzq9CksGJOWmHuWD0yCAPbFvZzRU7socFWlfPbhbdeSweAtfUPs+Wcy/mXm02BT4EuM5iqxHLkW6NuAJ4FlPkT3U/NVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQGbaLxH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-219f8263ae0so101020595ad.0;
        Wed, 01 Jan 2025 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735727668; x=1736332468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZZHKQyC354fyKXqzAJZruvflTjzWZSe+cDTc08s6QI=;
        b=GQGbaLxHk/x9IlGNKL+YZE9xXiP49S3Yvy6U1v6WorSQmohMJcthGZRtpMAMJGHdIv
         9aL5uZ0dgRyaFp/A80tEW+QJmrdbLkP2gRiPrs/LS4qsPw18eVGxu4TkvE303/Ix7RUo
         rtd4iV479FN7o99n22pAOrgPpTmzxYCwEYN38zfwac+pOcQZyjeigRYMv/nPu8Eeq7lo
         kfPmYjtB2XmgLyNY3iwjY8ZK0hvjGmaOyjT1itcr3a/PP2UAooE3QwkOf3otHahBGYA7
         Hyaf75WpzZkAdNKN82NgGLYareDkXV18N3lA5hoFCkSGQT9NftniIqkyLZBr6rFX4M6H
         wUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735727668; x=1736332468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZZHKQyC354fyKXqzAJZruvflTjzWZSe+cDTc08s6QI=;
        b=tUYCUyHKLKrkehOIeD+2FUJc59Syty9UDRzvIy4cfVcFazMvBi3lETiQzTqAi+rPmR
         Si3RqAmjxnxyjFmH8aLYr/kkUdwI7jvL8VsuKLrzDB+bdajsUGYnv1lKrb681yaD/Rmw
         nmJ/PAw6wZjL5tcz+2QJh+vY8CuYesGyQ8K6XHZdNOeIPQz57nBSdCw14mTV96MxN/Tw
         EqM1Dd/0RMxeRXjgrT9barTiTO9KpulkfnpGlTJmzFDlpqLCA7I+q0am4pXCZMVy/bZ9
         yig6yvyZJhxdvGvsWQ1Y1hlVzc0jCKOWb1oDuAxDt9SzcW/wmPebc29zS82AgNDBDBfj
         NQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYcRUDwZkJena4+rQ71Nq/MBtyGXDrmdqIFrUNG3f8CnDKlZl9dxEC3WG/dRqoMnkLwDW0tigdLjg=@vger.kernel.org, AJvYcCWaBfmkk1McLTe7mBK7mlPFBmcS71+I0ZXlM2LzetU+NEu7OcV9hxfvAa/8w3pjboiTsHJ1PMByI2lPi/IO@vger.kernel.org
X-Gm-Message-State: AOJu0YxUOI2fa+6pIiseqmi6DY4A37tJfkNE/GAe1ySSerRPRHLL/cE0
	MiVF9WlLPP7lLFTnhdsqODIvxNmPwRSR1/Qhq+f54KWl7qDD5erPOYiz8A==
X-Gm-Gg: ASbGnctCRscbssVerW2jn7gaQI8WvpVuKYZ9xRxwpt1ofJV8nxKi1VInM+PqRNAc4nA
	tYQencD/urY5DLN8WGK8+FuSJWF0GOJA+hhvm3lrwxBI5RVOQ+ZdzMCKr+5LpBEfoVocNToZ1uf
	+TSwNqUCd6TqfpgluS97jkUfO/43pTV0Tu+Ub3LNe4QVePhaa55fuQANB5Xr/dGBhfkO5mLm3Rb
	Kauj2EHZ9A0tUnNlt/+lHDEgyyDnYuAkvpIbbWnGjQ5HhutnCJ17VESJEyMMerPuBibSr5zvmM=
X-Google-Smtp-Source: AGHT+IF+CLngJYqOSzVeSCBaVRXpPPAQeo71/efjerua4XTwxJt9ueHwD7K5yNk9umB90+H61wnq3w==
X-Received: by 2002:a17:902:db0e:b0:216:2259:a4bd with SMTP id d9443c01a7336-219e70dd108mr653323015ad.52.1735727667673;
        Wed, 01 Jan 2025 02:34:27 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8899:1857:f97:ec95:bdaa:8e91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca04ce7sm202798795ad.283.2025.01.01.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 02:34:27 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	kernel test robot <lkp@intel.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: amd756: Fix endianness handling for word data
Date: Wed,  1 Jan 2025 16:04:22 +0530
Message-Id: <20250101103422.30523-1-evepolonium@gmail.com>
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

and you would be thinking why did i resend the patch
it is because kernel test robot
noticed a few warning so i fixed them

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412311145.AKMzVNw4-lkp@intel.com/

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/i2c/busses/i2c-amd756.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index fa0d5a2c3732..e551d63e96b1 100644
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
+			outw_p(cpu_to_le16((u16)data->word), SMB_HOST_DATA);
 		size = AMD756_WORD_DATA;
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
@@ -256,7 +257,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		data->byte = inw_p(SMB_HOST_DATA);
 		break;
 	case AMD756_WORD_DATA:
-		data->word = inw_p(SMB_HOST_DATA);	/* TODO: endian???? */
+		data->word = (u16)le16_to_cpu(inw_p(SMB_HOST_DATA));
 		break;
 	case AMD756_BLOCK_DATA:
 		data->block[0] = inw_p(SMB_HOST_DATA) & 0x3f;
-- 
2.39.5


