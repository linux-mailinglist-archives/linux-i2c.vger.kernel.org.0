Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB3559BE03
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 12:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiHVK7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 06:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234255AbiHVK7A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 06:59:00 -0400
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A44431EFB;
        Mon, 22 Aug 2022 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1661165939; x=1692701939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=66oAeRZph3cUpk7JGrtvitrXyII9ZQBHlmp5sOAgu+Q=;
  b=SHfoSAS5jUQrylU/GaprMy3NxQpD0R20L8IqW8Lyr42QnC+4CjQF/GJq
   YOhBghD3VpzQX25ZAIjpikGyA222//yRbK84zjKVI7IRGLLSgMKTDwdVI
   KfWffywYCNyCpKAe/Yocmls+GL2+IhZfI6gfnqpCLXqGcfvduQaYbYoY6
   8=;
X-IronPort-AV: E=Sophos;i="5.93,254,1654560000"; 
   d="scan'208";a="1046875125"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-41c1ef8b.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 10:58:35 +0000
Received: from EX13MTAUEB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1e-41c1ef8b.us-east-1.amazon.com (Postfix) with ESMTPS id 1E5A9160CAD;
        Mon, 22 Aug 2022 10:58:32 +0000 (UTC)
Received: from EX13D08UEB003.ant.amazon.com (10.43.60.11) by
 EX13MTAUEB001.ant.amazon.com (10.43.60.96) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Mon, 22 Aug 2022 10:58:32 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D08UEB003.ant.amazon.com (10.43.60.11) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Mon, 22 Aug 2022 10:58:31 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Mon, 22 Aug 2022 10:58:31
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id A21BCE52; Mon, 22 Aug 2022 10:58:30 +0000 (UTC)
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
Subject: [PATCH v2 1/2] dt-bindings: at24: add new optional power-supply property
Date:   Mon, 22 Aug 2022 10:58:29 +0000
Message-ID: <20220822105830.22790-2-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822105830.22790-1-farbere@amazon.com>
References: <20220822105830.22790-1-farbere@amazon.com>
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
V1 -> V2:
Change pointed out by Rob Herring:
- Use a gpio regulator for power-supply control.

 Documentation/devicetree/bindings/eeprom/at24.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
index f9a7c984274c..6d23ceac5fdc 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.txt
+++ b/Documentation/devicetree/bindings/eeprom/at24.txt
@@ -73,6 +73,9 @@ Optional properties:
 
   - wp-gpios: GPIO to which the write-protect pin of the chip is connected.
 
+  - power-supply: phandle of the gpio regulator that provides the supply
+                  voltage.
+
   - address-width: number of address bits (one of 8, 16).
 
 Example:
-- 
2.37.1

