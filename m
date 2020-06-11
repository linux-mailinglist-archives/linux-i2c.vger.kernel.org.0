Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1071F6638
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jun 2020 13:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgFKLFl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jun 2020 07:05:41 -0400
Received: from mga14.intel.com ([192.55.52.115]:28971 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727840AbgFKLFl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jun 2020 07:05:41 -0400
IronPort-SDR: /YRXNPWywEyBVRL4zgbMVKtdIeD3V9380EnfCsoG5cJvdnNJpLL6ZoXIi1y0fK1envnzQgWbom
 naKH2GS+KuHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 04:05:40 -0700
IronPort-SDR: HTgK8TZQATbp8sY9WMlJKoGXFiH4k/D/RTkhq7B+G4w5len6o1bHHpnsjjggqjWWQIWVs2pUvb
 wm/NJ9J3pGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; 
   d="scan'208";a="473764674"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.69])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2020 04:05:36 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Barry Song <baohua@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2] i2c: Use separate MODULE_AUTHOR() statements for multiple authors
Date:   Thu, 11 Jun 2020 14:05:34 +0300
Message-Id: <20200611110534.3274710-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Modules with multiple authors should use multiple MODULE_AUTHOR()
statements according to comment in include/linux/module.h.

Split the i2c modules with multiple authors to use multiple
MODULE_AUTHOR() statements.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: Jean Delvare noticed i2c-nomadik.c, i2c-sirf.c and i2c-viapro.c were
missing. Refer to module.h comment in commit log message.
I decided to change all these modules in one patch. I can split if needed.
---
 drivers/i2c/algos/i2c-algo-pca.c   | 4 ++--
 drivers/i2c/busses/i2c-ali1535.c   | 8 ++++----
 drivers/i2c/busses/i2c-ali15x3.c   | 6 +++---
 drivers/i2c/busses/i2c-emev2.c     | 3 ++-
 drivers/i2c/busses/i2c-i801.c      | 3 ++-
 drivers/i2c/busses/i2c-nomadik.c   | 3 ++-
 drivers/i2c/busses/i2c-piix4.c     | 4 ++--
 drivers/i2c/busses/i2c-pnx.c       | 3 ++-
 drivers/i2c/busses/i2c-sh_mobile.c | 3 ++-
 drivers/i2c/busses/i2c-sibyte.c    | 3 ++-
 drivers/i2c/busses/i2c-sirf.c      | 4 ++--
 drivers/i2c/busses/i2c-viapro.c    | 6 +++---
 drivers/i2c/i2c-dev.c              | 4 ++--
 13 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-algo-pca.c
index 7f10312d1b88..8620963e442c 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -541,8 +541,8 @@ int i2c_pca_add_numbered_bus(struct i2c_adapter *adap)
 }
 EXPORT_SYMBOL(i2c_pca_add_numbered_bus);
 
