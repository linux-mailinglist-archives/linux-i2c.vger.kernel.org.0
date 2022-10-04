Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4BA5F3D31
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Oct 2022 09:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiJDH0b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Oct 2022 03:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJDH0a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Oct 2022 03:26:30 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5D525C61;
        Tue,  4 Oct 2022 00:26:28 -0700 (PDT)
Received: from lenovo.Home (unknown [39.45.148.204])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: usama.anjum)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6DF82660204D;
        Tue,  4 Oct 2022 08:26:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1664868387;
        bh=GFzXf+m70wr+G4QMp+9uqvVswRK2mvuCz/ZYiGRrNgU=;
        h=From:To:Cc:Subject:Date:From;
        b=Qvq1di7KMTRjVGaxniBxNrJHC8crKgP4AQ0A2Enu148GC2E9yXcrYhGONO9m96/GN
         EZEboTTqWy5u8D2FlJaoJfrbyV/bdLOy7NSnllXlh6yCHA3Fil5Zf36EQvNsYsXVE1
         XC8Em5OHRmrVv3P5gGltxElCxdpPMbAELrPaUJHqB9Ox+EFoefV/koIQLyaTBgPxQ6
         Pk2iIVSjslJtxjkvm5wkrn53+Z89a2yj458uHDMix3W9tCcesA/70KYKlXXbQAyuDo
         yA0Vt2Zcd4hYuMKj7w4lr3Kv2zP4292eo+0uNeOeAzxn8rltKVzW4BKdv9VlNPGq86
         Dhw81iBgB36TQ==
From:   Muhammad Usama Anjum <usama.anjum@collabora.com>
To:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Cc:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        kernel@collabora.com, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: microchip: pci1xxxx: Use signed variable
Date:   Tue,  4 Oct 2022 12:26:15 +0500
Message-Id: <20221004072615.550797-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use signed variable to store the negative values correctly to compare
them later with negative values.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index b2b7dbff5ef4..f3c497391d13 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -708,7 +708,7 @@ static void pci1xxxx_i2c_init(struct pci1xxxx_i2c *i2c)
 	void __iomem *p2 = i2c->i2c_base + SMBUS_STATUS_REG_OFF;
 	void __iomem *p1 = i2c->i2c_base + SMB_GPR_REG;
 	u8 regval;
-	u8 ret;
+	s8 ret;
 
 	ret = set_sys_lock(i2c);
 	if (ret == -EPERM) {
-- 
2.30.2

