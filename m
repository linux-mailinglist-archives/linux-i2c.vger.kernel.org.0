Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A780C5EB177
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 21:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiIZTpt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 15:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiIZTpl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 15:45:41 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2EF015705
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 12:45:25 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 26 Sep 2022 22:45:19 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 28QJjEAK029219;
        Mon, 26 Sep 2022 15:45:14 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 28QJjEX8024841;
        Mon, 26 Sep 2022 15:45:14 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v6 0/5] i2c: i2c-mlxbf.c: bug fixes and new feature support
Date:   Mon, 26 Sep 2022 15:45:02 -0400
Message-Id: <20220926194507.24786-1-asmaa@nvidia.com>
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
1) Support lock mechanism to avoid race condition between entities
   using the i2c bus

Cleanup:
2) remove IRQF_ONESHOT flag as it is no longer needed.
3) Remove device tree support

Features:
3) Support multi slave functionality
4) Support BlueField-3 SoC

What has changed from v5->v6:
- the following patches were part of previous patches but they 
  have been pushed to the latest branch since:
  1) Fix the frequency calculation
  2) Fix incorrect base address passed during io write
  3) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
  So I rebased to master and removed them from this series.
- BlueField customers need to use NVIDIA custom firmware which uses
  ACPI, so there is no need to support device trees. Remove device
  tree support from the driver as well as from the binding doc.
  

Asmaa Mnebhi (5):
  i2c: i2c-mlxbf.c: remove IRQF_ONESHOT
  i2c: i2c-mlxbf.c: support lock mechanism
  i2c: i2c-mlxbf: add multi slave functionality
  i2c: i2c-mlxbf.c: support BlueField-3 SoC
  i2c: i2c-mlxbf.c: remove device tree support

 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  77 --
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/i2c-mlxbf.c                | 841 ++++++++++--------
 3 files changed, 458 insertions(+), 461 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml

-- 
2.30.1

