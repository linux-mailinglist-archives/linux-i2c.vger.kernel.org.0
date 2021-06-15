Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1234F3A798E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Jun 2021 10:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhFOI4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Jun 2021 04:56:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1964 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231169AbhFOI4M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Jun 2021 04:56:12 -0400
X-IronPort-AV: E=Sophos;i="5.83,275,1616425200"; 
   d="scan'208";a="84414407"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jun 2021 17:54:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.147])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2B44141EB326;
        Tue, 15 Jun 2021 17:54:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] Add RZ/G2L I2C support
Date:   Tue, 15 Jun 2021 09:53:58 +0100
Message-Id: <20210615085400.4251-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series aims to support I2C on RZ/G2L based platforms.

This patchset is based on master branch [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/
v2->v3:-
  * Removed RESET_CONTROLLER select from KCONFIG
  * Added Rb tags from Phillipp and Geert for driver patch.
v1->v2:-
  * Removed patch 2,4 and 5 as it is queued for v5.15.
  * Added Geert's Rb tag for binding patch
  * Incorporated philipp and Geert's review comments for driver patch 

v1:-
  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=499069

Biju Das (2):
  dt-bindings: i2c: renesas,riic: Document RZ/G2L I2C controller
  i2c: riic: Add RZ/G2L support

 .../devicetree/bindings/i2c/renesas,riic.yaml | 19 +++++++++++----
 drivers/i2c/busses/i2c-riic.c                 | 23 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 5 deletions(-)

-- 
2.17.1

