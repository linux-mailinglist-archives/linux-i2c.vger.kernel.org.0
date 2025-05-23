Return-Path: <linux-i2c+bounces-11117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9340AC1CD6
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 08:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C443B296C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 06:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7C318FC86;
	Fri, 23 May 2025 06:17:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51D2DCBEA;
	Fri, 23 May 2025 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747981027; cv=none; b=Mt327dss2NmXTpM8w4WQzWjWc/zZ+RqTLWg8wxsXKv44AhxhSpzloKKntpxgy7kJhnmZw9LP9RLRITKD0BQSG6c6aMCcT3tFVLltQf0421c3grSSggaD+vqQs+nhBtZJzuvHwRpJ1GPK8rsn3hyVjxC/rzwWtB50cd5Gp5M0zHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747981027; c=relaxed/simple;
	bh=Fk+7wOad/ajMAghLzzmUTQUL2QeW7IGagkLYpXsM1o0=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=JnRWk8DpjTO7VSnXEKMf8Pn/tR6w21DifTGJCQqKH4BSQZevDhrXKM/KLToSR80WeeqGVffijWjSU06q3xILqQz+3VCjFbbYKZhWqFUFzlLzzhXG/rp3M/yxLOubKemhCdMt1Fry8dTnzEPhwMXcDhZ1u39zouaOnL2pVmKbEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b3ZgS2Yxlz4x5pd;
	Fri, 23 May 2025 14:16:52 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl1.zte.com.cn with SMTP id 54N6GifQ010301;
	Fri, 23 May 2025 14:16:44 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid201;
	Fri, 23 May 2025 14:16:47 +0800 (CST)
Date: Fri, 23 May 2025 14:16:47 +0800 (CST)
X-Zmail-TransId: 2afd683012cfffffffffe09-86aef
X-Mailer: Zmail v1.0
Message-ID: <20250523141647052h8sceSvH_KRJYFgqd6iuJ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <codrin.ciubotariu@microchip.com>
Cc: <andi.shyti@kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
        <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <mou.yi@zte.com.cn>,
        <xu.lifeng1@zte.com.cn>, <fang.yumeng@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IGF0OTE6IFVzZSBzdHJfcmVhZF93cml0ZSgpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54N6GifQ010301
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 683012D4.003/4b3ZgS2Yxlz4x5pd

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
---
 drivers/i2c/busses/i2c-at91-master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index ee3b469ddfb9..374fc50bb205 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>

 #include "i2c-at91.h"

@@ -523,7 +524,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	 */

 	dev_dbg(dev->dev, "transfer: %s %zu bytes.\n",
-		(dev->msg->flags & I2C_M_RD) ? "read" : "write", dev->buf_len);
+		str_read_write(dev->msg->flags & I2C_M_RD), dev->buf_len);

 	reinit_completion(&dev->cmd_complete);
 	dev->transfer_status = 0;
-- 
2.25.1

