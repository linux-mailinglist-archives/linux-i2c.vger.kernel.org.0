Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B59F35D6D4
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 07:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242755AbhDMFK1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 01:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242405AbhDMFK0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 01:10:26 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD72C06175F
        for <linux-i2c@vger.kernel.org>; Mon, 12 Apr 2021 22:10:07 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 24EFB806A8;
        Tue, 13 Apr 2021 17:10:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618290603;
        bh=Mo9Jb9NuUCdMrV9mhGoOphtTec+QGiASdV2SztXHQjc=;
        h=From:To:Cc:Subject:Date;
        b=klG4gMF3qgHjqxi4vHdt30TYY7vOOQbgKTlfO0GXjE692KE+fWu84Bu45xw62Zj90
         ZCaNerxfCc8G8BRStF1+9ZUK8F8V3TEJ2hJ0fT5TDH4AN87JEWrLLAOyUAGO5UKAFZ
         uGUXMFTMzJVyXYPJa7nViW8qS7Ldaj5i3FJxtpnhEa6w4OvzOygWbdsJJpROImEmEj
         YNesoZxNVclqirEcyDVffFwSvKqXHr/KVQYT+R2eqOxHKSBSpCnNDbn/ycdxTnb2pS
         3glfBNnCPsBMrds9maXWwa6tyhsH/PLWwnIHFvmtiv6t8zIyhqNWR+Be5RUR+clB3m
         4xh/JO9eH1yug==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B607527ab0000>; Tue, 13 Apr 2021 17:10:02 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 3A74513EEED;
        Tue, 13 Apr 2021 17:10:23 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 003FC284083; Tue, 13 Apr 2021 17:10:02 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/4] i2c: mpc: Refactor to improve responsiveness
Date:   Tue, 13 Apr 2021 17:09:51 +1200
Message-Id: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=035Devx1kFi9PKnuwTsA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is an update to what is already in i2c/for-next. I've included "i2c:=
 mpc:
use device managed APIs" which had some problems in the remove code path =
which
Wei Yongjun kindly pointed out with a fix. I've incorporated those change=
s into
this version in case the original is reverted.

I've tested on T2081 and P2041 based systems with a number of i2c and smb=
us
devices. Also this time I included a few iterations of module insert/remo=
ve
which would have caught the earlier errors.

Chris Packham (4):
  i2c: mpc: use device managed APIs
  i2c: mpc: Interrupt driven transfer
  i2c: mpc: Remove redundant NULL check
  MAINTAINERS: Add Chris Packham as FREESCALE MPC I2C maintainer

 MAINTAINERS                  |   7 +
 drivers/i2c/busses/i2c-mpc.c | 488 +++++++++++++++++++----------------
 2 files changed, 267 insertions(+), 228 deletions(-)

--=20
2.31.1

