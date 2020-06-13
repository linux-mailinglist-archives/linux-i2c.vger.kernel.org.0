Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5A71F8592
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 00:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgFMWMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 18:12:25 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:56244 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgFMWMX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 18:12:23 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49ksK23pwlz9vYdK
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 22:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id y_Hs8GKzHPs1 for <linux-i2c@vger.kernel.org>;
        Sat, 13 Jun 2020 17:12:22 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49ksK22DRfz9vYdJ
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 17:12:22 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49ksK22DRfz9vYdJ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49ksK22DRfz9vYdJ
Received: by mail-il1-f199.google.com with SMTP id s4so9226231ilc.7
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jun 2020 15:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=FdXdjmHedAXj/hlk7x8D2COLWhxBtrcFuL19bnCoiAA=;
        b=E+lWkEXd4WicprOc2RqreVpZnplmVN2LIbRmnw0No49QtjaK96rI3bD/sfAfaYS4m/
         KVTt1ccYZ2tDof2dsHIgQ5BCKtyzmllzHExtOb5KeuxHWDtFW5xI69p/wxVKJ3CJr+mU
         2d621AZC8T2S4HD+mCdQY8pl2gjCz1IlEdF5I7AQDld3NcfscE1ALkezWGTW/1Q74EM4
         3Cf+L+L2arREVxDsHWURivEC/qCHCPVw8yiPHf1Uczs7sbgrXHh+6zDAM7LoXgjoRDo5
         W1ofsXjPal3aVEOCaDn5D6+BmbZBFdyEbOXOPgRVnRrzMxaiRM0+HYk+m7N6/yMzef87
         u2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FdXdjmHedAXj/hlk7x8D2COLWhxBtrcFuL19bnCoiAA=;
        b=MK9Nc/L0Kv1JJgf5j5hwXcAN2effzVQ6sO82aoZO8QEGjyjsgSwOOxybvnf64pvo2O
         67uJiWp76GKtp2xlaMqIyyNX3h/syDVpljHubrf85P/Hmc9ARqndZGB8/pODqzBRGe7d
         5rOBygX79MkNM/FK4VjzOTkg8xTVfU8ky5HgnPpnd0BA6Pys31id9GUAEkV7Es0LFMBn
         zRNYUoLmmTrN+hiAfV4OgKS4RFICZ1C8nc6bdJKzSga8Rpu7IR4fNADZe3PWCyGw20r3
         jZHJq71k+ha+w4XGnVWOh3c5RVoMza/LxjTeP3FhXmCTM+3aYGvZXYDC/Q0d6l1rUfLr
         JNRA==
X-Gm-Message-State: AOAM530MUUmqIYoL4oLOy3WboOgK+IZJKpeuN9dGNAK2uFy5sm71dyeS
        9eLoADOVMwzpjJsaw8gsz7CzB1GELMcTPkbMjQyJDmjRTi6RDuLEOun4Cou1GKcHDk0HD1M/bNp
        I9P1cZhX493AU8LiC14asjUBx
X-Received: by 2002:a92:7704:: with SMTP id s4mr19994849ilc.290.1592086341099;
        Sat, 13 Jun 2020 15:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+//kWNb9V2Ow5xh8TBnmfbyli85orS09mQYbNbn0QSH892okmXW7q54bX3ExekcIPhamNng==
X-Received: by 2002:a92:7704:: with SMTP id s4mr19994833ilc.290.1592086340807;
        Sat, 13 Jun 2020 15:12:20 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id z12sm5285868iol.15.2020.06.13.15.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 15:12:19 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Fugang Duan <fugang.duan@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: busses: Fix a reference count leak.
Date:   Sat, 13 Jun 2020 17:12:13 -0500
Message-Id: <20200613221213.6679-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 9db6ccded5e9..85b9c1fc7681 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -260,8 +260,10 @@ static int lpi2c_imx_master_enable(struct lpi2c_imx_struct *lpi2c_imx)
 	int ret;
 
 	ret = pm_runtime_get_sync(lpi2c_imx->adapter.dev.parent);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(lpi2c_imx->adapter.dev.parent);
 		return ret;
+	}
 
 	temp = MCR_RST;
 	writel(temp, lpi2c_imx->base + LPI2C_MCR);
-- 
2.17.1

