Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D34E3CCE
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 22:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfJXUN2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 16:13:28 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:50087 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfJXUN2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Oct 2019 16:13:28 -0400
Received: from localhost (unknown [78.193.40.249])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3545B200002;
        Thu, 24 Oct 2019 20:13:24 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v2 0/5] Add i2c bus recovery support for Atmel SoCs
Date:   Thu, 24 Oct 2019 22:12:57 +0200
Message-Id: <20191024201302.23376-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some Atmel SoCs actually doesn't support the clear command for recovery.
This patch serie merge the two support for both i2c bus recovery
mechanism (clear command and gpio/pinctrl).

Codrin Ciubotariu (1):
  i2c: at91: Send bus clear command if SCL or SDA is down

Kamel Bouhara (4):
  dt-bindings: i2c: at91: document optional bus recovery properties
  i2c: at91: implement i2c bus recovery
  ARM: at91/dt: sama5d3: add i2c gpio pinctrl
  ARM: at91/dt: sama5d4: add i2c gpio pinctrl

 .../devicetree/bindings/i2c/i2c-at91.txt      | 10 +++
 arch/arm/boot/dts/sama5d3.dtsi                | 33 ++++++-
 arch/arm/boot/dts/sama5d4.dtsi                | 33 ++++++-
 drivers/i2c/busses/i2c-at91-core.c            |  8 ++
 drivers/i2c/busses/i2c-at91-master.c          | 86 +++++++++++++++++++
 drivers/i2c/busses/i2c-at91.h                 | 15 +++-
 6 files changed, 178 insertions(+), 7 deletions(-)

--
2.23.0

