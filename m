Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEF55BD66A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 23:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbiISVer (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 17:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiISVeo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 17:34:44 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29C565F9B
        for <linux-i2c@vger.kernel.org>; Mon, 19 Sep 2022 14:34:37 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 20 Sep 2022 00:34:35 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28JLYYLT023058;
        Mon, 19 Sep 2022 17:34:34 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28JLYXaH008124;
        Mon, 19 Sep 2022 17:34:33 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v4 0/8] i2c: i2c-mlxbf.c: bug fixes and new feature support
Date:   Mon, 19 Sep 2022 17:34:23 -0400
Message-Id: <20220919213431.8045-1-asmaa@nvidia.com>
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

What has changed from v3->v4:
- moved the patch related to updating the SPDX licence out of this series.
  This will be submitted as a separate patch later and will need approval
  from all contributors.
- fixed build error in the frequency calculation patch. The name
  of the frequency functions changed but that was not reflected
  when they were called.
- Fixed the prefix in $subject as "i2c: <driver>:"
- Use kernel multiline comment style in the "support lock mechanism" patch
- instead of calling mlxbf_i2c_smbus_master_unlock multiple times, use the
  "goto out_unlock" style.
- Added the devicetree reviewers

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

 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  49 +-
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/i2c-mlxbf.c                | 862 ++++++++++--------
 3 files changed, 522 insertions(+), 390 deletions(-)

-- 
2.30.1

