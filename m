Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CF5388958
	for <lists+linux-i2c@lfdr.de>; Wed, 19 May 2021 10:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237515AbhESI2a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 04:28:30 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46518 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235418AbhESI23 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 04:28:29 -0400
X-Greylist: delayed 1349 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 May 2021 04:28:29 EDT
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 14J7q8f9033709
        for <linux-i2c@vger.kernel.org>; Wed, 19 May 2021 15:52:08 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14J7q2pj033695;
        Wed, 19 May 2021 15:52:02 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 16:04:38 +0800
From:   Jamin Lin <jamin_lin@aspeedtech.com>
To:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        "Andrew Jeffery" <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>
CC:     <ryan_chen@aspeedtech.com>, <chiawei_wang@aspeedtech.com>,
        <troy_lee@aspeedtech.com>, <steven_lee@aspeedtech.com>,
        <jamin_lin@aspeedtech.com>
Subject: [PATCH 0/3] i2c: aspeed: avoid new registers definition of AST2600
Date:   Wed, 19 May 2021 16:04:26 +0800
Message-ID: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14J7q2pj033695
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Jamin Lin (3):
  i2c: aspeed: avoid new registers definition of AST2600
  ARM: dts: aspeed: Add node for AST2600 I2C
  dt-bindings: aspeed-i2c: Convert txt to yaml format

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 89 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ----------
 arch/arm/boot/dts/aspeed-g6.dtsi              |  8 ++
 drivers/i2c/busses/i2c-aspeed.c               | 22 +++++
 4 files changed, 119 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

-- 
2.17.1

