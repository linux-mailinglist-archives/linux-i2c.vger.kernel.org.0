Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A90219B7B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jul 2020 10:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgGIIwP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jul 2020 04:52:15 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:35730 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgGIIwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jul 2020 04:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1594284733; x=1625820733;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SJeJaZ/1hoYVY2IVgf0Jv+RKqEie4ZugrTQ9Fqsezow=;
  b=FW7rG5Erdi6FdkCol3t6mqd6ITpWqf6gTYuRNk80xXOKPST8L7/OebRw
   kuKag3jPkLBXWCZ1quREuCH2KrMSb13qT+kgXaqUTWbWoEO8XurpD5+c6
   s92l7UatL2BXKobPUFMUvnK2d1iI1ww79rlEpLa3Mj4lExz1gwO5uRQEI
   Gsjuo0wDTRvyYOnALE12aZsY0FACDWZe45GLyKsd3qMmTfBuFDptwq1DQ
   w+QZmsETuc9GFPgp9FBfOOpreapyfz2zja7jpW5X2jmG2yGt3Yxd4ci18
   sSzncShWYWap9XFeqRYCLHJ7gWn65BA7xtmEh9trxkQHawz9YzYT5IYvY
   w==;
IronPort-SDR: RHPkbw/1JmymwQQj8yfCxzHEggi94rqU/PNjvIsN3NHlSJkj3wHBorXuDl7Vqq56py8Ae2y/Tr
 wjgsFqsuBUNrIxcKq6HvBQKe0f/y8CpSgbTDIqWifHGg82yS/DcFTdoDOjJNlPiS9KuF6EWaxg
 pl3kr/47keoobPwaehr7UVxwhhmbAIeraI6CgTt0kgTX7fAtrJiNDN6PYSdh/ebxPqb2QThW31
 Ce0+MvY9nIIxHgFBDz0+ZiQC0t+323NkXX3Jac22toorbi8qysL/2MEUitJocMGDxuHlS8ZpNq
 RGY=
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; 
   d="scan'208";a="79254569"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2020 01:52:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 9 Jul 2020 01:52:13 -0700
Received: from ibiza.mchp-main.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 9 Jul 2020 01:51:44 -0700
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     <codrin.ciubotariu@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>,
        "Ludovic Desroches" <ludovic.desroches@microchip.com>
Subject: [PATCH] MAINTAINERS: i2c: at91: handover maintenance to Codrin Ciubotariu
Date:   Thu, 9 Jul 2020 10:42:33 +0200
Message-ID: <20200709084233.7846-1-ludovic.desroches@microchip.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

My colleague Codrin Ciubotariu, now, maintains this driver internally.
Then I handover the mainline maintenance to him.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c87b94e6b2f6..995d2261e022 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11277,7 +11277,7 @@ S:	Maintained
 F:	drivers/crypto/atmel-ecc.*
 
 MICROCHIP I2C DRIVER
-M:	Ludovic Desroches <ludovic.desroches@microchip.com>
+M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
 F:	drivers/i2c/busses/i2c-at91-*.c
-- 
2.24.0

