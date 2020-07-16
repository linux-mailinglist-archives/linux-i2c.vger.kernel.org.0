Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E61221DDD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 10:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgGPIIu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 04:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgGPIIt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 04:08:49 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE437C061755
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 01:08:48 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id t11so3297174pfq.11
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 01:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q1NMSOrdmEBAoODvtBeWiT8XzpHbNfB6Y0FWPWAR6Ao=;
        b=DepxCFxm7ID3zD8asyMdeo2OHoYRep9fEEaBt1u31Rm+EkGIlRUZHG4m6dn/vzgXW4
         xiIdufe9s4RSt9eu4RvFRP6695QDvAHkwzRU2s2kQxHGdNF+TSccMFln30QwHjpjZCqn
         Qe8+9x2GOXHdLcV4zcQ4EcgLapnlyT9M6/CWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q1NMSOrdmEBAoODvtBeWiT8XzpHbNfB6Y0FWPWAR6Ao=;
        b=OILj/bnCK44mea4WdJI0xdaTbn+N1/Pw7RH9O5s/kOIWDH7mlsliUzjoxqVF1Q3igp
         KmXiFJ4XofUEJIS22kfyAdgmee4gHagmkAjY0dmQvdP3FpY3M2AL2YxeRA626B9ZkgrW
         /ItWKPV9LBiq/mN2SOwxN+drFo6wqtKDrLSBCGm/XyxPxZNJXH0X38wFLyYRAthfnRZ5
         qyj3DySiE9fbE4ZEfbMitHjZBcVqTGtNf6JH+eH96ksWP55ykIr5cjlafNsTVvEXI5lO
         AjLowsAuOyBzsKIy8t14Ic2kMELRVbqtTYs+GXawtEfJJwuJkukriZw8VtA4KGt27qpW
         O5pg==
X-Gm-Message-State: AOAM533t9aI8ZgPIOBsx8yX9wazKtN2O5iW0qiDuu4td/TbjfwMgWl3H
        mo9UnMhmaB15rWfMHaS3ZPsltDXhUYg=
X-Google-Smtp-Source: ABdhPJz5dxnbGGR/Zl7SKoHACsCiYpWWIE1uv3TQqThSvMRdNM7XbkWBeI+Zu8/IQX1kEz+mVF+SqQ==
X-Received: by 2002:a63:725c:: with SMTP id c28mr3198841pgn.156.1594886927693;
        Thu, 16 Jul 2020 01:08:47 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id a3sm4353085pgd.73.2020.07.16.01.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 01:08:46 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH V1 0/2] add PEC support on slave side
Date:   Thu, 16 Jul 2020 13:38:34 +0530
Message-Id: <20200716080836.2279-1-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch set adds support for PEC on Slave side.

Rayagonda Kokatanur (2):
  i2c: add PEC error event
  i2c: iproc: add slave pec support

 drivers/i2c/busses/i2c-bcm-iproc.c | 50 +++++++++++++++++++++++++++---
 include/linux/i2c.h                |  1 +
 2 files changed, 47 insertions(+), 4 deletions(-)

-- 
2.17.1

