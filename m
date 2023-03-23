Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10DA6C672C
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 12:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjCWLyT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 07:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjCWLyI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 07:54:08 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF9335EE9
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:54:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i5so38340023eda.0
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1679572438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEX3oAejBbS136aFLc2hCm49xsCfS2Jd421gnkE/ZzM=;
        b=Bi/AtRbguFiM/ehBvhhvJ84eM+gT6UM9brFqUYyd/pd+8dxEU1aeUMUnjVfxPzHt2w
         Fp45DnjMJpgUcBdFclYz6OpmS/r1zRhAJWegrkQMDHMHxDm11clJAfS+s64NQ2EVfoEg
         S5zowwjyv73aIVx0OWo7Iw6sBOdXNscK4YsuBk0g77DfojOfZrsyvwz9f14cJP+d1Hc9
         +wmrpPlgouYdjUPvh+sIAOaXCToRinpqDMuZzLHkjaSetPd5VpJ8FxMgA/SQ9MSFL3N2
         v9eWkkTMIdzej3oAnQva4huZwk7gDZDNbpe88ySz/8qJhug9Bxn4WQkXfAakG/56IRpQ
         Btbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679572438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEX3oAejBbS136aFLc2hCm49xsCfS2Jd421gnkE/ZzM=;
        b=XzRinHIAe4+5b6+F+QPlUSK90STR50MF77mqkzkjq9P+1PF79sT1jZubdNNqt1NrMG
         YDuwC7+GFwCqhmKmj2G51/WVrHiD92eEhULZ5TzvhS63kKdaI0LmEnbvqjQFVRFBYsim
         9TnEI/yTVerCpMkhE0TF2dCfXpwn75LVr+hQFEOw2BkjOfPOPiV1f9I0mPVGoU+tKD30
         GyNUNicmqYGUmTGkkZTjM3KnXW7FyLfBqEKYXu7dataUCEDh1lzI8iGzD1zTFyuZTatf
         PXnCMw041BRrCCBeGXFoiUbFCXI3b7tu8t3V8Qdzb6eKAvueSsNlEXaU5kaR9VrAqzkm
         mQbQ==
X-Gm-Message-State: AO0yUKVGJ53WzZ1h8LmqmnchQqw3FHudDwy34ierNjiol9IRL+wQJU5B
        qbr61l5G0CAaTUuRmTE3ydInQA==
X-Google-Smtp-Source: AK7set8J+4fEvtk4IiTjukniZrJazpfLI8lSlj7qq5kp1qfD9/gM/cBqQ6fhR0LoSNcoiZyQ6SMAqg==
X-Received: by 2002:a17:906:3612:b0:933:2f77:ca78 with SMTP id q18-20020a170906361200b009332f77ca78mr10376372ejb.28.1679572438286;
        Thu, 23 Mar 2023 04:53:58 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709064d0500b00923f05b2931sm8510047eju.118.2023.03.23.04.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 04:53:57 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v10 0/3] Add support for Maxim MAX735x/MAX736x variants
Date:   Thu, 23 Mar 2023 12:53:52 +0100
Message-Id: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

Patrick Rudolph (3):
  dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
  i2c: muxes: pca954x: Add MAX735x/MAX736x support
  i2c: muxes: pca954x: Add regulator support

 .../bindings/i2c/i2c-mux-pca954x.yaml         | 43 ++++++++-
 drivers/i2c/muxes/Kconfig                     |  6 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 95 +++++++++++++++++--
 3 files changed, 130 insertions(+), 14 deletions(-)

-- 
2.39.1

