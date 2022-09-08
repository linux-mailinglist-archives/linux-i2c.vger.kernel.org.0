Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1CEA5B24B3
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 19:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiIHRgB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 13:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbiIHRgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 13:36:00 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 82F1FBF350
        for <linux-i2c@vger.kernel.org>; Thu,  8 Sep 2022 10:35:56 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 8 Sep 2022 20:35:54 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 288HZlaY026057;
        Thu, 8 Sep 2022 13:35:48 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 288HZkWs032687;
        Thu, 8 Sep 2022 13:35:46 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v3 0/9] i2c-mlxbf.c: bug fixes and new feature support
Date:   Thu,  8 Sep 2022 13:35:35 -0400
Message-Id: <20220908173544.32615-1-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
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
6) Update SPDX license
7) Support multi slave functionality
8) Support BlueField-3 SoC
9) Update binding devicetree

What has changed from v1->v2:
- moved all the bug fixes to the top commits and left the features for last
- split the BlueField-3 SoC patch into 2: one for the driver code and another
  patch for the device tree binding yaml documentation file
- keep the device tree/acpi tables backward compatible. So add the new resources at the
  end of the enum.
- update the license in a separate patch

In v3, updated the cover letter to reflect changes made from v1->v2 and add Rev-by

Asmaa Mnebhi (9):
  i2c-mlxbf.c: Fix frequency calculation
  i2c-mlxbf.c: remove IRQF_ONESHOT
  i2c-mlxbf.c: incorrect base address passed during io write
  i2c-mlxbf: prevent stack overflow in
    mlxbf_i2c_smbus_start_transaction()
  i2c-mlxbf.c: support lock mechanism
  i2c-mlxbf.c: Update SPDX license
  i2c-mlxbf: add multi slave functionality
  i2c-mlxbf.c: support BlueField-3 SoC
  i2c-mlxbf.c: Update binding devicetree

 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  49 +-
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/i2c-mlxbf.c                | 872 ++++++++++--------
 3 files changed, 525 insertions(+), 397 deletions(-)

-- 
2.30.1

