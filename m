Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAFFD98FEC
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2019 11:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbfHVJpj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Aug 2019 05:45:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36236 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbfHVJpj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Aug 2019 05:45:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so3299687pgm.3
        for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2019 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sgHEzZrPt9EteY2/QiFiyeYlRXQlrmCLZpXRsbYVLMM=;
        b=a9yy/07U4q9DkIrWE+1S1A5qGfmGOHr2Iah/Cwu7XTniDeBQidLmwEdnkTDXQM31RX
         HhXAwzTUtfbL7o0VP7LGkI+cz+lIG1ARIpBt7uaEM+lvwDLuY2LuYf4zfjpbXOzaKx1h
         ZskFoEcfaOXTiPrX0jOZiLZ1+rX1vte6oawec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sgHEzZrPt9EteY2/QiFiyeYlRXQlrmCLZpXRsbYVLMM=;
        b=aQsu0DHDEfTtitFPXJHwb1AYeDp9c3Ar9Ns79GFnYFBHMvX8eMTBqvKu6AG1NBB02r
         g+e0Bj4TA6bDioioJhcNEjhA61kKV27xTaW/b9T/gfAS9wSh+T7Q7PjPmxbhOysPGUlX
         7bVzQrcBlEI+HjN3efL9nPwycm6D36Tr+eZNbrtCWaphaBTT+/iah6iQKWW3Ilqq8yYc
         9rgngIaYfTuCWQVBFnChzT3VIUGjg4QM01ePkhspvy5bBmwezXo8T5GuhDuUF+HKkJwJ
         tjuboW+WHC42EGb0+S5i9RKRxcWYXKUV0/+XTLNy41X41s3xPfGSwrc3xVp4CTjA8ZPs
         6bhQ==
X-Gm-Message-State: APjAAAUuUEe0RUvv/XGsOpSQsBbu7bwaB5UqKgbyHIc6TlwxKc6Z0VV5
        LU3ifQzlcJCASKXwgdI2CVjNwA==
X-Google-Smtp-Source: APXvYqwkD6Agsn8K0zNRrV8QL+ZYvIkEdfXfGFsEU0viYlCos3ngXCAmY0WDc8ulQwd3AcyBj/e79Q==
X-Received: by 2002:a65:6281:: with SMTP id f1mr31045994pgv.400.1566467138859;
        Thu, 22 Aug 2019 02:45:38 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id 4sm26154645pfn.118.2019.08.22.02.45.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 22 Aug 2019 02:45:37 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jun Gao <jun.gao@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH v2] i2c: mediatek: disable zero-length transfers for mt8183
Date:   Thu, 22 Aug 2019 17:45:17 +0800
Message-Id: <20190822094516.55130-1-hsinyi@chromium.org>
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
Change from v1:
* restore the order of algo and quirks
---
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 252edb433fdf..29eae1bf4f86 100644
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
-- 
2.20.1

