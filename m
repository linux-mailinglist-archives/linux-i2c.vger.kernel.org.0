Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709CC249FA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfEUIPi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:15:38 -0400
Received: from sauhun.de ([88.99.104.3]:32900 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbfEUIPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:15:38 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id BA58B2C775D;
        Tue, 21 May 2019 10:15:36 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 5/6] MAINTAINERS: add DT bindings to Renesas R-Car I2C drivers
Date:   Tue, 21 May 2019 10:15:08 +0200
Message-Id: <20190521081509.2586-6-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190521081509.2586-1-wsa@the-dreams.de>
References: <20190521081509.2586-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dd1a31c2667..c99b46e16b42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13392,6 +13392,8 @@ F:	drivers/iio/adc/rcar-gyroadc.c
 RENESAS R-CAR I2C DRIVERS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
 
-- 
2.19.1

