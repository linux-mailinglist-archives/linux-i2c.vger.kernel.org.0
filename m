Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBD07D8D72
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 05:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234978AbjJ0DbR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 23:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbjJ0DbP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 23:31:15 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382B2D7
        for <linux-i2c@vger.kernel.org>; Thu, 26 Oct 2023 20:31:12 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3A5D72C022F;
        Fri, 27 Oct 2023 16:31:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698377469;
        bh=xgKqUtdtUsYc5O0patvFHSpIh77+RB+rIg5S8QxHll8=;
        h=From:To:Cc:Subject:Date:From;
        b=xBDqXEnFHuh5bj6pGINvEGVT2BdpgaDZwxXS2j+0XwMuPfjBMDVzuy87WjjvfGYkX
         JyHTR8YWPbnT+7DrFLn3I5Hx5TjFMEnJ/14iWrSqks6HvknFX/WIzYaxe+M8bHNNr8
         3TQyDrwjP5Wt8pmYk/DNbYEipdL1+V3t4B3e8AqbM67umRxg5DZqhdl+8helCD3dHb
         /QN4fD24bIrBQFvpuFBHhe4aKL5OrQcCv3GLEfzKd8nobSuI7M+FRvWmDEczj+kVMf
         2SvJyBCu1BHtTb/F8Snhb3zeHlisMXqUn6fPl/fuqpflXc1Nza2loVhfbgok+G/XVz
         rQluIqdCFWoLA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653b2efc0000>; Fri, 27 Oct 2023 16:31:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 5D37213EDA9;
        Fri, 27 Oct 2023 16:31:08 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 582ED280710; Fri, 27 Oct 2023 16:31:08 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 0/2] i2c: mv64xxx: bus-reset-gpios
Date:   Fri, 27 Oct 2023 16:31:02 +1300
Message-ID: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=9zhbcO609vZffKistegA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series adds the ability to associate a gpio with an I2C bus so that
downstream devices can be brought out of reset when the host controller i=
s
probed.

Chris Packham (2):
  dt-bindings: i2c: mv64xxx: add bus-reset-gpios property
  i2c: mv64xxx: add an optional bus-reset-gpios property

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml        | 10 ++++++++++
 drivers/i2c/busses/i2c-mv64xxx.c                 | 16 ++++++++++++++++
 2 files changed, 26 insertions(+)

--=20
2.42.0

