Return-Path: <linux-i2c+bounces-7461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D469A2C5D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 20:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639C71C21642
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 18:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D1118133F;
	Thu, 17 Oct 2024 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="tLT8mLdc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EED1FDF9A;
	Thu, 17 Oct 2024 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729190538; cv=none; b=cAWzlythBNONL4sx2QRbVSbVVNH4UFfP47kAb4o6BqqQBnP6XMOMu64iQlPT8zFjTlM/WcDfCdTsrnlPNok5lyYSj9tjVPno6gv4d4pzAZfUHOPRY04io1FkTbKBsOnFGU5VGfMFBV9QmTDiBLfUAXs5ayWg2uaRt3lm3aur8vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729190538; c=relaxed/simple;
	bh=GXZfrRTXT9LrrAjevCYm2C81k35PY0aGEBqJy7gL/Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPKd8fXLHheiW9c5yqHYfzUWL1NLxDwVUcLYNf1LX7s4X3p5p39l1PBeYVL6zN+Fx1e0QZd+8pSOIKZk+U1URB+0KsH3RhwxpqvoDpzHYryUpgBNUAzqXJJ3nWqEoiMs01TS4P+JRhssJUv0Itib9GfOkXKFw4p5RegzHQAEii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=tLT8mLdc; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0CE0B88FBA;
	Thu, 17 Oct 2024 20:42:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729190531;
	bh=cAmNngeOSAv5WfCygbk0KTKNcyQTmYx4zKXtpklGhNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tLT8mLdcP7L18Rc4jR9XL1JIImQIbEwcHhkUh5fCiMDq+Pa15LpoMzaNhcUqKJzcw
	 ZQafj0gM+dUURIVfrIIiIA+EiyZ6TuOkrJXYBD7hcrk2+tc1Lf+orFVyC/bA7U+Z38
	 /SfJxuDiOPfdfAu0X64nmijD/Ln/5bXIKZq/NJklBGvVBsrcPu3qoNDduEX5q5Hjqt
	 vWhg7KcbQqKfVOPBgwQMKL8S4JSYlUGTIfT/Ii8iNzswjJ+H/d46SibdPaUh91ksYI
	 z5iQpSs24QMYWIanfqMuXuVn0g7w4J59csVMSZhmAd6STE60wP0hp+uFcRxYgrMo6O
	 PKAN/PNrIRDsA==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com
Subject: [PATCH 2/2] eeprom: at24: add ST M24256E Additional Write lockable page support
Date: Thu, 17 Oct 2024 20:41:26 +0200
Message-ID: <20241017184152.128395-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017184152.128395-1-marex@denx.de>
References: <20241017184152.128395-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The ST M24256E behaves as a regular M24C256, except for the E variant
which uses up another I2C address for Additional Write lockable page.
This page is 64 Bytes long and can contain additional data. Add entry
for it, so users can describe that page in DT. Note that users still
have to describe the main M24C256 area separately as that is on separate
I2C address from this page.

Unlike M24C32-D and M24C64-D, this part is specifically ST and does not
have any comparable M24* counterparts from other vendors, hence the st,
vendor prefix. Furthermore, the part name is M24256E without C between
the 24 and 256, this is not a typo. Finally, there is M24C256-D part,
which does contain 32 Bytes long Additional Write lockable page, which
is a different part and not supported by this patch.

Datasheet: https://www.st.com/resource/en/datasheet/m24256e-f.pdf

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-i2c@vger.kernel.org
---
 drivers/misc/eeprom/at24.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index ca872e3465ed9..0a7c7f29406c7 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -207,6 +207,8 @@ AT24_CHIP_DATA(at24_data_24cs64, 16,
 	AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
 AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
+/* M24256E Additional Write lockable page (M24256E-F order codes) */
+AT24_CHIP_DATA(at24_data_24256e_wlp, 64, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
 AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
@@ -240,6 +242,7 @@ static const struct i2c_device_id at24_ids[] = {
 	{ "24cs64",	(kernel_ulong_t)&at24_data_24cs64 },
 	{ "24c128",	(kernel_ulong_t)&at24_data_24c128 },
 	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
+	{ "24256e-wl",	(kernel_ulong_t)&at24_data_24256e_wlp },
 	{ "24c512",	(kernel_ulong_t)&at24_data_24c512 },
 	{ "24c1024",	(kernel_ulong_t)&at24_data_24c1024 },
 	{ "24c1025",	(kernel_ulong_t)&at24_data_24c1025 },
@@ -278,6 +281,7 @@ static const struct of_device_id __maybe_unused at24_of_match[] = {
 	{ .compatible = "atmel,24c2048",	.data = &at24_data_24c2048 },
 	{ .compatible = "microchip,24aa025e48",	.data = &at24_data_24aa025e48 },
 	{ .compatible = "microchip,24aa025e64",	.data = &at24_data_24aa025e64 },
+	{ .compatible = "st,24256e-wl",		.data = &at24_data_24256e_wlp },
 	{ /* END OF LIST */ },
 };
 MODULE_DEVICE_TABLE(of, at24_of_match);
-- 
2.45.2


