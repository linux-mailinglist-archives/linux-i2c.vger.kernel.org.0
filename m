Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BCB254799
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 16:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgH0OwM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 10:52:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:59070 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727850AbgH0N0W (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 09:26:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DEAB5ADC2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Aug 2020 13:25:56 +0000 (UTC)
Date:   Thu, 27 Aug 2020 15:25:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: [PATCH 1/2] There are several eeprom drivers
Message-ID: <20200827152523.6cc67392@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There used to be only 1 eeprom driver (named "eeprom") but now
there are 3 and the legacy "eeprom" driver is not the preferred
option. So list all 3 drivers in our documentation to prevent
confusion.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 README           |    3 ++-
 eeprom/Module.mk |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

--- i2c-tools.orig/README	2020-08-27 10:28:54.972629860 +0200
+++ i2c-tools/README	2020-08-27 10:41:42.169866472 +0200
@@ -20,7 +20,8 @@ The various tools included in this packa
 
 * eeprom
   Perl scripts for decoding different types of EEPROMs (SPD, EDID...) These
-  scripts rely on the "eeprom" kernel driver. They are installed by default.
+  scripts rely on the eeprom kernel drivers ("at24" and "ee1004", "eeprom" on
+  older kernels). They are installed by default.
 
 * eeprog, eepromer
   Tools for writing to EEPROMs. These tools rely on the "i2c-dev" kernel
--- i2c-tools.orig/eeprom/Module.mk	2020-08-27 10:28:54.972629860 +0200
+++ i2c-tools/eeprom/Module.mk	2020-08-27 10:56:11.760402361 +0200
@@ -1,6 +1,6 @@
-# EEPROM decoding scripts for the Linux eeprom driver
+# EEPROM decoding scripts for the Linux eeprom drivers
 #
-# Copyright (C) 2007-2013  Jean Delvare <jdelvare@suse.de>
+# Copyright (C) 2007-2020  Jean Delvare <jdelvare@suse.de>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by


-- 
Jean Delvare
SUSE L3 Support
