Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8208E79E007
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 08:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238348AbjIMGaE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 02:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238350AbjIMGaD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 02:30:03 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C07D1738
        for <linux-i2c@vger.kernel.org>; Tue, 12 Sep 2023 23:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=R5iuZHGK2VI6Bl
        gS1hVmtZhC/iWdIlHhQrhHVBtjGdw=; b=TvQ89vwe3x9we0TnFG0jF0lB1cV6Zs
        9icfNokG6hqT3YCnqB8FLAAyT2/ZopfJwGAkjQmZ43WPRku0PeoC2b2hLQYTb0AO
        Y40yKzwjXgOTLN1UKhuibTVjj2cxRUh216Ho0d7nbdVIUP5PWO+ZxpzeSkJDQwyj
        N2hLrfzohFi1CZNKfQ+oHA3cz5SWdyUwRHlRC2TUrd0s53cd8H2Ds8OHlq6F/IwK
        fxVLAENv0V1A55mLZNATp5u01/9f44l5wEXThNRVkJx48F74nIrZuD6H4ybCVsqm
        rgbSFaOMfE+A4mceCsDa6qqiNlsKHVkeMwCTpofWPkgaCwRNPRgcxmmw==
Received: (qmail 489516 invoked from network); 13 Sep 2023 08:29:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2023 08:29:55 +0200
X-UD-Smtp-Session: l3s3148p1@KPHNrzcFfKMujnuS
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFT 0/2] i2c: rcar: improve Gen3 support
Date:   Wed, 13 Sep 2023 08:29:47 +0200
Message-Id: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here is the second series paving the way for Gen4 support. This time we
properly apply the Gen3 specific features. See the patch comments for
further information. This has been tested on a Renesas Falcon board with
a R-Car V3U SoC at various bus speeds. Because the calculation formulas
are crucial, testing on board farms would be much appreciated!

Thanks and happy hacking!


Wolfram Sang (2):
  i2c: rcar: reset controller is mandatory for Gen3+
  i2c: rcar: improve accuracy for R-Car Gen3+

 drivers/i2c/busses/i2c-rcar.c | 148 ++++++++++++++++++++++------------
 1 file changed, 98 insertions(+), 50 deletions(-)

-- 
2.35.1

