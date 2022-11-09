Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C7A622DF0
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Nov 2022 15:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbiKIOaX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Nov 2022 09:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbiKIOaR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Nov 2022 09:30:17 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DA917ABB
        for <linux-i2c@vger.kernel.org>; Wed,  9 Nov 2022 06:30:16 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id f5so47122263ejc.5
        for <linux-i2c@vger.kernel.org>; Wed, 09 Nov 2022 06:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=N96rWukkzzft84T2ilUpjkniGJmFniZsxB7jb54ifXs=;
        b=NUQruEBYuKGoATQoEgq8HnQG7zmavO8XD1UrtBSLzg8JU522IgpPOEXmqcF4u0Ez5v
         FBMEDkmVUu9wjt/3Ew9uAOCPrOlaNYbTsAfsDYXE+SPqBP+oh8kv9+hq7VU9ZZjR7ljQ
         9rZGRPv6nzYTlfPZ0UlpecP7Lq8FdNJsBerVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N96rWukkzzft84T2ilUpjkniGJmFniZsxB7jb54ifXs=;
        b=hinc5oJs/uq/6NxVo6he4jpIB2yoi8MAov+jG9gz+YqhBz9o296QjAlZjpy5yQr5Vq
         pemsx2GD8Gms9NEnCEvOPP+Qs9Y/FpDCGw5JnslewmDt3NxOqbCxwoSoFfnEGR/hdz5x
         sE5aQ7k/TxmKHYvEiFcWvYGdxhsYPCaucFKh0z9upYyYyVPW4OdteX91BmQ3lVFnpWaG
         fbvX0PeXgydXwgpjRIcaWP4BNqN4FIWE5z0Jfzr4R8BRHhFEN4WoH6JaRS/bDbzDZFVs
         /YwuT/aAjwUArpwXzT9JsZ7nGOKQdBWS0lDPvLe5PhFhfxwCBRrVyJuHN9LRpFYLbc9B
         zaog==
X-Gm-Message-State: ACrzQf38v435qR8WzCK+yzWJ4KhVVeJvhCE4V0fxmV5o7XXkIGwrlOW0
        FIj//1hG+a3nCTPRLi+64gnHow==
X-Google-Smtp-Source: AMsMyM4ljNakYGb8FEwYQ+ua0vOjv8/+n3jDbN6hIZptU4+jxoR/3FXruQkLjWdo4N8Xgm8mp6JuCw==
X-Received: by 2002:a17:906:6a02:b0:7ae:2793:aa19 with SMTP id qw2-20020a1709066a0200b007ae2793aa19mr29371804ejc.265.1668004214873;
        Wed, 09 Nov 2022 06:30:14 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:7487:46db:8e12:c768])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7c1d9000000b0044dbecdcd29sm7020389edp.12.2022.11.09.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:30:14 -0800 (PST)
Subject: [PATCH v1 0/1] i2c: Restore power status of device if probe fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAFu5a2MC/w3LQQqAIBBA0avErBtwhAi7zWhjDoiBki2ku+fywf8DmlSVBscyoErXpneZoHWBkL
 hcgnpOgzXWEhmHagO+rF2Qxe1RmCL5DWbvuQn6yiWkeZQn5+/7Adt+K05gAAAA
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 09 Nov 2022 15:29:47 +0100
Message-Id: <20221109-i2c-waive-v1-0-ed70a99b990d@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Hidenori Kobayashi <hidenorik@google.com>,
        linux-i2c@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=xbF/MIUAKcQD4clS31BaNJtsnvcssnr11NYtRC214vo=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBja7liJtRWY4suMhjLbNI+ldyebAoNrPAn2LUdX8j9
 Uvtt7lOJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY2u5YgAKCRDRN9E+zzrEiJM4EA
 CcSqPambhLY9adGX94xkF46+nnAl704+gj6irsEN3zkkNVyfOrjYjxk5pZF0888rRnySyB5SSwxiv2
 mH6WduT2kfnm1Kb1/CU8XJ+kM5yZJPEEsZJ85ZTQZuuqONVfPaIar7LcfO+MxjHjEOpu00yJ80fClX
 diCewkAjl18jlmBuIliVjGDHoiQ73ZIVP0laKz7/OcYT9kbAwBpStcHrklzCOyxoxyoRiWi88xuIfp
 yvKpPUEkyXbk7vvJAXb3uOjFEBoTon9enLRX17HuI6nXrCJc2GjZ3SnJNlQFWsaHPYTUTm2HoydSHW
 7AZBLEQvSWY5P2zQJCXSUD4x/fjfuAx3hx8viF0nDm1s83+Z/OeJ+hpop6rSIVmA+vWU3aXM0Z3Tnh
 2RD5fH36rK6VFe4pAu2SwUvueSfEIaO8V3nrHpejcHAKnDnU3tTVJRySfq1FeTAGplTJCi575zH2oG
 5a9xtXh26OP4zzZG/EWPjEPxBdHqDaJ5kp9jUvPF4Figpt5Z1bfN4bx0PdOA/AnGoCkgwMINgvR8da
 hYo6+tao7Pcuj9fv2GXO0yQRL1GDuGJ2fketb+bM9L3wuYaKlO1/JqK3Bu8vWbKCNIWYZaII7ZXk6R
 P+mZbpBId7dnB93XawBMIcjeYjfqD3hq8GuZsJtxDC6flN7ECRdhkKnNeUsQ==
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
Ricardo Ribalda (1):
      i2c: Restore initial power state on probe failure

 drivers/i2c/i2c-core-base.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: f141df371335645ce29a87d9683a3f79fba7fd67
change-id: 20221109-i2c-waive-ae97fea1f1b5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
