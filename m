Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93ABE39982A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 04:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCCue (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Jun 2021 22:50:34 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46210 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhFCCud (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Jun 2021 22:50:33 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1532ZGgY005425;
        Thu, 3 Jun 2021 10:35:16 +0800 (GMT-8)
        (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 10:48:45 +0800
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
Subject: [PATCH v3 0/1] dt-bindings-aspeed-i2 Convert to yaml format
Date:   Thu, 3 Jun 2021 10:48:18 +0800
Message-ID: <20210603024839.27976-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1532ZGgY005425
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Change review issue since v2
1. remove some description of properties
2. replace reset with resets
3. remove status from the example
4. move compatible first in the list of properties 

Jamin Lin (1):
  dt-bindings: aspeed-i2c: Convert txt to yaml format

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 75 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ------------
 2 files changed, 75 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt

-- 
2.17.1

