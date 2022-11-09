Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61F21622EDD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Nov 2022 16:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbiKIPRS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Nov 2022 10:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbiKIPRS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Nov 2022 10:17:18 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EFA1CFF5
        for <linux-i2c@vger.kernel.org>; Wed,  9 Nov 2022 07:17:17 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v27so27725716eda.1
        for <linux-i2c@vger.kernel.org>; Wed, 09 Nov 2022 07:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=zmk97Y1kdEfRXSICOIciCIHq7hoxuKuixGqwic5cTfk=;
        b=G5u5ThYOa6f4LBfVwmSz0Xdx6p1KPsHYVzfgSk+1l86gw9PMHcvYa95FrHg9JLQZvb
         rMeiTBNObWYfkWNf3YkBx5xo2f4K7gbvG6vE/mbQU04HXMNWtUdiZ9/ZbvI4dAYSK/D4
         MilAR7oPTPVwtifeJeHy4icRa8fIF1oGMt8x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmk97Y1kdEfRXSICOIciCIHq7hoxuKuixGqwic5cTfk=;
        b=iQkuEgUovCyxNvzGnaMZYMqLQXx76ULP2qBtNGAstMOCnvmouFdMvsBxi2j+MVnoPf
         Yw1JI2u1GKjI8l9tGTf1MVjALO5jTT2HmMO2tcgECY8RmBXCpwtE3lqjcbLoBkQcE2fe
         SSM0+M70gFhEfcgIeRG/6CgBYIe3hDi5zIXwNRRudtW1OlDYXGOxHFTIZBHVfMOQbaSh
         2NioyuBsXcxIcV24lS12qL0SEToRLspQnuDQ2ZR+LPyBJNirpWD6RXDVwEYvmmAcgabT
         oq54PUkOn2i2Lm8/x7qQpfy84mwMGPX9fOtHtRJ0Fs8+ha1cF805muMIic3bIa2+GSNu
         MfdQ==
X-Gm-Message-State: ACrzQf2rb4iriN8X9j5s9ZfXews87ycKGxDdoIGghcs7jBMydIAit4yS
        3Hb9k3gb0umCaZe9NYE7H/w/NQ==
X-Google-Smtp-Source: AMsMyM4oHMA5tVDz5uvuip1U/hr3qjR0S6qrCCZR9UIVYEPFWRI0FsI/J+oSLEqtEXfLjAEgG3qZCg==
X-Received: by 2002:a05:6402:5159:b0:462:3e9f:a0a4 with SMTP id n25-20020a056402515900b004623e9fa0a4mr58897624edd.313.1668007035636;
        Wed, 09 Nov 2022 07:17:15 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:7487:46db:8e12:c768])
        by smtp.gmail.com with ESMTPSA id v19-20020aa7dbd3000000b00463c5c32c6esm7052320edt.89.2022.11.09.07.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 07:17:15 -0800 (PST)
Subject: [PATCH v2 0/1] i2c: Restore power status of device if probe fail or device is removed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAHHEa2MC/22MwQrDIBBEfyXsuVtUKMGe+h+lh9Vs4kKioI2hBP+90nNPwxtm3gmFs3CB+3BC5i
 pFUuxgLgP4QHFhlKkzGGWM1sqiGI8HSWUktuPMpGftbtD3jgqjyxR96I+4r2svg5R3yp+fv+oez3+q
 qlEhT6Mia521anr4kNMm+3ZNeYFXa+0LfQr6zaoAAAA=
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 09 Nov 2022 16:17:05 +0100
Message-Id: <20221109-i2c-waive-v2-0-07550bf2dacc@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Hidenori Kobayashi <hidenorik@google.com>,
        linux-i2c@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=RCoBAuMZW6/BLIikAeMUt8nhyD2JRoUp6FKyTIqVRCU=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBja8RznD661Rd7HbrTWcJXxIJZgpI6o1QaSLYeFN7C
 1L0SqvyJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY2vEcwAKCRDRN9E+zzrEiJqlD/
 4ki+JPH9bMz8acI0THadDEURL4tP5dToSmi0oS41v5I9+i9x4y5qJSKx2QUGtpwzh23DtpNuJF3TQS
 F3pUJm8Aw8BP3mBBPls71shgcBCxP9t38czPzUgi9Q803yTqoONn5wdexcKm+MpovKvLGozMqP1YN5
 L5ejDI6qwq7ALNbre7kU2ZqOM4bTEDV623tWeqDQxgDy5+HX9b8YSgYgMLjbqPCHYdTvxb8YujzH8i
 mSVnOXWKDVF3A4R/3myHLDNo12U/gEUkhtHNtY2AB6IVw/anNxKaNNzPN8C8KZP21zlqvkVuYMC5At
 GuWLTp+w6mezdt8zi/7v0iK1ypcRPQNCswbaYF87MXZpgh8VbAP9xgxsT3fnZg8yI9mogLgOI40Dn3
 SR64JcGanNhyC1aIlJHXNew3vr1+WwmO/+0sE0d41ga0UpSDtQ1CQ2XMSUKC9xPQ8GY064qL+jfu26
 LzBSwB8OEXZwRml2Wuc9wyM2fQcsrii3fPtSem0WUs/APgKP4tL0L468LveCbh71NcP+BF+HmHZ2B5
 u4S9wT1tz6NH5buSpWg4VIRptHWkNzy/ujE8DORi7OLnRb0t78cytGcLjTYZZ6Gxr9+PekFILnJPOT
 USGbwN1rpeBv0VCtUFmdIavVaz7uO5dxW4XOl4FD4exRKm7u7s9gIxQftFPQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Changes in v2:
- Cover also device remove
- Link to v1: https://lore.kernel.org/r/20221109-i2c-waive-v1-0-ed70a99b990d@chromium.org

---
Ricardo Ribalda (1):
      i2c: Restore initial power state when we are done.

 drivers/i2c/i2c-core-base.c | 7 ++++---
 include/linux/i2c.h         | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)
---
base-commit: f141df371335645ce29a87d9683a3f79fba7fd67
change-id: 20221109-i2c-waive-ae97fea1f1b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
