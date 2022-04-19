Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40E9506CA1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Apr 2022 14:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243378AbiDSMnl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Apr 2022 08:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243403AbiDSMnk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Apr 2022 08:43:40 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB862E9C8
        for <linux-i2c@vger.kernel.org>; Tue, 19 Apr 2022 05:40:58 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id v4so21066243edl.7
        for <linux-i2c@vger.kernel.org>; Tue, 19 Apr 2022 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbofyV1fic7pP6HMfJQj3Ab0tUOTAaFhAUHLIghCboE=;
        b=cTVu7zsjpB+V8mcf4t7tPhQAGJA3R/7k2i9zy3/hbrMcuLvoqNvc4K3C2iIDPoYfIn
         hx59pyXAFfjZ0MSTmaPYpESS8rBWCBSFkZgc7TMuJL4GxXc+IT9Ll/8OoOqYj+3Mg/4d
         oLMhN5N0nSXheknxTYxPxn7865ghUQ1g//S75ODRFFGF52Sug7Zw4KzDBAOmSAJ1fT+W
         t00H/i7xTSXocaEJFqY4rd7qb1Ijhw+Pv5VJyYDO4/sOxWsQvEY05IcczTlqrPvOlvYZ
         cYiSeUKUlSzVTqlaSIRbVn3zzuH8e19vs5pPKReLMo6QUV5j/ppVl4VKZUdGDM36agT9
         IyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zbofyV1fic7pP6HMfJQj3Ab0tUOTAaFhAUHLIghCboE=;
        b=rULiXPT19R2xW6GD/VjhCvuOpUykH0F09ADa4GVfRPlUWFDjUNEmAjgfqwIGb+AJ9B
         JyDwOm3YIsg1ouW1L1b9YT6lJG/5B0mRFmK8cLfWpsQyIyOoVHk4M6EztcQ9+BJjrnMM
         9yc5/Zx/XutaiBNarKjtqAm9+a6Wz/thFn6dqHRqnELsAFAWrTPZzT8G2WfAIq85kQiH
         3HMxuyZelIh5bj1fF0ZWbekybyYDrdt1NQmNBCNC4x7zwyg5LilAsJBoP39hmx8cYz8+
         d74rG+V8Fdjf3TszIfdNwqh2XSdTApPotuicV/TxawkbgFUKZ3/z5lbpgVTbEQbK+cfh
         M5Kw==
X-Gm-Message-State: AOAM532WyHFW2F9Zy/74OpsiZBcFZOMcpo8GcUALNcISOmTbr5E81fmd
        Aq+T23m5rSYuY/4z0E7fQVeL8Q==
X-Google-Smtp-Source: ABdhPJzW/SxmIzdPcj9hcji9IFgOetJZ1gdKF6CvMPrHf78Yj1B/Nf0TFxaXcKe8SGylB1AI0IQplA==
X-Received: by 2002:a05:6402:42cb:b0:421:c735:1fd3 with SMTP id i11-20020a05640242cb00b00421c7351fd3mr17298386edc.341.1650372056866;
        Tue, 19 Apr 2022 05:40:56 -0700 (PDT)
Received: from fedora.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n27-20020a1709062bdb00b006da975173bfsm5709274ejg.170.2022.04.19.05.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:40:56 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v8 0/3] Add support for Maxim MAX735x/MAX736x variants
Date:   Tue, 19 Apr 2022 14:40:21 +0200
Message-Id: <20220419124025.1733230-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

Patrick Rudolph (3):
  dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
  i2c: muxes: pca954x: Add MAX735x/MAX736x support
  i2c: muxes: pca954x: Add regulator support

 .../bindings/i2c/i2c-mux-pca954x.yaml         |  39 +++++-
 drivers/i2c/muxes/Kconfig                     |   4 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 126 ++++++++++++++++--
 3 files changed, 153 insertions(+), 16 deletions(-)

-- 
2.35.1

