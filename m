Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8501DCCD6
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2019 19:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388542AbfJRRcT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Oct 2019 13:32:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52632 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbfJRRcT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Oct 2019 13:32:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so7003488wmh.2
        for <linux-i2c@vger.kernel.org>; Fri, 18 Oct 2019 10:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Sw0jFW5jGSGbXDR6kjw3sQ7x0eXAWOU04hu+4Lun0I=;
        b=F7bCnS3unseU4Pe5IzC5zUpmWlYMdj2YoPBCoyigGCpOa5U4q61E23KUKl7/OO8nS6
         WUdzxbAus6HqI12ynE+nZwyeZbScvBHaNZ/MS3f0KnUNnx/EplI1jIZL/5iH71+0mdDz
         dcRy9M6gwI3bMmfZsccnxZpqW7Rd51W1NywMy4/Mp4wT89DnDgdkLVO9fv5sh0RYkPyS
         Ehf0VdWN6+9r6al9EuDyaJi+pPQ0TMXNqxP6f179NCcs0/5FVY+iBLYjGQ5xJXBeU71O
         Q8mJc2Fg+yP3dNOPle+Zb1QIZzX2WsgUBZelWPvl8lmHh9R83fIiczy6BM3vNpewfQqr
         /wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Sw0jFW5jGSGbXDR6kjw3sQ7x0eXAWOU04hu+4Lun0I=;
        b=qNIJvvvXoGudyq76QplduV4QWhZWn04Tyti8M8m2Eloyo1gmeHOKoYV+4LzivF47d0
         K+prBk4PxWqhieQNf935URPR15Gl8Yi+GQCq5hKWnLJjKHrw0uFb15Z62fZsnOdJ81Ys
         nDPIrwUcE36RB0x9FtHti1m0rGdUeJntBqgNZinmgrQ8tXoo/WVUzTDRBzNm5rpXs1+f
         EZvulJveeqHlewXiHcnT2ENIEAGTlg/jm+CuGgVCsy2ZfoxR5UWXR+1IoKlWODZppWrv
         1E1MA+C4+pbPLAs023rhcYIQki9JHdHhGY9FPuu9FwG5hj9ErrRsp5FczjuyKgZGsXfs
         GfpQ==
X-Gm-Message-State: APjAAAVxz0LIExlE5gaN8ASLjPaTxNydIAeGMfMo9w2zz0S4wNjC2hYw
        ckhiDR4XpmXJgzC3etRbyU1JQw==
X-Google-Smtp-Source: APXvYqwLL/J/QMgyordUs7NtcgM+iCDETbDA3BzJsTD+EyqWB7RmlJjXBDAvzNb7XcPW3p+O8v6QGw==
X-Received: by 2002:a05:600c:2201:: with SMTP id z1mr8798906wml.169.1571419936945;
        Fri, 18 Oct 2019 10:32:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:32c:e530:1f62:944f:4c42:96a0])
        by smtp.gmail.com with ESMTPSA id z4sm5911967wrh.93.2019.10.18.10.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 10:32:16 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     tglx@linutronix.de, hsinyi@chromium.org, drinkcat@chromium.org,
        qii.wang@mediatek.com, wsa@the-dreams.de, matthias.bgg@gmail.com,
        Fabien Parent <fparent@baylibre.com>,
        Cengiz Can <cengiz@kernel.wtf>, Ulrich Hecht <uli@fpond.eu>
Subject: [PATCH RESEND v2] i2c: i2c-mt65xx: fix NULL ptr dereference
Date:   Fri, 18 Oct 2019 19:32:13 +0200
Message-Id: <20191018173213.13282-1-fparent@baylibre.com>
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

This commit add a call to i2c_check_quirks which will check whether
the quirks pointer is set, and if so will check if the IP has the
NO_ZERO_LEN quirk.

Fixes: abf4923e97c3 ("i2c: mediatek: disable zero-length transfers for mt8183")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Cengiz Can <cengiz@kernel.wtf>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Ulrich Hecht <uli@fpond.eu>

---

v2:
	* use i2c_check_quirks to check the quirks

---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 29eae1bf4f86..2152ec5f535c 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -875,7 +875,7 @@ static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 
 static u32 mtk_i2c_functionality(struct i2c_adapter *adap)
 {
-	if (adap->quirks->flags & I2C_AQ_NO_ZERO_LEN)
+	if (i2c_check_quirks(adap, I2C_AQ_NO_ZERO_LEN))
 		return I2C_FUNC_I2C |
 			(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
 	else
-- 
2.23.0

