Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D3679441F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 22:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243745AbjIFUAr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 16:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243566AbjIFUAf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 16:00:35 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0D31998
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=A3ixWxOf22d750
        WBlTRj5T+ZBuyZaVvPJI9t1l4g7TY=; b=HdNOkU1Hj07eZC0l1r5gG0NDPhgbcT
        oHy3xRdz1t00WqjF8QOIEGYZArEiV6autpeM70cQNe4CjeVZ6X2IHrZpFsAnOmQv
        QVGb1xSngGOTZa8Gj0RhXwSqsfbNZthsFh0rKAJ4sFpS36tV8ZmWUVd7IGYa+lAz
        R2lz/ChOxz22D4U7LeTkbfqNwfD3NV9nYu3xtVP22ewBaWVqNizFzn6qucar8VCP
        fIZ1AKT3rXsyY02XlMvYWAwWxaDo084+SZ5/ZkDiA69GxYa+sH0maRalz56GVRbO
        bl2vSeqMcNqoXuBiw2TfNsud27kHIJXYdlEr9Vd/nw7A15CSl6A97uyA==
Received: (qmail 2929762 invoked from network); 6 Sep 2023 22:00:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 22:00:26 +0200
X-UD-Smtp-Session: l3s3148p1@a7rIMbYEDIsgAQnoAFZhALrSGIaWNE/A
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] i2c: clock calculation cleanups for Renesas devices
Date:   Wed,  6 Sep 2023 22:00:18 +0200
Message-Id: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While implementing FastMode+ support for the R-Car IP core, I noticed
potential for other cleanups. It turned out that it makes sense to apply
them first, so here is the series. Tested on a Renesas Falcon board with
an R-Car V3U. The calculated values are identical for 100 and 400kHz.
The RIIC patch is build tested only.

Looking forward to comments!


Wolfram Sang (5):
  i2c: rcar: avoid non-standard use of goto
  i2c: rcar: properly format a debug output
  i2c: rcar: calculate divider instead of brute-forcing it
  i2c: rcar: remove open coded DIV_ROUND_CLOSEST
  i2c: riic: avoid potential division by zero

 drivers/i2c/busses/i2c-rcar.c | 41 +++++++++++++++--------------------
 drivers/i2c/busses/i2c-riic.c |  2 +-
 2 files changed, 19 insertions(+), 24 deletions(-)

-- 
2.35.1

