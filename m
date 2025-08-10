Return-Path: <linux-i2c+bounces-12219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B5B1FB97
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 20:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42CD2170F17
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 18:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D392A27934A;
	Sun, 10 Aug 2025 18:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="DEVYBaCo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0794E278E42;
	Sun, 10 Aug 2025 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849184; cv=none; b=bf0fp6bwT+jwMCHPyL1cHQapsX8su8nWSMJZWUpInT9MfJtuHC0WfOz9hxwyTWYK1aUor+9L9afxxocUghH7RpKy2kKS9tWuSl9QIAJ0lYrQ6d42RisdyzgYhV5CXT0RhZWJp1KulG5+VLHyA5j9bCkBY/63+q6s5Jc+3Y5o7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849184; c=relaxed/simple;
	bh=BHNXsv6JbtDlzsvtQDJK95gj4z98l8CStiP1HYWY6xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxtP/HgMpeXICf9Bx/4l0qJLjOhDKieFNibfGLSgycAAYhNFI1c6m47T7A1lUajCPGvpOShNrsloVuwsMuzl/oyT8BU7PocqDX4lHa4X+9/VMqXXpcHkYQePqulFu/JKALy3e47ecA5hInNmSOVACgMwXLEAJSKsJDxwswGp+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=DEVYBaCo; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 42E9E217D3;
	Sun, 10 Aug 2025 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754849181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qp1mdvDUuZytnfOwpewyXGRbiR2bfJOyoqCmLTNrquQ=;
	b=DEVYBaCotOT89KlOF/vKqV7j0AWbYvYMsAP+jB8gMFNQthf65v3+hOheAKjFC6GP7AXKYE
	4XoRN3gweHH88yXaDnYQscFP3Ofrdn5S14aX+Bnn9zeNDhmPOBp5lB/xIUrZ2idFykbZGa
	ldHlWogzIXLH13bdHhdyZ0SGHAy7A+Q=
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 20:05:16 +0200
Subject: [PATCH i2c-host-fixes v5 4/5] i2c: rtl9300: Add missing count byte
 for SMBus Block Ops
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-i2c-rtl9300-multi-byte-v5-4-cd9dca0db722@narfation.org>
References: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
In-Reply-To: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
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
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkz7nfYpG5k7xdzdmBK0t793d5KOtxszeSDzWKbN9aF5
 y0yCY3rKGVhEONikBVTZNlzJf/8Zva38p+nfTwKM4eVCWQIAxenAExkxQeG3+wPzhx9wsC3ziN4
 noS556aftmvO7OmK2cZf88fJkVOrnZnhn7nrM2k7mdw/Kte1LksXFq+qLc66qxy9fe6XdSrRj44
 Y8QAA
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


