Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB2336E6DF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Apr 2021 10:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240039AbhD2IO6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 04:14:58 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:50378 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240057AbhD2IO0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 04:14:26 -0400
Received: from localhost (unknown [192.168.167.225])
        by lucky1.263xmail.com (Postfix) with ESMTP id AB337D15AA;
        Thu, 29 Apr 2021 16:13:38 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3565T140662729078528S1619684015858127_;
        Thu, 29 Apr 2021 16:13:38 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <9567ef58fbd6c0fc59394a908c75770e>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 30
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   <cl@rock-chips.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: [PATCH v4 08/10] arm64: dts: rockchip: add generic pinconfig settings used by most Rockchip socs
Date:   Thu, 29 Apr 2021 16:13:34 +0800
Message-Id: <20210429081334.17920-1-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429081151.17558-1-cl@rock-chips.com>
References: <20210429081151.17558-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

The pinconfig settings for Rockchip SoCs are pretty similar on all socs,
so move them to a shared dtsi to be included, instead of redefining them
for each soc.

Signed-off-by: Liang Chen <cl@rock-chips.com>
---
 .../boot/dts/rockchip/rockchip-pinconf.dtsi   | 344 ++++++++++++++++++
 1 file changed, 344 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
new file mode 100644
index 000000000000..5c645437b507
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
+ */
+
+&pinctrl {
+	/omit-if-no-ref/
+	pcfg_pull_up: pcfg-pull-up {
+		bias-pull-up;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down: pcfg-pull-down {
+		bias-pull-down;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none: pcfg-pull-none {
+		bias-disable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_0: pcfg-pull-none-drv-level-0 {
+		bias-disable;
+		drive-strength = <0>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_1: pcfg-pull-none-drv-level-1 {
+		bias-disable;
+		drive-strength = <1>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_2: pcfg-pull-none-drv-level-2 {
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_3: pcfg-pull-none-drv-level-3 {
+		bias-disable;
+		drive-strength = <3>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_4: pcfg-pull-none-drv-level-4 {
+		bias-disable;
+		drive-strength = <4>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_5: pcfg-pull-none-drv-level-5 {
+		bias-disable;
+		drive-strength = <5>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_6: pcfg-pull-none-drv-level-6 {
+		bias-disable;
+		drive-strength = <6>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_7: pcfg-pull-none-drv-level-7 {
+		bias-disable;
+		drive-strength = <7>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_8: pcfg-pull-none-drv-level-8 {
+		bias-disable;
+		drive-strength = <8>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_9: pcfg-pull-none-drv-level-9 {
+		bias-disable;
+		drive-strength = <9>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_10: pcfg-pull-none-drv-level-10 {
+		bias-disable;
+		drive-strength = <10>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_11: pcfg-pull-none-drv-level-11 {
+		bias-disable;
+		drive-strength = <11>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_12: pcfg-pull-none-drv-level-12 {
+		bias-disable;
+		drive-strength = <12>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_13: pcfg-pull-none-drv-level-13 {
+		bias-disable;
+		drive-strength = <13>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_14: pcfg-pull-none-drv-level-14 {
+		bias-disable;
+		drive-strength = <14>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_15: pcfg-pull-none-drv-level-15 {
+		bias-disable;
+		drive-strength = <15>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_0: pcfg-pull-up-drv-level-0 {
+		bias-pull-up;
+		drive-strength = <0>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_1: pcfg-pull-up-drv-level-1 {
+		bias-pull-up;
+		drive-strength = <1>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_2: pcfg-pull-up-drv-level-2 {
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_3: pcfg-pull-up-drv-level-3 {
+		bias-pull-up;
+		drive-strength = <3>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_4: pcfg-pull-up-drv-level-4 {
+		bias-pull-up;
+		drive-strength = <4>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_5: pcfg-pull-up-drv-level-5 {
+		bias-pull-up;
+		drive-strength = <5>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_6: pcfg-pull-up-drv-level-6 {
+		bias-pull-up;
+		drive-strength = <6>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_7: pcfg-pull-up-drv-level-7 {
+		bias-pull-up;
+		drive-strength = <7>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_8: pcfg-pull-up-drv-level-8 {
+		bias-pull-up;
+		drive-strength = <8>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_9: pcfg-pull-up-drv-level-9 {
+		bias-pull-up;
+		drive-strength = <9>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_10: pcfg-pull-up-drv-level-10 {
+		bias-pull-up;
+		drive-strength = <10>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_11: pcfg-pull-up-drv-level-11 {
+		bias-pull-up;
+		drive-strength = <11>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_12: pcfg-pull-up-drv-level-12 {
+		bias-pull-up;
+		drive-strength = <12>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_13: pcfg-pull-up-drv-level-13 {
+		bias-pull-up;
+		drive-strength = <13>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_14: pcfg-pull-up-drv-level-14 {
+		bias-pull-up;
+		drive-strength = <14>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_drv_level_15: pcfg-pull-up-drv-level-15 {
+		bias-pull-up;
+		drive-strength = <15>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_0: pcfg-pull-down-drv-level-0 {
+		bias-pull-down;
+		drive-strength = <0>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_1: pcfg-pull-down-drv-level-1 {
+		bias-pull-down;
+		drive-strength = <1>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_2: pcfg-pull-down-drv-level-2 {
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_3: pcfg-pull-down-drv-level-3 {
+		bias-pull-down;
+		drive-strength = <3>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_4: pcfg-pull-down-drv-level-4 {
+		bias-pull-down;
+		drive-strength = <4>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_5: pcfg-pull-down-drv-level-5 {
+		bias-pull-down;
+		drive-strength = <5>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_6: pcfg-pull-down-drv-level-6 {
+		bias-pull-down;
+		drive-strength = <6>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_7: pcfg-pull-down-drv-level-7 {
+		bias-pull-down;
+		drive-strength = <7>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_8: pcfg-pull-down-drv-level-8 {
+		bias-pull-down;
+		drive-strength = <8>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_9: pcfg-pull-down-drv-level-9 {
+		bias-pull-down;
+		drive-strength = <9>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_10: pcfg-pull-down-drv-level-10 {
+		bias-pull-down;
+		drive-strength = <10>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_11: pcfg-pull-down-drv-level-11 {
+		bias-pull-down;
+		drive-strength = <11>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_12: pcfg-pull-down-drv-level-12 {
+		bias-pull-down;
+		drive-strength = <12>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_13: pcfg-pull-down-drv-level-13 {
+		bias-pull-down;
+		drive-strength = <13>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_14: pcfg-pull-down-drv-level-14 {
+		bias-pull-down;
+		drive-strength = <14>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_drv_level_15: pcfg-pull-down-drv-level-15 {
+		bias-pull-down;
+		drive-strength = <15>;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_up_smt: pcfg-pull-up-smt {
+		bias-pull-up;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_down_smt: pcfg-pull-down-smt {
+		bias-pull-down;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_smt: pcfg-pull-none-smt {
+		bias-disable;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_pull_none_drv_level_0_smt: pcfg-pull-none-drv-level-0-smt {
+		bias-disable;
+		drive-strength = <0>;
+		input-schmitt-enable;
+	};
+
+	/omit-if-no-ref/
+	pcfg_output_high: pcfg-output-high {
+		output-high;
+	};
+
+	/omit-if-no-ref/
+	pcfg_output_low: pcfg-output-low {
+		output-low;
+	};
+};
-- 
2.17.1



