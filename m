Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888F9118CD4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2019 16:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfLJPmR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Dec 2019 10:42:17 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42250 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727411AbfLJPmR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Dec 2019 10:42:17 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so20594884wrf.9
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2019 07:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=6NwUJ31Bo5gKSBcxH1IDObD46smc7wVjOw9e/arLHQA=;
        b=FrZeEqkqxNArFnKorxAKtv5XDSo6QeJdoZVA3gbtqAuJdQz5fTj0xOXb8o+1KVUvDk
         VQDURHvy6+QMWLTUkh4QpEprSfPEi3UruZTRfNwb/OwrQ53/mmiZrSJjI7oD3gFrQbbf
         UOBLk7b46xE+6spl4k7pZcsr7UJLXAI2UnMTaGSdNLTtuwEomrQYvz8V+7uQPfyJyfJi
         FavcexNoEe2wxlQXYsUE+wS5/xHgRpcEJU0t8wgLgAV6PxLZBwFIL7fivmzduXIP6srx
         CYcFdJsEk33pgCn9mOEEQOAbEXyiWLO8fVdKCfA7JqhcZuWdB5OCASUjaHeyUQFE5hmr
         7dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6NwUJ31Bo5gKSBcxH1IDObD46smc7wVjOw9e/arLHQA=;
        b=V5T+O+xTtXq32xZRjtEAlwwhpEmNyDBAQuMZM0aGNrdRcXtVQgrQh6AKrGVNoyeCHh
         ZesRfB4WoQDesLdfmbnefiNyldrDRHgQG1vaIDzt72hMIh6yF/CX1DlquG7i3Pd3c3jv
         DfxfT3miK0Y/Jn8fJUcVT4AbM4HwAOG2SNyStIO/ReLTVIOKb7+napzMPtm2Fn8MCNrp
         FfAAXjMnDmBN3iGTAE4V4gzm9X1LXSxo3cLSgKotifBzz6YpYP+pvaFdGjaloRJT4Gqu
         vyQMWn9d+HGT0UCMfUVJI/zg/0iTEp1Ag3EcMgfNCkCTaKRcVSwMcf62QggnAmyIXI7J
         ulGQ==
X-Gm-Message-State: APjAAAXbutz5LrwjvQj/ZhSCUqKlWpzadgTRryBFjjVudSgTGLKLxrZ3
        XjLX0xE0j6UvnpwgD3c9mhDOPA==
X-Google-Smtp-Source: APXvYqx0+sRZpARe7yyKwoh1VzPjcBcUfnEDPjYDAlfGydTyHMB1TtXdHHswyB1vjks0B67ZVwWqOg==
X-Received: by 2002:a5d:558d:: with SMTP id i13mr916414wrv.364.1575992535224;
        Tue, 10 Dec 2019 07:42:15 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o7sm3469085wmc.41.2019.12.10.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 07:42:14 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v2 0/4] at24: move write-protect pin handling to nvmem core
Date:   Tue, 10 Dec 2019 16:41:53 +0100
Message-Id: <20191210154157.21930-1-ktouil@baylibre.com>
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
The first patch modifies the relevant binding document to remove
the wp-gpio, while the second removes the relevant code in the
at24 driver.

Changes since v1:
-Add an explenation on how the wp-gpios works
-keep reference to the wp-gpios in the at24 binding

Khouloud Touil (4):
  dt-bindings: nvmem: new optional property write-protect-gpios
  nvmem: add support for the write-protect pin
  dt-bindings: at24: remove the optional property write-protect-gpios
  eeprom: at24: remove the write-protect pin support

 .../devicetree/bindings/eeprom/at24.yaml      |  6 +-----
 .../devicetree/bindings/nvmem/nvmem.yaml      |  9 +++++++++
 drivers/misc/eeprom/at24.c                    |  9 ---------
 drivers/nvmem/core.c                          | 19 +++++++++++++++++--
 drivers/nvmem/nvmem.h                         |  2 ++
 include/linux/nvmem-provider.h                |  3 +++
 6 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.17.1

