Return-Path: <linux-i2c+bounces-1834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6371857FC6
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 15:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719152819E7
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 14:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C6E12EBFF;
	Fri, 16 Feb 2024 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpxBqrL9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26FB219E5;
	Fri, 16 Feb 2024 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095125; cv=none; b=OlZ1qBtHBJ7z+79oRTD/F7FT0jZa4homNNa51yv10KbJTE3+r8YC3CTYmtrqllwSudhf94nEsm1GBbkc67eVThBCfBAVJZQ7bdMuGuepVfTbeV0Ro+dbzJyCmuZyrB/HppX9G9NM91bDTjbXKOIGwhZ/tuwbrvjCxYEjA7D0ImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095125; c=relaxed/simple;
	bh=RWZ7K10oIT2NcBU8/Ha3m2stsvCS0fygQeynNXLhKEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ixLdcXEPvQWrodCWrwz+78+DfkfWVYxv1GfeTa6O4VxWjHLFBIjoLgN7pxUeLIZce3JpnijP0wjX1KQBO9vomzAP9dTRENCWa+AtpT0iudIcdhSE6zsIqA5ZnD9r/A92npq7ISUzTtKF0OFCkPksoXDeBikznca2hqGKpAPjNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpxBqrL9; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dba94f9201so6291415ad.0;
        Fri, 16 Feb 2024 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708095123; x=1708699923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqciGkEq5kb14MQpnQlSp2L/z+VGv+8m4wChzvWBMYk=;
        b=mpxBqrL9bpZv6DJEEwiRZKkHGS/dEyrBzpURtzACe2PHQbJtq75QALSkmBym5hPxHb
         IU3v5ijtEp+vVfBE8aTh4idyJMYxQR8/0pgT3hNFd6RiPVUxgHFlcmZPMuqSPlTMP2i0
         BPbdMzDTJ3bcpnf16Tn7YnfAv5S0iLX7695G08jhClx64neYPdUZo60wUaptRL2xTf47
         NCKjEAxSwX5ETegDg4BlqwxCbSvmpNIsh0Yg8xsAYQAa1V3zPbqhnek8qGzh6W5OzSbK
         pk7DCo9WMJpdV/sMCy0JyKL7jTvccaLg43oBZxEzjIFiDzB8shLyL3STP0BFaBSWD/g8
         pczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708095123; x=1708699923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqciGkEq5kb14MQpnQlSp2L/z+VGv+8m4wChzvWBMYk=;
        b=plVGy8tQNYVtO2rZEGCq9GaSntxjCLNu4HPUgGfTOrc57rrocZwE1Wn/CVHOKz5a8q
         EiX3YjkP8dO2K/UewZqzmGXr9Kg5wPrMU171BSW62gaXY6Skrtf5A/sIsTTjpEi27r6t
         1f5MLKYiD1McofxpgQAn+SA6b1wU6NphaERD+ljuicS+dpCfsbEz33bEO4p/DWhOZwwk
         LvyyM9tnIj0/vQcBztTsAndxIytzReVTQtrC1tugorZGyII2i/fcgfmWO/i3uRlg6NSd
         SONApoogAwcsQbAOvpypgdNf+/tZ7pqOZgdD7Ib47VhFsr3ghYDSmYLFAul3BvWhg+Ti
         o99A==
X-Forwarded-Encrypted: i=1; AJvYcCXW5tyopkTvGpeMC4568PDhCxFBtF4iYioXUZEDSZ1ITwl3iS6e9DX8MQaeAnWU0Nz6VxK60vpUcFUjQrHG2HYsQvRdlt3n6K+2geAO
X-Gm-Message-State: AOJu0YzaW9n0APc1jOUIC+SJR585T9O2XGLtp9/pAeSgR2vOY3BYLHPd
	Xu18Ttbg++8yM7Pd3AM0yMpjb4UmGm/ouu4lj7zLYXu2rNSoh/Hm
X-Google-Smtp-Source: AGHT+IE0++znO73weA4hucL6yg3yt5gqTVf9+vyaCYa6wBMKJn/+k9oqhadXE9m64AGLzQdeQcsFHQ==
X-Received: by 2002:a17:90b:1990:b0:299:48de:9c7a with SMTP id mv16-20020a17090b199000b0029948de9c7amr401368pjb.0.1708095122987;
        Fri, 16 Feb 2024 06:52:02 -0800 (PST)
Received: from localhost.localdomain (125-229-101-177.hinet-ip.hinet.net. [125.229.101.177])
        by smtp.gmail.com with ESMTPSA id ss14-20020a17090b2ece00b002989864e50dsm23608pjb.0.2024.02.16.06.52.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Feb 2024 06:52:02 -0800 (PST)
From: zoanana990 <harry021633@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zoanana990 <harry021633@gmail.com>
Subject: [PATCH] i2c: remove redundant conditions
Date: Fri, 16 Feb 2024 22:51:57 +0800
Message-Id: <20240216145157.47209-1-harry021633@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C_M_RD is defined as 1 and `flag & I2C_M_RD` is one or zero
which do not need one more condition to get the value

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


