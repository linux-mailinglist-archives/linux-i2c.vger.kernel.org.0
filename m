Return-Path: <linux-i2c+bounces-12148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA1B1A978
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 21:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6546623442
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 19:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2892290BCD;
	Mon,  4 Aug 2025 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="IMyRnzZJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F79928FAA7;
	Mon,  4 Aug 2025 19:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335087; cv=none; b=M2ni/M2sBcPCDS2pbu3iJYyDdON4b71eJKxcEgotj5Rjydfao7wDaC0sZrKPyce3OZOW+W3L46gletsQPH7+KA2SzLR8/rncETo49O7Qpr3p8lMH2UrXUYx7sIpVEeaAnPjZ85yPaAgZCE/zEDbQVVTezwh0UsedaK2WHzLczgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335087; c=relaxed/simple;
	bh=rfjnSZM5LDZLCKkk3DIvlsIirLOIa+aP9kL7m+7VmW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THWx6vPQGEJrZsppX3E+mIBJqCepZf6IVacOdpAobcdKW8u2IQQHZgwUYR77//loHnLPnMJlz7WsoIXp/tFcpowKsSuVgckvbA5cpk7fcCO/pNS4odolvxvDDYqxmDH94BcDhcGw+wzZQLBONAGIJienjz6AdZD1v9WFeC0CPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=IMyRnzZJ; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 621FD2034F;
	Mon,  4 Aug 2025 19:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754335084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDIUbfgsBCB+yTlIqmuoRGtDd86IV1sv8zA0Nww0V2Y=;
	b=IMyRnzZJLN2PYP428sp2sa1noNXOxBbpTYplXtfJqzOdlasnYT4CM4a1Q6JpiHa9+KXm4E
	rP+jbLRmdSts8BQ2RO/UpLTcpn5P7NnSkT+uaYUVrfPzMU42mB6c8AUcg0WdhZa5k+3OYg
	knJ9zXe0wk3ey4oE+MDaQmlwwU5mEDg=
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 04 Aug 2025 21:17:03 +0200
Subject: [PATCH v3 4/5] i2c: rtl9300: Add missing count byte for SMBus
 Block Ops
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-i2c-rtl9300-multi-byte-v3-4-e20607e1b28c@narfation.org>
References: <20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org>
In-Reply-To: <20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=sven@narfation.org;
 h=from:subject:message-id; bh=rfjnSZM5LDZLCKkk3DIvlsIirLOIa+aP9kL7m+7VmW8=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkT2cPl21UTLxwKuSDdp67MlKlz60eeg6Tumw3rJJieK
 1l0STp0lLIwiHExyIopsuy5kn9+M/tb+c/TPh6FmcPKBDKEgYtTACaSfImRYUd5oc1bC6ZLqc+s
 LQ2CknJCA6+xb3/eX1xferKoQseIgZHh35lt96/weNnM+mKonWZ4Yg7zqXOnDTaxB31/85P/0/1
 ODgA=
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
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index b8e8f416c5658058819dc0c75af7aa5f18f3f7a9..8310675668fdddc9626a5813bee050cc55a61c09 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -288,15 +288,15 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 			ret = -EINVAL;
 			goto out_unlock;
 		}
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


