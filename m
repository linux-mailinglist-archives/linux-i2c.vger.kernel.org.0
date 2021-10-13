Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1584142C264
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 16:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhJMOL5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 10:11:57 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:42906 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhJMOL5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 10:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634134194; x=1665670194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S1R0ueUW/ZMahy3QrgzBWmGL8fqwA2pjk1VqK8I02+k=;
  b=eGMGCKZNrm8CSCEl0KPTz1JxDPaDGvsisx1T7TgW5Jpd9SK25rru3Dn4
   4lrMS8ISp8/FFlEOBzNHSlHbJldHk79j9cgNWA+Xvt27hXiWJzGo+cju7
   U730SnDBBOf4rDr6aIde2+Sa98numC5qUe/bUthJz4wtYKT+kTIraAIVF
   TOnKgKp/FMwarh/9jgXJrqdaXjvdlGwHqMVj6YPQX1taJVOZTK7maO2D8
   cUbs95CvSSAJs7Z7qIoVrOQsAoe6Yt5j0Skkx9hkv18kV9rvewvDdMavD
   MgFpAXIbGDkQkrMKLe2okT8Cz+r/69ahgtt9HQl67xRAZn5jZdF7JW6+x
   A==;
IronPort-SDR: KxJ6ZQcWrcirUhJ0QepG88B8+yY706LRXVmGS8XZHMhNY8QiYahL9ugeeEaoy4OPZKFLLbQnsv
 LWiOMa8jOB2xNrQYwlRydDVB/45jBt6fCyP7OXgWKKJ8rW7hQ6sWbzGIn3fqW1Vu1WmOT/4M45
 V/mJJDh/oU+2Sb6blgqyJrmZE/OS3R3oeZyr0p+y4e2NBMlGsRWLEcVLoDBMyCrd+vBUgpoA8R
 rZfOVO7g6tKc9OqMj8GrEGsolLMy+6EzEpphAUAerq2ZTRStmrDbPekVv3dkSxhgEBT8zSvHqI
 Zctae4Sjq/Bu8QbJFW9UCxF6
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="140154216"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Oct 2021 07:09:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 07:09:49 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 13 Oct 2021 07:09:48 -0700
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     <peda@axentia.se>, <robh+dt@kernel.org>,
        <peter.korsgaard@barco.com>, <lars.povlsen@microchip.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH 1/2] dt-bindings: i2c-mux-gpio: Add optional DT property
Date:   Wed, 13 Oct 2021 16:10:02 +0200
Message-ID: <20211013141003.2388495-2-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
References: <20211013141003.2388495-1-horatiu.vultur@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add optional property 'select-delay' DT property. In case this is set
then a delay is added when changing mux state. The value is specified in
usec.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
index d4cf10582a26..d0dacbad491a 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
@@ -28,6 +28,7 @@ Required properties:
 Optional properties:
 - idle-state: value to set the muxer to when idle. When no value is
   given, it defaults to the last value used.
+- select-delay: GPIO settle delay when changing mux state. In usec.
 
 For each i2c child node, an I2C child bus will be created. They will
 be numbered based on their order in the device tree.
-- 
2.33.0

