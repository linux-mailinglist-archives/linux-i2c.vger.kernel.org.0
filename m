Return-Path: <linux-i2c+bounces-14055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6DC4D886
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 12:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F49E4FDE33
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 11:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE58357A31;
	Tue, 11 Nov 2025 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dc7G/FQr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891BB3570A9
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861578; cv=none; b=l3IF16knXnv0h+OCqlDa0Q4YqO+OGYH4EjsqzbV7w6OvFw9ij6RTzuPHgzKAX/QFl4hgNtEsHxzoE9ixHGJkVuQD6/Zmvw6fjqtn2GuvQlQhEs2ZsXvcrg85IculfhgtDWlewxfnDW8niM7RxLal3RCDpyrvZbCupixm4mE2bF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861578; c=relaxed/simple;
	bh=SbEoUjzRdYSzRtrur4zv59kSlcqgvNU4/0/HoJXMLTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brlzZD9c//n2MdkR7knwww4Rk7okjbsSrbWRHxO/XpnQyHA3Fp1b2AOpvQUYNWjkCpMQDsd864NSxq80VwCxIqsHRfbvDWNu+uPRTcrGgemBruz14DOz2yzohQag6x6kMttSMj5RWrXq/d4fiRiuZUqJgJevL0uo//eRD8GTE+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dc7G/FQr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so768395966b.0
        for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 03:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762861575; x=1763466375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5I7f4jaWq/Be7PYF2soJzUGXwHm93DFveuU61+E2QA=;
        b=dc7G/FQrlwISc3SsEHdZjJ1I/rw6N06+XoF0gXa+624Ca6aK1JJd/iDRAxbAlXJLHS
         NOpa+MiqoJa/lXzxKlxEQVEG0htOUcufVXbsbOdOzWgdmDEVQx3EylMqanEGSolbf1BA
         YV9D+PKWsEaXzj2aKdQXVcCJ5FYUvJh8HPx8li7Ys+a9HK4Juvvs5+8J8XDLNIvS2RXr
         +lO5hO1b/dWM04V+VGwcpfJaBcI1ok0AdfOCIVCwq2/u4E6xniy9uGbcYep7R4G7DDXw
         JK9ug/lJsI9QUSM4Ceui9HIj/Vtc1oG1zn/wxETf03VBepk7vzv//JxRn/n22hhxFpUR
         G2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861575; x=1763466375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5I7f4jaWq/Be7PYF2soJzUGXwHm93DFveuU61+E2QA=;
        b=ZG5nL5gmQRC0RXSmMX9w4QJZ9ZijejFo+CEEtWOv9xHTfs3DW0yVcvawd2PfKJ/IPp
         6YLpQnIu/D3BZhzZ9IVLKa59MxY2BLmSFVI+E55SoMj+IYdvPLo0tpojAjEbefrMUEiK
         bOEQFqVZuZz1IOuI7oZp/hMtPkOgC9rBf32378pMRd5vYe3Lzwtk5iEFCpRdvnvdZjPS
         XjnxGsjWIhusebQHpJrcqHeaGoA0bKzR2/qHgOoVMaN99OYZvYVjX2QWdNT+lVs8QNtO
         1vmmE86KiKKos6Bs2dLAeeMxxyqNIwzxM2Cp2LnPDIUHrpQFXJxA0zFJ2vUB0ab2oDZi
         6q5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvHZP1xqb0qXUUkPhz3cs1Dlki7ecErkrRZPR+lviLZGUu4Zrit52GoKaJQoNXPAM7OnnUawoFjug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gREwXUfQW1L+gOKOYM7/Xip636fdOUtCkB1Bc5Bbk9bHkZwt
	YGMsFYg+0supGead0+cAxJu4uwukR9swqy7I9dEcWZvnVDSVSVn+ziBM
X-Gm-Gg: ASbGncvt2w879mMp3Psnu8pLosRrUEe/EPK+2jS7vTyTdzgqAwKeTCKU0Of/Toro0Pv
	0NtHJ60w6mWiZXk6j0pwdG31YG6+ZaFtk5MDTaolAzTSBaJua3TFmWgpAu7Bwsev1d/aRu03vCc
	b6lcTfQayhHK6kKfsMM36+p/2d1W57rJ4h/LexG4meJJSTy6IbHc72147kt2vvnLDbv/IjeaW09
	jMdkJDjlmAlWZbJGmQfHqQHSosbMcC6CYy2k2vaQ+lszNpJPYRypLph4vLsrsqcJ8KP2nAR3IXE
	gLNmqJW1thZmUgurfGAWgGxSC6zv4Maxvv0T3kGgOXewvToOQlr2FEr60QGHh56vPpAjzIQHXvS
	V4iwZLgdxUuWGkJnJ3GisIx9JzdoRc17jsI8XyKracEw4SZ4LLqdzZh+v4fANxVAGoeiZRR/bxt
	+Cc/FQ+ZpnjlDv/3HgBA==
X-Google-Smtp-Source: AGHT+IFFuE0IpmRKltf3NCJrfvjuMROiYig/x7vdZGNFBWVaI1wobtpu87KOcr6O03jx1C8wR0fYCQ==
X-Received: by 2002:a17:907:96ab:b0:b70:be0b:6ba8 with SMTP id a640c23a62f3a-b72e0623f36mr1268911866b.61.1762861574774;
        Tue, 11 Nov 2025 03:46:14 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72fcde0779sm682374466b.40.2025.11.11.03.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:46:14 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: p.zabel@pengutronix.de
Cc: a.shimko.dev@gmail.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: [PATCH v2 3/3] i2c: designware-platdrv: streamline error handling
Date: Tue, 11 Nov 2025 14:45:59 +0300
Message-ID: <20251111114559.3188740-3-a.shimko.dev@gmail.com>
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

The probe function uses unnecessary goto statements and error variable
reassignments that complicate the code flow. The goto exit_probe pattern
adds indirection for simple error cleanup, while redundant error assignment
in lock support probe clutters the error handling.

Simplify the error paths by removing the goto exit_probe label and handling
PM runtime cleanup directly after i2c_dw_probe() failure. Additionally,
replace the error variable reassignment in i2c_dw_probe_lock_support() with
direct dev_err_probe() return. These changes make the error handling more
linear and readable while maintaining identical functionality.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d334af1d7c6f..ab15a924dad5 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -256,10 +256,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = i2c_dw_probe_lock_support(dev);
-	if (ret) {
-		ret = dev_err_probe(device, ret, "failed to probe lock support\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(device, ret, "failed to probe lock support\n");
 
 	i2c_dw_configure(dev);
 
@@ -314,14 +312,10 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	pm_runtime_enable(device);
 
 	ret = i2c_dw_probe(dev);
-	if (ret)
-		goto exit_probe;
-
-	return ret;
-
-exit_probe:
-	dw_i2c_plat_pm_cleanup(dev);
-	i2c_dw_prepare_clk(dev, false);
+	if (ret) {
+		dw_i2c_plat_pm_cleanup(dev);
+		i2c_dw_prepare_clk(dev, false);
+	}
 
 	return ret;
 }
-- 
2.43.0


