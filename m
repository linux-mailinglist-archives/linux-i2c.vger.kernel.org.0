Return-Path: <linux-i2c+bounces-12167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A4BB1F2A1
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 08:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E046262E1
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 06:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C99277C8D;
	Sat,  9 Aug 2025 06:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="ecVEcjjc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1279CD;
	Sat,  9 Aug 2025 06:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754722467; cv=none; b=cnAJzSUuHDDVEY/qh0K1Z9Ai2soZvHnL+kbGN9ATaTF9m09dAIwcsOTbLMD1cD/+B4c+CkYyjDipqTIfUe0KkvciUvQneX1LZTVLINueh5hAZ1vQqMVVw4/0IhVqgfTfe9SJ9eSo08tpp8O4fbvoCrLJoyk44Y2AyxQMxFz6Zew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754722467; c=relaxed/simple;
	bh=Vtq5UPmLTFY5VZzrysY3oADq9EGeBvOKx8b4u8R8igY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFtmlKBqt1QokpobSikgJwzkL20evudq+pC/HdURtEvnofdZu+IczD1jGPCwr4ZM+89uDUinCj4sQ4cN7O7X1YI/pwbwHcoZGaKveilycjsI/L2XJbOjhNLRzKbTJj9MDFGUuIY2QCLZ5u3dn53DLgw6hUC4PiXsw0IIDZXnMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=ecVEcjjc; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 86AF62034F;
	Sat,  9 Aug 2025 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754722462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/nKJw/7X53cuiGpQWRkSvrWgGuyU70edIJRDqZBDww=;
	b=ecVEcjjc01TyceuAKLP9lkv1+79CZrbhBAyn/LNAQ7mb2Kf+mElCLx5XGiNI4HChnF4Q0M
	6/6fZ3jCHIyAvL+U9JRjclspWCziCcUE2xC7wUwnAs1EwSitwGROYoEteWx/1JDj3CCMhi
	ILZY8U+qoHcZgXLThTxFSLFpdCfJggc=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 09 Aug 2025 08:40:54 +0200
Subject: [PATCH i2c-host-fixes v4 1/5] i2c: rtl9300: Fix out-of-bounds bug
 in rtl9300_i2c_smbus_xfer
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-i2c-rtl9300-multi-byte-v4-1-d71dd5eb6121@narfation.org>
References: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
In-Reply-To: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, Alex Guo <alexguo1023@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; i=sven@narfation.org;
 h=from:subject:message-id; bh=qwD7fnxgQyI3+hiAHukxxaPljiRg7DlNTwOPEpk3kj8=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnT3m44fGeHhfjhp5+jboV1hun903jWOfHsGYO+Uye/a
 y+rctI62lHKwiDGxSArpsiy50r++c3sb+U/T/t4FGYOKxPIEAYuTgGYSNxBRoadk7bMqjJ9dnv6
 3YNu3Ayh8RUGIga26XIPGU9ZzZfkSfdh+B/wuugV+zumNXsu83AYVMX3+bbopB93vOL5vVDCzVH
 NhgkA
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

From: Alex Guo <alexguo1023@gmail.com>

The data->block[0] variable comes from user. Without proper check,
the variable may be very large to cause an out-of-bounds bug.

Fix this bug by checking the value of data->block[0] first.

1. commit 39244cc75482 ("i2c: ismt: Fix an out-of-bounds bug in
   ismt_access()")
2. commit 92fbb6d1296f ("i2c: xgene-slimpro: Fix out-of-bounds bug in
   xgene_slimpro_i2c_xfer()")

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index e064e8a4a1f0824abc82fa677866b85f99fbe4a7..568495720810b373c4fa3b31d3f4cdec7c64b5f9 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -281,6 +281,10 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
 		if (ret)
 			goto out_unlock;
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
 		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
 		if (ret)
 			goto out_unlock;

-- 
2.47.2


