Return-Path: <linux-i2c+bounces-12127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8381DB1948E
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 18:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 382733B74E5
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 16:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171431E1DFC;
	Sun,  3 Aug 2025 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="ruOiMBAL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF1E1DDA0E;
	Sun,  3 Aug 2025 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754240162; cv=none; b=QLU3MwACUUIAxCQqCF8Wk8p86LlIqeSL8fD+iC0tRRULH3frMDiKM+jOB78BsWt+vRr2t5TMRDx6zqgQHcERsBDWSVIPMxDd2LM8kuK0SxTttSPku2ibPuXx0GxFI1SRL+WT9P9ojgQAkpAxpRAAf7kvGVCB58eLBLILh916r2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754240162; c=relaxed/simple;
	bh=F3KerRZ9y/W49N23F2pnABpm9INuP0SzFFoSFXvVQe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpRdm6p2F4teSOT1q1ea4uQb4eDH5V5kp5sxfEqGMyNYX8G1S3c5VIqVM5jYsmzcduxeKxFgHkL9VcsE1LWOW0JBBLGL1aBg9i+TV+rlTmfrIiIrrQJZIM4an3sSe8OB8ji0ak3URJKedmP6mN9ekNvZcBuIeZ/AMxkhxUb9qXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=ruOiMBAL; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 366E921029;
	Sun,  3 Aug 2025 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754240159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vE4nYdNaGEuI8DSTuxgnHMbOZcw4cjvKH08OXaLl71o=;
	b=ruOiMBAL7WajnkXtz+O2R/wk3p7OHU9g26aBlLUCevjWsuZigTTt1CG6ua0H/amPzde0A3
	Sus4YXye9CHQww/thmTvzVgZxf0V3fjJIXmtXAlUsAoz6/FdzNT5OudlpNCeWmnU4HR8C7
	pikNQ2l/4lmpEiLrrqDRW/TldZfnPIw=
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 03 Aug 2025 18:54:39 +0200
Subject: [PATCH v2 2/4] i2c: rtl9300: Increase timeout for transfer polling
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250803-i2c-rtl9300-multi-byte-v2-2-9b7b759fe2b6@narfation.org>
References: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
In-Reply-To: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1704; i=sven@narfation.org;
 h=from:subject:message-id; bh=F3KerRZ9y/W49N23F2pnABpm9INuP0SzFFoSFXvVQe8=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBn9U/qPy4cFFYUEL/mlnqZu+tEjuSh3u66n9voEq8qna
 nLills7SlgYxLgYZMUUWfZcyT+/mf2t/OdpH4/CzGFlAhnCwMUpABMp8WT4KmP8Ojz+hvtef8EL
 c7PKZq7y3FfHlLiq/O33rccOfgvWYGQ4u35f5+TFh26maYotbL8femjCFccMj5j+zGM+80Q6mVt
 ZAA==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

The timeout for transfers was only set to 2ms. Because of this relatively
low limit, 12-byte read operations to the frontend MCU of a RTL8239 POE PSE
chip cluster was consistently resulting in a timeout.

The original OpenWrt downstream driver [1] was not using any timeout limit
at all. This is also possible by setting the timeout_us parameter of
regmap_read_poll_timeout() to 0. But since the driver currently is
implements the ETIMEDOUT error, it is more sensible to increase the timeout
in such a way that the communication with the (quite common) Realtek
I2C-connected POE management solution is possible.

[1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/realtek/files-6.12/drivers/i2c/busses/i2c-rtl9300.c;h=c4d973195ef39dc56d6207e665d279745525fcac#l202

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 1b3cbe3ea84a4fa480c5c00438eecc551d047348..a10e5e6e00075fabb8906d56f09f5b9141fbc06e 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -178,7 +178,7 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 		return ret;
 
 	ret = regmap_read_poll_timeout(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1,
-				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 2000);
+				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 100000);
 	if (ret)
 		return ret;
 

-- 
2.47.2


