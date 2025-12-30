Return-Path: <linux-i2c+bounces-14882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFBCCEA091
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 16:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 544D6302AE3E
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 15:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E2D3191C2;
	Tue, 30 Dec 2025 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxO24ORH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E54189BB0
	for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767107341; cv=none; b=V0ZnYR+48nn1iz3wz2qjrmk421V2a4KkVgwyyHIsFIFnFYWjvxsdMaC0L/1JZ128Hbn5VSqBASovu8LuMkgGUa2UEIypKj/1DUcdlznIobTyY0+785ehZrt4YoA05gRpw7mtjXvHszU709wTX2a61leUmn0aR2DhSnSMKIFl2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767107341; c=relaxed/simple;
	bh=FJfkRSPlH5B++1U1zhMTRNFqmbjHdSkWFGe9jzml3js=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NQb3anRTnBi6mb+1FU0NDf+tb0OGkvFGis/uUchRE8adxXfB9hgl/9Da9rXvDCZg4sgFR6rlPECaAWLMBwsCESfW+ywauXh0UMqda315wPjvc1gwQ7bpjoSHQVxmjLZxiB1KJVHTGk/hDmkbru4Pnp9kMsaOel4ori2tbPzRuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxO24ORH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0b4320665so153393675ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107339; x=1767712139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PemJfqgrS11N0rN844byXVfn84NqGSNQTH1UI9V6ZpY=;
        b=DxO24ORHy4ag75koE7bTEhHwy7IQWeaGglhUCUd3CdcfWZFx17cTmLYX91/sxv6DAZ
         VlNfx8Dg3yqrYAIbt0jKq1NWIESrvTSJiRn53GiOLnWB+f+9EHO2VF0AjoFeEei8kV5z
         PkuCl4k/BjfcSVkFpHImfmqLGuZ+PnDHnWXnnbsbzmTOJdtAsvaZuYN/gVqrUbLHNvZ4
         1XcpFeLMM/CyacuqBy/K2qJGu7kerpql/gNSlDBkXUn3KhDO/EFSEsAQHIeHN5SAt5lU
         Deha05Z09EO738rZLAv5BkF2h/AMYxyHzKREY2DA+mbwbPIH57KIspmxxzdydxz6Fi5h
         kNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107339; x=1767712139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PemJfqgrS11N0rN844byXVfn84NqGSNQTH1UI9V6ZpY=;
        b=UvfEaiCwR3pdMM1I6y8uwHiC2yXWkUIQuuIgpvcpgWwmYySDwNM4OFSfPo2dYkYKMj
         ObbkNuihWwn8a6v4yCoxM66T0uNa5Mca5fC/jSxj8ISxqmfoWZG6W69FwWpZ5JOqVUQ7
         ZBTBoW1wbmKR8V3VoeJbOZ6iohbMohBQ8OF/1zU3b3GgE7t1nwS7psmmd0lFRoKHM75K
         OMaJcnReEz47C6REhujx9D9bFPj94HcUOHNgbC4V7WzjjjZe+3UYGovSTviKPAgETNIm
         ml2ajaz9ejNULsY7f21ei6omrXszouPMETBtQg5gb7cnx0qoTbDxJq8wNwj03QRZwHZS
         14Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUTRlaADjGpUy7Oj38KxyjoqC7vwPzxmyk8uiCssdZdQBmhT5eolGdTM3RbyY67pKT1PTINyR1wrfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiUV4Jesuqomhne2Oxq94de3fofgwhH0YJ3oP4yKpuXm/EPAb4
	a6bow3c2paB9ps4vzdVyqgyc4FoqiSvef1yWYZnMAM6tI7nUnQTtRNhp
X-Gm-Gg: AY/fxX5YPSgaBpavuGVrKt+uApM78qLurRaDVj4COAKC0YiI1sx8jO8lN3yGlCFYaoH
	gq1ImUl0xvFaBGsVE/ch3WInzY2TZBw799iQXPFt3YM8lZ6qMxLH0QjR49HYJl6KD4LzY9axli0
	WETkOYRRrDVq3PB6jnQRl+TIwSAay9/mjAWBHfwMQ5ndzjGjUoS3FA1V7vnwcoc1c6d2pwHP3br
	5MGUZM4FnhacrICeuqImml7Rzo4ZsH2yDOPYunj14QVXNMCElGmi/eVqgbd1jh3cNCmCxC1jVYC
	xXJ6pry2aYVwibVtDDNX6ZLS5Li2RN9k1tt32FVAtwenh+HVAmkMlyNQSXOVOa5omxh2n3AB3MH
	vHoLVhJIIOOYrdds0qwsOR9lONcEMBcE3hOJPCCDL+fjyxP2MgY7hfSytIUBJnwjWcljDbFihEf
	UMQUMN
X-Google-Smtp-Source: AGHT+IFOqjFWFdi8qdqJlYdi2yUC/4zRYrjnSmKV+0M3gGTfJ9R/5gjkPTHwfTLiXvQhvLLg5PgOkg==
X-Received: by 2002:a17:903:3d05:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a2f2a507bfmr327890665ad.44.1767107338428;
        Tue, 30 Dec 2025 07:08:58 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bc9sm305130385ad.36.2025.12.30.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:08:58 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 2/3] i2c: k1: add reset support
Date: Tue, 30 Dec 2025 23:06:52 +0800
Message-Id: <20251230150653.42097-2-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The K1 I2C controller provides a reset line that needs to be deasserted
before the controller can be accessed.

Add reset support to the driver to ensure the controller starts in the
required state.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..23661c7ddb67 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -534,6 +535,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = pdev->dev.of_node;
 	struct spacemit_i2c_dev *i2c;
+	struct reset_control *rst;
 	int ret;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -578,6 +580,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to acquire deasserted reset\n");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);
-- 
2.25.1


