Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D93D75A1211
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 15:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241333AbiHYN2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 09:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242652AbiHYN2j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 09:28:39 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0333AB07DC
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 06:28:39 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27PD9OB8004556;
        Thu, 25 Aug 2022 13:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=uAUYVhTwINRxYA2V2oBxw1YSw/edhAsjkHp8bWi8hvE=;
 b=bNg9g5df6mFdbTDVjkIQXcbNDMwhvIAhP8azfcgc4eMLb3CcRmKl7j8J2wsReUAqM9Mu
 /DWh4smoWPHWhQscEATqCthfrEYx4v6YLxFa5B6KFtOIOnnmSujLjFpGIbzhK/K6OxYJ
 O5LLoayyTkrpvRWPexu1Bepog4dqiC3dTtEwZwBzITBQLnJW6NxFCRQU2VGmhVOl0nkN
 5N2IF8Sd1ko3H+WCtJfb6n5nWKt6bf4/ELfPDfc5Jj+/j2pBZ/tRXAfZJ1E5NcYSeJVZ
 QWw80DPjd18UGZEBanRTMr6GKZ58LyNA8rx88v0oVT6T+TKbaK42JaivYUv3lQFSV08s uQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j55nycuau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Aug 2022 13:28:31 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27PBXHRA028421;
        Thu, 25 Aug 2022 13:28:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3j5n4mar09-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 25 Aug 2022 13:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFsOH1cOk2RE3/EMaO0UndW+0Nnd6c8uIVy29UO0fqekn69jZ0R22CblfRTVHBpIBkCAi5UKXFzIIjJikXjBrx4vISxR9pnMSi4GBfTQYCgeDqNdpOz5sYVUtyENUrUXh2uDvn2WGJk9qS1hlApv0ZINLnbJ0FD7pQuHuWCJTPnxE/sbvTRW4iotfikyZOHdI5h27iWrAguBv2vMEiT8IFqLSR9RQr/axbeMDKQuqnYeELFVrg8woBF9z6J/elz7OqzKIUY/Hf9c+j0lYbT5rL2e7009eN9kqRHIZa4Aq1x5pW2WQzb2UDIYaMF7JHh2w4Yz3q67uCe/3+ceabqbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVnuNPvV8iffRJh8cwNNvanXc9O9j89Ogi1IzA6PT7g=;
 b=mDaA/daSY4w8iIYx2OKPjUDsRLI2A1wvHuyXlXkNQfY8t9AAYhpO+Skgour96V/hFnssFRDeXBpeHea8AgV4BpX+iTZaXAQENn8Hm8qcTvImQuSdeaZUCFXw5v71Qm/iv+gX/OjcPPC2rv8YwHeks1xi1RA4+Yg7LAJmK026w3HuXqu95hQRl/4/j0nTKkMh9YWjdkAT2SatvaQmj24V20pZElXzUojEnIHoubZgRCbb9zJov2qFUAFCN6BwhMuQmsReiDWRoE+lBl+4OYG/EZjmW2fWbtertloRKJRSvmQjsNWhOMF4vE8lEnyDTaCzbe/Pw3gFQ0dV5lNrLO4lyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVnuNPvV8iffRJh8cwNNvanXc9O9j89Ogi1IzA6PT7g=;
 b=H0nPavktuXqcDiLTGHGxaCvKIXl3GnNY2jd0nLgJW0Xn+8aSm6Bkli5XubiqlcbZd9fLObZxzrLZX91ccrU1rwROcd1C1sjSUcpMnSRzPJ0WyRAqC5YXPdh+avVDLr+clbGvsvM9ImV7O0mEZZ5rheQqQhaEQU0gdBovfr9UK1o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BL0PR10MB2849.namprd10.prod.outlook.com
 (2603:10b6:208:30::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Thu, 25 Aug
 2022 13:28:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5546.024; Thu, 25 Aug 2022
 13:28:28 +0000
Date:   Thu, 25 Aug 2022 16:28:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     u.kleine-koenig@pengutronix.de
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org
Subject: [bug report] i2c: imx: Make sure to unregister adapter on remove()
Message-ID: <Ywd48/BdaB0Tcwpg@kili>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0156.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cafe8cbc-31fc-40f8-a289-08da869db206
X-MS-TrafficTypeDiagnostic: BL0PR10MB2849:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ypm7e1W+CgzfSXhhjcCJDlYIvNOZkIgDkK6Nglr9U8b9xaZz72UE67F5oeuQO1m4boP50X7tMbbC27LqKB4bp82pO7VCmYK6JcXzhqmwapciVV5o6+kSEWqnaRWwqMpElrlJ30bYt2WM0Shw0x10UWdmKoF0SgUc/75vxf7q57c3UBkTYmfxZcJhdQ0R65w3MWipwpjSI6OZ/9sdHkSdSbg2PL1ygMnZPnnfw6CnbPg4nCiv0mEbOBgTFjQ2Ekjo09MkPLUI4MO3Sv6MId18lVd2qOpqtezB8y/dERwo9CmgHAgbvK/wAPRBMt+Vw6xMuHBMFZk7hZWOn8qGA6aSTWKjWE7MGdcD39S6VlfLMvdpK+umhMPOiRKsx3rfKbklcLhkoVzooXfr1D1HaZ0Pn5MvyWsEg64Z48Fgca74vXH414AMjHq5oGyTzfIVqymFxceWPIXZpOd/irriRJlHcTE95YOjnr7BuVNcfaIoVFYJrgpx6oR7VcVbWblJehOcj+bTjnHlOapHGsyVQ/oNeZ39bBghAIf8Qq17lt3I/YYYUG/krf2FD4MCWiTPxqs2HDIGO4QCtIGq0doLgDRrPku84pyCBlxHeJZ5qCTWPMH3JFhjGPVSrmex1U5TNm2Pz5l5cscNXe6dHg5gmDI+jzm3jJNxlPBK0y66D45VWQxiF5597owDR2iRN+e2aAyLf4wqMn/wEBwFmpV4BRBCPf2I/RAp+sSRmWv4Fex+i2NwP08SM415c9HrwiTgm7JIkOkUCZ2HMrMxphhkVyvhow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(396003)(136003)(346002)(366004)(376002)(83380400001)(8936002)(44832011)(6916009)(38100700002)(316002)(5660300002)(2906002)(33716001)(86362001)(66574015)(38350700002)(186003)(41300700001)(26005)(478600001)(52116002)(6666004)(66556008)(66946007)(8676002)(6506007)(66476007)(4326008)(6512007)(6486002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HXkfz4UoGl2HM59gcCh2okUPZs/O08L1pXYFlK3QnCk1zZGPgXNTAX91gb?=
 =?iso-8859-1?Q?Hid69w+J0g5h7EuAXcZLBFuM7NzCeanUhGtixd8Z8NOeq3tjcBklwHP9ef?=
 =?iso-8859-1?Q?kP5kcytfisJzQnlDnJngtxPeRl1O0QTB3AUUS78Ewi4xyrDd1M+Z+oyO4q?=
 =?iso-8859-1?Q?tFUruf+IrFOVx57guEiriu06CZ4SDVCI/7AAFy0S7WkUt4hcTwDBaYLlz2?=
 =?iso-8859-1?Q?2JzA+ALUA9hlwQFztvCs3C1x/QMDWqdfAJjUMmkuXKqlP1Ze4tQPuqq/Ou?=
 =?iso-8859-1?Q?2+BX9uPKSQ927IZDWWOXu7BThmiKpzib/dpOTCVFtv4bslm8faz0Hz/hMV?=
 =?iso-8859-1?Q?6ahwBeUo0PHgIxkXc0gQzcaX8FdurxIKINzx9mOnBE4QDKqj8F90vxYuch?=
 =?iso-8859-1?Q?Cc3BrzbXrY+LXUtTLXzY1nNnVPRvREWMshfZXfR+wLuEdHF0necJ+kBhLs?=
 =?iso-8859-1?Q?uZJEyrzot1fLKw9YnRK18Ieaf+EqiqqTU2uR915sVd4sbGK+QFf7XmSHQq?=
 =?iso-8859-1?Q?V4b0mc4ANIWEMcg+eclRqO0BUzyubWM7A7Hx5t9i51KhTlQbYlKo2WNbVd?=
 =?iso-8859-1?Q?vnc+UFeHY4uGxwzul5gQzOT+7KfVxAu+xbsGw8V6sSA3OVkSPiB7g/95co?=
 =?iso-8859-1?Q?X8YukHMUg4MSJPbFa55jJ0GaVi/qt15ZEZKM7Q66DQqSiiaIOombtsfZAP?=
 =?iso-8859-1?Q?LW54FpmTfb7F37RNPVE5VAyU5PFwOxRq0oj61IOfL68pUIaWnvqY2zKCrS?=
 =?iso-8859-1?Q?WL00ZluhN4UGvCx/tSVbf2kjMY7N8xrTD5RIPDgUp/8bGpCL4cxSx3z5Ti?=
 =?iso-8859-1?Q?Jlr8JObTWLPqMR4L4LWC6G+p5K8LD/p8r5MOU2FGaq2m2ydQ6/HMYwnurQ?=
 =?iso-8859-1?Q?Hfh38iYM8cDDCM2rZ8pjZqZaeW36Jw4MBtT16c5KDgfzFwh7kudomla+Vd?=
 =?iso-8859-1?Q?V8uQtED+XgVno5ec9yoDhagTlZGhayiZUJwzPNmXdTn9TVCvX6pT58OacE?=
 =?iso-8859-1?Q?oK7TYYA86/w/GzTHtzGOYrH0RgZV5C5qXt0kZiF629R+yTdPvOTZKn4NMF?=
 =?iso-8859-1?Q?EqrHZC/LtZlh+SZ1DRBC4LastxdOqVBmnG7RdEOsXCrd8zTrhpbVmWEyV1?=
 =?iso-8859-1?Q?IgoCco/LJMSS6B/6XUzd2JDQxwB7N3qXL3eZAuRPONtIgbgL5PBqYvktWW?=
 =?iso-8859-1?Q?03PKn1b661wDxDmWEI49WsLd3mz4fwYv/8dO60+J11drMtCU/yA7wForNL?=
 =?iso-8859-1?Q?Y3kb3M49B83ieQmfshOyRwrzyGwldCHSLV+uNmZdGsrKuS86EMOrZB+qza?=
 =?iso-8859-1?Q?IOXD70TApQzarJhG9+dLR7FXVznUpAhcAbEhXBorCmgF8+OD7l4V/YidBp?=
 =?iso-8859-1?Q?OYbLx1ft9XN+1A8KOTDdxTAsTcSO5qexPvjKyAr4jvNXSu9F+ftPuDyqiB?=
 =?iso-8859-1?Q?palhnMO/gjzHDXeKzxjVkWBuUiqp4ojjabUOdIbT8kBBKUyBRSXKPMDAEX?=
 =?iso-8859-1?Q?1KHOsXDjhRNNsrK+23g4TkgH6YJ9NOB//I5muol92bex1SQKkXL/hCOmE0?=
 =?iso-8859-1?Q?keqojmylIS8jYRRprQbXQFaHu/f9sTpLIbjvk86Aayxy8vM8yuPaBVjIDN?=
 =?iso-8859-1?Q?vo5BtYDIpmFpdJxqZTbfd4e41vrTbrUKAdHNH68GOzvFdcutxwJCCyZA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafe8cbc-31fc-40f8-a289-08da869db206
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 13:28:28.3613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ictzpsV31eQhzKZJO0u1mDQs3lfYfCKvKgi3a2wD2b/piTj41YSurqV8O06FB7ZiDA4TGzjaVRdTGwDR+jQjgzT0rGibC+ox0xhagQcgYAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=826 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208250051
X-Proofpoint-ORIG-GUID: QM4vSLL5qdWR1QeM3IV-KqGBOsh3wrap
X-Proofpoint-GUID: QM4vSLL5qdWR1QeM3IV-KqGBOsh3wrap
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Uwe Kleine-König,

The patch d98bdd3a5b50: "i2c: imx: Make sure to unregister adapter on
remove()" from Jul 20, 2022, leads to the following Smatch static
checker warning:

	drivers/i2c/busses/i2c-imx.c:1586 i2c_imx_remove()
	warn: pm_runtime_get_sync() also returns 1 on success

drivers/i2c/busses/i2c-imx.c
    1570 static int i2c_imx_remove(struct platform_device *pdev)
    1571 {
    1572         struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
    1573         int irq, ret;
    1574 
    1575         ret = pm_runtime_get_sync(&pdev->dev);
    1576 
    1577         hrtimer_cancel(&i2c_imx->slave_timer);
    1578 
    1579         /* remove adapter */
    1580         dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
    1581         i2c_del_adapter(&i2c_imx->adapter);
    1582 
    1583         if (i2c_imx->dma)
    1584                 i2c_imx_dma_free(i2c_imx);
    1585 
--> 1586         if (ret == 0) {

Probably this should be ret >= 0?

    1587                 /* setup chip registers to defaults */
    1588                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
    1589                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
    1590                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
    1591                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
    1592                 clk_disable(i2c_imx->clk);
    1593         }
    1594 
    1595         clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
    1596         irq = platform_get_irq(pdev, 0);
    1597         if (irq >= 0)
    1598                 free_irq(irq, i2c_imx);
    1599 
    1600         clk_unprepare(i2c_imx->clk);
    1601 
    1602         pm_runtime_put_noidle(&pdev->dev);
    1603         pm_runtime_disable(&pdev->dev);
    1604 
    1605         return 0;
    1606 }

regards,
dan carpenter
