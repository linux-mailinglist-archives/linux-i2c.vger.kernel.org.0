Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18633623FCD
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 11:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiKJKdG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 05:33:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiKJKdG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 05:33:06 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4E6178B5
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 02:33:04 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id s12so2401906edd.5
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 02:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=oFMauseen+ABgndLJ/pvPKOevrA3IhGI5Uq/VIXv6FA=;
        b=OqVKUXXA348kFsLjvHj0vLxUJDIhYoP1ifKxr+a2mjZJvjKIPBSS3x7E/+mD8wvh1O
         kCJi45/J9n7IBhuy1Gj5otkK1gEsBLKoqNs2UFDjeqil9XrXMgsBBNggfxATEHLci+EZ
         qT7tcIlX6f6Q4duMF/RtntTJ+EwD+VoCi9yfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFMauseen+ABgndLJ/pvPKOevrA3IhGI5Uq/VIXv6FA=;
        b=p1jWp80CZH5mhmjCCZL0+sXL3lUXFLb/Aevl5fNU967hVS9q9BNBcY/qjWNKTkr5zj
         WiT10Q+CioPJZFNtRMEvcTP2fS4w3PlhM+GsrdkgvYNkLve1fdFkqNwDiH1JoYY331z3
         rfrlMZy/6mLM1P3t8y2tZBrf4alX+DxBtoTq0S8DLeujsE2pqIureI7tO5+XqShFxzJs
         S9BNdjnhCsdBI2wz+fL+GOQOcD7YBiKAyNoMRRJI4tL3UUv4uFMUfCH8pcIb5fQ3YhAa
         846wkXTwUE7/d/jxnnRvttmwQhwHTJxc3pIsK0QV5dFAE4JfLeAIIByTTUgHrBaHFrpf
         IABw==
X-Gm-Message-State: ACrzQf3kw9zPhLkZnzT9t2WOkdcxGs0JXVaLZxC3WuawD9d/RuMVgoJ6
        dDlmRvaBLDob3p+0KSsUsmv85Z4TE8Ncr++i
X-Google-Smtp-Source: AMsMyM7vJbu1FFbed+q5wYXfj5Ro1KNH0Rn70pBSW2oSkWj7CK7TsNXmz81miAaKLaOak6B4ihs8Nw==
X-Received: by 2002:aa7:d601:0:b0:460:21d2:e14c with SMTP id c1-20020aa7d601000000b0046021d2e14cmr1987293edr.3.1668076383324;
        Thu, 10 Nov 2022 02:33:03 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:8565:42a1:677d:6677])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906768500b007a1d4944d45sm7137467ejm.142.2022.11.10.02.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:33:02 -0800 (PST)
Subject: [PATCH v3 0/1] i2c: Restore power status of device if probe fail or device is removed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAFDTbGMC/3WMwQrDIBBEfyV4rkUtIdhT/6P0sOomLiQKmlhKyL936bG0p2GGeW8XFQthFdduFw
 UbVcqJy+XUCR8hTSgpcBdGGaO1spKMl0+ghhLQDiOCHrXrBf8dVJSuQPKRibTNM4+R6prL6+NvmuP+
 S9W0VBLDoMBaZ60KNx9LXmhbzrlM4sGiZv7ChmE19L1yowng/Rd8HMcbDgyiN+cAAAA=
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 10 Nov 2022 11:32:48 +0100
Message-Id: <20221109-i2c-waive-v3-0-d8651cb4b88d@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hidenori Kobayashi <hidenorik@google.com>
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=M82E0oMA35H24/OwUFwrKs63mvZo7xgnzXo5zM2LJXw=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjbNNSwWMZYHSZT0P9hHJCObX0tWclR+ojzLBIWFjw
 muqCxhqJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY2zTUgAKCRDRN9E+zzrEiIVFD/
 96FpLAsxQ/kKC+TsCzvHjm3ugGFVt5wxifhSQvzB7/NAAO0nRyGHtApfxVyLnEOgLp2fn3/db0kmap
 aEcNfpAjz48H5QyL6t/DA5xYzVJJvgVtawFHvh65fdTJoLZIBnqcM/4nsspUG0v/Qt5X8/35q09ln/
 8Fe4lkBKsHa+ggiRChPaU7PJlD9GigihbVHKxrnjrTO4blA482EcCi08w14YEu2IvJqso+hepGMNqi
 XpZzT6ncF+1tXwKuSqxI2gGipDkJ9f1lvn07JykrYd5Ga9QBIl4R/9fjtVw4Dy1Ki9IgUm0kbfoRPp
 SmJzUB99ZPA892Yl0xKATe7v77XrZB4X8yGleBwCHEmIhMV+jXpYN9sN8rfc/v0yV2L5cHZzct0FrH
 Fpj5hqNr0jwWm2uhoCns2+6DXuBahmFG7dxPViQ7U+HAkNqZ0d/Ri5By2NC8BN9N/9pEBt37GY/EGJ
 MMdGq2rqMoom3S3/8brZduGkfSMxAjaNxcIm3TtSUwsaR7Ugd9rAI+Uz6uYfJKx1jUK88vjPvS1e+i
 Mw/aBQp8NAV8Km63fUAMGOosAlaPLKEDJLMx6cSylvCytWX+UU8JWiukVh/aUzROFQ5wKsGXinMOG3
 /kazf0TUk3ubySQf5743UUcU5rlVtvPHC0j62FBmWPE81REGwpYWa90awv5A==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have discovered that some power lines were always on even if the devices
on that power line was not used.

This happens because we failed to probe a device on the i2c bus, and the
ACPI Power Resource were never turned off.

This patch tries to fix this issue.

To: Wolfram Sang <wsa@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Hidenori Kobayashi <hidenorik@google.com>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

---
Changes in v3:
- Introduce full_power variable to make more clear what we are doing.
- Link to v2: https://lore.kernel.org/r/20221109-i2c-waive-v2-0-07550bf2dacc@chromium.org

Changes in v2:
- Cover also device remove
- Link to v1: https://lore.kernel.org/r/20221109-i2c-waive-v1-0-ed70a99b990d@chromium.org

---
Ricardo Ribalda (1):
      i2c: Restore initial power state when we are done.

 drivers/i2c/i2c-core-base.c | 11 +++++++----
 include/linux/i2c.h         |  3 +++
 2 files changed, 10 insertions(+), 4 deletions(-)
---
base-commit: f141df371335645ce29a87d9683a3f79fba7fd67
change-id: 20221109-i2c-waive-ae97fea1f1b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
