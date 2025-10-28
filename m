Return-Path: <linux-i2c+bounces-13864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4979EC15F2A
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5A01A6114A
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5877C3469F2;
	Tue, 28 Oct 2025 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="QXQMhl+4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620F4307ADA;
	Tue, 28 Oct 2025 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670075; cv=none; b=jn3Prz9QYyl1q/pphsqCipQWBh2HRxaxHTZO8eNjlhCaOyPMqGTlsRoP/fj0+uKZT72Dx+yA+HznEGrG1jt6yR2ubgUnL8G1G0pNlfIADHFmnqxOFcKAMFrqmQS2gNS4y/CE4E6n3Ux3C3KMZLncP5ZynVh6WwpMVCD6/v2QGME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670075; c=relaxed/simple;
	bh=55EWec7cjRgTapTeWKtewYWvmLGUXFyRyTixXR7yoZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhDBAMEeRFbIqerC2g6wjD4PZlX4NtpH211VmnX+SpwGYQSwmgkrDXYy8fKpVrYLEEXADOVi7+iwo3IdDs7WZuE1YMh2f9Kp0BAMivae0OIWfWGrwJDSUER0xRFJNRRD3RzUzn7y/3uzsqDaCy8CW4c8H362o9YogMxWgrYo1dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=QXQMhl+4; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669687; bh=55EWec7cjRgTapTeWKtewYWvmLGUXFyRyTixXR7yoZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QXQMhl+47LswF0Pvdvp4DPfXrCiNx2TjZjBS+HY+XE72UcIJGpyhKEE2JmXSUDCYy
	 YBRKBwNmWifaZDZiK5gF+iT0OxJ2kVBsuN/TK//suiDVVGwLp7iIJ3NjMaL0Er20Xj
	 KUqKd2UgITXmNf5QDRHpu21v7TjIbTfAo2X3GFn4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Oct 2025 17:40:47 +0100
Subject: [PATCH v2 2/7] i2c: qcom-cci: Add msm8953 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm8953-cci-v2-2-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
In-Reply-To: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=55EWec7cjRgTapTeWKtewYWvmLGUXFyRyTixXR7yoZI=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBpAPIwS/fM3LkjFEaNaRvpGv6yObdO/fX0bpFmH
 RDxUG2Y1qmJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaQDyMAAKCRBy2EO4nU3X
 VlTYD/4yQlfHJrF0Ztr2aWgY3FTHs5NmBTUbH2O8CxBE+Zh10t5sB/NIzaFBu8i0CMCf07MiqOw
 64rVU4wW81mNay8krTq0WoLAAa0itmgJpkyrFoIGhlfMRriMzIC+uqsrieV6xAS/B1H0Z9R3ixw
 zNzOiHo09UDRo3GqNLhQgl/r9HlTpjx7jlXQHtrF0Hh82O3BfMAt775/fdhLXa/9dxblF4Y7Jgj
 pKdh3UO9rEYR7ySl8n64xqJY31Bm4puo2dJGnkRPULFXe6V9gC5OTeyr53QuPkRxlXPW34OqM2J
 871Jn/cR0lODKouok2mjGLyoA8RfPvSSCn1uTiC/PQdso8WiJZhDiVc/UyPYqfU+0mi1jGW464p
 xhspdM08a+Ur7sjLBd86rt6CtcHG4r5+S+DAuuujR9EmMNMZ0lfJmKoRm1n57OBpIK6pfspIbLD
 oVUmuM4SfA47Cw86iK/mQuWUso8sMRhivRiQxhbNScODXsD7bd9+l16kCfcLZU06SWsxE/2O1yL
 M2AjMnYBEWB9gKra/cxJmiOZ2OAsj0vSMf1i1SHReObdcJ2v3eC2IRQrHkMLl3UURp+ncKYRkiZ
 /Uls+hVr0WGZ/s6e0Y5Q2yrpqlMCIoEHhYM9EVok1nOHNHs7OowoxZgo9Z6tI3v8i6rAX0o15IL
 uSdMX+OkG1yMIPQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a config for the v1.2.5 CCI found on msm8953 which has different
values in .params compared to others already supported in the driver.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index e631d79baf14..884055df1560 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -783,8 +783,54 @@ static const struct cci_data cci_v2_data = {
 	},
 };
 
+static const struct cci_data cci_msm8953_data = {
+	.num_masters = 2,
+	.queue_size = { 64, 16 },
+	.quirks = {
+		.max_write_len = 11,
+		.max_read_len = 12,
+	},
+	.params[I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	.params[I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	.params[I2C_MODE_FAST_PLUS] = {
+		.thigh = 16,
+		.tlow = 22,
+		.tsu_sto = 17,
+		.tsu_sta = 18,
+		.thd_dat = 16,
+		.thd_sta = 15,
+		.tbuf = 19,
+		.scl_stretch_en = 1,
+		.trdhld = 3,
+		.tsp = 3
+	},
+};
+
 static const struct of_device_id cci_dt_match[] = {
 	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
+	{ .compatible = "qcom,msm8953-cci", .data = &cci_msm8953_data},
 	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
 

-- 
2.51.2


