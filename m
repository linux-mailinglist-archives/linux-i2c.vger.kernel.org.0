Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A904AB7A3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 10:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239088AbiBGJh4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 04:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351318AbiBGJ3B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 04:29:01 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0411CC0401C1
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 01:28:59 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id cn6so5954753edb.5
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLK2lp6TV74+ddpLQXtHe3jOczUqIhg5KCOPYjiimz0=;
        b=W0nozGTs3WBmNHCv6hIDWxLGpDVfJILMUf2O7Q/U9PCKWMULtz2UcOLfcz//u2iceU
         IoObxtwzO/To7yeAbTWa6r8Oi4yd7dHk8MwrAekAhX17xjmKepV9K4vOWiwoTm1TmVD0
         eEGXAxCDM9LwgwWfUk+Fbuo7247yBhiHhW1/NgAwsRoprLDT6329unNOAaU8eYA4J1SA
         ZvRkaqThsWYRMYFI2GRgQWRUHSeNQhUpdcoeXnRjmwmB6RefMjXwCJ0v5eux2BLm4Izq
         e1b5OzXD76KGfSAdNASTO0nj+ilzpOsA6hGPS7Do+nWGs+FzATKtEetdHV6CN8KnjXrV
         OIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLK2lp6TV74+ddpLQXtHe3jOczUqIhg5KCOPYjiimz0=;
        b=tSLOxuX7fvz1Vlrz7FPjAmSoeUhSmdlHdiprAWhuCusM2EaCkn7j+OuYZ+IwNq/4dJ
         h/9WVXHFi9IrTnCCMRYs/IEotFssz4iWUKoltFWxGM/6J+I7krS5prifszxoGJ7XV75e
         CBZ81Jaiuw1l14+zkSbTp2A7eov9JvEkxLm3eXiF8lQI3pNKwBpcIl4HNJz9Z/RMAtjO
         h5AyQCzmn+7mpjOcp3KqKak3IpPckT6nn4Lr1HGoC66w8WPEaDVYNejrdxAtJZkbYpmu
         JxocMey1Jd/2vFbdtUEjgEMId5QnDc7lO3zthGN5ALFs5wDrdXXl1DP/JBWmLhvDCS2G
         3jXA==
X-Gm-Message-State: AOAM532lFQQl2Ug8MMcawb2H2Zb4aLpIPj/8nW5dW4cNSnum7xzMwbi2
        zMNbD12w+AZp0rha7MvJjWFd1Q==
X-Google-Smtp-Source: ABdhPJzq7Tl8lnhKa+CHP0KNKxJ+ynu8aSyKQT7YIPwHg7TUfcTAIjzGO4fZEHCM2sksJn/flRHBUQ==
X-Received: by 2002:a05:6402:38e:: with SMTP id o14mr9121850edv.414.1644226137585;
        Mon, 07 Feb 2022 01:28:57 -0800 (PST)
Received: from fedora.. (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id g9sm3487059ejm.152.2022.02.07.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 01:28:57 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org
Subject: [v4 0/3] Add support for Maxim MAX735x/MAX736x variants
Date:   Mon,  7 Feb 2022 10:28:23 +0100
Message-Id: <20220207092827.104978-1-patrick.rudolph@9elements.com>
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

 .../bindings/i2c/i2c-mux-pca954x.yaml         |  44 +++++--
 drivers/i2c/muxes/Kconfig                     |   4 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 124 ++++++++++++++++--
 3 files changed, 151 insertions(+), 21 deletions(-)

-- 
2.34.1

