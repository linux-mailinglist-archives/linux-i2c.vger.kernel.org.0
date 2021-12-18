Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC82479BCB
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 17:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhLRQxH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Dec 2021 11:53:07 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:49487 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229552AbhLRQxG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Dec 2021 11:53:06 -0500
X-IronPort-AV: E=Sophos;i="5.88,216,1635174000"; 
   d="scan'208";a="104388663"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Dec 2021 01:53:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 25B6B40A5168;
        Sun, 19 Dec 2021 01:53:01 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] i2c/busses: Use platform_get_irq/_optional() variants to fetch IRQ's
Date:   Sat, 18 Dec 2021 16:52:55 +0000
Message-Id: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

This patch series aims to drop using platform_get_resource() for IRQ types
in preparation for removal of static setup of IRQ resource from DT core
code.

Dropping usage of platform_get_resource() was agreed based on
the discussion [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note: I have just build tested the patches.

Cheers,
Prabhakar

Lad Prabhakar (3):
  i2c: bcm2835: Use platform_get_irq() to get the interrupt
  i2c: sh_mobile: Use platform_get_irq_optional() to get the interrupt
  i2c: riic: Use platform_get_irq() to get the interrupt

 drivers/i2c/busses/i2c-bcm2835.c   | 11 +++------
 drivers/i2c/busses/i2c-riic.c      | 10 ++++----
 drivers/i2c/busses/i2c-sh_mobile.c | 39 +++++++++++++++++++++++-------
 3 files changed, 39 insertions(+), 21 deletions(-)

-- 
2.17.1

