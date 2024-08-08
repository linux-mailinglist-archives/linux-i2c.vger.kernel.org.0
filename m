Return-Path: <linux-i2c+bounces-5203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B73194B440
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 02:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957CF1C2168E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 00:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FED31854;
	Thu,  8 Aug 2024 00:37:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 4.mo576.mail-out.ovh.net (4.mo576.mail-out.ovh.net [46.105.42.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D610E9
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 00:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.42.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723077458; cv=none; b=YiRbEYjqfKxc9km0cfUIBp5T1GEIRRp5cmcVKNeV8xnFuXiS3Ux3Lz9awxVk0Vii+demQsvD2lKEzn6y5U+vnqlgn41ZT/tk7c9m0yS2he+0GEokCm/Ijm0TDr9rDfxu2LNZHD1lKwumJpXMWOmJ5tylcUS97gwtIdsi1jyROeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723077458; c=relaxed/simple;
	bh=SnPk3QhAIzjNKWO2Eu/N5v9n46nDuaWe43tkk78Up5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mlDuTibrII6qmStueRcgG2iA7wixwn57h3BkZQzLuZbLd3mCce1/h8ey3zEc2Mtk16s7Y4Ot5cyxf0dvAwDOSKB2VsuWM6j5H2QlNPk0C3RpT/J8MV37BDtUshHFjc65WF9QiNGeWt6oSjadMiYBLEos3ht8tzehWR4v0SL4k70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.42.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director3.ghost.mail-out.ovh.net (unknown [10.109.140.207])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4WfRys42y9z1l0G
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 00:01:09 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9m2mh (unknown [10.108.42.201])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 953431FD81;
	Thu,  8 Aug 2024 00:01:07 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-6684bf9d7b-9m2mh with ESMTPSA
	id 8kTyHMMKtGY/AAAA32q8FA
	(envelope-from <andi@etezian.org>); Thu, 08 Aug 2024 00:01:07 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R002011a478f-d7c4-43ae-b8f4-0e3b6c6d554d,
                    88A7488BC2B5C520756C4D4752F6EF18246B9C4F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:194.230.144.229
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH] i2c: ljca: Remove unused "target_addr" parameter
Date: Thu,  8 Aug 2024 01:00:41 +0100
Message-ID: <20240808000042.110722-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 776026515040766680
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrledugddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuieehfeetudejhfehleeijedvveetleefhfehuedtleektdevjedujefgvdenucfkphepuddvjedrtddrtddruddpudelgedrvdeftddrudeggedrvddvledpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth

The stop command doesn't use any address on the target:

  w_packet->data[0] = 0;

and indeed the targed_addr parameter was unused. Remove it.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Wentong Wu <wentong.wu@intel.com>
---
 drivers/i2c/busses/i2c-ljca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
index 0b70621cf9d33..1dc516ef0fddc 100644
--- a/drivers/i2c/busses/i2c-ljca.c
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -107,7 +107,7 @@ static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 target_addr,
 	return 0;
 }
 
-static void ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 target_addr)
+static void ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c)
 {
 	struct ljca_i2c_rw_packet *w_packet =
 			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
@@ -178,7 +178,7 @@ static int ljca_i2c_read(struct ljca_i2c_dev *ljca_i2c, u8 target_addr, u8 *data
 	if (!ret)
 		ret = ljca_i2c_pure_read(ljca_i2c, data, len);
 
-	ljca_i2c_stop(ljca_i2c, target_addr);
+	ljca_i2c_stop(ljca_i2c);
 
 	return ret;
 }
@@ -222,7 +222,7 @@ static int ljca_i2c_write(struct ljca_i2c_dev *ljca_i2c, u8 target_addr,
 	if (!ret)
 		ret = ljca_i2c_pure_write(ljca_i2c, data, len);
 
-	ljca_i2c_stop(ljca_i2c, target_addr);
+	ljca_i2c_stop(ljca_i2c);
 
 	return ret;
 }
-- 
2.45.2


