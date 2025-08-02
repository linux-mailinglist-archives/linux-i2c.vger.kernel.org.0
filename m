Return-Path: <linux-i2c+bounces-12115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81961B18E08
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 12:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A10117DBE8
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 10:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC42221FA8;
	Sat,  2 Aug 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="bTYHLmcv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8E21FF58;
	Sat,  2 Aug 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131347; cv=none; b=mt2adFPc/KKLs9K3yhRmvUQ3gGtEvDUWNQoj2ZGrohnyBFqEMy8eJMwmPM+5EwQsbmytyzirnoqKuqcLD6NoolGiiFiH55wIRxqu815e/lMK7D5ocgPhs/3y1gttzoyZYPprQo353GqDNS0kARJ2ZdxwrBYT/XdBDOqkQfSf6Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131347; c=relaxed/simple;
	bh=F3KerRZ9y/W49N23F2pnABpm9INuP0SzFFoSFXvVQe8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqTu1VHai2+CPoD/UcdSBX6Og0sqltrAMOv2F6GTN40JBYZL78KN0AHYnTdIlxLFaFJvkpTrKouMCqn7MOfgIcM1wf4rqLbP5dQ9ENeJpBugT+NULX5o6SqHjv6f3imFVR4V2gzXrZ0m9QAQ0LLZPWaHZOkqQWrPqP9eS6JiSsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=bTYHLmcv; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 8AFF221797;
	Sat,  2 Aug 2025 10:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754130742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vE4nYdNaGEuI8DSTuxgnHMbOZcw4cjvKH08OXaLl71o=;
	b=bTYHLmcvuCIn0yzd2AvjK0aEzvZYC9vDWxEScVQB3aAarkbJwqI/OBK1CuGVW95fOH1fnj
	YoGem1ooSIUmGutnZyc9hXi+BCXzyxdrBINmyCeMIMLumO5GfiNLgohw8CVhWITmFjFxcY
	dvvQ60jPl9E7bZbpBCN0gFCMLTOKYmk=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 02 Aug 2025 12:32:01 +0200
Subject: [PATCH 2/4] i2c: rtl9300: Increase timeout for transfer polling
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-i2c-rtl9300-multi-byte-v1-2-5f687e0098e2@narfation.org>
References: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
In-Reply-To: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
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
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBm9L00+2lx6G5TG0/tU+tPElUIzoo/7/vS4s9sj+1THw
 beWKbXMHaUsDGJcDLJiiix7ruSf38z+Vv7ztI9HYeawMoEMYeDiFICJfGhl+J+i+GWGvoH3JiPR
 1zfiLoeockqwrZHcGXJpcVBle5DlsTiG/3H6EWt7jRRLo2/m+Kybvci52XzZXU2TRPOb3nMuP/r
 zhgcA
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


