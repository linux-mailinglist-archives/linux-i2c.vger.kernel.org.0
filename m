Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF8311ACA9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2019 15:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfLKOAH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Dec 2019 09:00:07 -0500
Received: from mail.manjaro.org ([176.9.38.148]:38220 "EHLO manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727554AbfLKOAH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Dec 2019 09:00:07 -0500
X-Greylist: delayed 1192 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Dec 2019 09:00:06 EST
Received: from localhost (localhost [127.0.0.1])
        by manjaro.org (Postfix) with ESMTP id 16D9636E237E;
        Wed, 11 Dec 2019 14:40:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id z1cPnLJeGh3p; Wed, 11 Dec 2019 14:40:10 +0100 (CET)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     linux-kernel@vger.kernel.org, linux-pm@lists.linux-foundation.org,
        linux-i2c@vger.kernel.org
Cc:     anarsoul@gmail.com, sre@kernel.org, pali.rohar@gmail.com,
        david@lechnology.com, afd@ti.com,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH 0/2] power: supply: add support for CW2015 Fuel Gauge
Date:   Wed, 11 Dec 2019 14:39:28 +0100
Message-Id: <20191211133930.7488-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patchset adds support for the CW2015 Fuel Gauge.
The CW2015 fuel gauge is used in Pinebook Pro and some Raspberry Pi UPS HATs.

Most of the code has been written by Rockchip. I've added devicetree support
for power supplies as well as the alert level and done some general code
cleanup.
I'm submitting it now as part of an effort to get full mainline Linux support
for the Pinebook Pro.

CCing some maintainers of other fuel gauge drivers here to get feedback on this
patch.

Tobias Schramm (2):
  power: supply: add CW2015 Fuel Gauge driver
  dt-bindings: power: supply: cw2015_battery: add device tree binding
    documentation

 .../bindings/power/supply/cw2015_battery.txt  |  37 +
 drivers/power/supply/Kconfig                  |   7 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/cw2015_battery.c         | 962 ++++++++++++++++++
 include/linux/power/cw2015_battery.h          | 122 +++
 5 files changed, 1129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/cw2015_battery.txt
 create mode 100644 drivers/power/supply/cw2015_battery.c
 create mode 100644 include/linux/power/cw2015_battery.h

-- 
2.24.0

