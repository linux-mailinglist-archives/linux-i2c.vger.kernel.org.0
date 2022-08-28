Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37A765A3E73
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Aug 2022 17:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiH1PtL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Aug 2022 11:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiH1PtL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Aug 2022 11:49:11 -0400
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBE832EDC;
        Sun, 28 Aug 2022 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661701751; x=1693237751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zU4xJPlhx9313yKXJ3gXwqC/qnSgv3tm1Z0eW7nbiHA=;
  b=jw5SzcPKKHZFFuQWemfNmEb2ugYUBD5m0JEUr9EFz6LpC+4Kaa8VmTMy
   gn0PhbjIA17kozQpg+cclfNENjKJhsl1Y/Cn5Xk6l/hdsrFgpD8G9RZfa
   TlC8QgVQC1V3XdtzhhZAR8sO7Wvp2PZmtm/HpvLGGiIIrrEqbo6gRyPFE
   I=;
X-IronPort-AV: E=Sophos;i="5.93,270,1654560000"; 
   d="scan'208";a="124170975"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-26daedd8.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 15:49:10 +0000
Received: from EX13MTAUWA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1e-26daedd8.us-east-1.amazon.com (Postfix) with ESMTPS id DC311E110B;
        Sun, 28 Aug 2022 15:49:06 +0000 (UTC)
Received: from EX19D013UWA001.ant.amazon.com (10.13.138.253) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Sun, 28 Aug 2022 15:49:05 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D013UWA001.ant.amazon.com (10.13.138.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Sun, 28 Aug 2022 15:49:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Sun, 28 Aug 2022 15:49:05
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id DAA244B91; Sun, 28 Aug 2022 15:49:04 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <brgl@bgdev.pl>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dkl@amazon.com>,
        <dwmw@amazon.co.uk>
Subject: [PATCH v3 1/2] dt-bindings: at24: add new optional power-supply property
Date:   Sun, 28 Aug 2022 15:49:03 +0000
Message-ID: <20220828154904.20477-2-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220828154904.20477-1-farbere@amazon.com>
References: <20220828154904.20477-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Boards using the AT24 EEPROMs might have a GPIO that controls the power
supply of the chip, and it must be set to enable the usage of it.

Add a new optional property to the device tree binding document, which
allows to specify a GPIO regulator for the pin that controls the power.

On Linux this means that we need to enable the GPIO at the beginning of
probe function, before trying to access the chip.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V2 -> V3:
Apply on top of v6.0-rc1

 Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index d14e0accbda8..82f0046f67a9 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -179,6 +179,10 @@ properties:
     description:
       phandle of the regulator that provides the supply voltage.
 
+  power-supply:
+    description:
+      phandle of the gpio regulator that provides the supply voltage.
+
 required:
   - compatible
   - reg
-- 
2.37.1

