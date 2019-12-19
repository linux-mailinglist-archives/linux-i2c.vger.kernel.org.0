Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 235DC12613D
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 12:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfLSLwD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 06:52:03 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53893 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfLSLwC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 06:52:02 -0500
Received: by mail-wm1-f66.google.com with SMTP id m24so5126921wmc.3
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 03:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AAmtuAQbNmKpgdBhMy2Ze73suvWvpXU6jrmMX5iis4Q=;
        b=qqG6GlYAW6QWcnyGy5Ant+d9EOJyE6nBMn/VOmBi/Bg++y3R7RVE8b+qA5kckRDAX6
         FuR+N9zCxcTejn9W7mVAEy1h2dgtnNIidZGn24sBRvktNXHfW30aU3H8i/m0pTJF9WF7
         qkCjF3zz3O2iBTTjaA7b62PypLF/tSOnqmn3Dv4GoKcdzEAsIn5fpyYWOZPA3ljBhP4p
         GNcOE172cqKavnQAmTRsEcpP2pbCzuLEQoXE1OSxbGSeGWZCoKnJq5US6+gZykR9i9kG
         rGtlBa/HBganqd8ZifREk7e7RbtxBkF7jP90TeC2EQu9gKUu/22swrIfJT+0DqTk314h
         QNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AAmtuAQbNmKpgdBhMy2Ze73suvWvpXU6jrmMX5iis4Q=;
        b=JaqQUkb2yX7ueWMoTnBE25dVDF5m87i8RL7s+orZ487F4MCOoFM90lL7R355yzNVA+
         bgu8oUKFR8VKg2exonGLNoRujOLelHHkamgz7el9ShEkqv9uqHKmAsrMOOkB3ewRgvUL
         H4XmsmDLx7DCo/Mv+M9DVusrBemr7jGmeIyGgNCK35rCDIqVS8UYpGYnyEtRnuLHHpdI
         sST757hvAauR6UUdwX3BHqsoJW7u/5wBocTN/gmnAEsijyPCet+j/gpY7hk0MpA5j2zF
         S8gVlBmqdPJQdzszrxhi8MqHcz9Lq9xdbwLepCk4F83oZ9lSXhkmKgVEGbRsfFC8IiRY
         bcuQ==
X-Gm-Message-State: APjAAAW35eSkkadGSBNe33ljk1u2AO6RVte7GND0vm5I7vv12LD/Y4X8
        rwsaMAURLAnTTNyBcvxF3Csepg==
X-Google-Smtp-Source: APXvYqzjVhP3Y12GG4svF/VrPG1fzw/EFP/eOEdG7OkhHgzsTpjMflFQ9be2Am3CAuixA0asvw2iPw==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr9734667wmc.161.1576756320738;
        Thu, 19 Dec 2019 03:52:00 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id k16sm6489660wru.0.2019.12.19.03.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 03:52:00 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v3 3/4] dt-bindings: at24: remove the optional property write-protect-gpios
Date:   Thu, 19 Dec 2019 12:51:40 +0100
Message-Id: <20191219115141.24653-4-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219115141.24653-1-ktouil@baylibre.com>
References: <20191219115141.24653-1-ktouil@baylibre.com>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
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

