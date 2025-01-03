Return-Path: <linux-i2c+bounces-8897-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF511A00A90
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 15:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BED8163604
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 14:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE801F9A9F;
	Fri,  3 Jan 2025 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mLBMOF9U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CF817BA3;
	Fri,  3 Jan 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735914788; cv=none; b=OGm12MQQGeIl/m/XrTJ04CImgl4DRHcUbv5jtwe68lXqgdM9VheTliMGmRQw54WgiAPmyqHKOItXTgWcD6TUlqPCdLGZbhGDhqasFz8yAFtwFiKs1zj5MV9mr9iPAkkgwo83/X2+7r68TlOJsyM90JT/HAZ2wSEQAi82ZSKwHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735914788; c=relaxed/simple;
	bh=h2Nn3GF9KZUuU5alzrK56oNOp5RzdQ2U5qDMSU/NfiM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iI6qYHH/W3UhJqrqyBKQkhufyIzPlYdY1TneQXih600FmmJiU72Kzkw2t1L78iatGjtAKyAXtLfo6fJU4SPGFZVxATDpOJJAxO/HiSLoUbTGD/OfvBePgqrmDyKwsplnXBSWq/+COajVlh2b0taoilmiaI3BejZtKTOEpxK6hjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mLBMOF9U; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a234adf4c9df11efbd192953cf12861f-20250103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+lD2AGoQOHJQMuemO8ngx0dfjm8w9IA4HJonYCdc9Yw=;
	b=mLBMOF9UcTNKb6FYPHk5+X8ic1FLWUjd4OGPBRVF3FdQmDbeCi+sBAHq9JMzVgGSB3oN0iztnYOxH4lgY95mM/ScRlAB5j6aNCsTzwz6HSG6gQmv0JSIXac/iOKVLdzXiksiOkxBhzNZ6p3uwY336e3KgalBeZTMXUcQwInL0VY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:cd68c8a6-3872-4b6d-a231-17e18ce4d331,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:22e74a19-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a234adf4c9df11efbd192953cf12861f-20250103
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2122713076; Fri, 03 Jan 2025 22:33:00 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 22:32:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 22:32:59 +0800
From: Zoie Lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<teddy.chen@mediatek.com>, Zoie Lin <zoie.lin@mediatek.com>
Subject: [v3,0/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Fri, 3 Jan 2025 22:32:33 +0800
Message-ID: <20250103143250.1521287-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series is based on linux-next, tag: next-20241220

Changes in v3:

This patch removes the autosuspend functionality from the runtime 
PM operations in the I2C driver. These changes have been tested on 
the target platform and confirmed to work correctly without the 
autosuspend functionality.

Additionally, the patch resumes the I2C bus in mtk_i2c_resume_noirq() 
to fix the unbalanced disable issue.


Zoie Lin (1):
  i2c: mediatek: add runtime PM operations and bus regulator control

 drivers/i2c/busses/i2c-mt65xx.c | 75 +++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 12 deletions(-)

-- 
2.45.2


