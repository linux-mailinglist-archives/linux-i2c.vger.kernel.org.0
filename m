Return-Path: <linux-i2c+bounces-5962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D940966410
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 16:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23BA31F228C4
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 14:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24651B14F4;
	Fri, 30 Aug 2024 14:21:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF7016DC3D;
	Fri, 30 Aug 2024 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027710; cv=none; b=MIUABOX9tncjfB75cXzYOBmEXEiI/2myw+h1iABSNY//KM91mH2l2VHFQOhvERuCP20mO6LajkwLWmcZ4fZiZW4r4kfXUVve69JSfxWH9RNFc8fHCGRaWibjdjfTOdj06YGJpouJD5LNUSFmc7OiigFOIa4yE0Ib7LWsQ9yw3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027710; c=relaxed/simple;
	bh=DyslVVNIQCH2NnPK8gzfdSckWIu44uWKjdzsdrAth5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jzchrd/echE7yYRxoajkscUEoIl1iyOMnmtI+Fkzt2lEELjWmiChXHGRRClowNoh0qSFOpArD0/ksl1k+wa+BxEM44HXS9H/FhlIZZpmamazLJ4MfibrIigRtgjChrIC+7MKJ7OAGg+Mb5OE2Q4fpu0S5kHzs4gbM9GwATtqaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowADHcEBu1dFmz5R+Cw--.3389S2;
	Fri, 30 Aug 2024 22:21:36 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: jochen@scram.de,
	andi.shyti@kernel.org,
	grant.likely@linaro.org,
	thierry.reding@gmail.com,
	rob.herring@calxeda.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] of/irq: handle irq_of_parse_and_map() errors
Date: Fri, 30 Aug 2024 22:21:27 +0800
Message-Id: <20240830142127.3446406-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHcEBu1dFmz5R+Cw--.3389S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWfuF17Kr4DCr4kuFWktFb_yoWfArgEgw
	1kXa9xArWUGFnxXw15AFWfZry5KFy8WF1kAF1vvr9xC34DWw17JF1DZrn3JrsrXry3KFyq
	9w1qvF4S9wnrJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Zero and negative number is not a valid IRQ for in-kernel code and the
irq_of_parse_and_map() function returns zero on error.  So this check for
valid IRQs should only accept values > 0.

Cc: stable@vger.kernel.org
Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-cpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 4794ec066eb0..41e3c95c0ef7 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
 	init_waitqueue_head(&cpm->i2c_wait);
 
 	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
-	if (!cpm->irq)
+	if (cpm->irq <= 0)
 		return -EINVAL;
 
 	/* Install interrupt handler. */
-- 
2.25.1


