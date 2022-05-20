Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD5552E9EE
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 12:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348134AbiETKde (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 06:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348133AbiETKdd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 06:33:33 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5728CB20
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 03:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=3xEy1SebfqFd2pZ8CpY00l8vQjw
        1377ptfrPsN5dzwM=; b=cFcf22mBHRwRqJoJL+f8DZ19R4zpXW/+n82DxnFvQ12
        bAenlJ4FnSmPUFYZ6NPGwzYe3nfYAji0KJl7xDLuvP3jxuH7m/gEBlkVu8m75GLA
        UIzl1Kig8M5iXvqHRjDDQo0PY7UdIY52vXg32KZzMfGQx6eRg0b1uJNjh6oGnXLg
        =
Received: (qmail 3736468 invoked from network); 20 May 2022 12:33:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 12:33:30 +0200
X-UD-Smtp-Session: l3s3148p1@GimCBW/f1U5ZD+8D
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: rcar: increase robustness against long SMIs
Date:   Fri, 20 May 2022 12:33:23 +0200
Message-Id: <20220520103325.81110-1-wsa+renesas@sang-engineering.com>
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

A customer reported problems with the R-Car I2C driver with System
Management Interrupts lasting longer than 30us. Let's not comment about
SMIs taking this long (and even up to 200us), but improve the driver to
handle such situations.

Wolfram Sang (2):
  i2c: rcar: avoid race condition with SMIs
  i2c: rcar: refactor handling of first message

 drivers/i2c/busses/i2c-rcar.c | 76 ++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 37 deletions(-)

-- 
2.35.1

