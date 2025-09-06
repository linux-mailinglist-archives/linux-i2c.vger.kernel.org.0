Return-Path: <linux-i2c+bounces-12702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FFDB46A23
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 10:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5068F1BC508A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 08:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01C62C2346;
	Sat,  6 Sep 2025 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qNVXZvC0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC611F8733;
	Sat,  6 Sep 2025 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757147246; cv=none; b=hzhAOvOJGXwwupsF4uyrO8jhrUZUHp3+p9soRIFri3KCXkHfkQ/FV6f9/IA2jvpwTdtxffnQx0IEeWZALI3BOfo3mRlszBGE+ksQ9Im5+5zXoYIbinxBNuJrocuL4/vUgD+t7bB/2xi5lhsCWkt6VSXbmu2S6X4u91+5oAnDhcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757147246; c=relaxed/simple;
	bh=4rnBUnpe1ZWJMNFH4xcCasuu0zccA/nk5Ebl74pkTc4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nAVIEfO9atREM7Aj120Zk3jk+QdHKiX1fuudl0NmBNTKcXOTye8FUBv8TE92JaJfD2E/Kd5lsIyZ5YhbyKAYe89umtAASvOOywg57MWiZz0QKkcWFCv3KGEkMUVwUdd8L2JBbpMMqHgaYUw3TtxIzEd8QPcFgCutaKRKE5RlvwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qNVXZvC0; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 49f796aa8afb11f0b33aeb1e7f16c2b6-20250906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fmDWsVkai/q4C56ASj6lcem4C4j2R2eauit2Llq4efY=;
	b=qNVXZvC05+n+ENbmO7iJj2TCfzlLDLclUMA98jAN7EIgo/AxMPRMow4jl/Xjw2AEBoBAdBRxrdrOuCzPUHAXNL+uxaRUxeRyANnyBTZOQOWyvFjSoxXYIwNc8cX3WxtQUpCw19qjO4mQQODenC7kcEq6khvpGebdOkYMdbcWiRA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:22949bc1-d572-451e-b0f0-b190d0fdc248,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:ffc401f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 49f796aa8afb11f0b33aeb1e7f16c2b6-20250906
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <leilk.liu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1774036271; Sat, 06 Sep 2025 16:27:13 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 6 Sep 2025 16:27:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 6 Sep 2025 16:27:10 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>, "Liguo
 Zhang" <liguo.zhang@mediatek.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Leilk.Liu
	<leilk.liu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2] i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
Date: Sat, 6 Sep 2025 16:24:06 +0800
Message-ID: <20250906082652.16864-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

From: "Leilk.Liu" <leilk.liu@mediatek.com>

The old IC does not support the I2C_MASTER_WRRD (write-then-read)
function, but the current code’s handling of i2c->auto_restart may
potentially lead to entering the I2C_MASTER_WRRD software flow,
resulting in unexpected bugs.

Instead of repurposing the auto_restart flag, add a separate flag
to signal I2C_MASTER_WRRD operations.

Also fix handling of msgs. If the operation (i2c->op) is
I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
For all other operations, msgs is simply incremented by 1.

Fixes: b2ed11e224a2 ("I2C: mediatek: Add driver for MediaTek MT8173 I2C controller")
Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>
Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes in v2:
 - modify the commit which introduce this issue.
---
 drivers/i2c/busses/i2c-mt65xx.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index ab456c3717db..dee40704825c 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 {
 	int ret;
 	int left_num = num;
+	bool write_then_read_en = false;
 	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
 
 	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
@@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M_RD) &&
 		    msgs[0].addr == msgs[1].addr) {
 			i2c->auto_restart = 0;
+			write_then_read_en = true;
 		}
 	}
 
@@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		else
 			i2c->op = I2C_MASTER_WR;
 
-		if (!i2c->auto_restart) {
-			if (num > 1) {
-				/* combined two messages into one transaction */
-				i2c->op = I2C_MASTER_WRRD;
-				left_num--;
-			}
+		if (write_then_read_en) {
+			/* combined two messages into one transaction */
+			i2c->op = I2C_MASTER_WRRD;
+			left_num--;
 		}
 
 		/* always use DMA mode. */
@@ -1293,7 +1293,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		if (ret < 0)
 			goto err_exit;
 
-		msgs++;
+		if (i2c->op == I2C_MASTER_WRRD)
+			msgs += 2;
+		else
+			msgs++;
 	}
 	/* the return value is number of executed messages */
 	ret = num;
-- 
2.46.0


