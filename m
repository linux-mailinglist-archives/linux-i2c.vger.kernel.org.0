Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB0C124A1E
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfEUIVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:21:47 -0400
Received: from sauhun.de ([88.99.104.3]:32982 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfEUIVr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:21:47 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id 82ACC2C776D;
        Tue, 21 May 2019 10:21:45 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 3/8] MAINTAINERS: add I2C DT bindings to LPC platforms
Date:   Tue, 21 May 2019 10:21:32 +0200
Message-Id: <20190521082137.2889-4-wsa@the-dreams.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190521082137.2889-1-wsa@the-dreams.de>
References: <20190521082137.2889-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Cc: Vladimir Zapolskiy <vz@mleia.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90abfe11b05c..01b5579cfa07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1782,6 +1782,7 @@ ARM/LPC18XX ARCHITECTURE
 M:	Vladimir Zapolskiy <vz@mleia.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
 F:	arch/arm/boot/dts/lpc43*
 F:	drivers/i2c/busses/i2c-lpc2k.c
 F:	drivers/memory/pl172.c
@@ -1795,6 +1796,7 @@ M:	Sylvain Lemieux <slemieux.tyco@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 T:	git git://github.com/vzapolskiy/linux-lpc32xx.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-pnx.txt
 F:	arch/arm/boot/dts/lpc32*
 F:	arch/arm/mach-lpc32xx/
 F:	drivers/i2c/busses/i2c-pnx.c
-- 
2.19.1

