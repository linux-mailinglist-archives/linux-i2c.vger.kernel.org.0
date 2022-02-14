Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636A14B4D4F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 12:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242848AbiBNLE1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 06:04:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349575AbiBNLEO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 06:04:14 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E22996AA
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 02:32:21 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id hw13so7924673ejc.9
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 02:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARTYI3J/edrj22act2COP13PJ8Imzy+OvDS2PlroIoA=;
        b=C0UPRTj3288a159HihVuEXbmNlJUHObXSqRGBwN1nDkex85H/O460IN7iDNbhOGOyp
         Os6r7QJPjy2hQMIRT0ghQrRaAmv2AZuagw51TyQqpNhr/EqhoGekemL1DOrTNdXGqYGW
         ZObHqlpxnzDJfkM9h2fJFygTisAHlbJ3dNGr0YDinRp2/PryIm+YGOCS7oxdhHUuIzi8
         yEMhapV0o7rXFvpE+nrImqbQBihpyG2f3cQDPh1XEvsxFAuwfaDK8W5uTsdRzhHVa996
         SBQDApy5yT44EpSrYUEP5px12uL+VDqdBRdGL6KZOQOG9B3y8MIIzWp1saObks3bUT1s
         oFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARTYI3J/edrj22act2COP13PJ8Imzy+OvDS2PlroIoA=;
        b=JR9pglr6h1wI4ykZoF7BDAj6aOo92CZOKTCW1Wz5J336EN/8kEVnYpnRMM5TW4MYz9
         2adEBEw3HCvw77p2/5/9ogWsigzGBSAUXcwU3NzYEJopT7/4YHfxYPvR6ujkatGon9Dt
         vLRnEBVWYWm6pjb+I/5Qs7m/ktzJTBp7XsreDRBiETmYbJXmS03ed9aE2QvKp8DVFMw0
         zAzECblBG4+OHgqbn23t0vAfVUAFUx8epMT6tltcmHtIopYTKsvhpJf5PXYbkzvVRUX3
         EG2Ui8toSU8zF4dQRejTFHowj+t+Jq2TqRFQGsdXsews7j9f5UzLeDPIJJOaG1Ve+A2H
         3DWg==
X-Gm-Message-State: AOAM530SwbDDEbEGy11DBQgoxVfIHTriaMpFGXCuL/aXYCkIRlktOxee
        8CMT8QPW4e20fKTyBztOJmZmbQ==
X-Google-Smtp-Source: ABdhPJyw5jNWz2prItYc/I2oNBzK/379o3tv/aI1b5n7sj1S6WLwvTUn4d0i3TbeYOBqwnT8+BWjMA==
X-Received: by 2002:a17:907:1b1c:: with SMTP id mp28mr10971501ejc.624.1644834740498;
        Mon, 14 Feb 2022 02:32:20 -0800 (PST)
Received: from fedora.lab.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id b19sm1857940ede.37.2022.02.14.02.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 02:32:20 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v5 0/3] Add support for Maxim MAX735x/MAX736x variants
Date:   Mon, 14 Feb 2022 11:31:13 +0100
Message-Id: <20220214103116.68472-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

 .../bindings/i2c/i2c-mux-pca954x.yaml         |  44 ++++--
 drivers/i2c/muxes/Kconfig                     |   4 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 126 ++++++++++++++++--
 3 files changed, 153 insertions(+), 21 deletions(-)

-- 
2.34.1

