Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2A37C041B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 21:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343677AbjJJTJ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 15:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343570AbjJJTJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 15:09:59 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B5793;
        Tue, 10 Oct 2023 12:09:57 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 34C2486BAC;
        Tue, 10 Oct 2023 21:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1696964991;
        bh=I4f7Dc6dnDKz6zHFLKzAB/fW4xuy6lQF9NKmsn74fB8=;
        h=From:To:Cc:Subject:Date:From;
        b=0MGOSos9l8x8dJLs3E3bbVH+Ry9mAJ+SGWz/L0AuebUjbjeuLOW1JuRyE106JCSvG
         /zMWg/9Z6Zik8YdA7+j4DShUg18ml/Zd1ymcgg04A/REHl2JrZg4X7D6rnERuUqfya
         tz8rYp6/Nr1V0/CBgmg0Q/E4d2pJnv85F0fqHJpME7SGU8aGLWdcgqDDIRgw4mMwB9
         jTW2qH7zbAQwgRVgjwxzgl0e8tmU8Q/QOEjOhEU3DL1IUwtxb01NyvGhaj8IZG8eXS
         /4MYcTLsbe4jGnQRUf6yTyWszWSUoxfqNG4WmTT3cILGujjeYwQ10HxFfQNiTvyBvp
         RUULqGCho7LNw==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: at24: add ST M24C32-D Additional Write lockable page
Date:   Tue, 10 Oct 2023 21:09:25 +0200
Message-Id: <20231010190926.57674-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The ST M24C32-D behaves as a regular M24C32, except for the -D variant
which uses up another I2C address for Additional Write lockable page.
This page is 32 Bytes long and can contain additional data. Document
compatible string for it, so users can describe that page in DT. Note
that users still have to describe the main M24C32 area separately as
that is on separate I2C address from this page.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 98139489d4b5c..7be127e9b2507 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -67,6 +67,8 @@ properties:
                   pattern: cs16$
               - items:
                   pattern: c32$
+              - items:
+                  pattern: c32d-wl$
               - items:
                   pattern: cs32$
               - items:
-- 
2.40.1

