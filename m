Return-Path: <linux-i2c+bounces-4511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B491D8C4
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 09:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78EFC2814D4
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 07:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377476EB5B;
	Mon,  1 Jul 2024 07:16:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00F55464A;
	Mon,  1 Jul 2024 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719818218; cv=none; b=hUc90mRpbI7LJYLaRODjChs5rHAPiFTvlX36H2PNCjmx6Qr/5BOuRbm6lT13Dgf7zwQE1kBLpyqQPyCR8UH4ldzu3OivV+1zgS4v+MjAt+JqGKfRd1nfFgXF8bGc4MZaVaECJVY3wau3MSE6R6b7LvLnps5MKMDSH1/+lSz+kcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719818218; c=relaxed/simple;
	bh=zlluTheCyHfShn2ewvSn9O/CSKkIhuJsaHObnf+LQP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=boC1OEQ8J7ikyPXS60tyWndn+8ILnXKnDou1dOGc7tbaW81pjjDUbT+Fvds6xSutygQttks8R34wc39fqllPggWl+2fspohqRQ6aDWusPM/EXpGtN9hnAJ9poteqrCU//4sKLaAuvqdXcIV0QOjaQvjl/m9stQFTt8DFl28J5Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADnuSHfV4JmfszvAA--.62197S2;
	Mon, 01 Jul 2024 15:16:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gupt21@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	Jonathan.Cameron@huawei.com,
	matt@ranostay.sg
Cc: linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] HID: mcp2221: Remove unneeded semicolon
Date: Mon,  1 Jul 2024 15:16:39 +0800
Message-Id: <20240701071639.846169-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnuSHfV4JmfszvAA--.62197S2
X-Coremail-Antispam: 1UD129KBjvdXoWrXrWxAFWxGr1ktw1xCFyxAFb_yoWxXFc_Cw
	n8WFnrXr1UJr92v3WDA34fZrWYya18Wa1xuF1Iyr45tFy2qFy3JryFvrs5Jw4UG34jgFyf
	J3ykJr4Fyrn3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4x
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU10tC7UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unneeded semicolon.
This is detected by coccinelle.

Fixes: 960f9df7c620 ("HID: mcp2221: add ADC/DAC support via iio subsystem")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index da5ea5a23b08..0f93c22a479f 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -1048,7 +1048,7 @@ static int mcp_iio_channels(struct mcp2221 *mcp)
 			break;
 		default:
 			continue;
-		};
+		}
 
 		chan->type = IIO_VOLTAGE;
 		chan->indexed = 1;
-- 
2.25.1


