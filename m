Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3418E610C7
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 15:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfGFNTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Jul 2019 09:19:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46777 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfGFNTZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 Jul 2019 09:19:25 -0400
Received: by mail-pl1-f195.google.com with SMTP id c2so4319338plz.13
        for <linux-i2c@vger.kernel.org>; Sat, 06 Jul 2019 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnNOt2zXGFNIELEcQnQ7yz3b9EGM1OUPYo7bpfq0Rr0=;
        b=MWBa7uPhQPJiiG4LdsXWu1DV74PtmqVMjIdejdxJMvLdMRmppuB7FI9A1uzAKR/wSx
         BD4YlNV3iPW3b3sh5hakELVuLzcQQF40dAh7BmXkKjQGxtTvQHigiPeM0KGf1kGu7J02
         IPS8349S3qI4t4vrQHYs51E8XuUkM6kfkDSJ5LteWL2WowkeCvI5xeE+6Gcbzg3vQhM5
         lUFmvMZykidFK1OFT+HS02FWfCr46bCaA1a7IylbG3/ipNgRYQN2G6GC7ftgLRDBMvvI
         OBeLiiUuU3stC4g9kcAx7A9kOc9iE0YwcGREVhjNgCEujfvqkKs4bPGUCWBb49VnJqHI
         GDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnNOt2zXGFNIELEcQnQ7yz3b9EGM1OUPYo7bpfq0Rr0=;
        b=ViaHs/RUi37wE/Se3ax+eaKAh3PYLjxd75anf4zfSAzn1VkLWxk1oTfYkxgdV9/jtZ
         jUTzxF59flEyqICJr0nTkxJmBV3BEtReQ9NE7d3Je9J07l8sj1fDJ3kw3/AgVmjJTorj
         Sv/Nq7JD0DY34+uwrYbc24KeqfgZN6M/FQGScboajbkEjKez7C8foW7ypPgb0g2Zhpal
         S1qZFgrAUBssb1Q2JBUJ/vtahxi+YGVCYrYez1WjA/hbDPMCSJBMj11A5sShOmvd2kka
         hVdPPqSK9iyYCfLBw2y7CBVHAC1LOMkcxMov3ZQSVK6NRvvhXpASVCVNRozF93XHXpo4
         j4gQ==
X-Gm-Message-State: APjAAAUtGXJgY5hqR4MowycozDT8ck15iYpZ5H7/Fsq18HnAYuqrnX1F
        xyTPx+r2E62MpuWrJLVkapI=
X-Google-Smtp-Source: APXvYqy9dzozHCInt1iC7ZBcsFD6SL09tUCt9Bi1ouWM/k31j8u9R19oSTBiK4ygdVEfjxZ440TjXA==
X-Received: by 2002:a17:902:7087:: with SMTP id z7mr11325613plk.184.1562419164725;
        Sat, 06 Jul 2019 06:19:24 -0700 (PDT)
Received: from localhost.localdomain ([122.163.64.117])
        by smtp.gmail.com with ESMTPSA id l23sm11471402pgh.68.2019.07.06.06.19.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 06:19:24 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     eajames@linux.ibm.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] i2c: busses: i2c-fsi.c: Add of_put_node() before break
Date:   Sat,  6 Jul 2019 18:49:11 +0530
Message-Id: <20190706131911.3068-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Each iteration of for_each_available_childe_of_node puts the previous
node, but in the case of a break from the middle of the loop, there
is no put, thus causing a memory leak. Add an of_node_put before the
break.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/i2c/busses/i2c-fsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1e2be2219a60..5e01875082c3 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -685,8 +685,10 @@ static int fsi_i2c_probe(struct device *dev)
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-		if (!port)
+		if (!port) {
+			of_node_put(np);
 			break;
+		}
 
 		port->master = i2c;
 		port->port = port_no;
-- 
2.19.1

