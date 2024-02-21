Return-Path: <linux-i2c+bounces-1900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16385E74B
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 20:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F707B22488
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 19:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891908612E;
	Wed, 21 Feb 2024 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BvYDj5kG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC75811E7
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708543834; cv=none; b=X4Gmdq/0iH39KoHe8FcwVE4M0FHAgT2Weww/HyGrFgTNieXQOEWU5XT3/wDhfXlFMSRGo2smdmNaEBDeKu5oGzZctWAU/eBN6yo6bZUql5H6iOOvNUIjVVRWPd+UG5CvQ2gWcvEAdkxGfGM63epPEHPxCrwIXj9eYXpAIpQaVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708543834; c=relaxed/simple;
	bh=eI73Aixk2ZKHUCC+WBNzciPi+YGny+3Nqau0gA+LQpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZS2vJJTFu1MQdDKEsUisBIPBLfWYzjjA5CPgDsuCDBAJMzLD80qiTFBTtT1QnwkGY86YhfmFC6UsY1H0GZw+xubRgZAegfwg636GjCUIFrMNTZp9XGkcwoLMhC+1CKhBv+bMocvVNNOWKj1CJFSdBofDFIj/aiOoBursWZh2+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BvYDj5kG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=KYNKdWlES08xC8
	IxQFhBeyr/WjAKjrL7fnuvAKo0ujM=; b=BvYDj5kG40dEMpit8vA9MSanfwXVLL
	zGh9UGUyFGrSltMzj9QJdbQjLztaE0KpG6N0wN5mGg1BGH5dGVLfdPQHZ1ornxrV
	1diT9JHYxlBVgdeLEqPgeNMytpXIAREJ2Z8QM7W/CTw6ko6NYX1R1Z/SSpb025Du
	hjuRxw1hRIGtAIVgk+LadiWFZDfKep0fb87jwzovL61CRKSDfrXStiTGU4NAmKTe
	9Z5ZQdrc+obfCZtQpCnY0KaQm4SHInVoaSW1WX+QsS8vYpXmmrtYP+KRc0wOTB2N
	dVeNwASObWBRct3ixqLoS3/bUvuf0eF3zV15WdypKeguHcwBsCuWmmRA==
Received: (qmail 3720737 invoked from network); 21 Feb 2024 20:30:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Feb 2024 20:30:20 +0100
X-UD-Smtp-Session: l3s3148p1@WCl5W+kRkr8ujnsZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Corey Minyard <minyard@acm.org>,
	Andrew Manley <andrew.manley@sealingtech.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: imx: when being a target, mark the last read as processed
Date: Wed, 21 Feb 2024 20:27:13 +0100
Message-ID: <20240221193013.14233-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corey Minyard <minyard@acm.org>

When being a target, NAK from the controller means that all bytes have
been transferred. So, the last byte needs also to be marked as
'processed'. Otherwise index registers of backends may not increase.

Signed-off-by: Corey Minyard <minyard@acm.org>
Tested-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Andrew Manley <andrew.manley@sealingtech.com>
Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
[wsa: fixed comment and commit message to properly describe the case]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* updated commit message and comment

In the stalled discussion[1], it seems I couldn't make my suggestions
clear. So, here are the changes how I meant them. I hope this can be
agreed on.

[1] http://patchwork.ozlabs.org/project/linux-i2c/patch/20211112133956.655179-3-minyard@acm.org/

 drivers/i2c/busses/i2c-imx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 88a053987403..60e813137f84 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -803,6 +803,11 @@ static irqreturn_t i2c_imx_slave_handle(struct imx_i2c_struct *i2c_imx,
 		ctl &= ~I2CR_MTX;
 		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
 		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+
+		/* flag the last byte as processed */
+		i2c_imx_slave_event(i2c_imx,
+				    I2C_SLAVE_READ_PROCESSED, &value);
+
 		i2c_imx_slave_finish_op(i2c_imx);
 		return IRQ_HANDLED;
 	}
-- 
2.43.0


