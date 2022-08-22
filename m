Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184CC59C953
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 21:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbiHVT5d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 15:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiHVT5c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 15:57:32 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B6D540571
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 12:57:30 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 22 Aug 2022 22:57:28 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 27MJvRZI027422;
        Mon, 22 Aug 2022 15:57:27 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 27MJvRrb012728;
        Mon, 22 Aug 2022 15:57:27 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Date:   Mon, 22 Aug 2022 15:57:16 -0400
Message-Id: <20220822195725.12656-1-asmaa@nvidia.com>
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
2) remove unnecessary IRQF_ONESHOT flag
3) Fix incorrect base address passed during io write
4) prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
5) Support lock mechanism

New features:
6) Update SPDX license
7) Support multi slave functionality
8) Support BlueField-3 SoC
9) Update binding devicetree

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

