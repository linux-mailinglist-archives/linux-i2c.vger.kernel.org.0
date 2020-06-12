Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FFD1F7E66
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jun 2020 23:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgFLV1H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Jun 2020 17:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLV1H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Jun 2020 17:27:07 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4935C03E96F;
        Fri, 12 Jun 2020 14:27:05 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id w9so8264503qtv.3;
        Fri, 12 Jun 2020 14:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/FNlqd4vn3jX2Jmt/9TRki01CcbjDa14Kvi+mmqzptw=;
        b=nj+J/VvwqCfTau72ioAUq5oKCN8g/qV2edpgsv0WnT8SfdZZjxrZTwItqS70PsWwdD
         a+DndK94Nv/Q2gKHO36aCfthMvlOfhDuzJwOqeFlwRMq1KaepTKUb3ekksGHu8R4JJaQ
         8yG9PsQjVXRtvmbyYKoxjHEAzr57B+xliKfzoIJp0MR4lHx71tMOrifp0PQhCDn67JUU
         HfYInEI4L/4MRLE6EF+t//e+99m3vgl94UAgMm358K7qP9mGh7SAA/gasjVePvINUlIc
         jYzVvZsHhy+KlQwjv/uvc88/DMPtB3to2fMey6wBlC1HCy7I2BWlbt1t8Dm60fzYev/X
         R1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/FNlqd4vn3jX2Jmt/9TRki01CcbjDa14Kvi+mmqzptw=;
        b=CyHsUVbzooAeYF2HNTVtHQ5dUHowXHbIGKv9H0BHICczAqkm/c9HPQFNe1m6oxYmbk
         BjmqL/bjQr8svO1TaVNq2VMA7gFP1kzNryO2HXE1aYDOGucgo9bQEwwXhfswHEkhRwhH
         0BAYcU6EwJKCRi3pjZfHCpsX7YUiPiuEau52iSM4GEBicTRi/Yno9SPYGKrAerXlukZA
         6gYgJzhoEloAfEeDcr3OqmezII6eGIBEtNi939Woode5DZHNtK5oQE/tkAJOcMYHK4Kq
         1iCRXFiFKxdlWmY9THfwd6aq/Uyz7a0BeqWLmPeSNwKOPwyhUKIuqV+Go8PD/192Jb9R
         R62w==
X-Gm-Message-State: AOAM533XLyrZ8o+VQUAh7mWPCBAHAktR72A+w59mQHyNvFZprgMZFJTO
        TzC1xDnDgLaaNF+bp70Hhw==
X-Google-Smtp-Source: ABdhPJz8TotqDhM9hw4Dp+f1CREb1prIfiQgFl+jpkq+iCMCGtdgqNOgjFQPhkBhkd1zHV//PcGaWA==
X-Received: by 2002:ac8:1285:: with SMTP id y5mr5208330qti.245.1591997224732;
        Fri, 12 Jun 2020 14:27:04 -0700 (PDT)
Received: from localhost.localdomain ([142.118.26.59])
        by smtp.googlemail.com with ESMTPSA id m82sm5340591qke.3.2020.06.12.14.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 14:27:04 -0700 (PDT)
From:   Keyur Patel <iamkeyur96@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Keyur Patel <iamkeyur96@gmail.com>
Subject: [PATCH] i2c: smbus: Fix spelling mistake in the comments
Date:   Fri, 12 Jun 2020 17:26:35 -0400
Message-Id: <20200612212635.177380-1-iamkeyur96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix spelling mistake in the comments with help of `codespell`.
seperate ==> separate

Signed-off-by: Keyur Patel <iamkeyur96@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index b34d2ff06931..56bb840142e3 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -4,7 +4,7 @@
  *
  * This file contains the SMBus functions which are always included in the I2C
  * core because they can be emulated via I2C. SMBus specific extensions
- * (e.g. smbalert) are handled in a seperate i2c-smbus module.
+ * (e.g. smbalert) are handled in a separate i2c-smbus module.
  *
  * All SMBus-related things are written by Frodo Looijaard <frodol@dds.nl>
  * SMBus 2.0 support by Mark Studebaker <mdsxyz123@yahoo.com> and
-- 
2.26.2

