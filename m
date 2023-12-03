Return-Path: <linux-i2c+bounces-584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096980220A
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 09:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B890B209C5
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 08:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADD92CA7;
	Sun,  3 Dec 2023 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="a3lRV4bu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F9F9E8;
	Sun,  3 Dec 2023 00:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=5gnjsR58uLKw7gz+U7
	2thLU6153WYL0zgBBSFibHDu8=; b=a3lRV4buP5pEicX3B9gJobyP1seYkpWgIw
	YCY7oeTJuVxQivao21/ryjqRdjgGhQ3Dabt/4aKbXdT8EN8+D6M66erEQM5/BsRA
	OMuTyqNiqFehkcyJvM+jZE3oDCy2N59vXWnynLXECUuDnwh9M3m3vXdaBK2lFuab
	neXIi5gAE=
Received: from localhost.localdomain (unknown [39.144.190.5])
	by zwqz-smtp-mta-g2-3 (Coremail) with SMTP id _____wDXf_QcQWxlgb0tEg--.8205S2;
	Sun, 03 Dec 2023 16:49:33 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: till@harbaum.org
Cc: andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [i2c] tiny-usb: Add error handling in i2c_tiny_usb_probe
Date: Sun,  3 Dec 2023 00:49:29 -0800
Message-Id: <20231203084929.38168-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wDXf_QcQWxlgb0tEg--.8205S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1UXr48Kr4rCrWDAF1kKrg_yoW8CF45p3
	97K39xCr4UJw1SqrsrXa4IgFy5u3yrK3yjkFyDKwsruan8JF9rtrW3tryS9Fy8Gr97uw4D
	tryjq343CF1UCF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piWrW5UUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiZQQ7gl8ZaX4EJQAAso
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

This patch adds error handling for the i2c_add_adapter. The need for this
error handling was identified through static analysis, which revealed that
the function did not properly address potential failures of
i2c_add_adapter. Previously, a failure in this call could lead to an
incomplete initialization of the I2C adapter, causing unpredictable
behavior.

Although the error addressed by this patch may not occur in the current
environment, I still suggest implementing these error handling routines
if the function is not highly time-sensitive. As the environment evolves
or the code gets reused in different contexts, there's a possibility that
these errors might occur. In case you find this addition unnecessary, I
completely understand and respect your perspective. My intention was to
enhance the robustness of the code, but I acknowledge that practical
considerations and current functionality might not warrant this change
at this point.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/i2c/busses/i2c-tiny-usb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 1bffe36c40ad..f165e20fea53 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -264,7 +264,12 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 	dev->adapter.dev.parent = &dev->interface->dev;
 
 	/* and finally attach to i2c layer */
-	i2c_add_adapter(&dev->adapter);
+	retval = i2c_add_adapter(&dev->adapter);
+	if (retval) {
+		dev_err(&interface->dev, "i2c_add_adapter failed: %d\n",
+			retval);
+		goto error;
+	}
 
 	/* inform user about successful attachment to i2c layer */
 	dev_info(&dev->adapter.dev, "connected i2c-tiny-usb device\n");
-- 
2.17.1


