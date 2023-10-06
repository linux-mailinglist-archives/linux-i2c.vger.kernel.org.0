Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C767BBA89
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 16:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbjJFOlj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 10:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbjJFOlc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 10:41:32 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC835CE
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 07:41:27 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231006144124euoutp01047b4b48731673485ab1bcc30f6b62c5~Li7K3rPu_1590615906euoutp01Q
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 14:41:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231006144124euoutp01047b4b48731673485ab1bcc30f6b62c5~Li7K3rPu_1590615906euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1696603284;
        bh=Dh7echwJPUUeAbJ+0c1vCQ3HcyHKHNDzK9iXWzkT8xU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=kAvcjwDbQ8uyqjjOyaq2bcmYF8VAs9JyFAqkdGX48sD9469FZrTRQYrc8lnhb9uUf
         X2iDRyU4Ks8XP115ruZpM0GjkncrcL4qUJuh1fR+Bx2qYy+24LqKhSJ8l2F96sYgSk
         kCuyWY5WIhOHGSaGVot22skqVt6k2mqi09C9h5Ho=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231006144124eucas1p2ec745c7967b0a8c29d3e6cd7aeadd2ac~Li7Kk8e9F1761517615eucas1p2A;
        Fri,  6 Oct 2023 14:41:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 24.8C.11320.39C10256; Fri,  6
        Oct 2023 15:41:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c~Li7KOyOMx0476904769eucas1p19;
        Fri,  6 Oct 2023 14:41:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231006144123eusmtrp1acdc5ca3ce8295dd231945fafd843a51~Li7KOCMTM2739727397eusmtrp1s;
        Fri,  6 Oct 2023 14:41:23 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-1a-65201c937127
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.1B.25043.39C10256; Fri,  6
        Oct 2023 15:41:23 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231006144122eusmtip2e8ec28b6b97e8170c2297b1b8331364a~Li7Jn79bK1471614716eusmtip2p;
        Fri,  6 Oct 2023 14:41:22 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: brcmstb: Add support for atomic transfers
Date:   Fri,  6 Oct 2023 16:41:17 +0200
Message-Id: <20231006144117.4079796-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djP87qTZRRSDQ7esrK4/7WD0WJt71EW
        i3Xb7jFb7N5wmMli0+NrrBYdf78wWlzeNYfNYu2Ru+wWd/fPZXTg9Jh1/yybx6ZVnWwem5fU
        e/RtWcXo8XmTXABrFJdNSmpOZllqkb5dAlfGh4dX2Qq2C1Vc/7CWqYGxj7+LkYNDQsBEYvIZ
        li5GLg4hgRWMEgcPt7JBOF8YJSatnMsK4XxmlNi0/QxzFyMnWMeu09MZQWwhgeWMEh8WO8J1
        nLr/iR0kwSZgKNH1tosNxBYRSJb4+fE32FhmgQVMEjff32QD2S0sYC+xo9MMpIZFQFVi+cfn
        rCA2L1B4y/Q7rBDL5CX2HzzLDBEXlDg58wkLiM0MFG/eOpsZZKaEwEoOidPH1kFd5yKx9uUK
        RghbWOLV8S3sELaMxOnJPSwQDe2MEgt+32eCcCYwSjQ8vwXVYS1x59wvsOuYBTQl1u/Shwg7
        Svy5f4kNEmB8EjfeCkIcwScxadt0Zogwr0RHmxBEtZrErOPr4NYevHAJqsRDov2mLiTcYiXW
        Ll/IOoFRYRaSz2Yh+WwWwgkLGJlXMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBKae0/+O
        f9nBuPzVR71DjEwcjIcYJTiYlUR40xtkUoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzqqbIpwoJ
        pCeWpGanphakFsFkmTg4pRqYpB841Pl3TdpbvdssueO+isfumfWv53zmmFR5v9vNNXiGzsXC
        8g0Nb/je1ugbS/fqflecsDP88afHOk5q9h8OL39w3kxYp6Jo1QYvi6c7zf9V866rYj2nYXzl
        8Ol/rm0ZseF9XVPOZL1wDnsy68Np6Qv1Jmd7I3z+zbAMvBnVJPGi/ufGw9WnhXObRFTzti9S
        WF33fGnr3ayFMfs0Kz5H+mj9vRczg2Vlword+2O2PloQFCjRqvr4ZdjJez82bhfieaDQY3vY
        eL23Jndmz8/Dh7c+Nw48L5bwZIK2dtkjmfx6/XDLeYWP+WcL3AkN3Wektv7RL195rcOyUxcs
        LX1cMvsKT5EY16vD56VTp/SdVGIpzkg01GIuKk4EACKBNCusAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsVy+t/xe7qTZRRSDc5uVLC4/7WD0WJt71EW
        i3Xb7jFb7N5wmMli0+NrrBYdf78wWlzeNYfNYu2Ru+wWd/fPZXTg9Jh1/yybx6ZVnWwem5fU
        e/RtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl7Gh4dX2Qq2C1Vc/7CWqYGxj7+LkZNDQsBEYtfp6YxdjFwcQgJLGSUmrpvMDpGQ
        kTg5rYEVwhaW+HOtiw2i6BOjxKdH3YwgCTYBQ4mutyAJDg4RgVSJHRsUQWqYBRYxSdz41MEK
        EhcWsJfY0WkGUs4ioCqx/ONzsJm8QOEt0+9AzZeX2H/wLDNEXFDi5MwnLCA2M1C8eets5gmM
        fLOQpGYhSS1gZFrFKJJaWpybnltspFecmFtcmpeul5yfu4kRGPTbjv3csoNx5auPeocYmTgY
        DzFKcDArifCmN8ikCvGmJFZWpRblxxeV5qQWH2I0BbpvIrOUaHI+MO7ySuINzQxMDU3MLA1M
        Lc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqYFj6fw9NxU493jpH746vVlzb8N3W4+vQv
        k3C2+Mmk7YqcMVwcc9Z4Lcl1YfRY05PNkPlE8Abz0u1fjNmcapOe6Whkvp254NzkGN/7LC1T
        njceX606f7thjky00i/zFfWCxV8zeKa1Pft+d/MJK9+/ay/s+NZ/ex2XWFX9AQW9DbNUbNTt
        btu+8jLk0pypL+i2Ne0Tk3p2DbP72zUuVTLJ30olQlc3eyt8Mr10Tkxsxmoup/kV628t2n9a
        4U5OfeCJ6sjXq/TCnGaz9ph+aXdTXLH7gQ7Xwv8XNnIl5EmpVV9L3LKfvfHxeU+LmMLAqiD3
        yylvVJUkHfzM60UnFfU/7K9TTHfjy+LUDTTdbK3EUpyRaKjFXFScCADgiVurAwMAAA==
