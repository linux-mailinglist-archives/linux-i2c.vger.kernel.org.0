Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60837724538
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 16:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbjFFOEs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 10:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237751AbjFFOEd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 10:04:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C8A0E42;
        Tue,  6 Jun 2023 07:04:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,221,1681138800"; 
   d="scan'208";a="162422096"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Jun 2023 23:04:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B2718400F73D;
        Tue,  6 Jun 2023 23:04:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH] MAINTAINERS: Add entries for Renesas RZ/V2M I2C driver
Date:   Tue,  6 Jun 2023 15:04:26 +0100
Message-Id: <20230606140426.383462-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the MAINTAINERS entries for the Renesas RZ/V2M I2C driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a1ae22c0eab..c64919fc3b8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18147,6 +18147,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2M I2C DRIVER
+M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
+F:	drivers/i2c/busses/i2c-rzv2m.c
+
 RENESAS USB PHY DRIVER
 M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.25.1

