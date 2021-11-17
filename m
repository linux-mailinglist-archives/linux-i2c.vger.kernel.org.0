Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E77455171
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 01:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239514AbhKRAIL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Nov 2021 19:08:11 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:44798 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241807AbhKRAIK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Nov 2021 19:08:10 -0500
X-Greylist: delayed 1169 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Nov 2021 19:08:10 EST
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AHKcxKe011381;
        Wed, 17 Nov 2021 18:45:42 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2055.outbound.protection.outlook.com [104.47.60.55])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3cc33n9687-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Nov 2021 18:45:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7AywlhCGS8U8l9aDNydx8G8rXSuFb0kJvj97vWqBgpXdLlECUpU3yO13oVEX07v+XoSQjjAhpvKTVtB3FJKgiadAWR8PVTupY7qgTWTwHPSCaFlqoqtHVfKKDJ1cBuyXu0I/HbOVUCUf9O3ZBPfxx2fAeG8f2ekjlFkOkS1AfeYJPe+iSlsrjkH75LuQUaHKmaPWyj5oY4fMY3zAApYy1tpRshYbsO0ZgPeVyqP3OpnGUjB86PcezzbiQRDjHWDjIsPJCCF8b33AGV2LEPkLlNl1oAXgZQaVQgvzsPBD4WhukB776UFEC6dWhGw6LrmkoKv0mu/SN2jhH2/BsIt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS6mvjTJpOz51fTcMiKR67VCj9tsYs8dRz15K4ujQPg=;
 b=iVYJESDWzN5rzlgOG5qiiuK8q935GCsSo3lMjkvwvc814VpqYZWtX7ZDS6Lhg7dAt9t66TxjtEkgLQD02M/TQlxiKpA4aue3RtuSCpO/mYofQRZFwwk6tOvSkQLs2gAsWi2mF/iWS5X2VNq7+yCvaOqGLmZ+lMEdaXoMZABVLEVvLMXi78tdp8rbJd2zfbXaejkmsKOICo/OWX31KOjPh3qaeBPotgtSdCC7sIgFjfwQB1fAd8QjL26tzfcJLZdw3rMTlvUDKovmndPDpLU8Br/9SyvhU7j63hzVmi6Jil9KJTWGrst1YLZ+sYDDeCTSl59HXpnAx1+m35neW1KDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NS6mvjTJpOz51fTcMiKR67VCj9tsYs8dRz15K4ujQPg=;
 b=0YsfSElOXePh09wHfJAlYI6D3//9RNOvTO0s05M5qlKMJQeRYWibcBa96wmUjGSAvu2lRb+BvM6BW7NOJBlQw7aNVdjwZ1Ud5SQiN2zv8nIqA9vzKhDsRskBP18a+YtIwEjX2v913jcy6cWyNCzu3f+Lgl1i9cPpY1l1T35YmGk=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT1PR01MB3242.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:10::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 23:45:39 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4992:b420:40a9:9478]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4992:b420:40a9:9478%7]) with mapi id 15.20.4713.021; Wed, 17 Nov 2021
 23:45:39 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     michal.simek@xilinx.com, linux-i2c@vger.kernel.org
Cc:     Robert Hancock <robert.hancock@calian.com>,
        Chirag Parekh <chiragp@xilinx.com>
