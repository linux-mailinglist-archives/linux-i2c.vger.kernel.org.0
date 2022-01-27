Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992EB49E94B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jan 2022 18:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiA0Rvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jan 2022 12:51:53 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:21649 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229793AbiA0Rvx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jan 2022 12:51:53 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20RCPRad015054;
        Thu, 27 Jan 2022 12:51:16 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2052.outbound.protection.outlook.com [104.47.61.52])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3duu8kr8kj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Jan 2022 12:51:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAIX43UWLqj2PWFN3Tkz+g+oc/Ov7GTelZGn0E92QAoGdROhfOuB0EUzJAeZs02p9euoTmfFbbeVDak6Vize/1xzeQdK89f6z8JkT+dlrD/pujzetmHrc3OQXaOyaYBZ1qQLKGARSNirRn2BV7ubxcGq6zoQBRcFq7+XyXdMv8lvJOuFbzhfyI6C6WCJHRs3E4os/3LfhLzgE/UOB25pQDZ57mhTymVRff0qQnUHX0ntSuIU/AH48yBoEXpA/VCv57yxgxJBrp4Sc58EDxEbde5OVTudTub7EfZAbtYzM5nh7lo4Xjd74TVXVikDVUQ3EtGH8TwXp6I0oTzTSSVNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrKEyJw/MwQHOGaci73aIm9bViL/CHAy2JGnlnWO+vQ=;
 b=e3p5J5jmux0SimAQXRzYlfJm22eTYKXYZWrMuNORlFt7N0rbr7i+ANCBTpsK3GglO+vwMBvh2o+u69eCAyBu6NJY0uPXQVAIgwvC8Lu7gcMJAz0pQ/TsFh1wMQeTvfx3O0Y1l532bAcjdiNaQDy66uVpTo6naP+Pz7FtW5MWNLCvOmw9CCAWWjBwtVViqb9pZrzzNRS9XW6/7GTOPfUDwmizAnoYXmurZ5I/Y7Ol0DJ4hwJe5vfx25KEdLJA6HGgPAc48+hsXsGPBm5RRtgK/wJWZJ+oHCVf7fGWjIXxjWdnUiqAUmcjcApSMFUv7TbU56KbLsiYGykJuDbVhlaQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrKEyJw/MwQHOGaci73aIm9bViL/CHAy2JGnlnWO+vQ=;
 b=wiIqxidOziNFGNrjkxZNamn2W0NQ+PIET8rcB5cuX0izLlU5KE3JDqIBwfLXXbfhHv4mQjo6aNVkxJR9FN59kVhcEZiPGR5ylzJS5rylhYnzwIUEumXFXfJiSFq8YSxnaX9Ljtrx0Cvx/pX8ov/IVpoqcZ9YMJ6UdxF4Claoo2A=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YTBPR01MB2765.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:21::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 17:51:14 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Thu, 27 Jan 2022
 17:51:14 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-i2c@vger.kernel.org
Cc:     michal.simek@xilinx.com, ben-linux@fluff.org,
        richard.rojfors@pelagicore.com,
        linux-arm-kernel@lists.infradead.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH] i2c: xiic: Make bus names unique
