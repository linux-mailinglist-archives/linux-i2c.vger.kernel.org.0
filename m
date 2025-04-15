Return-Path: <linux-i2c+bounces-10369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3CEA8A6E3
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA271901CD4
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7AF22128A;
	Tue, 15 Apr 2025 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccEz8pKJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E15D22256C
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742152; cv=none; b=jRk2Ox3GRY7UYj67GMb23T35/2Gb6/AWYDRZpvuiQYJQ1olMPWZGoJBnrGLk0cEl4S2MhGmG4YOe36/2Yj+HeV2TtvhGcPtN2oTTC3J2VWtYlCGxJGv8USBC1G9TrVc9FmEGYAupM/SfTFNpufbZbiKAXoj/Q0tD/wIay/QSi/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742152; c=relaxed/simple;
	bh=zx0r4+m3QUyd9kb8a53p0Hzjlf1MKEWHv7xnICoUcDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aosh+UZvbpXDXuIR5rs+PXX4GlbNPpSQLATLRoFOhWUO8BkfI45gQlClxPh9LHqZWVBtxqviaMk45WAYaPdXvqbY5CyYcMoENOOuxtX6qEjipNF6QdDzccu2jFfuONaQx3KDDtfqwAPvWse68+P88Ccf+uXf9v+crOe4eYKh9p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccEz8pKJ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1104134166b.3
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742149; x=1745346949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loMTrZDHzmCOUyxOFOgREZ3HVqSK503Bi09wuZfwXGo=;
        b=ccEz8pKJjgr+QXnm/aG9QQCOjtoVEa7WJ7JCqyeXgF7+6vr8osIC0ITeEB/DjzcC8t
         vRpPMkhvJ9zcAPinomS0uw9NPdsIV2I7Vs0KL2sEWvuNy7yjsYHjHT4ObD/mbSsgUWqj
         bwMZWfTzMMimfktQ1ShUdIaDBuodZlnKL9iS58aztZ26Pl7SMJQeS+C2pCnjXFXoO1kK
         4n54MSUKbmiD6NLH6bmx59x6Qn1pidLm0YbBLxV7ZDJI2MbNmw5TzHXV9437+yxNpsrL
         xhkQFtOsfDNo0Cgy8Mv+/WIR/Fyvx/K8OZH01uaHkuwAOBeCel7nEhIUrwPLK1juoEKg
         kpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742149; x=1745346949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loMTrZDHzmCOUyxOFOgREZ3HVqSK503Bi09wuZfwXGo=;
        b=rawv83M8rs9GXAUR3jvbVib0pk9Wu54ylzedZ90KoanCjvaZcgPboMDg4hVtfUXa6Z
         cZlfGSy749PWfksRHFv4oN9OlZbGgj4GMKkmCD2F6bVj1XvBce90XxZKn87H8hedv7y0
         OzgckLWrc1flAUKlhfBMIPPkAbj/Jq5ERKgDdbFUpINzCuE/SgZKeqoCRwYGWkFz21L5
         26kEX1lzxyrzBmE9YHO5Y2HqbhSsjlBdVAYlk+xZ3hIitVu1rOx4qqxag2kxjzzc8kSQ
         /rEdAvZFpGh7aoZszRw4LJOThKhINdx7RMshw2QZM1j0MpIEX4NdkQqqY0aL2tYCOFyx
         iUAg==
X-Gm-Message-State: AOJu0YwstiCPa89Gle6LyGGaf4htwA3jxvjAZPHwJVX5O1iiCPRpo8vb
	oP9TJxnFP+VReyFX4T5HHH57w1JF7AK1kx77Ae0J5lP2JcWVdOsOP/CWB7g6EKs=
