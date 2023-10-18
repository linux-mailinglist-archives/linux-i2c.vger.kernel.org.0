Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574F17CE9B9
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 23:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjJRVIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Oct 2023 17:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbjJRVIR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 17:08:17 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40BE12B
        for <linux-i2c@vger.kernel.org>; Wed, 18 Oct 2023 14:08:13 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1E27C2C04A8;
        Thu, 19 Oct 2023 10:08:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697663290;
        bh=+Mz6a/fjJta9Jhb4FwxyqF6StNC2MRU2k5KJDvqxmcs=;
        h=From:To:Cc:Subject:Date:From;
        b=tfsi7lUX3bS3Vx9lK9EMc4owTa0mi5GmxgHT9PwWkhBEe+oxg18cs9Px02Sm88+sx
         D+Luwcddh4Ah8wOAoY8ua1y7WckH1TVz2C/EzsDu06ODhtFScdq2M5Ebl3id6odG2m
         QlsyfULaGgeDCVoQjTynFnVAV8CKuk7UJqDPIwvLcTu/LMus4xo9/S6XRZWffeJhL3
         aafgQYIV1eQ8IseSJy/eCcOfAOyHIJKLr+2LWGrSca55UbFx/Gj1c2AgpcnUCGQP+x
         gKMP8W2kFoNpycDEmkQ4/sh2txps8DiOAeBKDnG2Ppb0SGxZEP7SZxonqJjBedNj1D
         vP9fOuxLpg4CA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653049390000>; Thu, 19 Oct 2023 10:08:09 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 581F313ECD2;
        Thu, 19 Oct 2023 10:08:09 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 544BB2808BA; Thu, 19 Oct 2023 10:08:09 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/2] i2c: mv64xxx: reset-gpios
Date:   Thu, 19 Oct 2023 10:08:03 +1300
Message-ID: <20231018210805.1569987-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=DesYK6339MVhjp1_Vu4A:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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

 .../bindings/i2c/marvell,mv64xxx-i2c.yaml         | 10 ++++++++++
 drivers/i2c/busses/i2c-mv64xxx.c                  | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

--=20
2.42.0

