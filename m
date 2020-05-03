Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAAE1C2CB6
	for <lists+linux-i2c@lfdr.de>; Sun,  3 May 2020 15:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgECNXs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 May 2020 09:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728378AbgECNXs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 May 2020 09:23:48 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48441C061A0C;
        Sun,  3 May 2020 06:23:48 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x6so1001483plv.8;
        Sun, 03 May 2020 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=iSFC45SzZleqEQtMOgbxTxHu0cI+C5iln/qZ/stfWz4=;
        b=WHL2LquvLUyxTY2HKw9fsSSn1uydDuqSKOXsaPRB9ZxLDOqh6rqD5DaqH/hqUf5ErZ
         4012cwKJ+MxJ5dwjf3yG3d2SeR6Z3dDcE6Np91DYd4BNlfMbjKOT9W4FdFQ9ZffJMMm9
         YhxZb14BKzhaFNKisJ667CesfepmRMjgvq6ET6LOLjgFtlzheRU2vTpFcSgobm4Sfj4k
         8AhH5Z83ndxesADhXzOAwu/BRa8B5ahWGi4Ujjukkk1Xitvc1nHTrh+UDjKFeAA3qXJG
         U/UbXT9zxYsBd0WCqyAepDbL8hxTpq0ebkyYSEPYaar4IMmGxC9IlEAiFMIH4eBqeEN+
         iGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iSFC45SzZleqEQtMOgbxTxHu0cI+C5iln/qZ/stfWz4=;
        b=sj3ZfKIHq9Uz2AuIOcnCyK+0d7r3toz1rl0PNdFzCmQHL9qcFfapu7O4tOEyxfA+ir
         2X9JXoVSs2a3F5qf9TrIcqLHWKSdzEG/mIczH+b9UZ1+M71hAKtpgkJUn1S8UflOq9oz
         a+uVSEYvLFWa2DejX2UHjYvyPi1O32aWuGyF6opFW4YAPc6ZcqnaC0E27B2VgdSkhvNP
         J1pRVlKbG7HDXhds3jjaWVWIxMe8SK+cS/kSwVnA+XtBnHShjfxGX65SwWQ8cDGpYTPI
         Tat4iuqAbHyoTmggba1yqSLqd5poWcQ8In3a1vGt+gPlkkbjG9U5ZxcqUq5UHi0vSWNM
         mcxA==
X-Gm-Message-State: AGi0PuZ2GKx5AqNHJJxd63pGgOpcsy9HmT7bToiSMCi7FRwF40kzVu67
        cA+fdzHUrgHzahwkvCOPzC8=
X-Google-Smtp-Source: APiQypIdD7jNt/0XcbilzJsf4d9CM/WtqlgE+2p/WU2k73PcXfw//99bcFIIMghDWFRMiBPA4bS9Hg==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr13647438plz.127.1588512227752;
        Sun, 03 May 2020 06:23:47 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8b:8746:38:47a5:7bcb:f964])
        by smtp.gmail.com with ESMTPSA id l1sm5895875pgn.66.2020.05.03.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 06:23:46 -0700 (PDT)
From:   Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     aishwaryarj100@gmail.com
Subject: [PATCH] i2c: cht-wc: Remove superfluous error message in cht_wc_i2c_adap_i2c_probe()
Date:   Sun,  3 May 2020 18:53:38 +0530
Message-Id: <20200503132339.17718-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The function platform_get_irq can log an error by itself.
This omit a redundant message for exception handling in the
calling function.

Suggested by Coccinelle.

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/i2c/busses/i2c-cht-wc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
index 35e55feda763..343ae5754e6e 100644
--- a/drivers/i2c/busses/i2c-cht-wc.c
+++ b/drivers/i2c/busses/i2c-cht-wc.c
@@ -314,10 +314,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
 	int ret, reg, irq;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Error missing irq resource\n");
+	if (irq < 0)
 		return -EINVAL;
-	}
 
 	adap = devm_kzalloc(&pdev->dev, sizeof(*adap), GFP_KERNEL);
 	if (!adap)
-- 
2.17.1

