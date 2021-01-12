Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4ED92F2A5F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 09:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392378AbhALIx7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 03:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729189AbhALIx7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 03:53:59 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2CEC061575;
        Tue, 12 Jan 2021 00:53:18 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id 15so992699pgx.7;
        Tue, 12 Jan 2021 00:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iCD56C5pg1d1NTNumNDFp4t2vfpUV33Zv3uz34vtHcM=;
        b=cgvc90vIzF3OIyMlOfnqqxO/AsGLIEc5lSv8L3t2RrsXjaJSpeCOzyADwRMLDX80mh
         XpILvChB1UGanSwSh6JXbZ8EScoCziyl+K42gASbMI+uL3K0M5xenZza2PmsE8rxiewr
         RmrdDkT78NsO6+6ElPSNuO05ompOuvhNXk0PiqqbSUs27UsWrZIvvWL1WFTD5Es//tkj
         /REpahA1UzM1SenWXb0wydnkdyTr1V3jNmT/sK4JbxNp5RolCN6t4fWA8PWmch0bwevM
         5Pm0JULrnTj4LU7tpifvD5+Yq4FbhTHKF9P8iL02bH7IJIP8r55DIomBY10uwBILvvXi
         YBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iCD56C5pg1d1NTNumNDFp4t2vfpUV33Zv3uz34vtHcM=;
        b=qrsnneYKzWKAzcioR+UyKw2l0q8J38Cwnv7iiCbNZ/A64XpsMAag1VtB/VNAUdXPMP
         fUQfu48YqAmLHnHkm0xUUssscB1ERbsMsWW4xj0AmHDotVlWXdEaPF63N/q5IICRnAzY
         /a6AGWkKfLqW2q3v5w/hiGh0io/pOGy5oRw35N5UpO1VilvVTj7vfxgCsJ8IwCmRyGth
         qHavq66stWXidFCd4Nuh5m+ihfJKB9eXt4NvAfltaAMwh6LfLNxc642dTx5kV4HpvaAb
         6cpIHfksDDowJHJKPNGzhYoqaGjKfqMNGQ4f7uDcqIkrbgedsVYJG0FkXfERyRDSaFaj
         fRLQ==
X-Gm-Message-State: AOAM533bm9jaDHbUtzIBenkLCkxg8aBHyTx+H1/91frtYMPd3fiO1uiN
        3p7m+V27og4kl+j5GPBFLXQ=
X-Google-Smtp-Source: ABdhPJwWcJw4BGKctgBn3fXpdsTZXyGdlSBNAKK3KdVpgrKCr7T/XRv51DVD9EnvtC9WsP84zj53Ww==
X-Received: by 2002:a63:d246:: with SMTP id t6mr3727099pgi.283.1610441598288;
        Tue, 12 Jan 2021 00:53:18 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
        by smtp.gmail.com with ESMTPSA id 198sm2392803pfw.29.2021.01.12.00.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 00:53:17 -0800 (PST)
From:   menglong8.dong@gmail.com
X-Google-Original-From: dong.menglong@zte.com.cn
To:     pierre-yves.mordret@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Menglong Dong <dong.menglong@zte.com.cn>
Subject: [PATCH] i2c: remove redundant error print in stm32f7_i2c_probe
Date:   Tue, 12 Jan 2021 00:53:11 -0800
Message-Id: <20210112085311.7308-1-dong.menglong@zte.com.cn>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Menglong Dong <dong.menglong@zte.com.cn>

Coccinelle reports a redundant error print in stm32f7_i2c_probe.
As 'platform_get_irq' already prints the error message, error
print here is redundant and can be removed.

Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 9aa8e65b511e..adba496e1e31 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2026,12 +2026,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	}
 
 	irq_error = platform_get_irq(pdev, 1);
-	if (irq_error <= 0) {
-		if (irq_error != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get IRQ error: %d\n",
-				irq_error);
+	if (irq_error <= 0)
 		return irq_error ? : -ENOENT;
-	}
 
 	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
 						    "wakeup-source");
-- 
2.17.1

