Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E540290DAD
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Oct 2020 00:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391975AbgJPWZb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 18:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390264AbgJPWZ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 18:25:29 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FB5C061755
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 15:25:28 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a1so2266114pjd.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4eqbUws5OBh+zSDmGIZGynXeE/GCKmhJYh2f9F/2s8=;
        b=mr2aRkQ7R0v0EkIi2XrrSQ0gbLANCLdkIL0QK3vPOvbnnI/MOHnvr1tdUqfWi51/Ap
         2FvYtH6EZyB0SnEV78PJp7ij10yoYf6ovtlU+ijVeeVmTxaDtza0F3WqMQ34DsSbxezx
         2U8PEpiH9RvQJu+V/Wgi4GquMla0kntl4RLZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P4eqbUws5OBh+zSDmGIZGynXeE/GCKmhJYh2f9F/2s8=;
        b=OC+UE3mFd3yq2om6L9/k1FTi9a1An8pq3DpSvZq6zExkPidKGi0mrMsoCdZA9cygB3
         BCJv6VGOFDbSimM/qitB5qvstNzACnHYg4m5aDZP3PruVG/rvrdFXPoI3PTMCZ3ffSDs
         RWRGPOunVjh43zPPi5srrLTL7gSgpyEhJ4xhBFas+dw3nhc/Vswogt+HcpGV/CW9J83w
         KDdySub0Fmjkd9iHxmRtjgfEdCo1l0RAFIwMVUTn570mZOnAdepn3aEXWtopTFm+UNaK
         lmcDTGOXPmmyCk83rDZ68QsjV8Dzy+tedoJe+HH43RfQ6lfG6nFX4tBVB1JGtvoAfjhP
         b2iQ==
X-Gm-Message-State: AOAM531i2CW1EgVEaXMLGpoggp3E5IQIt5xYU+R2LitLOLtSu9Qev/SH
        CUMayP2ztveJ9EFd8THtcg8ElA==
X-Google-Smtp-Source: ABdhPJxAKtghLb3UyyudbSNcwHrz2ZMGGBl+4IjwkyNwhpexwbID8QZbyf3tMdH6HyUVJMdZKodKRg==
X-Received: by 2002:a17:902:930c:b029:d3:b362:7939 with SMTP id bc12-20020a170902930cb02900d3b3627939mr6414396plb.54.1602887127549;
        Fri, 16 Oct 2020 15:25:27 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:a2ce:c8ff:fec4:54a3])
        by smtp.gmail.com with ESMTPSA id t10sm4099304pjr.37.2020.10.16.15.25.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Oct 2020 15:25:27 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Evan Green <evgreen@chromium.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
Date:   Fri, 16 Oct 2020 15:25:21 -0700
Message-Id: <20201016222523.364218-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-mux-gpio driver is a handy driver to have in your bag of tricks,
but it currently only works with DT-based firmware. Enable this driver
on ACPI platforms as well.

The first patch is a little dinky. Peter, if it turns out you'd rather
just take this all as a single patch, feel free to squash the first
patch into the second. Or I can resend a squashed patch if needed.

Changes in v3:
 - Introduced minor &pdev->dev to dev refactor (Peter)
 - Update commit message again (Peter)
 - Added missing \n (Peter)
 - adr64 overflow check (Peter)
 - Don't initialize child (Peter)
 - Limit scope of dev_handle (Peter)

Changes in v2:
 - Make it compile properly when !CONFIG_ACPI (Randy)
 - Update commit message regarding i2c-parent (Peter)

Evan Green (2):
  i2c: i2c-mux-gpio: Factor out pdev->dev in _probe_dt()
  i2c: i2c-mux-gpio: Enable this driver in ACPI land

 drivers/i2c/muxes/i2c-mux-gpio.c | 112 ++++++++++++++++++++++---------
 1 file changed, 82 insertions(+), 30 deletions(-)

-- 
2.26.2

