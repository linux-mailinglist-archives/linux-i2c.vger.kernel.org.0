Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585981C6D2B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgEFJkv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728729AbgEFJkv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:40:51 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC07C061A0F;
        Wed,  6 May 2020 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BHzECdjXNTGQ+6R23H6wGDuKyoN1dwontLqIMvNDJLg=; b=IdW/ItxyB4IY1/3TnLUE7KnCe4
        5BrQYNEHzCPSZIK/rwXwxs68L+fPFI/noOMIF8kR5KvMQIdjMUzE9nLwnF3HcZR1hWvQGXPQrRrHl
        frurqJNYtQpfQ8v3MvpbEiThn8fjrfgaKqwnlNHqfmvaGrc1heBE1S1ezepWxewWYPiTvocKyOKsP
        IxSPGytb6/iwxOQKODXZ5eb1FDbn3vxUPFgZtqLrXDqawljHnTzFSh7wZzVYAsRIdmIj5LseWipGd
        YuRrbJL6ZguvqEdbv5RBQl54bQlamKF5TWUHbXFwDwfZbK6VgWJj64XrnzbbZP1Xkh0AEmN7Dhmxq
        CydZZVMw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:40820 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGXe-0007pr-Dc; Wed, 06 May 2020 10:40:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGXd-0000Z7-1n; Wed, 06 May 2020 10:40:37 +0100
In-Reply-To: <20200506094001.GP1551@shell.armlinux.org.uk>
References: <20200506094001.GP1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: [PATCH 2/2] arm64: dts: add uDPU i2c bus recovery
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jWGXd-0000Z7-1n@rmk-PC.armlinux.org.uk>
Date:   Wed, 06 May 2020 10:40:37 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../boot/dts/marvell/armada-3720-uDPU.dts     | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
index 7eb6c1796cef..95d46e8d081c 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
@@ -117,18 +117,36 @@
 	};
 };
 
+&pinctrl_nb {
+	i2c1_recovery_pins: i2c1-recovery-pins {
+		groups = "i2c1";
+		function = "gpio";
+	};
+
+	i2c2_recovery_pins: i2c2-recovery-pins {
+		groups = "i2c2";
+		function = "gpio";
+	};
+};
+
 &i2c0 {
 	status = "okay";
-	pinctrl-names = "default";
+	pinctrl-names = "default", "recovery";
 	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-1 = <&i2c1_recovery_pins>;
 	/delete-property/mrvl,i2c-fast-mode;
+	scl-gpios = <&gpionb 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpionb 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 };
 
 &i2c1 {
 	status = "okay";
-	pinctrl-names = "default";
+	pinctrl-names = "default", "recovery";
 	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_recovery_pins>;
 	/delete-property/mrvl,i2c-fast-mode;
+	scl-gpios = <&gpionb 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpionb 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 
 	lm75@48 {
 		status = "okay";
-- 
2.20.1