Date:   Thu, 27 Jan 2022 11:50:13 -0600
Message-Id: <20220127175013.3689724-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:610:b3::13) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a81c7859-10ed-4753-11ea-08d9e1bd9c99
X-MS-TrafficTypeDiagnostic: YTBPR01MB2765:EE_
X-Microsoft-Antispam-PRVS: <YTBPR01MB276572BEDD58E2BFDB998382EC219@YTBPR01MB2765.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m8nv7lTTU5RhzZDjl81wxQqXxbtn4TwQx1OHaK+JoEuIpksu1gkhPFTDco6pQ0i+zpomGTuUX+lspzmsOVoyLLWNafvqMtgM/T7Xwe7sOgz4ghNg9aY9DeRtmCoTlHPzjKdckC9wUA+k4kvbo8brSaukXHgA7RvEyufra6GZqgW1RcBP3JZqcJ52k25ln9ZZu8C06J0eq0Q3O6cmABz09JvYGGnMzdFG+T6DwGlKrdmApYN1bMUhHTUELArLtthazM5uVGa3pCuVleXH5R55eSSBbywK5M18jllDL3ivDqBs4pxaRTGfkVvpX21iYRX4RjKGpVI35yfSeGf523W1501v3JsnKFLiFtVpIcMeUsB389gyGJLdElFBxe4ZrY7JSGDScXHCUjVp/J0fyfINvIzZUA5wf7pX+Z5EBnrmXFc/WNsY/PGhPoB8NEJPqwBxpwCzDFE+fRKdkki1lsgJUM0Shyov3ntJwRGpD+3ItezBymjxeczv5t3BtDdLl49J6RZU/diss/zoDhwZw9avL3m67mk/kkLbDB6MpLmqw2qu/rBK0C2J4vDMoIWpRfV/6XwCTTCqEUxf/JHqK5GZBKLOjhMa7OJHhj8AD4LdMg9RvLUiPiWzxnsxIarvuFqMjsD9GI67Sat/Lyj7Gbo0zgXOQ1w2hV9uF4VvaWTI31mU/DKzmVOsRVdZU/o0RlhS8q7yQSPgGvxVgHFH/faJNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(66556008)(8676002)(4326008)(8936002)(6486002)(52116002)(6506007)(38100700002)(508600001)(107886003)(38350700002)(44832011)(5660300002)(86362001)(2616005)(36756003)(1076003)(6916009)(26005)(186003)(6512007)(83380400001)(2906002)(316002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZJs12Rg1LoXww6Hz1970z5boi/jGzG3Nhb+zgnlPH9x+YrsCJ7I86+X1g9bS?=
 =?us-ascii?Q?hQ6KtL+yt7fFUe07dLhMeqXVhyIMVNM7n2rW3dtDEIkH/0YWhDvyhjx55cIF?=
 =?us-ascii?Q?E2cR1htVuikXET0QXMATfAksvce31iS1NoIfbPK4NBcGXRvUa15wc1WRs11M?=
 =?us-ascii?Q?GMHCV8ZxPwlGepggoo5TljcJHZodlq2f/5hn6D2eha6sQGu1rMPJ/ZbHCU8Q?=
 =?us-ascii?Q?eFblg4vfflPaLoSjL1Ce4Ax2fi5h61OFdO3l/mRtAzjMDMuPnM04UtpihiiI?=
 =?us-ascii?Q?rg3NhQOhMFQYLRS6jdxgzDS4CvQ4g301o4yEZOnvCJg4rgJKKkAS7tSK+RIb?=
 =?us-ascii?Q?QDhLEc8scX5A/ptvEbptB73Rm/fMigStzngs36uqhFgeimx7Ygydq0Y45ach?=
 =?us-ascii?Q?7Zq/dm06R2X0IdYzXig9niJokmvibKUgIHIrcx3ZR2oVw2M65IUJs1rkU9VL?=
 =?us-ascii?Q?FVyrj8W0XsFn2RD76jWJAy8sNWv5fox9Cn0CsfaKkKjBahaTQsShwJ1Y9lFt?=
 =?us-ascii?Q?koKZDLTs2L75ifCR78TaHHnBWyTasDTF0EWC+ygsgV03DSrrabbWONPAAMx9?=
 =?us-ascii?Q?w8vzkgiWu4MnSW+6I5GmGmaIoqFNqXk27XMIaDtxMl3azi+yhx3o5+9k2fvj?=
 =?us-ascii?Q?OD7fL+qlq1JUQ/a/GZNk89kteMxcN7gUFCmNN84jZy5Cv2Mq9ACzJy2R/gc7?=
 =?us-ascii?Q?gTuWHiizKiQ9qwt5XESnebNSJ8ux0n+dUf4iNuK0WTvoWVVDIP2PelaTWsfm?=
 =?us-ascii?Q?gntOzWOurotXR6s9jctv5c8jPeeYXTCGK3b4+V32vg1Y0h6ABdRpW1yLRNC3?=
 =?us-ascii?Q?kiJwjMyr5Jx/P/Bc2r/87rsdi4xtVHRcO6pCcmwXTOGhVgIh8ValyJysVbaZ?=
 =?us-ascii?Q?3uuHUwWQ0xIfBUhYVlmoU/ml9Ucib1mkbGnPYOQR3CjXgpc5fDbp0Oe8jTIp?=
 =?us-ascii?Q?rJozytOwbvIRkRwW80o9/I3Y3Ix89fZp157ycxkxxYugXVvCjRBbG6R6E2LM?=
 =?us-ascii?Q?9UXu9nUGZEpX2bYv7xBZ8DymCivj/ZzPjXyNWwqrxR73reMtPf5MLUhIGv4h?=
 =?us-ascii?Q?cja8vnWMRpvIWBMGNiVto/0ReNiRtz4GL7ic7BSQCsR0LTqc20jB0L1/OBEc?=
 =?us-ascii?Q?rJ5NBltPlcF3CYXvdnplFBD3HerlPuf78947BTnXq+xLV4Hw7ByriruFSQYS?=
 =?us-ascii?Q?3gcc79FDO16e+mAcMntiBfBVTKIaM6up2OsI3DcgbnIjuMXRrKI4PKgPmGkP?=
 =?us-ascii?Q?VQ8orGoGVlBnvL5qNZ4pPd9u+EQ3W3GicguuRAGlB5a9HBoRrNc+UOYcV1rQ?=
 =?us-ascii?Q?kkyGMOcwjpxMlSD6Tz6q+ln4AwkijC/cWNkub5zBWzSKwST3ScWC5qpvWOFR?=
 =?us-ascii?Q?WfrnRDxj7KG7LfmlGUJwutNWCrMlkAu0MCHv2Iyh9pQvhLqDHDCqQfW37Eho?=
 =?us-ascii?Q?D1oLLdUT8ZQCOulp2rs74kY42NvAdXjg85tKAAJZb1L9qzMHCgcJcIpM/MfJ?=
 =?us-ascii?Q?TFaXOOKjk5xZY5/o1zJV8GbQnog5+LALOJPjrwhLafjIcW8EAvuMEd7FQvTP?=
 =?us-ascii?Q?stLuvxKf9HK0ui1s7rW2cSlmaOa9dNFmaBAbX44vuRGEwb3QRmkFryzT0Sqh?=
 =?us-ascii?Q?U9B/HRt+ZzNIO7KmQ3u8/yCv1PuCSbnJv5vXUUTS7f4BQCV+BtqXgOLoeQlk?=
 =?us-ascii?Q?nue93Z4iFZ+NpBDAM0SCEUfcRSE=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81c7859-10ed-4753-11ea-08d9e1bd9c99
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 17:51:14.3387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgOjU4RpEERPmOAlZr1bTJcfL0/ZK4hcRpYzCgTjSFkhTVCusip/q9jFT76iN9oFk0aS7oDRTLFaKrgMeyN3xizOByVsUoP0M5xqUcf092A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB2765
X-Proofpoint-GUID: -Oz7_vKYF1XG_eMhJ915X_MW-fcggcam
X-Proofpoint-ORIG-GUID: -Oz7_vKYF1XG_eMhJ915X_MW-fcggcam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=696 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270103
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver is for an FPGA logic core, so there can be arbitrarily many
instances of the bus on a given system. Previously all of the I2C bus
names were "xiic-i2c" which caused issues with lm_sensors when trying to
map human-readable names to sensor inputs because it could not properly
distinguish the busses, for example. Append the platform device name to
the I2C bus name so it is unique between different instances.

Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index eb789cfb9973..ffefe3c482e9 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -734,7 +734,6 @@ static const struct i2c_adapter_quirks xiic_quirks = {
 
 static const struct i2c_adapter xiic_adapter = {
 	.owner = THIS_MODULE,
-	.name = DRIVER_NAME,
 	.class = I2C_CLASS_DEPRECATED,
 	.algo = &xiic_algorithm,
 	.quirks = &xiic_quirks,
@@ -771,6 +770,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent = &pdev->dev;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
+	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
+		 DRIVER_NAME " %s", pdev->name);
 
 	mutex_init(&i2c->lock);
 
-- 
2.31.1

