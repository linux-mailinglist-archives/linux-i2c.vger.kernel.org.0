Return-Path: <linux-i2c+bounces-14054-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2AEC4D8B3
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 12:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 25D534E611A
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 11:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D1F3563CC;
	Tue, 11 Nov 2025 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaAJ8tSh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E033F8C9
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861575; cv=none; b=kD7oKqrTjqvzkpRKdbfat+B8Vb+WhMXR1N0EYFkQ4X94ow2XxQALxwdsukOHLeO/BCAgOEBQSMrZivJRWhJmTY8qyw+7A+FxXT+P0ZDwJlZ3Nqq5bCS9m13yUYfY6Re+u2c5sPYewQ2HIrK9JbRyGdg4xOGzUbmsQrsrnL/hUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861575; c=relaxed/simple;
	bh=Upj1jWoWgtb3YLXDrmSF6/3Py3j5ozE5cNqipSmKtgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYq5voi4uD2XDU1NFGAsb330a5d3kIw1ygaFmwh/lhDsEWqVjImrzg/mpBxRi48aWtLorp2TmZpXz6uMrVHTXD89Ll5XPNwP+3a/PQpi8LrQ/gSKZj32TCiUpEBGypmAuzzbncEGqh54An4tHI688FSw/ReV9npZXpg6lSSjxcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaAJ8tSh; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b72cbc24637so759558366b.0
        for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 03:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762861572; x=1763466372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHsaI+8ssP4NAxyErXWlA7Ff3GUFBJnH0j5EJl5VHgM=;
        b=gaAJ8tShl91Cyr9lvfv8MFAVnMAkhRCFYiuti5eSKDf0DpTmL/i7bdIFi8rXH2j9u5
         um/iQ6HxQdlv1+euAowH5u2g2Kw1AddOmMcUT9ZtzqsSujoBy5k+y9he8+NilO+zyxtH
         osc44ice1kYzLVXdp+T0BO9oPBkYB2GzcuXrHXClnqXxTB/i5zH9wJhnp6O3Z2tVi2Ka
         fQzZoueF81HWZGci1q7/IyFEMeIrThEtefqar9jZJDj0xNI95h0OK4uBL+OlB8C2WKt4
         NGgvyQfPOkh3TPjBVlFWDMjFWl3pZ2nN0beAf2MCeuVkUVhj4X6narc1NdslXCF5DwTr
         JkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861572; x=1763466372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lHsaI+8ssP4NAxyErXWlA7Ff3GUFBJnH0j5EJl5VHgM=;
        b=SxWp8FPGWkwsLQ5+NN1oCGX6llMc2ZgKju5iqdlFEyx4E2pN8geCWTVD/AKit+Bgr/
         xEXE2KpVhApEYiO93Q3N8KB4WMJp9DGRjJgL5FoMfU4xLlSvo4GhAftLbSb5K8ZyGk/c
         /iWi4g3n2CkWZScsabwEEyOAYAPdE1X+JRdL4PSwdbCAfBsgjXor4Fxfe55vebPbcxsW
         VVvJJdY+OERARp0HvlQ04GnZZ66v/C3y70GD28JIXYpTjS3n/02MPPepkeySvwPLdTom
         mAYG5vL4vflqb79LVneMtV74ynd2h1NgfxUgIEFcPvz5Z89QPuWRxg76wKEfafTQlEB2
         3oTA==
X-Forwarded-Encrypted: i=1; AJvYcCVO34pPgKAyAur0n707agebgYku2FljAsbtyqXyrAPt3Txo7QqxxI6PsaLhNqfbLmrWnpGkzSMoWBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzwKA40wnlWhgUmsPgqx6gPCY09eGazEVuV7dnOc6qjjAHNasB
	92wGxcjGB2aUnq6fk7gBc4hzY5W+4BBykMnyeCMxZh4FuVJN+U4/qgH5
