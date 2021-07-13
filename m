Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191EF3C6A02
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 07:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhGMF5r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 01:57:47 -0400
Received: from mail-dm6nam10on2118.outbound.protection.outlook.com ([40.107.93.118]:45121
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233713AbhGMF5q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 01:57:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKokhhxeZ7t3TqK8YDA7mTD3FXagu3MVIOORZKFurupPJx6R5FNerABAN7saTOySDy/qiIMiziwaQuelMmzrQznmKHgYRGn2GdMYgTmhK9nQB2aAL0DVLdInmEBcBr7HD3bg9gAcnn0r2Nz5vBht289agdEO8TxFoFtvvY1UNUNRt7I4ItLukb5pidSSRfxnxXXSBUByFt1dV2qviEXQ1ZS4/uAGAHlQKjXZVpUz9K03uE6yWt1k2YWHa22N7tJkHBqM9mtveqFx0DvdRi1C1UfC+sfoqHoF09e7Gs05oFVBBObQyHmVoDYtgbxBAFtQSs8aZcLZFaGHVrkbXQpPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiCqv816ye69wa5yoL7KXA6UEBvLis8Z1T3oFCWysr4=;
 b=SUXxGSmXWUg0cdij2b4YLY1Tr8+pjJQA2bCKNCzejnYyu7gv4CHCu1gt5kRUw2Meqt84/l7mmS5A93gpj54k5FUjATYGL520N0VpYXdmsNniyea7nzbAvjb2QmnjhlADpwzSExneDZVTcADEYJNQtmQ+mN3NYc3Q55bUSCAAhJPBLLHgaQLPEud6m2yct/0OBi4dTqSvvdltwC8HYBIewfi5QIjgVL/HqVuMrmdqkodOx/Kb2pi0RuKhxkoR/CLlY6Q9jSpzrgIpnGn4qgtOS65AL9nckohGzT3yjsYJjcML2sdu6/v4GHwnZLJO2oV1IzsYZCA4r2bABKcL+x/Tiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiCqv816ye69wa5yoL7KXA6UEBvLis8Z1T3oFCWysr4=;
 b=e/6I05MqowrpfcYlE51HbKaK2HQ22S8P9oV/OtmW9Xgl9SAP+1N4Gtx1DtHrRYMJz4uoOBRghp2baDLrGFcrAt3n49FSLLbc3QdqKoyp/rlb+VkwJwNBOqlA1qlSKA8LMjOjLo4pC9h38j/7th/UQfk1D4dOjfgZuvw2gTWIujo=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6535.prod.exchangelabs.com (2603:10b6:303:d9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19; Tue, 13 Jul 2021 05:54:55 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:54:55 +0000
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
Subject: [PATCH v4 3/3] i2c: aspeed: Add slave_enable() to toggle slave mode
Date:   Tue, 13 Jul 2021 12:54:25 +0700
Message-Id: <20210713055425.30636-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713055425.30636-1-quan@os.amperecomputing.com>
References: <20210713055425.30636-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 05:54:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59cf5a78-500a-4faa-344d-08d945c2bd61
X-MS-TrafficTypeDiagnostic: CO1PR01MB6535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB6535F84453339498B404861DF2149@CO1PR01MB6535.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJl95ke1G4O9CylA6LvRbk5zv0oaj/iqUEo5usfurJetFn7+t+MyXKb/wzA4z7Uf3WGhh57uotD036aj2+K9lrQYhe1kgMsnIg8ccBnuizRDOFEnUieXYyYNYMR1rLGkM8B0o1gqqEKpXS/lx1pF0L/x3cBsgBenWlme2n9E2Yl9wlmxgLctniDEEROxFwXP56YBWGHmiH2czo4Wh4UtIvhm1l2tBTCrblWxCcAUfTbwoIgff+VhFcCxAbehrelD4ufTQ3btS5Sjo/MUEJiwAeDMHhwoRHSKBd1XNPyt1AaTOcSKjJi3KM3HV0MDdIKGzSHNXCHyjn0RT4y9rxg9I8YPkxbs2w8E4q9k01Bn158K16CrC1Z9SPsmEysSJO0Ob74Rk0/ADFLEU4EDZnm+v2zc8MUgeXbwpJfYkVhmlooTWYzjlQjxPoZRyJ+aCLaFZGNPCP1mJNT+ObcM03lwfToeoPnyEvd0s578oglxHZddtPEZq2nE11KhvIuGVgPfMqvBys4rBawWf6/u4V1TxZ9AP2vIIOK0FMzAXofvRUSrI2Bk8kPEP69Eutw2q6PAMWg+PcKIywNjWESQRnE6ex5VmLZsHhRng0Z491fZ/eHgonxvp8RVdNWcdIUzV0aNMwHcvV0sBh62Q/ZGsBW/odrFs5td8tZe56UJ5knKTnViaVtNetocYQCOwt2mPPHK6z+1H+8nJ8TBAxx0yYN1xFCITZbq6hI8bAMkKHeNia8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(956004)(8676002)(54906003)(86362001)(5660300002)(2616005)(2906002)(1076003)(7416002)(52116002)(66946007)(107886003)(478600001)(66556008)(6666004)(66476007)(6506007)(921005)(110136005)(26005)(186003)(38100700002)(316002)(4326008)(38350700002)(83380400001)(6512007)(8936002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XwsMqXkOtNZR82eUcGE/g2I+G4px+EdhThx1Yk8YbvS2xR9128AQ+iTGUzWr?=
 =?us-ascii?Q?PQJtSme+63+0n3eoE5R9fDQGPGgfi65dF2EFT0VNRhfGF19zzxdSM6KP6+6n?=
 =?us-ascii?Q?BIL1JmshII8ob9iJgikEhCFiusHW7NGGla+17/+OhWgV+KFFr/atmJlJvFgP?=
 =?us-ascii?Q?FXETNtjCrQcmulFotqPVdksklm6MqXqz7l78plpVj76It9W05C5Pz2qzLtMo?=
 =?us-ascii?Q?G7jTI35Z6/MuuQR7XxbC7k3XWbCAY/tVG3zdfDl6bqyM35h4EJg5BJ3RXiMo?=
 =?us-ascii?Q?8AuQTwYTB0+4a98oc/V34efhwJKtR2OvzdQuR0y+hCzZN+Nt2c8kyRplhJMW?=
 =?us-ascii?Q?iUIQS09w6b0YnYggTvHEpPqnN9Cglma1Dp8k2N1XdVcXLB9kJ8d4lj+4+X/B?=
 =?us-ascii?Q?h8FoFYeCcCKoismfkrpbJYVKaigENTZIpJ2DeTDfpicVNvCqvlVeuasi+ypP?=
 =?us-ascii?Q?d5kq/1y9OZ1hJbiX0UFEMmSgKpuBDzRM1TRRhtzqHMTALZumf9q3nlp/hTCv?=
 =?us-ascii?Q?DkJ1NnxgHRgKvMElUH6hws+5EvNbygIkWvog7CEwD8Q6SuBOhZhDjBEBNIcM?=
 =?us-ascii?Q?dRo4Lj7IDXraunZV+xC+vO3ary0wjdxABKkjr8MwDPv10Oc7VNOzJnNM/2hE?=
 =?us-ascii?Q?oxEXaPa1e4OH2f/3IESYKnFvAuadzhIdgFkDLChQF0tD1e5ldEZ68Pz353yh?=
 =?us-ascii?Q?Qrcj2qrZoXMTzeafW0/QUg8DmXCS1ieHnYMIj/SbqUhP7TE7T4ETWzhzdtxp?=
 =?us-ascii?Q?Ny6XhMw5yxMMQaJLF1+Pa+HhPS1Fj/F3YlzfxYAaugdTUapkUm3AewpfaSqB?=
 =?us-ascii?Q?oGz+SRH5/Ya519uJ+uYDy1159RXLV0bHMxZPeMm00ZJFkDkyKz0KEnTqrX+N?=
 =?us-ascii?Q?BriyLObvdd2cbF+FjgQVNCfDT2HkbsrKJ+7sz45lOC8TfmUKmezEyeMl1edO?=
 =?us-ascii?Q?HeFeKtd+Y8IKJcZsd765ihI/fl1nGbWRwysIlGkeMtaSeyWb75e8cc3kC3T3?=
 =?us-ascii?Q?3XmO7+nNK5m7i+86DgzLkqoryBZzqgM/D8Rk99WRSe8IFTIV1ZNhEiQgADc6?=
 =?us-ascii?Q?wLxmyGiMsA1gNdlVifZF+fxhUjshUCYLDXuq0GdvlZinFFed9lk4hLREaALQ?=
 =?us-ascii?Q?C9dEM5dvE0n8lDIXvvyhLAgHF/x2BJqH8aSbVfW8BQyLh7d5sB1SGKIFYAZA?=
 =?us-ascii?Q?3s0S+2suTlwq4+cLUeeM8UAA+P2PaqRi5/ta3JWdAUbtYIXE4a5gpNG4ead7?=
 =?us-ascii?Q?exjavlU6E9GTQjLDLnIyF1Zlso0ExrzCoyiccfLeSk69uIc7l7ly5Zq8j6+y?=
 =?us-ascii?Q?+7KapkYS7ddlTzg/+Y5Euo+T?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cf5a78-500a-4faa-344d-08d945c2bd61
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:54:55.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smBguKr95Q4IqhWCuS0nn3Yx/24pHkzjMfF7Bix6ruQvgsPNCVkpWaV7t8+LkDZenah2nnOyvsBJ9naZOOn7/rnKix0iquldowea9GLCz0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6535
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

