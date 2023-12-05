Return-Path: <linux-i2c+bounces-625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B962805E17
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 19:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7E18281FCC
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 18:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8033675D1;
	Tue,  5 Dec 2023 18:50:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
X-Greylist: delayed 1987 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Dec 2023 10:50:04 PST
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707A91B9
	for <linux-i2c@vger.kernel.org>; Tue,  5 Dec 2023 10:50:04 -0800 (PST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Sl7zC5K8Fz9v73;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUKY1q7eCGHR; Tue,  5 Dec 2023 19:16:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Sl7zC4X6Gz9v5V;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 96C7E8B773;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id f2il9A4FpS-m; Tue,  5 Dec 2023 19:16:55 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.2])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B9038B763;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jochen Friedrich <jochen@scram.de>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] i2c: cpm: Fix data type
Date: Tue,  5 Dec 2023 19:16:53 +0100
Message-ID: <de07101166ac0e4649cf3b57fdf960748c9ecc75.1701800124.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701800212; l=868; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=WhGGXCesc3p8fX5FLvMo9W+DZljJMoaQOdx79BxmRAk=; b=CO4bglnbxMhv39ca95NrPFU+DicQ93LONILMMJSk1kQxgbYmqOh6QAP0Mm3kXXNLe4Dfpp2mC D9aDnUklKRdAINE9l6YcvMvR+rg0voOvTrYfQ0hpNGXW1TLJYn4MOo7
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

sparse reports an error on some data that gets converted from be32.

That's because that data is typed u32 instead of __be32.

Fix it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@intel.com/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/i2c/busses/i2c-cpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 9a664abf734d..077be367b382 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -634,7 +634,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
 {
 	int result, len;
 	struct cpm_i2c *cpm;
-	const u32 *data;
+	const __be32 *data;
 
 	cpm = kzalloc(sizeof(struct cpm_i2c), GFP_KERNEL);
 	if (!cpm)
-- 
2.41.0


