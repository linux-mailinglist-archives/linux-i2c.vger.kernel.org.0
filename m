Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1447167D8C
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 13:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgBUMcg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Feb 2020 07:32:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57670 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgBUMcf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Feb 2020 07:32:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E19C82938B1
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-i2c@vger.kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, bleung@chromium.org,
        enric.balletbo@collabora.com, groeck@chromium.org,
        dafna.hirschfeld@collabora.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sebastian.reichel@collabora.com
Subject: [PATCH v4 2/2] arm64: tegra: fix nodes names under i2c-tunnel
Date:   Fri, 21 Feb 2020 13:32:14 +0100
Message-Id: <20200221123214.26341-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221123214.26341-1-dafna.hirschfeld@collabora.com>
References: <20200221123214.26341-1-dafna.hirschfeld@collabora.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change the node names so that they match the class
of the device and have a unit address.
The changes are:
bq24735 -> charger@9
smart-battery -> battery@b

This also fixes the warning:
'bq24735', 'smart-battery' do not match any of the
regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
Changes since v3:
- in v3 I only added a unit address to the nodes' names.
In v4 I also change the names to match the class of the device
and changed the commit log accordingly.

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index a0385a386a3f..4cd99dac541b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -767,7 +767,7 @@
 
 				google,remote-bus = <0>;
 
-				charger: bq24735 {
+				charger: charger@9 {
 					compatible = "ti,bq24735";
 					reg = <0x9>;
 					interrupt-parent = <&gpio>;
@@ -778,7 +778,7 @@
 							GPIO_ACTIVE_HIGH>;
 				};
 
-				battery: smart-battery {
+				battery: battery@b {
 					compatible = "sbs,sbs-battery";
 					reg = <0xb>;
 					battery-name = "battery";
-- 
2.17.1

