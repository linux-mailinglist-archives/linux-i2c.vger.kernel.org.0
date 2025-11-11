Return-Path: <linux-i2c+bounces-14057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C2C4E507
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 15:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6711898AA2
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 14:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B59A312836;
	Tue, 11 Nov 2025 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiVVR6Ni"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E231195A
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762870208; cv=none; b=PWAlhjDiZ6PMAeDzmWmFWW7UheIg69/v6llK1YWtZdY7E1CFJu/TNTNyHCbon2OuJo3yzbN338mmGUJJIRd2hdPzBFSZE0kyeaPBBBb2Ubin16eJ0JBAmgANHghKfYvvgsUFaRx79w6gQLH9XNCK0n+nr1QHaVEglAYEkTJ0Hys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762870208; c=relaxed/simple;
	bh=ouh72W58KiwNlpesfMOQFSgweAyrI6k/34yunDXjpII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFNly+1hVUq2NVC770Fz/NHIwO6eBMX6Qw/Mk4qlNWJQkkNDXPdqdihQ4DfG6LE08/CVHJSmhWBBJDIClX+x/TL4ZB5KCw2s57yV3woph72g9YLxYY0OegvsHp8SL24LzCfvFk10jSItJgZ+0GlihKud+L9NIv3Ng7RdfZfWdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiVVR6Ni; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b72e43405e2so139754366b.0
        for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762870205; x=1763475005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USYXM+dOLZTaPjQiHxQ3ZivF8pu2dJ5XZL+Nnq41VfE=;
        b=GiVVR6Ni8U3JZwpxwTUiPONjjZej2dYxJj10foNWqvca8EzY+UNR/q012CyYPQb6/+
         JjkLLRAlKgm3NrC8vO4EJ1k3IuVetv547pbXE0y5ZaYsX3Lwap8B9fInsRiVAednZfx9
         dDRe0T3LuiqiXAyibqk6InsRf79P6qM7XDx7QEET8qxXXfVm9sVpdB81UhqFIxuj5aan
         AXfxhcy4UwrBUTOSEFzd4yE1UOsHjHz6kUucWj2scOl64TWvTnqLaM3+vOHxk7lPBiui
         NeGPb0AWS+Y67G+YfFFACsvO4fHVw+utwXjWl9KjU64yxVgOZezPwMvD5B4EEz8qMJqX
         9s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762870205; x=1763475005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=USYXM+dOLZTaPjQiHxQ3ZivF8pu2dJ5XZL+Nnq41VfE=;
        b=CgMwCs6tWU+C9u+XJzLf1snOd49m3b/H4HtjJ3dR4eFfkIaGMj0jDHjIIb5X1oa+cy
         bL4we9DQBpxdbSw+Ssh3FBSPFYK1Kpf/gRStTXbIvcyDLkdXeu9UU5O0CZbedDlN+hYt
         7RMokW+5ZRnP+oHCVwj15TwZ7WdbL2FtFe+q8KeRATyzuAFk9Xa1lMGRNgwM/vgIrder
         /WWlxMal70vHUGO0NZ1kM0jpc90e/GUnaAFC3EKDozVuT/5GJpHKH2mkwZ+LZSQzK5Ec
         jRdnE4yih0aOpm08HRef8vEqsttzR+0kwPzlVMIerh67qQyeJLj5eoeg7uTLuHxv4G6J
         ItHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzp6tj442qUSyNobfJ7SB5cP3XsMbdDD6ff4nRIBcAuFfrJN3qaIgE1mFXZ0qLpvInFOszSTkwqMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOg5oHkPrxMRJ/8Jl9Vkxv+8k7o9+scKsLaIA6hCnso9d5vIG3
	dPfQP1cWWCnrUSa1kS1o7yn359GBVQ1W3bfbcJiszSQW0nQ4T5SdRHOM
