Return-Path: <linux-i2c+bounces-3209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E216F8B354D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 12:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F7851F221FD
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 10:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A68143C7B;
	Fri, 26 Apr 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dM2DRHkh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5313A245;
	Fri, 26 Apr 2024 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714127450; cv=none; b=Y9TarAZepaopurTWP9QAxgnVE3uRdnV+4n7Dhezf2jcsre2+1kDdoztEGjaLioS1DWL6Mtios/JLSaxiJZl19+jgHpnpquHrOsZXGytcd2tKMLe+7rYN2cvn4N0wo/1Csp/vXRmgln2y9YQ0PhS0QOqrsxdXB4KC2v5qy5O4rH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714127450; c=relaxed/simple;
	bh=sJNxaSHWuj0ZPLTZ/tZraa+vBjCTxxHtRWklP0HbfFE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQetH2HRYInT58aQ47yXQnmywqtl9XsU47bGEMbVRYLf5brbITdGwl435w2lt9jSWX8djlzT2cNmefvzW0up3Y6C/DON1hC/tAq8fTL/SLWnmR5nLibYnTzUYsQ9K8k4QB5gvN5koIs4e/WjFudoQFQalDwBERaRZDo1h9ARN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dM2DRHkh; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 08aff51403b811efb92737409a0e9459-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FBD40zR9wWh1sckjELKZXTOemjbdZqIQwnnA64yKeJY=;
	b=dM2DRHkh25+7sDwdzD6zExckewvm9s2Z16aQzokSAEgnqUP4Vjfc7YcJys7nmCr4GmKS//XUI5GgQF662s3a8fungnZ5WM6VS6vViVrIjW1GopYkQV5fUQm/4hvZLcx2Tj4E/UquZiWcLZGItryEISfoZCsAx4cFW/gNa4sRNSc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:96d0389c-503c-4f30-bf83-0649dd051b4b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:5400a786-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 08aff51403b811efb92737409a0e9459-20240426
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 323323383; Fri, 26 Apr 2024 18:30:42 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 18:30:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 18:30:40 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zoie Lin
	<zoie.lin@mediatek.com>
Subject: [PATCH 1/3] misc: eeprom: at24: add optional dovdd-supply
Date: Fri, 26 Apr 2024 18:29:47 +0800
Message-ID: <20240426102949.23057-2-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240426102949.23057-1-zoie.lin@mediatek.com>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.822200-8.000000
X-TMASE-MatchedRID: srvpIgWJJtlveCKWtaLcaBWCVBr+Ay98h+w9Wz/xXDoKogmGusPLb8bX
	zAmc72fpj7Wc8+5sjRQYGNM7XoZ5vKF2E6v/FJwhDko+EYiDQxG/lNQoFWTBKlSOymiJfTYXmDU
	U4w5Ch9HGK2Un1Qzz54Ay6p60ZV62fJ5/bZ6npdjKayT/BQTiGhwHPzrPx3/LH3JmFo2Le/cGF+
	eCWUDtSe/zhBFYHPGPKFqfM6Ow4ZGY+IvowaUQiVI5iMtRu6lG9OWOVhEk0dxL8+YJouWudF4Bs
	BlJkIbFdATQdtPksR+3/JiWOe6GXXSWgQ2GpXdZbxffl9hhCBw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.822200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	D8CC693C4F21B0F532796730FE4252B88B50B15F003698EF2208244DB84F1D902000:8

From: Zoie Lin <zoie.lin@mediatek.com>

Incorporate support for the dovdd regulator, which supplies an
additional power source to the EEPROM.

Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
---
 drivers/misc/eeprom/at24.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 572333ead5fb..b96f6eda3ad2 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -86,6 +86,7 @@ struct at24_data {
 
 	struct nvmem_device *nvmem;
 	struct regulator *vcc_reg;
+	struct regulator *dovdd_reg;
 	void (*read_post)(unsigned int off, char *buf, size_t count);
 
 	/*
@@ -697,6 +698,14 @@ static int at24_probe(struct i2c_client *client)
 	if (IS_ERR(at24->vcc_reg))
 		return PTR_ERR(at24->vcc_reg);
 
+	at24->dovdd_reg = devm_regulator_get_optional(dev, "dovdd");
+	if (IS_ERR(at24->dovdd_reg)) {
+		if (PTR_ERR(at24->dovdd_reg) == -ENODEV)
+			at24->dovdd_reg = NULL;
+		else
+			return PTR_ERR(at24->dovdd_reg);
+	}
+
 	writable = !(flags & AT24_FLAG_READONLY);
 	if (writable) {
 		at24->write_max = min_t(unsigned int,
@@ -754,6 +763,14 @@ static int at24_probe(struct i2c_client *client)
 			return err;
 		}
 
+		if (at24->dovdd_reg != NULL) {
+			err = regulator_enable(at24->dovdd_reg);
+			if (err) {
+				dev_err(dev, "Failed to enable dovdd regulator\n");
+				return err;
+			}
+		}
+
 		pm_runtime_set_active(dev);
 	}
 	pm_runtime_enable(dev);
@@ -761,8 +778,11 @@ static int at24_probe(struct i2c_client *client)
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
 	if (IS_ERR(at24->nvmem)) {
 		pm_runtime_disable(dev);
-		if (!pm_runtime_status_suspended(dev))
+		if (!pm_runtime_status_suspended(dev)) {
 			regulator_disable(at24->vcc_reg);
+			if (at24->dovdd_reg != NULL)
+				regulator_disable(at24->dovdd_reg);
+		}
 		return dev_err_probe(dev, PTR_ERR(at24->nvmem),
 				     "failed to register nvmem\n");
 	}
@@ -804,8 +824,11 @@ static void at24_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	if (acpi_dev_state_d0(&client->dev)) {
-		if (!pm_runtime_status_suspended(&client->dev))
+		if (!pm_runtime_status_suspended(&client->dev)) {
 			regulator_disable(at24->vcc_reg);
+			if (at24->dovdd_reg != NULL)
+				regulator_disable(at24->dovdd_reg);
+		}
 		pm_runtime_set_suspended(&client->dev);
 	}
 }
@@ -815,14 +838,24 @@ static int __maybe_unused at24_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct at24_data *at24 = i2c_get_clientdata(client);
 
+	if (at24->dovdd_reg != NULL)
+		regulator_disable(at24->dovdd_reg);
+
 	return regulator_disable(at24->vcc_reg);
 }
 
 static int __maybe_unused at24_resume(struct device *dev)
 {
+	int err;
 	struct i2c_client *client = to_i2c_client(dev);
 	struct at24_data *at24 = i2c_get_clientdata(client);
 
+	if (at24->dovdd_reg != NULL) {
+		err = regulator_enable(at24->dovdd_reg);
+		if (err)
+			return err;
+	}
+
 	return regulator_enable(at24->vcc_reg);
 }
 
-- 
2.18.0


