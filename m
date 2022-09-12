Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E205B5B34
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 15:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiILN3n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 09:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiILN3l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 09:29:41 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47687BE24
        for <linux-i2c@vger.kernel.org>; Mon, 12 Sep 2022 06:29:39 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CDEfo6003056;
        Mon, 12 Sep 2022 13:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=W4nxZgHozp+opQ0tk5BwBapU82Z+zTB5BmJn5UuW3fM=;
 b=GmgQQQIqXVuCqccpeXCKYjS9MKYPQaDNTuafENbbvK5W3Pj2MU20ZWKx/cuB1maKvWkx
 FSL4PEkeXHD2v8xVKCSgjo7XK51SisoztetBDx8q0fTWC4UfPS9V8biqz8/nbyLyweGj
 8Y0rTKjyG9trLNnoH87cU618ThkWc69Ul0z5sNj7niEo7ifq7lbAPfWIDGf5A6VAzvZi
 Bzd8DQdKDEvaRc4M/MDwnogoTseBLBSLQIObQty/cveYZIPq1fnMIK3tjHi1xOcYZdfp
 /kCr7tn+DQ2mGMQ3h9hiNwKppnXbOBRs01h7OQ2QjmDYJLjskH1+tRWu70gjqMqm9FwJ jA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jgh61khm2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Sep 2022 13:29:29 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28CCEhNw020520;
        Mon, 12 Sep 2022 13:29:28 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jgj5b14u4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Sep 2022 13:29:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC3BZFw+GSrPvyQSGS0/zPHbYR1t6v+A3q2X/QZhGqkUSUKThuJhwSSQ2h+i0J5hfBLtQ1Ey2/rWCPO9OpoK34s8FxvX+moyyvjJ+XhL7NvXJZ39lBjZ2HeN16C5mIeGM/y8hEjYWYo0+Qdt2l7GEpXVIEvKN9ERDGy83Vo2vHEuX08jM/pWk+DIMBAjxe3kFeU+TD89YlgGYHt+f8TmOh1vUlksjaRtFHSpQtKyBdR0CvQSH3kV/VduukQ3rjP/QqGZ1ni8Au0I/AcZvDx6dxUcTdgmbIISGMH4nrLWePto9tDDB6BQEr+4lahl/YXv6DyJ0wZalVCl3edB8V8wEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pw3fML4rGKnH8IkMeNxgWoYGY+FJBsomHnPsKdnHd2E=;
 b=D7YImisOvA50l73U+JYOrfBCvKB17MkgnWhAILumE4KDrn1uccVv6Qe42WIAS24X0BNkzM0dB09i9gTcmm87n8xrudIWAlcHUMz2Y5vBJNozAtnAZ35K1WyTqDlCQ6z8oD5QAMTMg4Inr7Z63AZky7ENcWVdu1ZtZeBjuQBQiwIJUvX1OG6BAGpEJOVDPyUVXFSnkli3VQr1L8SG1Rp5xgcuaXryIolWtQ2G23KIDh/N/HfDjFjgW8oMhXTtAL77hFGCa1fHIGK2F/VAuj2oZ8k1EtQfNHr3GWbiC9X+SSK7X/Mrdz4ln0wvbfSQZlfs60X4DfFxr4cEvFJgfw3LjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pw3fML4rGKnH8IkMeNxgWoYGY+FJBsomHnPsKdnHd2E=;
 b=qq237VUwU0euqWVRiJz1v1nubcelfRz3h4nRltcauSpaXSFZPEqAQgFiOOo480cJ1uGYEoTZwPXsKn58ObB0UF2rl6KmZMvr+959qm9lnEsKL1O1yKslXs7PYqIQMj1hw0FShdj48E8yG04exZF+yyXxVoCoVUMQNq1YEyQ7Qp8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BL3PR10MB6091.namprd10.prod.outlook.com
 (2603:10b6:208:3b7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 13:29:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 13:29:25 +0000
Date:   Mon, 12 Sep 2022 16:29:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [bug report] i2c: imx: Make sure to unregister adapter on
 remove()
Message-ID: <Yx80LE7JyEHXcH5r@kadam>
References: <Ywd48/BdaB0Tcwpg@kili>
 <20220912132428.j5gnwmpz3yr7twru@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220912132428.j5gnwmpz3yr7twru@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BL3PR10MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: d448e706-faee-49f1-37dd-08da94c2cf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mgQw87O6cf2uPkXb1Hj44IcwAP5DEz8i1ZOgolmM8GMihi0ohq7J6uGmisZ6SPvc5ZA9OzDyLgbEXzCXeARBrBctQnNKniM75rBaFI+Q9eYPztYrKSasy4h+krhcwNOUKFwxv2kYovYjZ6Ifdsl9AzQlQ/x69Pc91XovX7HQy3/BGQr2bK/Zkg/GE6PWWA9ergh5p+SVw9j662F0+pmuQ6xYw04gl95gD+dUgbccdzeDys3/OPd5YQCeFfQ4QzZUI9Bn/yhq6N74cmw+dDo5VQ9L8+PXdPrfOmdanC2XmUDyKiO5fFRJaATMT7KPIXQCt/SsbG5EJvB4slCIOh4HxMfKUX2wRACGwsRdkZDtKLMqLZvlrMJwOZig8VMBFGkzbHiCk3CxQusSzx4iR3hn09XzPsFsW8ZO5qiIgbriNCvphpGHixdnzP41M+5wZTb8UqNHgEk8VHDcl4rS3532T4mDwBs81zmFnE5YMRYNxsl6qVfJ7gX2AIOYwHxJfNYN/8osN5w33kX69NgGWFU78ntwA09ZeGgRtDawFCfs2ILTcqFwGlpGV7PKutKWfdlXsbJ7yre22+zGGBN63OGYJNdjnEv3K/Iuj5lcwTFaYBhmp9jcmyeTqRvDL9exdg+8h7wG2rgvE0el7qs3+tdIMhVZiyPLXZHihAjwRTY0yU8mQAZzHvvf9JIox3rDXQa3Hm5M768XL97DEmLC5Qv7RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(376002)(39860400002)(396003)(366004)(346002)(26005)(6512007)(9686003)(33716001)(38100700002)(86362001)(5660300002)(66476007)(66946007)(8676002)(66556008)(4326008)(66574015)(44832011)(8936002)(6666004)(316002)(6486002)(6506007)(6916009)(83380400001)(2906002)(186003)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c3KBKn5VZGQKChWJCbo/TJjoKA2fq16pvbZpmARa3VM3ukB1AHZ3yyAWQK?=
 =?iso-8859-1?Q?QljMQEj5/8nkLcQJERJ2xwTT1f3yVdXodjQFQpuNmxjGYhgdTSwt3LSMha?=
 =?iso-8859-1?Q?99veoex6KFBTczKoMQSCK+q54wcYJ2PDkM92DE+WQIGQBxHXAQTQWmpdTd?=
 =?iso-8859-1?Q?A/vj3iPkYY/Pd0ZDcoLAzLZr4qQLeERCd9Ju6Y70qjWznCLaF44tCKL8Zt?=
 =?iso-8859-1?Q?0hBhPVTmBTcckmcGWRQD0D4vc/W8O2G4OmOcIg0xHWricsNECfKt7thKes?=
 =?iso-8859-1?Q?AsJBSl2f2dBwiajyR7z8PKqA6evY4zsMxzjb0z/qEFXKNGQ39Q42Wgy7PD?=
 =?iso-8859-1?Q?HJlRGUJ1QFzl6grbp+1o0B4aJxU2d3C4yX6uy7/PHfxHr+1L0ts4Fio/zW?=
 =?iso-8859-1?Q?K3ndo1+kpxMP7Wn/qy4cAE6yRUdUhkw4BjKUGrJj/k64JMB5yZqPN6aZDY?=
 =?iso-8859-1?Q?ejIT1b1xm1CcNtcb9qTFTYvXM0gyvrah16Lv9/jZK//Qwgu8gcmP+w05fI?=
 =?iso-8859-1?Q?rR0RJX5oEs3oiFHB5urSu7F3uifiMy68F7jYSGieUVMMDjAmgjw7AU7tF5?=
 =?iso-8859-1?Q?UbirHJCO4bOs4akexcmo02YaaEHUnlhF450iI9YQpXjy6FeWc12ahlB6Zi?=
 =?iso-8859-1?Q?JiAOArIGf8gCzVZJDaN7UMuhSP19RxbJREZjKxvFgDmobnWuNrAVx4IH12?=
 =?iso-8859-1?Q?V3OAe8WmGLcsNj2bFahr8/1VAJDcQfQULIjnExYP2JhpGYUTmFupNF14JV?=
 =?iso-8859-1?Q?NMGn9UtNMLcAFl94eLols1liJPvDnjJdFj+lxdpOAjsC14UU4CKyveo2Gj?=
 =?iso-8859-1?Q?yFFY+elofbDUiwKCcxcpI01xyzTy/bCr2c5yZjqOGg0MGOz+Pj0IZXgzT9?=
 =?iso-8859-1?Q?qCQc/658lpMCI5C1Tj7mn0HxtQHEqGNFL4JsM9+lERuile7VNxEYCxJ4Ob?=
 =?iso-8859-1?Q?QFMB4JDqNpRwXnm0Mqggsbt5n2I99ygYEdlTvuwCXeUhlj5GMT9Ys0K+WT?=
 =?iso-8859-1?Q?BV19FzNk+ui0qYguLko1fADNm8A7LdXfgS8ORHUWleNDyBB9DMb6G4yyXt?=
 =?iso-8859-1?Q?IKpvreiEJj7vJ0LmauHPd5afWbJR2syppOetspA5gfuX/lRwd5vAmajynk?=
 =?iso-8859-1?Q?p2QkGIa4YPhGPW3bWws9TT3PuN4/yn53IWwdkmspf22j1/exlUA40c4FWI?=
 =?iso-8859-1?Q?h0A52d7m7N4nzTQB+2JPiDqjMzULIkBI0mekQLTKsIYegMkKURQjxsdpdY?=
 =?iso-8859-1?Q?Vr5grL0YXYw+p72MpmkUDtwpYwP8igLV2b7vZsAen1QHt7Td3BfWZZKZHg?=
 =?iso-8859-1?Q?+JLYlo1CawPhrL9RJnXyy+Pxy0joHDKttRDBb0BTb0K5o5IqtTH1rTOEd7?=
 =?iso-8859-1?Q?jcXcrOs/xFmr7NN1CtwVn/6hgZKtSI+w+wWmpRFRW8tabih2UkUANIYBqI?=
 =?iso-8859-1?Q?ViPnm6EJvVX5pUAmiBwNSdtt26UR9woUnORVSffaDNfCNyX0qJqcjntauz?=
 =?iso-8859-1?Q?vx0Sq3jJeInteE1HF2lLhxYzZP+lf26w+3zpohKjorJ7YiXQXJkCc/Jaau?=
 =?iso-8859-1?Q?UvIeZdEQIrVWsZA7nb4krZBsqYCxbggdhvl/4mR65r3NmTaW22ZJFVZekP?=
 =?iso-8859-1?Q?LbL9WHoDWADP4id6nllldczDVjiSXCLI3o?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d448e706-faee-49f1-37dd-08da94c2cf6f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 13:29:25.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQgFC2KvBOZ4cunkiL8EcaHB7SfDpggmQogF91IQxRlNBwNB1ukKyFH6nyy4+HrwnEGJM8WkaeYLq7lDjAOtVaOukWileYhUWZnn111NW/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_09,2022-09-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120045
X-Proofpoint-ORIG-GUID: kZfsCtRmdE3U8tASijybjE663rnFeQo8
X-Proofpoint-GUID: kZfsCtRmdE3U8tASijybjE663rnFeQo8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 12, 2022 at 03:24:28PM +0200, Uwe Kleine-König wrote:
> Hello Dan,
> 
> On Thu, Aug 25, 2022 at 04:28:19PM +0300, Dan Carpenter wrote:
> > The patch d98bdd3a5b50: "i2c: imx: Make sure to unregister adapter on
> > remove()" from Jul 20, 2022, leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/i2c/busses/i2c-imx.c:1586 i2c_imx_remove()
> > 	warn: pm_runtime_get_sync() also returns 1 on success
> > 
> > drivers/i2c/busses/i2c-imx.c
> >     1570 static int i2c_imx_remove(struct platform_device *pdev)
> >     1571 {
> >     1572         struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
> >     1573         int irq, ret;
> >     1574 
> >     1575         ret = pm_runtime_get_sync(&pdev->dev);
> >     1576 
> >     1577         hrtimer_cancel(&i2c_imx->slave_timer);
> >     1578 
> >     1579         /* remove adapter */
> >     1580         dev_dbg(&i2c_imx->adapter.dev, "adapter removed\n");
> >     1581         i2c_del_adapter(&i2c_imx->adapter);
> >     1582 
> >     1583         if (i2c_imx->dma)
> >     1584                 i2c_imx_dma_free(i2c_imx);
> >     1585 
> > --> 1586         if (ret == 0) {
> > 
> > Probably this should be ret >= 0?
> > 
> >     1587                 /* setup chip registers to defaults */
> >     1588                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> >     1589                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
> >     1590                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
> >     1591                 imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
> >     1592                 clk_disable(i2c_imx->clk);
> >     1593         }
> >     1594 
> >     1595         clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
> >     1596         irq = platform_get_irq(pdev, 0);
> >     1597         if (irq >= 0)
> >     1598                 free_irq(irq, i2c_imx);
> >     1599 
> >     1600         clk_unprepare(i2c_imx->clk);
> >     1601 
> >     1602         pm_runtime_put_noidle(&pdev->dev);
> >     1603         pm_runtime_disable(&pdev->dev);
> >     1604 
> >     1605         return 0;
> >     1606 }
> 
> I don't know how automatic you send these reports, but I wonder why you
> Cc:d the NXP Linux Team, but not Oleksij (i.e. the maintainer of the
> driver, who also Acked the blamed commit) and the Pengutronix Kernel
> team (which is included in the driver's MAINTAINER entry).

I try to only send it to the author and a lore.kernel.org list.  I
normally CC vendor lists like linux-imx@nxp.com as well because it's
hard to know what those are.  They might be the main devel mailing
list?  Anyway, if they aren't saved on lore, they're kind of useless.

> 
> Apart from that, I just sent a patch for that issue, thanks for your
> report.

Thanks!

regards,
dan carpenter

