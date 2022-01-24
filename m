Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406E149A690
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jan 2022 03:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357643AbiAYCSm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jan 2022 21:18:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2364012AbiAXXqc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jan 2022 18:46:32 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBE9C034006;
        Mon, 24 Jan 2022 13:41:26 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net [174.21.190.118])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 7EF76690;
        Mon, 24 Jan 2022 13:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1643060342;
        bh=DqrmV9MGxyAiCEmRUewAEVdQrxV9eeYb1sRoUnPeamw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IXBCUJKGE9YD/G80hJhY8Kfm2oTJoQuw5vq/kkdy2/kzNIVKnIlndgJziGn2ncHbk
         PAFjxjq/BPYcA8gz2fpD5HIMaa8rE0WRHXsWiKFiEDHECiOowH7X8CLC9hDaIOW+BZ
         6I0+4++DX2p/byi0oKBhTugMvf5sAqNDz133JjtU=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/2] dt-bindings: i2c: add nxp,pca9541 release-delay-us property
Date:   Mon, 24 Jan 2022 13:38:50 -0800
Message-Id: <20220124213850.3766-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124213850.3766-1-zev@bewilderbeest.net>
References: <20220124213850.3766-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This property can be used to reduce arbitration overhead on busy i2c
busses by retaining ownership for a brief period in anticipation of
another transaction in the near future.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 Documentation/devicetree/bindings/i2c/nxp,pca9541.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt b/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
index 42bfc09c8918..c755da59d6ec 100644
--- a/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
+++ b/Documentation/devicetree/bindings/i2c/nxp,pca9541.txt
@@ -6,6 +6,14 @@ Required Properties:
 
   - reg: The I2C address of the device.
 
+Optional Properties:
+
+ - release-delay-us: the number of microseconds to delay before
+   releasing the bus after a transaction.  If unspecified the default
+   is zero (the bus is released immediately).  Non-zero values can
+   reduce arbitration overhead for back-to-back transactions, at the
+   cost of delaying the other master's access to the bus.
+
   The following required properties are defined externally:
 
   - I2C arbitration bus node. See i2c-arb.txt in this directory.
@@ -13,9 +21,11 @@ Required Properties:
 
 Example:
 
+	#include <dt-bindings/mux/mux.h>
 	i2c-arbitrator@74 {
 		compatible = "nxp,pca9541";
 		reg = <0x74>;
+		release-delay-us = <20000>;
 
 		i2c-arb {
 			#address-cells = <1>;
-- 
2.34.1

