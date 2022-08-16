Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A375965D5
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Aug 2022 01:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbiHPXBR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 19:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237616AbiHPXBK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 19:01:10 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2597977EA2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 16:01:05 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 17 Aug 2022 01:54:25 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 27GMsJED022530;
        Tue, 16 Aug 2022 18:54:19 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 27GMsFuk009215;
        Tue, 16 Aug 2022 18:54:15 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v1 0/7] i2c-mlxbf.c: bug fixes and new feature support
Date:   Tue, 16 Aug 2022 18:54:05 -0400
Message-Id: <20220816225412.9095-1-asmaa@nvidia.com>
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
4) Support lock mechanism

New features:
1) remove unnecessary IRQF_ONESHOT flag
2) Support multi slave functionality
3) Support BlueField-3 SoC

Asmaa Mnebhi (7):
  i2c-mlxbf.c: Fix frequency calculation
  i2c-mlxbf.c: remove IRQF_ONESHOT
  i2c-mlxbf: add multi slave functionality
  i2c-mlxbf.c: incorrect base address passed during io write
  i2c-mlxbf: prevent stack overflow in
    mlxbf_i2c_smbus_start_transaction()
  i2c-mlxbf.c: support BlueField-3 SoC
  i2c-mlxbf.c: support lock mechanism

 .../bindings/i2c/mellanox,i2c-mlxbf.yaml      |  30 +-
 MAINTAINERS                                   |   1 +
 drivers/i2c/busses/i2c-mlxbf.c                | 821 ++++++++++--------
 3 files changed, 467 insertions(+), 385 deletions(-)

-- 
2.30.1

