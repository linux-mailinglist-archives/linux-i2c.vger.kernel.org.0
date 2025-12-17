Return-Path: <linux-i2c+bounces-14619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C80EECC6418
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 07:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD9FE3016893
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 06:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210BC30C601;
	Wed, 17 Dec 2025 06:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTsU85Al"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32630C347
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953051; cv=none; b=rUprT4XTsy+7Mme/aQeAuEmtfsThV1NC4Fo5T0qTN7rES1Ev6ewl82EXQPRjG89tEGDGW6r4NsmVA7LAfJ34J3B3kErsk0yNfar2KBtWH2TtKmXrz4gsDAt2QtZCS3WccWQ3zjRwEAS9EDhb4rOYYAkBC6YIRi5e8NNUdBp8Nlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953051; c=relaxed/simple;
	bh=BKCGGkCIogfhhQC9s1I+BRs/zADpJ6Pj0AbDCqFLIDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHtGe2980TsjMl/MPjyx83qD3ghxyGrOPV0xLC/TnApq25dr7FHABGIxAyUNbXTOHOvecTEMymFNfFNJM/dAiAV+Z9CZXi8NyKcBT/KLSzT5qx0igTVFK+k+MwE4PvlXimsHRQvQR87zFyq0oFQTwdvlL1JLnqQQfceVUXSyCHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTsU85Al; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c0bccb8037eso4558101a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 22:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765953047; x=1766557847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylRM1U4MMGRSOvQPR+On5jioG4hsiZTnPVhDoCW0brQ=;
        b=RTsU85AldwnR8QONi1/HlVis+OeWWKVKCbuv/NjVXyVqqFG8caFDJteySYWnjHhDAf
         5evXyYnufLwFJ6b485n8WrFtLzPmtZ58g5qYdeu9Ginj2AThspxeq46QIgrEkLJXeslc
         o2l4WsJZ3LNjLtEFPOfJiD7uOgtXpX9GbAB9idwoGIK1qnFId1YWO85kzo3J6KYY0f55
         plSkAqpzGY0MhtV3+rfjrEVA/oBzXRlJ1VPBLKOzNoiV9eF2VwaS8FwNUFOx304MSRJ4
         qrJrCInOVXbQp281sv9nBdBhoDC6eNgFZFgJcN7bNK7FYUFO+JeUUYnAFKU0iAggNxfd
         ZTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765953047; x=1766557847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ylRM1U4MMGRSOvQPR+On5jioG4hsiZTnPVhDoCW0brQ=;
        b=AJMBrBtl3+1EyFjDBozLQm9xoCDYeN98kUzBDqysvRWmPQ9M78o1GrnPWQxfa72Z0H
         9ZhjvEAInRvtAThL/tU9yK7gk7DfmaMn5plqG/H1xVcSCT64oS1AIf3dluPiWnpxbN+V
         j3LwBNs9vJGBoCULt3vUIKhfbyrIzMWr8POWbkbJ9ut30fAR0dsjz4n7YqQiQjXdYUON
         y+8nTXdMSo1a/vkagK8Sp3shkA421rhTeZzA4DuihCSTt+Snn880V+06qAnaPz/3D90f
         TA8y6pvUisgSENLk4f2eh4zJi++yhZ5MFvfJiKIBFuTCEckCa7WrYOOr5qudQacMQrXy
         pdbQ==
X-Gm-Message-State: AOJu0Yw64d113nXVOnHRO8Z+yCa+azYCxtUqcJck2/pvD2R+rx4Rp7hP
	qA9YIXGYKKk80K85ZwdQFVcASSD+P4TdlSI1bQ4Lc2BtH1QTSY600bKvmGUKpg==
X-Gm-Gg: AY/fxX6Sn3Kf6BUL/YlTlGSvuQUdpyWzqp+bRhMoBWdi0IbroM6+PPzu1hac310hIWA
	oXHr6ElpWJE8pZzV9QBb15zqUmGipJiU+mjYstvCzqVgACuSSCwosaqNMWY5+j0AflkdwoxygXq
	IqyNGAI+okY0mq+oj410m2k7HmmUyULCTdwBo9engOLYrU2UIbIBEqSUghVzucS70h9tCWktxtt
	b8YMRB+tAhHQDeuJjW95P9euE3OkzYypVLvU8FgJGxuPCnhvJuEJBmLQs80ifnlDo++IRvVnkZ5
	dMQ4gHTktJlsMFfn8GscaQDDKpNHQuYxw+LTuMEKo1kDthqD1pPTO5HibgCYzevxsjK0xdOSAX3
	5IoSZXI6GCk18bVYyGTvWNy+SKG9M3x3oEYFcvhQy38Uy6hkoHr9LYaLoloX/+8sWa2FO
X-Google-Smtp-Source: AGHT+IGyHUVtFpcFd5Z73Us+pntiVw+FgIuFO+DpOcQDZYmAx0PzCTgLGReFIW5FKwwkZUuUNChQHQ==
X-Received: by 2002:a05:7301:29ae:b0:2a4:3593:9690 with SMTP id 5a478bee46e88-2ac322251e1mr8419943eec.13.1765953046927;
        Tue, 16 Dec 2025 22:30:46 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::c20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm61585357c88.1.2025.12.16.22.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:30:46 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] i2c: rtl9300: use of instead of fwnode
Date: Tue, 16 Dec 2025 22:30:27 -0800
Message-ID: <20251217063027.37987-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217063027.37987-1-rosenp@gmail.com>
References: <20251217063027.37987-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoids having to use to_of_node and just assign directly. This is an OF
only driver anyway.

Use _scoped for the for each loop to avoid refcount leaks.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index f2aa341a7cdd..672cb978066d 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -371,7 +371,6 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rtl9300_i2c *i2c;
-	struct fwnode_handle *child;
 	const struct rtl9300_i2c_drv_data *drv_data;
 	struct reg_field fields[F_NUM_FIELDS];
 	u32 clock_freq, scl_num, sda_num;
@@ -415,15 +414,15 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	i = 0;
-	device_for_each_child_node(dev, child) {
+	for_each_child_of_node_scoped(dev->of_node, child) {
 		struct rtl9300_i2c_chan *chan = &i2c->chans[i];
 		struct i2c_adapter *adap = &chan->adap;
 
-		ret = fwnode_property_read_u32(child, "reg", &sda_num);
+		ret = of_property_read_u32(child, "reg", &sda_num);
 		if (ret)
 			return ret;
 
-		ret = fwnode_property_read_u32(child, "clock-frequency", &clock_freq);
+		ret = of_property_read_u32(child, "clock-frequency", &clock_freq);
 		if (ret)
 			clock_freq = I2C_MAX_STANDARD_MODE_FREQ;
 
@@ -449,7 +448,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 		adap->retries = 3;
 		adap->dev.parent = dev;
 		i2c_set_adapdata(adap, chan);
-		adap->dev.of_node = to_of_node(child);
+		adap->dev.of_node = child;
 		snprintf(adap->name, sizeof(adap->name), "%s SDA%d\n", dev_name(dev), sda_num);
 		i++;
 
-- 
2.52.0


