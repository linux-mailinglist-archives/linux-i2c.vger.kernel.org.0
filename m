Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 567CABE66C
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 22:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbfIYUbU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Sep 2019 16:31:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44838 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393128AbfIYUbU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Sep 2019 16:31:20 -0400
Received: by mail-wr1-f66.google.com with SMTP id i18so8385799wru.11
        for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2019 13:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcBsCzwhp5Ecgxfu1Yf/yNSTuRVO8fFdckSjieoTLBs=;
        b=dOzuI9mJG7MNkBkGgMGYhShhE5duhtiVQDyWLneLxX5wD/HCWf9T/PGCnLnPzC7wtc
         ysS3Th4+kQaByGMbqsOJTgU9iown1CZdT89pHVI0AwdYL8iFDKcrSGBjpJLG5UVdC/Z5
         eFEL4LYNjIxiH8xHZSo6ggGvIjxXX0eE8hVW8ghYYZYge090LkWEtqou4uIwMC+Q6C7K
         BmI6qzs0PsJPxUaEiJH3kQJ+Rut1XEYojN4XokuuEIzUqBoZdypscGa3T0t7AJulGOCi
         pQeAI/Uc1o44hsSpr1OWt2THVPdcK3Q0ilf9Qd1CykPt2J7mq2nyU7AkflhRneuODZeh
         d2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcBsCzwhp5Ecgxfu1Yf/yNSTuRVO8fFdckSjieoTLBs=;
        b=R1YbL8A0LgPy3mM/KlFlygOg9VcBg5F+P4c5R+R5fWamjau+VkiDnMjsrUur+eK6Os
         xmGdeFuP2FvZZJRcjw0y0AqAb+guT8sVfk5KU/6OezjTr+kZmKn8dkEebY3nfj9vq7ag
         T9XP+wytlnA2R7vPWdv3y5LuVHyAyET45LhMSLpYoQYJSmVp2fkU3aAkht/vcjvU/USf
         dH7EGZWm/F1qd+dKmNWimb6vT9lDJtbsNpMKpwaXhR9hBJSwtBVHwKG8rO/RlPYiS768
         5ohbMcQbmATTQE/WH84vjFiHlfQVmDM6bGGBhWgNx4rWlX1lEa5GE5W5H2qwiD903hhN
         Pv9w==
X-Gm-Message-State: APjAAAX4ksStejjr4z6iDu1WGJP8bJqW7FPJNbeuTs+3poRCPziQ2P0O
        lTm2Bk9VqjCJz9sShQJ89CKuqftfG/o=
X-Google-Smtp-Source: APXvYqwzQxZ9IYuGZE7fRHX9HR9jZ3vCuFGihvzGzRLMzKQ9kPDNMFvtmH/a4e7Uuo1sLkQjk6Emtw==
X-Received: by 2002:adf:cc87:: with SMTP id p7mr142508wrj.43.1569443477086;
        Wed, 25 Sep 2019 13:31:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e34:ecba:5540:2c05:40e4:899d:aef0])
        by smtp.gmail.com with ESMTPSA id j1sm301348wrg.24.2019.09.25.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 13:31:16 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     matthias.bgg@gmail.com, wsa@the-dreams.de, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, tglx@linutronix.de,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH] i2c: i2c-mt65xx: fix NULL ptr dereference
Date:   Wed, 25 Sep 2019 22:31:13 +0200
Message-Id: <20190925203113.6972-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since commit abf4923e97c3 ("i2c: mediatek: disable zero-length transfers
for mt8183"), there is a NULL pointer dereference for all the SoCs
that don't have any quirk. mtk_i2c_functionality is not checking that
the quirks pointer is not NULL before starting to use it.

This commit add a check on the quirk pointer before dereferencing it.

Fixes: abf4923e97c3 ("i2c: mediatek: disable zero-length transfers for mt8183")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 29eae1bf4f86..ec00fc6af9ae 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -875,7 +875,7 @@ static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 
 static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
 {
-	if (adap->quirks->flags & I2C_AQ_NO_ZERO_LEN)
+	if (adap->quirks && adap->quirks->flags & I2C_AQ_NO_ZERO_LEN)
 		return I2C_FUNC_I2C |
 			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
 	else
-- 
2.23.0

