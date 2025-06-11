Return-Path: <linux-i2c+bounces-11357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1BCAD526F
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 12:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20635177D8E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 10:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3690827990D;
	Wed, 11 Jun 2025 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F96wIN2Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AA52797B1;
	Wed, 11 Jun 2025 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638650; cv=none; b=aR6AgmIGsF4Fw0dd316gJgaX3NpKRdUAC4o+FLDVjgn8cGeq6j+Mf5LfxPmsUjeErFLSSj5s/6nCIRE+QLwpXUKEKWrbV/GMVluBEHKa0/Txil6u5ZeHR5X7Y8yV6TtwW8ktA+TJ9q8SCNyfYdV6iBC2OPWiTsrcbdTHe14uh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638650; c=relaxed/simple;
	bh=OsPoEo89oPEE3YhpaNAnMLcwzLCd/Xe4gBktqw3j3oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUSJ3JR1G8EZTkVdJI+OjMDaP9gnDMV/1lZhrKxUTGLOFxtp07N9l8lhZdysObmnmPe1GuQm0oHT5YRihgTTHo7FsZRbSqngkBIPd7Oidg1FUrYa14Sl8xINiL06LY0NgNLliqLGUJzpzrFaEntpmfH2aoXexGxvIgNWddeTnKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F96wIN2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC8DC4CEF2;
	Wed, 11 Jun 2025 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638649;
	bh=OsPoEo89oPEE3YhpaNAnMLcwzLCd/Xe4gBktqw3j3oU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F96wIN2Y+3tUQeXbxBXrZ7uT+F/ZkStofVE1B8oRrukXF0nZmB1y1mjhPQvMjxrut
	 AZocqHcA5qlAiSB8KEj/Sz8fi5xw6fxRLQxnpgcbATNLXha1qbND/crReNx3u/Dx9o
	 TGJkkT4AdFRIvnsILDYPcWVa0EY1CHsNYSVK4BX7AI2K8r1TkoliFZCA+XyU5oeEb5
	 xGi6Wgu5di4Y8AqjC6Ucvn/BLIzxs1o1P67qDGT63UjNAz/DDUqp7F1joRhmYwzm5Z
	 XNreDS1lb65ds4Paj6++EF1RJQoG7B8BcPaOVd4OBk/WiawOgcOpzjG2zjQx15EPNF
	 1Pdvv9Byaw8OA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:36 +0200
Message-ID: <20250611104348.192092-8-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 5bb26af0f532..b9f370c9f018 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -442,8 +442,7 @@ static int pca954x_irq_setup(struct i2c_mux_core *muxc)
 
 	raw_spin_lock_init(&data->lock);
 
-	data->irq = irq_domain_create_linear(of_fwnode_handle(client->dev.of_node),
-					     data->chip->nchans,
+	data->irq = irq_domain_create_linear(dev_fwnode(&client->dev), data->chip->nchans,
 					     &irq_domain_simple_ops, data);
 	if (!data->irq)
 		return -ENODEV;
-- 
2.49.0


