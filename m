Return-Path: <linux-i2c+bounces-12129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE444B19496
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 18:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A02F172807
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 16:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7043B1F2B88;
	Sun,  3 Aug 2025 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="wgo3jUvZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF08F1C84AB;
	Sun,  3 Aug 2025 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754240167; cv=none; b=mL8ik4Ik0DtvdX0teMXpPolgTBt22IqeXkDFWxcLxZhqggWG4a4rnX2oxQTz1dsn5qZqqcJu7NaNI3sSCpPasEXQWSPuVK9iLtQgpA9ejQ6hbu0amCzT9m6ujxBEvBy60udOJYEpOuuvSkWVSMw7tbRNrspxBLp3BwTysPMe6QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754240167; c=relaxed/simple;
	bh=Age11sHcgB0mkhSPalU1aHv3JmSrXv9AoOCMc2GPCL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVvGUu7Xy8i3R6K5jmw8VTJ2iiDptgze+QExwfbxIH2SXKQlG5EEonoKPmP3ZM4gsodgq3OeHiHn2+c7lhWXrjAEiDs/1kTxBzIwAbbdOZU4WDNpdvu0uqKph5OvRIj9DFhDW4qdQHkyaEcBGUVlmz+dvQ2TwIc1U1ZAjCiyubU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=wgo3jUvZ; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id D7FD8203A5;
	Sun,  3 Aug 2025 16:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754240163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mj+SQbgMiVuXLUs0BkAYEli0q0Swy751En7jGQHZNS0=;
	b=wgo3jUvZrPYWuAcfAubrfl5XKNZCV2LrO0MwRidfg4MahA//ELNY8H8vU0YoX5Nw+GlSM5
	+sTfN2fxRfmG/ABPWtmvN+hY5i7isPjLlx/BXqOiHgSd/NE9iWnP/jgy0uMSe3MfAy7nSQ
	PRL9FyS8w+iRG0dC3juLuyMZI4nETNI=
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 03 Aug 2025 18:54:40 +0200
Subject: [PATCH v2 3/4] i2c: rtl9300: Add missing count byte for SMBus
 Block Ops
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250803-i2c-rtl9300-multi-byte-v2-3-9b7b759fe2b6@narfation.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=sven@narfation.org;
 h=from:subject:message-id; bh=Age11sHcgB0mkhSPalU1aHv3JmSrXv9AoOCMc2GPCL4=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBn9U/qPLfv898Fjt193mqc80ZNwPXS9PcmrJHMDo869t
 37z1h526ChlYRDjYpAVU2TZcyX//Gb2t/Kfp308CjOHlQlkCAMXpwBMZHcRw//8RdfvPlr2h9vA
 Ijem3ZzBln9N0Hwmy4TPXFl6Ig9Wpn5mZFi42Sv68zKfw/MnTK+6vs4tZu6kleJFnk+3ye78Yzx
 VqYYTAA==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

The expected on-wire format of an SMBus Block Write is

  S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P

Everything starting from the Count byte is provided by the I2C subsystem in
the array data->block. But the driver was skipping the Count byte
(data->block[0]) when sending it to the RTL93xx I2C controller.

Only the actual data could be seen on the wire:

  S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P

This wire format is not SMBus Block Write compatible but matches the format
of an I2C Block Write. Simply adding the count byte to the buffer for the
I2C controller enough to fix the transmission.

This also affects read because the I2C controller must receive the count
byte + $count * data bytes.

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index a10e5e6e00075fabb8906d56f09f5b9141fbc06e..4e0844d97607f64386a6d7a7c4086a81fdd89d6c 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -284,15 +284,15 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
 		if (ret)
 			goto out_unlock;
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
+		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0] + 1);
 		if (ret)
 			goto out_unlock;
 		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
+			ret = rtl9300_i2c_write(i2c, &data->block[0], data->block[0] + 1);
 			if (ret)
 				goto out_unlock;
 		}
-		len = data->block[0];
+		len = data->block[0] + 1;
 		break;
 
 	default:

-- 
2.47.2


