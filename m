Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E4D132D69
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgAGRsI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:48:08 -0500
Received: from sauhun.de ([88.99.104.3]:53300 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbgAGRsI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 12:48:08 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id D79E72C05BA;
        Tue,  7 Jan 2020 18:48:05 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/12] i2c: convert subsystem to use i2c_new_client_device()
Date:   Tue,  7 Jan 2020 18:47:34 +0100
Message-Id: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series converts the I2C subsystem to use the new API. Drivers
have been build tested. There is one user left in the SMBus part of the
core which will need a seperate series because all users of this
function need to be checked/converted, too.

Except for documentation patches, the conversion has been done with a
coccinelle script and further simplification have been applied when
proofreading the patches.

A branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_client_device

Looking forward to comments...

Wolfram Sang (12):
  i2c: cht-wc: convert to use i2c_new_client_device()
  i2c: i801: convert to use i2c_new_client_device()
  i2c: nvidia-gpu: convert to use i2c_new_client_device()
  i2c: ocores: convert to use i2c_new_client_device()
  i2c: powermac: convert to use i2c_new_client_device()
  i2c: taos-evm: convert to use i2c_new_client_device()
  i2c: xiic: convert to use i2c_new_client_device()
  i2c: i2c-core-acpi: convert to use i2c_new_client_device()
  i2c: i2c-core-base: convert to use i2c_new_client_device()
  i2c: i2c-core-of: convert to use i2c_new_client_device()
  docs: i2c: use the new API in 'instantiating-devices.rst'
  docs: i2c: use the new API in 'writing-clients'

 Documentation/i2c/instantiating-devices.rst |  8 ++++----
 Documentation/i2c/writing-clients.rst       | 20 ++++++++++----------
 drivers/i2c/busses/i2c-cht-wc.c             |  6 +++---
 drivers/i2c/busses/i2c-i801.c               |  6 +++---
 drivers/i2c/busses/i2c-nvidia-gpu.c         |  6 +++---
 drivers/i2c/busses/i2c-ocores.c             |  2 +-
 drivers/i2c/busses/i2c-powermac.c           |  8 ++++----
 drivers/i2c/busses/i2c-taos-evm.c           |  4 ++--
 drivers/i2c/busses/i2c-xiic.c               |  2 +-
 drivers/i2c/i2c-core-acpi.c                 | 12 ++++--------
 drivers/i2c/i2c-core-base.c                 | 13 ++++++-------
 drivers/i2c/i2c-core-of.c                   |  7 +++----
 12 files changed, 44 insertions(+), 50 deletions(-)

-- 
2.20.1

