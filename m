Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B47256A2D
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 22:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgH2UiX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 16:38:23 -0400
Received: from www.zeus03.de ([194.117.254.33]:58332 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728417AbgH2UiV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 16:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=pJZUCj9w5+vSKM6Ivhj8CgFym5p
        JvNN0wNJ5/NKq4R8=; b=Bp6bJJmuYXE4R7PF+V82Z64AAeJctIcGAJM+PKl+1z7
        1y1uvQERNVsNcvSO6blgiM2pF+dHn0qXe72Nyz+i6ZSmDfDw0iI9g5tMG2bhR6m6
        3KIIiebLqCJ792O/ODrc4N3PTZLfX/hyFdC1X7OI7m/pRYCI0l+MW3yO9tbSyc40
        =
Received: (qmail 1629923 invoked from network); 29 Aug 2020 22:38:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2020 22:38:19 +0200
X-UD-Smtp-Session: l3s3148p1@yC9WJgqu+tAgAwDPXyCvAAFyN1rCWI+G
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] i2c: rcar: use iopoll helpers for better timeout handling
Date:   Sat, 29 Aug 2020 22:38:08 +0200
Message-Id: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Originally, I noticed that the timeout value for initiating bus recovery
was not optimal. While fixing it, I took the chance to convert its
handling to the iopoll helpers. And then, I converted the timeout
handling for resetting the device, too, while I was at it.

Tested on a Renesas Lager board (H2) and Salvator-XS (M3-N).

Wolfram Sang (2):
  i2c: rcar: improve bus busy detection
  i2c: rcar: refactor and shorten timeout when resetting

 drivers/i2c/busses/i2c-rcar.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

-- 
2.20.1

