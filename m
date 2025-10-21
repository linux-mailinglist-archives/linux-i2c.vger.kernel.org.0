Return-Path: <linux-i2c+bounces-13696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE01BF4F11
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 09:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDDFB421927
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 07:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C8D27A91F;
	Tue, 21 Oct 2025 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fdJ3V0jq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552727B355
	for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761031514; cv=none; b=M1EDRO+Q9qeQXZMCBp7mD4w6Z1pvCpjD8hcDYwU1X2pilo96WIykAp4wmPs/g/N105lGDkhMS3a9ds7JhSKHF7jKW1ikkuX0V9aXzy1TEy09e1lOM/H60Z/1fNKpsaYH+6e2/iXaZAC2BgjZZVv1nRo9bvNqTWrSJuZhdDQz3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761031514; c=relaxed/simple;
	bh=v5W+PezWFbbY+aMfAZycePfJ6MzFRg1UFID2DsbQ5es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=aCirCZSZmYbzDc3b0mKHORDIFwA4ljRpqEs4rEKJQd3PKY0tGdJ64acF7V4CoKZvKpwbyl7SeQoCOi697lbhDD+FQdRHrRwKr+G/RJ6obiTzXy9H8kGtOu4myHUZogXIGbXSNYRFxdDz8T9Jqya0iEtot5FcyrWMPTgLR8EPe3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fdJ3V0jq; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-793021f348fso4682062b3a.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761031511; x=1761636311; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KHwcQhcWUU+WNkFzfBnvB75wkIBZwj0q3GSBNggcMeY=;
        b=fdJ3V0jq0zG8ummy0RcvkPYxbIcJsY47gAkxOF3sViDqjochYV9/7VF8PuF75AnDcJ
         DSvRxfA7qv74RktqPlE7G2jXIdmXiy8ac1X9vELkx5Qk0CrXx2RWnLSOv/lzHRUtJajW
         ekpkm4GHiKEQxntj4w1kEDVCi6zCQRmR93cA/RAsl5uo2yh2z3aYYRRvOeqNlYPJaLvE
         iNj6HK9hcq5/84xoNdd2LJqlvmvLbIm6RD5c3brb9Yn1ptk3LH7tmGPv5rpCqwnjM6sz
         ezOiewji3pqV1NlZYFRXs7u097061H3TIabxl34YMkGANUvj/4zmOB/whiEGNcql00uS
         DJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761031511; x=1761636311;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHwcQhcWUU+WNkFzfBnvB75wkIBZwj0q3GSBNggcMeY=;
        b=QZzTxU/VA+LwRDv11AC4M1Qy7L20I/DcYuDmHzPL3BW6Bb6RApeNNaYeIdm5hCWoTt
         mtTvh1HfYapEUKzbG64vFh5VTHL1sLuV6i9QkH9EqUg5eRP1bQuoO2GXT1vF22VHj4iR
         Cjgl2vWVx0lhxNj0d5pQc5SveSntUravFXTLrUj0dsbwZPuuVVLuhxfeHXlSZqmvskKj
         CbXjNNtHse/qVCSbw8GBhU6s8PwWccQbM0/ru1PQTK38gVnHTSFgrUUdxmS0WufHDs3x
         TDxgFJoZT3EOWcCu+5o7BpuBMekc0s0fn/Vcoqma45fBtUg/aNqCRKc5105PpA3K536i
         RFgw==
X-Forwarded-Encrypted: i=1; AJvYcCU0iBeqs4jXkzdyhU41xE+9NsMMS0Fh0xQGdxyhK/OJIwK25ZgSRdqSI/h3GCKHKg/V9tio089QQEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPlMZ0yFYh0hi/d6yAPHXpNfiMoVEzb9vgQUFNT96SGmDYjHIE
	k0hmpEtElrl7dI0sOwxIjQz0aUOHfP4lGkcu+VV1+e8OCF0hVxTuqiKrSXkpQ/b4BGI=
X-Gm-Gg: ASbGncuIO/ariZzQqPmewEQrXxisxwGsE2tMqnRs3xD8VxISGYGCAoVd3pDCHhI4vHq
	E1VBfDgGkD6sACUll8t27yK+S2onMdwVjnK1T7aRlOctdpY+QaC5BIaekVpWKke+qZV4b0Ob6tP
	ASUI484FLcQfleBAaxG/afljBSPvUZVlGEe04UT6qRWchARWCzawlgnIea7ERfPPSVLRp5b3Tfz
	gWAmZtz1tcfaZ+gvRkbRYLv6UvNTYDab9+Zw85xO/GqytbnoiW+EVpRvbmpIXENwV0fOf6m+E3t
	TEa/Lr8uP123JP0vj8f+kDnwSkuTPpAYmFxkJpp3PqGK6bUlUgigjrGVBif/zjZm+QG85hfJDq2
	1RD11jIvz4zRy2ltvioXrOqRrW/zVtOztaDTYoxYlkMWyN+KhdeUp/vccR9b8oyiTZ56xzqfUlS
	8ulwtEB51PhtBzAjL4CTiEAWqaY8TU3klpv6O35oPym/Zs
X-Google-Smtp-Source: AGHT+IEW3GUucNZit6WqpuapaCOEs9zkg77zT4fdoVitcC49LMohym9Orsu/D9cJjo6dGJXKnxnQ7Q==
X-Received: by 2002:a17:902:eccb:b0:276:842a:f9a7 with SMTP id d9443c01a7336-290cba4db6emr221777225ad.57.1761031511240;
        Tue, 21 Oct 2025 00:25:11 -0700 (PDT)
Received: from 5CG3510V44-KVS.bytedance.net ([203.208.189.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fdbe35sm100207415ad.46.2025.10.21.00.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 00:25:10 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: guojinhui.liam@bytedance.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
Date: Tue, 21 Oct 2025 15:24:31 +0800
Message-Id: <20251021072431.3427-2-guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251021072431.3427-1-guojinhui.liam@bytedance.com>
References: <20251021072431.3427-1-guojinhui.liam@bytedance.com>
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


