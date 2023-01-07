Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165EC660EDA
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 13:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjAGMiY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 07:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjAGMiX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 07:38:23 -0500
X-Greylist: delayed 311 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 07 Jan 2023 04:38:21 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935D1669B7
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 04:38:21 -0800 (PST)
Received: from stefanw-SCHENKER ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MIxFi-1pU1L41Ija-00KTC1; Sat, 07 Jan 2023 13:32:52 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] i2c: mxs: suppress probe-deferral error message
Date:   Sat,  7 Jan 2023 13:32:29 +0100
Message-Id: <20230107123229.4218-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1JFncqfJNBelAj2BLAtOGL4WUV2LcV+V0yMpxY1xS4rxd8ABoRL
 7eCzydnTcFNjq2eU9DTonwTPyHRc9xv0Tca0Oo6XtFos3SPQfJcCwYSQDz9d8tkEPh4Lgwr
 PprWSksWWPFDZxeZi5dIgZHo6/a6norkQg4nU4m/FyYWBMnXJBtrftcf6L6mFNNQklz/QDv
 n2oV/3Ao4Gd6DvqLqGsSA==
UI-OutboundReport: notjunk:1;M01:P0:tn8hCM74haU=;vXYM7o2IWYqnimuUZ92Y7EQrifx
 uFgW9ALaSYciBDw9Hnfd0L9VjhSfSOADrpUMpDPc509HuCUDByHq1MbNixwRyUzGx13589+q7
 fGHTjiw2z1sjjNNZzqUVXai6kL5VzL2vn/m3PhQiR6hwdJ3fhk7kNBCnEWqPZKWl9xQoSLmbT
 Z4QcFIzC55UclLqa761y03ruqhKuYrgWHuEhMM4Jfg/85gIGGOgnLZ6xaVJGdtV/vlDP4mi5L
 RcpDgYcnVLcl05ccqAi9aOCIsWaNxggWOO7pB4XREZITEkt74YHLbpmYQTPSTWwi+KYNexHkS
 FEx4ITGjQv/hhVCqZUHmbHPUgY5A+crsFQpAXvlHDjAwEFrpKoobQWs44OmivhUMTdC9RqbT8
 2M1HC12Vktvb2OCgSbreptpTZACS6UjIRVnQAfZ+/dHIKucHJdR4tBcKGabHlc/NVzrNCewv6
 fhU7EmgYQCQJ3KFXE9NRYPkGPDSsB31s/UTtEGRoLy4Q1aFgtEDqrnbJhyoMbr7REpk4Z1ewN
 FCqg6861oYyDzTdbNhNMGk/Nz/wT7/Z4aBT9tvst5GrqSzCvlW6MXsxX8ShdvJlj/OLTRvqd7
 A1rXtHXvku5qn/x64Qww1bcZJ97NUBXyZeP0NATRfL7Rmbfx7wsbIj4JArFEpHadjIYlRW9fX
 4tiYntFmUZi3r4teCMo2JINp9BkgTJRzRJfBNgzymw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

During boot of I2SE Duckbill the kernel log contains a
confusing error:

  Failed to request dma

This is caused by i2c-mxs tries to request a not yet available DMA
channel (-EPROBE_DEFER). So suppress this message by using
dev_err_probe().

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 5af5cffc444e..d113bed79545 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -826,8 +826,8 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	/* Setup the DMA */
 	i2c->dmach = dma_request_chan(dev, "rx-tx");
 	if (IS_ERR(i2c->dmach)) {
-		dev_err(dev, "Failed to request dma\n");
-		return PTR_ERR(i2c->dmach);
+		return dev_err_probe(dev, PTR_ERR(i2c->dmach),
+				     "Failed to request dma\n");
 	}
 
 	platform_set_drvdata(pdev, i2c);
-- 
2.34.1

