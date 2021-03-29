Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAEBF34C151
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 03:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhC2Bwl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Mar 2021 21:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhC2BwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Mar 2021 21:52:14 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68EFC0613B5
        for <linux-i2c@vger.kernel.org>; Sun, 28 Mar 2021 18:52:13 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 184D58364E;
        Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616982728;
        bh=1nLQSp7vbLAvlN7Fzi+XfVrJA24mf4rcWMaEhiGM8Tc=;
        h=From:To:Cc:Subject:Date;
        b=2gKB76rC4hhu4nZ91dmKLBUMRpKgiFJLWN89EWmb7ZGOP6hUCzAQnm238BfH1cA66
         5u/BFfydtpLy0Pl4fa2Ow2WPuM8v1FjkwQxkC0Kg7bypj+xmf0ElJlnb260JWrofsv
         gp0zsessYn6dL9U/4lG70maIpUbH7pzBzl2gJPZPQakGMZddaNbMGJrOdIQwl8Sk61
         CgfplJbdL3es78aTjhW+QbI8cuh/q7y1E4OmvjdlJicTz4HRaWWC2L6nKVlx9erZgW
         zhLHEhi05NWc7iP7t+4JR6XgSCpaNDNbSrr+nU1Ztb3TsR2Bpg7fdsDbNjUmQu7vzK
         ZzosK5vOFb6aw==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B606132c70000>; Mon, 29 Mar 2021 14:52:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 4D7B213EED4;
        Mon, 29 Mar 2021 14:52:25 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 73096284081; Mon, 29 Mar 2021 14:52:08 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/6] i2c: mpc: Refactor to improve responsiveness
Date:   Mon, 29 Mar 2021 14:52:00 +1300
Message-Id: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=peonOtBRVIPhQsqlob0A:9 a=fCgQI5UlmZDRPDxm0A3o:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "meat" of this series is in the last patch which is the change that
actually starts making use of the interrupts to drive a state machine.
The dt-bindings patches can probably go in at any time, the rest of the
series isn't dependent on them.

I've tested on T2081 and P2041 based systems with a number of i2c and smb=
us
devices.

Chris Packham (6):
  dt-bindings: i2c-mpc: Document interrupt property as required
  dt-bindings: i2c: convert i2c-mpc to json-schema
  i2c: mpc: Make use of i2c_recover_bus()
  i2c: mpc: make interrupt mandatory and remove polling code
  i2c: mpc: use device managed APIs
  i2c: mpc: Interrupt driven transfer

 .../devicetree/bindings/i2c/i2c-mpc.txt       |  62 ---
 .../devicetree/bindings/i2c/i2c-mpc.yaml      |  91 +++
 drivers/i2c/busses/i2c-mpc.c                  | 517 ++++++++++--------
 3 files changed, 369 insertions(+), 301 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml

--=20
2.31.0

