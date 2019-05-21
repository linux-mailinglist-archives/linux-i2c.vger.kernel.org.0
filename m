Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F27D224A25
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfEUIVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:21:48 -0400
Received: from sauhun.de ([88.99.104.3]:32990 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbfEUIVs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:21:48 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id 85F532C775D;
        Tue, 21 May 2019 10:21:47 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH 8/8] MAINTAINERS: add I2C DT bindings to vt8500 architecture
Date:   Tue, 21 May 2019 10:21:37 +0200
Message-Id: <20190521082137.2889-9-wsa@the-dreams.de>
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
Cc: Tony Prisk <linux@prisktech.co.nz>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 169131ff33ca..c0a3cbafdc0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2474,6 +2474,7 @@ ARM/VT8500 ARM ARCHITECTURE
 M:	Tony Prisk <linux@prisktech.co.nz>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c
 F:	drivers/i2c/busses/i2c-wmt.c
-- 
2.19.1

