Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E13E2E1FD7
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Dec 2020 18:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLWRWn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Dec 2020 12:22:43 -0500
Received: from www.zeus03.de ([194.117.254.33]:41264 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbgLWRWn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Dec 2020 12:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=uTZyT5vHxos2I1dDSrY6tRmabz/
        0wsIZIrXlzsjpOfw=; b=eegb11C+7iBETVCIFtaDppjrQQ3Gvtuqjl8nO8g9ecs
        60ggq+33ojt7CV2R4C5PRWvHQIpT5ix3C2rbxhRYZ1oINaGvpAd1E1IWxhJ1GypY
        TycldHxg1yoKDr4itqX0lhZLPqir/BOTZ9wavBQj7llXDmvY3hOwTNhvSP19mock
        =
Received: (qmail 543519 invoked from network); 23 Dec 2020 18:22:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:22:00 +0100
X-UD-Smtp-Session: l3s3148p1@YKOY7SS3tOdUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/4] i2c: rcar: handle Gen2 and Gen3 V3U quirks better
Date:   Wed, 23 Dec 2020 18:21:50 +0100
Message-Id: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The new V3U SoC needs handling of spurious interrupts which is handled
in patch #4. However, this extra check is bad for Gen2 and earlier SoCs,
so we need seperate interrupts now. While working on this, further
improvements to avoid the HW race condition on Gen2 and earlier have
been found, see patches 1-3.

My measurements have shown that patches 1+2 really improve the
situation. Before, I could see doubled messages after adding 2us of
delay to the interrupt handler. After, they only started to appear after
7us. I can't say much about the spurious interrupts on V3U. The BSP team
experienced them, I did not so far.

Let me know what you think...


Wolfram Sang (4):
  i2c: rcar: faster irq code to minimize HW race condition
  i2c: rcar: optimize cacheline to minimize HW race condition
  i2c: rcar: make sure irq is not threaded on Gen2 and earlier
  i2c: rcar: protect against supurious interrupts on V3U

 drivers/i2c/busses/i2c-rcar.c | 66 +++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 18 deletions(-)

-- 
2.28.0

