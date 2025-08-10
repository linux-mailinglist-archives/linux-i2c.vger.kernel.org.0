Return-Path: <linux-i2c+bounces-12216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7E3B1FB8C
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 20:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FE8B18976C3
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 18:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E102D275AFC;
	Sun, 10 Aug 2025 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="cyKCwt0w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1027A253939;
	Sun, 10 Aug 2025 18:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849174; cv=none; b=u9gxwl4l9ZE6iiclJmns3bnnYBHwx3oJju+kf3dacFJYjGKU3RiRwOMgfXtZwUE2+e7P6oYNgqyMswRlWfLcCLkLOaoFGNCB0+H2Oym3MpKaqhsKe29IKwRAi8gh49xvgHMRvfZuDHVtKsrm1pbzG0X1t+6bv8n+1SIvrXeb8a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849174; c=relaxed/simple;
	bh=Dy/+oYKdSQIxukU4C6KAV+6/KmCRVwWWiaWUjTh0JOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D76ZArIUJCHjSObHhQTgBaulT1/3nlkRDnYcLeWIUNKG3I/MkZD99ouNH0Oqf7V60pTYTAUuMTQZm3ial+6kI+CG2+dgAklAqtDXpHSO/K9fcAfD7sjZap1cFcoPk/TATHN2q8Po5cHuwLMU0wiqTy4skM2UQKu4LocEJ+Z4DHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=cyKCwt0w; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id EC1B5217D3;
	Sun, 10 Aug 2025 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754849170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOlmykBK1nKMQAg+VZNiT71+qP2QWD1fWMQ0ok2PwcY=;
	b=cyKCwt0wMVHz01ij3DSgffeQCMUbL8iJchhWsk2lsgnL8r1tmB2CvEt4q7J72yFzd4EQB3
	Gnwj33hkfQ0JS/8FcJx50HlxH99ECZFS5jZCfuMlSqp7JZCYvyEScoDXmgtPAQiLmigGh9
	b7DDpVOT4nS9/EBEwS1C3AGfIbPkccM=
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 20:05:13 +0200
Subject: [PATCH v5 1/5] i2c: rtl9300: Fix out-of-bounds bug in
 rtl9300_i2c_smbus_xfer
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-i2c-rtl9300-multi-byte-v5-1-cd9dca0db722@narfation.org>
References: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
In-Reply-To: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, Alex Guo <alexguo1023@gmail.com>, 
 stable@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=sven@narfation.org;
 h=from:subject:message-id; bh=nVUBLWVV5vK7ESr25xEtVVF15EuGnWZo3SbgG4GFu88=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkz7rfPTdjnGz87U3hl3J4Sr70HG9dUnt3r4Vi/reUR5
 9aTIv7FHaUsDGJcDLJiiix7ruSf38z+Vv7ztI9HYeawMoEMYeDiFICJzF7JyLD6bp38wqAet+dB
 09/VvrzWlZKvbpCqu/u2fAXPB3mxy+6MDJOUf3Zxnzj5QPS2VCHXmSenLxyz3vBy+gZzhiMHVvC
 fV2YEAA==
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

Cc: stable@vger.kernel.org
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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


