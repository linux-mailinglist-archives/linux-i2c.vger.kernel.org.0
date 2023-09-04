Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41BBC791936
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 15:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242267AbjIDN7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 09:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241544AbjIDN7E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 09:59:04 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9EDCDE
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=pBZWMf8msHp3Fb
        oSvOVzNFaD66itGH7KGh/HZ5hHgp4=; b=WVvJtGW+KHTdlYJ8uWC7s2sSUMrHjR
        txdoKCkbYHunHtKzTIIuYcbUQfgbVvLbjEo9cLruxLTZGBOLIpXhhb05dO5vVlY7
        cQvR8Yv0WCwcbldj5w7XFAjbol90BIU6dAEINTrc05V5mTKnZbi518rrmYBNbEsn
        kjxuobS7+uQ0/FGCsCEPdXLi8Owr/GYR/A8b5qVVST241ojFRUh7xFShnpFjOnRn
        ckdTvKVa5CjuE/83UJiKgHs65AGHwk/XU66h4BpuLCsIhsabPepU05Cf6UsQQu7k
        HVCy72PAvB24fum0A6sW5xlfNSHP1lA24tCkiMs8cDY3NW0mSjKKpvUg==
Received: (qmail 2131727 invoked from network); 4 Sep 2023 15:58:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2023 15:58:56 +0200
X-UD-Smtp-Session: l3s3148p1@R+w26YgEJJAgAwDPXx78AHsOvgc204Bb
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] i2c: rcar: add FastMode+ support
Date:   Mon,  4 Sep 2023 15:58:48 +0200
Message-Id: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The newest generation of Renesas R-Car SoCs support FastMode+. This
series enables the driver to use it. After a cleanup (patch 1) and
adding the Gen4 devtype (patch 2), actual FM+ support gets added in
patch 3. Tested on a Falcon board with a R-Car V3U. Getting >16KB of
data from the PMIC was pretty much 2.5x faster than without FM+ which
pretty much matches the theoretical values. Actual scoping still needs
to be done as it needs some logistics because of the board being remote.
But here the patches already for review.

Note: I intend to remove the brute-force algorithm from the regular
clock calculation as well. This will be a separate series, though,
because more cleanups are possible.

Thanks and happy hacking!


Wolfram Sang (3):
  i2c: rcar: avoid non-standard use of goto
  i2c: rcar: introduce Gen4 devices
  i2c: rcar: add FastMode+ support

 drivers/i2c/busses/i2c-rcar.c | 142 +++++++++++++++++++++++-----------
 1 file changed, 95 insertions(+), 47 deletions(-)

-- 
2.35.1

