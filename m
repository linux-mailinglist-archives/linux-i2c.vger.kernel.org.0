Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60E14D7F4C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 10:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236907AbiCNKAe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 06:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236723AbiCNKAd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 06:00:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018B413FA7;
        Mon, 14 Mar 2022 02:59:24 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id yy13so32634922ejb.2;
        Mon, 14 Mar 2022 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PsQNFBWA1EYlWL3JRbf/rtOCOkamxrVDSuDVIjgIR4o=;
        b=Odt8+9N/t1UJqOHii0oFmoTGa0XVGEaSk0m+Opd7PNjwmGiA19Z3+Z0YGXQAhHm6Io
         9qJBRjGF9EW/BnKor8o6eob+8rCP5x6u9/lmIyJZiUPx/U9Hvs6/T/OzsMWy/gwM4aZy
         lY/IadiLCsMmVCyEzhI6q6utFcl/f8X3tWz+cwrRyJ6Dlb4+08dS4ITreAlbPVfRKWxV
         KDvk+QZB27zthh5VrdbjK30KUSYA6sYWJIzCmZ7UVc51+SzRjhTdh8RnUTU+WiH36JMq
         YNVuyQj4NLs2/lzzq+I+U7CAh27sAf0W5EU/2bMHbSLSOnbVoE9frKv593Oci6iE9fuh
         0b9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PsQNFBWA1EYlWL3JRbf/rtOCOkamxrVDSuDVIjgIR4o=;
        b=mIc51MuHaFDs0D1ls5P1qxH3YRQ0D1cB6AuO1copwsuoXk7D4BIXsD7s2g8e7dl6oT
         Up3mN98BXqpO06zt1s27xx6V8x8btcQN6btQlt6gkiOZsml0aVstOfxw2CLEdO8+bC+b
         5oo3zsNl6+TBjGj1KzNWBzYd96a4//HPGrSmQKz4CKOYdcYkknKheYLvztLawfkNEr/5
         9p8n5RnoBQhJjZKqlXNIcsyjIlwIFnqjOA9HDyiYlOZbuZpfrsXSMg+qmtDwwFJvPttw
         fuA/yFLfBSRUVFJI6JBfd/nr52AZBzzsWzbgvJHDz/ObIvsCOYP3CDXKS58ZQj5LpGPN
         HAxg==
X-Gm-Message-State: AOAM531Ld7wx9dYpks8JA9JSsvOQLuwoPQ7yHd7UK+P6uktfhi2vgSbG
        +vCsGlxX99+jmk3t4BM6i6w=
X-Google-Smtp-Source: ABdhPJzXCHhNgZJb8D0D1qr9Mm4UXShFVL/kE231KCbkM3J6kKbxUDbSJgKYRl7pYdyLICPzW3Bsmw==
X-Received: by 2002:a17:906:9704:b0:6da:aa98:d459 with SMTP id k4-20020a170906970400b006daaa98d459mr18549838ejx.294.1647251962463;
        Mon, 14 Mar 2022 02:59:22 -0700 (PDT)
Received: from NB2240.irisgmbh.local (p200300c3af44a500646b36c3c097229d.dip0.t-ipconnect.de. [2003:c3:af44:a500:646b:36c3:c097:229d])
        by smtp.gmail.com with ESMTPSA id gv9-20020a170906f10900b006d7128b2e6fsm6598648ejb.162.2022.03.14.02.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 02:59:21 -0700 (PDT)
From:   Ian Dannapel <iansdannapel@gmail.com>
To:     linux@rempel-privat.de
Cc:     kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Michael.Glembotzki@iris-sensing.com,
        Erik.Schumacher@iris-sensing.com,
        Ian Dannapel <iansdannapel@gmail.com>
Subject: [PATCH] i2c: imx: remove unnecessary delay at startup
Date:   Mon, 14 Mar 2022 10:59:18 +0100
Message-Id: <20220314095918.50014-1-iansdannapel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

a delay on the startup of the i2c imx controller is not required or defined in the specs.
By removing it, the user can see a latency decrease from up to 150μs in communication.
Additional info: https://lore.kernel.org/all/20220304132037.GA15901@pengutronix.de/

Signed-off-by: Ian S. Dannapel <iansdannapel@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3576b63a6c03..019dda5301df 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -602,12 +602,6 @@ static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
 	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
 	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode, i2c_imx, IMX_I2C_I2CR);
 
-	/* Wait controller to be stable */
-	if (atomic)
-		udelay(50);
-	else
-		usleep_range(50, 150);
-
 	/* Start I2C transaction */
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp |= I2CR_MSTA;
-- 
2.25.1

