Return-Path: <linux-i2c+bounces-13449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC88BCF127
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 09:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B952154009A
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 07:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DED21CC4B;
	Sat, 11 Oct 2025 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="P37NdUa/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84ED212564
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760167894; cv=none; b=n961e08jsYWfDfj5AXUmmkSGWRRFj0Ph4Mui1sxtDqIy3bFRqjQt3/ZsndO/4vxA0qkQtxvHLDsYr9PQw7XUzZkpntFYKMzZCktE6MQdbRQHECNfHO7laz9tZUNy5l6fDWNAkEHwoC8YnxHrIOEN8lTQamcFqFV8DkGJBcBos6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760167894; c=relaxed/simple;
	bh=t10ZSanIx3llENM7HSeecEJVpDcZYb6Uf+MM/xzfZ1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=W7CM4DkY7EgV3mxubbI5671sXM4XrPzqCgs+V7qaT5iCWFIt2toQ425EuAkiKD6vfIAY4vLJWl1t1qwXK9sAgxj9gGbRg/NjIRMxPWnRHhYzwyaYAtxOkJq/YVqwcJLDnvMXJpjVp8AiLhpLVg+BfZZ+XUi2ERagRuDicx27Bog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=P37NdUa/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28e7cd34047so22019175ad.2
        for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760167892; x=1760772692; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5u349rpF9gPPQypTYTXfVoHAsG0CPWqoBlop1wLg5P0=;
        b=P37NdUa/loubMzF8wZvumPKtHv5RWWdbyrb3aOY1pXoyCEDkf/O0qB7vibivrzKjqh
         XMxHs5+j3shY1hBRa/4IoeiPpXnrvcv7eQ7WXxHgwFpMhY6Qm2+S6xpbxJ62BCqp9SYx
         wFIfgKKXzlI9t6OcbrPYgGq3uwyXYdrSK6CFYXDHQ3EO0V/sWEdZ5Cx3bopb8TmCt3gr
         XEQ/5YCOPrt7iEsTeVgJJEobFgv+on/XnlbbnfJi4HxYC2ucH+eoGK0NoHS8HcnUYzPu
         Ixg8KiTAWhHHCmXCafYLnFbs169Xso4YRRRKNfi1DbFrfBmI3C8AzlflruMmIcdadqcm
         NSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760167892; x=1760772692;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5u349rpF9gPPQypTYTXfVoHAsG0CPWqoBlop1wLg5P0=;
        b=D8Nm7G/XPtEiujM3sxp4CJtIhk5WkyFPi3PiKBmnQm63wPgwXFkbndrxGnO4h82Qy6
         z6WG/DTaqjm4PHOXLh8KQXa0iqI8Q0gzR822sQo/U9Gf4JURTUfU2gP5A9mQO5YzTzMb
         grPceaTmy0bvG6lE1ixaBYO8xSVsZEn2VFotICc9Iv7oBZbWowIk7WbXV68RqHol9oEt
         twC43JabchCkgfR1qZf21hO/8uG5HVt6jy4pd+PHhSJBUaQ8nooOyGn/IQGuVyxLkGjq
         bl0m38fzC4Uc+PPIkz71Dm+iMU72BTDmpRN8RfoX+tasR7S7FMas6u3dEIsF/KcXrE3c
         qKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtR/FIYQNTiCoRFHa82jL/agOImh2Qml25u+IdA7sOjsFsjVq+2M5bc2oFlY9Jlc/PW4x1nbw1Uk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGxk+hPFtKpsC1OTO3kuqHkosA626Zwq+XziX1S4u8gSqfZwct
	5KSxO4MgDv027Lb5XYtO0XeDlLprgX3QZN8axr0S1SPshcIKNBzbGkS7A2niYtLk+nQ=
X-Gm-Gg: ASbGnctJZ+RTPBAParsyAa1PZKnmPkRzlmB8RM15Vju57yrRb1j1Lf1Rg0867GFE6JA
	B/m1LzolEOPGmQfIUw9AJWYvvNEUxt7NYlMEHJZPOMwlOiE/SDKOoFWTr8h/1khXFqWi3P2owMT
	PbSYTa24ug09Z/7mpg+dVHJ0wUtjFLFQdOZe6KYTYT3FrT0wNzBu2P3ooZFnpFq/2qF92kkK0ng
	sPzTqvKafJEWNbEhhDUXvnjZ6+SI+i4T7Jb9KUEhjIZfsWViD+VLJvdX//RkUNm43XbqRLkvZiY
	/wCS9X0xZauRSjis2uvz6SiSEWij9J1Y9jSWxDbgntkmQUpdUrZ/TU6R4RC/DIRKJVwaeeG9Nrd
	crvk4hsx23IPoq7IgTp1q8n6uvF7ol7eQcwzxpWE+gqEd/Ni2ub2O1ncVYcYkq4fiMMzAtH99ir
	1urk/YA8s=
X-Google-Smtp-Source: AGHT+IGK/z3Cbwim35BFhBeNnScGxMkgIhE0uJYbIf9/Fg/K7JQibWEf0vK/ujTiUCQI3LxmFDXXYA==
X-Received: by 2002:a17:902:ce81:b0:288:ea7a:56b5 with SMTP id d9443c01a7336-2902723b882mr207754975ad.15.1760167891936;
        Sat, 11 Oct 2025 00:31:31 -0700 (PDT)
Received: from 5CG3510V44-KVS.bytedance.net ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20f8csm77020515ad.49.2025.10.11.00.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 00:31:31 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: guojinhui.liam@bytedance.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
Date: Sat, 11 Oct 2025 15:30:57 +0800
Message-Id: <20251011073057.2959-2-guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011073057.2959-1-guojinhui.liam@bytedance.com>
References: <20251011073057.2959-1-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

When probing the I2C master, disable SMBus interrupts to prevent
storms caused by broken firmware mis-configuring IC_SMBUS=1; the
handler never services them and a mis-configured SMBUS Master
extend-clock timeout can flood the CPU.

Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
---
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..d1122ff0a1b7 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -78,6 +78,7 @@
 #define DW_IC_TX_ABRT_SOURCE			0x80
 #define DW_IC_ENABLE_STATUS			0x9c
 #define DW_IC_CLR_RESTART_DET			0xa8
+#define DW_IC_SMBUS_INTR_MASK		0xcc
 #define DW_IC_COMP_PARAM_1			0xf4
 #define DW_IC_COMP_VERSION			0xf8
 #define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7a72c28786c..eeb60536da32 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -997,6 +997,11 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+static inline void i2c_dw_disable_smbus_intr(struct dw_i2c_dev *dev)
+{
+	regmap_write(dev->map, DW_IC_SMBUS_INTR_MASK, 0);
+}
+
 int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
@@ -1063,6 +1068,12 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 		return ret;
 
 	__i2c_dw_write_intr_mask(dev, 0);
+	/*
+	 * Mask SMBus interrupts to block storms from broken
+	 * firmware that leaves IC_SMBUS=1; the handler never
+	 * services them.
+	 */
+	i2c_dw_disable_smbus_intr(dev);
 	i2c_dw_release_lock(dev);
 
 	if (!(dev->flags & ACCESS_POLLING)) {
-- 
2.20.1


