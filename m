Return-Path: <linux-i2c+bounces-12771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A37B48CB6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 14:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E793A6721
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 12:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17792DE71C;
	Mon,  8 Sep 2025 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkcxRvRa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2C1EE7B9;
	Mon,  8 Sep 2025 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757332806; cv=none; b=X2ds/69pPnt/TNa3wUdc0tezWnQR/0Az9c86Y302hGUST1YvYW+CMWssZBlOAxm1XCSS0onhd6PJwIgZIWQ1xgWZOdSVlRAFE4OaAMb/U8qDzD1YfS8Rc6JyNychEL8pGTUTFukMpYOX4bheqIseYSf9ksf3SO3AjEv/eLzmg90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757332806; c=relaxed/simple;
	bh=SzYYI51NtNSDSKgGLENA16UfPn3ddWSPdfcuN10MGgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xxd66CToRTRS2HdqZErBgR2lb0o4TxW8iPevqnNhl3k9HDwE64ClNedoTk09niVLgMpKsx4Bo/mQxe4+0/o/L3MVgfr0vuokF9De7tzMDrf7gEvo2h+5Hx+AgitAnYDcYiij+Q16y7U3m0HqAqJ8kcBpGJ7fX3mTvdnlHo0uy4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkcxRvRa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so4217581e87.2;
        Mon, 08 Sep 2025 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757332803; x=1757937603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUop7F0bMoj9b9OVpy7vFgynTr3W+ER4wqNAl4R64lE=;
        b=mkcxRvRauAXa6pLf93XpWWdQ9yoGKs/qXqg7Cz9JuyhdtXqPXBzSMQzyVOl+Twg7Yv
         +PN97J1PkaW6svGmoEi4rcW124DNyKSJpUXGf471WWFU1gUwjUD8QrGpeD5gRIoYmIhV
         OLXBS8B3+olWj9EO4eUv5K/aRkSvLZvzkLVfnhfId/glxtIUE+mm9GZU2GlGo0gDWDK8
         eWuoyypqZD72zyZr2AVT8rhPwOFR/d6tmkIzYIMyHuhp+rJznW2OgHUQ9O9pk2lIBO9y
         tB1ZG6c6ZWpRLDPBaORD3+1oJ8l+AEDfG3dnkQYQ4zDjRbnAgRwc0yx2OR/u2VtqjLOv
         7PEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757332803; x=1757937603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUop7F0bMoj9b9OVpy7vFgynTr3W+ER4wqNAl4R64lE=;
        b=s74AGyi9bXfPq9HkkQmkdj44tLjVYj5ZlXYVAcEXC0sOJnwZHqd0T9hi9/BVtsa+xc
         +j6jNbfDRSwrFtwIJVTTtHnUWdYq02drJ06Mr24WcG0N2VNXCSfqoD+0B1a7lIBPLuN6
         7ciGfAxnjE8HQoTFR/H1nnDr5iVDcy5aGSFJcU0Ec0vVpSJNR9CEdcCuavJsWGGeGZcD
         QLOLhmFdabZwOfcUBZgAXsHU5NYIaCRkf8R0YABb3chq4uXJOt+0Q7c2vK4mEeHGDRtk
         DH6NrdeIIPrta07DwLFWHSqagORvfOpyr5XsoNddYRoIuELBbuTCc4FfwKPFM5kz9b+Z
         lo3g==
X-Forwarded-Encrypted: i=1; AJvYcCUxuC5QsfgHDodl0t4S5lk1MOvPS+xYcFsUjiCPZzwTNfcMDR2CGd/SxHDrvXNpj/zrHTL3kDUvezE=@vger.kernel.org, AJvYcCVfUtW2z/SIgejcR5Ws6uJQVYG+xIlOzuHOo2nE/l4CNUQUmhNK/VqMUl5iz0JHSU1DYMo+Aq8PWKHDO4lT@vger.kernel.org
X-Gm-Message-State: AOJu0YyZuo2FRup+2epzDUaf8ci5d3q7L1RaNVSeOeUcPDrfFkIfNmqE
	6KTpErxqHrQ37Nf05RvCJAP78So7LnCbCWfhnBbsJHHZGgsFqyvwZ6Az
X-Gm-Gg: ASbGncsU35aY/5HMls6j3votumcrhyysP6DBQW4p7xZv+v3J4T5FFSiu//+j1PDFKxn
	GAfRePtjDkK6oUqKVsdHgYdfP1+xcBECh98MS+nWTq7TQHxw1+nV1CQ76m6zYqfblQplUzbu5Jl
	pFAgDBYTuEZpmuAg9L8op2po9HnWNmPqTpzHbbXDveU+UCpg1H4cUKKyOdvSYnzfSSZnMxHCiUp
	7oOhO90c9rh1iibHLuMveSPGNIYExZOUxQKhE+Y57nNDlnYI3mWmyeFyB4OhHKZnodhwHvaMOtN
	XRCTgB6dyCvzwFE3OV9OWJ9gDoOMeFK9vlJjfVj6QZ5PX3Hvk/CKQ0qPZBxhzUGCIjeiBI0EkRU
	JI7OCFI5o/sNuil6VTK6faLvUR2AYrLWr1sgmuMR3rE/v71/L2A==
