Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B42103D2A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 15:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730695AbfKTOVS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 09:21:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43158 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731181AbfKTOVS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Nov 2019 09:21:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id n1so28334362wra.10
        for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2019 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=za3zJeHvU0xsb+kVLYuV4NbEHUu6TiF22N06z5xdZ7U=;
        b=W+tP1rw2S5Fc+lxE+TQaS6NaMeN6WwgCXDo2wOGNxrp7LT9s9DLDz37CmIcQRKEPty
         7fBrZtDiaimwh7tNkVJbYDYmxpbaRhBRP5O3OzoHb0LwAwJ3+DRGx1+fNKY7rCCT9hmW
         fCajlmDr973VZ8M1rWltXJS5PFSQ41nlVoiqGA+gvz1cViUy5V+EofZOjTiAS0Ljm4Eb
         m+hzw/4S2kXrhlCdQRqnBFbGEgDuhwIEsYa5JXLnA0BGr0fkf0pCoVfaqNjllDxZ4Xz0
         Std7cZ1hyWOJOqXDTcLhieU/F4W2Gi+MsmxyqFumai8rTheltxM0x3a8ppfdUQbZKzLw
         keBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=za3zJeHvU0xsb+kVLYuV4NbEHUu6TiF22N06z5xdZ7U=;
        b=TXUuXgAyjgIPBHIVcuJR7s+kffBizOFrRIWe5mcOnz6kDlFsSqpg5mSrCNbQ3t809E
         ddMDaYSMXjTORYnUqpxwiUQ9Ej3geWXluMxw/3QeXB8ivN/9RRcW/znU81LyHRvsKjMx
         5o9t7z+bdM8otcPt1fK+CiTQ0LzzjSyYncjMLQbhj+EuIji0hnv+UFSOUIrN7evlBpyy
         iObEY3PdB3gAFmUg4dgK2S7w9AT8eXS1/N6dJG92wuVYeOufE1uUy0b10ly5VF9z9vkT
         elfHPm854Fv1+pTFOKD14lHcJ76DMN1fQpDNQAXl8Pk0YRbi9sHNn/kUxTVD83cKUYrk
         V6Ew==
X-Gm-Message-State: APjAAAUAxO7l8XtIoRjRUcgWGUhcBpa1FqOaZUbGXaOG8cPH3mVekmvD
        Z+6M5S292dfkBjWJb/4xbvfmMw==
X-Google-Smtp-Source: APXvYqxRWKxe1lMjANGtX4GLxYvQr5Ad9CARdzZrXIVR1/8+l3Ghy89CSmQDbIhO9iKAq7OC83D49w==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr3626840wrc.315.1574259675393;
        Wed, 20 Nov 2019 06:21:15 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a6sm34544352wrh.69.2019.11.20.06.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:21:14 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH 1/4] dt-bindings: nvmem: new optional property write-protect-gpios
Date:   Wed, 20 Nov 2019 15:20:35 +0100
Message-Id: <20191120142038.30746-2-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120142038.30746-1-ktouil@baylibre.com>
References: <20191120142038.30746-1-ktouil@baylibre.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Many nvmem memory chips have a write-protect pin which, when pulled
high, blocks the write operations.

On some boards, this pin is connected to a GPIO and pulled high by
default, which forces the user to manually change its state before
writing.

Instead of modifying all the memory drivers to check this pin, make
the NVMEM subsystem check if the write-protect GPIO being passed
through the nvmem_config or defined in the device tree and pull it
low whenever writing to the memory.

Add a new optional property to the device tree binding document, which
allows to specify the GPIO line to which the write-protect pin is
connected.

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 1c75a059206c..6724764af794 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -34,6 +34,11 @@ properties:
     description:
       Mark the provider as read only.
 
+  wp-gpios:
+    description:
+      GPIO to which the write-protect pin of the chip is connected.
+    maxItems: 1
+
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
@@ -66,6 +71,7 @@ examples:
       qfprom: eeprom@700000 {
           #address-cells = <1>;
           #size-cells = <1>;
+          wp-gpios = <&gpio1 3 0>;
 
           /* ... */
 
-- 
2.17.1