Subject: [PATCH RESUBMIT] i2c: cadence: Add standard bus recovery support
Date:   Wed, 17 Nov 2021 17:45:23 -0600
Message-Id: <20211117234523.630384-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:5:333::24) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
Received: from eng-hw-cstream8.sedsystems.ca (204.83.154.189) by DM6PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:333::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend Transport; Wed, 17 Nov 2021 23:45:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bba2849-722b-4019-6bd8-08d9aa245c27
X-MS-TrafficTypeDiagnostic: YT1PR01MB3242:
X-Microsoft-Antispam-PRVS: <YT1PR01MB324204C496BAC45796B4CF67EC9A9@YT1PR01MB3242.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q//Eo0i6sj2PvXgVfowYNOqy7S25Qsx6ud6ChJnxwwpKO8TnOogN/iv8EZFa3p5VXULGqAWTt/EnRpYfHBusDMBixbNI8EZWLJeLVebQlCxhzDgBp9OHkGuCELHGLbC0mxf/XvbBfSF/itLQ5LidPjNuqvhTEK95sAjt66BohzJR/gCC5sErkbta+Y535TxsHKdaBl6bfdHv1HkTI2M5mA6hqRpHnDIvAE6iVvwwO0tg2Q4jq7TtaCgYnv3fDHU5/zX2+EUxcqIBobRRxAbIgbs/6hgfMjJq4gyU+RsRUa7lNzLIDGjtzaR+MAyrEN03A1c+Azb6aa14j8i0LNk+y/i6ZCl1IbEAyP8UJAOLpw7wYG+PVOtp1u3UI/0LXPCEuj5cW1ih+wgn6DQLXZL3HTCDte0BgU9kkAfrN2zC3hbn/q0bVy4RWEzrcmThshDxWHvFM3LYD4dlUrh8U27v2mjUVmUipppTGl1Nsi3zYjhejQNoAtYgIEExPN79vLTvQxrXhC48PDiQqvrRX9tHnkhHtlJ758vAlEGteJuHo/cuxoLCoyPZiGOcu9QQYQYMs3128JLoXsAprDMx0cmBDl4NXvI4NI1scZTIKBzJMxOM1jMH6RMF53tD8yntQhTwH/kE/SZAprOGij5aDJ6L1GflGCnL2UihRypxT042pc0n1Pl61B3N95QwFnsxepOMw/T1eab1/5f8GEST+R1UVhwLTMfMwV5+g0ATTuJRp/mEvKmNdHpbYItxaHVlrWaYwthCqDKGG/iqSe7fY7otDNDFAx8CHimCfPz9VocyvI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(52116002)(1076003)(5660300002)(6506007)(86362001)(8676002)(83380400001)(6486002)(966005)(2906002)(186003)(66946007)(508600001)(66476007)(4326008)(6512007)(8936002)(44832011)(66556008)(54906003)(6666004)(316002)(956004)(38100700002)(38350700002)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?og1332yxHrrDuCkNpir3Yzfl4/JtbN6DEOmnnvq91sx/z9rdnDdGu/Q+/EWA?=
 =?us-ascii?Q?jgvzUs1qHuWaRt+nz6AJ/Sp0rfceO40dAEKtY0gyrD03f2J1gLm3EuM2A/P0?=
 =?us-ascii?Q?MjHpuQxIFscZ0NJPuXAsLbrm4WOj7rtwbLGBTj8lHF9G9Z3o7psE2HKrPN2S?=
 =?us-ascii?Q?6XPG2WfUppAd1jnhIXlEzPvA6MPV0jQnOLJvHEbSuEbSubIwdUZ9OGX0Gc6C?=
 =?us-ascii?Q?lQrPtcHU66XiqaxiV4Wv68TnrZZ5zbR08jZGRqS3mzzGKKDvSnyIf89yhpKA?=
 =?us-ascii?Q?QRktkcd8ptjnP5qNQl0hNFGjVLvilOU/jdZTU37ZBC3Fx/n1FINHTdF3dgI7?=
 =?us-ascii?Q?qNKxgA9e/t//D4MsVJcUJI92sngksqZBP8Af87hVqRvIqQVe+90lG7f1GaSh?=
 =?us-ascii?Q?VbRWfdr3Ht6MyyUT96qVpMhMYbIQyEOM0IzOF2TtxZO4nkeOsM48UMjc78zX?=
 =?us-ascii?Q?r+tXmWcTFQ6af4B+Y3fuVhrlc3bhTMtk6T4Dp5xIKQKQ99JQezDGwW+bvN87?=
 =?us-ascii?Q?RPJgLjrbjaVnMk/uhWmYSJ+5kLFMRz4dUcIB2XQMew1nh5UWVNNUqV3sRd0h?=
 =?us-ascii?Q?OtxSr85YqeEzrC0xm6I/4SfVRiQbxPNla/nNRQbQMtWwlXHTsDl/JwpSdWfB?=
 =?us-ascii?Q?SG/QBUUP14m/sVpzbfeqoXfjmwyPXTrRIz7eAn7NRkgJIztefbN+9xDZ6+XC?=
 =?us-ascii?Q?WhbV+1NoEzEbCNxbyvUwYeQxTDwmqH7sh+IxcZ3unE5SSCjdZB0oCQSJ8Eb1?=
 =?us-ascii?Q?nkBhWYq9FBeZ8Je2ku6ZsxHexiHZ+LgDXOu+vnD24PT0xKcyY85orZ2HbqOU?=
 =?us-ascii?Q?2m6Zq0zdOa+Sp1ewLi7CTkVpdLs/fAIM317QUkQEXO/vgqK9B8htl2szTiMS?=
 =?us-ascii?Q?IBIH7f1SjegKvSszt5uX9hlpUFRkVUnj6W5R2eSYb4Hsjn2AxdKdDa0usvok?=
 =?us-ascii?Q?BJO5b9xZ2RPlU9HKKq2NLxl50qlmrx7UPNhwByKtUGoTrmh5ADYJhpDPdFov?=
 =?us-ascii?Q?sx9HqKMBXPE6D/7LbmERLOB1hQrz98W5nsMjhB3BjxImykP+TMXN44hN6R9c?=
 =?us-ascii?Q?wAsVUhbIdp2f+pHcG1KVqc0JG+ZJoGI7dVMDIcetWNK4Cd1W/P0Q3zFhazQS?=
 =?us-ascii?Q?wiveR9Cj6MtKRoaXZtauFSP6HtMmRZVYX4WWl9Xj8SW/rQk6ibOFPcKWmzem?=
 =?us-ascii?Q?h04mOT5LhBP2yXCwRTHXBgfQAvR1HtLa9kwKs16tXjc0TjqtpkC490rXgur9?=
 =?us-ascii?Q?glNpcXL33CKQq2FLLDNkz81wWRU4eS73M78/OqCiXUv6ohjPGIf+9Z99zeB1?=
 =?us-ascii?Q?6ndNXbo8g34s7j89XpTMYIAOhdvm74Vg2xe3R8ooA2mh8u5Z+iG9VWBQNKCu?=
 =?us-ascii?Q?nVGgkWlp9Bg4VuNTkDjZD35pptShUQPneUqjlslwJoxDVTliaOUfVUE8P8jo?=
 =?us-ascii?Q?E2kHPPDR0T73Vdk8rLSpwgARSrQG+Linn/VQWw3hqpfZKmPLcn9idDBrnYO1?=
 =?us-ascii?Q?gBxeY3mqZPzdoMuthN0kgT+GudmkdiP8reBPIAndg2aZhnysBs0DSjIedit3?=
 =?us-ascii?Q?nQv8xxTIedZU3N70SkgXjyzX5CxfPbueov713rOCQTi5WYVP5EqX7YLRJE+N?=
 =?us-ascii?Q?kWVRVzvTeb0Dntv/ZXF16CZXo+bUjUwUn3bCs9m+8/5YMKwQI0BCFNl1b01n?=
 =?us-ascii?Q?wki3DjwqsLGq6F2fO1H/sk0b2h0=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bba2849-722b-4019-6bd8-08d9aa245c27
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 23:45:39.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7Vx3aoHaIlOLTD7O/jyCnoBK6/dAIG74Y/KZrAnw8xZKDDSGamz1DzRPlxoUYFqCMkcJVX+n7EoYjg/VjT+0u2LCpJbsCw7KtLd5TD7mBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB3242
X-Proofpoint-GUID: wwp3tmMvEppTWLpTTsxHWhwOjYP-i_vR
X-Proofpoint-ORIG-GUID: wwp3tmMvEppTWLpTTsxHWhwOjYP-i_vR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1011 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170110
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hook up the standard GPIO/pinctrl-based recovery support for this
driver.

