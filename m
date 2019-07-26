Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27F076157
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jul 2019 10:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfGZIx6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Jul 2019 04:53:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36405 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfGZIx6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Jul 2019 04:53:58 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so24449750pgm.3
        for <linux-i2c@vger.kernel.org>; Fri, 26 Jul 2019 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kn51c4iVY6vEKLBAUEgNeUWaRLfBi8NFzSwtDO3qJPo=;
        b=ZrwXgOysV4Nm38G/Jd5hjo4ESfSee36UHEVzuju2NmMPD0fUC94XqOIjPS/vdAra91
         GePNmRjhbOHDSzgaRjaMUMHG2ycRlVIjQlvGTHCJ6xkeIKiWZn0uDU1XyD51GtXPWUIZ
         1aTRStwb5PMDv7h+ojMqDKzg/9hv/j4m2tbSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kn51c4iVY6vEKLBAUEgNeUWaRLfBi8NFzSwtDO3qJPo=;
        b=XDgCBxu9Ofh406GvXnWvwJrFDnA9RjK1scJZHDYrFRpX8Hl8qHFoPJjUf3wJEROmHd
         E2oYE/KbZoL+M4dSGliqca9noMeMYu/hbfJ5HNo244OtutZgs69F8o/1NzyL53Fk2AH2
         vrKBsGuXZfriiOr4hzExAVvaXepFNfBrewrcnAhYGQU4ltcKv///pfvyjL5f6hvVqGit
         bCoXFhwKhz3/hp7o5FaIcI5hqc4pTN4fQXI5+Sbdrmki598U9XFMetgjvztL9oMXnH38
         qmptjWZo+JdhV+UywIGfqJyDsr8A/EtP5HGyThMd3k56dWS0W7wBRCYT5IYWolkiNQSR
         Dp8g==
X-Gm-Message-State: APjAAAXf3XPFA6J0R+vElKkCc0NhyVVwHOsblLzkto0wyfVnd8R8fvWO
        OdMQIveDDu7Ty9OC+ZIkhHKKHQ==
X-Google-Smtp-Source: APXvYqwEl1k8U3GLoPPwct03h2YHbh18gkXJVzJDcKZV2mmsK3QGn7e5o8uX6/Q7RDC9oULrHaYOvA==
X-Received: by 2002:a63:c03:: with SMTP id b3mr26309020pgl.23.1564131237150;
        Fri, 26 Jul 2019 01:53:57 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id p15sm49438737pjf.27.2019.07.26.01.53.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 26 Jul 2019 01:53:56 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jun Gao <jun.gao@mediatek.com>,
        Alexandru M Stan <amstan@chromium.org>,
        linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mediatek: disable zero-length transfers for mt8183
Date:   Fri, 26 Jul 2019 16:53:06 +0800
Message-Id: <20190726085305.163306-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When doing i2cdetect quick write mode, we would get transfer
error ENOMEM, and i2cdetect shows there's no device at the address.
Quoting from mt8183 datasheet, the number of transfers to be
transferred in one transaction should be set to bigger than 1,
so we should forbid zero-length transfer and update functionality.

Incorrect return:
localhost ~ # i2cdetect -q -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

After this patch:
localhost ~ #  i2cdetect -q -y 0
Error: Can't use SMBus Quick Write command on this bus

localhost ~ #  i2cdetect -y 0
Warning: Can't use SMBus Quick Write command, will skip some addresses
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:
10:
20:
30: -- -- -- -- -- -- -- --
40:
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60:
70:

Reported-by: Alexandru M Stan <amstan@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Previous patch and discussion:
http://patchwork.ozlabs.org/patch/1042684/
---
 drivers/i2c/busses/i2c-mt65xx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 252edb433fdf..2842ca4b8c3b 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -234,6 +234,10 @@ static const struct i2c_adapter_quirks mt7622_i2c_quirks = {
 	.max_num_msgs = 255,
 };
 
+static const struct i2c_adapter_quirks mt8183_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+};
+
 static const struct mtk_i2c_compatible mt2712_compat = {
 	.regs = mt_i2c_regs_v1,
 	.pmic_i2c = 0,
@@ -298,6 +302,7 @@ static const struct mtk_i2c_compatible mt8173_compat = {
 };
 
 static const struct mtk_i2c_compatible mt8183_compat = {
+	.quirks = &mt8183_i2c_quirks,
 	.regs = mt_i2c_regs_v2,
 	.pmic_i2c = 0,
 	.dcm = 0,
@@ -870,7 +875,11 @@ static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 
 static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+	if (adap->quirks->flags & I2C_AQ_NO_ZERO_LEN)
+		return I2C_FUNC_I2C |
+			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+	else
+		return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
 static const struct i2c_algorithm mtk_i2c_algorithm = {
@@ -933,8 +942,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->dev = &pdev->dev;
 	i2c->adap.dev.parent = &pdev->dev;
 	i2c->adap.owner = THIS_MODULE;
-	i2c->adap.algo = &mtk_i2c_algorithm;
 	i2c->adap.quirks = i2c->dev_comp->quirks;
+	i2c->adap.algo = &mtk_i2c_algorithm;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
 
-- 
2.20.1

