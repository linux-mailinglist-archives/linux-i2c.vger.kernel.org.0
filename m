Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D95479F2EC
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 22:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjIMUc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 16:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjIMUc4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 16:32:56 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B411BCE
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 13:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=r7+iV8mF+BeBrr
        Ak+ur+Y49iRP5XFLkQ4+9fz1sUTM4=; b=Q5FFDobCekqoR2X14nHkV46XmeT+WY
        p3Hd20Q0wPPP97OvxWmUlWaLlvlVRSZqjuKCP1ey8X5yC3uRO1JByrAa/7yVoSg6
        G9Xhf3TN8ls0cZdmyg9hOl+yk9vnC+FlMvTRXkHoYgtyF9EqKZg1mhOoGOeWIVtG
        b2i9DS73AzeQ7Lc05sS8Aqa1qtQkm//JlpN9B9vdfl3vEzNjWylikW4GzIBLtWRm
        I7TZi3W54ljrDGjkFQsDyJJPabNwMJ+Li8LKzZb8H8dLuxaWpR/KLltqEJBLImwm
        izg/A67TpiMpEOgnZlDh7J2IuU5P+aTOKgEcZxqyb0GMVGLtEP9Phmfg==
Received: (qmail 715795 invoked from network); 13 Sep 2023 22:32:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2023 22:32:47 +0200
X-UD-Smtp-Session: l3s3148p1@tmVcdkMFTI0ujnuS
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i2c: rcar: add support for Gen4 devices
Date:   Wed, 13 Sep 2023 22:32:39 +0200
Message-Id: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The newest generation of Renesas R-Car SoCs support FastMode+. This
series enables the driver to use it. It is based on the series "i2c:
clock calculation cleanups for Renesas devices" and "i2c: rcar: improve
Gen3 support". A branch for testing can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/fmplus-experimental

Shimoda-san: Maybe the BSP team and/or the test team might want to try
this branch?

Looking forward to comments and test reports etc.

Happy hacking!


Wolfram Sang (2):
  i2c: rcar: introduce Gen4 devices
  i2c: rcar: add FastMode+ support for Gen4

 drivers/i2c/busses/i2c-rcar.c | 67 ++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 24 deletions(-)

-- 
2.35.1

