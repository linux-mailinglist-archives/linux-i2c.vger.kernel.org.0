Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB45E37B0AD
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 23:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhEKVWG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 17:22:06 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48230 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhEKVWF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 17:22:05 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 56D03806B6;
        Wed, 12 May 2021 09:20:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620768055;
        bh=4dX9P5KDi1fr7Qs6oEsdntuC7ZXWJh3Zpfa0sqNoOyE=;
        h=From:To:Cc:Subject:Date;
        b=DGwIX2QlPRWdTgox6EGCq5hGy1DXVMAVwGsn2RUVpBJ2m6SOxU/pcoYn9mTC40vPu
         rZSRM/nAqUSOHZqt/cwm637WeBoY2B/CpXpFZfKh+MbHohLImQ1PCxAip3q+CMRqPj
         e5zPORpqbarLcu6pmYS7CtZOkHRks53Z779oXh/lF66HyoNXC5b/c/H4FsOtwrkODL
         YG17OaO3nK6lusWUqTe07frW4aATZZX2uLAx1pWgFivxBmPpxZzFyPu70Rba2kBFWW
         e9jUC7A/8TCgp9nIZ3kwgpu71aFIG7jeRHcbvkqyxHiU7j3PwgLZyEBXkCu1zR9zJm
         Hmn1dlTnLxFtA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609af5370000>; Wed, 12 May 2021 09:20:55 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 3A08513ECA6;
        Wed, 12 May 2021 09:20:55 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 34DA3283A61; Wed, 12 May 2021 09:20:55 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Date:   Wed, 12 May 2021 09:20:48 +1200
Message-Id: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=LMdnaIF9TloyW3KOcEsA:9
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The P2040/P2041 has an erratum where the i2c recovery scheme
documented in the reference manual (and currently implemented
in the i2c-mpc.c driver) does not work. The errata document
provides an alternative that does work. This series implements
that alternative and uses a property in the devicetree to
decide when the alternative mechanism is needed.

Chris Packham (4):
  dt-bindings: i2c: mpc: Add fsl,i2c-erratum-a004447 flag
  powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P2041 i2c
    controllers
  powerpc/fsl: set fsl,i2c-erratum-a004447 flag for P1010 i2c
    controllers
  i2c: mpc: implement erratum A-004447 workaround

 .../devicetree/bindings/i2c/i2c-mpc.yaml      |  7 ++
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi   |  8 ++
 arch/powerpc/boot/dts/fsl/p2041si-post.dtsi   | 16 ++++
 drivers/i2c/busses/i2c-mpc.c                  | 81 ++++++++++++++++++-
 4 files changed, 110 insertions(+), 2 deletions(-)

--=20
2.31.1

