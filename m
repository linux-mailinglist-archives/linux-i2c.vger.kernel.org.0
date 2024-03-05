Return-Path: <linux-i2c+bounces-2199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FD8724F3
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 17:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 186CD1C20C5B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 16:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE15D268;
	Tue,  5 Mar 2024 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFO+fYMA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C89DDA0;
	Tue,  5 Mar 2024 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709657819; cv=none; b=AITLAhP1YjKaYcKJczAwPvarbji1Hb1Ji/xhTEL/TS1v/aUghcy1zEXkpNYQQ+PJk2FgLzUrQMDKQ6DKYWs/F6qLL5hL3HJIJzPgxH9unNTOTNassFWkeBu2Yk5cCHdihKPMjKyYkz/MaKOTdx/XImxj4TBV0kXzng4YJzJZCQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709657819; c=relaxed/simple;
	bh=cI0DEFw2kaaMRX2yorxEsykml5XIXDljX1+quMTyEq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kf68tl+bcLgZSLRfMi2duyqPegavQ+wEBpSBCM5xncD6Kh/yvdoJV+Oq/izlwm4PMkFGmyQlcq0VFkkK8qGg7msVxXqcEnyNNOB0MY81liK3+ipC8r9uVKKWt7kE2DcBq7qzBM6C5NNKvACXYXQBaR4kfITaSbGWN2O7NNlYwec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFO+fYMA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso636171b3a.2;
        Tue, 05 Mar 2024 08:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709657817; x=1710262617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQGkHUGJv9iAGFsBSsW89sAex03GUVkrj7xqR9KP8YU=;
        b=eFO+fYMA2p6njRxUGRYeTF5kv8lZvrHCP3uv9IwMqRhVekj68Ba0TlsHsXBTOg9XVV
         5Z1vznyKQ2+f+1zrVPj51OW0ft7GnxgzZ5lBCr+Iuk2TXK4wnDoBqchEBxiY3p4ky1iY
         wc4j4XdTsEQ4pGMbKdSRlI5tk/hSEnWt3IZQcxmB5kkSgkjSRgzgM28OjI/c2biPwnPF
         EzQ1WVFESBhPQnSBemqBd2mir2nEnsScvz4ddj2gbeIg78UvlkWjzNQZiZCGgm5Z6ya2
         vq6hJ5ijy9l7qnDKIchrgN3GN9IZC7Wl+pG1/oNeAbnwycL8DMLRQukCYnfvr6y8nnq7
         pAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709657817; x=1710262617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQGkHUGJv9iAGFsBSsW89sAex03GUVkrj7xqR9KP8YU=;
        b=est2FqWmlOUAZ2f7fA8YsAX57DYNUaaeNJEgVrEdwGHoZ4kNlPtZSbKPtnd0O7Esko
         gleAE55fdFH4Ef6ctNQvTlfzUR4p9lNvyZ2gQIEf4KoqACPYwRv7GixCAOFAZfrVbqCA
         4+lExqNFOKB7W3aEfdY4RdgCb3stVY+KhOsfHZqczXDIb/BKtfuLu119xHOIJQsIBwsd
         lqgiNmPzV8nElgmJdVU2K9YKJxRzfZ6YkIkxCA55WMEYMaJQyK6VDzs3/XeriTlRSbzR
         uQcbrah2L70I9zZIKbHaZhuPaEJAj4HCtl2/xMKEVc4Mel16fEHQRlyxPjUYROe7dsGr
         y16g==
X-Forwarded-Encrypted: i=1; AJvYcCUbbXCtKYnFTI9M5/km9ubpMwITQJdy8aeNN6/ZBrS0h3VExROh6iZaWD/o3ajq5P+xNhqfE58H7pMgapZJWGUaSMZeyIElZPmfYJl9
X-Gm-Message-State: AOJu0YxfYikiy4WUOF30g/bOyjLTJjBDbKkNe6af6/ago2yHATt467ur
	X3AJtiNJpsafO0y6FJflqzNEu8ZhZeHul9OnldsyN0q1XUpH1JXU
X-Google-Smtp-Source: AGHT+IFcnbfqjPlsggEMvV2KNpHuOuuGmUOnDuok3CiIrE06xauK1fAMcZvBkc6jD3L+h6rS7LA2Iw==
X-Received: by 2002:a05:6a00:1a8b:b0:6e5:4f19:c863 with SMTP id e11-20020a056a001a8b00b006e54f19c863mr14917595pfv.33.1709657817288;
        Tue, 05 Mar 2024 08:56:57 -0800 (PST)
Received: from localhost.localdomain (125-229-101-177.hinet-ip.hinet.net. [125.229.101.177])
        by smtp.gmail.com with ESMTPSA id y133-20020a62ce8b000000b006e45a0101basm9862766pfg.99.2024.03.05.08.56.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 Mar 2024 08:56:56 -0800 (PST)
From: "Hsin-Yu.Chen" <harry021633@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Hsin-Yu.Chen" <harry021633@gmail.com>
Subject: [PATCH] i2c: remove redundant condition
Date: Wed,  6 Mar 2024 00:56:52 +0800
Message-Id: <20240305165652.18842-1-harry021633@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C_M_RD is defined as 1 and `flag & I2C_M_RD` is one or zero
no need one more condition to get the value

Signed-off-by: Hsin-Yu.Chen <harry021633@gmail.com>
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


