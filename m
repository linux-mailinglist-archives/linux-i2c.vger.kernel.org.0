Return-Path: <linux-i2c+bounces-13245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC2BA5E11
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7277B17F7EE
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0422DCF5B;
	Sat, 27 Sep 2025 10:58:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E12DCF46;
	Sat, 27 Sep 2025 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758970687; cv=none; b=V/g0xZJ6LcktOzhpIEwFEI2oobjdrTnVIKrm8PbhWCOzVu9nd/GHgIaAPmk6pvUMcp10iMnViBX8Bda4trewucB4PzldgfFX3P4zSMUUb76nc8Xs+N+l1ACfZQmm3veitkG0OYDeX2B7sRfHeoMODeZGxwSkHvT5M9qCKU1CR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758970687; c=relaxed/simple;
	bh=vOeDSRLaO7LLl0fRREVJ+ouvCma7Y6wBZaZyNSSCm4A=;
	h=From:To:Cc:Subject:Date:Message-Id; b=h2p0m8oQVKPzmFlVsH2YxkT5cWnaIsLhJEu91vevL+O5JaaxpywuysPNReUqgDjetPRQ7wWOmEhrw4nlAvFBsxyl0B9jTA4ZOhf0D5dvBJnJ5Hl/qy3pYK0I+t0zDJ4PIfctq49hDMKUyU9hBokbrbRTU4jMsUUBtWiEH/WSRXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-01 (Coremail) with SMTP id qwCowACX8KIdw9doaohdBw--.26444S2;
	Sat, 27 Sep 2025 18:57:51 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: syniurge@gmail.com,
	shyam-sundar.s-k@amd.com,
	andi.shyti@kernel.org,
	wsa@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: fix reference leak in MP2 PCI device
Date: Sat, 27 Sep 2025 18:57:29 +0800
Message-Id: <20250927105729.19164-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:qwCowACX8KIdw9doaohdBw--.26444S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw17JF1rXr47XrWDGw4UJwb_yoW8GFWDpF
	WUtFWxAr98GF1vg3WDX3WUZFy3Cw4vvws5WrW7Aw4F9F1rZasYkryktF909w15ArWjyF4a
	qFW3tayruF1jqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmsjUUUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

In i2c_amd_probe(), amd_mp2_find_device() utilizes
driver_find_next_device() which internally calls driver_find_device()
to locate the matching device. driver_find_device() increments the
reference count of the found device by calling get_device(), but
amd_mp2_find_device() fails to call put_device() to decrement the
reference count before returning. This results in a reference count
leak of the PCI device each time i2c_amd_probe() is executed, which
may prevent the device from being properly released and cause a memory
leak.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index ef7370d3dbea..1f01d3f121ba 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -464,7 +464,9 @@ struct amd_mp2_dev *amd_mp2_find_device(void)
 		return NULL;
 
 	pci_dev = to_pci_dev(dev);
-	return (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
+	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
+	put_device(dev);
+	return mp2_dev;
 }
 EXPORT_SYMBOL_GPL(amd_mp2_find_device);
 
-- 
2.17.1


