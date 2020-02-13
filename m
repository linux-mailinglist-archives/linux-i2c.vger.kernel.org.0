Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D863815CD76
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2020 22:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgBMVrY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Feb 2020 16:47:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37466 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgBMVrY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Feb 2020 16:47:24 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id A805A28DA7F
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-i2c@vger.kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, bleung@chromium.org,
        enric.balletbo@collabora.com, groeck@chromium.org,
        dafna.hirschfeld@collabora.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v3 2/2] arm64: tegra: add unit address to nodes under i2c-tunnel
Date:   Thu, 13 Feb 2020 22:46:56 +0100
Message-Id: <20200213214656.9801-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200213214656.9801-1-dafna.hirschfeld@collabora.com>
References: <20200213214656.9801-1-dafna.hirschfeld@collabora.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

add unit address to the nodes bq24735, smart-battery

This fixes the warning:
'bq24735', 'smart-battery' do not match any of the
regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index a0385a386a3f..a19171f6f0f7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -767,7 +767,7 @@
 
 				google,remote-bus = <0>;
 
-				charger: bq24735 {
+				charger: bq24735@9 {
 					compatible = "ti,bq24735";
 					reg = <0x9>;
 					interrupt-parent = <&gpio>;
@@ -778,7 +778,7 @@
 							GPIO_ACTIVE_HIGH>;
 				};
 
-				battery: smart-battery {
+				battery: smart-battery@b {
 					compatible = "sbs,sbs-battery";
 					reg = <0xb>;
 					battery-name = "battery";
-- 
2.17.1

