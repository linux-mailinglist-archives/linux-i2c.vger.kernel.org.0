Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599DE2E1FEF
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Dec 2020 18:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgLWRZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Dec 2020 12:25:50 -0500
Received: from www.zeus03.de ([194.117.254.33]:42290 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgLWRZu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Dec 2020 12:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=N5+gtJfhBgNR3GRzh/QZPrEtYyM
        g8i3Kx+IQacgaj9I=; b=cMP3M95faKEZIFTKFE2HWoDRW+NDaASfONbOQym3oTY
        mBc2c7OiK3EETFo1SmfJjhQjWxMD/1ya99Ua2fLHggsBZkfF9WEL0fYRanjp67fJ
        77ytIq1RJwi4kYJrgYNWxmQyQorskT75tery+IQrp1W9aIcmyfisaYEAfMafMx/k
        =
Received: (qmail 544539 invoked from network); 23 Dec 2020 18:25:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:25:07 +0100
X-UD-Smtp-Session: l3s3148p1@nub7+CS3xudUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] v3u: enable I2C0-6
Date:   Wed, 23 Dec 2020 18:24:59 +0100
Message-Id: <20201223172505.34736-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

These patches are needed to enable I2C on the Falcon board for the V3U.
Patch #5 is only for demonstration purposes. The series depends on my
RWDT series, Ulrich's PFC v2 series and Geert's DMA placeholder. A
branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/i2c

There is also a series in-flight to handle spurious interrupts on the
V3U. Because I have never seen one, I wouldn't call it a dependency, so
the series is handled seperately.

Looking forward to comments...


Koji Matsuoka (2):
  arm64: dts: renesas: Add I2C to R8A779A0
  arm64: dts: renesas: Add I2C support for falcon board

Wolfram Sang (3):
  dt-bindings: i2c: renesas,i2c: add r8a779a0 (V3U) support
  clk: renesas: r8a779a0: add clocks for I2C
  v3u: enable other I2C busses for testing

 .../devicetree/bindings/i2c/renesas,i2c.txt   |   1 +
 .../boot/dts/renesas/r8a779a0-falcon.dts      |  93 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 122 ++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |   7 +
 4 files changed, 223 insertions(+)

-- 
2.28.0

