Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDF7424A21
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfEUIVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:21:48 -0400
Received: from sauhun.de ([88.99.104.3]:32992 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726344AbfEUIVr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:21:47 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id 541112C7789;
        Tue, 21 May 2019 10:21:46 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 5/8] MAINTAINERS: add I2C DT bindings to Rockchip platform
Date:   Tue, 21 May 2019 10:21:34 +0200
Message-Id: <20190521082137.2889-6-wsa@the-dreams.de>
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
Cc: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a60cd98aad5..09f32866bdef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2145,6 +2145,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-rockchip@lists.infradead.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-rk3x.txt
 F:	arch/arm/boot/dts/rk3*
 F:	arch/arm/boot/dts/rv1108*
 F:	arch/arm/mach-rockchip/
-- 
2.19.1

