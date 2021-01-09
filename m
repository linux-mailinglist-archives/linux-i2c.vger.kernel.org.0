Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7952C2EFF8A
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 13:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbhAIMoL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 07:44:11 -0500
Received: from www.zeus03.de ([194.117.254.33]:50286 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbhAIMoL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 07:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=zD9cPRZyEaGEmq3k0za/7gpfIJU
        vc5uCoXoOde/5/F4=; b=e2VeYFuS0iXUn9uQpg26v+5ScyE7HsCtvjVv2rqjCgc
        ERgSCZBLj9PGIPt2NLFgBvaLT9c9oxpYpr60CVtZWmbwalZU2I+8TpwvoDJ0lsFS
        pPWdjHtjX8BVKLgcb9opPYW+hBdgfmWUnnVROyb20JiqL5r3qmldnPyrZNyB7aT0
        =
Received: (qmail 1724998 invoked from network); 9 Jan 2021 13:43:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2021 13:43:28 +0100
X-UD-Smtp-Session: l3s3148p1@EOH5BHe4RpYgAwDPXyBeAD+yeC5KBZLe
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/8] i2c: improve RECV_LEN documentation & usage
Date:   Sat,  9 Jan 2021 13:43:04 +0100
Message-Id: <20210109124314.27466-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Because I want to clarify I2C_M_RECV len usage, this series updates the
documentation and some of its users. Patch 1 refactors the whole
documentation of 'i2c_msg', so all usage of I2C_M_* flags and their
conditions hopefully become clearer. Patch 2+3 remove some obvious
boilerplate in the UAPI headers while here. Patch 4 is a driver fix I
found while working on this series. Patch 5 introduces a new convenience
macro to enable SMBus transfers which need I2C_M_RECV_LEN. Then, some
drivers use the new macro, sometimes to remove boilerplate, sometimes
because these SMBus transfers have been forgotten before.

This series is the first part of a larger work to extend I2C_M_RECV_LEN
to allow larger transfer sizes (as specified in the SMBus 3.0 standard)
and to enable this on Renesas R-Car hardware.

Looking forward to comments and/or reviews; the driver patches are only
build-tested.

Happy hacking,

   Wolfram


Wolfram Sang (8):
  i2c: refactor documentation of struct i2c_msg
  i2c: remove licence boilerplate from main UAPI header
  i2c: remove licence boilerplate from i2c-dev UAPI header
  i2c: octeon: check correct size of maximum RECV_LEN packet
  i2c: uapi: add macro to describe support for all SMBus transfers
  i2c: algo: bit: use new macro to specifiy capabilities
  i2c: qup: advertise SMBus transfers using RECV_LEN
  i2c: s3c2410: advertise SMBus transfers using RECV_LEN

 drivers/i2c/algos/i2c-algo-bit.c     |   4 +-
 drivers/i2c/busses/i2c-octeon-core.c |   2 +-
 drivers/i2c/busses/i2c-qup.c         |   2 +-
 drivers/i2c/busses/i2c-s3c2410.c     |   2 +-
 include/uapi/linux/i2c-dev.h         |  25 ++----
 include/uapi/linux/i2c.h             | 128 ++++++++++++++-------------
 6 files changed, 76 insertions(+), 87 deletions(-)

-- 
2.29.2