-MODULE_AUTHOR("Ian Campbell <icampbell@arcom.com>, "
-	"Wolfram Sang <kernel@pengutronix.de>");
+MODULE_AUTHOR("Ian Campbell <icampbell@arcom.com>");
+MODULE_AUTHOR("Wolfram Sang <kernel@pengutronix.de>");
 MODULE_DESCRIPTION("I2C-Bus PCA9564/PCA9665 algorithm");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index a43deea390f5..fb93152845f4 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -519,9 +519,9 @@ static struct pci_driver ali1535_driver = {
 
 module_pci_driver(ali1535_driver);
 
-MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>, "
-	      "Philip Edelbrock <phil@netroedge.com>, "
-	      "Mark D. Studebaker <mdsxyz123@yahoo.com> "
-	      "and Dan Eaton <dan.eaton@rocketlogix.com>");
+MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
+MODULE_AUTHOR("Philip Edelbrock <phil@netroedge.com>");
+MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>");
+MODULE_AUTHOR("Dan Eaton <dan.eaton@rocketlogix.com>");
 MODULE_DESCRIPTION("ALI1535 SMBus driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 02185a1cfa77..cc58feacd082 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -502,8 +502,8 @@ static struct pci_driver ali15x3_driver = {
 
 module_pci_driver(ali15x3_driver);
 
-MODULE_AUTHOR ("Frodo Looijaard <frodol@dds.nl>, "
-		"Philip Edelbrock <phil@netroedge.com>, "
-		"and Mark D. Studebaker <mdsxyz123@yahoo.com>");
+MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
+MODULE_AUTHOR("Philip Edelbrock <phil@netroedge.com>");
+MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>");
 MODULE_DESCRIPTION("ALI15X3 SMBus driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 1a319352e51b..a08554c1a570 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -442,6 +442,7 @@ static struct platform_driver em_i2c_driver = {
 module_platform_driver(em_i2c_driver);
 
 MODULE_DESCRIPTION("EMEV2 I2C bus driver");
-MODULE_AUTHOR("Ian Molton and Wolfram Sang <wsa@sang-engineering.com>");
+MODULE_AUTHOR("Ian Molton");
+MODULE_AUTHOR("Wolfram Sang <wsa@sang-engineering.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DEVICE_TABLE(of, em_i2c_ids);
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index fea644921a76..1fc7ae77753d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1986,7 +1986,8 @@ static void __exit i2c_i801_exit(void)
 	pci_unregister_driver(&i801_driver);
 }
 
-MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>, Jean Delvare <jdelvare@suse.de>");
+MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>");
+MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("I801 SMBus driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index e1e8d4ef9aa7..d4b1b0865f67 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1122,6 +1122,7 @@ static void __exit nmk_i2c_exit(void)
 subsys_initcall(nmk_i2c_init);
 module_exit(nmk_i2c_exit);
 
-MODULE_AUTHOR("Sachin Verma, Srinidhi KASAGAR");
+MODULE_AUTHOR("Sachin Verma");
+MODULE_AUTHOR("Srinidhi KASAGAR");
 MODULE_DESCRIPTION("Nomadik/Ux500 I2C driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 69740a4ff1db..8c1b31ed0c42 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -1032,7 +1032,7 @@ static struct pci_driver piix4_driver = {
 
 module_pci_driver(piix4_driver);
 
-MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl> and "
-		"Philip Edelbrock <phil@netroedge.com>");
+MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
+MODULE_AUTHOR("Philip Edelbrock <phil@netroedge.com>");
 MODULE_DESCRIPTION("PIIX4 SMBus driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 5d7207c10f1d..8c4ec7f13f5a 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -781,7 +781,8 @@ static void __exit i2c_adap_pnx_exit(void)
 	platform_driver_unregister(&i2c_pnx_driver);
 }
 
-MODULE_AUTHOR("Vitaly Wool, Dennis Kovalev <source@mvista.com>");
+MODULE_AUTHOR("Vitaly Wool");
+MODULE_AUTHOR("Dennis Kovalev <source@mvista.com>");
 MODULE_DESCRIPTION("I2C driver for Philips IP3204-based I2C busses");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:pnx-i2c");
diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 2cca1b21e26e..cab725559999 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -932,6 +932,7 @@ static void __exit sh_mobile_i2c_adap_exit(void)
 module_exit(sh_mobile_i2c_adap_exit);
 
 MODULE_DESCRIPTION("SuperH Mobile I2C Bus Controller driver");
-MODULE_AUTHOR("Magnus Damm and Wolfram Sang");
+MODULE_AUTHOR("Magnus Damm");
+MODULE_AUTHOR("Wolfram Sang");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:i2c-sh_mobile");
diff --git a/drivers/i2c/busses/i2c-sibyte.c b/drivers/i2c/busses/i2c-sibyte.c
index 9dcea2ba7168..8f71f01cb169 100644
--- a/drivers/i2c/busses/i2c-sibyte.c
+++ b/drivers/i2c/busses/i2c-sibyte.c
@@ -180,6 +180,7 @@ static void __exit i2c_sibyte_exit(void)
 module_init(i2c_sibyte_init);
 module_exit(i2c_sibyte_exit);
 
-MODULE_AUTHOR("Kip Walker (Broadcom Corp.), Steven J. Hill <sjhill@realitydiluted.com>");
+MODULE_AUTHOR("Kip Walker (Broadcom Corp.)");
+MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
 MODULE_DESCRIPTION("SMBus adapter routines for SiByte boards");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
index d7f72ec331e8..30db8fafe078 100644
--- a/drivers/i2c/busses/i2c-sirf.c
+++ b/drivers/i2c/busses/i2c-sirf.c
@@ -470,6 +470,6 @@ static struct platform_driver i2c_sirfsoc_driver = {
 module_platform_driver(i2c_sirfsoc_driver);
 
 MODULE_DESCRIPTION("SiRF SoC I2C master controller driver");
-MODULE_AUTHOR("Zhiwu Song <Zhiwu.Song@csr.com>, "
-	"Xiangzhen Ye <Xiangzhen.Ye@csr.com>");
+MODULE_AUTHOR("Zhiwu Song <Zhiwu.Song@csr.com>");
+MODULE_AUTHOR("Xiangzhen Ye <Xiangzhen.Ye@csr.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/i2c/busses/i2c-viapro.c b/drivers/i2c/busses/i2c-viapro.c
index 4abc7771af06..05aa92a3fbe0 100644
--- a/drivers/i2c/busses/i2c-viapro.c
+++ b/drivers/i2c/busses/i2c-viapro.c
@@ -489,9 +489,9 @@ static void __exit i2c_vt596_exit(void)
 	}
 }
 
-MODULE_AUTHOR("Kyosti Malkki <kmalkki@cc.hut.fi>, "
-	      "Mark D. Studebaker <mdsxyz123@yahoo.com> and "
-	      "Jean Delvare <jdelvare@suse.de>");
+MODULE_AUTHOR("Kyosti Malkki <kmalkki@cc.hut.fi>");
+MODULE_AUTHOR("Mark D. Studebaker <mdsxyz123@yahoo.com>");
+MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("vt82c596 SMBus driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index da020acc9bbd..6ceb11cc4be1 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -761,8 +761,8 @@ static void __exit i2c_dev_exit(void)
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 }
 
-MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl> and "
-		"Simon G. Vogl <simon@tk.uni-linz.ac.at>");
+MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
+MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C /dev entries driver");
 MODULE_LICENSE("GPL");
 
-- 
2.26.2

