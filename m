Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A670234CFCE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 14:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhC2MKW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 08:10:22 -0400
Received: from mail-bn8nam11on2098.outbound.protection.outlook.com ([40.107.236.98]:35168
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231731AbhC2MJv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 08:09:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRCkJta+hhH7Olc/YGEt5ixWCDZh2eJS+cM0FsZb57F//W68N1k2hjyGCq6tiCuONFbF9BbFA7FGx6h/zpKwHXSEFe1W7qFu0LRUz5wc+N7fSdD7IAwB/5w5MG2MJXy1BxqYgKb7OktlmKOr4rV+7qR0lc0wKRbO7rIru0Ua3H4D0x2BJaU11QMAGTTY3fbEEotyH9ldnEWzU959DCN72XBIhcV0I9PGC4uV9aOAx/C8gmpRdQJbLFpKiqZc0I+SqQwhVVw+2EvCSqPSFsJfjPDLjFv26UKzy4m0x/CGb9ics0RtLaL7tKOgSJUs86VEHP97BsG5pTrTXp/xnoRJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDKOwdplJFsue3nynYNcN8vpg88fsI9i8TnpdlofzgA=;
 b=gtjwKCMrZMkZBrGlu2YNiA/HFn+eKkp8o3ZSxcdAkxnghP3jp+BjdTFDnbBUwgz4oaU/JOpxj97wNLtC2i4TM/+g3+fLB63PBFtiutJqWRyznS0swzSgJbOUvpMVcYylXAUTr8GY20eJDuVMGcuMvajEAZmjN9tWtOn+YRBjBlnEd+48dzL/zmk1rmfNUdQh0fK2XFmf0j+OQTE5v75zDG9W6J6LZvTM8oZ37tV0Fq/ObYq0hvukbt67adpEKmRdGsZUcTJSiRJOw8AG0O/L9r8cNbxsemhVqi8t1avcOGQqBMsBXl4ul75OrEmMcbK0uKjMO4cAlUeMJfPg++9ojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDKOwdplJFsue3nynYNcN8vpg88fsI9i8TnpdlofzgA=;
 b=JnNAnRTSRlMX8Yo8ls403qKK7hlNvtgCxlG/yDsDRAsIXYIr91BYb4rYjdS9m7CC9tgqLIIAyHFLG6K9rp5G6pLf0rLSzsN6Mq2y6tRx2ly5rnQCehlpQkyKoMlt3YP0oTjLK9vUNWTAkXh6r5VZ/BwzKcv0H5FwfOueRtThCqA=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2384.prod.exchangelabs.com (2603:10b6:300:3d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.33; Mon, 29 Mar 2021 12:09:47 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:09:47 +0000
From:   Quan Nguyen <quan@os.amperecomputing.com>
To:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: [PATCH v1 3/3] bindings: ipmi: Add binding for Aspeed SSIF BMC driver
Date:   Mon, 29 Mar 2021 19:09:14 +0700
Message-Id: <20210329120914.4527-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329120914.4527-1-quan@os.amperecomputing.com>
References: <20210329120914.4527-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:203:d0::20) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 12:09:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b8ab646-294f-4122-aa89-08d8f2ab8b7c
X-MS-TrafficTypeDiagnostic: MWHPR01MB2384:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB238495C6F92974AD579154ADF27E9@MWHPR01MB2384.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40QN6w3mMJ+IG4jQzyvSsbc+oy3Qqgbg1YB2sJCEUp099i5X5l8Seqk2nbXAI5+zNbrpLroddLHtM+evhcB7msrAwOYJ2zwTen9HZqsGlZRq9VY+lYNH6IJ87TAtyGBX8fHSbSR/Qwv0jrARS/oVqmk8ESM3sCtYG0KOMpN+UhWqdqGp3wMt0/76PGTaAzE9ESmXTS5WA6J9I8OG10OQRVDDJ78suhRcCnluWInz2PS8s6FHugOnN3hSq1vPgmslEMEC9IQVb8KwOOb3gjgIxjcSiGz0oviVzyvc6Z50zHgYjpQa7smpMyRRieTdLMe3ThkM0/Ia+W/0PjHXS/WM9jyEAGSzdnnXVCK9cS8+YV/ms/xpgbgnC5OIfosZ9B8JwOmDu8PrIh+FR+rtEUTY38bQ5HqpU6myMxCIWGWptKwdPjrHFsOvOBdL+EvWGY4IEEmPZzBG7FiAsU/oI5yBKVL/FVBzPaC1ELdQ77bfd6G2QanHtlIot/cYbE1mKz0yVMLgR/O87PNs6jvS3S6IBAAI6B0I3FjwU/CNf3JoR4JdZHDTAARRxr5YbiWGzzNxnVMO2EPeFKjGpNMcrL7STQ0t9c4atB/15vdI9IY3NvPRmZ5sUnc1emnmz4EMXKFUtwu8GCcc2c4JVBA8eMb7AGY5CL/KyM9TWPHV4cU62wQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(396003)(376002)(366004)(52116002)(16526019)(478600001)(26005)(186003)(6486002)(5660300002)(6506007)(110136005)(66556008)(2616005)(54906003)(316002)(1076003)(86362001)(7416002)(38100700001)(956004)(2906002)(6512007)(921005)(4326008)(66946007)(66476007)(8676002)(8936002)(6666004)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SC82B9xkqUbwLNiz1uklPRkMzDcQDJAdwMNwh1jj3nzne5KoRPwGQ2BnaNLV?=
 =?us-ascii?Q?tQNgX5Sy8/jKNfDcqsEkrFpxQqjEzka0F8DNJP4FC/OrViauGYSSH2lXOgYm?=
 =?us-ascii?Q?RfyGDnLK6/4MBqSOhvsQrTl96axg2i2NBDPk8wW1PLafC+iyLxofw5B3Ss0X?=
 =?us-ascii?Q?CNOqrnxuMgP9Aj4llqGf5HM0HkWbqteFJol2sAlJoP613ORb1CfOgSnFq9qT?=
 =?us-ascii?Q?9baiQgWQ/NVKEaRbP9rQYiRd0JLWjMi8BQKjnr4c5df+poyCl+roI45tetbe?=
 =?us-ascii?Q?HlTwdULKZddXo5yBJlardM3JkvdCTYTZpe/kdheU3wiiSlvpJD43oSYmB3AA?=
 =?us-ascii?Q?jHkW9X57p/ky/omxuuGf5UgGxgrROa+0pfoN0uokqzngZ0u9gpoo5/R7Hzep?=
 =?us-ascii?Q?RWDITzeuv7Tzfszn3m4Rpf1DXLdpjkSg721QCnyUNO0FnQ7m+9NE9GGjIOrl?=
 =?us-ascii?Q?F+/5sdO9bTGL9lOSAmSLXsE5KwvyOFdSbelf2X0dA8MFV6YRzk9tQhWrrRmE?=
 =?us-ascii?Q?UrjpQNkaKHNGugSfEIXENvfdg6mtKSRTo0/N12hMWmFMuoKa00ChKO9ytQib?=
 =?us-ascii?Q?c0VKENwGXLOa1GcNzOs4P1YvGYqAygUcYU733QmNtkzQq3P5IdORSefYUZyb?=
 =?us-ascii?Q?pnqG8oGX2uWYjpDwip7oU/6Qw+fPP8wI5b5ybAC6IbcILczKP8URfP+E5oky?=
 =?us-ascii?Q?toSgayFAjVg3cuzlM33Dpr1rRUi4O0GbKgSG6JdyBDP8lB4NTBitek4O69NT?=
 =?us-ascii?Q?CGk+jYIEAXII+glisJ1rGHkfkfYLip0ko8Rst6GQfcx9gHOt4uQtQ2TehJBr?=
 =?us-ascii?Q?jlS73ayUMR8KX5vuI2eO5y8lF3G7iZPYSOt9FsHk8TcuOdmIyjH9CT3Q7m+2?=
 =?us-ascii?Q?rfu1wJUkpV7+o3Eq86bfktWORyjfg2q+sNuytm0G3qIxkFc/9JUqH6FvtstY?=
 =?us-ascii?Q?In8FOaI7N8v/B1aE8DeRGVxBYqwtUoGxUtfvm9ySltaA3sCoSSEO0bRJe6pH?=
 =?us-ascii?Q?RakEF90rDkhDYe53v+6hiR6X9Bl9AQ1AQ9Z5X8nlHsx5EFNWpKvqnA2qWlM3?=
 =?us-ascii?Q?Cj9hLlyZOf+SFLDgFxrO91ZxnDbSQtaTI+y8jdztpHDwePp2NyYhzIQKIXil?=
 =?us-ascii?Q?LrT8gK9tUdiC0LqK10mNJwW4bNwmwEMImma9pHZSfC+V2WVYXUfiCAOjZEtG?=
 =?us-ascii?Q?7fKerXXwtrUjYASaki+fngkrucWjqQPeyoeDFSJeqYVYtbh2B+8Nmpkvl3iI?=
 =?us-ascii?Q?WEc02WeUTKaB3R62jFBrTuyFwHzAhzxan4ePPS19CKv0ElkKsGhOvBmWPGx6?=
 =?us-ascii?Q?ML/L7y/6r3qLwUjBU1IMiqPj?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8ab646-294f-4122-aa89-08d8f2ab8b7c
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:09:47.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jq0Sgy47aBRSpYQHXifGrIQ48D/Oe6jRQ1mk+PjEO9l6Sxm2cr9e5h/EqGU4cQrqJ3aVArJUBekahbXg3uC+T//fyQ4+D3ign7BuuX4e4rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2384
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree binding document for the Aspeed SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 .../bindings/ipmi/aspeed-ssif-bmc.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
new file mode 100644
index 000000000000..1616f0188db9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
@@ -0,0 +1,18 @@
+# Aspeed SSIF (SMBus system interface) IPMI BMC interface
+
+The Aspeed AST2500 are commonly used as BMCs (Baseboard Management Controllers)
+and the SSIF slave interface can be used to perform in-band IPMI communication
+with their host.
+
+Required properties:
+
+- compatible : should be
+       "aspeed,ast2500-ssif-bmc"
+- reg: I2C address the registers
+
+Example:
+
+       ssif-bmc@10 {
+               compatible = "aspeed,ast2500-ssif-bmc";
+               reg = <0x10>;
+       };
-- 
2.28.0

