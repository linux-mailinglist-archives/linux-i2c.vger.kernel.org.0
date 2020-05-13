Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4265C1D0C53
	for <lists+linux-i2c@lfdr.de>; Wed, 13 May 2020 11:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgEMJd3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 May 2020 05:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbgEMJd3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 May 2020 05:33:29 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EBEC061A0C;
        Wed, 13 May 2020 02:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pAMSSTYNXNQC8UANMcnt7gQ29pn9OURWqic2mz9/ThI=; b=MTpofKCaFbw5JOOumgbrC6eO0+
        zn6JGwG8zZqRKGcaebXU4J5NgeHrc1XqsWY0pXO0GCcgLQGOQss8M0AbdEOfuQ0tAMGyBfZTYYmJc
        Tg+JqDN3USmdLfUqkV7BTbZkDLusO3AaLwHt0nS28XQKQ8Dzfb/8MEeHFZkZ0hUynvGaUZqGA9o+r
        OExPa6XL7Ff27YCt1WM/v5YdFevuwmMCpFEb01Qt+ZskCnJj8Sen2tPOlwKTjDY3A4Ok4GTfk0UZN
        xFBawVttu3l0knpKerlJIyNPQvtTyfdj9ynaGFhWuFqDnSAk3XSEPMhpjKhcjKo/5+l/VNHYAjEMN
        1h7FTACw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:37520 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYnlO-00042C-BM; Wed, 13 May 2020 10:33:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYnlN-0002O5-CM; Wed, 13 May 2020 10:33:17 +0100
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Cc:     Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: [PATCH] arm64: dts: add uDPU i2c bus recovery
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jYnlN-0002O5-CM@rmk-PC.armlinux.org.uk>
Date:   Wed, 13 May 2020 10:33:17 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for bus recovery for the Armada 3720 based uDPU.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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

