Return-Path: <linux-i2c+bounces-12170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9BB1F2A8
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 08:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927205682F7
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 06:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E58A27990B;
	Sat,  9 Aug 2025 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="tGXI4Y+0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64023277CB8;
	Sat,  9 Aug 2025 06:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754722482; cv=none; b=C4uJbYeVfJOtkj1itj2dSjtm2BMuuI+kkor9RlybfHaEO0YQizuypuxwjAIX7lZZqBDz3ndV+hfoq8YKAZkWQyX/dplwc62UbW+N1VxT3S2icvJPvzfD2IyRUZRdfqFhWPgvpKC9oJkUjuqQTxqYKS/eya0t65bYb7JvujrMX3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754722482; c=relaxed/simple;
	bh=BHNXsv6JbtDlzsvtQDJK95gj4z98l8CStiP1HYWY6xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSDCOEcGEVQjyhp+M4p1mPAS/LubECCdf836eN+d4GOiZBJ4y+KswPc6WYKiOmsa5XthPDpKBVHiHOC/GqczhYllz7fEMJ+FBF47yyqJ2/eX7Ar/b5jXvDfwV+5CSRDBrXgY9lOm9bmgOIBqwHm1JDAluO5DasQXEbJv1YYumPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=tGXI4Y+0; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 989972034F;
	Sat,  9 Aug 2025 06:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754722478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qp1mdvDUuZytnfOwpewyXGRbiR2bfJOyoqCmLTNrquQ=;
	b=tGXI4Y+0PXCwgC7d3nNi7HZcEub+SpbmxdW/xD4W7eD+znQMManS+UY0/DXNWC8atYgmNp
	WQT1ZAnwDpK47T+Fu2sHjLL7FfQl1jP+ZJ7ckpDVw9i+dWda3+GvNqoJnl4oKz1o5KYsBK
	edFrOfqHClHSmiduqhWGAx6bWWgtcFk=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 09 Aug 2025 08:40:57 +0200
Subject: [PATCH i2c-host-fixes v4 4/5] i2c: rtl9300: Add missing count byte
 for SMBus Block Ops
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-i2c-rtl9300-multi-byte-v4-4-d71dd5eb6121@narfation.org>
References: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
In-Reply-To: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060; i=sven@narfation.org;
 h=from:subject:message-id; bh=BHNXsv6JbtDlzsvtQDJK95gj4z98l8CStiP1HYWY6xY=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnT3m7YcYVXZbvWb//DC1XnL9r9VuHJyeIl5/ud/JXC/
 rjwy6zO7yhlYRDjYpAVU2TZcyX//Gb2t/Kfp308CjOHlQlkCAMXpwBMRGI6w/8ozkZGkX89J5Ns
 tLL9TvKcYNLgZJDzdlh2KP3lAzl9/SKG/yXB7ucn6p+cpvKlY+vL+GCXB2cnJgYpt9qJfVLoev7
 /KzcA
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
I2C controller is enough to fix the transmission.

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
index 4a282d57e2c1a72c95bdabdd9eb348a73df28c44..cfafe089102aa208dde37096d5105d4140278ca9 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -285,15 +285,15 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
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


