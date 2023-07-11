Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C828374E662
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jul 2023 07:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjGKFly (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jul 2023 01:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjGKFlx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jul 2023 01:41:53 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7399BC
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jul 2023 22:41:51 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 434A82C01EE;
        Tue, 11 Jul 2023 17:41:49 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1689054109;
        bh=MAGuoTaVLhD4fssZrG/3+NaVNV6pnk69EI8BsLAtVDU=;
        h=From:To:Cc:Subject:Date:From;
        b=yxMJ1In5R9vdyKCD1q/fwnH8FNf7bhhRYG6m0aQ+JzsSdmOl/xQLN80FF2yJb3dWu
         Jpb5SuFuznPCDCWon7G8AujqJpSK3CmCZUwofxYJ/Dqxx6c2ExWVoYEkEEv+hbPUD6
         c0PvYdab6Ii/LFBp+MpVHbl/xGLwK3ZSkjqOgEgxZps90h3kE5T7l0teMVGs9+AkVR
         fucRyRv9hzwatEHi6cBN2HRiyB+zY5FiM5XYadWIT4q7H/kI+w/crhYcB1DvvQfNay
         mdlXfnGmLBys9b4s/Ic4bndqN16L8+5GxwXwfH3G0u9wAW2ne7D2X82XEiVlNL7m4O
         VfYkXm73fo3bg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B64aceb9d0000>; Tue, 11 Jul 2023 17:41:49 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.26])
        by pat.atlnz.lc (Postfix) with ESMTP id 241A513EC4E;
        Tue, 11 Jul 2023 17:41:49 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
        id 215A72011EE; Tue, 11 Jul 2023 17:41:49 +1200 (NZST)
From:   Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To:     rric@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris.Packham@alliedtelesis.co.nz,
        Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH] i2c:thunderx:Add disabled node check
Date:   Tue, 11 Jul 2023 17:41:46 +1200
Message-ID: <20230711054147.506437-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=MPIeZ/Rl c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=ws7JD89P4LkA:10 a=zF_DWZWtYjnfS4iBiJoA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add check for disabled nodes. These nodes should not be probed. Can
result in logging for HW which is not present.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busse=
s/i2c-thunderx-pcidrv.c
index a77cd86fe75e..7fcdb237076a 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -158,6 +158,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pde=
v,
 	struct octeon_i2c *i2c;
 	int ret;
=20
+	/* Ignore disabled nodes. */
+	if (!of_device_is_available(pdev->dev.of_node))
+		return 0;
+
 	i2c =3D devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
--=20
2.41.0

