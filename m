Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B719103D31
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 15:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731567AbfKTOVU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 09:21:20 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44428 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730882AbfKTOVU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Nov 2019 09:21:20 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so2187200wrn.11
        for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2019 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LS7jj1HIKvxgyHyZgfXU7kIDSCI29CxRcup6bkz0xxs=;
        b=lOLy+t1UEdjZqFD3P7QqzpnA1t+QUe3z2C2PhubGVM1WveK1FYtTl8qbaE5mNeLVJB
         6s6aDKzzbuZ5JOglZZIPE9rpWvEZmKeQ+ZJO/Twa1wjg5DIRQO7oF/sDcY0krKSkUwdg
         0oDU19XvCeCb0byrTrDyCfh4NYiAfRAJQGBz92+RQo8IKUrPAQdfn9cSqsCLAEi05Er/
         loijRwqaYkMGFUefPrD+qIsDTG1YvTH99ho8JcUv+2c8vaNxdIuwTYmOSQnvjifa39qa
         ZzuoPk1yxNCn01iBehSAPJLt9YGx2HeYznIW/BbdRgOezls7KFtXOjHAJKMTUV1lUD2D
         ZtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LS7jj1HIKvxgyHyZgfXU7kIDSCI29CxRcup6bkz0xxs=;
        b=kgTWA6n8G5d/aPSlzdI9JsfHX46Or2NEAnmGxNhfMBtMVEcau1sArUfGYaUNKeq7yw
         uXySj/Dg+2N4ooxvufKv08U6PQcs5kZagHBVwYtdCfs9f0zzSPNpSlJcSZQMsXFpckCz
         F0gKAcgzimfLT7B9+IO0ihzo1vQMnFNUDUaWL0uUQwe6HIg4NKydAIfM3pMjJYl+GR+h
         n36NXAT+5LFE3GELM7VqOJngllM4VzjIm2qy7Tl9bqmimqtl8AnsZ214XBeHp5Zuk+Rt
         ekjmErD4fTPW3NqTrlMWKkAzUWQKoo78NBJPsVpe0Ou3n942oSTypifzQOCT3KAIBvzx
         hsyA==
X-Gm-Message-State: APjAAAWxP4Pxu4MZ0D+OtefGbsC1io6AOwYph1AvlvLEZfo4JA+5IlMc
        jhWc5H4O5pXKqfQpLazaMPbAMQ==
X-Google-Smtp-Source: APXvYqwz7SRyInT03KHZU5F1rb/YeUVzScLvge46nTa5iYaaaFChHhxw2MKL6FUI383HHm+OIXN7hA==
X-Received: by 2002:a05:6000:101:: with SMTP id o1mr3721410wrx.394.1574259677371;
        Wed, 20 Nov 2019 06:21:17 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a6sm34544352wrh.69.2019.11.20.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:21:16 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH 3/4] dt-bindings: at24: remove the optional property write-protect-gpios
Date:   Wed, 20 Nov 2019 15:20:37 +0100
Message-Id: <20191120142038.30746-4-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120142038.30746-1-ktouil@baylibre.com>
References: <20191120142038.30746-1-ktouil@baylibre.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

NVMEM framework is an interface for the at24 EEPROMs as well as for
other drivers, instead of passing the wp-gpios over the different
drivers each time, it would be better to pass it over the NVMEM
subsystem once and for all.

Removing the optional property form the device tree binding document.

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index e8778560d966..9894237ac432 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -145,11 +145,6 @@ properties:
       over reads to the next slave address. Please consult the manual of
       your device.
 
-  wp-gpios:
-    description:
-      GPIO to which the write-protect pin of the chip is connected.
-    maxItems: 1
-
   address-width:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/uint32
@@ -181,7 +176,6 @@ examples:
           compatible = "microchip,24c32", "atmel,24c32";
           reg = <0x52>;
           pagesize = <32>;
-          wp-gpios = <&gpio1 3 0>;
           num-addresses = <8>;
       };
     };
-- 
2.17.1

