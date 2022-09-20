Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C74AE5BEC46
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 19:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiITRr5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 13:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiITRrv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 13:47:51 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5C016A4B0
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 10:47:48 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 20 Sep 2022 20:47:44 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28KHlfvb015181;
        Tue, 20 Sep 2022 13:47:41 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28KHlcLI009926;
        Tue, 20 Sep 2022 13:47:38 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v5 0/8] i2c: i2c-mlxbf.c: bug fixes and new feature support
Date:   Tue, 20 Sep 2022 13:47:28 -0400
Message-Id: <20220920174736.9766-1-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a series of patches fixing several bugs and implementing
new features.

Bug fixes:
1) Fix the frequency calculation
2) Fix incorrect base address passed during io write
3) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
4) Support lock mechanism to avoid race condition between entities
   using the i2c bus

Cleanup:
5) remove IRQF_ONESHOT flag as it is no longer needed.

Features:
6) Support multi slave functionality
7) Support BlueField-3 SoC
8) Update binding devicetree

What has changed from v4->v5:
Fix build error in the mellanox i2c device tree documentation

Asmaa Mnebhi (8):
  i2c: i2c-mlxbf.c: Fix frequency calculation
  i2c: i2c-mlxbf.c: remove IRQF_ONESHOT
  i2c: i2c-mlxbf.c: incorrect base address passed during io write
  i2c: i2c-mlxbf: prevent stack overflow in
    mlxbf_i2c_smbus_start_transaction()
  i2c: i2c-mlxbf.c: support lock mechanism
  i2c: i2c-mlxbf: add multi slave functionality
  i2c: i2c-mlxbf.c: support BlueField-3 SoC
  i2c: i2c-mlxbf.c: Update binding devicetree

 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  48 +-
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/i2c-mlxbf.c                | 862 ++++++++++--------
 3 files changed, 521 insertions(+), 390 deletions(-)

-- 
2.30.1