X-Gm-Gg: ASbGnctjOPZcvUInWgL2Lql4zK5almFnVO7OasqAKtqhxb2aXeiIP3i1BiAP7o7qdoR
	UqA6Ip3UDkQBrkNuNYIyxxqNh2LFOgFtzPHtEkgdTbOEQyUhvEBLLex419AeW7zeiEZHX2o0tFT
	6jVGly+6MMjlrqtKKYxV362HYgwDv21PFgt8rkrdu3j4AhL16v/QGfqDoPz+MaQfGaZjt91puVF
	Z5Y6Ff4rUdqnYaOt7SafE7aTbc+2nT+dUUHoMxjWEnwCgulNv26XvWuNptBcGxr/OhbBEHNWyKn
	aEQFMk+aD1jAwRUy+DzFNokkALPxpXfEYG5Bw3K5tSsnpRhux6hfI3VcYDxzTAT1HsRst7I=
X-Google-Smtp-Source: AGHT+IEpiHL9WpvnEaKhVzpBQQDAFm4zv+R+fr356rT/rttzS3KXsLt6OA6vwvmRhxZOZ4EqcfXnuA==
X-Received: by 2002:a17:907:7203:b0:ac7:81bd:60e3 with SMTP id a640c23a62f3a-acb382b8d8fmr10018366b.27.1744742148873;
        Tue, 15 Apr 2025 11:35:48 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:48 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 05/10] i2c: viapro: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:42 +0200
Message-ID: <20250415183447.396277-6-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415183447.396277-1-e.zanda1@gmail.com>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-viapro.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
index 2cc7bba3b8bf..c58843609107 100644
--- a/drivers/i2c/busses/i2c-viapro.c
+++ b/drivers/i2c/busses/i2c-viapro.c
@@ -330,30 +330,27 @@ static int vt596_probe(struct pci_dev *pdev,
 			SMBHSTCFG = 0x84;
 		} else {
 			/* no matches at all */
-			dev_err(&pdev->dev, "Cannot configure "
-				"SMBus I/O Base address\n");
-			return -ENODEV;
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Cannot configure "
+					     "SMBus I/O Base address\n");
 		}
 	}
 
 	vt596_smba &= 0xfff0;
-	if (vt596_smba == 0) {
-		dev_err(&pdev->dev, "SMBus base address "
-			"uninitialized - upgrade BIOS or use "
-			"force_addr=0xaddr\n");
-		return -ENODEV;
-	}
+	if (vt596_smba == 0)
+		return dev_err_probe(&pdev->dev, -ENODEV, "SMBus base address "
+				     "uninitialized - upgrade BIOS or use "
+				     "force_addr=0xaddr\n");
 
 found:
 	error = acpi_check_region(vt596_smba, 8, vt596_driver.name);
 	if (error)
 		return -ENODEV;
 
-	if (!request_region(vt596_smba, 8, vt596_driver.name)) {
-		dev_err(&pdev->dev, "SMBus region 0x%x already in use!\n",
-			vt596_smba);
-		return -ENODEV;
-	}
+	if (!request_region(vt596_smba, 8, vt596_driver.name))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "SMBus region 0x%x already in use!\n",
+				     vt596_smba);
 
 	pci_read_config_byte(pdev, SMBHSTCFG, &temp);
 	/* If force_addr is set, we program the new address here. Just to make
@@ -375,10 +372,10 @@ static int vt596_probe(struct pci_dev *pdev,
 			pci_write_config_byte(pdev, SMBHSTCFG, temp | 0x01);
 			dev_info(&pdev->dev, "Enabling SMBus device\n");
 		} else {
-			dev_err(&pdev->dev, "SMBUS: Error: Host SMBus "
-				"controller not enabled! - upgrade BIOS or "
-				"use force=1\n");
-			error = -ENODEV;
+			error = dev_err_probe(&pdev->dev, -ENODEV,
+					      "SMBUS: Error: Host SMBus "
+					      "controller not enabled! - "
+					      "upgrade BIOS or use force=1\n");
 			goto release_region;
 		}
 	}
-- 
2.43.0


