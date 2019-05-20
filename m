Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D831A23941
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 16:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403872AbfETOBj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 10:01:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40727 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403859AbfETOBi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 10:01:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id h4so14756839wre.7
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z4tnU+N/DU1N5SPy41/fi/miGaLy6d3wjz6icgaZVuI=;
        b=0WoDOm7eSUPpLoIkMOSusIKkzLWDQndtkVtMrGv8KeIPGtwW9IqpBlwAf//CG+IO9b
         q7aVWcfLGjukA/a5dBEMZ0iwfWK22jsX7ha+nyfdiYkjP4D2eMGlGeoIGa3bQ84wsKS8
         TMAnpVntCcP2PVlcvED5ml1PjmoIkaRBsiXxHt05BNDwFma0SSCOafqRpg9eXjLBlEll
         N1J0oUsHG58CHkYHl922OZ9xuT6FSEyUr/2/6pa8v6s2R7m4xoijYYVdnJ50lx1Jetwo
         DRW724JkkmwuowaoF6lh8n70DvlR4bqUPhpAETLXkg6GfrTq9Gr7o61SKJT3nq1cM9iE
         RjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z4tnU+N/DU1N5SPy41/fi/miGaLy6d3wjz6icgaZVuI=;
        b=UxYoGir/Dgura1RmhnDyAQ61gLEGsHPDsBiY2zo+UHWzjt1nble5QI3aH16+AH3agC
         fFhBJNgCIj3rm7QL0WUP6eAAZFB77bCwMp19W70NDllOr+oEfyqW5hzd4ES9LFHLX+oa
         irJg4mBaXu9UyDvFALz52u9hyhbCShmZ5lRyZ780vKumYrxV8yptUo1Vkc0qOzhPYJho
         PiDmhiGOphqsVHXzu3r2FmXq8Qam0HR66g/ntrqpA5q0tCGP69CyoqveyfitKKYDiUGW
         tIF+6IFsSBIEkhEFEuT99fH9uom7wO44xtCbruanxNuAbj8s0kc4vvLRseKjFfjKovzJ
         2MnQ==
X-Gm-Message-State: APjAAAWvI6yMXNzWl10Q2AP9V7njBAmNBCmeRXtO71TCDLSPHGKjkO7I
        vxlRBKUj9floqP5chv5AWo3zU85WTz59pg==
X-Google-Smtp-Source: APXvYqwEEdJHWNWT9tmdPHAERp5H+E+95z5naZ9rAlFKjxLflOoHQqlwBCMhp9NAPjMi8a5idFRzog==
X-Received: by 2002:a5d:448e:: with SMTP id j14mr26575282wrq.158.1558360897097;
        Mon, 20 May 2019 07:01:37 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f10sm24622307wrg.24.2019.05.20.07.01.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:01:36 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] i2c: i2c-meson: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:01:33 +0200
Message-Id: <20190520140133.29230-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/i2c/busses/i2c-meson.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 90f5d0407d73..f530d9a0450b 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * I2C bus driver for Amlogic Meson SoCs
  *
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/clk.h>
-- 
2.21.0

