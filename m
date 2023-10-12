Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA887C639D
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 06:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbjJLEBb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 00:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235349AbjJLEBS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 00:01:18 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811AE2134
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 20:58:42 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 91E552C0733;
        Thu, 12 Oct 2023 16:58:39 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697083119;
        bh=QTisau/dBXmjc0VL/EBndGcTKvPJxnrSBT9R6bF6Gb0=;
        h=From:To:Cc:Subject:Date:From;
        b=nebdjy1jtxDJndkrDm1I7kJc/HkdAwM41bUvAYklAOo+HOgb+raSOaoQu/Cgw1kzh
         Do5ulE6ne5SaqxfUIB0zfoPkcsSCwcA6zY0LBvbEgNxmkXu4z04xodbM7X7+Y+SDQQ
         yunx4BpsPiE6lwYyDWwxGzGjnZia6pH/W5HFiNlwdSgs2L03dPYzBglrBreGosiPtL
         Nc/7gy3Vwln5FpZhysymKvQQsMhhiimzKGr9f2tIsi7iczjkH8miVwLRQapu6b0/e0
         ZbvtpTvOVcwVvVqkEDgmKNDOGy4e+gzfcdTPI486FMdvwXTWyva5uTCj8hFPyz0pEl
         LoVvZv9LBHQqg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65276eef0000>; Thu, 12 Oct 2023 16:58:39 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 519D813ED0C;
        Thu, 12 Oct 2023 16:58:39 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 4D32D280E87; Thu, 12 Oct 2023 16:58:39 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/2] i2c: mv64xxx: reset-gpios
Date:   Thu, 12 Oct 2023 16:58:36 +1300
Message-ID: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=X8ZXEbYnt8eKSyduVAIA:9
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

 .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml  |  3 +++
 drivers/i2c/busses/i2c-mv64xxx.c                      | 11 +++++++++++
 2 files changed, 14 insertions(+)

--=20
2.42.0

