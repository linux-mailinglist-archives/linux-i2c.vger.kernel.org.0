Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB077C9D6B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 04:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjJPCfN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Oct 2023 22:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjJPCfN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Oct 2023 22:35:13 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77DFAB
        for <linux-i2c@vger.kernel.org>; Sun, 15 Oct 2023 19:35:10 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CF6982C02B1;
        Mon, 16 Oct 2023 15:35:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697423707;
        bh=zBG+CuGw9FYUhQemjMLXMJMGx16EyZ+OIwZq1kIZ090=;
        h=From:To:Cc:Subject:Date:From;
        b=tyByFnu99FMYbaUplyXg8d1BvpzWFvKafCXPJPoopajqvkPnOcm62+PDlhDju7yNT
         HYv6CSuvSs+YBsvcUTrxr7kLBC5Vq0+yZlnhbm82GJOYX0Hx/DlySyg94bYYtmdf1a
         OUKrKdKCou1ZJL/eM8p55HJu7u/Q014Gt86jdZrNcRhkld/niIKLoyWRyUtd44rdsr
         MzNSmktWS48y10KVpTUN3Et63HWghU4pbIG0S+IjsblUe+7VSqhYHGtSoaM1k5gfw7
         QsuCt1ro9BvAMjr/cayGwTlciri7oo4TeigVgn8U7w6bEADHAUx5VvlaouA0mhVG42
         bK4yeI/m9dUgw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B652ca15b0000>; Mon, 16 Oct 2023 15:35:07 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id AC79913EDA9;
        Mon, 16 Oct 2023 15:35:07 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id A8B0A2812ED; Mon, 16 Oct 2023 15:35:07 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] i2c: mv64xxx: reset-gpios
Date:   Mon, 16 Oct 2023 15:35:02 +1300
Message-ID: <20231016023504.3976746-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=DesYK6339MVhjp1_Vu4A:9
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

This series adds the ability to associate a gpio with an I2C bus so that
downstream devices can be brought out of reset when the host controller i=
s
probed.

Chris Packham (2):
  dt-bindings: i2c: mv64xxx: add reset-gpios property
  i2c: mv64xxx: add an optional reset-gpios property

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml         |  6 ++++++
 drivers/i2c/busses/i2c-mv64xxx.c                  | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

--=20
2.42.0