X-Gm-Gg: ASbGncsiT5qi1smKpxqGoXy8jG1aAW3+UsdbJF30xSAmajwgFdXIXk0+Qiy5XNcEbz3
	7RONZb+2ukv7SXAEP8riiZuTdjv7x/ThT1pCOALrQaR4fMdoCq9zG3tATNuRXCh+g4p8uUOsS5x
	FEmXYB/YSyCNOcZ9CP4AF3tjW8BLhUO4cp6nH+BexuaaS8pzH12IQy+j3BX68rI+JB+0FFWaT+j
	J2RecQJFHAZF+a6eYIOw6w/WQv1tsQZVo6kkmGeT9tN6cr77/ndh5YaKkQr4VZSTB2eiMkSvAfe
	GPPOy5mR6pcPA/0dk7G+EEMtB4Qd7AG93Mm3A2zZmecSk+SgWqI29Z9sMUbiym5Xyw9pYpcxwKL
	2lSXfh6uPJRTJi5labQYnLOp+s2u96i00LVfj0Fs2ULB2+67FsaXbZpB+0htNAoKzLrkRUkqXsD
	Vq3TUETv/p7mYPPrC1hk7aDx+aIa3O
X-Google-Smtp-Source: AGHT+IEV7fZalGu4772LIAkYKN8AwAJnb1OpT2vlRNHQtmzhU7UOMuLq43dBLQy3Nqdch1TUukA9lA==
X-Received: by 2002:a17:907:86a9:b0:b72:aa52:6034 with SMTP id a640c23a62f3a-b72e033df48mr1243491966b.21.1762861571740;
        Tue, 11 Nov 2025 03:46:11 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72fcde0779sm682374466b.40.2025.11.11.03.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:46:11 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: p.zabel@pengutronix.de
Cc: a.shimko.dev@gmail.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: [PATCH v2 2/3] i2c: designware-platdrv: complete reset control devm conversion
Date: Tue, 11 Nov 2025 14:45:58 +0300
Message-ID: <20251111114559.3188740-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111114559.3188740-1-a.shimko.dev@gmail.com>
References: <e3c2096459bdd0c1d48c00a837cc7f8c18044631.camel@pengutronix.de>
 <20251111114559.3188740-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver still manually calls reset_control_assert() in error paths and
remove function. This creates inconsistent resource management and misses
the benefits of full device-managed approach.

Register devm_add_action_or_reset() callback after acquiring reset control
to handle automatic assertion on probe errors and driver removal. This
eliminates all manual reset_control_assert() calls while maintaining
identical reset behavior through automatic devm resource management.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 34 ++++++++++++---------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c77029e520dc..d334af1d7c6f 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -206,6 +206,13 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
 }
 
+static void dw_i2c_plat_assert_reset(void *data)
+{
+	struct dw_i2c_dev *dev = data;
+
+	reset_control_assert(dev->rst);
+}
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
@@ -240,34 +247,34 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->rst))
 		return PTR_ERR(dev->rst);
 
+	ret = devm_add_action_or_reset(device, dw_i2c_plat_assert_reset, dev);
+	if (ret)
+		return ret;
+
 	ret = i2c_dw_fw_parse_and_configure(dev);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
 	ret = i2c_dw_probe_lock_support(dev);
 	if (ret) {
 		ret = dev_err_probe(device, ret, "failed to probe lock support\n");
-		goto exit_reset;
+		return ret;
 	}
 
 	i2c_dw_configure(dev);
 
 	/* Optional interface clock */
 	dev->pclk = devm_clk_get_optional(device, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		ret = dev_err_probe(device, PTR_ERR(dev->pclk), "failed to acquire pclk\n");
-		goto exit_reset;
-	}
+	if (IS_ERR(dev->pclk))
+		return dev_err_probe(device, PTR_ERR(dev->pclk), "failed to acquire pclk\n");
 
 	dev->clk = devm_clk_get_optional(device, NULL);
-	if (IS_ERR(dev->clk)) {
-		ret = dev_err_probe(device, PTR_ERR(dev->clk), "failed to acquire clock\n");
-		goto exit_reset;
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(device, PTR_ERR(dev->clk), "failed to acquire clock\n");
 
 	ret = i2c_dw_prepare_clk(dev, true);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
 	if (dev->clk) {
 		struct i2c_timings *t = &dev->timings;
@@ -315,8 +322,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 exit_probe:
 	dw_i2c_plat_pm_cleanup(dev);
 	i2c_dw_prepare_clk(dev, false);
-exit_reset:
-	reset_control_assert(dev->rst);
+
 	return ret;
 }
 
@@ -338,8 +344,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	i2c_dw_prepare_clk(dev, false);
 
 	i2c_dw_remove_lock_support(dev);
-
-	reset_control_assert(dev->rst);
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
-- 
2.43.0


