Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A63314029
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 21:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhBHURI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 15:17:08 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:41572 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S236699AbhBHURB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 15:17:01 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 8 Feb 2021 22:16:08 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 118KG8n4004438;
        Mon, 8 Feb 2021 22:16:08 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v5 0/6] mux: mlxcpld: Extend driver functionality
Date:   Mon,  8 Feb 2021 22:16:00 +0200
Message-Id: <20210208201606.10620-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset adds new features for the existing Mellanox systems.

Patch #1 converts driver to platform driver.
Patch #2 prepare driver for word addressing support.
Patch #3 removes adapter numbers enforcement.
Patch #4 adds support for word address space devices.
Patch #5 extends mux number supported by driver.
Patch #6 adds callback notification about mux creation.

Vadim Pasternak (6):
  i2c: mux: mlxcpld: Convert driver to platform driver
  i2c: mux: mlxcpld: Prepare mux selection infrastructure for two-byte
    support
  i2c: mux: mlxcpld: Get rid of adapter numbers enforcement
  i2c: mux: mlxcpld: Extend driver to support word address space devices
  i2c: mux: mlxcpld: Extend supported mux number
  i2c: mux: mlxcpld: Add callback to notify mux creation completion

 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 128 ++++++++++++++++++++--------------
 include/linux/platform_data/mlxcpld.h |  11 ++-
 2 files changed, 83 insertions(+), 56 deletions(-)

-- 
2.11.0