X-CMS-MailID: 20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c
References: <CGME20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c@eucas1p1.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for atomic transfers using polling mode with interrupts
intentionally disabled to get rid of the warning introduced by commit
63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
during system reboot and power-off.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index acee76732544..38f276c99193 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -160,6 +160,7 @@ struct brcmstb_i2c_dev {
 	struct completion done;
 	u32 clk_freq_hz;
 	int data_regsz;
+	bool atomic;
 };
 
 /* register accessors for both be and le cpu arch */
@@ -240,7 +241,7 @@ static int brcmstb_i2c_wait_for_completion(struct brcmstb_i2c_dev *dev)
 	int ret = 0;
 	unsigned long timeout = msecs_to_jiffies(I2C_TIMEOUT);
 
-	if (dev->irq >= 0) {
+	if (dev->irq >= 0 && !dev->atomic) {
 		if (!wait_for_completion_timeout(&dev->done, timeout))
 			ret = -ETIMEDOUT;
 	} else {
@@ -287,7 +288,7 @@ static int brcmstb_send_i2c_cmd(struct brcmstb_i2c_dev *dev,
 		return rc;
 
 	/* only if we are in interrupt mode */
-	if (dev->irq >= 0)
+	if (dev->irq >= 0 && !dev->atomic)
 		reinit_completion(&dev->done);
 
 	/* enable BSC CTL interrupt line */
@@ -520,6 +521,23 @@ static int brcmstb_i2c_xfer(struct i2c_adapter *adapter,
 
 }
 
+static int brcmstb_i2c_xfer_atomic(struct i2c_adapter *adapter,
+				   struct i2c_msg msgs[], int num)
+{
+	struct brcmstb_i2c_dev *dev = i2c_get_adapdata(adapter);
+	int ret;
+
+	if (dev->irq >= 0)
+		disable_irq(dev->irq);
+	dev->atomic = true;
+	ret = brcmstb_i2c_xfer(adapter, msgs, num);
+	dev->atomic = false;
+	if (dev->irq >= 0)
+		enable_irq(dev->irq);
+
+	return ret;
+}
+
 static u32 brcmstb_i2c_functionality(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_10BIT_ADDR
@@ -528,6 +546,7 @@ static u32 brcmstb_i2c_functionality(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm brcmstb_i2c_algo = {
 	.master_xfer = brcmstb_i2c_xfer,
+	.master_xfer_atomic = brcmstb_i2c_xfer_atomic,
 	.functionality = brcmstb_i2c_functionality,
 };
 
-- 
2.34.1

