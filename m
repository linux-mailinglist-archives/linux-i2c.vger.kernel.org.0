Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5DB87AF775
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 02:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjI0AjE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 20:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbjI0AhE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 20:37:04 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B931BF5
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 16:48:10 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4CCF52C0526;
        Wed, 27 Sep 2023 12:48:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1695772088;
        bh=b75WKuP+3dUziG2rTJfVWwAGvRIdFNM7vfhk4HCV9Ek=;
        h=From:To:Cc:Subject:Date:From;
        b=ju6VS0VBNlA1OUCc9HW5b0DAexJKmQJUYnFhhNMF+Rp36liw+KMN3ZIWs4KEb/xdC
         iQD0F4yAH5AYvbrBfDYjoeM8xIO/y+7ohWn6prMXKnQIWopLmCfNZMx4UeBZuVpA5L
         oZ/ncGAgHQJXZ8nsDmkUo3gGhfR93zkArAr4Pl7tgC19qa1YGFi3d3yH93ov6XDxP2
         BOl9/IPGsS+/l291J5YuZK/dtctXezls4cR5ArDeJCj1vqTvnlwIoHjrrOVy57VnkC
         49gFQgGMdy3zxnF6+cXo13zd5HMjHIOFeXBGCMxJTZhj5Ke4wx3yY7ojEjuEFYN1BJ
         VCYT5HswjG4MQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65136db70000>; Wed, 27 Sep 2023 12:48:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id E8CC713EE32;
        Wed, 27 Sep 2023 12:48:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id E563328160F; Wed, 27 Sep 2023 12:48:07 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, pierre.gondois@arm.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/3] i2c: mv64xxx: Support for I2C unstuck
Date:   Wed, 27 Sep 2023 12:47:58 +1300
Message-ID: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=fOpHIqSe c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=zNV7Rl7Rt7sA:10 a=N-MdeIapwvzwuhZPf1QA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some newer Marvell SoCs natively support a recovery mechanisim. This can =
be
used as an alternative to the generic pinctrl/GPIO recovery mechanism use=
d on
the older SoCs.

Chris Packham (3):
  dt-bindings: i2c: mv64xxx: update bindings for unstuck register
  arm64: dts: marvell: AC5: use I2C unstuck function
  i2c: mv64xxx: add support for FSM based recovery

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |  5 +-
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 14 ++--
 drivers/i2c/busses/i2c-mv64xxx.c              | 71 +++++++++++++++++--
 3 files changed, 75 insertions(+), 15 deletions(-)

--=20
2.42.0

