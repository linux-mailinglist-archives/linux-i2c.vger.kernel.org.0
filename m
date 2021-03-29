Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5A034D7C3
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 21:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhC2TG0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 15:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbhC2TGO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 15:06:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B9CC061574;
        Mon, 29 Mar 2021 12:06:14 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s17so17137289ljc.5;
        Mon, 29 Mar 2021 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aKWS0aU8jyoXVgDBn/hCQzo9I1d/OWR4aJoN4goeeos=;
        b=Oa4FP0SkefTa6Se+tHek4r1Tw7YP/bZXJtm+tUdMjsEONH7j2675FgEABAHnpht99t
         L47fRuaCue2u7tQvT7rAFZQj/SFzq+nHirWGZxFhB1gdFykuEfM45mjgIFNFJaUc5pDE
         f8UcmCJAUS5fWwIuClsm70MQb7ZWP7DYMI3Mg+cWuuBummVx4b76pruYaPi3EEmzXL0W
         NgeXpo9rQEap3xj73HZRR3qCyrUQ0NRECse8GJwuccgZZtTGolcItFA3pnT8m84qd6Pi
         MskaIwfwBlXZTir+z5prJav1gEGI1wTTuilfZHkcmqfrFossleuIu04SVGtSP64ZAPXR
         pDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aKWS0aU8jyoXVgDBn/hCQzo9I1d/OWR4aJoN4goeeos=;
        b=rdjhZyStjScPmdFBaUr/gfdtmXy9o/rFpzDAj9ouoblDQCeoQTDsSUbFbE2AOtm1vl
         Va936QWlH7f1DQbRhPB1V+HhNIDALhZrpFhMjp4b9l8PTisEcmRKMjKMO8SdWeSVurP6
         HdHqmUxiSo1r+6YTi5csoMjMRcGgrENuM2RBMCmuxJgiW0cuk7BjWUS1OZUCrkkopvr4
         vxN7nR0hkAXwY3nmbSKWm/JWQtJoarpneINlKp7Nl2hEqtZgQXTh7TdZTpwsa5cNm8E9
         kkXPW2ByXq0Hn7nvxzcIJ1RDXLOHzs9qgmwOTlPsNom86dhXS4XBP48AUn2656H5+Xn+
         mKWg==
X-Gm-Message-State: AOAM532I69a9mdwQtpcwqcqIVtw/7D/RVwvhIEIzDJgGJhjA9VDRO+YQ
        J55WdYrS8p6v8OP1EC7ZrNo=
X-Google-Smtp-Source: ABdhPJwCrVtJxeAMADz0GR72FOIGRRXOBvgo6/LtznwU9doNf9IxAn1kdD0aIfGeq4I40/eM4M0SWA==
X-Received: by 2002:a05:651c:212a:: with SMTP id a42mr18299065ljq.505.1617044772740;
        Mon, 29 Mar 2021 12:06:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id o139sm1923041lfa.129.2021.03.29.12.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:06:12 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: tegra: Improve handling of i2c_recover_bus()
Date:   Mon, 29 Mar 2021 22:05:46 +0300
Message-Id: <20210329190546.24869-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c_recover_bus() returns -EOPNOTSUPP if bus recovery isn't wired up,
which the case for older Tegra SoCs at the moment. This error code is then
propagated to I2C client and might be confusing, thus return -EIO instead.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c883044715f3..cb5e3cc96160 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1196,8 +1196,14 @@ static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
 
 	/* start recovery upon arbitration loss in single master mode */
 	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
-		if (!i2c_dev->multimaster_mode)
-			return i2c_recover_bus(&i2c_dev->adapter);
+		if (!i2c_dev->multimaster_mode) {
+			int err = i2c_recover_bus(&i2c_dev->adapter);
+
+			if (err == -EOPNOTSUPP)
+				return -EIO;
+
+			return err;
+		}
 
 		return -EAGAIN;
 	}
-- 
2.30.2

