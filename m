Return-Path: <linux-i2c+bounces-11170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB9AC91A3
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 194583AF817
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F2C236435;
	Fri, 30 May 2025 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNFfLPsl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973892356C7;
	Fri, 30 May 2025 14:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615515; cv=none; b=INJKkU0vGlNC3h0xibSGa54N84jJaBDwymTn1ygJ9cSqZMbA+PyNo+btMXmHdv+T8Cz6KTMfspJ/8QiMMm2dnHyZ3ETULzyS4idFxRXn1z5ZXNTch8dQPXqR/8bIElpYvG+pi+nfhv2JZswGgj0VbdvrAA3/4EsYvjl3SlRbtWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615515; c=relaxed/simple;
	bh=mDj3VicGgyI+wI+ovqpbdZJX/tjI8OKHNHH9BWZq4T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaewHeibEGA8qwa8nOxGzICTkllichaNraYNgElyAwn0vGUnxIh2zmxytYZC2kxFJa6HiVJNaGUsKDfiY6rCIB/D++dTKjkzYBtew3PljvG4UrDS/OwRtZp985iPwxtiqS4Fu35a7/W1u7Cs5tARJYjgdZltKMCmfuLUit5YqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNFfLPsl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so22752025e9.3;
        Fri, 30 May 2025 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748615512; x=1749220312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yy3mxJD6Ow0q1xIcuXwYB3kdOhWYRWT2ZlQG9e6rQM=;
        b=GNFfLPsl9yk5xl2vtFU431Ul/M3UD10vwlYjpl5HbL8x2gW14DvdjPHiR97Ws6ZeXt
         t74XXFC0LV78x1oUwVMajAaHH6rEqXaXf8y2h6Rv//91xoAwVKCPW4MLRig3iEG3/bYk
         al/mzwjRO6dYUXh9M1XYDZbNZsDY5AjgNmUT+EwEBOhP+dl9bAGh5+mo4zuL0YEAEXst
         faNbPIvE+hcryYxBay/mabGu4qAN8iGVVx94dQ9tcIyUCtDTC9CnT5Al1U9eP9sdN89x
         gvbL0JLvUbfyKfSScBPHA0DAOk0JDfcLcOv80blNRn1jIX0J3A9t2WQJ7Trbnb/CZGXG
         MaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615512; x=1749220312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yy3mxJD6Ow0q1xIcuXwYB3kdOhWYRWT2ZlQG9e6rQM=;
        b=iLOuuZt8amfYe9L7Cywg1p+zbXUEMPdcFyGiy69wZm1tftWClVHhZUv2x9PcNNKWE/
         ETEvgUQxKQnBFmolc/K7+RRwLrxKmNizjQefFyQYE0v7kjw193nucufgesy4sPxeRPTJ
         OAIkK0CcZ1Ycz6KL35yT2goFKRrhCBSg0N/gekiiNpoVSgSLFTbPPSd0RJeRTHyraBLi
         XRwoKq/iEKC8BIJgwB4+t7wvbahtZvOmabpoEVOQMpHb/lJoUmx8isUqudYlUolw9Zbb
         al0FUelg55F2LdcKFnKUCYgVQhv83DTVy8x50chLyxZmkPHP3BgVE0cz2Cw/aXJewFyv
         4wsw==
X-Forwarded-Encrypted: i=1; AJvYcCU6TFiXH19b8vuUJ6Jo1+//yhVRCs/feLLcZguCqn5fPqIB9c8HEUouFTB3aELIE5X8F8AxwKfh4PZh@vger.kernel.org, AJvYcCWsieFV70LbKGZpvSjpY9YQI40nR+WV2XWl7ECrsblLE5Nbj1E0UZDdTepNbNp95V7jYRnjCitlwyyv@vger.kernel.org, AJvYcCXoUBhiD+NqjLF0oJOMzutz2oC3Ugt2C/K3epV+WUn6T7MPSiXbk49p1NW3t9k39fkEKSJwDYMkrFsEb4r0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8Pe6AkV2achPuZuAuPPgKeaevaYMLc4mGJOBvfwPVX4SpP9M
	Kng+/av/URp1yz4P+EGwhRPqngCk81FXtxOwogTAQLQ8GledenS7/32b
