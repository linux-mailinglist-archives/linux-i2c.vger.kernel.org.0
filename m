Return-Path: <linux-i2c+bounces-3504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE18C64A8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 12:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2910028629F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 10:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542B380031;
	Wed, 15 May 2024 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UiqFlvbH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B778C71;
	Wed, 15 May 2024 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715767307; cv=none; b=DktMgCcIMVRvd4s2AKEeastGx4NLo4NqYV0QbSbPqCsf7wVnDBqVfRI5KHkBnhHUh7BgCsS/l8GfZRSPboxfZ5GnXNEvbM+GEXcxLle1evnsx4/2FZ+I5Iy8sCyQJ43IGDGxYAjlYpkV8m7X8oB5mw7qi/r+ontdwJl0cXnVx/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715767307; c=relaxed/simple;
	bh=aNY1BCk37hgomQWTjUsQ5l9jnB52GHjycJLv3+RRDtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rG8v83xVpvWIyycXVzh+yQUVJ9/3IxKqxBcJf7fjhX1UlKn9ZdonNYEchz86ERjOmpLNxwLKdo42kt2wUyD/4GuoXtyi1cv8EGDgYTjiRrHkPjKlcLHj3JCl3Ms4jZCS7pCAQqgxu0LSCDHpkYWEdtLJtEgEmpkjLrA6IQ5mIm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UiqFlvbH; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 623221BF20D;
	Wed, 15 May 2024 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715767303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOtYByFbOq/kD+SHjuSXQZVzJTtVnLBLPoL8nOih1ao=;
	b=UiqFlvbH31h6V/QqiutFpVZFkSvYJguJAqLq14slR5t3xFhTKJFij4/0pjFzQKnj3FKigV
	V2vHnDu8KSr0PElHxCY9Qwv7mCsXy2ne49/DoO+nHoT1JJJg3ubrODx7DDoYIsI7BxXQil
	6NgtXiIrxS+qPPdi9YY0o0TZpesHtDcjffgUFI6DehZyonsC7wYyCQsLfPF40vgWT3pYrz
	pf802u1LaV0EVzcJXPErOrFwrhG7xdkvSzvBKQN7QvuRHGyAc31SqQlRtp48cI4Wnna/1t
	8007ES6min2YDQl2jKdDICssfUD9ph4vIKZ+znQZho3pqksf3SJfaIo7DMBeaA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 15 May 2024 12:01:11 +0200
Subject: [PATCH v6 10/12] PCI: Add T_PERST_CLK_US macro
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-j7200-pcie-s2r-v6-10-4656ef6e6d66@bootlin.com>
References: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
 thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

"Power Sequencing and Reset Signal Timings" table (section 2.9.2) in PCI
EXPRESS CARD ELECTROMECHANICAL SPECIFICATION, REV. 5.1 indicates PERST#
should be deasserted after minimum of 100us once REFCLK is stable (symbol
T_PERST-CLK).

Add a macro so that PCIe controller drivers can use it.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/pci/pci.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 17fed1846847..c47b1d3b5887 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -16,6 +16,9 @@
 /* Power stable to PERST# inactive from PCIe card Electromechanical Spec */
 #define PCIE_T_PVPERL_MS		100
 
+/* REFCLK stable before PERST# inactive from PCIe card Electromechanical Spec */
+#define PCIE_T_PERST_CLK_US		100
+
 /*
  * PCIe r6.0, sec 5.3.3.2.1 <PME Synchronization>
  * Recommends 1ms to 10ms timeout to check L2 ready.

-- 
2.39.2


