Return-Path: <linux-i2c+bounces-1962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A03408624BB
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 12:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDE1CB214C4
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 11:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A822E3FD;
	Sat, 24 Feb 2024 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKzXQTiW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD57250EA;
	Sat, 24 Feb 2024 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708775460; cv=none; b=BfflACddI8UJuBrQHSzSkk7g2d1nvN0gXscfxf7bYdqWEK/DM0t9zTkmXH2OUqdYMyVsj0LMrdawULvwRpzVsPAEaPoal/4AAWdjndrC1p0raEvkchWHvsRruX+QZG5R0lG/zJsWlcIAeNw2WfAlhK1uAfL1PXkK7IEdO/DHVOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708775460; c=relaxed/simple;
	bh=KJLqD+mDBE4hk+UJe1qIjkPT9OK3HHkWAw+spo6Yw8U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I/YP5XpXDO7pNAgsieI7k1OcdRS7BSiN3ByvcK5DHJKmB2QEElFj8UhmMZIrkYqy2Csyox4hn/UJALezJYQdJ/emddSWJa3mpg0rLxrM4+h9La2/pTEsMuYibjA2JSpiNtZYVBb5pcK/gLmNbrOxM9UWWG7LjRkRsyTrGGhlNrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKzXQTiW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc75972f25so10257025ad.1;
        Sat, 24 Feb 2024 03:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708775459; x=1709380259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1w1TsmP0uHvZ6WZJPlzpu7LLrkvsPJNjZMcmRMhdC8U=;
        b=aKzXQTiWBsNYrkkO6ef/IHkiwKK37XbyXyCH4ShVDVLbBLzpitho86TLGvwCn21+vM
         ClVWRELubQa5ZXp7iWkRb8QkOybG8HvFAByzI62eNXA4IbJoc64f6n2ToFVe9W49/N3X
         NZQDYu49IN+QawcVw+uR/QQGVdYjdbS+qLLZpdCvEBwECYSnGX4S8d7EWJUblaj1F7is
         EpA3ujWv+LT450XYygFm8UipGqWB+o+NUPxOE8Pnx1cqeV1iJl3x7gKrgNsp5NTjwG0y
         BPgAHE80amY3sUDEcTRypPy5ClnKGwe5fmawBaihPRF/7TA71s21Ty+4eBrWYrUcGis8
         g7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708775459; x=1709380259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1w1TsmP0uHvZ6WZJPlzpu7LLrkvsPJNjZMcmRMhdC8U=;
        b=EwLrpk2bOUKlKDLtNYmBLTt0yDk1XBaBr05ghwybV0+MMSmYdX/+i/yQmOHK4J7zha
         bqfMLzr58qNK3uFy7mq8mxkb/Wd17101KtM/kq70maEU5JOlkRpZcxz1Osvsvx03S+wW
         9CUP/mqfcLKNbx9r32UuGk9Jdqx3aJKtYqd9qoSHTfIsPKTpfLG1+q/upbfwZTtjdjh/
         R0seqE0u2D4zNUGgsUCN9jdKY8IicttxyUcDVcw/jOQwIHpe9OJGVwyR53XM7KBKR4aG
         gV29fpfgjsW96kRLrs4lYz/3feIxQNLOAytE7K1oFZCCqxYHWFJI7b7A4ptvluSuZJQt
         uK3w==
X-Forwarded-Encrypted: i=1; AJvYcCU1w7Dl/18Umdc3XGJoOlMtvgaoZmNVw7hPlGe44Mml39uBw/eSvLLUDwi+K54ALymkd+iSUqOX5tfMG4xGhXCbYDobUtuhh6+IcK5f
X-Gm-Message-State: AOJu0YyFYTSRXJHEelCDBjaEFENKhoIA9qKw2AocLiLPBWwRGiPKOm3f
	kh0YO0JzpZJOhnrKI3JDT+H2jFcLD2TGjIsu7/Wl74LCCRB+SRADysJDAEIfVOw=
X-Google-Smtp-Source: AGHT+IHNAoGPtSYot5eiFHMp39YCTN2vzXWNjELiASOuiviMZHnuvWi0Jw9E9+rvfMQerXqioNVosg==
X-Received: by 2002:a17:902:64c2:b0:1db:e453:da81 with SMTP id y2-20020a17090264c200b001dbe453da81mr2218401pli.29.1708775458698;
        Sat, 24 Feb 2024 03:50:58 -0800 (PST)
Received: from localhost.localdomain (125-229-101-177.hinet-ip.hinet.net. [125.229.101.177])
        by smtp.gmail.com with ESMTPSA id jc2-20020a17090325c200b001dc2d1bd4dasm887695plb.80.2024.02.24.03.50.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Feb 2024 03:50:58 -0800 (PST)
From: zoanana990 <harry021633@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zoanana990 <harry021633@gmail.com>
Subject: [PATCH] i2c: remove redundant condition
Date: Sat, 24 Feb 2024 19:50:50 +0800
Message-Id: <20240224115050.3199-1-harry021633@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C_M_RD is defined as 1, "flag & I2C_M_RD" is 1 or 0
One more condition does not need to be met to obtain the value

Signed-off-by: zoanana990 <harry021633@gmail.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 652ecb7abeda..363dde9ef94f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -931,7 +931,7 @@ static inline int i2c_adapter_id(struct i2c_adapter *adap)
 
 static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 {
-	return (msg->addr << 1) | (msg->flags & I2C_M_RD ? 1 : 0);
+	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
 }
 
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
-- 
2.38.1


