Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4617494DAE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 13:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbiATMOT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 07:14:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbiATMOK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 07:14:10 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CCFC061401
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 04:14:10 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id v123so11688361wme.2
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 04:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mpM/rGmBFzv7cwTGJJLNgA1OU0/AoeYggu1XWiqY0Xk=;
        b=J6wSwcUYCIUKMjJC9dceWaT0FrzS3MYCWGO6u5QaaZ5OpSjB4Mj33mdFevF8YX4/fO
         eOr6IEaO/NtMSHWMpaExKmutuRmcSSPsiqE03W+oDze9G5JxBxiZczF6CF8tcoPW2BQ4
         +ojTS/azripxXXAAqq2KZnDEkbByTPlGiflLm7PDYCJuR49RRWx5Zhip3vD+pA8Gd28j
         H/qiikB38Cveu3J5TvYX1e0jvWyGjuBRj7Im/2m+BI7ALjAocpQlBF1SZ7mDWBFV2HXG
         oo6ChMBO6u2srGl59/w1de2TSxUCvHYTOCfqsnwas/HQivNhduw2JI3IhxC9+iI/2l+d
         0lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mpM/rGmBFzv7cwTGJJLNgA1OU0/AoeYggu1XWiqY0Xk=;
        b=RKsWHhyAf/7BbpwXyAh6N/Vjy2O+oWA4h7cXdq6MnumJAvfhUfsO8hfnjJXhdSrzaH
         A3vqLJAUvREFI4JZqZsjN7rCP2rdLakwFUPEHGlqnjWT90HpGSL+VL9wBohdLbXDtzLj
         se7HTSbj6tSoo+i0o1TccEM2jyhjbNwVc9RiOEUki9sj6vJXRgqRJHmeeSJlnBFaQjvQ
         /xS3RiR8u6o+BMin8FHjKmBP66hU51hEO/QwIuirqIhCBmJdV6n6u2QQSNgONaJSR0SH
         tKN+0xR/+MF5gQXtc1frSesL+N6OFyLxsuLY5MDLntu+KuiG8p48DXpCTxsdQlWASHdC
         mAuA==
X-Gm-Message-State: AOAM5329kKG32Drp/NV8bgTAUOmu/QGtiXErHwJk3gk0XMpdGl4Oq8W6
        kHC1HMm6DFpyrHmHb5vVyQ+rPzvFMiAE1Q==
X-Google-Smtp-Source: ABdhPJzoOXVTD93A3oHdCn7GNYdZ/w/iULAXwJNFyE/+MrVoE2APhlsp2kN8aP/zRyzW+K66ZtMFgw==
X-Received: by 2002:a5d:584e:: with SMTP id i14mr19318297wrf.690.1642680849034;
        Thu, 20 Jan 2022 04:14:09 -0800 (PST)
Received: from fedora.sec.9e.network (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id x4sm2853863wrp.13.2022.01.20.04.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 04:14:08 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        devicetree@vger.kernel.org
Subject: [v3 0/3] Add support for Maxim MAX735x/MAX736x variants
Date:   Thu, 20 Jan 2022 13:13:10 +0100
Message-Id: <20220120121314.463944-1-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

 .../bindings/i2c/i2c-mux-pca954x.yaml         |  43 ++++--
 drivers/i2c/muxes/Kconfig                     |   4 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           | 124 ++++++++++++++++--
 3 files changed, 150 insertions(+), 21 deletions(-)

-- 
2.34.1

