Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFB31B4762
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Apr 2020 16:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgDVOdn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Apr 2020 10:33:43 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:46379 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgDVOdn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Apr 2020 10:33:43 -0400
X-Greylist: delayed 522 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Apr 2020 10:33:41 EDT
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-02.nifty.com with ESMTP id 03MEJSWg000545
        for <linux-i2c@vger.kernel.org>; Wed, 22 Apr 2020 23:19:28 +0900
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 03MEIq6s003059;
        Wed, 22 Apr 2020 23:18:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 03MEIq6s003059
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587565133;
        bh=05L0Y4K5hdMLe5DqDt78XEkJuAdMbS03xklsS80D7Zk=;
        h=From:To:Cc:Subject:Date:From;
        b=DyxCrGC9vbJk3WAzDPNWRUm5TW/6TBn/XNszLdLUySG+DlkgrEeyd2p25GpG475X5
         Ns8AYwSr9Xo5JC94ZC/m/GNu5zne4CZl2onlRtCFyr2RiFN6hr3/hOvDgOztOxDhtt
         03UobRstNyV6gNpiLIPx9wr7lV+aZh7JPApv/Xc9AQ/tfKV/7v7a1s50P/Gdrb9r6M
         UrrfceNsdtesIk6C+5GBx2v6z7fJNM7gqa+k/04+yur6u7y9loB0DiGVw/48Zx6n5H
         WNAxrcJiCrDKXSRC4cJflY3CsJ6DGDRvl4rJHHmUoSUnC05jryRdbh+v2CCHG+i1XW
         q3voLqhQl5BHw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: at24: add microchip,24lc[0-9]+ to the compatible pattern
Date:   Wed, 22 Apr 2020 23:18:36 +0900
Message-Id: <20200422141836.1964676-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

arch/arm/boot/dts/uniphier-ref-daughter.dtsi has

  compatible = "microchip,24lc128", "atmel,24c128";

and 'make ARCH=arm dtbs_check' warns this:

  eeprom@50: compatible: ['microchip,24lc128', 'atmel,24c128'] is not valid under any of the given schemas (Possible causes of the failure)

Microchip 24LC128 is the device used on this board, and I see it in
https://www.microchip.com/wwwproducts/en/24LC128

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index a15787e504f0..2cd7a04cab7c 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -34,7 +34,7 @@ properties:
           - minItems: 1
             maxItems: 2
             items:
-              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|mac)[0-9]+|spd)$"
+              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$"
               - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
           - oneOf:
               - items:
-- 
2.25.1

