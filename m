Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67E6774938
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 21:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbjHHTu3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 15:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233625AbjHHTuO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 15:50:14 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D4B53525
        for <linux-i2c@vger.kernel.org>; Tue,  8 Aug 2023 09:56:19 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-583312344e7so73076607b3.1
        for <linux-i2c@vger.kernel.org>; Tue, 08 Aug 2023 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691513778; x=1692118578;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zRGROs0prSq9MFh0VojzEm9/faHihdz2gNY33winOk0=;
        b=ZwuzzdZO9kYs2Oc/mNbJfARuvGlMIC3UUvNeZoKIvfQ2VX/159UeLD1ZOmH/QRku2q
         UdxijLS1nyzh4vJapMPxBdB8Mw0I7WhzdZN5HIP1q4KkrgtgqCuWf6ebvKHNXq6l9tGA
         r/JobYflpqEJayDjQmiSyLfBHt9cttoaedbWNQRVokc8GdBH1nN1OhMM71m5X6bnIFOX
         jGZafbBDftxnGbVwxScApAzdztO3THQLw8zbAAexjzipo9xfZrido1s5h4shka1W8pRA
         mt9oD6/q/ha3W6CQK/O/WueGTnREmrbLW/46ftFn+1ehcZRoL4uLnQTtAg2+1kfrNN1r
         1RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513778; x=1692118578;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRGROs0prSq9MFh0VojzEm9/faHihdz2gNY33winOk0=;
        b=IdS5lmCMDMA+PprB/bWpaiEM9Iu4PLdMzWN+p4GG4iUebnWr/xjjLmbylzq/EGJcwD
         PZmUWdVuZ94SOa5mwQTGBrB5H8e4NazjK/Y2NDkLcFzVcdkBxfm1eO5aDTffECPX2kVm
         TSdcuB0ccPNBndBEttHfhFlw0cQVzLiUMuysB36B9SdqeT1SPwDb0EpgNVFzFk8uQO3t
         /6jnbJmxLKnCgwrLyTzROx/rluCepAonSicf0HDr1H/wVx4esYm+9H3LTzGsIfgtBGUy
         cSiBhRWGhdy7grO5/CGwaPMw1cyGL6u8ZQWDMQPeLGlnW/bibmevcLW+rauzYNp3SE1I
         5RvA==
X-Gm-Message-State: AOJu0YyPHZVhMam0m/0DIyezmfCFZgk2iwEgMtVbHSLpZhF8NxtCj0lG
        X08kzDgi7gsKQ25CA1n0d0DzadyjoJvMVbOt7A4=
X-Google-Smtp-Source: AGHT+IHvp4RVooOae7EfRvNoe9ojEueuoOpKM3VV7FgRuePNPnjR9K9MVCvuT9PpaD6qBvXfpS2T7QcKSQIpYFkLMfU=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a25:860e:0:b0:d5d:511b:16da with SMTP
 id y14-20020a25860e000000b00d5d511b16damr1793ybk.2.1691513778422; Tue, 08 Aug
 2023 09:56:18 -0700 (PDT)
Date:   Tue, 08 Aug 2023 09:56:16 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK9z0mQC/x3MQQqAIBBA0avIrBPUiqSrRISMU80iC40IxLsnL
 d/i/wyJIlOCUWSI9HDiM1ToRgDuLmwk2VeDUaZVVlnJBqU7/JJudzNKq6lHMzjbIUGNrkgrv/9 wmkv5AFb2g4hgAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691513776; l=2427;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=si09L+ne/76nNtqRPQQNA8vh+v/vSOpRLqSBS/7yXBU=; b=rVdUpEz91pDMvj2lTvd62ib7crXJtBOPX1kW9foKJV39T/d9Twit/ju7Ur4Jw4tv+AsMmMlNb
 X1Dlt6TmZSeDalyhdGjGC+BA2Yko/jKs/08sEV2wsETgddvbzoMAjbW
X-Mailer: b4 0.12.3
Message-ID: <20230808-i2c-amd_static-v1-1-1902f608bba1@google.com>
Subject: [PATCH] i2c/busses: fix -Wmissing-variable-declarations
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
bot spotted the following instance:

  drivers/i2c/busses/i2c-amd756.c:286:20: warning: no previous extern
  declaration for non-static variable 'amd756_smbus'
  [-Wmissing-variable-declarations]
  286 | struct i2c_adapter amd756_smbus = {
      |                    ^
  drivers/i2c/busses/i2c-amd756.c:286:1: note: declare 'static' if the
  variable is not intended to be used outside of this translation unit
  286 | struct i2c_adapter amd756_smbus = {
      | ^

This symbol is referenced by more than one translation unit, so create
then include the correct header for their declarations.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308081000.tTL1ElTr-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 drivers/i2c/busses/i2c-amd756-s4882.c | 3 +--
 drivers/i2c/busses/i2c-amd756.c       | 1 +
 drivers/i2c/busses/i2c-amd756.h       | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756-s4882.c b/drivers/i2c/busses/i2c-amd756-s4882.c
index 063274388a75..8156cfc43df3 100644
--- a/drivers/i2c/busses/i2c-amd756-s4882.c
+++ b/drivers/i2c/busses/i2c-amd756-s4882.c
@@ -26,8 +26,7 @@
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/mutex.h>
-
-extern struct i2c_adapter amd756_smbus;
+#include "i2c-amd756.h"
 
 static struct i2c_adapter *s4882_adapter;
 static struct i2c_algorithm *s4882_algo;
diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index ef1307a258e9..af77374d2ab3 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -31,6 +31,7 @@
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/io.h>
+#include "i2c-amd756.h"
 
 /* AMD756 SMBus address offsets */
 #define SMB_ADDR_OFFSET		0xE0
diff --git a/drivers/i2c/busses/i2c-amd756.h b/drivers/i2c/busses/i2c-amd756.h
new file mode 100644
index 000000000000..88698266d6d8
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amd756.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/i2c.h>
+extern struct i2c_adapter amd756_smbus;

---
base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
change-id: 20230808-i2c-amd_static-81e5c27a84ce

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

