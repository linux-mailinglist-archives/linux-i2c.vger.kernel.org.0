Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA9D68C856
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 22:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjBFVNJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 16:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjBFVNI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 16:13:08 -0500
X-Greylist: delayed 563 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 06 Feb 2023 13:13:07 PST
Received: from qs51p00im-qukt01072701.me.com (qs51p00im-qukt01072701.me.com [17.57.155.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FAE6181
        for <linux-i2c@vger.kernel.org>; Mon,  6 Feb 2023 13:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1675717423; bh=nDqcwgYfwv4lTDUs/q+Zq23g/jcLqlPNBpJQ3yHg2Q8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=NkoYjk58L0yG9WuovJ3Pml7hfE1S+S3YHTS2jANnfYOXuhs9Os/Q+xhbWbyG5m8K5
         f8zvBWmnz9W9s0jF31rS0ov8ItRNA6EH45q6luWyZumMgppbJsehwgbjEXg+B8afUO
         C1q8BWOtX1IJsRKdSAAbS5ejM9tFsgmvgqvO7+EDyQZzI3MQgGoVftjvZVIKDPHydN
         U9hx2mJX1nNrD4HzMZgvjR1dJyNPqilMvjR7q5s03H42woEuJN+lpxES/NepLHicUa
         gFlEQ5WXBK80Rtzq+KfL/NoxnkEKNv9n5iRim0lzeg/ig9V1NKzrqZ6rK4dlZcGdyZ
         5qJmGngQnfGvw==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
        by qs51p00im-qukt01072701.me.com (Postfix) with ESMTPSA id 62B1315C0702;
        Mon,  6 Feb 2023 21:03:42 +0000 (UTC)
From:   Alain Volmat <avolmat@me.com>
To:     Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     Alain Volmat <avolmat@me.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: st: use pm_sleep_ptr to avoid ifdef CONFIG_PM_SLEEP
Date:   Mon,  6 Feb 2023 22:03:23 +0100
Message-Id: <20230206210324.65508-1-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bffMchFZif8_wUljSr6IvtqqwQ6FZjLq
X-Proofpoint-GUID: bffMchFZif8_wUljSr6IvtqqwQ6FZjLq
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-11=5F01:2022-01-11=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 bulkscore=0
 mlxlogscore=963 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2302060182
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rely on pm_sleep_ptr when setting the pm ops and get rid
of the ifdef CONFIG_PM_SLEEP around suspend/resume functions.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/i2c/busses/i2c-st.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 88482316d22a..f823913b75a6 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -740,7 +740,6 @@ static int st_i2c_xfer(struct i2c_adapter *i2c_adap,
 	return (ret < 0) ? ret : i;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_i2c_suspend(struct device *dev)
 {
 	struct st_i2c_dev *i2c_dev = dev_get_drvdata(dev);
@@ -762,11 +761,7 @@ static int st_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(st_i2c_pm, st_i2c_suspend, st_i2c_resume);
-#define ST_I2C_PM	(&st_i2c_pm)
-#else
-#define ST_I2C_PM	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(st_i2c_pm, st_i2c_suspend, st_i2c_resume);
 
 static u32 st_i2c_func(struct i2c_adapter *adap)
 {
@@ -901,7 +896,7 @@ static struct platform_driver st_i2c_driver = {
 	.driver = {
 		.name = "st-i2c",
 		.of_match_table = st_i2c_match,
-		.pm = ST_I2C_PM,
+		.pm = pm_sleep_ptr(&st_i2c_pm),
 	},
 	.probe = st_i2c_probe,
 	.remove = st_i2c_remove,
-- 
2.34.1

