Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A877AD576
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 12:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbjIYKKd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 06:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjIYKKY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 06:10:24 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84408FC
        for <linux-i2c@vger.kernel.org>; Mon, 25 Sep 2023 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=+9pkw8z4u/QJdR
        zku5nhHPPbnVtQLF3N/ma0iRn2Myo=; b=ezjf/0Gi94v7N9smAbbTSuJ3ogDKlx
        HCBag3KmeyFLIk507FF3J5bVfHNdUFb1Yhc8UnD+44xbxI4INxXkE73TG0FbDFMX
        l8my5gTgR/72tvL8HgDcgIKqsoHDWJa/Bb6qUGTANjOXIdgqkyGnoaSotaEJWNht
        ghcBx1IZP3gNWXXX7BGCjTaGAf97eS8xv/4KS9v6aWefUZTEXAM3Aegj31qo+RAg
        9cJoAInEFvfOI5XNsjBp9RIhi0PGBD7wDABpV7Z3Ak5P7xmoq+z0Ve38iYitoMt+
        Nv7sTsHv/+IITbhfmSqBDF/kXyiq40+9dTt4Cba4MoTDTIe1qumgz20w==
Received: (qmail 2356797 invoked from network); 25 Sep 2023 12:10:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2023 12:10:08 +0200
X-UD-Smtp-Session: l3s3148p1@H/2nKSwG8jIucs9T
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org
Subject: [PATCH 0/3] i2c: create debugfs entry per adapter
Date:   Mon, 25 Sep 2023 12:09:52 +0200
Message-Id: <20230925100956.117939-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Two drivers already implement custom debugfs handling for their
i2c_adapter and more will come. So, let the core create a debugfs
directory per adapter and pass that to drivers for their debugfs files.
Convert the two existing users as well. Tested on a Renesas Lager board
with the i2c-gpio driver. npcm7xx still needs testing.

Looking forward to comments.


Wolfram Sang (3):
  i2c: create debugfs entry per adapter
  i2c: gpio: move to per-adapter debugfs directory
  i2c: npcm7xx: move to per-adapter debugfs directory

 drivers/i2c/busses/i2c-gpio.c    | 39 ++++---------------------
 drivers/i2c/busses/i2c-npcm7xx.c | 49 +++++---------------------------
 drivers/i2c/i2c-core-base.c      | 11 +++++++
 include/linux/i2c.h              |  2 ++
 4 files changed, 26 insertions(+), 75 deletions(-)

-- 
2.35.1

