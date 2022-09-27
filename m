Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B345ECEC4
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 22:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbiI0Ujl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 16:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbiI0Ujk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 16:39:40 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A790DF89
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 13:39:34 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 27 Sep 2022 23:39:29 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28RKdQcx026476;
        Tue, 27 Sep 2022 16:39:26 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28RKdQ0v022709;
        Tue, 27 Sep 2022 16:39:26 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v7 0/2] i2c: i2c-mlxbf.c: bug fixes and new feature support
Date:   Tue, 27 Sep 2022 16:39:22 -0400
Message-Id: <20220927203924.22644-1-asmaa@nvidia.com>
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

Support BlueField-3 SoC in the first patch of this series and remove
the device tree support in the second patch.

What has changed from v6->v7:
- the following patches were applied to for-next so they are removed
  from this series:
  1) Support lock mechanism to avoid race condition between entities
     using the i2c bus
  2) remove IRQF_ONESHOT flag as it is no longer needed.
  3) Support multi slave functionality
- Fixed the $subject tag to "i2c: mlxbf"
- added missing check for 'ret' after allocating resources
- removed the DT binding file from the MAINTAINERS file

Asmaa Mnebhi (2):
  i2c: mlxbf: support BlueField-3 SoC
  i2c: mlxbf: remove device tree support

 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  77 ---
 MAINTAINERS                                   |   2 +-
 drivers/i2c/busses/i2c-mlxbf.c                | 494 ++++++++++--------
 3 files changed, 281 insertions(+), 292 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml

-- 
2.30.1

