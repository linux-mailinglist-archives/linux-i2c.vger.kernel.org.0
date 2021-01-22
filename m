Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2E5301019
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 23:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbhAVTrw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 14:47:52 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:38495 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730469AbhAVTZx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jan 2021 14:25:53 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 22 Jan 2021 21:25:04 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10MJP4v8019220;
        Fri, 22 Jan 2021 21:25:04 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v2 0/7] i2c: mux: mlxcpld: Extend driver functionality and update licenses
Date:   Fri, 22 Jan 2021 21:24:55 +0200
Message-Id: <20210122192502.17645-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patchset adds new features for the existing Mellanox systems.

Patches #1-#2 update license to SPDX-License.
Patch #3  moves header file out of x86 realm.
Patch #4 converts driver to platform driver.
Patch #5 adds support for word address space devices.
Patch #6 extends mux number supported by driver.
Patch #7 adds callback notification about mux creation.

Vadim Pasternak (7):
  i2c: mux: mlxcpld: Update module license
  platform/x86: mlxcpld: Update module license
  i2c: mux: mlxcpld: Move header file out of x86 realm
  i2c: mux: mlxcpld: Convert driver to platform driver
  i2c: mux: mlxcpld: Extend driver to support word address space devices
  i2c: mux: mlxcpld: Extend supported mux number
  i2c: mux: mlxcpld: Add callback to notify mux creation completion

 drivers/i2c/muxes/i2c-mux-mlxcpld.c       | 162 +++++++++++++++---------------
 include/linux/platform_data/mlxcpld.h     |  31 ++++++
 include/linux/platform_data/x86/mlxcpld.h |  52 ----------
 3 files changed, 110 insertions(+), 135 deletions(-)
 create mode 100644 include/linux/platform_data/mlxcpld.h
 delete mode 100644 include/linux/platform_data/x86/mlxcpld.h

-- 
2.11.0