X-Gm-Gg: ASbGnctQfpIKGflpkgyK+sJupkPvN5pUJJcO9BtiQ/I20F8cW2TSx1rOHM9aer0aqDD
	f20GeDDROS/UewztYN8NA5c6S5MqGI5OdfLshcNLwfCjDGW1wdXFyvtCOwyq5gvCJM7chCemOV2
	v57LeWksri6PRBBP59X5X7HVRnKjVwSoYXn0t17cyW8QrNdUkM4/Zpt3aT8Xz/HZWDDGXL8slR3
	CAz8Pa4lMqUnV9jVmsrKEfwrLBWSGP06h5ILTtCfalwY+ytewCeOkK+jBrCdnc6sd3CjTTGUUQF
	nTo+7ewrzaO6y7EyiDRzOGj5MF5fB28mOR3Vx4n1RYK3+wyiQ2tWcqvaEiotFr214xNG1WR+1PU
	iGYFXPFZTug==
X-Google-Smtp-Source: AGHT+IEwUB3LCE1/ACrISy3mr6KRWahkBxt381ym1LKa8xPMHBjgx/btToOU73JiyYWE2z8WgF3chA==
X-Received: by 2002:a05:600c:4711:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-450d6533b86mr39703445e9.16.1748615511445;
        Fri, 30 May 2025 07:31:51 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm20107445e9.4.2025.05.30.07.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:31:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] i2c: riic: Pass IRQ desc array as part of OF data
Date: Fri, 30 May 2025 15:31:33 +0100
Message-ID: <20250530143135.366417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for Renesas RZ/T2H and RZ/N2H SoCs,
which feature a combined error interrupt instead of individual error
interrupts per condition, update the driver to support configurable IRQ
layouts via OF data.

Introduce a new `irqs` field and `num_irqs` count in `riic_of_data` to
allow future SoCs to provide a custom IRQ layout. This patch is a
non-functional change for existing SoCs and maintains compatibility with
the current `riic_irqs` array.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 23375f7fe3ad..4950b790cfe7 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -102,6 +102,8 @@ enum riic_reg_list {
 
 struct riic_of_data {
 	const u8 *regs;
+	const struct riic_irq_desc *irqs;
+	u8 num_irqs;
 	bool fast_mode_plus;
 };
 
@@ -520,21 +522,23 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(riic->rstc),
 				     "failed to acquire deasserted reset\n");
 
-	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
+	riic->info = of_device_get_match_data(dev);
+
+	for (i = 0; i < riic->info->num_irqs; i++) {
+		const struct riic_irq_desc *irq_desc;
 		int irq;
 
-		irq = platform_get_irq(pdev, riic_irqs[i].res_num);
+		irq_desc = &riic->info->irqs[i];
+		irq = platform_get_irq(pdev, irq_desc->res_num);
 		if (irq < 0)
 			return irq;
 
-		ret = devm_request_irq(dev, irq, riic_irqs[i].isr,
-				       0, riic_irqs[i].name, riic);
+		ret = devm_request_irq(dev, irq, irq_desc->isr, 0, irq_desc->name, riic);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to request irq %s\n",
-					     riic_irqs[i].name);
+					     irq_desc->name);
 	}
 
-	riic->info = of_device_get_match_data(dev);
 
 	adap = &riic->adapter;
 	i2c_set_adapdata(adap, riic);
@@ -607,10 +611,14 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
 static const struct riic_of_data riic_rz_a_info = {
 	.regs = riic_rz_a_regs,
 	.fast_mode_plus = true,
+	.irqs = riic_irqs,
+	.num_irqs = ARRAY_SIZE(riic_irqs),
 };
 
 static const struct riic_of_data riic_rz_a1h_info = {
 	.regs = riic_rz_a_regs,
+	.irqs = riic_irqs,
+	.num_irqs = ARRAY_SIZE(riic_irqs),
 };
 
 static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
@@ -631,6 +639,8 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 static const struct riic_of_data riic_rz_v2h_info = {
 	.regs = riic_rz_v2h_regs,
 	.fast_mode_plus = true,
+	.irqs = riic_irqs,
+	.num_irqs = ARRAY_SIZE(riic_irqs),
 };
 
 static int riic_i2c_suspend(struct device *dev)
-- 
2.49.0


