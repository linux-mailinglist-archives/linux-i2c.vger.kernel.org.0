Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD19132252
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727616AbgAGJ36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:29:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41843 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbgAGJ35 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:29:57 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so53086489wrw.8
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=ZhKekxLTP92RphP15HP22YKK/XHkNOZwqR3Bm0RWNn4=;
        b=ZJhcPv9VdZ/7VIGypWEKwM5EncUxXp0fNe+4lYsmyU2Qk/MlORWzXDCDpxYwo/f8c5
         nWI1WyE1jWYp1JRiQ5XcqZMB7lirXbLDe+NJQSrfFpLQgyqjU7wmB8o3qTDtJkUrdPoA
         6Oc+IcB4gUH0jIpPkhx+4Ewbd5S0UfrpTA1iWpAsv058Buk1FKKxfIof+Fqf/zslP+yu
         u3mw0lfzhZdZkbBfw4Yf4PtDoCvBDckD5etJlXfebZIepenqHlVSy+W2OVFnKDKQFUCP
         y7HgQzbrwCmrTA5Om423DjuyBs6dRNz4JxViQtkE5o4qphLd0gwGlZbjfK6t5p9D8qe8
         PYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZhKekxLTP92RphP15HP22YKK/XHkNOZwqR3Bm0RWNn4=;
        b=KjhSLkUufN7ozZoR1qEEzrWBZYCahteYWtzsQvagsfGBQWtsE61mUC4J9zzoAXL2IC
         +q+zmNy4G5Kjn280Wyxam9W0WezirQyMKGk4mESXaaazPFP52lyxtS9UHXt+hyxAYSRu
         Q497Tw2mtCOxYjawhWcOXDSGbOIyhK402dl+nYIr9Aoo2v7NCNp66ryBusS/wiI78ql/
         i0oe/pUqJfJ1kUs4okSvBGOcXhMosON9HRWjf9Wq4KwAwsXOvKz+C/u1cw0pxK8QxPXp
         eKp8jBOyS7IbC4/VEBeHfVF5x8ZC+mwYSO+BsAGAUb0xgBkVO06khXqNT5Bw+UmQiFLB
         JYvQ==
X-Gm-Message-State: APjAAAXAO/kl0QMOayUnxlsVRDzAzl/sywjBFQZfg0rktN5+BK+jjoma
        yKWgQPcyb0MRmsGLYLOBwlgFwgMBrL1U8g==
X-Google-Smtp-Source: APXvYqyBJgLVBMFmDPjle8pjsXE/Ihg1UOVL/twyltX1BaSO63tN2499JJk0LQeLW1FMO53qx3nADw==
X-Received: by 2002:adf:a141:: with SMTP id r1mr109570212wrr.285.1578389396079;
        Tue, 07 Jan 2020 01:29:56 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id x14sm25959969wmj.42.2020.01.07.01.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 01:29:55 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v4 0/5] at24: move write-protect pin handling to nvmem core
Date:   Tue,  7 Jan 2020 10:29:17 +0100
Message-Id: <20200107092922.18408-1-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The write-protect pin handling looks like a standard property that
could benefit other users if available in the core nvmem framework.

Instead of modifying all the drivers to check this pin, make the
nvmem subsystem check if the write-protect GPIO being passed
through the nvmem_config or defined in the device tree and pull it
low whenever writing to the memory.

This patchset:

- adds support for the write-protect pin split into two parts.
The first patch modifies modifies the relevant binding document,
while the second modifies the nvmem code to pull the write-protect
GPIO low (if present) during write operations.

- removes support for the write-protect pin split into two parts.
The first patch modifies the relevant binding document to make the
wp-gpio a reference to the property defined by nvmem , while the
second removes the relevant code in the at24 driver.

- adds reference in the at25 binding document for the wp-gpios property
as it uses nvmem subsystem.

Changes since v1:
-Add an explenation on how the wp-gpios works
-Keep reference to the wp-gpios in the at24 binding

Changes since v2:
-Use the flag GPIO_ACTIVE_HIGH instead of 0

Changes since v3:
-Keep the example of the wp-gpios in the at25 bindings
-Add reference for the wp-gpios property in the at25 binding


Khouloud Touil (5):
  dt-bindings: nvmem: new optional property wp-gpios
  nvmem: add support for the write-protect pin
  dt-bindings: at24: make wp-gpios a reference to the property defined
    by nvmem
  dt-bindings: at25: add reference for the wp-gpios property
  eeprom: at24: remove the write-protect pin support

 .../devicetree/bindings/eeprom/at24.yaml      |  5 +----
 .../devicetree/bindings/eeprom/at25.txt       |  2 ++
 .../devicetree/bindings/nvmem/nvmem.yaml      | 11 +++++++++++
 drivers/misc/eeprom/at24.c                    |  9 ---------
 drivers/nvmem/core.c                          | 19 +++++++++++++++++--
 drivers/nvmem/nvmem.h                         |  2 ++
 include/linux/nvmem-provider.h                |  3 +++
 7 files changed, 36 insertions(+), 15 deletions(-)

-- 
2.17.1

