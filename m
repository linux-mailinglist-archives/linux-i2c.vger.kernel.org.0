Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7846E5EDD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 12:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjDRKen (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 06:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjDRKem (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 06:34:42 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400E010A
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 03:34:39 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id q23so62418768ejz.3
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681814077; x=1684406077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yTEnd2UF7sGT0W7Kx+FkFbXepnbyh87PL+kVQ+y0g3s=;
        b=XxmVwvo3OMrlXvRMSpp4BKJC3YJHRXdbqq2+s3PZ3/3bXWXA7bzq5fFxslTL0pvILq
         j/i2R6wx5mpuMV7G8Fry3ov0yLa7bBDE4ade3xpRt0QaWGDvapGnpfpYWq0+wbSVpwQ2
         HpD8InWdr4fKsoqb5kE+htBJEqNoRjomyrfyZ5S5j9bjNSsmA6QV6MrnwUROKNfsLcgp
         YeVmLBN0P2BajsMrjvunBLIGHJxPeWzrnJrpOhFrYyNBgQCjanzhqsvaZ9TkdgxEw86W
         hRt6Pifn3CXnyb3VaBdxDOktixX3WoNypNqLmDVzaTkTFEc88WWOjkOlaJTdihtdNMn2
         d0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681814077; x=1684406077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTEnd2UF7sGT0W7Kx+FkFbXepnbyh87PL+kVQ+y0g3s=;
        b=d98PyCGe3nOAbEGEiJP0RMKAHCwkJiXiZGldLLrDnmhVNtawx5Y9KkrBA9xYhbn5OZ
         oS2X91yPyH6aVi4Vlz4XQ7GZAjjuyriEXHIe3O9V+iMd8c4uoai3jFqmfGgEcHyC6/GI
         jMFf1tSdxSA0w19f4TCx/IxaGa71osHTcZiJI1+i3Ir9KkM+ZU7lqISxzvODlY7RXb98
         dtFKnQJon5t13H/IM1qj6EDwG0BOYo+C4uOAK/add1WpHsYmiswCA7fbojl5IjTeU17d
         RR22F9VoTE+s/D5tO+xhpg50JIO2v0RalAxh2heNYyWSUhPH8fLyFX83lDEFuN0/lB9v
         /cuA==
X-Gm-Message-State: AAQBX9fU1nIQ7CF8tOcmQY0evepcpj9+/hMgQlTMDwJEpxuOVaGTAoW5
        HrdAG2cqkLIzGytgqS34udcL4A==
X-Google-Smtp-Source: AKy350ZPojPlietPPpvtB66gp6YmvLxDYsOR6UoaY/DotvRJpOedUqvCedFGeVss0onlkcPCESp2rg==
X-Received: by 2002:a17:906:a194:b0:94e:75f8:668 with SMTP id s20-20020a170906a19400b0094e75f80668mr9746919ejy.56.1681814077629;
        Tue, 18 Apr 2023 03:34:37 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id a12-20020a170906368c00b0094e8de89111sm7787126ejc.201.2023.04.18.03.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 03:34:37 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/4] Add support for Maxim MAX735x/MAX736x variants
Date:   Tue, 18 Apr 2023 12:34:25 +0200
Message-Id: <20230418103430.966278-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v13:
- Fix dt-binding
- Fixed nits

v12:
- Add separate patch correcting interrupt support in dt-binding
- Fix typo in commit message
- Make vdd-supply non optional

v11:
- Fix dt-binding example

v10:
- Small updates to dt-bindings
- Make vdd-supply optional
- Drop MAX7357 enhanced mode configuration

v9:
- Fix 'then' not aligned with 'if' in dt-bindings
- Split enhanced mode configuration into separate patch
- Add MAX7357/MAX7358 register definitions
- Rename config register defines
- Update comments and explain non default config being applied on MAX7357
- Check for I2C_FUNC_SMBUS_WRITE_BYTE_DATA functionality

v8:
- Move allOf in dt-binding and use double negation

v7:
- Reworked the commit message, comments and renamed a struct
  field. No functional change.

v6:
- Fix typo in dt-bindings

v5:
- Remove optional and make vdd-supply mandatory

v4:
- Add missing maxitems dt-bindings property

v3:
- Merge dt-bindings into i2c-mux-pca954x.yaml

v2:
- Move dt-bindings to separate file
- Added support for MAX736x as they are very similar
- Fixed an issue found by kernel test robot
- Dropped max735x property and custom IRQ check
- Added MAX7357 config register defines instead of magic values
- Renamed vcc-supply to vdd-supply

*** BLURB HERE ***

Patrick Rudolph (4):
  dt-bindings: i2c: pca954x: Correct interrupt support
  dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
  i2c: muxes: pca954x: Add MAX735x/MAX736x support
  i2c: muxes: pca954x: Add regulator support

 .../bindings/i2c/i2c-mux-pca954x.yaml         | 45 ++++++++--
 drivers/i2c/muxes/Kconfig                     |  6 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 88 +++++++++++++++++--
 3 files changed, 124 insertions(+), 15 deletions(-)

-- 
2.39.2

