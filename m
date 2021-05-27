Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC39392BB6
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 12:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbhE0K0x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 06:26:53 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:28218 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235950AbhE0K0w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 06:26:52 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14RAC8bC019293;
        Thu, 27 May 2021 18:12:09 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 18:25:13 +0800
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
CC:     <ryan_chen@aspeedtech.com>, <chin-ting_kuo@aspeedtech.com>,
        <troy_lee@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v2 0/1] dt-bindings-aspeed-i2 Convert to yaml format
Date:   Thu, 27 May 2021 18:25:04 +0800
Message-ID: <20210527102512.20684-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14RAC8bC019293
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change review issue since v1
1. add multi-master to boolean type property
2. add maxItems to reset and clock property

Jamin Lin (1):
  dt-bindings: aspeed-i2c: Convert txt to yaml format

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 86 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 -----------
 2 files changed, 86 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

-- 
2.17.1

