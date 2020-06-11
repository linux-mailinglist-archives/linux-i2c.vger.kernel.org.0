Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9361F6550
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jun 2020 12:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgFKKDu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jun 2020 06:03:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:55518 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727037AbgFKKDu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jun 2020 06:03:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id AAB98AEC3;
        Thu, 11 Jun 2020 10:03:52 +0000 (UTC)
Date:   Thu, 11 Jun 2020 12:03:47 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: Drop stray comma in MODULE_AUTHOR statements
Message-ID: <20200611120347.4514e126@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is not the common usage to have a comma between the name and the
email address, so remove it.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/i2c-exynos5.c |    4 ++--
 drivers/i2c/busses/i2c-s3c2410.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--- linux-5.7.orig/drivers/i2c/busses/i2c-exynos5.c	2020-06-01 01:49:15.000000000 +0200
+++ linux-5.7/drivers/i2c/busses/i2c-exynos5.c	2020-06-11 11:58:27.645731676 +0200
@@ -879,6 +879,6 @@ static struct platform_driver exynos5_i2
 module_platform_driver(exynos5_i2c_driver);
 
 MODULE_DESCRIPTION("Exynos5 HS-I2C Bus driver");
-MODULE_AUTHOR("Naveen Krishna Chatradhi, <ch.naveen@samsung.com>");
-MODULE_AUTHOR("Taekgyun Ko, <taeggyun.ko@samsung.com>");
+MODULE_AUTHOR("Naveen Krishna Chatradhi <ch.naveen@samsung.com>");
+MODULE_AUTHOR("Taekgyun Ko <taeggyun.ko@samsung.com>");
 MODULE_LICENSE("GPL v2");
--- linux-5.7.orig/drivers/i2c/busses/i2c-s3c2410.c	2020-06-01 01:49:15.000000000 +0200
+++ linux-5.7/drivers/i2c/busses/i2c-s3c2410.c	2020-06-11 11:58:34.216801885 +0200
@@ -1267,5 +1267,5 @@ static void __exit i2c_adap_s3c_exit(voi
 module_exit(i2c_adap_s3c_exit);
 
 MODULE_DESCRIPTION("S3C24XX I2C Bus driver");
-MODULE_AUTHOR("Ben Dooks, <ben@simtec.co.uk>");
+MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
 MODULE_LICENSE("GPL");


-- 
Jean Delvare
SUSE L3 Support