X-Google-Smtp-Source: AGHT+IF05PZlzmuS2htCq0a7S4zdiPWvZGgxKc3nDZhxv9mtEDSZXgyXKjQsx5nsb0lppz5ovt7OTg==
X-Received: by 2002:a05:6512:61c1:20b0:563:d896:2cec with SMTP id 2adb3069b0e04-563d8962f7emr1613711e87.3.1757332802707;
        Mon, 08 Sep 2025 05:00:02 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.77])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad104ccsm3488955e87.113.2025.09.08.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:00:02 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: 
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] i2c: amd-mp2-pci: Simplify PM code using DEFINE_RUNTIME_DEV_PM_OPS
Date: Mon,  8 Sep 2025 14:59:36 +0300
Message-ID: <20250908115942.752356-2-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908115942.752356-1-artyom.shimko@gmail.com>
References: <202509070541.ilqlMkml-lkp@intel.com>
 <20250908115942.752356-1-artyom.shimko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the power management code by:
1. Removing the redundant #ifdef CONFIG_PM guards as the
   DEFINE_RUNTIME_DEV_PM_OPS() macro already handles PM_SLEEP
   dependencies automatically.
2. Replacing UNIVERSAL_DEV_PM_OPS with DEFINE_RUNTIME_DEV_PM_OPS()
   which is more appropriate for runtime power management.
3. Using pm_sleep_ptr() for the driver's pm_ops to allow the compiler
   to eliminate unused code when CONFIG_PM_SLEEP is disabled.

This change reduces preprocessor conditional complexity and ensures
better code elimination for non-PM configurations.

Signed-off-by: Artem Shimko <artyom.shimko@gmail.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c  | 8 ++------
 drivers/i2c/busses/i2c-amd-mp2-plat.c | 4 ----
 drivers/i2c/busses/i2c-amd-mp2.h      | 2 --
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index ef7370d3dbea..8f148c4d641f 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -379,7 +379,6 @@ static void amd_mp2_pci_remove(struct pci_dev *pci_dev)
 	amd_mp2_clear_reg(privdata);
 }
 
-#ifdef CONFIG_PM
 static int amd_mp2_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -431,9 +430,8 @@ static int amd_mp2_pci_resume(struct device *dev)
 	return ret;
 }
 
-static UNIVERSAL_DEV_PM_OPS(amd_mp2_pci_pm_ops, amd_mp2_pci_suspend,
+static DEFINE_RUNTIME_DEV_PM_OPS(amd_mp2_pci_pm_ops, amd_mp2_pci_suspend,
 			    amd_mp2_pci_resume, NULL);
-#endif /* CONFIG_PM */
 
 static const struct pci_device_id amd_mp2_pci_tbl[] = {
 	{PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2)},
@@ -446,11 +444,9 @@ static struct pci_driver amd_mp2_pci_driver = {
 	.id_table	= amd_mp2_pci_tbl,
 	.probe		= amd_mp2_pci_probe,
 	.remove		= amd_mp2_pci_remove,
-#ifdef CONFIG_PM
 	.driver = {
-		.pm	= &amd_mp2_pci_pm_ops,
+		.pm	= pm_sleep_ptr(&amd_mp2_pci_pm_ops),
 	},
-#endif
 };
 module_pci_driver(amd_mp2_pci_driver);
 
diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 188e24cc4d35..430d01824a0d 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -183,7 +183,6 @@ static const struct i2c_algorithm i2c_amd_algorithm = {
 	.functionality = i2c_amd_func,
 };
 
-#ifdef CONFIG_PM
 static int i2c_amd_suspend(struct amd_i2c_common *i2c_common)
 {
 	struct amd_i2c_dev *i2c_dev = amd_i2c_dev_common(i2c_common);
@@ -198,7 +197,6 @@ static int i2c_amd_resume(struct amd_i2c_common *i2c_common)
 
 	return i2c_amd_enable_set(i2c_dev, true);
 }
-#endif
 
 static const u32 supported_speeds[] = {
 	I2C_MAX_HIGH_SPEED_MODE_FREQ,
@@ -276,10 +274,8 @@ static int i2c_amd_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2c_dev);
 
 	i2c_dev->common.cmd_completion = &i2c_amd_cmd_completion;
-#ifdef CONFIG_PM
 	i2c_dev->common.suspend = &i2c_amd_suspend;
 	i2c_dev->common.resume = &i2c_amd_resume;
-#endif
 
 	/* Register the adapter */
 	amd_mp2_pm_runtime_get(mp2_dev);
diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
index 018a42de8b1e..40f3cdcc60aa 100644
--- a/drivers/i2c/busses/i2c-amd-mp2.h
+++ b/drivers/i2c/busses/i2c-amd-mp2.h
@@ -160,10 +160,8 @@ struct amd_i2c_common {
 	enum speed_enum i2c_speed;
 	u8 *dma_buf;
 	dma_addr_t dma_addr;
-#ifdef CONFIG_PM
 	int (*suspend)(struct amd_i2c_common *i2c_common);
 	int (*resume)(struct amd_i2c_common *i2c_common);
-#endif /* CONFIG_PM */
 };
 
 /**
-- 
2.43.0


