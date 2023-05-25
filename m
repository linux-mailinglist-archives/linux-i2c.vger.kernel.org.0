Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B3C710DA4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 15:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241242AbjEYNwe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 09:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241225AbjEYNwd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 09:52:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 52CBC186;
        Thu, 25 May 2023 06:52:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,191,1681138800"; 
   d="scan'208";a="164333457"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 May 2023 22:52:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.84])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D82A940178B8;
        Thu, 25 May 2023 22:52:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] RZ/V2M I2Cdriver clean ups
Date:   Thu, 25 May 2023 14:52:26 +0100
Message-Id: <20230525135226.240732-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series aims to do the following clean ups based on feedback
from Pavel while backporting this driver to 5.10.y-cip kernel.

Drop extra space from config help description, Rename macro names in all
uppercase and finally in probe disable the operation of unit in case of
error.

Biju Das (3):
  i2c: rzv2m: Drop extra space
  i2c: rzv2m: Rename macro names in all uppercase
  i2c: rzv2m: Disable the operation of unit in case of error

 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/i2c/busses/i2c-rzv2m.c | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.25.1

