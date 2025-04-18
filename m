Return-Path: <linux-i2c+bounces-10490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFB1A9403F
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 01:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4AD146250F
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D043253B78;
	Fri, 18 Apr 2025 23:11:49 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo576.mail-out.ovh.net (5.mo576.mail-out.ovh.net [46.105.43.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412DF2528EA
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 23:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.43.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017909; cv=none; b=a4Lg7p4jdYvslBZ7imVrTH26hQougsGKGwZ5BeLf7hqWe3gQVT4MGuINoB+g/iRjMvhEr88ZQpFuewXUzqg2iQlr0fbWs64TDOZ1iPpgXl+3tXICVgCer8JYFConm4pjH9tR1m1pE7hbAlZZg+zhxMXfH540+mZCRG1jHXSvsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017909; c=relaxed/simple;
	bh=UUC14YA2YoslkTd/j1Cp9LplFvbFq7GvXbWEK2zzazI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKhHzuDYjfctDzBFEKmmIjALpVYBiOYaOlxQsSL8i+yrbfdaMCNJCmPgHZ1qt5fisASM/P7Q32hTIE9E5i9/7asTOrNBDDSSQsNVvg3CTxdtqY+ZtZVl8Nul4MPTaSraphch/jLNTNhhPjeqBSIla5P14aRWt2k/1/cZg1HHiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.43.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.140.151])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJ819hbz1vQy
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:56 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-bt6hd (unknown [10.110.113.47])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DDB871FD1E;
	Fri, 18 Apr 2025 21:16:55 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-5b5ff79f4f-bt6hd with ESMTPSA
	id 1qWOLUfBAmi89gMAyP1w0w
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:55 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S00112209747-3b9d-48bb-b4f7-df806b7bbc97,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 05/10] i2c: iproc: Remove stray blank line in slave ISR
Date: Fri, 18 Apr 2025 23:16:30 +0200
Message-ID: <20250418211635.2666234-6-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13927381848306420295
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeeimgdpmhhouggvpehsmhhtphhouhht

Drop an unnecessary blank line in bcm_iproc_i2c_slave_isr().

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 3e76120c23ab..44083698121a 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -438,7 +438,6 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 	u32 val;
 	u8 value;
 
-
 	if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
 		iproc_i2c->tx_underrun++;
 		if (iproc_i2c->tx_underrun == 1)
-- 
2.49.0


