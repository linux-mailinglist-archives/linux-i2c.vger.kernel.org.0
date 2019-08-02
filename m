Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25C7B7F73A
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 14:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730003AbfHBMvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 08:51:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:38596 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726422AbfHBMvN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Aug 2019 08:51:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 94B71AFF6;
        Fri,  2 Aug 2019 12:51:11 +0000 (UTC)
Date:   Fri, 2 Aug 2019 14:51:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andrew Cooks <acooks@rationali.st>, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: [PATCH v5 0/3] Enable ACPI-defined peripherals on i2c-piix4 SMBus
Message-ID: <20190802145109.38dd4045@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

These patches fix a couple of issues with the i2c-piix4 driver on
AMD Family 16h Model 30h SoCs and add ACPI-based enumeration to the
i2c-piix4 driver.

Some I2C peripherals, eg. PCA953x IO expander, are not discovered by the
probe or detect mechanisms when attached to an SMBus controller that uses
the i2c-piix4 SMBus driver.

ACPI provides a mechanism to define these peripherals and the controller
port that they're attached to.

Based on earlier work by Andrew Cooks.

Changes:
v5:
  take over from Andrew Cooks who apparently moved to other projects
  fix style issues reported by Tobin C. Harding
  fix potential array overrun
  make sure all registered adapters get unregistered
  keep ports 3 and 4 on early Hudson2
  assume AMD SMBus numbering for ACPI devices
v4:
  remove unnecessary SB800_MAIN_PORTS constant
  reduce piix4_remove change
v3:
  take chip revision into account when determining port selection register
v2:
  count the adapters, instead of misusing port numbers

-- 
Jean Delvare
SUSE L3 Support
