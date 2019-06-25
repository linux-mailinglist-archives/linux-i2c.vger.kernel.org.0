Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32CA95257E
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 09:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbfFYHzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 03:55:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41374 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfFYHzs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 03:55:48 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so16664503wrm.8
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2019 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+l3yNFRSFTrJiaDRXSJTjsWxHSvQ1fzfuabKT7sr2A=;
        b=zwSoWLDaIpQ4poLZFRKZJivWSIyLB8ouQhoACav77ZRuNsOmjSVNVntOzpyaQ7qBqf
         xO496fE5Ft+ejEbAhSR2aw5AjEdhTpouqzQ3eVtAKhdL7QW4/ObaxhJkxRq8J7Le4VBV
         mpp/v87SqCC3QFovAr/+KREgXCgLrcMXaw7S3Z6f42yhCSiixCpn2ReCYstW1arjC9gV
         j4PxT6xXPZHci7Yj4rVYf5oMWr2kaNLoytlqnXzBUoAfLfgCJXZS68OqPFqEwl5ZAmgc
         +5Cygjemq+E4ygcr9yR6djmnC12wbG59Vp6aDLPtXuahytaZ9kqvbeftcn4mj8rHJhzA
         Zyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R+l3yNFRSFTrJiaDRXSJTjsWxHSvQ1fzfuabKT7sr2A=;
        b=N5QKudwbXXV74Fo4EO9dZlq2dFGpz5BpCNpGvP5nviukKUSrEVCL7UwW9BilWKKsZD
         5rbF1y0Yr+d2qrPKReW+CrUzg9NK7kui/OP6X1ZMuo4WDO5XmfjNA3Sa1ovOxpRea/16
         n0UxEMg4I2U3xyLqIMtmw9veW8cal1hPvihnQSLFnh9HgQN9vFTFLDRNfAQ/+zUL3U9D
         QlRDEkrhPafhVFctS/CaBDPtk9CkoFSRZGfGS3/WnH+2vcSlEyoFnMdhXm2sNAy1PPQc
         KQchwHWaJWHKvdMhIdHyoh6i8ew3mVJobBTsO0naymM2sWv2YN4TluJBWOfjKZCmzyBL
         IH9g==
X-Gm-Message-State: APjAAAWBnBRXJ+qWvoUWVaHceNrV0qgRPhaqrzEMqGhEzUv/DtFJRWd+
        JrC6K5x1UowKoB+6DBD7NwWFrGAqeAU=
X-Google-Smtp-Source: APXvYqzJPcp3AFhWcWc1EeOSnyxocoCX8gyGG0T1QmAS9t0ims+YIxGoNEeyimTDFVGawXqaNTRu0Q==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr35437423wrj.37.1561449346563;
        Tue, 25 Jun 2019 00:55:46 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id m9sm11928059wrn.92.2019.06.25.00.55.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 00:55:46 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] eeprom: at24: modify a comment referring to platform data
Date:   Tue, 25 Jun 2019 09:55:44 +0200
Message-Id: <20190625075544.17796-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We no longer have platform data in at24, so this comment is invalid.
Make it refer to device tree & properties instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 8b07b18e9759..35bf2477693d 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -582,8 +582,8 @@ static int at24_probe(struct i2c_client *client)
 	if (err)
 		/*
 		 * This is slow, but we can't know all eeproms, so we better
-		 * play safe. Specifying custom eeprom-types via platform_data
-		 * is recommended anyhow.
+		 * play safe. Specifying custom eeprom-types via device tree
+		 * or properties is recommended anyhow.
 		 */
 		page_size = 1;
 
-- 
2.21.0

