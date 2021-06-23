Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409C83B177C
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 11:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhFWKCC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 06:02:02 -0400
Received: from www.zeus03.de ([194.117.254.33]:50846 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230234AbhFWKCB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 06:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=+dJisOoRlpnaFm/+eXurATQB9Rw
        iXYy889RBZ/5oR1M=; b=0Qn1AEWFWm6AOFPOC5H30RuTJ/0vARRi4QcLLtYbOUE
        4EpagQFXqT1VD5gYz7nzCdnNmjYG8KfX7rnQOjv48HdJP8U+npGDyKwLk/9PkzQ5
        tm0ePKN/c5paoWm2+E1+0ch4UBDLqjM2H7dsYeV8XsN4h8mru9fIjsZzD0kal3vo
        =
Received: (qmail 2551888 invoked from network); 23 Jun 2021 11:59:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:59:43 +0200
X-UD-Smtp-Session: l3s3148p1@i9Eu92vFEKogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/7] i2c: use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:59:34 +0200
Message-Id: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Update the drivers I audited.


Wolfram Sang (7):
  i2c: at91-master: : use proper DMAENGINE API for termination
  i2c: imx: : use proper DMAENGINE API for termination
  i2c: mxs: : use proper DMAENGINE API for termination
  i2c: qup: : use proper DMAENGINE API for termination
  i2c: rcar: : use proper DMAENGINE API for termination
  i2c: sh_mobile: : use proper DMAENGINE API for termination
  i2c: stm32f7: : use proper DMAENGINE API for termination

 drivers/i2c/busses/i2c-at91-master.c | 4 ++--
 drivers/i2c/busses/i2c-imx.c         | 6 +++---
 drivers/i2c/busses/i2c-mxs.c         | 4 ++--
 drivers/i2c/busses/i2c-qup.c         | 2 +-
 drivers/i2c/busses/i2c-rcar.c        | 4 ++--
 drivers/i2c/busses/i2c-sh_mobile.c   | 4 ++--
 drivers/i2c/busses/i2c-stm32f7.c     | 8 ++++----
 7 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.30.2

