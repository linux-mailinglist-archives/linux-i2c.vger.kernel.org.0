Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36AB3A4719
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jun 2021 18:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhFKQ6b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Jun 2021 12:58:31 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:19008 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229548AbhFKQ6b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Jun 2021 12:58:31 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="83967382"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Jun 2021 01:56:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 23BDE4015FC7;
        Sat, 12 Jun 2021 01:56:26 +0900 (JST)
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
        =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] Add RZ/G2L I2C support
Date:   Fri, 11 Jun 2021 17:56:19 +0100
Message-Id: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series aims to support I2C on RZ/G2L based platforms.

This patchset is based on master branch [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/

Biju Das (5):
  dt-bindings: i2c: renesas,riic: Document RZ/G2L I2C controller
  drivers: clk: renesas: r9a07g044-cpg: Add I2C Clocks
  i2c: riic: Add RZ/G2L support
  arm64: dts: renesas: r9a07g044: Add I2C nodes
  arm64: defconfig: Enable RIIC

 .../devicetree/bindings/i2c/renesas,riic.yaml | 19 ++++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 80 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/renesas/r9a07g044-cpg.c           | 12 +++
 drivers/i2c/busses/Kconfig                    |  1 +
 drivers/i2c/busses/i2c-riic.c                 | 21 +++++
 6 files changed, 130 insertions(+), 4 deletions(-)

-- 
2.17.1

