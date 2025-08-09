Return-Path: <linux-i2c+bounces-12169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17F3B1F2A7
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 08:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD2A5568268
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 06:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F214927874F;
	Sat,  9 Aug 2025 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="qrXTPBdl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005F277CB8;
	Sat,  9 Aug 2025 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754722476; cv=none; b=pXaUZi8+71L/1YMiXExrJjmchDlhmCCN5by7vLYmX+Ue0FGLJsxg+qRqSBz0Wa44FnIQpslm8vEUUn2dbN097Biv8AoKR5qTXWoNI0uoJDo+lP5RMU2TB5A6W01eJX641cn3Z4lnF9mE7MbuCHVMO+W1jMAOJfzquR/WcUgGeuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754722476; c=relaxed/simple;
	bh=JkSHmP5mjo+WXOJdZpYaGBO+h2dGd7a2OUfPAZBNFqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YznIbgvywm5Q/ox7kNTWIpYtjIpQCyZpgU0TcL4533DjoPoOd3BzzOUyWHdm8UbyZvGu/LOKa8YhLIZ2L27diDcETAeDAbHzAPicA+JS7dZxuAcZys4STX3jDl3okF739B+FO0QHgMdm34CN4ECvpvHYh853b7YDDHEf0Su/e+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=qrXTPBdl; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 77A5D2034F;
	Sat,  9 Aug 2025 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754722473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgIYXfd+vWJAvPi6jchjBMNFQIUKjayvrf4gwD/0FZY=;
	b=qrXTPBdlFhQuiR+OOpHcdfurdF55xNZatkYwAPLu/cb+jUoRYNA2nhmsgDy7MtkYWjOt1d
	GPc40OtMIYWZWnhpdnecqx+rEtlefcNxcs3zWZaoaSCGs0kxUAs185X96EdoNKMBi9SP5d
	Q391Gd0gSdntK7R3MFXxj3Qswx43OaY=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 09 Aug 2025 08:40:56 +0200
Subject: [PATCH i2c-host-fixes v4 3/5] i2c: rtl9300: Increase timeout for
 transfer polling
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-i2c-rtl9300-multi-byte-v4-3-d71dd5eb6121@narfation.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=sven@narfation.org;
 h=from:subject:message-id; bh=JkSHmP5mjo+WXOJdZpYaGBO+h2dGd7a2OUfPAZBNFqg=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnT3m4IOv37T+eEQn7jwvClz4TiPatXOLaabnm/pD/um
 cx92dl3OkpZGMS4GGTFFFn2XMk/v5n9rfznaR+PwsxhZQIZwsDFKQATibjC8N99uz2PwKvWmvu7
 craGXf/PeHPpBcvFM1umyN/RXzlpzkoJhv/RDFeK56gumXbJ9fWOYKbaZRsa3aL/sV9keJ37L2C
 nxh0WAA==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

The timeout for transfers was only set to 2ms. Because of this relatively
low limit, 12-byte read operations to the frontend MCU of a RTL8239 POE PSE
chip cluster was consistently resulting in a timeout.

The original OpenWrt downstream driver [1] was not using any timeout limit
at all. This is also possible by setting the timeout_us parameter of
regmap_read_poll_timeout() to 0. But since the driver currently implements
the ETIMEDOUT error, it is more sensible to increase the timeout in such a
way that communication with the (quite common) Realtek I2C-connected POE
management solution is possible.

[1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/realtek/files-6.12/drivers/i2c/busses/i2c-rtl9300.c;h=c4d973195ef39dc56d6207e665d279745525fcac#l202

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 4a538b2660802c98e1a51d2ed782e154f2a5d1a0..4a282d57e2c1a72c95bdabdd9eb348a73df28c44 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -175,7 +175,7 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 		return ret;
 
 	ret = regmap_read_poll_timeout(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1,
-				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 2000);
+				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 100000);
 	if (ret)
 		return ret;
 

-- 
2.47.2


