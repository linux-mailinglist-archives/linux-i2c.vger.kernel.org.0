Return-Path: <linux-i2c+bounces-9143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2FA1798B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 09:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 658657A02D5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 08:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D901BBBC8;
	Tue, 21 Jan 2025 08:49:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396021BD9CD;
	Tue, 21 Jan 2025 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737449369; cv=none; b=XpN8ec7ejVohlAJUGTLIu9Q+unQzjw4GzaUx9Nk6jXUszxAYC8cZ7O0Z3rt9c63VpN2OtCt7VxcwQqwUs1HPDCIpadhh/Qof/bSOrM9065+vuUJrfOoYH0hVpd1OWQyMt65iuQKyeTrLTowOQjuc0FIyjKMCzVR/n5GnjOhAQts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737449369; c=relaxed/simple;
	bh=i4rBb8X9fUwOVKhS3UFb3Kx4ytX1DjbTxZy1w1XQoAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tmh6UBP/q1JXYlJUAR4zx76TNY+1kjaNg6xkyeeaFQ62UwrvztOTQCkLC0HdWqZEVK7L+HLOjzIG2NpxcPJ/hY0yqjdJ4hPghXfjH8u1nSTYcvLnJpR6yJyqjzUae6ZQDsyCIIEEPumBZVrTkhnf4/4qPU+kB5s/0kfyVzkUcTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [220.197.236.33])
	by APP-05 (Coremail) with SMTP id zQCowABXX6N4X49nDUNjCA--.9248S2;
	Tue, 21 Jan 2025 16:49:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: u.kleine-koenig@baylibre.com,
	andi.shyti@kernel.org,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant error checks
Date: Tue, 21 Jan 2025 16:48:18 +0800
Message-ID: <20250121084818.2719-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXX6N4X49nDUNjCA--.9248S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWDJw1rZF4fAr1fAF4fXwb_yoW8ZF4fpF
	4fXr98ur48GFyqqry7GrWrZ345Zr1xJFW0kr43G3WfGan5Jw40y3WrKrWYyryDJay8Jr13
	Zrs7trWUCayjvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsJA2ePXTAIbwAAsk

The bcm_iproc_i2c_init() always returns 0. As a result, there
is no need to check its return value or handle errors.

This patch changes the prototype of bcm_iproc_i2c_init() to
return void and removes the redundant error handling code after
calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()
and bcm_iproc_i2c_resume().

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 15b632a146e1..59cbf8b3b025 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -678,7 +678,7 @@ static irqreturn_t bcm_iproc_i2c_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
+static void bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
 {
 	u32 val;
 
@@ -706,8 +706,6 @@ static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
 
 	/* clear all pending interrupts */
 	iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, 0xffffffff);
-
-	return 0;
 }
 
 static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *iproc_i2c,
@@ -1081,9 +1079,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 		bcm_iproc_algo.unreg_slave = NULL;
 	}
 
-	ret = bcm_iproc_i2c_init(iproc_i2c);
-	if (ret)
-		return ret;
+	bcm_iproc_i2c_init(iproc_i2c);
 
 	ret = bcm_iproc_i2c_cfg_speed(iproc_i2c);
 	if (ret)
@@ -1169,9 +1165,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
 	 * Power domain could have been shut off completely in system deep
 	 * sleep, so re-initialize the block here
 	 */
-	ret = bcm_iproc_i2c_init(iproc_i2c);
-	if (ret)
-		return ret;
+	bcm_iproc_i2c_init(iproc_i2c);
 
 	/* configure to the desired bus speed */
 	val = iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
-- 
2.42.0.windows.2


