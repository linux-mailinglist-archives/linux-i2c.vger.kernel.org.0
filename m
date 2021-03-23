Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653053456D0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 05:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCWEe1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 00:34:27 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39006 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhCWEdv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 00:33:51 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B47C58365A;
        Tue, 23 Mar 2021 17:33:47 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616474027;
        bh=WNE1jzoHayASoTWR0UMgInhsS9UPRGat+farEX1wxCQ=;
        h=From:To:Cc:Subject:Date;
        b=slF1YQhtAtAT4XMs4NHGtL/OY5K4dl79AMFg3D5LOUNyD/wfMYRs7Xg3++71cXEpZ
         Xt3IX1EsppZJUNVjn2gi0QAdt2Ul+gzGW0/6Nf0pjsWHDvyOV/G5FIYD+Qcuaftiyo
         cdQdaiayrv0P5c570ksckBTAVq6g3EzvFmW/kabbzEfbEoemhxAVbeQ+yoEX/36DXW
         sAQFWNNVL/WJe434iVZQgNwiRHzPZUKf+gALeHtPr90c+nuqIEmS3V7w9TAMZ/WIsy
         oRVMp9OIYzkdHRndUMkBha2DnSFORh7/c75vLrnIRG+aJOQE0c/MWACQ2V3Vwux4YB
         eS3RS7W1yZjPw==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60596fab0000>; Tue, 23 Mar 2021 17:33:47 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 212F713EED4;
        Tue, 23 Mar 2021 17:34:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9207128409A; Tue, 23 Mar 2021 17:33:47 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/6] i2c: mpc: Refactor to improve responsiveness
Date:   Tue, 23 Mar 2021 17:33:25 +1300
Message-Id: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=ao_VAR3SBByvQXh7kj8A:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "meat" of this series is in the last patch which is the change that
actually starts making use of the interrupts to drive a state machine.
The dt-bindings patches can probably go in at any time. The rest of the
series isn't dependent on them.

I've tested it on a T2081 based system with a number of i2c and smbus
devices.  Its the end of my work day so I figured I'd get this out now
but I'll do some more testing on a P2041 board and a few different i2c
devices tomorrow.

Chris Packham (6):
  dt-bindings: i2c-mpc: Document interrupt property as required
  dt-bindings: i2c: convert i2c-mpc to json-schema
  i2c: mpc: Make use of i2c_recover_bus()
  i2c: mpc: make interrupt mandatory and remove polling code
  i2c: mpc: use device managed APIs
  i2c: mpc: Interrupt driven transfer

 .../devicetree/bindings/i2c/i2c-mpc.txt       |  62 ---
 .../devicetree/bindings/i2c/i2c-mpc.yaml      |  99 ++++
 drivers/i2c/busses/i2c-mpc.c                  | 513 ++++++++++--------
 3 files changed, 373 insertions(+), 301 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml

--=20
2.30.2

