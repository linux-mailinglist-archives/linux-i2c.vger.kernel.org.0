Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE8D28E433
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 18:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730376AbgJNQRy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 12:17:54 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50457 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730044AbgJNQRx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 12:17:53 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 14 Oct 2020 19:17:49 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 09EGHnjU007559;
        Wed, 14 Oct 2020 19:17:49 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH 0/6] i2c: mux: mlxcpld: Extend driver functionality and update licenses
Date:   Wed, 14 Oct 2020 19:17:41 +0300
Message-Id: <20201014161747.31926-1-vadimp@nvidia.com>
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

Vadim Pasternak (6):
  i2c: mux: mlxcpld: Update module license
  platform/x86: mlxcpld: Update module license
  i2c: mux: mlxcpld: Move header file out of x86 realm
  i2c: mux: mlxcpld: Convert driver to platform driver
  i2c: mux: mlxcpld: Extend driver to support word address space devices
  i2c: mux: mlxcpld: Extend supported mux number

 drivers/i2c/muxes/i2c-mux-mlxcpld.c       | 153 ++++++++++++++----------------
 include/linux/platform_data/mlxcpld.h     |  26 +++++
 include/linux/platform_data/x86/mlxcpld.h |  52 ----------
 3 files changed, 99 insertions(+), 132 deletions(-)
 create mode 100644 include/linux/platform_data/mlxcpld.h
 delete mode 100644 include/linux/platform_data/x86/mlxcpld.h

-- 
2.11.0

