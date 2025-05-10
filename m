Return-Path: <linux-i2c+bounces-10922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3FAB247F
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 17:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFC3A1B6564B
	for <lists+linux-i2c@lfdr.de>; Sat, 10 May 2025 15:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9512D22CBC1;
	Sat, 10 May 2025 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hw6uoiLV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D91F0982
	for <linux-i2c@vger.kernel.org>; Sat, 10 May 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746892714; cv=none; b=bQTbSsz14tHgPrvsR9MpEt41ZUlwm5s9uB77o2tDS7HXwE+dU727qaqrZx7n6CD98D8pgVvQr8l+LESMeD8U1Xv1n7X1dbzVpqo5dVex0hzjcAGHLhe3ECgyjJE3hFCfunlTOw1OQ0QCXLxlNUPTkhdqVmef1ChOe3dJOCWgWR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746892714; c=relaxed/simple;
	bh=0XtGWeuHms1co+4sbJXxkH/nrBQ8rDUScbrSWsUEdl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i78JoqEXVOTHmiw+tt+NbkFsI3G/7TIguePMR7WYL0cBFNSWY0nnw4hCRsp3aYDJtSlCtnJ4yZ7XTYLYEnBYLbiwzAbc7MxE9m/A+Yk67Z2m49IeC7n17bB5vLh+hjD5c+FMusHt6y/DQZHXOgXEt1l0M3xCrsOFTCH6aiKBtsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hw6uoiLV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30a8c9906e5so3950216a91.1
        for <linux-i2c@vger.kernel.org>; Sat, 10 May 2025 08:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746892712; x=1747497512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItNIE0AcZ9Oje5hbGBo69QPzUy1IzZ60Emtu+bwgaKI=;
        b=Hw6uoiLVQNvMLYtvOueanOi2pyWpAvIfOhQXrxVUwR63i0tzkCfIPnog/Ye9+1q4E9
         2jm4SUl74J+n05r9OXerJj0LBcOX+eWicGgI6n1Hm9y3CmIzDnlufCF6CzmKACL6FL3h
         zJgvIE5QBUynlgN0frWR2a8mLYBc9R9Vr5/hlMSzxKP2vZ6JjG7j5LUkrhVogDWunhFO
         vaLO3QvNITCy70bOz2GRfsXhHfKHaFrmd6DyRW0bIYK+ZN/15nQyDOuZY8E+Ivtu92wT
         edUU/CPKuROlPXm+QXPIBTpPce7TH+OssFcpaPL7q0N+BC4wVt9KhqHtQzFj2DOn+22B
         rUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746892712; x=1747497512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ItNIE0AcZ9Oje5hbGBo69QPzUy1IzZ60Emtu+bwgaKI=;
        b=J/dXBT3Le1QacVlQv8GCA6mdt4ko2Pfjq7o4Ru14F4JNVGpho0wnB+f9jnfUlTKbDm
         5YMxBwG9uVM+VtnPAUq7zhr5HGV7y7Dpa9bMw8pv/pT1fM/lbTT/butm4uDv9yQjlpy/
         ggrc3tbAykVH2FkR4BFj12ID6/cqjuodwCvdn6OqP8V1d2ACUPE3VnFw+8BGsL4XV5l0
         SLGpPsq1rMXd9z6mHLji2xMCeClL0ob9oVCLc/cibqjkm6cZTaf19uxrQZ4HzColhu/J
         4mzhbAzWB56Qv800N2DZKztYkR697yJqvbmoC7I2Be1qD0I59dJyAHxi1pgNxbBiUa0e
         JJNA==
X-Gm-Message-State: AOJu0YzmDn1fBwPkXDrKLprKPhbgv+ueyQUBuyE/YN082G/rXcZq+mLS
	CIRrInM68OKhgl7mQDqAtyYi8Gf61w9dKb6ibSrt8Us9plwQBeIsu0/ZJUFc
X-Gm-Gg: ASbGncvvO++3+FkRN9bIq82axVHdiYvNJ/FD8iDZON5heT3hBPf3UxfLXMBwStA21+D
	3yWJjbYMMJVIJDDGb9YpyKJucQkhrS2QF3rs+rGswcVryZ+pNlBVTDx1150zymkdgVnsDgWgLai
	9NIWHBK35GgthLtww8vmDz9GEHd07w49PVLHkeo+6/TJ9rUVy3o35sglyHRQedwYmvGjNyAhCii
	1PLaZhMfY4Lj6Hn1IuziAV3jleETSmLQ3xa58xKBoG+nXlFkUPOjNDZ2shA8gpxjtAGXAaTaY7q
	qjnu6vjnUsVFNzLx1cBLU59gteOX03plVvWQZcw/kdzcAwwqMx921cier5rhD+Ngy40vmbb1urI
	=
X-Google-Smtp-Source: AGHT+IG4hUOOs6y+dbgJwCKTdXZYlWl0Q4w9E0Hs4/96ziMmPCCe06XZczj6CxKkr7vbB6/x/RtTfg==
X-Received: by 2002:a17:90b:1a89:b0:2f6:f32e:90ac with SMTP id 98e67ed59e1d1-30c3cefc37bmr11498200a91.11.1746892711578;
        Sat, 10 May 2025 08:58:31 -0700 (PDT)
Received: from localhost.localdomain ([223.181.104.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffb6f1sm5884178a91.47.2025.05.10.08.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:58:31 -0700 (PDT)
From: Viswanath <viswanathiyyappan@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH v2] i2c: Clarify behavior of I2C_M_RD flag
Date: Sun, 11 May 2025 02:57:21 +0530
Message-ID: <20250510212721.29829-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the description of I2C_M_RD to clarify that not setting it
signals a write transaction

Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index aa751389de07..29b149ca4b70 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -21,7 +21,8 @@
  *
  * @flags:
  *   Supported by all adapters:
- *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
+ *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001! If
+ *   not set, the transaction is interpreted as write.
  *
  *   Optional:
  *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes sense only
-- 
2.49.0


