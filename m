Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95C64D4634
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 12:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237311AbiCJLrc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 06:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbiCJLrc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 06:47:32 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F498145603;
        Thu, 10 Mar 2022 03:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646912789; x=1678448789;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uAh7z3HwXTU9CiePYgDmNIfD/PF9UuyWttj4jaVc5Jo=;
  b=KYCdWQUoqYGRc91Yk29+LQ/1tFC7EvZV/oq+zZlz19vZ8IREDpeVcBpv
   oZ5ToYwWES6kh0I2KmuINPYiBUuWax2mMG35xB6EFDOFxbI72BTBdipxd
   W+kXgqzP6/KhouD1VVFeFyQvuyPEFnIeoH4YdPyo7n9GrACWlmoEHI+gs
   17JCk/oWM21Vgq1BcFpJJDLo4gWaTyy7D9euys7OzMvU1njzVngfyB+VT
   WFJ+wnrmS6ucJ4mUrtXb2XyaRGkdixNFr1rl/bM5JXg4mfd+6rDgPOlBI
   u8iVg7eL5sKLh+hhTaoPN5jfdXzlOSeHJL1eT0XP+CA+JcOTsiQqguzIc
   A==;
X-IronPort-AV: E=Sophos;i="5.90,170,1643698800"; 
   d="scan'208";a="148756540"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Mar 2022 04:46:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 10 Mar 2022 04:46:27 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 10 Mar 2022 04:46:23 -0700
From:   Sergiu Moga <sergiu.moga@microchip.com>
To:     <robh+dt@kernel.org>, <krzysztof.kozlowski@canonical.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>,
        Sergiu Moga <sergiu.moga@microchip.com>
Subject: [PATCH v2 0/3] dt-bindings: i2c: convert i2c-at91 to json-schema
Date:   Thu, 10 Mar 2022 13:45:50 +0200
Message-ID: <20220310114553.184763-1-sergiu.moga@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series addresses the conversion of the I2C DT binding
for Atmel/Microchip SoCs to Device Tree Schema format. The
SAMA7G5 compatible has also been added to the I2C DT binding. It also
ensures consistency across the SoC files regarding the ordering
of the `rx` and `tx` strings of the `dma-names` property of the
`i2c` nodes by changing it in the SoC file of `sama7g5`.

Changes since v1:
- Moved `allOf` after `required:`.
- Removed the `pinctrl` generic property.
- Replaced the undocumented `wm8731` compatible from `examples:` with
  the documented `atmel,24c02`.
- Removed the unnecessary `oneOf` from the conditional `if` of `allOf`.
  Instead the `sama7g5` compatible string is simply added to the `enum`.

Sergiu Moga (3):
  ARM: dts: at91: sama7g5: Swap `rx` and `tx` for `i2c` nodes
  dt-bindings: i2c: convert i2c-at91 to json-schema
  dt-bindings: i2c: at91: Add SAMA7G5 compatible strings list

 .../bindings/i2c/atmel,at91sam-i2c.yaml       | 146 ++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-at91.txt      |  82 ----------
 arch/arm/boot/dts/sama7g5.dtsi                |  18 +--
 3 files changed, 155 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-at91.txt

-- 
2.25.1

