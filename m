Return-Path: <linux-i2c+bounces-6902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC097D6F7
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 692711F2364E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 14:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6829B17BB33;
	Fri, 20 Sep 2024 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IM01aydt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CC16FB6;
	Fri, 20 Sep 2024 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726843016; cv=none; b=HeRyXRW1rfaJjoAW7anCHHGsXfKdFmZR/aSCb85kGyzCOM60gucXzxm97b1332FNHbQdse3dfs57WE8Km1HMVtOqSUjcqgbH95WPwib/B8+6iO30SP122YIhDEgACNZ7/uDSJuagZguJCqvApX/msgJ5VM/ezkGpB7l/GjhaMHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726843016; c=relaxed/simple;
	bh=88CnwlllLn8RPyaeUAWKWxLIUfQHqZ9ykAnp4Fy+FPU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DR9BPGkEmBNpaX3yaVhFBKGjTcoOeBW0V38F5l36TTfW4+4O/vshIJpIo8wMfGQqado7se2oQDKMXYp3cO4TywcCqpNGlUADNQcC2PYop8lpnIJqvTl23I5xb+fyL39FlNN/yjABzdGwYNHbz1hPnj3I/5o21PZi5vRADA4sOMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IM01aydt; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c52ca3ea775d11ef8b96093e013ec31c-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EWJ4udSgDoEgGrmmpQfYFCOlGYKVyE5VZGKmkzitpGE=;
	b=IM01aydt9hh2yi+B65iFasFiqzUedV21ZZofGT5zPYvWPURdffxL/TRlSZqOAmOJuLpxlY00WZWzUx2Jr4rxhbh38T0T+G26BHSzqwymUIy7XEufvjSK0fbm0iuXk9rxs5YTyZsqiWDm3C401FAWiKIBborbVV4CMxBACs6s5Eg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:013842bc-5e5e-48de-969a-e74dcc702a36,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:d6d1ff17-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c52ca3ea775d11ef8b96093e013ec31c-20240920
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 437195700; Fri, 20 Sep 2024 22:36:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 22:36:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 22:36:48 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	zoie.lin <zoie.lin@mediatek.com>
Subject: [v1,0/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Fri, 20 Sep 2024 22:36:26 +0800
Message-ID: <20240920143627.23811-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

This series is based on linux-next, tag: next-20240919

This series adds support for runtime PM operations and bus regulator control 
in the MediaTek i2c driver. The changes include the implementation of runtime 
PM operations and the integration of bus regulator control to manage bus power.

zoie.lin (1):
  i2c: mediatek: add runtime PM operations and bus regulator control

 drivers/i2c/busses/i2c-mt65xx.c | 72 ++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 11 deletions(-)

-- 
2.45.2


