Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD904126137
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 12:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLSLwA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 06:52:00 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40092 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLSLv7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 06:51:59 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so5295911wmi.5
        for <linux-i2c@vger.kernel.org>; Thu, 19 Dec 2019 03:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=rRTyPtsjMjEAp3h6bIlespvbMkUfnuh3fM/nsltxauk=;
        b=j4P8x9pASoURu4wvSqYR573rGBqgZhFgTCNK3NR2oqpfo8w4XmlKWhhk4H2E03GOnc
         zm4jUaBMucQsNyybYjX4ocsJAkc1ocWjtoX9OzlPnPlBc7erHf07TzueZGNm9jT6wZXn
         8J4azit5Sxu63FrG/JtGyFCLAFTsrO+FVE2D80F6PhmDjnt9pgxx986zP3VstkZVsd3w
         HYKpL5Wq9j5J6/X39WTu6HPoy0wDH2jXCFz7s8yXJRsS3qb+EH1Om8qRMUrQZAizlkoT
         lBqVy6mrqRxKuJXUN1a8XN4Ajx6sm4WpFblaxhBPQHsufABTPqgXAR2NtFsQa3ux89H2
         +4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rRTyPtsjMjEAp3h6bIlespvbMkUfnuh3fM/nsltxauk=;
        b=Ku9yfrrxt6MO9Us1xEAe7WGWv0NZEXt0gt4rZEtt3OC/p43i5Vxg1Nu5XWtSC/KKEi
         0mQKLCmWFexmmvxfJqZfyepcA9RhAMoeejQPTmHcIshiZ1lVHmPmXz7csWTHxPskGpIe
         urcDF4+f8nK+bAuK9V44/eM09DBtqjCnlvI6iYfMFp12rOyHavBv0uoivkzFtQWSww3s
         ijXH6LIhrsElMIdZmDGx/wwUhd6rRmk3E+y/HPZG+ORp6w7PKgcAyl3gCMwlLVhpCiTF
         E9NVYrefw5Za/IH1RQHcwJdMcdVx0iw+Qyqg8wAjwp5dxtesHzWEqsqVYju987x/SjZ9
         fZhA==
X-Gm-Message-State: APjAAAW1GX3ZcB0P7ihrP1n6KvuLhnh8WM534fzuJehU8x13yNXxjR5c
        yyQ8X0/2oXyRuGWFDU4D3fs86g==
X-Google-Smtp-Source: APXvYqxTpMH4yEZnLlkFfjfD4oocvRBovauizDVGIAcFtBKGIT/K14fKRV88L57JwqCD5SK5/kbXFA==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr9999932wml.55.1576756317614;
        Thu, 19 Dec 2019 03:51:57 -0800 (PST)
Received: from localhost.localdomain (i16-les01-ntr-213-44-229-207.sfr.lns.abo.bbox.fr. [213.44.229.207])
        by smtp.googlemail.com with ESMTPSA id k16sm6489660wru.0.2019.12.19.03.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 03:51:57 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH v3 0/4] at24: move write-protect pin handling to nvmem core
Date:   Thu, 19 Dec 2019 12:51:37 +0100
Message-Id: <20191219115141.24653-1-ktouil@baylibre.com>
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

Changes since v2:
-Use the flag GPIO_ACTIVE_HIGH instead of 0


Khouloud Touil (4):
  dt-bindings: nvmem: new optional property write-protect-gpios
  nvmem: add support for the write-protect pin
  dt-bindings: at24: remove the optional property write-protect-gpios
  eeprom: at24: remove the write-protect pin support

 .../devicetree/bindings/eeprom/at24.yaml      |  6 +-----
 .../devicetree/bindings/nvmem/nvmem.yaml      | 11 +++++++++++
 drivers/misc/eeprom/at24.c                    |  9 ---------
 drivers/nvmem/core.c                          | 19 +++++++++++++++++--
 drivers/nvmem/nvmem.h                         |  2 ++
 include/linux/nvmem-provider.h                |  3 +++
 6 files changed, 34 insertions(+), 16 deletions(-)

-- 
2.17.1

