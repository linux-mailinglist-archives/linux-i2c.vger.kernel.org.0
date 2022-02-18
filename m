Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF6A4BBA23
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Feb 2022 14:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbiBRNeN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Feb 2022 08:34:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiBRNeN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Feb 2022 08:34:13 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE003632F
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 05:33:56 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id d23so5421337lfv.13
        for <linux-i2c@vger.kernel.org>; Fri, 18 Feb 2022 05:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yBG3V/eig43ynBk5iiTnHrDbLKGL4LoM/wYLee8FQvQ=;
        b=b9UM2dxgLaVQjKx09mKUZcKnQ5FmD1WUxECvpsjrYzpnOTEWmIRvSotU7JPHAeWA+t
         ctqIRJPNPYxj8kpJL1wHF5zV4jXzna1/R3759oSi4h8mV2EkRRTPpgi8/kJnUbaHRLyy
         cA26oMJwDiFAPyc7TVPD4cFXPMNuKZA+PcWAivtkoByEGXANmZwJd4W6mKGmiBShWPP9
         gemCGNvATWt7Z+n/1T+IE4JXSozCNgVoHzPqB00b/rJX5fGjoGbAGDvW/EjluUBXdziz
         FtOn2cMqkFi18KLo+LQ6hrz6FnGP4O766oLd5Y/W1VntzVEmAf00mpiKV7ToAhCV0LCi
         Wwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yBG3V/eig43ynBk5iiTnHrDbLKGL4LoM/wYLee8FQvQ=;
        b=N3MQkFnZ5UyhSqXJ9ZHDXJTcoyWXIOo2mfpFEanDj0cTDrm6Hy/vOsHll9VWiV436+
         w3PkzoGioYB9+fsER+dgJuKfwGxbkwmTNQ9MEN7x8i1VhLICbpVoFRI2tp+1/Uw+t0jx
         SJTI97Ue3hbP5WcdLOHZcdtJehJ7uOX86oTsrILJup3N6LyEd48Xau5VOjnlz9OjfPcu
         ZQPJzpVXJC2eklijQgYbyIk0zsCJYUUP2WWtnyd+8MQIOOaszV04R5crig8NPMLqlMZE
         iqxB9cF5sZCtU9kzdKAAsqEdSmRr5JN9AJXrrPserLqSzbC5F+ek10BVvaluc+KMqQRv
         IW3A==
X-Gm-Message-State: AOAM532xOaxfg5FEO3JNcCDn7t46YxK5941P/TzBEL7RZf9wrnIiXFcN
        xwQpSUpSUIxPWI0zB3f5Fg2+PQ==
X-Google-Smtp-Source: ABdhPJwoar327tKUyukECeIPFAPFswuL2KC74HU5i3o7bgqnlFODh3dymJ3/E0TcDl01f3KZJueEqg==
X-Received: by 2002:a05:6512:39d5:b0:439:750e:4541 with SMTP id k21-20020a05651239d500b00439750e4541mr5278628lfu.497.1645191234732;
        Fri, 18 Feb 2022 05:33:54 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id h26sm32256lfp.217.2022.02.18.05.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 05:33:54 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, rrangel@chromium.org, upstream@semihalf.com,
        jsd@semihalf.com, kernel test robot <lkp@intel.com>
Subject: [PATCH -next] i2c: designware: Fix improper usage of readl
Date:   Fri, 18 Feb 2022 14:33:48 +0100
Message-Id: <20220218133348.628962-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Kernel test robot reported incorrect type in argument 1 of readl(), but
more importantly it brought attention that MMIO accessor shouldn't be
used in this case, since req->hdr.status is part of a command-response
buffer in system memory.

Since its value may be altered by PSP outside of the scope of current
thread (somehow similar to IRQ handler case), we need to use
READ_ONCE() to ensure compiler won't optimize this call.

Fix also 'status' variable type to reflect that corresponding field in
command-response buffer is platform-independent u32.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 752e0024db03..c64e459afb5c 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -160,9 +160,10 @@ static int psp_send_cmd(struct psp_i2c_req *req)
 /* Helper to verify status returned by PSP */
 static int check_i2c_req_sts(struct psp_i2c_req *req)
 {
-	int status;
+	u32 status;
 
-	status = readl(&req->hdr.status);
+	/* Status field in command-response buffer is updated by PSP */
+	status = READ_ONCE(req->hdr.status);
 
 	switch (status) {
 	case PSP_I2C_REQ_STS_OK:
-- 
2.35.1.265.g69c8d7142f-goog

