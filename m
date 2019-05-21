Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC1224A23
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbfEUIVs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:21:48 -0400
Received: from sauhun.de ([88.99.104.3]:32996 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbfEUIVs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:21:48 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id B34E02C77FB;
        Tue, 21 May 2019 10:21:46 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Patrice Chotard <patrice.chotard@st.com>
Subject: [PATCH 6/8] MAINTAINERS: add I2C DT bindings to STI architecture
Date:   Tue, 21 May 2019 10:21:35 +0200
Message-Id: <20190521082137.2889-7-wsa@the-dreams.de>
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
Cc: Patrice Chotard <patrice.chotard@st.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 09f32866bdef..cce1173be35c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2281,6 +2281,7 @@ M:	Patrice Chotard <patrice.chotard@st.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 W:	http://www.stlinux.com
 S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/i2c-st.txt
 F:	arch/arm/mach-sti/
 F:	arch/arm/boot/dts/sti*
 F:	drivers/char/hw_random/st-rng.c
-- 
2.19.1

