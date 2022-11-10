Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2641A6243DF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 15:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiKJOLx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 09:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKJOLw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 09:11:52 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7E01743E
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 06:11:51 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id k2so5336162ejr.2
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 06:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=mpGOwIDC6RyqeqJOJZ70WfswIAfcOXcXcK09BiGwsdE=;
        b=UZ7OEqL1nYcU4Ljq+dD0Msj9k4SekcMDGBhg6G0O/pmW/rAv17Ek2hWXT4/vB3CKu7
         13MaltHhltvh488ph7fWPljkTi01LUPvFz3zNV8Yrwyd3R6b60S9DFAAmjhE5sYOXuss
         cU6WeB617eP2bhP7WILKaHocbPlZLfYBfTBvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpGOwIDC6RyqeqJOJZ70WfswIAfcOXcXcK09BiGwsdE=;
        b=uMfHwQkDLxLtkW3psv5Ao2hvFF1hsCO9+unpXBhvbCFh4bJbdk06sXC/4Uh41o1BSe
         l9+eaJ/EqtWvcKoDAgVxmQol8T1nT/Z53R1KDOdkbc/v3BkrVfP8eZamcYDDm2LXC0Rz
         J4MduuOHm5cah3mV/KEx/CLNiDB+Q2kGqAMAPoAusyry6XSkfBqGzE+ECGoyXjARXV3M
         4zXeyzWP7bmMqlGzFNYV8UgtMtyhrtjGHEtohUqFmnUsWi5nN1OKGfLkLJhgxbIzziRg
         plEYi3nI44mgUBnJxez8sYG1pttwAv6sUQyevhhzuJJRLPJ+Mu/GdBeUBsR9i96YR/nK
         M25A==
X-Gm-Message-State: ACrzQf1oE1y6aZ7z5RlCSKgwoCx3XRB2Jzd4w9bJesLK6Lm4tdtFoSAr
        YnhtqZbZhG5te1eOtWPR4za0cdmtQxpHugoM
X-Google-Smtp-Source: AMsMyM53O3xL6QToN1LIHbetQjNP2able8V85uBPifwCkuIVPahXwo9cSqrvK3+lI8b9rx7jKA9gmQ==
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id dd3-20020a1709069b8300b00730b3ae0343mr61811483ejc.670.1668089510192;
        Thu, 10 Nov 2022 06:11:50 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:e41d:ff2f:a5fe:e81e])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709063d2200b0076ff600bf2csm7308383ejf.63.2022.11.10.06.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:11:49 -0800 (PST)
Subject: [PATCH v4 0/1] i2c: Restore power status of device if probe fail or device is removed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAJ4GbWMC/3XNTQ7CIBAF4Ks0rMUALba48h7GBT/TQlIhAYsxTe/uxKVpV5M3me/NSgrkAIVcm5
 VkqKGEFDF0p4ZYr+MENDjMRDAhOGeKBmHpW4cKVIPqR9B85EYSvDe6ADVZR+tRxGWecelDeaX8+fVX
 juO+V1U5ZRRcz7RSRinmbtbn9AzL85zyRB5YVMUhFohZLyUzo3Da2h3cHuIWsRsuklvTmWH4/7xt2x exvo+FJAEAAA==
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 10 Nov 2022 15:11:42 +0100
Message-Id: <20221109-i2c-waive-v4-0-e4496462833b@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Hidenori Kobayashi <hidenorik@google.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=3UiRQb+QdR5Bl65LKAPmfm03Ffuf+eTUqFblaN3JJzE=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjbQahdbgFKzWCA2RDpUGQVY/z/fzxN6ntwcXuLyNp
 B+dHg06JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY20GoQAKCRDRN9E+zzrEiDEHD/
 4uxwmNSBFLQ/VjTr+fSQsLdXZFC9iPjfRkpKG85yJklzBtR83sivSwkQk7wWUe5/5m3cIIPy+345ym
 gGqDmsUGIulkr5NLScAGtcy/s8dmZvSZQeb+PJj344vG1qn9rkkwCcC4j+bM7KIFh6M50Ds6TZ6bVn
 vDMcOebKWGsW99YlgB8vVMJ9wxGVV9Dp0wp7NDhj6neyt/iTmOpOmELgJKaVUi3YzQJaoxnOovo1hf
 uFlxc3gh2blnLoDlwUQ0qwNux5hz0DpydtfzMTaamgyQP3wobZaAuSX4M3MB63WUt/3bmxkSbpDeqP
 2rGbHrggz0WHVoZuGEjMlgJsaD/Nuot0aZfYQRWA52m38TByjUn3CqFTXy2Yvf4L7KWPfOBNaczLB8
 eNAP3fpwa3Zkj5jBdXs3QTvUCbRRxlv4BYiebBrNNILuwfYPqDKoz9WeowZWjlRBgeyqnYeMKc2KGz
 5xxmrUUayE/4OZ2pEJtFBgHB9ACk7MCraHhiT3hkJNE1VARKxFpFfZ18AQBt6LxxbqpnVqft5xPJUU
 RPKBSLnVv1NA7eN3VFFlEMp0YVR0cwCGi2GORQr/Wz4iGDHKDcdwhgbLIIxDtUUA68mWD77UAqWYHu
 xAwAtBtCz2UGQnotJZgm/hF0H4HVBXCTLzSBx8LON+E9qqypdGrLO09eyjhw==
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
Changes in v4:
- Rename full_power to do_power_on
- Link to v3: https://lore.kernel.org/r/20221109-i2c-waive-v3-0-d8651cb4b88d@chromium.org

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
 include/linux/i2c.h         |  4 ++++
 2 files changed, 11 insertions(+), 4 deletions(-)
---
base-commit: f141df371335645ce29a87d9683a3f79fba7fd67
change-id: 20221109-i2c-waive-ae97fea1f1b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
