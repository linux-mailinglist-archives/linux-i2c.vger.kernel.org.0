Return-Path: <linux-i2c+bounces-11554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4BAE40D6
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 14:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3316E188C0B8
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Jun 2025 12:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928B2246BB6;
	Mon, 23 Jun 2025 12:32:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3723C8CD;
	Mon, 23 Jun 2025 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681923; cv=none; b=cPtTStH+tnn3WVygt1b7JCbcdzzGJqt5Y0I7HdV8nRSKI1Nnb/fcpqBYyRca8bOmnK9KgLNeByS0dWoDYNsJg9+Bnnbr2cJvFv3S6wEQ00REjsD/3MoB1EYua5mvTKJMOu/ri9THtis8I+AqER/Zinw7VmRmjBgTXRi9XB5KuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681923; c=relaxed/simple;
	bh=+yIavYuUoDb5fbtcY4uwhTVxL25XvZ+UaOifJRTtT3A=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=LB+jW8zg1VxLxAR+3KbZOzQ4xkp9ANgxUkU2ZAoj9pgGLS2r3I7RqAGIyZ+bbTiL1o6QR8UjDB2fUG6LOv5hF1ukCRfs1XOJXtP8Btu9fozH8nz120WdGnE8wRE+ha0F0A50A62dUqvkoW++QhKSDKWsE763umpAqj5IzuF4ABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bQnWh4Mb7z4xPSq;
	Mon, 23 Jun 2025 20:31:44 +0800 (CST)
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 55NCVeuH048305;
	Mon, 23 Jun 2025 20:31:40 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid201;
	Mon, 23 Jun 2025 20:31:44 +0800 (CST)
Date: Mon, 23 Jun 2025 20:31:44 +0800 (CST)
X-Zmail-TransId: 2afb68594930fffffffff5f-67598
X-Mailer: Zmail v1.0
Message-ID: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <pierre-yves.mordret@foss.st.com>
Cc: <alain.volmat@foss.st.com>, <andi.shyti@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <fang.yumeng@zte.com.cn>
Subject: =?UTF-8?B?UEFUQ0hdIGkyYzogc3RtMzJmNzogVXNlIHN0cl9vbl9vZmYoKSBoZWxwZXI=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55NCVeuH048305
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68594930.002/4bQnWh4Mb7z4xPSq

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index e4aaeb2262d0..ef15475a7ee1 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -34,6 +34,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>

 #include "i2c-stm32.h"

@@ -722,7 +723,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
 		setup->rise_time, setup->fall_time);
 	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
-		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
+		str_on_off(i2c_dev->analog_filter), i2c_dev->dnf);

 	i2c_dev->bus_rate = setup->speed_freq;

-- 
2.25.1

