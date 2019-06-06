Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B4137778
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 17:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbfFFPMJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 11:12:09 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:50650 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727559AbfFFPMJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 11:12:09 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FA1CC0BA5;
        Thu,  6 Jun 2019 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1559833908; bh=0xawz4OatXGzaBqtYj6nS/EfNnp/z+E5VwinuXJDtLQ=;
        h=From:To:Cc:Subject:Date:From;
        b=AZg1Yd1UvRb7GN5XhHpGuTWa45lSMBb5oho1rMamz+DMIBTzwL7++qDfU0zRK/ahA
         GL9HjOsdNcdTlNAkVuCluuUghwxxrgmekwGebFyCrdpFFyyQJOWnWlFEqZwjSXxobr
         mUh2O0o/TCY6YpLwj4d1ABhXEm58H6PjjJ27rDuUqPUAcu3mo10VKCLQ4mcLs44dNy
         uPfDqNBjHAqLhdpiFcU4mV1ccs66S84iMhQtdaeeYUmh8CmhsnbM99oJgU4fqZ1l7K
         LbM9q8e1/1+IFyl3At97an0TMptIBW+3AkKYmTP2gGdH3h0y9HG6uf3p4LB/tc1CWf
         Ra6x0KQZRT2cg==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id AF36DA0057;
        Thu,  6 Jun 2019 15:12:06 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id 9191D3FECC;
        Thu,  6 Jun 2019 17:12:06 +0200 (CEST)
From:   Vitor Soares <Vitor.Soares@synopsys.com>
To:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        bbrezillon@kernel.org, Joao.Pinto@synopsys.com,
        lorenzo.bianconi83@gmail.com,
        Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH v2 0/3] Add ST lsm6dso i3c support
Date:   Thu,  6 Jun 2019 17:12:01 +0200
Message-Id: <cover.1559831663.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series add i3c support for STM LSM6DSO and LSM6DSR sensors.

It is also introduced i3c support on regmap api. Due the lack of
i3c devices HDR capables on the market the support for now is only for
i3c sdr mode by using i3c_device_do_priv_xfers() method.

Changes in v2:
  Change i3c_get_device_id() to drivers/i3c/device.c
  Add support for LSM6DSR

Vitor Soares (3):
  regmap: add i3c bus support
  i3c: Add i3c_get_device_id helper
  iio: imu: st_lsm6dsx: add i3c basic support for LSM6DSO and LSM6DSR

 drivers/base/regmap/Kconfig                 |  6 ++-
 drivers/base/regmap/Makefile                |  1 +
 drivers/base/regmap/regmap-i3c.c            | 60 +++++++++++++++++++++++
 drivers/i3c/device.c                        |  8 +++
 drivers/iio/imu/st_lsm6dsx/Kconfig          |  8 ++-
 drivers/iio/imu/st_lsm6dsx/Makefile         |  1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c | 76 +++++++++++++++++++++++++++++
 include/linux/i3c/device.h                  |  1 +
 include/linux/regmap.h                      | 20 ++++++++
 9 files changed, 179 insertions(+), 2 deletions(-)
 create mode 100644 drivers/base/regmap/regmap-i3c.c
 create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c

-- 
2.7.4

