Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2675F38895A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 May 2021 10:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235418AbhESI2h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 04:28:37 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46523 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237950AbhESI2h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 04:28:37 -0400
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 14J7qelm033756
        for <linux-i2c@vger.kernel.org>; Wed, 19 May 2021 15:52:40 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14J7qHgr033724;
        Wed, 19 May 2021 15:52:17 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 16:04:53 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>
CC:     <ryan_chen@aspeedtech.com>, <chiawei_wang@aspeedtech.com>,
        <troy_lee@aspeedtech.com>, <steven_lee@aspeedtech.com>,
        <jamin_lin@aspeedtech.com>
Subject: [PATCH 2/3] ARM: dts: aspeed: Add node for AST2600 I2C
Date:   Wed, 19 May 2021 16:04:28 +0800
Message-ID: <20210519080436.18975-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14J7qHgr033724
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add node to get the global register of i2c for AST2600.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index f96607b7b4e2..998d55a16c5c 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -674,6 +674,14 @@
 #include "aspeed-g6-pinctrl.dtsi"
 
 &i2c {
+
+	i2c_gr: i2c-global-regs@0 {
+		compatible = "aspeed,ast2600-i2c-global", "syscon";
+		reg = <0x0 0x20>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
+		resets = <&syscon ASPEED_RESET_I2C>;
+	};
+
 	i2c0: i2c-bus@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.17.1

