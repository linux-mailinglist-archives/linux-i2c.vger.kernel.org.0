Return-Path: <linux-i2c+bounces-13701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE1BF51E5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 09:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C61E352169
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 07:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4809328504F;
	Tue, 21 Oct 2025 07:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IZJ66e39"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4729405
	for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 07:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033456; cv=none; b=VweShFFRP+y7Vl7VKex9CEXjuCeUlB3HPVPmbUVBUU0bC1Pr+rZRTRn5L5u38vDA1KupGjdbnvc6sGi5Koro2LxYQ+LSUzz8WXeQd5/xEHfdW021A9UDoRNjxz+fhYcE82OUAkl4c0Ha27FRgCvj28CxGUXFrvNWRJKhfLYWNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033456; c=relaxed/simple;
	bh=P3qR+t/tTh6PuTIAQwldgAAcW/75ffdD1HUgcaDxE1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rspmLfCQuGbn6woTZ2Lmw/u5ucCgb/iP+eH/ML7YEx3XF3B/homYP/sW0YJxI+WhYGJluJ5a6VzJGEIpO7xMvdfQ0/9Nq/PdxExHIkS2gAmiMCe7S5Y+scDAXYMfIlvvltY0SQfXtF4GcCWDkII2rDlGKLNeGJDErfB9JxIFd9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IZJ66e39; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2909448641eso51205185ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761033453; x=1761638253; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/8SKTykForFBaFYsYGEE5YmDtkAZloMApvI3AJh6uk=;
        b=IZJ66e39sfrpfwnLHcSFALBC1FBM8Mme2r6Pz2ebvJBvy0UwiRP27dHOhMuNIXKpWN
         YVHc15erP4mxqtJ0RfVr9LXWACiNd0bOoIyZOA4rGah+ayJYX94v7K6pXFEGpEWDjRw7
         VvSNorSm/AThtA0Tkbx95fb3umcDyKZsbvaMmSFTAb0geIA2VgQACvNuo7bEO1ZOTmPh
         mahGCv+BJg08O3+2vy45JtKjkSFQLzqpKFwNU5PI0nnwNe//Bz1ARLIgIx518IKnS384
         FoCf/5M4NVO9d3YsH6746VGVIQrJ1OMYqcYgksl/SlM2EX6yLOwqixVziwPChLLxHazl
         1LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033453; x=1761638253;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/8SKTykForFBaFYsYGEE5YmDtkAZloMApvI3AJh6uk=;
        b=RsglYesgAMd3/+ZEjwwqt0h20G3rHVUn+o1P6GDHG98RJihcykVkyVzgyL/rfZuTF2
         lCQCGL3ZBybkjb1f0yITRWCetCwX78eFcrocbVne+2XQyRukpND8Fkoy9HuAqUJMRcmM
         lACFgTHmqC2nJ6OrhDuB6nhISR/GFrkBc/w7eOM881Hb9hVS4z7dilsXhyt3/cSjuwS0
         iWWRxB5I34N7NZF0OgOOuNHCDRPG8ImHSg+j7NK3r9W49Y/39FzCpLo5OVOdsypKlbcq
         jPE7bK+B+wvCiWYdCmYvwwHHYYyRtLWQBoMPmWj2UZMRTNCM4dTYjRrxXyKizzLxk4mt
         h+ww==
X-Forwarded-Encrypted: i=1; AJvYcCVQPE4g4N9zB0qYbT7qV3f1JSwpn0T8oQ3DWZl7XxM8vDB6doYKrVSucP4v8kwp1psnyD7M7XJPp8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc8aLzAVXgkTV/AhtfOJSREC4i9WQ70J3bitv3jfskuaAZJqcj
	pGQbBz8Y8pg6S/LmEgNmebUcwpvC5KvSHOPhA8JSwMLfxSVcwBAuAF1ZGpy4VPdJkXk=
X-Gm-Gg: ASbGncvBPj4ENmidFqRF0NpfzMX77FnBkFdH9+C5oyYlg0eBBnu0/xmQUY8afzy6D8y
	2VZGR+yJT72e3QeQ/ZGurffczlaNNYMZmN+/73VGCJd0lbVi7aNxxfWMDWjgLxFXflYTf23WS1J
	jlc1fQh6+te8jeBRtXTe/EsrB0dM3LlgtHAhYqzMs3M9KjZTZxCLeNKsDk4r/WxiDeWdGI1A8I5
	anbRkdhrwSlG8xa/PrTXpG0j5UJadq5m6BN63tLoxvo5NAZ7ZI0XIKTogQBhgkg7XO25MZJTlK6
	BzvUqYo8shSjiIsz1aUs+Iy7iZQS/UIS9OqJtMcNctJ09mqEr/DVLoM2JkybMlWeN19jI8rzibA
	bI3ofHAu7JkznbFYxRbnecB1S3NMr9OqGlv60nxnVaSFg6/yVYHdzyTLHnmcAcZpu04/jmHxYDK
	SeXDBnYYlJf9zB4o//t225UM4Zs83smcVVhgVE2GArSFE=
X-Google-Smtp-Source: AGHT+IG/nVTMVnkhbwsdclkwA3L+8Ny3RGAmSEl1hR8wYqLDKSXk9+6PDcXVh3sMkjUsx87QqUNoMw==
X-Received: by 2002:a17:903:234d:b0:267:44e6:11d6 with SMTP id d9443c01a7336-290c66d9d55mr194364985ad.6.1761033453473;
        Tue, 21 Oct 2025 00:57:33 -0700 (PDT)
Received: from 5CG3510V44-KVS.bytedance.net ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d7e41sm102083085ad.57.2025.10.21.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 00:57:32 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: guojinhui.liam@bytedance.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
Date: Tue, 21 Oct 2025 15:57:14 +0800
Message-Id: <20251021075714.3712-2-guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251021075714.3712-1-guojinhui.liam@bytedance.com>
References: <20251021075714.3712-1-guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

When probing the I2C master, disable SMBus interrupts to prevent
storms caused by broken firmware mis-configuring IC_SMBUS=1; the
handler never services them and a mis-configured SMBUS Master
extend-clock timeout or SMBUS Slave extend-clock timeout can
flood the CPU.

Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 drivers/i2c/busses/i2c-designware-master.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..436555543c79 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -78,6 +78,7 @@
 #define DW_IC_TX_ABRT_SOURCE			0x80
 #define DW_IC_ENABLE_STATUS			0x9c
 #define DW_IC_CLR_RESTART_DET			0xa8
+#define DW_IC_SMBUS_INTR_MASK			0xcc
 #define DW_IC_COMP_PARAM_1			0xf4
 #define DW_IC_COMP_VERSION			0xf8
 #define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 41e9b5ecad20..45bfca05bb30 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -220,6 +220,13 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 	/* Disable the adapter */
 	__i2c_dw_disable(dev);
 
+	/*
+	 * Mask SMBus interrupts to block storms from broken
+	 * firmware that leaves IC_SMBUS=1; the handler never
+	 * services them.
+	 */
+	regmap_write(dev->map, DW_IC_SMBUS_INTR_MASK, 0);
+
 	/* Write standard speed timing parameters */
 	regmap_write(dev->map, DW_IC_SS_SCL_HCNT, dev->ss_hcnt);
 	regmap_write(dev->map, DW_IC_SS_SCL_LCNT, dev->ss_lcnt);
-- 
2.20.1


