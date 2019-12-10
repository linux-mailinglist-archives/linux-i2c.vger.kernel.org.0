Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84D8118CD2
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 16:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfLJPmc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 10:42:32 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37274 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfLJPmT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 10:42:19 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so3717514wmf.2
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ES7zD3uxlvMthMTJeBASrOUMdYjQARPGfunzD6tXJe0=;
        b=X8jT4uZR6MmsuKUFlUo+O7GD+IvoNdjgsBhv+m2LFeSvD/6qVwx9LA/tt83TuoGTIW
         TVaZUhpvng9Z/VHVXJO4Lclf7r2kgZFqJE+FJhIV4jftaWqAzdcxyNpgtw+RS7Ohs5TN
         t4183tREGV5PYcRta6UPO37g8lDJWWbsB/PZcYcMAnImpnGcTDP8FTSDCJuVQcYej736
         8QORMjuqdmx3SrpGWbtE+m4x2vNIyUT+CC0btkuZFdB/0j2r9QxNFE7++GYuW18027YU
         vWEX8iasdwWMxU+XAJm8nzETjvHjgp7oUG5OWkMMjC5ivI7DUftea84sTh0Sk1P5QMS7
         YRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ES7zD3uxlvMthMTJeBASrOUMdYjQARPGfunzD6tXJe0=;
        b=iTOeq9DhnE1ABpEvCoEu9yIjBYNO0fZyZX9NfjR2bt5s19tl0FEkQxJu4YS6kHimMq
         /hBD2sr6jZKEZAUZ4zCI1tcaWVC1yE/F6ve9HwrLq/0asWhJhKl/52HEwL6dpKpXEQ7a
         7XL3NQtUAZyQKC4cNY/XfVF/5pI1DPtSloS8P/GUIMsRX/DUfsTHOdE9OoGPCIEwblmZ
         YRuFrQj8vdaEPTots3HDjuheLIs4+rDCRGuK1ibwT5BU+opqfyxWU5LUrXhl7lhHQ9aU
         hw08AqgWyeehuC9t0o5NHJQFxNuVSS/LJ5ZNFANvCgeS1ycOCXiRJlZcRTIpCZXKhvSD
         bixA==
X-Gm-Message-State: APjAAAV74Tvgh9/gKrSHt+lYNNOcTsGbGo3X1it/674r7R/jAxg6FuH1
        Nka65Tn2WCXDg48qzc0m9YM1fg==
X-Google-Smtp-Source: APXvYqxBTD7o5rvQZLec1VR+5T1kdaqLV9SOyPbERAX/fk12Q7zu8qsu+W3shzPDVpllGWyq17o63w==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr6047465wmd.7.1575992538051;
        Tue, 10 Dec 2019 07:42:18 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o7sm3469085wmc.41.2019.12.10.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 07:42:17 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v2 3/4] dt-bindings: at24: remove the optional property write-protect-gpios
Date:   Tue, 10 Dec 2019 16:41:56 +0100
Message-Id: <20191210154157.21930-4-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191210154157.21930-1-ktouil@baylibre.com>
References: <20191210154157.21930-1-ktouil@baylibre.com>
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
 Documentation/devicetree/bindings/eeprom/at24.yaml | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index e8778560d966..75de83708146 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -145,10 +145,7 @@ properties:
       over reads to the next slave address. Please consult the manual of
       your device.
 
-  wp-gpios:
-    description:
-      GPIO to which the write-protect pin of the chip is connected.
-    maxItems: 1
+  wp-gpios: true
 
   address-width:
     allOf:
@@ -181,7 +178,6 @@ examples:
           compatible = "microchip,24c32", "atmel,24c32";
           reg = <0x52>;
           pagesize = <32>;
-          wp-gpios = <&gpio1 3 0>;
           num-addresses = <8>;
       };
     };
-- 
2.17.1

