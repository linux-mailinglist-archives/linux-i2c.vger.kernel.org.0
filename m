Return-Path: <linux-i2c+bounces-14276-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F9C89624
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 11:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 832083AC1E6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0D53203B4;
	Wed, 26 Nov 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RcIp/aue"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F05E31BCAF;
	Wed, 26 Nov 2025 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154014; cv=none; b=PLVjx2QWSZv6TVXKvIjgxc+s9xgkGnSyf/MiyZgXNYkFKmQ8a/HfN0MSuiOwFG8zuGJD4pxGZAd8Lhgd2U1csw3Stu/2ou7zanvjxQzv0XdQqD5ESmVBlonqfYakswh1bu/OI0ruf/BqlYm6J3ru8FQrF3oOGcg5KJ3XjG/Virw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154014; c=relaxed/simple;
	bh=QMhG/0jhakuaZrCFcax2pEPoKx4GMav9oHIrsDzUx9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hr1nwnedRUarrBA/xljvdZ0LobgYenCuBs++cbPL8jUSof9t+oVeJMLxu8oUjKLsW2RMUd+MADdcYJRX+UNGQZA3ZKKMN8c7okhLrFJwTf/26lPX58RjHd8zgr90iSgG4FgOeKrPZEjLLkJsXBWYxofkWLAjhaiQzHEs3iV0NBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RcIp/aue; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B45ACC15D77;
	Wed, 26 Nov 2025 10:46:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7749A60721;
	Wed, 26 Nov 2025 10:46:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89593102F08C9;
	Wed, 26 Nov 2025 11:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764154004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NvumRa6Nk5FY/qYCbY/ZM5BWU9fnNCjKXXsILsQItok=;
	b=RcIp/auev14qyTZ3560muoYZERZ8ow7wHWFG3L6cG8Cap3Um0FB0SJeaJWRP+ghGHepPlk
	zhCbrzR9+UMM3ryGAB20VdOvA0sK9mQ/1+0oZ6/0ylogEb2heNweiu4ci6ua3E1QjtVtYQ
	3yTxD8Acwkr+i85ybzi+Et923qljUC60n1HU+dZO6IjdOWZQvL40Tpqd7Dl6UCl2xSkrt+
	Tdl5oQxawenoWuWLcIUB7F6sUK1gcqAla2Cuw6mr1Hn0aZTcUJDbzhBjXn518WFRD355T7
	GSVsvYVcuDVCKnEPVBEScxYKE1mqijI0F12HPlNevM+Aj+FMay/7Fdn2wAL6Sg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 26 Nov 2025 11:46:24 +0100
Subject: [PATCH v4 1/7] dt-bindings: i2c: dw: Add Mobileye I2C controllers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251126-i2c-dw-v4-1-b0654598e7c5@bootlin.com>
References: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
In-Reply-To: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jan Dabros <jsd@semihalf.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Dmitry Guzman <dmitry.guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add compatible string for the DesignWare-based I2C controllers present
in Mobileye Eyeq6Lplus SoC, with a fallback to the default compatible.
The same controllers are also present in the EyeQ7H, so add a compatible
for those with a fallback to the Eyeq6Lplus compatible.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d904191bb0c6..914200188809 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -34,8 +34,15 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: Mobileye EyeQ DesignWare I2C controller
+        items:
+          - enum:
+              - mobileye,eyeq7h-i2c
+          - const: mobileye,eyeq6lplus-i2c
+          - const: snps,designware-i2c
       - items:
           - enum:
+              - mobileye,eyeq6lplus-i2c
               - mscc,ocelot-i2c
               - sophgo,sg2044-i2c
               - thead,th1520-i2c

-- 
2.52.0


