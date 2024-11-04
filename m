Return-Path: <linux-i2c+bounces-7767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 257519BC03E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 22:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B92A11F22982
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 21:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4201FDF89;
	Mon,  4 Nov 2024 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vu7wTK+o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2911E5725;
	Mon,  4 Nov 2024 21:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730756598; cv=none; b=TPKQOp1NG0WP0/kMk/UbHvY2hJfx+pglfAmQ+y3apzw7OAZKAWpdk7REzCHvqWUiCOMcBbi8kPobinlvApxI3leTHzUI+/OlX4duly6CcuUS0N+wSM7E/7kRVq0fhpLvmDLAeaZktkBqNsFdNtUUUJkt3U0ggqSMV9uIZzMX55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730756598; c=relaxed/simple;
	bh=XrxCgXP+ydeQT4DjN34U1VCFZbux1vFruYBUaV2QmVk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hU19vSvJQpb/yuQbQQIoESrLKRDQpM9aVSRpa4TCiJzuy39CL9+A4TJTBKsEvP2MbedeFEXn4gpq4wDO5bk3HJhEvED80sXrE8DLO+8mlO2QKuUrgd0DwRuvWO52fTtbTYqPSZkrSa4Uo8wXDCHSn+OM4DhpV6uYX7N+BQuu0QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vu7wTK+o; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ebc27fdc30so2518069eaf.2;
        Mon, 04 Nov 2024 13:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756595; x=1731361395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOLycEB3fTB76jveJ6Ec3et2DfKHvs/Gj7ofAidlU2U=;
        b=Vu7wTK+obTUTYm0jXAUoSn/W7DWL5G4LOFSz3A80IUhV4neB+5oMGiGo+B4TYJEtiP
         5V1m9pRdoa+0IJbW2Q9d0IoOwJMxt3Z1Qef712sSpg/mP0NyaSbo0dVMgN2It7nE6w2V
         aXzS+fxMYfzPUvJkEUxSy1Kf1Z/Bj5i7DkdylP1d6QM13aYZp+yTUxgys1qGQ4MsOFnA
         bOo7zeNzrntG43AYUU3UBID5Y10Kqrf01d9HNeGk8C7jEaIdIZn8TaCsx4HHXRBSJzVk
         b3EcUtvozItb3QxofBIjB63kinntY13kU5+aOjurGTcN+cglgsZ2Y4Sh4033vJhW/Zka
         wntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756595; x=1731361395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOLycEB3fTB76jveJ6Ec3et2DfKHvs/Gj7ofAidlU2U=;
        b=EBgVaImgv8Rr12t74wgQVPBPRgmAQAiz2bilmbbz9AFZxyOxl/AEYgdGLsKn5etkoZ
         iG3g5EkJICR9/c7nTgYEMRvBufeEMzcbma7WKebCrW27e1z+IKRyyA2thBJJM48jiAR5
         FbAC65sLVeKMqWd4AmxFoFoSumTlzOfPpt/GBR4B8FFOgZFol3SAppgAtvZG952xOEh0
         PTuHE8IxYQ5HFa9PFzeflu5twNdQ37jxVZN50YZa2/hGv40raJyMwDFv3A0MAn3uXebQ
         WJesF/g6siszqMCXfZpTWPiT3OIYoTujk81QJYv4VIT0kOHzUgypyN33uXiDtiNrvqm7
         /UBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXx0DnlxgVUSiGcbOdLOTJdpBfGwPzv2O7E5xXl9KjG+SDkWetfAxTASjHyI13SVEoJAMhxmslgl8=@vger.kernel.org, AJvYcCUeP8k22X1ILqsXU5QL7k5ChPWuFFWOOHHxKvaXHSjzQagmEqBtqEUuAJoLKYBYYcSsMeJtJ8cQfJ+usdHj@vger.kernel.org
X-Gm-Message-State: AOJu0YwTPRRYAedRh5iVURP+1Iw4iD++f16q181g6PpSf+I16p4PcHG+
	3QYi9iGfM2+4tSN/NmGeud567BxSXPTXQWld6QQIwGwIqz/vXnT/
X-Google-Smtp-Source: AGHT+IGnt1DbQccv8yv6iE45XBrqGyCFkNPY8U/R7NDQnyLk4H54QS9Fm7w3bkWhRyMLeNLeyX0P/A==
X-Received: by 2002:a05:6358:7254:b0:1ad:10eb:cd39 with SMTP id e5c5f4694b2df-1c3f9f7979amr1635893255d.26.1730756595525;
        Mon, 04 Nov 2024 13:43:15 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1edsm52553916d6.75.2024.11.04.13.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:43:15 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
Date: Mon,  4 Nov 2024 21:43:09 +0000
Message-Id: <20241104214310.6048-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return values of clk_enable() and clk_prepare_enable()
in order to catch the potential exceptions.

Fixes: e7d48fa2b5fb ("[I2C] pxa: provide late suspend and early resume hooks")
Fixes: c3cef3f3c07b ("[ARM] pxa: update pxa i2c driver to use clk support")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/i2c/busses/i2c-pxa.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4b..1118a7f5c6bf 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret) {
+		dev_err(&dev->dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
@@ -1560,8 +1564,14 @@ static int i2c_pxa_suspend_noirq(struct device *dev)
 static int i2c_pxa_resume_noirq(struct device *dev)
 {
 	struct pxa_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
-	clk_enable(i2c->clk);
 	i2c_pxa_reset(i2c);
 
 	return 0;
-- 
2.25.1


