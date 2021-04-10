Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974DF35B049
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234536AbhDJUMU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:12:20 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:38964 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbhDJUMU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 16:12:20 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru DC87820751F9
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: [PATCH v2 0/6] Stop calling devm_request_irq() with invalid IRQs in
 the I2C bus drivers
To:     <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Michal Simek <michal.simek@xilinx.com>
Organization: Open Mobile Platform, LLC
CC:     <linux-mips@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <7995bba1-61dd-baa3-51ea-0fb2fccc19a0@omprussia.ru>
Date:   Sat, 10 Apr 2021 23:11:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1908.lancloud.ru (fd00:f066::208)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Here are 6 patches against the 'master' branch of Martin Petersen's 'scsi.git' repo.
The affected drivers call platform_get_irq() but largely ignore its result -- they
blithely pass the negative error codes to devm_request_irq() which expects *unsinged*
IRQ #s. Stop doing that by checking what exactly platform_get_irq() returns.

[1/6] i2c: cadence: add IRQ check
[2/6] i2c: emev2: add IRQ check
[3/6] i2c: jz4780: add IRQ check
[4/6] i2c: mlxbf: add IRQ check
[5/6] i2c: rcar: add IRQ check
[6/6] i2c: sh7760: add IRQ check
