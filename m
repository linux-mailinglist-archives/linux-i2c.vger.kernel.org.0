Return-Path: <linux-i2c+bounces-9483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD21A39D26
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 14:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A8593BA532
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031002686A4;
	Tue, 18 Feb 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWlMFl/M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0DD246353
	for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884255; cv=none; b=h1pf8vjZm1GNm0c7cO6HrES0AkXTZd/AlNA+KwZuXLeybM4ImrPlCgjpFs+Ox41jKMjCbpuJLYVOa1khcojs+fzdKMNJREkRJnvs9hIz0y4ZdIwLnuNwRt5XRm9dYCGyPZ2Mb08Vb60Im0VLGxtNw7gP+lyWv0tCIX/MpYh/dZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884255; c=relaxed/simple;
	bh=7sgFu+7FehmedZrCBn7qAyffQvuCBbFulPRIYm9nFhM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SE0nLTxw3YAyqrw1hS7SyDmrEiXZYqHDGYkabUEjzIm20j8Lp2I9+LmPdZq4BgVSTnsYcPrVYgZlU3LWijnHWlIWZ3UbE+O4wNT6velHg8UQiZKEmqe/Dg2OmdJwDOp6bYewrX/d/7AaaPwBPIAbeFhu6pT1m3Y57IiUVA1+jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWlMFl/M; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2210d92292eso76093395ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2025 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739884253; x=1740489053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfhqTBus3xDwbZNLdmi+ftLFmbq3S7q0HQcR7EyOJ4w=;
        b=LWlMFl/MzYqLiOW9JGDgMnoniqGEW8rb3gbBw9xXCdgUEzcoSC5PwCV8AsyO7+AM6i
         492A3HCVrTX9kv8bxURDeS3OfJoCx1ZKyKV/pRU2GkCbc4/jPkIKVgO4PoDmoYO0CAPA
         eLnfBUw4Rh0XO2KEPdBNHsrN1/FW3iJ1S/V4OY6iLpHoa1NiSXTvlQFlPbKowX1gvGqh
         NPqHcW9OBmLckD23/DzQ0ZMViQswx2YB3CZxDku4V7Xgytv0REDrqJ+GccVmZd3WHCUh
         E0yxnd1krnnwin20E24y9OHuk1AwcVp20Ybqbz8cqCxL8b8g58Gof2r9KFS0MEN2Jdcz
         CdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739884253; x=1740489053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfhqTBus3xDwbZNLdmi+ftLFmbq3S7q0HQcR7EyOJ4w=;
        b=D74IOzTrx2gSxe2ZiVh0BBU3W5JexQMDHcSIN3pREIPKAS/1Yr+1n3dnJY/6r8oXY3
         fTlCz8l2dn1/Qxx8W8O67ffEWh9RQFlJfx3W60aV6rGR6Jiv6/MOL4wbK1xxzXD9sMJj
         BGEAQWgc6wTzfenYT/RZvZHtjmP+ZeSE6uQiZWcwOL1PgpkACrROcdsMagySU9ycMKbG
         RDXhKZSuJJ5UAigHpY4Qf2NNd+0lKOeI2JN2eAuxCSsDLqUt1ovaoQknhAQPND6sKiLq
         sUph5/W7xT1SpZCaiq17DX02sZtS9ZSqXylNB3reVAPu0udqiMrdFlzWPigP7DBgXDiR
         dt8Q==
X-Gm-Message-State: AOJu0YxW1tKk3V0md2ClvQHtMnclUJgyhvODep7GyRXbrrVKe7ShLTor
	O+tFHZ9K265I4lOjskBduyF+M1JWrRphXHwhToJFhAQOGshPeplmLh2o6hqP
X-Gm-Gg: ASbGnct/esTKIfSK4JQaCRbmyXxSHI9f1mLt1CgUZTeODmbuT19SBfqtdgdybYnk4pP
	MJs62zviKKgjWk/16V82UeCWEtGNvH1cZTO9PcxvjfqVD4hDlvEVcRwLaLCUf4v+9F4wET//SjK
	Yr6AP0+/+Wzft8kSrWoOpidJ7ljPbDWTmHN7nlxmcJrN3UrrMuBISoH5lTEcjtU7Unu6OdEtU52
	9MmsoBS7QkMwq60pqPZjRTMc4EzwMVG1MdYVy7IIJqW4JT4MykcS3F6EQoj2LeSbYodiu2ZOplR
	RQQKPs8tsWrxYTiGvHUqNPotJGZrQRrhBSaT4md+qcP24gk=
X-Google-Smtp-Source: AGHT+IHEzId+F9Y/qcM2OvpwjCy0XxzJJ09b+HzFyA5pIuKXmDoAXMEnOESvreJXejyCFW2CYlJgCw==
X-Received: by 2002:a17:902:e546:b0:220:ff3f:6cc9 with SMTP id d9443c01a7336-221040d6c64mr241376085ad.48.1739884253126;
        Tue, 18 Feb 2025 05:10:53 -0800 (PST)
Received: from LAPTOP-HLGLEP2K.domain.name ([223.185.131.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d558fe3asm87815765ad.234.2025.02.18.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:10:52 -0800 (PST)
From: Viswanath <viswanathiyyappan@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] i2c: Update i2c_msg documentation to clarify write
Date: Tue, 18 Feb 2025 13:10:39 +0000
Message-ID: <20250218131039.1344-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update I2C_M_RD Documentation to clarify that not setting it
signals a i2c_write

Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index aa751389de07..07cc80e9e854 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -21,7 +21,8 @@
  *
  * @flags:
  *   Supported by all adapters:
- *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
+ *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001! If
+ *   not set, the action is taken to be write data (from slave to master).
  *
  *   Optional:
  *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
-- 
2.43.0


