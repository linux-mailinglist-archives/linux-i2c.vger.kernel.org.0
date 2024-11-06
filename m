Return-Path: <linux-i2c+bounces-7841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7F9BEC51
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 14:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FE34B2567F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 13:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6393C1FB893;
	Wed,  6 Nov 2024 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HrN2wRyS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6B11FB891;
	Wed,  6 Nov 2024 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730897667; cv=none; b=toGs6ElVm4VK7GxY78LAbQ/+2IooSScF90WCEWYKJEfaMMeEtSE2AX1q3QqWYdDanxzhmpO8VQUVc99MPL7sc7gfnZ/9Xvp6WUHBBFr97isvRB0Qkl9kXhbI13OYtk5/8aIVhMcIGRv5iX98zUFiQ0GN3N0VChoaDl0RM1qUe50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730897667; c=relaxed/simple;
	bh=lkxv6wMPzIk+Q2dOS9GMqa+Rkj5Q9zLdFls5XSUwg40=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HcWjcDGFVywtYIiyWzfppueaGmdJFi07UBivi9+19kFp/yamoOg4HrAWVIxMZLucQueSShwt0gOUN5mRlw0K7Z9CKwq383bXHB1LbyHxCE8GpEeJliDNcb7IWzUwUdIhnGrssmjMOqUyG9nP/r/vI4ZnCVe8NN8KFzaX/UVUa9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HrN2wRyS; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3891e7789c3e11efbd192953cf12861f-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VNbbyybsVA/llgCiGv5B8aYzpYH2qcy9VUJy2qkKAvI=;
	b=HrN2wRySArCax9B4WRxPC50Y0jYLn4tFx8FR9eemNVCTzDrsKEdWOaNGaMZOnBIF4BuIMVzXomXGficksnXh5rB1kCCF68MtFXW4C3nSuYckrlkhJdWKbg7bxaiqbEqnSAKGYUhd9r2xZSHwHbSUF7AzmMoADlYzEBccb+2Enpg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:890f13e5-24e3-4fdf-b398-faac3b039d95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:2f948122-a4fe-4046-b5be-d3379e31a9ef,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3891e7789c3e11efbd192953cf12861f-20241106
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1855440004; Wed, 06 Nov 2024 20:54:12 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 20:54:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 20:54:09 +0800
From: Zoie Lin <zoie.lin@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, Zoie Lin <zoie.lin@mediatek.com>
Subject: [v2,0/1] i2c: mediatek: add runtime PM operations and bus regulator control
Date: Wed, 6 Nov 2024 20:52:11 +0800
Message-ID: <20241106125212.27362-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.028600-8.000000
X-TMASE-MatchedRID: jUWJaIY8sEkfbciQjfRltRC41kTKJMKFYoHH/gi0K9v8rSaNLblw6nWC
	d6QvVzbeE1RLTRi8AtKQYj0iYjwwnf16VZJq9bHXM8XTtgUzttN9LQinZ4QefCP/VFuTOXUT3n8
	eBZjGmUzkwjHXXC/4I8prJP8FBOIaQDrrEUSMSmZGNW3Yd29bnG18/yTfVZRoc/Od1SdTsJ9Xz+
	9mseNN8R4L76ik4lwFRyQrl51F0DySbb/RKI1CTBxYxYG29kEALeu9/Cix+Fl0BNB20+SxH7f8m
	JY57oZddJaBDYald1lvF9+X2GEIHA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.028600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	0CA8BD2969729531D72666269D686E64A92A1F7F1D4AD7EFAB7583DA1ADD897F2000:8

This series is based on linux-next, tag: next-20241105

Changes in v2:
- author name modification
- replacement of pm runtime API
- removal of redundant error messages
- return value adjustment
- add runtime pm status check

The delay before runtime_put_autosuspend() actually executes 
mtk_i2c_runtime_suspend() depends on the frequency of I2C usage by the 
devices attached to this bus. A 1000ms delay is a balanced value for 
latency and power metrics based on the MTK platform.

Zoie Lin (1):
  i2c: mediatek: add runtime PM operations and bus regulator control

 drivers/i2c/busses/i2c-mt65xx.c | 77 ++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 12 deletions(-)

-- 
2.45.2


