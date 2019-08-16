Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAD08FB89
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 08:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbfHPGz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 02:55:28 -0400
Received: from letterbox.kde.org ([46.43.1.242]:53688 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726982AbfHPGz1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 02:55:27 -0400
Received: from archbox.localdomain (unknown [123.201.155.129])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id AED5128ACF1;
        Fri, 16 Aug 2019 07:47:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1565938067; bh=ePjvQ8ajgrtxUHMFSOWhNNhVxI+y1Eg4fcjki3juWZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nQqTnRjC/rPiFnACpoHJbEsxdIP3/KJtCoYYqAVhn1JemXcnRWlJ5Db2qrdvCIR6d
         ABYLnRY7ayDaAe/ygo5IgrK/xmlpnBZyN3FKBDbThd7YhdwLKmLNQaAXBFEPBKF6Dv
         k8CXqC8vwQkwfp+7qRsgWqGR8YVYs8EGK22AIUWEWv6P4X05euOSriRv8M2aPcVXzn
         M0ZHpO2Jjn6IoSDVW1ciEedk1IW0/Hvk24V/p91BUwsYtBmTjeq2GadQt80lkkCqxm
         JzUBeMVZRXLS1+7xdkTjf0YFrreE5njql+/30QxR68nNTCE9rHNwrxfpxjz4z1G7CA
         gzw/SXslRGUSg==
From:   Bhushan Shah <bshah@kde.org>
To:     Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Wolfram Sang <wsa@the-dreams.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Bhushan Shah <bshah@kde.org>
Subject: [PATCH v2 3/3] arm64: allwinner: h6: add i2c0 node in PineH64
Date:   Fri, 16 Aug 2019 12:17:10 +0530
Message-Id: <20190816064710.18280-4-bshah@kde.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816064710.18280-1-bshah@kde.org>
References: <20190811090503.32396-1-bshah@kde.org>
 <20190816064710.18280-1-bshah@kde.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c0 bus is exposed by PI-2 BUS in the PineH64, model B.

Signed-off-by: Bhushan Shah <bshah@kde.org>
---
Changes in v2:
  - Don't enable the i2c0 node in PineH64 by default

 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 684d1daa3081..97d9b7c63fb3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -160,6 +160,15 @@
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
+/* This i2c interface is exposed on PI-2 BUS, Pin 3 (I2C_SDA) and 5 (I2C_SCL) */
+&i2c0 {
+	status = "disabled";
+};
+
+&i2c0_pins {
+	bias-pull-up;
+};
+
 &r_i2c {
 	status = "okay";
 
-- 
2.17.1