Based on a patch "i2c: cadence: Recover bus after controller reset" by
Chirag Parekh in the Xilinx kernel Git tree, but simplified to make use
of more common code.

Cc: Chirag Parekh <chiragp@xilinx.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---

Previously submitted here: https://patchwork.ozlabs.org/project/linux-i2c/patch/20210415232532.4070366-1-robert.hancock@calian.com/

 drivers/i2c/busses/i2c-cadence.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 805c77143a0f..22ca4ca2a1c1 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -179,6 +179,7 @@ enum cdns_i2c_slave_state {
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
  * @ctrl_reg:		Cached value of the control register.
+ * @rinfo:		Structure holding recovery information.
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
@@ -204,6 +205,7 @@ struct cdns_i2c {
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
 	u32 ctrl_reg;
+	struct i2c_bus_recovery_info rinfo;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	u16 ctrl_reg_diva_divb;
 	struct i2c_client *slave;
@@ -788,6 +790,7 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	/* Wait for the signal of completion */
 	time_left = wait_for_completion_timeout(&id->xfer_done, adap->timeout);
 	if (time_left == 0) {
+		i2c_recover_bus(adap);
 		cdns_i2c_master_reset(adap);
 		dev_err(id->adap.dev.parent,
 				"timeout waiting on completion\n");
@@ -1270,6 +1273,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->adap.retries = 3;		/* Default retry value. */
 	id->adap.algo_data = id;
 	id->adap.dev.parent = &pdev->dev;
+	id->adap.bus_recovery_info = &id->rinfo;
 	init_completion(&id->xfer_done);
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
-- 
2.27.0