X-Gm-Gg: ASbGncvnqRDjlhgClTjp6oQ61GytFyQ6kygvwoB7zbgiatSa48ctDY6VQHfccXncuZ+
	d62q4vyeWyJjJqLINdzH/jrNzLC+nNr/V2KDG4OcEQ7/BUDUjJma3sbg7otYP9yCeso0YzpKGhd
	ZHvIsNbJfaGM0pNbiGHdYhY02CtHvt+yCOV8T2VbjMSw0ue2gvj/CXBvzoVz/DJS6DSRR707bUu
	krKvZqkB9O6L8bE7L52W4t6ltVNQ22bP0mWHhW7AEzeQCahtyZYuVVC4KfBY8LR2uihgibW0EMK
	TTkCyjBUogNSRvBPs6q1VSljzmZU2EC5ZiRjzCQ3lt/cXm+bgWW0gtRg+aFNWuVsJO9G/CbsRRR
	f+486CH/CEyrUiNDQqFmrL66hiHBKnmJwnmBKK8J81fWBFSVfbi+RO5V3gXpMQitURAhS27VS8R
	dDZqdt4HrhnaTQzs0owkYZUYNgEVbm
X-Google-Smtp-Source: AGHT+IE4Ll5LBW5RyM+1WOlvKK8/cmC1dWwMG6ilEAqO+kILXAiC0NhdUUmMqUqe5WbFAmaU33RbYQ==
X-Received: by 2002:a17:907:944b:b0:b71:d742:5148 with SMTP id a640c23a62f3a-b731d5925f7mr409972766b.31.1762870204419;
        Tue, 11 Nov 2025 06:10:04 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcea51sm1343928266b.4.2025.11.11.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:10:03 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: p.zabel@pengutronix.de
Cc: a.shimko.dev@gmail.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: [PATCH v3] i2c: designware-platdrv: simplify reset control and error handling
Date: Tue, 11 Nov 2025 17:09:35 +0300
Message-ID: <20251111140935.3220840-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3c3ece1a00c6e39d865c231e27508bdde0783070.camel@pengutronix.de>
References: <3c3ece1a00c6e39d865c231e27508bdde0783070.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current reset control management uses manual deassertion and assertion
calls with goto-based error handling, which complicates the code and misses
the benefits of full device-managed resource handling.

Convert to devm_reset_control_get_optional_exclusive_deasserted() combined
with devm_add_action_or_reset() to automate reset control lifecycle. This
eliminates all manual reset_control_deassert() and reset_control_assert()
calls while maintaining the same reset behavior.

As part of this cleanup, streamline the error handling by removing goto
exit_reset and goto exit_probe labels, using direct returns with
dev_err_probe() for cleaner and more linear code flow.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---

Thank you.

Done

--
Regards
Artem

v3:
  * Squash all reset control and error handling changes into single patch

 drivers/i2c/busses/i2c-designware-platdrv.c | 52 ++++++++++-----------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 34d881572351..ab15a924dad5 100644
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
@@ -236,40 +243,36 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev->rst = devm_reset_control_get_optional_exclusive(device, NULL);
+	dev->rst = devm_reset_control_get_optional_exclusive_deasserted(device, NULL);
 	if (IS_ERR(dev->rst))
-		return dev_err_probe(device, PTR_ERR(dev->rst), "failed to acquire reset\n");
+		return PTR_ERR(dev->rst);
 
-	reset_control_deassert(dev->rst);
+	ret = devm_add_action_or_reset(device, dw_i2c_plat_assert_reset, dev);
+	if (ret)
+		return ret;
 
 	ret = i2c_dw_fw_parse_and_configure(dev);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
 	ret = i2c_dw_probe_lock_support(dev);
-	if (ret) {
-		ret = dev_err_probe(device, ret, "failed to probe lock support\n");
-		goto exit_reset;
-	}
+	if (ret)
+		return dev_err_probe(device, ret, "failed to probe lock support\n");
 
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
@@ -309,16 +312,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	pm_runtime_enable(device);
 
 	ret = i2c_dw_probe(dev);
-	if (ret)
-		goto exit_probe;
-
-	return ret;
+	if (ret) {
+		dw_i2c_plat_pm_cleanup(dev);
+		i2c_dw_prepare_clk(dev, false);
+	}
 
-exit_probe:
-	dw_i2c_plat_pm_cleanup(dev);
-	i2c_dw_prepare_clk(dev, false);
-exit_reset:
-	reset_control_assert(dev->rst);
 	return ret;
 }
 
@@ -340,8 +338,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	i2c_dw_prepare_clk(dev, false);
 
 	i2c_dw_remove_lock_support(dev);
-
-	reset_control_assert(dev->rst);
 }
 
 static const struct of_device_id dw_i2c_of_match[] = {
-- 
2.43.0


