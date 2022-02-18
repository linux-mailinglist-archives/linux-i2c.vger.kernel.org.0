Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288A74BB73C
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 11:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbiBRKtb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 05:49:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbiBRKta (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 05:49:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B049832ECB;
        Fri, 18 Feb 2022 02:49:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 55337B825B2;
        Fri, 18 Feb 2022 10:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E583C340E9;
        Fri, 18 Feb 2022 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645181352;
        bh=09jVfJD/ZOKP6xLukdsYO88AJaBqOJ3IWA3/7W3txF8=;
        h=From:To:Cc:Subject:Date:From;
        b=RIldLFF2wMOvxhQ1i1T8ZEwOAbgYxw6+GXpLlcAS3BWpC5TIl+L9C0YKSTcN2d76w
         jx+3YCpZVGfV4q+Ep0R7nE0a84FbzkoUuxWAWJSCO0vfdcTdh70bDLBPt7HaciJuCQ
         Qkb1+LsiWzZ/mLaInal3YX6aqmPMvnNDOSTRhj90Yj7fFfN4N9a7OA1BMYzHGAqxc2
         m9HpEA1CJIwV7vgKlj6WXMnaXy/8WbiQXMSbjFdMyTCJeH7I5DmIv+QznfASVvEN06
         f/vwYCQ1fVBeAA03ijnKGwYXGYr+6KuZfNrqSSWi6k07ofcnGw1UK/TEqvUHZTS74E
         MIM+Ldz5kP+vg==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] MAINTAINERS: remove duplicate entry for i2c-qcom-geni
Date:   Fri, 18 Feb 2022 11:49:04 +0100
Message-Id: <20220218104904.14405-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver is already covered in the ARM/QUALCOMM section. Also, Akash
Asthana's email bounces meanwhile and Mukesh Savaliya has never
responded to mails regarding this driver.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 MAINTAINERS | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..f0485f61295d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15972,14 +15972,6 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.txt
 F:	drivers/misc/fastrpc.c
 F:	include/uapi/misc/fastrpc.h
 
-QUALCOMM GENERIC INTERFACE I2C DRIVER
-M:	Akash Asthana <akashast@codeaurora.org>
-M:	Mukesh Savaliya <msavaliy@codeaurora.org>
-L:	linux-i2c@vger.kernel.org
-L:	linux-arm-msm@vger.kernel.org
-S:	Supported
-F:	drivers/i2c/busses/i2c-qcom-geni.c
-
 QUALCOMM HEXAGON ARCHITECTURE
 M:	Brian Cain <bcain@codeaurora.org>
 L:	linux-hexagon@vger.kernel.org
-- 
2.30.2

