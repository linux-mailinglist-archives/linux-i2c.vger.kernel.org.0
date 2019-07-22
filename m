Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600AC70729
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfGVR26 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:28:58 -0400
Received: from sauhun.de ([88.99.104.3]:42188 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731377AbfGVR0S (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:18 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id A83C44A1494;
        Mon, 22 Jul 2019 19:26:16 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] misc: convert subsystem to i2c_new_dummy_device()
Date:   Mon, 22 Jul 2019 19:26:14 +0200
Message-Id: <20190722172616.3982-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series is part of a tree-wide movement to replace the I2C API call
'i2c_new_dummy' which returns NULL with its new counterpart returning an
ERRPTR.

The series was generated with coccinelle (audited afterwards, of course) and
build tested by me and by buildbot. No tests on HW have been performed.

The branch is based on v5.3-rc1. A branch (with some more stuff included) can
be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_dummy

Some drivers still need to be manually converted. Patches for those will be
sent out individually.


Wolfram Sang (2):
  misc: eeprom: ee1004: convert to i2c_new_dummy_device
  misc: eeprom: max6875: convert to i2c_new_dummy_device

 drivers/misc/eeprom/ee1004.c  | 6 +++---
 drivers/misc/eeprom/max6875.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.20.1

