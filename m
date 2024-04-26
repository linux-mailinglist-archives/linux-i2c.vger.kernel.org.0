Return-Path: <linux-i2c+bounces-3208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860A8B354A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 12:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 251BA281D87
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 10:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1043CF7E;
	Fri, 26 Apr 2024 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JfZE6SOC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047CD22EF3;
	Fri, 26 Apr 2024 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714127446; cv=none; b=b2SN1muJMJKRVggfCLCmGkEvLv090iudw4Z+NyRz8CtN0ex9bV5NtXVsZb/GDXjL38Tfdo2x9ZypBpesICCAjX+IJcyFR5yV/kDTQ9vAClPkuMmblt7o7/3gTAqjhaE6mFgHnJBJP53ZIamLvD0Ffh3O2ORcdzHDdL1nj6HglAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714127446; c=relaxed/simple;
	bh=v+t5bZw042jT+83+DUJVny8pGZvNjBYmOMRWTQuLEmw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OrePePdbjvvECNDHQhDRUkmOfRXgjNKkRki/ZczD9UAN1s1F25F2eYsr0OqBodpa4H/vnTuA08SfsrJaDQ645VaTd+xBYD8CXGTuto12ncec/sdrCECLN35/uuZz7yICtX5AwlLdwnYI45h5lmY+cjmooqEi2WqUaDg2zZMatDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JfZE6SOC; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 01d2d5c203b811ef8065b7b53f7091ad-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dSGdt/YP0pn5OYZbXUps2DQLIzyfXIN6TaOwb/bKnjo=;
	b=JfZE6SOCo060us+za4J16bkEJ/BTONjcOm0BdxV25F+hG2anqgm4GMl/SiLYOz6yf0g0AwfpJmglB7aWFiaSOnYmKo6iih0spaxXRNDtNqwel+TY4A72ht0tURHJM27E7zXsUb6OtvM7EAX5SUKPKABgnrB1WNiQcEWd58AmMFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:9eba6abf-1252-444d-a776-01876db1e53b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:f4ffa686-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 01d2d5c203b811ef8065b7b53f7091ad-20240426
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2038035156; Fri, 26 Apr 2024 18:30:31 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 18:30:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 18:30:27 +0800
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
Subject: [PATCH 0/3] misc: eeprom: at24: add optional dovdd-supply
Date: Fri, 26 Apr 2024 18:29:46 +0800
Message-ID: <20240426102949.23057-1-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.653500-8.000000
X-TMASE-MatchedRID: zPbgMRNMPUIPRVepDWIjxxD3+0w1DhqKesw8RnBRGwqnu6NUK/CwU2b6
	PphVtfZg4wnhOb+JR+SAMuqetGVetoNN9wL55jx9avP8b9lJtWr6C0ePs7A07ba607moR85Rkgq
	5jgyZRjszmwK46+sH2/UDtowQUy5ThuiMkvhUpQKnnGGwTleFAYHxPhxAE7+423fkiP1eoF7QTV
	WQjdvkmFQhow/v76bfSZrfNhP3sgUBh9AgBSEFrJm+YJspVvj2xkvrHlT8euI+kK598Yf3Mg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.653500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	2D068EC681F9A6DED320B7EA3985D1198E0A78F979A7F01D222C99C83C5170892000:8

From: Zoie Lin <zoie.lin@mediatek.com>

Based on tag: next-20240426, linux-next/master

v1:
Add support for the dovdd regulator, which supplies an
additional power source to the EEPROM.

Zoie Lin (3):
  misc: eeprom: at24: add optional dovdd-supply
  dt-bindings: eeprom: at24: Add support for at24c64
  dt-bindings: eeprom: at24: Add property dovdd-supply

 .../devicetree/bindings/eeprom/at24.yaml      |  6 +++
 drivers/misc/eeprom/at24.c                    | 37 ++++++++++++++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.18.0


