Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD0D309753
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Jan 2021 18:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhA3Rfj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Jan 2021 12:35:39 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42585 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229953AbhA3Rfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 30 Jan 2021 12:35:39 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 30 Jan 2021 19:34:49 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10UHYnGl010866;
        Sat, 30 Jan 2021 19:34:49 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v3 0/6] i2c: mux: mlxcpld: Extend driver functionality
Date:   Sat, 30 Jan 2021 19:34:41 +0200
Message-Id: <20210130173447.26328-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset adds new features for the existing Mellanox systems.

Patch #1 converts driver to platform driver.
Patches #2-#3 prepare driver for word addressing support.
Patch #4 adds support for word address space devices.
Patch #5 extends mux number supported by driver.
Patch #6 adds callback notification about mux creation.

Vadim Pasternak (6):
  i2c: mux: mlxcpld: Convert driver to platform driver
  i2c: mux: mlxcpld: Prepare mux selection infrastructure for two-byte
    support
  i2c: mux: mlxcpld: Rename mux ids array
  i2c: mux: mlxcpld: Extend driver to support word address space devices
  i2c: mux: mlxcpld: Extend supported mux number
  i2c: mux: mlxcpld: Add callback to notify mux creation completion

 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 128 ++++++++++++++++++++--------------
 include/linux/platform_data/mlxcpld.h |  11 ++-
 2 files changed, 83 insertions(+), 56 deletions(-)

-- 
2.11.0

