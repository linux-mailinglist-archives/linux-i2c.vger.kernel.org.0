Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A62245773E0
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jul 2022 05:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiGQDsQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 23:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbiGQDsJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 23:48:09 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C201E17E2A
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:08 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10bd4812c29so15714407fac.11
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y1Z7tiCUOCROwXa2SQqXBTnkJtu9davb+q/iCGv2BZ8=;
        b=PGXDojd3zELY6mETwkMfKCyQ2Bl53TCqJ5W1D4jlWj/DprutvEUs4mSMnMnohxw8Zd
         JLlN1rb5zIHKjLk3bz/gBS3DUJzTq1DA6d4xKM37lAnrsX5n7tSm9GXJIaJjfHbmL1aa
         iwOQCkSWgJUlX+qnO4MKbs5YtYddnMScjRN8M7hPdiTvSh1SAwXcGH5iKvlOZuYSOVaa
         IgfClQZxUJDGFZQGlYPZkDSibYMZN/PqYLaj/ULpShPcVIqzB5TbVrqrl2E7ARkXsTqv
         NAD2yJY5zZDglwjBOQHyCCjPwoccMrMs9WOjlMcXaDSDNMlzh1/BKxMNsgyQv6mK523P
         2ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y1Z7tiCUOCROwXa2SQqXBTnkJtu9davb+q/iCGv2BZ8=;
        b=C4uCbD7RPOd4+aHMMgwsy+DIQvP0MnF/xDB0PrjuMTxSIgimOfUZw2g4gKpAJxUPvE
         hFmyciz3foWrVg8zHnbbyLHgz6j1+szEjAliU2hyuu9FQOUg4CT1XhfIes8qNRRpfjKP
         55oxhykVUu5pzrmQ20wlSEMTE4VQrAR2JHdyH2VV0G04sl9IjdHXdKWYdgPJDuaTMm/q
         cfhqLhg6wkoOF6t6O/YGdgdgMmCJEUH2W/XWWZIHXByIrfnJVe67Tb0YeUz8+g3abpBU
         4+EdLJ7NcIlqB1RhuiLHKh2vVixLch3LcS1PnqwtZyl527u2zmXLnIzk/w4d9fpI1HXH
         xJyg==
X-Gm-Message-State: AJIora/zuaPmDUhpsKlONr6z1h7G9fGtRq+0oRh9Vpxbfwi0IvfIZUlk
        LsayRSam5c8T9UjuS/N88y9zKA==
X-Google-Smtp-Source: AGRyM1v2PTYdi+yjjcTs9y0/ctAEeup5BimBWYWwGb4JyYeHa8XPuxOfHS5wHv5v+l7/nHRJX92SWQ==
X-Received: by 2002:a05:6808:f02:b0:33a:59a3:3a12 with SMTP id m2-20020a0568080f0200b0033a59a33a12mr3954211oiw.181.1658029688441;
        Sat, 16 Jul 2022 20:48:08 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e65-20020aca3744000000b0033a169f9282sm3004515oia.52.2022.07.16.20.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:48:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i2c: qcom-geni: Propagate GENI_ABORT_DONE to geni_i2c_abort_xfer()
Date:   Sat, 16 Jul 2022 20:50:26 -0700
Message-Id: <20220717035027.2135106-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Waiting for M_CMD_ABORT_EN in geni_i2c_abort_xfer() races with the
interrupt handler which will read and clear the abort bit, the result is
that every abort attempt takes 1 second and is followed by a message
about the abort having times out.

Introduce a new state variable to carry the abort_done state from the
interrupt handler back to geni_i2c_abort_xfer().

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3bec7c782824..e212e7ae7ad2 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -97,6 +97,7 @@ struct geni_i2c_dev {
 	struct dma_chan *tx_c;
 	struct dma_chan *rx_c;
 	bool gpi_mode;
+	bool abort_done;
 };
 
 struct geni_i2c_err_log {
@@ -203,9 +204,14 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 		dev_dbg(gi2c->se.dev, "len:%d, slv-addr:0x%x, RD/WR:%d\n",
 			gi2c->cur->len, gi2c->cur->addr, gi2c->cur->flags);
 
-	if (err != NACK && err != GENI_ABORT_DONE) {
+	switch (err) {
+	case GENI_ABORT_DONE:
+		gi2c->abort_done = true;
+		break;
+	default:
 		dev_err(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
 		geni_i2c_err_misc(gi2c);
+		break;
 	}
 }
 
@@ -311,21 +317,21 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 
 static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
 {
-	u32 val;
 	unsigned long time_left = ABORT_TIMEOUT;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gi2c->lock, flags);
 	geni_i2c_err(gi2c, GENI_TIMEOUT);
 	gi2c->cur = NULL;
+	gi2c->abort_done = false;
 	geni_se_abort_m_cmd(&gi2c->se);
 	spin_unlock_irqrestore(&gi2c->lock, flags);
+
 	do {
 		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
-		val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
-	} while (!(val & M_CMD_ABORT_EN) && time_left);
+	} while (!gi2c->abort_done && time_left);
 
-	if (!(val & M_CMD_ABORT_EN))
+	if (!time_left)
 		dev_err(gi2c->se.dev, "Timeout abort_m_cmd\n");
 }
 
-- 
2.35.1

