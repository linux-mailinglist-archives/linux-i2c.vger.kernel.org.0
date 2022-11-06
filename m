Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B5961E37C
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Nov 2022 17:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiKFQmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Nov 2022 11:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiKFQmU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Nov 2022 11:42:20 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B68AE6E;
        Sun,  6 Nov 2022 08:42:19 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a14so13141811wru.5;
        Sun, 06 Nov 2022 08:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0M9R75vRxQY86TLND4KJ/u+bFX3C99lFezf0Txj4TMI=;
        b=I9/+U+/ltr4+/80cbxDqwRe1LcRt4+ESkLVmG/nyWkcHmQoxGfWGRORUMwteX2dkE+
         YHxIRISBO0viH4IUt4f91FqNASGI2rzG3WQFhwr4NK6Xj4LkbQvtOOfWY5nZMOQKACL2
         ss+VP03JoQzcML3WFrphMB0ACR/ruBcmK0uoYLyPPAVMYrrkN8HUaUz5V3Bc5qhpHpHx
         kZV1g+r9SnGv4RH8xog5bW3LsqJZ4GiU66dG9lAE6tSmsn2TlMvEJdvHU0GM3B4W9G1X
         gNIBYH4oUHCYOyxrDsvYw+nuj62qHyJ9hN/JWFq9VI69zFNiFtuPj3si4WcX8/X/Kdc5
         YoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M9R75vRxQY86TLND4KJ/u+bFX3C99lFezf0Txj4TMI=;
        b=FMrmmtmNAChOivQgxDVxkG8ZahfjKLJsnarChCqIIRpZcr/fT1OalTZtYx+gU0FYjH
         dbAlsApkhc/uTodbVyYYYKLLvE8qTI63h/rF9MXR7Zo4YLKXoZmMiU4Gzu/hQJj30m28
         CZ1EpF9lNkvnJyGFSZpxmWAk4dwwfYP2nlYgSfkxOxSpCWiPuvpYTlPzvrkmIid/OCqv
         4ThCmySrcWQgNbzXCtt0wUKKjIbAgDbKd+XhcVCPEwVh8TkwxFFmKI3g1iH3fMk2Hwk5
         6cq//ntIDbLix7mEhy9uzCJSScPnQ8IQia2kdDVxKbSkRMoF1uWIw9h/Bu71HifJ+0nr
         tqAg==
X-Gm-Message-State: ACrzQf07WI4ay+T0w8UplYWHvEIhRt9IiwPvnwwKQNmiVRY0TiLulpi3
        GiuMDSKJhYDEsx/3SBDX9p8/6fHU8yg=
X-Google-Smtp-Source: AMsMyM6lBTiQQHdh2wpjqZ3ib3F9yG1KnwdMnU8FHpvdhH5NU54IElAFTEDRwbqduC7dguqhynWSdg==
X-Received: by 2002:adf:d089:0:b0:236:558b:abc8 with SMTP id y9-20020adfd089000000b00236558babc8mr28310905wrh.231.1667752937635;
        Sun, 06 Nov 2022 08:42:17 -0800 (PST)
Received: from localhost.localdomain (188.red-83-35-57.dynamicip.rima-tde.net. [83.35.57.188])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b477532e66sm26553330wmq.2.2022.11.06.08.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:42:17 -0800 (PST)
From:   Angel Iglesias <ang.iglesiasg@gmail.com>
To:     linux-iio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/2] i2c: core: Introduce i2c_client_get_device_id helper
Date:   Sun,  6 Nov 2022 17:41:49 +0100
Message-Id: <cover.1667750698.git.ang.iglesiasg@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduces a new i2c helper to query driver match tables and recover the
identity of the bound device. This helper should help with the migration
of existing drivers to use the new i2c_driver .probe_new callback, which
does not provide the device id with the pointer to the driver data as the
previous .probe callback.

As part of the patchset, migrated the bmp280 IIO driver to .new_probe
callback using the new helper.

Changes from v1 --> v2:
* Add further clarification that the device queried needs to be bound to
  the driver.
* Drops extra newline after function return.
* Discard unrelated style changes.

Previous version:
 https://lore.kernel.org/all/cover.1667151588.git.ang.iglesiasg@gmail.com/

Angel Iglesias (2):
  i2c: core: Introduce i2c_client_get_device_id helper function
  iio: pressure: bmp280: convert to i2c's .probe_new()

 drivers/i2c/i2c-core-base.c       | 15 +++++++++++++++
 drivers/iio/pressure/bmp280-i2c.c |  6 +++---
 include/linux/i2c.h               |  1 +
 3 files changed, 19 insertions(+), 3 deletions(-)


base-commit: e38fb57870172ed920c206e8d73e2639d83c8847
-- 
2.38.1

