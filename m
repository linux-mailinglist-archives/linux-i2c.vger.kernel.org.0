Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D62D4415C3
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 10:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhKAJHD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 05:07:03 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]:44034 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbhKAJHD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 05:07:03 -0400
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id 556962022E; Mon,  1 Nov 2021 17:04:28 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
Cc:     Zev Weiss <zev@bewilderbeest.net>, Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-i2c@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next 0/6] MCTP I2C driver
Date:   Mon,  1 Nov 2021 17:03:59 +0800
Message-Id: <20211101090405.1405987-1-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This patch series adds a netdev driver providing MCTP transport over
I2C. 

It applies against net-next using recent MCTP changes there, though also
has I2C core changes for review. I'll leave it to maintainers where it
should be applied - please let me know if it needs to be submitted
differently.

The I2C patches were previously sent as RFC though the only feedback
there was an ack to 255 bytes for aspeed.

The dt-bindings patch went through review on the list.

Cheers,
Matt

Matt Johnston (6):
  i2c: core: Allow 255 byte transfers for SMBus 3.x
  i2c: dev: Handle 255 byte blocks for i2c ioctl
  i2c: aspeed: Allow 255 byte block transfers
  i2c: npcm7xx: Allow 255 byte block SMBus transfers
  dt-bindings: net: New binding mctp-i2c-controller
  mctp i2c: MCTP I2C binding driver

 Documentation/devicetree/bindings/i2c/i2c.txt |   4 +
 .../bindings/net/mctp-i2c-controller.yaml     |  92 ++
 drivers/i2c/busses/i2c-aspeed.c               |   5 +-
 drivers/i2c/busses/i2c-npcm7xx.c              |   3 +-
 drivers/i2c/i2c-core-smbus.c                  |  20 +-
 drivers/i2c/i2c-dev.c                         |  93 +-
 drivers/net/mctp/Kconfig                      |  12 +
 drivers/net/mctp/Makefile                     |   1 +
 drivers/net/mctp/mctp-i2c.c                   | 982 ++++++++++++++++++
 include/linux/i2c.h                           |  13 +
 include/uapi/linux/i2c-dev.h                  |   2 +
 include/uapi/linux/i2c.h                      |   7 +-
 12 files changed, 1209 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mctp-i2c-controller.yaml
 create mode 100644 drivers/net/mctp/mctp-i2c.c

-- 
2.32.0

