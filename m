Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97D5152F463
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 22:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352016AbiETU3b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 16:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241803AbiETU3a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 16:29:30 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D14218540A
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 13:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=JYxKFVNce5SU4DWhxq8jLH1bHsK
        Ma7yppyAMbqBrRys=; b=NfTggg1Fa3J5qTDfdalrLeVrO4nQNjn9fep2lNY2uRi
        zlMFe/48J/Ror2p/RlIkTj5prVkXJxuvy68brAFZdReZbASGc/wRl+zxE9pst3DH
        CFadielEh9iQw4t7+d4N5L4wP8AvND1Iy4T/wh5ryrhuEFgpX2n9gxm8l2vtZaww
        =
Received: (qmail 3917243 invoked from network); 20 May 2022 22:29:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 22:29:23 +0200
X-UD-Smtp-Session: l3s3148p1@VxiOWHffgusgAwDtxwyXAGMY7IbT6g6m
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] i2c: rcar: refactor flags
Date:   Fri, 20 May 2022 22:29:15 +0200
Message-Id: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

First patch is a cleanup to aid further improvements. Patch 2 moves a
persistent-flag to non-persistent. Patch 3 turns a bool variable to
another flag. Thanks go to Morimoto-san for patch 3.

Tested on a Renesas Lager board with R-Car Gen2. To get all the
dependencies, pull this branch:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/refactor-flags

Looking forward to comments!

Happy hacking,

   Wolfram

Kuninori Morimoto (1):
  i2c: rcar: use flags instead of atomic_xfer

Wolfram Sang (2):
  i2c: rcar: use BIT macro consistently
  i2c: rcar: REP_AFTER_RD is not a persistent flag

 drivers/i2c/busses/i2c-rcar.c | 103 +++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 52 deletions(-)

-- 
2.35.1

