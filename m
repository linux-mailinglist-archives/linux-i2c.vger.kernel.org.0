Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C455E3C7D01
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 05:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237810AbhGNDmD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 23:42:03 -0400
Received: from mail-bn8nam12on2124.outbound.protection.outlook.com ([40.107.237.124]:57697
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237486AbhGNDlt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 23:41:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khMR6zdbGH1y/OKhIrSJaHDJzpHsZfmPiAP7RzUAhKnN5gq2jdbUnqtOwqawPhxl1rdgAKvbfqaH2ZK/1+lpP/0mY3dVD1oX8hZGhfTS+31pc04+LyYw1mJ0ZbQvWv3SkyKIzG97ZFZrkwL8rYRBtZg26CERfLozKPWP/xPBm++d4MbEkfo9XbXcrr7+5RE8R2Gzz90nDDioXkuO2hxV2E8MW+J6cKUninklmb4B/lQy5YYM6c4GNpvEjZ+Vn4CgWXuRM5JnkZn1Umvu93BaWJQdXWXzO4dFqZt8COQW0FBn0zOX0SsfG7DfmJbIwrfck71q7uwgLpXU2/9n/Yksdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tymMUGsrQcK/tzfSev+yeafsREDh/trq+pNu5acpsVY=;
 b=F2IsIpfuxCQqZ7A39LlPyBfdja+ahFBH7qnuUrvp49V7X8dSEkglZmsAIxp8GkUWYof0n8qCgTSpYkCnRc5FJ/eC8A18Ig/XKWDdhVQtyb4ofDjlg3yCk2ZOf4cxzN5Z3lpnet9ja16GD4w7NVPPQXw5j2Q6EDcvaAPdrDL3NIsGiWhH+q+rig1dQ9GIqoSKRqjCdj9M9OLFT1enZ3+gaNZIto98PZWJTf6+LTBooMDPwFNpkjzfD6dZ8QZzc8LqEgCe2mJt6XbTwt0/oLdolpQztSJJ0lEGVSiGxzwzG4zcEZHKr2rGo+9avrsBfsyPWqTKLdEDnKLKYnvxmZNhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tymMUGsrQcK/tzfSev+yeafsREDh/trq+pNu5acpsVY=;
 b=BU4My79SLj0TXX8B+KwOX78vTjhKNJ+cwniylAEpJcglZ1RIG/NIWZZ/nV1FhoSGkD2nqRg2usOFxdcKAV6hRbSoRlGFVMi4/FSk2kEmOtz4j4kjcdW+D3hUw05LW/UGABsQ3bRxZ+Sq6PoF6mvvHRc55KF4TUFE63cOJherk2k=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3370.prod.exchangelabs.com (2603:10b6:302:2::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.22; Wed, 14 Jul 2021 03:38:57 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 03:38:57 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: [PATCH v5 1/3] i2c: aspeed: Add slave_enable() to toggle slave mode
Date:   Wed, 14 Jul 2021 10:38:31 +0700
Message-Id: <20210714033833.11640-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210714033833.11640-1-quan@os.amperecomputing.com>
References: <20210714033833.11640-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HK0PR03CA0099.apcprd03.prod.outlook.com (2603:1096:203:b0::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 03:38:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f2989b4-0abf-411c-e9e4-08d94678e8ea
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB33703E0F91E9DA893B820551F2139@MW2PR0102MB3370.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fOQzD4UDAyEdhCu9Qp6ywSpBnOWl0fIaaBnxYG+2Kyh4NQPZu1BNnexyzFhgvjHq/3Ua4a5ZXruAWfeZG1EWyj8GgvEsLGZW2Gv/XQUknGJswjDQQa89DOO2BuIovrMb05x1hISRBnEAFscEY2tmATW4Fr7wPlMm7uQkv4HE6GApv4s3MbZSgMssj72dr4rvI5Z6SX7wqOEToQjRfjvUcF9+fCKQZbJQ76qFPd+IZpTeAfp5OdNvubiTirb7kqIFKJxRh8eDcv/a9mYyBctAbQ5INemLiX7BXn2oLyNP0H2wdQOudI9ZXHQiHVyDgMuba/wuu2YgN335KMBOvvKSYWp0rZC7Vtakv3IzkGeWCnjhYDdCOUIxRsABnKEcJt3dNxkkKU6YZTK9aers3WOrrr2keyxs7HBsDmeSWDBeodacVo+AYLkTmHWv3UIPoxB+Yx+yIIkTjNYAfUKL538bJywUUKyHAlTcF1C0d1av49erVzSyCr1UrVld2yHgL+cnsKZ02Xl8IQGPzGFkmL1QOmLk+t6OmO4PpgmBRJrqVYSb+Xi3Jj5ovcV8sltWhyNEkQ7Yr+hC5D1MAirU0lvbIOdV/XSqQsAy8FZiIpZXYitIEGJ1cTxYDBuuirdU6d1A904HILyhtK601GqfCI37ojDYuT7hctk2mX1TjI+6opHB2x3Kd1lKD8hSTwy1hsbHW/JPLfMG4Cg2l2qh6La50m7SAp9QJpGCqv4n/0NKSwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(4326008)(38100700002)(1076003)(38350700002)(2616005)(107886003)(956004)(8936002)(8676002)(6506007)(86362001)(110136005)(52116002)(5660300002)(54906003)(2906002)(6666004)(478600001)(26005)(186003)(66946007)(83380400001)(7416002)(66556008)(66476007)(6512007)(921005)(6486002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KWICOBlkrXvXM8TMvK2Sv9/NZag7FRWtEwJq3MMmfEeDJvHZ8YqlymeKXlzr?=
 =?us-ascii?Q?2y6QWNsSlw6LI4iIJcTo4Tb1iIUh9u5ijnNeHgaDr3CessmyDS6iBkDPLiJ9?=
 =?us-ascii?Q?1CkE4gG3wcvvVPqW3uKEWiODDJDsivYB2C0QxH7EqgobQSYbc+bwXPr9iDPQ?=
 =?us-ascii?Q?vx5G3ZdebWuLHWtjy31Nk0+l+s9+8ruD2WapB3Gjn59GDtKc3CVrP71JqrV1?=
 =?us-ascii?Q?ouTHgHt/qlliUQnkNwLZVupDDxucPncJs7oFTCewUNr8BX0W6D9+6Va1XhZ0?=
 =?us-ascii?Q?MifcYiEIiP2IHRKPkVA09SKaHvGaI7mqAGhty2Xbmbp9VHRVCDBT9IKbKqN2?=
 =?us-ascii?Q?Gw/K++i0zeLb+JrrOcU4JreQ093eGbJTDOJfdxjdCsSi7M81ljC7/EL3MtVP?=
 =?us-ascii?Q?RWlviZGzipM/wtgq6u51uHTxQWyvAr/VPZ0Qi7GCAsOYjYvRDVIwYroaW1P7?=
 =?us-ascii?Q?VR3e+qv5BM6ko9Y/57VpZjfgpECRDNqHIx+un/J/0oHkAYbPcvw8OOb/gVin?=
 =?us-ascii?Q?Bz4bu+jARD970/aTT4pplzbypa7ohgjPoYY5+NWzaIWJf1E8q8a1vLg3M572?=
 =?us-ascii?Q?gkom04+1ICpX+MpQ58F8GO9eeHdUwBsd6supmnZcCV+nFxGrL2VPkeWPhBFR?=
 =?us-ascii?Q?a0uDn1d35ALhbajR2iy6Izzm+K+UNJUbCLOuMYmSn3N9nhURRn2RpOqbNQvh?=
 =?us-ascii?Q?9tpiBhqihq5APr9KTSotjkpoWBqjwe2kNBijkYO6lUoQdrxofD0TsJegAyKo?=
 =?us-ascii?Q?5HTCHnRCceGKjhN4USiNryxWrAp8aE2phMmIW4bhEdLuglRChEW7qPSC3KcO?=
 =?us-ascii?Q?TWQ/kNg6q+rzghldyvbJmD7q8C4jZqA6LuMFkktJ1iTB0WcwF50PPQhV+65+?=
 =?us-ascii?Q?Ha3ftauHuz9Inj1Yuu0fcHTHkC/PZjNWyenNyNGlZbfN/AfaqAospeMciHSS?=
 =?us-ascii?Q?s6ZOGdQPsy036mAnW1zmtelgPUnPvLaShSnRzJUX0r3lta2StsD8QxuScCU5?=
 =?us-ascii?Q?IgPZQeTUAb9f4Nh3/Gj7AVXXKMDpUp3hwgrnQRrzjPOjcg0x+PzwMGltkQNr?=
 =?us-ascii?Q?jWOixU/y7+fz+6y9aMIt14FBdbDm7DiDCucAL4PT5OuTyyI9dC7HXhqRwHSG?=
 =?us-ascii?Q?/dneuP7qUVpdKpm3sYVlQ7GBkEhImRT/rzvz+vtaH4yddaOKPxVWftzZsSpH?=
 =?us-ascii?Q?bwTfXQpthr3lLqEjXmv9fgl+a527JoNmjbs42Esk5v3y1poAMBF2VH3KFzzf?=
 =?us-ascii?Q?N7XJxkj8BU0WH3ZXwERfiYyvpb/PaVg6I3fFg83FzbE+v2tnxynlBDbtAJLI?=
 =?us-ascii?Q?OXYper/ZK+Qwp/9AHGhoO3CP?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2989b4-0abf-411c-e9e4-08d94678e8ea
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 03:38:57.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOWvg1ERIJ1Ypem14FGfuZSdPdlm1py5rXwLKiUZZes6YMAhOWMwE6FiOj5TlpZjkmkabBGwumMvzcuidem6gJA0MZvlhErApAdC9Gzbi4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3370
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Slave needs time to prepare the response data before Master could
enquiry via read transaction. However, there is no mechanism for
i2c-aspeed Slave to notify Master that it needs more time to process
and this make Master side to time out when trying to get the response.

This commit introduces the slave_enable() callback in struct
i2c_algorithm for Slave to temporary stop the Slave mode while working
on the response and re-enable the Slave when response data ready.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v5:
  + None

v4:
  + First introduced follow Ryan's suggestion               [Ryan]
  + Fix recursive spinlock issue in v3 (aspeed_set_slave_busy())
  and apply in this patch                                 [Graeme]

 drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
 include/linux/i2c.h             |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..a6a19dc8a501 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -785,6 +785,25 @@ static int aspeed_i2c_unreg_slave(struct i2c_client *client)
 
 	return 0;
 }
+
+static int aspeed_i2c_slave_enable(struct i2c_client *client, bool enable)
+{
+	struct aspeed_i2c_bus *bus = i2c_get_adapdata(client->adapter);
+	u32 func_ctrl_reg_val;
+
+	if (!bus->slave)
+		return -EINVAL;
+
+	/* Toggle slave mode. */
+	func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
+	if (enable)
+		func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
+	else
+		func_ctrl_reg_val &= ~ASPEED_I2CD_SLAVE_EN;
+	writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
+
+	return 0;
+}
 #endif /* CONFIG_I2C_SLAVE */
 
 static const struct i2c_algorithm aspeed_i2c_algo = {
@@ -793,6 +812,7 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	.reg_slave	= aspeed_i2c_reg_slave,
 	.unreg_slave	= aspeed_i2c_unreg_slave,
+	.slave_enable	= aspeed_i2c_slave_enable,
 #endif /* CONFIG_I2C_SLAVE */
 };
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3eb60a2e9e61..8c1765aa7e3f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -520,6 +520,7 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  *   from the ``I2C_FUNC_*`` flags.
  * @reg_slave: Register given client to I2C slave mode of this adapter
  * @unreg_slave: Unregister given client from I2C slave mode of this adapter
+ * @slave_enable: Toggle enable slave mode for given client of this adapter
  *
  * The following structs are for those who like to implement new bus drivers:
  * i2c_algorithm is the interface to a class of hardware solutions which can
@@ -557,6 +558,7 @@ struct i2c_algorithm {
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	int (*reg_slave)(struct i2c_client *client);
 	int (*unreg_slave)(struct i2c_client *client);
+	int (*slave_enable)(struct i2c_client *client, bool enable);
 #endif
 };
 
-- 
2.28.0

