Return-Path: <linux-i2c+bounces-9903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2024A68822
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E6D77A48C7
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 09:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741BD257AF5;
	Wed, 19 Mar 2025 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqUv9Bd7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307DA257AE7;
	Wed, 19 Mar 2025 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376700; cv=none; b=uX1F17YcWGEXmqv00ixpDqvIohK0DBzZ/HPNC9iTwlxqXXl07jCSSouIVJ7OJxgI8YsHgqDX2AU0nDHgF6+8+geN20Ymkogx0nYljXjSGU8k38C/He70ozfmZxdBsb9icx4dqv9UzUVPDka68ABPrNr+uJmcdcmum2hrQ/LvPhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376700; c=relaxed/simple;
	bh=g8epWtV0wV72iaajZGoYKR5VVY69o2FdAj6xtRjzIdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQrfv4l/SGucqT08gChn9/6RO83Zb15jk9ObD7ZUhKmKAQA2s+AyhnQi5lUL3YQTZDDr23hMJltnOdOGvzaYgZJOV6yV2s4jPi4D2nUpI1Y4SUC1jFy7yVDV9szS3kP4fFRvnSrRSBeN7rwcxaUzKZqDrfaz/tKqt8wnN5pzFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqUv9Bd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B92C4CEE9;
	Wed, 19 Mar 2025 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376699;
	bh=g8epWtV0wV72iaajZGoYKR5VVY69o2FdAj6xtRjzIdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gqUv9Bd70B8pXRazMLQ+CRph9AGw08H7J+aNsYEUxEPuWxt94g2c4cWbLjUdDEG7r
	 cHpa5KTokcliz+NV6hk98tFwtIjebDprW8qtfwrOYLW759Gqn4+fttaVKSI9DtiLEA
	 YxiIG/s5h5+fTKp2oEAsjQvMh9kfcjTo291haVr5obTva8VHwGfyG4m76X7WorhSbu
	 mjU9s5MdMfByJtp+cMJKMv74Qml4wX0Wj8Me8C3/0jHVpMmBdWDtL0eQICHtB8KxDw
	 /mXtkcaEt4N+CpcY4XzJweXMRmL9stXIbZfGk5YnNWCXPjavQfh3trehepbkNtvEAs
	 8jBvthToVewSg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 19/57] irqdomain: i2c: Switch to irq_domain_create_linear()
Date: Wed, 19 Mar 2025 10:29:12 +0100
Message-ID: <20250319092951.37667-20-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-cht-wc.c     | 2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 26a36a65521e..606ac071cb80 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -467,7 +467,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Alloc and register client IRQ */
-	adap->irq_domain = irq_domain_add_linear(NULL, 1, &irq_domain_simple_ops, NULL);
+	adap->irq_domain = irq_domain_create_linear(NULL, 1, &irq_domain_simple_ops, NULL);
 	if (!adap->irq_domain)
 		return -ENOMEM;
 
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 6f84018258c4..f6430db6c115 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -442,9 +442,9 @@ static int pca954x_irq_setup(struct i2c_mux_core *muxc)
 
 	raw_spin_lock_init(&data->lock);
 
-	data->irq = irq_domain_add_linear(client->dev.of_node,
-					  data->chip->nchans,
-					  &irq_domain_simple_ops, data);
+	data->irq = irq_domain_create_linear(of_fwnode_handle(client->dev.of_node),
+					     data->chip->nchans,
+					     &irq_domain_simple_ops, data);
 	if (!data->irq)
 		return -ENODEV;
 
-- 
2.49.0


