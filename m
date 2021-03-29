Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C950E34CFC9
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 14:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbhC2MJv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 08:09:51 -0400
Received: from mail-dm6nam11on2134.outbound.protection.outlook.com ([40.107.223.134]:12160
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231420AbhC2MJm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Mar 2021 08:09:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mlk5gNfX4FNJFq4sX+AYOCgQ/QgrmX9kSjn2Cf4+QhE2QTLU+M5xSzjPUy8ALKM85A+1NfzISa4H0g4dBzYnqYv6dha6Wd/HrWfuDP20uftZmLUU3zRA+7SbwXlFbWLzYmbMAMGj7O+RizL/K0ettkJGNzh6SjNYKOx8Z8MejSPwPVIZGXIb2SD+/Nq/zOPKNlXCIvVQDumDDumY0IeWYJ2FF29j8kqLP7d3WWQjk32p/4yygn7n9BTUUpL5bVUdcTeUz10tVqG3FrUuTwG5EGPhtCweiQwEBCye/2EjCDX3EIPpL01t7MIomyBPPAVoCQFv66Spj3BG4WHAhZR8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObTdeZ8zsjlufq5/WNaeZ0cI2o4TsSWrRB99EetYum4=;
 b=Jo4UWpuB1lUCQGyD2HOuXYjnHrwxMP/36LgVYPsbKJysp1Bi0sJrFHngxRO/ez5T2m2/y1H2zi7BaT5voQ2fXkMnO+m+8a8Pgaj83xkk5Y7BbriAuCuGIK8BvB6baBpTkAj0MQE/JnqNYW6ReMhlgYxC4L/ckEF7xfA12fm9vpM6V95fEif22PbZ4ZvxsWM4Qvv4srYdjToB1gxcgjUeEQhZdPPW/XQaOSjbdk0uXN5ftslKy1Onq+ziGWpLf7zQJvTJX1Opt3BZukP/eAuZSpIldrYKbmmBOeaXEEXf5A0Lk1D99VGPlzXhNo47k4EnlkXtuXR/xajf0HL6pNvxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObTdeZ8zsjlufq5/WNaeZ0cI2o4TsSWrRB99EetYum4=;
 b=UEIHovCXLIEACOY+/gXPICPJI0GVy395v36w2xpUggbF1wti9AqChSNdafR8fZjh1vHv6Ar8y07bTnMgw1NX7xTk99B5GNnSdTm4qhzn/LI8iaZxDwf1LSPg9wIfgixNjLYjIN9VJ9ePR+I6eGbKDSHqL/hnfEzcPYLCSwnczis=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2320.prod.exchangelabs.com (2603:10b6:300:26::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Mon, 29 Mar 2021 12:09:38 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:09:38 +0000
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
Subject: [PATCH v1 1/3] i2c: i2c-core-smbus: Expose PEC calculate function for generic use
Date:   Mon, 29 Mar 2021 19:09:12 +0700
Message-Id: <20210329120914.4527-2-quan@os.amperecomputing.com>
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
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by HKAPR04CA0010.apcprd04.prod.outlook.com (2603:1096:203:d0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend Transport; Mon, 29 Mar 2021 12:09:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 949c0cd8-75c8-4e4f-eb9a-08d8f2ab8693
X-MS-TrafficTypeDiagnostic: MWHPR01MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2320E21327CC2A639712E779F27E9@MWHPR01MB2320.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sxSlpUsQC6huYJVssWEmaOc2WwjeStJLh+mwQHaBvV64WU6OU6Uy/LZ+dAHgNPJDl/aqjbS70Owsd1alUWtoIqA8s/UFJFgsE0JKU4CWRoDMaL8EShsxxDQU5/2fc78575fcwlNK4p71aRkfpis/Yg/z0R/wWTLWUTHvRunVa38i9vrFW4QSfGd2t9P52EWKG8tRJhZYR1Gj2kay5Bsue8sPZI13P0mnUGG3CLhajzXN5hDThQlT0iFFXzMjmoXM060cVvGk2vuUmC+ANfunx2/iGFJrShwRPrRIhKBvPEkyqcpBv+5wJGravYJy2yRCe5q/LEidcXJpG93onM0phDtnhsaPb02F0+0dCYWoti+Fn6o8eT2HjeTfJslTVUZ3Oknv8aqHTUkxg0kw37BaqlUJJZHozHcm20ZMjxxmGrOiI/KFpNxq6/mGXjXFjupjq9ujSq8fVt9wh4VnQ9PNUipJhiZ5/qZDc//EMCYfsZ7EjbX5aZ890d+j7LKemuBqt1+D6mMDdqvEBhwyukYsjm+mHsxdnsmZQ4dJ/vw+OJoXfipF7s4WkNraSaEt5ykBCxBcVxOU1Xh9WAkADjyeuIowzbR/hWY/ZxIb1YiPEIAd9PIDummqHLId6lGA6DqbprmqHbfIhWEbVdCaNqb5JxcxNNDGx64nZM68gXJb7L/KuuE2ILDIDdd+Sh+nNOe0JgnXWlIwT1ZaCuCwq0B3GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR0102MB3482.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39840400004)(7416002)(107886003)(921005)(86362001)(110136005)(6486002)(8676002)(52116002)(4326008)(8936002)(6512007)(66946007)(2906002)(956004)(5660300002)(2616005)(478600001)(26005)(6506007)(1076003)(83380400001)(54906003)(186003)(16526019)(6666004)(316002)(66476007)(66556008)(38100700001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9xn90ef8EuZvfsopt/ANvizu85vpVr7k7jDB4YHhxtZp2QIm7JhOkGezpEmZ?=
 =?us-ascii?Q?ttaNO2L3dsoERpt7Mk00aAeFMvZgW/Hr0GK+FftVmMakZPEbLkULbviJsGqw?=
 =?us-ascii?Q?TPqtgI/cNb8EG54BWnlApa/DEqmBPT5fJVSryr+1kXX3q3mPnXJvaxIAJQnC?=
 =?us-ascii?Q?VxPOv4tIh2UxKWuC7F3tOOCa7Q0VMcxJ4Ry51NdxS/yLixmhy7SGwwqWKXB0?=
 =?us-ascii?Q?AS8FgdxDUcxdQOXhCSJGaxmbVoqGTKaCl6d2E6zfff2Ee0JPlZTmfDjV7WoG?=
 =?us-ascii?Q?nARnK6Raa+H2d8hsQxDmVlppz8vk30YxhRPmsifam1Tf4jlea/dZCephc7BS?=
 =?us-ascii?Q?1JV2Wd420yS5vwasj/aXzyF6jauStQ/61Se/deUhsudlDniMP8fFn0tgN3H/?=
 =?us-ascii?Q?KKdGWXTyR3Ic2eTVnCi3DhfSKz9zi7hnA9evhHmDOJ0VZcsd6PjDq4kwOHvh?=
 =?us-ascii?Q?2ZOreWJXoFYofP1pVueYXm/UzKvT1s0PfdNykRlOwGlKxjPSyu4bOh2QPe/q?=
 =?us-ascii?Q?mwr7+DwojcKtUGe6aZXscDETWYFc41i/mBghCd4mr3Rscsvlm/su1wa6TDMa?=
 =?us-ascii?Q?ZRYRvea3BOKVK0L46NrS7c9WXlX0gjGOCgYfElC7Dh9rhO/A9vqGiVLWs1Qe?=
 =?us-ascii?Q?RvhA286kAd+i06ETWW86FQbpoxNMUUaahHoxAXLu97Vq2XRU+LzeIWe6su+n?=
 =?us-ascii?Q?AMgqHVRqqp3GZQ+baMr1hHkUDAU0jvsXzTpM312pFKQpEAsbnEqIcJtJKAeG?=
 =?us-ascii?Q?SOQz5gz2g+s5+pOzT9AcE+DkJ2sWYEkzLmhTUajlS+tn++cQvqY6771vVCDs?=
 =?us-ascii?Q?3UJ87+rfmZVo558eoG7PQNn6djzN12fyssNGV3mQt2yNqOAbrGAYrBYluAxW?=
 =?us-ascii?Q?DmJm9trHF/GOp2MjjkdpaHsaLTT0zxxwlR1GruYr2/IFuSoxd9xVhXeR/zds?=
 =?us-ascii?Q?tawqigOCv/ur5BzRQD89NPZH3w0iYBtAFsg+BvfbRexk4jZvTnPi4Na/4//h?=
 =?us-ascii?Q?Pvm/dD/RjdVZ9reJE7spj2XgZ9CgqhWwaENiR4SWOCtX1VV6oIXYHeuZZ2M2?=
 =?us-ascii?Q?hmcJ+HnS/3TeK/ARDsx3yzWzzyZWrtvB+I8F37yPw1Q8E/B43VVF9wVSV9of?=
 =?us-ascii?Q?h7FmiAfiPEZ1TNiaGyZnhviSLgOGSiK1b7KL6aocPr/kafAtgRAaK+pqDmao?=
 =?us-ascii?Q?NVOkv2K8gxQ1UkI4g/IwBXomSVXy1tGc6YjGpgIlp4IumD9+QhkYtSDp9vnl?=
 =?us-ascii?Q?AQKn9H22hOOGgC9h+rFV6Rym5ssCMDehWEKNjviNy/1WVgD/nOdEvtzyxfHL?=
 =?us-ascii?Q?Dzf9ZpqACh6vDBhXPEN/vDdv?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949c0cd8-75c8-4e4f-eb9a-08d8f2ab8693
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:09:38.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pa7o7j7xMaw/nwUp0rQQxo6zefAuPG9jTPQNwlzfpPIw2u+0eeJTccwrlV9WWFprNDRNjqyMwoTP3a863Lgc6mvnRCE+NyF4RLNWtw/8HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2320
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Expose the PEC calculation i2c_smbus_pec() for generic use.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/i2c/i2c-core-smbus.c | 12 ++++++++++--
 include/linux/i2c.h          |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index d2d32c0fd8c3..e5b2d1465e7e 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -37,8 +37,15 @@ static u8 crc8(u16 data)
 	return (u8)(data >> 8);
 }
 
-/* Incremental CRC8 over count bytes in the array pointed to by p */
-static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
+/**
+ * i2c_smbus_pec - Incremental CRC8 over the given input data array
+ * @crc: previous return crc8 value
+ * @p: pointer to data buffer.
+ * @count: number of bytes in data buffer.
+ *
+ * Incremental CRC8 over count bytes in the array pointed to by p
+ */
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 {
 	int i;
 
@@ -46,6 +53,7 @@ static u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count)
 		crc = crc8((crc ^ p[i]) << 8);
 	return crc;
 }
+EXPORT_SYMBOL(i2c_smbus_pec);
 
 /* Assume a 7-bit address, which is reasonable for SMBus */
 static u8 i2c_smbus_msg_pec(u8 pec, struct i2c_msg *msg)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..0d75e5bcdde6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -144,6 +144,7 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 /* Now follow the 'nice' access routines. These also document the calling
    conventions of i2c_smbus_xfer. */
 
+u8 i2c_smbus_pec(u8 crc, u8 *p, size_t count);
 s32 i2c_smbus_read_byte(const struct i2c_client *client);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value);
 s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command);
-- 
2.28.0

