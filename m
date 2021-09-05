Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C654010B7
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Sep 2021 17:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhIEQA5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Sep 2021 12:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhIEQA5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Sep 2021 12:00:57 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1F1C061575
        for <linux-i2c@vger.kernel.org>; Sun,  5 Sep 2021 08:59:54 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d6so5372732wrc.11
        for <linux-i2c@vger.kernel.org>; Sun, 05 Sep 2021 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=xtRBab/7flUtpwg9SnKebIAgaeMeQq9M8lEXcw2HHoU=;
        b=cwn9Ys1WVRRS20uldGNozlJrkcYDqIyFJUBiWr0CIYB8HyDdgH+uDorf4gMXH0Iz/T
         BZyvny+UjiU7c6i4C7IujcNCpJyJ/O9ig0BH/xDJIUrgmzGIZr68M6euXrfeHo8FUaNT
         7V3yHLvM7w7IGKyiyY70B05b4Lu5Hx9AxH200wyTw2ms00+1RHT7FgkqNuznciFp9ooZ
         DE3VzOwFc7DWukGhGHG5LidzfboabDC9Sj6wzxaWMZcy33RmqDTxciy7Keto2QQTbyYw
         jHQ6AD9yYu2lUzRVnWHtw3EihQnS09LHH7KJ8n8MzatnerCftupbQdKeuP+ZdUIBNqjz
         99oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=xtRBab/7flUtpwg9SnKebIAgaeMeQq9M8lEXcw2HHoU=;
        b=He7F6prDsVzTxutlrtXFpsm/tlXecYzktnxbpdDF3v0hAthdOFWrMUjAyWGIGkjccS
         8yw5m5Ph6AcqWTwdt/MOcj5+xq0mgCzvs2OQyFjqTUpfjxBDizFgA89ZsFMcRV25cZ52
         Uqhuc4u9BtpD0oIaceYHnThpXohljPYXiKWxOmYnoJ45xsnT10lORPe1Tsavpv92tJH7
         Kh08t/LKmitv9nIAKW6B9NuCJ95mWJ3GyiCdy7cjA21Xrz0je+bqx9N/d5jU/15T8+7o
         Zvc3xYZATKQD4AghL6SoRR9sR+nBp2jCtOC385RREnSGnApI6wgDTSygigH1b5qK17wy
         DqHQ==
X-Gm-Message-State: AOAM5332q1R2CUsm689Yb7zXqy8uIv9MJHnnd9QQOBliiCK4CK5V7jYq
        TlF7m42r9098nR8Y25GhrV0BubdtAMQ=
X-Google-Smtp-Source: ABdhPJyscVa/ckBSTekjarN9KsULNjqgWIIvY16JWQTpWumwUy/ywXa8BaOfrPKi2eA7TnjJ6p/7+w==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr8958704wrn.350.1630857592768;
        Sun, 05 Sep 2021 08:59:52 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f08:4500:38d8:6e4e:65cf:5ed0? (p200300ea8f08450038d86e4e65cf5ed0.dip0.t-ipconnect.de. [2003:ea:8f08:4500:38d8:6e4e:65cf:5ed0])
        by smtp.googlemail.com with ESMTPSA id q13sm4851065wmj.46.2021.09.05.08.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 08:59:52 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Use PCI bus rescan mutex to protect P2SB access
Message-ID: <7521c130-d777-6a26-bd14-1ed784f828cc@gmail.com>
Date:   Sun, 5 Sep 2021 17:59:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As pointed out by Andy in [0] using a local mutex here isn't strictly
wrong but not sufficient. We should hold the PCI rescan lock for P2SB
operations.

[0] https://www.spinics.net/lists/linux-i2c/msg52717.html

Fixes: 1a987c69ce2c ("i2c: i801: make p2sb_spinlock a mutex")
Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 89ae78ef1..1f929e6c3 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1493,7 +1493,6 @@ static struct platform_device *
 i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
-	static DEFINE_MUTEX(p2sb_mutex);
 	struct resource *res;
 	unsigned int devfn;
 	u64 base64_addr;
@@ -1506,7 +1505,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	 * enumerated by the PCI subsystem, so we need to unhide/hide it
 	 * to lookup the P2SB BAR.
 	 */
-	mutex_lock(&p2sb_mutex);
+	pci_lock_rescan_remove();
 
 	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
 
@@ -1524,7 +1523,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	/* Hide the P2SB device, if it was hidden before */
 	if (hidden)
 		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
-	mutex_unlock(&p2sb_mutex);
+	pci_unlock_rescan_remove();
 
 	res = &tco_res[1];
 	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
-- 
2.33.0

