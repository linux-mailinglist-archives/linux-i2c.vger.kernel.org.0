Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6696024A1D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfEUIVq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:21:46 -0400
Received: from sauhun.de ([88.99.104.3]:32968 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbfEUIVq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:21:46 -0400
Received: from localhost (p54B334E1.dip0.t-ipconnect.de [84.179.52.225])
        by pokefinder.org (Postfix) with ESMTPSA id B506A2C775D;
        Tue, 21 May 2019 10:21:44 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/8] MAINTAINERS: add I2C DT bindings to Zynq platform
Date:   Tue, 21 May 2019 10:21:30 +0200
Message-Id: <20190521082137.2889-2-wsa@the-dreams.de>
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
Cc: Michal Simek <michal.simek@xilinx.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509a8e6d2dcc..5cb019f8e597 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2532,6 +2532,8 @@ F:	drivers/cpuidle/cpuidle-zynq.c
 F:	drivers/block/xsysace.c
 N:	zynq
 N:	xilinx
+F:	Documentation/devicetree/bindings/i2c/i2c-cadence.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-xiic.txt
 F:	drivers/clocksource/timer-cadence-ttc.c
 F:	drivers/i2c/busses/i2c-cadence.c
 F:	drivers/mmc/host/sdhci-of-arasan.c
-- 
2.19.1

