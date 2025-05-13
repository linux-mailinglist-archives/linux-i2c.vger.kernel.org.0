Return-Path: <linux-i2c+bounces-10964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13BAB5BF5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 19:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B2C67B428E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 17:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B882BEC41;
	Tue, 13 May 2025 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EozSf4BK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-75.smtpout.orange.fr [80.12.242.75])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055921171F;
	Tue, 13 May 2025 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747159024; cv=none; b=pbXa0VmTnngvoU1F6uvxBQdJkEwCIp6EFQv/KYdg0R6I5n8ospRsJFMa0uVj6WNYMONpig7t1N4sonkrgdaMGWpiVuAmvIg+aGA396714q2aaUQmW8KjLjvuQXX7K8FArhkIhQpxt3O0WyFnaiZKeTQo/hs6rf/npbQyu3PwBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747159024; c=relaxed/simple;
	bh=xfmRbdMDPgeYyIDpknFQvkLkMNJjzQgDa37ZOx8V8Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZOdIPZtALYr0hZCM2BGktq6JcBVaD4JVv5qA+4JkUMZdQewSv89JblyLre8doPyE0rPbfq+60hTO3bgwf+Q7a95H+Axvnt2a74B8HTWQRKPqoXqrXXN7qGasVWCx555qbJ9mFazPo3WDhUmnqRxTpupxxUv8frqa3gjeyMMnwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=EozSf4BK; arc=none smtp.client-ip=80.12.242.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Ets4uJayC5oOhEts4uVceT; Tue, 13 May 2025 19:56:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747159014;
	bh=zlSd+UIDE6/b/K4sK7oEThlef+0uV77pMWrYGXzOQO8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=EozSf4BKM/DmZ2m3vkDtCEUh/D81aurvmCCTRvrkN0mh7KVTHZY7wQ6EySKXBdae1
	 EdUpob+Z+r0hTy0nBlUCIphiTBEpoFLC5NQMDUf5qnkgBDAUMwoYfCfEDGPg6BCMuq
	 J/gXv9EEkyWAn3CyaNsCV1VY5rFiMC78rkrZ1+KvKpTohDzp5MxFth3aJR2BJIBzBA
	 ByeA2Zmi4viepAjzKNq5Y12CD0n8+/bricNjluHZwKwcEkn5xSk87aKoT+YEP1uL9Q
	 EyenCVyOkhFR76iVl8wZHsVJeTLTISc8GlN6POcOY5Gpdu9rRniPxtfyaLzqQ8RIZ6
	 7Hu72ORxlZNMw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 13 May 2025 19:56:54 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Wolfram Sang <wsa@kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: designware: Fix an error handling path in i2c_dw_pci_probe()
Date: Tue, 13 May 2025 19:56:41 +0200
Message-ID: <fcd9651835a32979df8802b2db9504c523a8ebbb.1747158983.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If navi_amd_register_client() fails, the previous i2c_dw_probe() call
should be undone by a corresponding i2c_del_adapter() call, as already done
in the remove function.

Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 8e0267c7cc29..f21f9877c040 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -278,9 +278,11 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
 		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, &dgpu_node);
-		if (IS_ERR(dev->slave))
+		if (IS_ERR(dev->slave)) {
+			i2c_del_adapter(&dev->adapter);
 			return dev_err_probe(device, PTR_ERR(dev->slave),
 					     "register UCSI failed\n");
+		}
 	}
 
 	pm_runtime_set_autosuspend_delay(device, 1000);
-- 
2.49.0


