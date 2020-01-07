Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B32132265
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGJaW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:30:22 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43111 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbgAGJ36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:29:58 -0500
Received: by mail-wr1-f65.google.com with SMTP id d16so53069071wre.10
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tY1YFADtaZKXzMf5Ie7W6ruxIu2Bb0htwIWWuGbAKcM=;
        b=BT+XiI7KL8AbXEnRoUphi5RAur5dTOV2WYkSXxsNVg5uOoY16h3spUJNcw+WDN0eE8
         Q5Kuu9cKqxAScKglzuKOu9ImlN2vUCvsl7yUQkB/+PQewkGeMlrzdbeof2gkRE4kl5zh
         OZkGw2QPofaOfrL2yT/LE33DZCsOLM9J01mUix2D/Mb8FCxKGdcHOrzi8LpHxe8qAmSJ
         aRUJu/umX8XmfRMveLIccd9z17jBvwTdrkyBYwrT5bSu7B3aRoNZLNMOBdfkQMBlrZlU
         WEsMzFveyXDtc4CMtzTcDQoIqKI659lvX2nsG90szJDM8GoXJFs8Rgx/PqZf/++kn8wo
         nywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tY1YFADtaZKXzMf5Ie7W6ruxIu2Bb0htwIWWuGbAKcM=;
        b=hnNwWKEZItU/vynDBSXa8qnrQ8jbfHB2sjDOTAv7UrBBPF6iGcUl0/o2yLvm43N8Un
         lNHyHaBYVGSUdkHMPIrzOxlDU0VlpMVbQFEHsWwt8YBTX7U99RqZIgd7cR/Z0qi+iwql
         aMbNCwWRe5wgUjEsTiJ2mrn6U7pdVJxUvgx5XD/MKWoo209ahaECZp8zv1jf1YXwJDmD
         vjEW8OtcWQnHFdFZ19XXc8F95nNLkfiEfI+5Ta3HVM1sCa7fYnhB8iXpnM6fwu3ErVAp
         167aVOMPQGLof3eQfsMvm1HUnT3KxiCjSo/TabGBvSexCe4YMgVelw8uHPHrntLfNBwr
         KZsw==
X-Gm-Message-State: APjAAAUDGT22nvLIRXOH2Cq+YAKaTahh7JaK63f5GapTx/OBr0WGEt0l
        6KdKF/8xE9Axnye5j7E7Fl/IzA==
X-Google-Smtp-Source: APXvYqzy3e+NBXWEgKTFoS1SiHNnkRdl0I49RIxZsPjJ4sAcAAmVjJYUj/X9oh9KyDQxC6Yp84I43Q==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr106677513wrt.229.1578389397032;
        Tue, 07 Jan 2020 01:29:57 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id x14sm25959969wmj.42.2020.01.07.01.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 01:29:56 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v4 1/5] dt-bindings: nvmem: new optional property wp-gpios
Date:   Tue,  7 Jan 2020 10:29:18 +0100
Message-Id: <20200107092922.18408-2-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107092922.18408-1-ktouil@baylibre.com>
References: <20200107092922.18408-1-ktouil@baylibre.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Several memories have a write-protect pin, that when pulled high, it
blocks the write operation.

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
 Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
index 1c75a059206c..b43c6c65294e 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
@@ -34,6 +34,14 @@ properties:
     description:
       Mark the provider as read only.
 
+  wp-gpios:
+    description:
+      GPIO to which the write-protect pin of the chip is connected.
+      The write-protect GPIO is asserted, when it's driven high
+      (logical '1') to block the write operation. It's deasserted,
+      when it's driven low (logical '0') to allow writing.
+    maxItems: 1
+
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
@@ -63,9 +71,12 @@ patternProperties:
 
 examples:
   - |
+      #include <dt-bindings/gpio/gpio.h>
+
       qfprom: eeprom@700000 {
           #address-cells = <1>;
           #size-cells = <1>;
+          wp-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
 
           /* ... */
 
-- 
2.17.1

