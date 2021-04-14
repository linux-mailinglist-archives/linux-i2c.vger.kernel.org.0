Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A502035FDD0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 00:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbhDNWeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 18:34:02 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42371 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhDNWeB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 18:34:01 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D75EB806A8;
        Thu, 15 Apr 2021 10:33:37 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618439617;
        bh=7nc3TQcKPpfX1+s1yCS19CZYBLrQB6PiruQ4DSd6ViM=;
        h=From:To:Cc:Subject:Date;
        b=Mp19iBHK3KcJnseJuih7Q/KYE34k4Lt38jtZ+wuG6vBY2YFKOSiJZYtNlAHRCjKMD
         9r6tVyML7jGjQXOF2gGMGKkSHuYco0lQatNRQ0Hg+nZHWNcF85ovAnfncnutlyNwNs
         BVk9isY7TNjYRAvR5Bfi+PXgWcd1iTZ/vtO4oTlO49fjmm0xi37NnzOjHN+KaTA4FV
         Ch0R9BQuwimJlcT2okUnCo4oCLah+bYa6N34yu2CQ05Vf+GeCiHnEHMfBvj/ELnJVB
         oOQJXbXr1UqwV92MVqmMs093KKDk29tATGOYJo7nyTepA+XSVCpVygaC2OJodzRHVn
         j1BkrR+q7qzqQ==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60776dc10000>; Thu, 15 Apr 2021 10:33:37 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 5395E13EEED;
        Thu, 15 Apr 2021 10:33:58 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id ADFEB28945B; Thu, 15 Apr 2021 10:33:37 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 0/6] i2c: mpc: Refactor to improve responsiveness
Date:   Thu, 15 Apr 2021 10:33:19 +1200
Message-Id: <20210414223325.23352-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=Zw7mqUMjS5TGmT_OfjYA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I've tested on T2081 and P2041 based systems with a number of i2c and smb=
us
devices.

I've included some clean ups provided by Andy Shevchenko to make applying=
 the
series easier.

Andy Shevchenko (4):
  i2c: mpc: Use devm_clk_get_optional()
  i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
  i2c: mpc: Use device_get_match_data() helper
  i2c: mpc: Drop duplicate message from devm_platform_ioremap_resource()

Chris Packham (2):
  i2c: mpc: Interrupt driven transfer
  i2c: mpc: Update license and copyright

 drivers/i2c/busses/i2c-mpc.c | 492 +++++++++++++++++++----------------
 1 file changed, 262 insertions(+), 230 deletions(-)

--=20
2.31.1

