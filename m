Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D29DF84B10
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 13:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfHGLwG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 7 Aug 2019 07:52:06 -0400
Received: from skedge04.snt-world.com ([91.208.41.69]:33986 "EHLO
        skedge04.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfHGLwF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 07:52:05 -0400
X-Greylist: delayed 475 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Aug 2019 07:52:04 EDT
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge04.snt-world.com (Postfix) with ESMTPS id 5673467A8CC;
        Wed,  7 Aug 2019 13:44:07 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 7 Aug 2019
 13:44:06 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 7 Aug 2019 13:44:06 +0200
From:   Schrempf Frieder <frieder.schrempf@kontron.de>
To:     Wolfram Sang <wsa@the-dreams.de>, Jean Delvare <jdelvare@suse.de>,
        "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Ajay Gupta <ajayg@nvidia.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Elie Morisse <syniurge@gmail.com>,
        Stefan Roese <sr@denx.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: imx: Allow the driver to be built for ARM64 SoCs such as
 i.MX8M
Thread-Topic: [PATCH] i2c: imx: Allow the driver to be built for ARM64 SoCs
 such as i.MX8M
Thread-Index: AQHVTRVrY8XY4w2l80SM63DeuQxTsA==
Date:   Wed, 7 Aug 2019 11:44:06 +0000
Message-ID: <20190807114332.13312-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 5673467A8CC.AEADE
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: ajayg@nvidia.com, f.fainelli@gmail.com,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de, jfi@ssv-embedded.de,
        kdasu.kdev@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@crapouillou.net,
        shreesha.rajashekar@broadcom.com, sr@denx.de, syniurge@gmail.com,
        vigneshr@ti.com, wsa@the-dreams.de
X-Spam-Status: No
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The imx I2C controller is used in some ARM64 SoCs such as i.MX8M.
To make use of it, append ARM64 to the list of dependencies.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 09367fc014c3..46b653621513 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -664,7 +664,7 @@ config I2C_IMG
 
 config I2C_IMX
 	tristate "IMX I2C interface"
-	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE
+	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE || ARM64
 	help
 	  Say Y here if you want to use the IIC bus controller on
 	  the Freescale i.MX/MXC, Layerscape or ColdFire processors.
-- 
2.17.1
