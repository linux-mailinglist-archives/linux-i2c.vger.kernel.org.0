Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51D22F33F3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 16:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404671AbhALPN6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 10:13:58 -0500
Received: from www.zeus03.de ([194.117.254.33]:42692 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404302AbhALPNQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 10:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=2Cy/op28MBjMIxcLIh/qixCdPjU
        PCT4ZoaT5Q6V2oLw=; b=ai36Zenh2uOY59Et9EltV1WQOpbrds9Bk8wt21XUw84
        LDaD2f+ZWB6ewj4EJzA0dL2FC9swwHhki+uA58rn+kr/NO94BF3zKybwywTej6Ia
        ncm27K1A3H9gYDyKaFvBd9ZjuJKphXy8MXJXfC9xRzQBKNORj5y03Sjd3HAbVBfQ
        =
Received: (qmail 2786133 invoked from network); 12 Jan 2021 16:12:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jan 2021 16:12:35 +0100
X-UD-Smtp-Session: l3s3148p1@AubTc7W4dL4gAwDPXwxzAXsl+VVkdePs
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: smbus: small cleanups in emulation function
Date:   Tue, 12 Jan 2021 16:12:28 +0100
Message-Id: <20210112151230.46518-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To prepare for some bigger refactoring, remove those two minor nuisances
first.

Wolfram Sang (2):
  i2c: smbus: don't abuse loop variable
  i2c: smbus: improve naming in i2c_smbus_xfer_emulated()

 drivers/i2c/i2c-core-smbus.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

-- 
2.29.2

