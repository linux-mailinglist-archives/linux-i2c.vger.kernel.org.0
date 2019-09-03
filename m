Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD2DA724E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729838AbfICSNB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:13:01 -0400
Received: from sauhun.de ([88.99.104.3]:56818 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728065AbfICSNB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 14:13:01 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id EB2612C4F2F;
        Tue,  3 Sep 2019 20:12:59 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/3] hwmon: convert remaining drivers to i2c_new_dummy_device()
Date:   Tue,  3 Sep 2019 20:12:53 +0200
Message-Id: <20190903181256.13450-1-wsa+renesas@sang-engineering.com>
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

This series fixes the remaining hwmon drivers which could not be
converted by my cocci script. So, I did it manually, yet all drivers
still follow the same pattern. Build tested by me and by buildbot. No
tests on HW have been performed, so testing is appreciated.

The branch is based on v5.3-rc2. A branch (with some more stuff included) can
be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_dummy


Wolfram Sang (3):
  hwmon: w83791d: convert to use devm_i2c_new_dummy_device
  hwmon: w83792d: convert to use devm_i2c_new_dummy_device
  hwmon: w83793d: convert to use devm_i2c_new_dummy_device

 drivers/hwmon/w83791d.c | 32 +++++++++-----------------------
 drivers/hwmon/w83792d.c | 32 +++++++++-----------------------
 drivers/hwmon/w83793.c  | 30 ++++++++----------------------
 3 files changed, 26 insertions(+), 68 deletions(-)

-- 
2.20.1

