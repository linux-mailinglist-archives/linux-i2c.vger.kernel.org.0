Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581BA488570
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 19:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbiAHS6e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 13:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiAHS6e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 13:58:34 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B7FC06173F
        for <linux-i2c@vger.kernel.org>; Sat,  8 Jan 2022 10:58:34 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id q8so17986816wra.12
        for <linux-i2c@vger.kernel.org>; Sat, 08 Jan 2022 10:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EEyUTxFJIz6kwG3kSZIrQjY/C5LVppVG+iMmlquslj8=;
        b=E+yTJXXtUQcdFe9Z3H/jh0u9LJZFAbE7eeTqrqwH3oqz3G/sR5tCW62S98Q7D6jRMV
         OZJirLXxbHMb8wsY51jj0ggRnYjPy2VspNlR85CpQoR9NWsQjFUy8w1akBhDATSnJbed
         bAKXQT7moY5AScR8Ee+P2knxdwTHmoNKXYfVg65xJExpFGI2/QoghUhUig87/uOK0Lo0
         pkMv9bz6iTo3xbTkihdTMELumJ3w6KIxgC5I9/7NZIrFkDLaPuPS9FWneOoX8x1pF01v
         04jyBzMH2aoInZJLouzdrpKO3uR5dw3Muyp1Zfc/aX3DaDp00cjSS+tKe7Qcq6Y/TwYK
         wRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EEyUTxFJIz6kwG3kSZIrQjY/C5LVppVG+iMmlquslj8=;
        b=fz/nqLapn1HEua5lQv8mPrf588PcldUTG9o7j0kGbvRW3S7+RDoddJCAP95MxXIx4x
         URv1XVIQh987wK2Scr7O6cCn06b8SluWqyTbDaXzW23c+dwwMwTGtwSSdgwHOXPVJU9R
         EU3rT6TY4aLehTV9bmaW+LFAqFWndq1lNlceM+IUKssy7n9jfyQ3wrgjBvVzMaSmHGGz
         weRpKZC4l/YwId439cAkjKtY0+l+fKGYpW4HbTbOGSW6U3XRnNoTLRXC/yHl3Cvht7Ba
         XMlq9p5voNRyztA5Qo+5v0G15CDxzzRjPZqE9uXmiHiPv4KvDwLfCPWvDscuaPyBxTkr
         4y5w==
X-Gm-Message-State: AOAM533kPVv3KIpmtSoTNgyMyygaaBfyWxFvtEnSn81CuetffWHW3GRz
        ngqh3bWuoETfB3RuCqB0DjI6ew==
X-Google-Smtp-Source: ABdhPJyIy71saxDADU4/SYJS7nSb3jiPXr13T4krVXzJ2fLHr3iaJzgUMloaWMlFrUgDB+8sB0so8w==
X-Received: by 2002:a5d:47c2:: with SMTP id o2mr59475440wrc.637.1641668312719;
        Sat, 08 Jan 2022 10:58:32 -0800 (PST)
Received: from fedora.sec.9e.network (ip-88-153-139-166.hsi04.unitymediagroup.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id bg12sm2886209wmb.5.2022.01.08.10.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 10:58:32 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] Add support for Maxim MAX735x/MAX736x variants
Date:   Sat,  8 Jan 2022 19:57:54 +0100
Message-Id: <20220108185759.2086347-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v2:
- Move dt-bindings to separate file
- Added support for MAX736x as they are very similar
- Fixed an issue found by kernel test robot
- Dropped max735x property and custom IRQ check
- Added MAX7357 config register defines instead of magic values
- Renamed vcc-supply to vdd-supply

Patrick Rudolph (4):
  dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
  i2c: muxes: pca954x: Add MAX735x/MAX736x support
  dt-bindings: i2c: Add regulator to pca954x and max735x
  i2c: muxes: pca954x: Add regulator support

 .../bindings/i2c/i2c-mux-max735x.yaml         | 106 +++++++++++++++
 .../bindings/i2c/i2c-mux-pca954x.yaml         |   5 +
 drivers/i2c/muxes/Kconfig                     |   4 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 124 ++++++++++++++++--
 4 files changed, 228 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-max735x.yaml

-- 
2.33.1

