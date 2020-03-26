Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7C931949F8
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgCZVLF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:11:05 -0400
Received: from sauhun.de ([88.99.104.3]:54576 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727972AbgCZVKQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:16 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 3626F2C1F8B;
        Thu, 26 Mar 2020 22:10:15 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: mach-s3c64xx: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:10:14 +0100
Message-Id: <20200326211014.13591-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211014.13591-1-wsa+renesas@sang-engineering.com>
References: <20200326211014.13591-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and remove printing a stale 'ret'
value.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index 937d0a83f8fd..34f1baa10c54 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -405,10 +405,9 @@ static int wlf_gf_module_probe(struct i2c_client *i2c,
 			 gf_mods[i].name, rev + 1);
 
 		for (j = 0; j < gf_mods[i].num_i2c_devs; j++) {
-			if (!i2c_new_device(i2c->adapter,
-					    &(gf_mods[i].i2c_devs[j])))
-				dev_err(&i2c->dev,
-					"Failed to register dev: %d\n", ret);
+			if (IS_ERR(i2c_new_client_device(i2c->adapter,
+							 &(gf_mods[i].i2c_devs[j]))))
+				dev_err(&i2c->dev, "Failed to register\n");
 		}
 
 		spi_register_board_info(gf_mods[i].spi_devs,
-- 
2.20.1

