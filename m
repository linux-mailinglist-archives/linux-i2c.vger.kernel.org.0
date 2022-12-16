Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E957664E902
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 11:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiLPKCg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 05:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbiLPKCb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 05:02:31 -0500
X-Greylist: delayed 4634 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Dec 2022 02:02:28 PST
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E25A4A590
        for <linux-i2c@vger.kernel.org>; Fri, 16 Dec 2022 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=SrepTQUYC3p/BhSro147vpEd1UGiig9d/PvJMssI4IQ=; b=ZINQKYDVIRatBAb/YPUoZpKcNf
        MI0+cGB2veaSxlC+MSawASs0OCSkAhHncguoGN9RjM/x00UIORhgCMLvUE0zAFqTUY9yARD7SPEmd
        +p6ygVhh/q3DCF2iOE89G0tAP7otNmcLku45Viumj9Zje3fPiyHbSN61V0eJv6/UW6Mn4DAzTb4ue
        H4yc5ZbIVE8f1czj1CUyuDb9XJlaXVfZvhbN3NXyQ3U3ums6vkznOsQ+Uy3sys3/7MGPkw51bCIR/
        MQltLGQHDWUHVYEbjePlSdcoVd9tjEr+S3tCUNXUNFyeEe3g3KVV/Q06BWXZ/qHkHTO3IVV8l1j1V
        C1NcqBAw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:47806 helo=z840.regau.abatec.at)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <primoz.fiser@norik.com>)
        id 1p66Kz-004ran-L2;
        Fri, 16 Dec 2022 09:45:09 +0100
From:   Primoz Fiser <primoz.fiser@norik.com>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     upstream@lists.phytec.de
Subject: [PATCH] i2c: imx: increase retries on arbitration loss
Date:   Fri, 16 Dec 2022 09:45:11 +0100
Message-Id: <20221216084511.2576786-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

By default, retries value is set to 0 (no retries). Set retries to more
sensible value of 3 to allow i2c core to re-attempt transfer in case of
i2c arbitration loss (i2c-imx returns -EAGAIN errno is such case).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cf5bacf3a488..6a5694cfe1cc 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1478,6 +1478,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	i2c_imx->adapter.dev.parent	= &pdev->dev;
 	i2c_imx->adapter.nr		= pdev->id;
 	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
+	i2c_imx->adapter.retries	= 3;
 	i2c_imx->base			= base;
 	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
-- 
2.25.1

