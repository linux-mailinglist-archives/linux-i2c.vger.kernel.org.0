Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A925FE92D
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Oct 2022 09:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJNHDo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Oct 2022 03:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiJNHDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Oct 2022 03:03:43 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3E015B130;
        Fri, 14 Oct 2022 00:03:41 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E4ST2A017799;
        Fri, 14 Oct 2022 07:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=xIKiLi3tpBVJwnOB3U8f80e64s46SFcrZB2Vbz6I0xI=;
 b=NIIJjzq/hgWWuC4dH7Eicng9c/uKfH9sIwcJ3d8EVsQsr5ZkUKKMaDKyM+7638ZFjnIC
 Nf82UmK2+qI9+U5ET9Mu9dJV9fZpp56K7yueOHIxGD+BNjmpjsIipzAfQf14W3oInlk0
 BqWS5J5QOH/SG0IEOKbLQ6ojz3c4quugfyLYMScafta2STl8JBNr80JLgMsDjLcUA2zW
 xmc4V9lGH+Lio0lTKjjpktBLUbhW8MOmKDFRyx7Ksipz7VOa9g4S19iDbn0hrKYz3jxU
 3kcagj9TCf5792ojlw6eQNMCA+KEOwHzLE+zbcy5HtfykAAZqjUiSgCz0bE2Tyb6lt1I BQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k6qw7h83e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 07:03:25 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29E56Ewn000651;
        Fri, 14 Oct 2022 07:03:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3k2yndhxy6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 07:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noO4cRAj+Jt3nBAv2I8F7oPpp3Kvob1fqMepc3/QGqIdeDo3LmeMv29OzEZ4Nhp5tIZw2eBsvEPpQxvOsLYLoNY1Q45qm9zfzp1CqS/BvG1UMLFhjtC9TbjwLTk6JYxq9F6ZGNA2kjVxz2OvhPTexmAcAC6mm8jgOK1tQYMzhf9fYnQG3rJAgKvBXAbf+5aJCToMVhIbkBqZik3VHUcuaYhbvoy+lvDsoPFXLWQimSGrUD1XNtoJ+GtbdjHDgTDKa/FsaYv9/6Pm5KybJSlYrSAhEmxTrsKcfHUh4hlmoXdI9K8kSm88ep8cWmkExkYs8wAn28cGcMRCHFdcXrujkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIKiLi3tpBVJwnOB3U8f80e64s46SFcrZB2Vbz6I0xI=;
 b=ADipBA0zb2k0GpRwHITFe8MWeRB12Xg4wcLgFec1DRX3A63qmcp2etnurzmyjZOFO61Q4j3d///1PqRyn9sJXMNA8PHXOSWO67oeP4eab/nWvkP8x/jMKz4MYEU9xgc6mD7qaFt3HUaREnUUGAIqBFtnRVMmR1UK18S4LT3prlg1S2Y0EtmU91afRfiB5oh4bFR9/sqPzBGw8jKB+lIuQWeLms+AfhxRy0YyIiX3gi8DlQQmzzX9XSqbfBDdA9Rw5WIcbIlPxhw79LDI9QK5dv2pt6e/SRAKc1Xjqrie8AxcfJyO2mdumD761YzTEy6SvPoarIXdvcX6BGcinXfYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIKiLi3tpBVJwnOB3U8f80e64s46SFcrZB2Vbz6I0xI=;
 b=GSepnhRsTO3/AZYTm9vQV29EgnEiYw0aj3LUFHrjHc3ttE+MXm1xJ3kSDSCzbAy2FcJOjQQnf94xe/Erb2pLP95jruQLMuqmFj8lwp5WHhEAXo8LBiWbZk5osney49LfzQVkrbCemhcB41MSncyjWVLHB9DJidykniESoncgTIo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB4984.namprd10.prod.outlook.com
 (2603:10b6:408:128::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 07:03:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 07:03:21 +0000
Date:   Fri, 14 Oct 2022 10:03:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: cp2615: prevent buffer overflow in
 cp2615_i2c_master_xfer()
Message-ID: <Y0kJrSozgFotrWVt@kadam>
References: <Y0bUdt73moVmaajb@kili>
 <CACCVKEEWr-ko9yuZZnzW6icnDesdhajKbb+KWOaVyGDPy9D4Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACCVKEEWr-ko9yuZZnzW6icnDesdhajKbb+KWOaVyGDPy9D4Cg@mail.gmail.com>
X-ClientProxiedBy: JNXP275CA0032.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BN0PR10MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e832abf-cca0-412e-17de-08daadb22dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aO/0aBMu3DmpEZi+UrsSpw89cbMAFjEtOXZMEJyMrtL62a/1oRszOvZAIqHxPxFiC1qDjQBata4nWbClQ9cE9n6jl2pZpOBj/yKZzkf3F1FdN5CNk7Ng3W7oBAGnVSop28UGyEFuDEXB5SW+ysD8izILO+GJHxNJggjHNQ3nVgAT/ij0Dwm78CBzfzD/Fg2VcF0TPipHziX1KxySONr65IISf5EFt0RDWafNewBWQs+4LYD/Z2R3ecuaIvVqkSjkccklmEtnd6BF7vvlK+AyqFHoAreLXNwj0lTVamMs6OXWghHsclAt5vQ5Q2l/i8ijp45r93d3maEjWvaUn4Up5WSRvEUfo2kSwl9U7a0JsGtyzvczlEysOw6mBgLnL0LviRFScdziOTmyNyPw5oerqlYjx44Ozh8V9th7FttmXqRiVB3QkKJRVGtEj4shCnm+raMhnMT6XvRLZndnP5/m1D8s2XHBkhz1l/s7ExyYP8j3PrUD8DbhL6SwUFVCgwTDS6uqGQmjUPjMjFQRDaYtuEkMHuz1FXd/89MrrA2+eGA5NBdYqvCSIL4KGOiOtQo/InHtKthfEHophK8KAJxhpzb6TgFozVRcFAhkCox+u9ZwNFmy9ko4S+OiBEiEU+KBJbnXV8lEbaC0wtnxjVmhZ/TglY/pFeCHgvyNiwMoAQoh9EF7ME1lLQ7c7SNLG8jPkxrS9t0egz2EnCgC/Y6WZj5Z7f9tRgEhKNthOdzu48x2agqkjc0SLAohzbClof6W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(9686003)(2906002)(4326008)(6512007)(86362001)(66476007)(316002)(8936002)(33716001)(26005)(6916009)(186003)(66946007)(66556008)(8676002)(6666004)(6506007)(478600001)(38100700002)(5660300002)(6486002)(44832011)(66574015)(41300700001)(83380400001)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzNUaFBlWGI0N092Rzduc2JOeG1XT3dGNE1Bc25IamwwWU5ZejQwSjdxWlZR?=
 =?utf-8?B?T0V6ZlhRUnJaTnA0Vi9MTXBnN3NQTmxZbkdVZjB1SUU1S2YzYVNUanZ2MkZG?=
 =?utf-8?B?SmUwOFNZTVo1REFacWRmOEVyekxmTElzai96MWFyTGVDOEprY0pnL2VuM1Ry?=
 =?utf-8?B?MVVyMHRMRmNOSWk5MTdMMFBzZEtlRmQxU0NReEtWNTdiRHZlbXNhaUhKZHFE?=
 =?utf-8?B?c0MxdW0yLy9xN1lRWDBRMjF2cEVtblVnZ0FRR3pHRTluOUZKRGM4RU9rVUlH?=
 =?utf-8?B?M3pURVFhT1hUNTI1a2ZXaGdEbytmbE9jU01TS1lQZEdaNCtsWnZZQkIxRjVs?=
 =?utf-8?B?NEFrbGMza0tKT21LaDB4dmZLTkhtVjhmNm8zeTU1TTJDdnZHTWt2LzFEVXJt?=
 =?utf-8?B?RUpGMFVPV2UyQWFaL0crdVgrZTZLTGZRWkRQODdwa01nNG1BVEZjQW5IZnBT?=
 =?utf-8?B?TUgwYnNBWmloMkdJYzNjNTZJQVcrVm8yeFZ3eUFxR3pzanJ5clAvcFNDM09U?=
 =?utf-8?B?RlE0ZzIyWEczK05CVUxnUTFxWEloVURnNFNlNGZGNUE3U3pjT3ZNNnlGNFor?=
 =?utf-8?B?Um1qZWs0Z3dRZDVrczViQ1luSmRqWFBhUHE1amlra2lnclJEZzk2dzNsdG8r?=
 =?utf-8?B?U1h0bytiajBZUHVQY1RxcVo0MlFSb3cxcWJndzJsUzJLMFNYbkVzQUJwQ0l6?=
 =?utf-8?B?NTVacFRYbWtRSzJzcEFvWm5zckhsbjNBOTlFYlJFT25xRGhhMTZEVGZCMUMy?=
 =?utf-8?B?SW9oOW9ocHhXMmlJVENoNHViTjNEaTZZUFJHOWQ0dzc5SUFTSm5tYVRCV2tJ?=
 =?utf-8?B?ZkVTNGdPOC9CZWUrK1VTeU5UcmtBb3BaZzgvTkE5aExZQjVFN2xBVGRTYnhZ?=
 =?utf-8?B?clI3TEJmRzI1eDlEMjRGN2p6eER1UTV3a2JraFpXcWwyNGJ4MTJjQXBYeWVh?=
 =?utf-8?B?VjVVaGxCWFp0WitMZkFtbERVdG03TUNjQzV1WVp1WDNyN1JhSGlta1M3VVc0?=
 =?utf-8?B?S2hFNm4za2RsTEVtWndxU1VpMjNYdU1rTjJzK0dKTDZjdE1tT2tJcmZtK3FT?=
 =?utf-8?B?MVJjZEVGaGhRUHl5cEVNWGpPSWhtRkdZeU9uaHV5QVM1UU4zL1djcVhZS2NO?=
 =?utf-8?B?OUtHNFZBSnAyNkt6VHI0MHpiRFlTeFVLYnFqMStYWDJrcFJLbVN6ZnFzMy96?=
 =?utf-8?B?N1h6aGptWDI4L0JVdlZUcDRhSXRTMk0yNEI0WFNrQ0I3d0J3bUpEcSsxNVZI?=
 =?utf-8?B?LzZGUHZFdjFsb3VXMnpKMHlHUHQzSmR6ZTY0S2xLTGxsTW9YQlVMUVpXTmJL?=
 =?utf-8?B?ajRoVXFDbUcyUlQvVGUzblBBS2M4QjNSeVMvR1A0aEZsMHQ3ZmNxZzlBMzU2?=
 =?utf-8?B?cmgvTjlsT29MYWFyTVdveWJWQ3dCOGFrWGVEbkJHaDV1REo3ZkM1SXVnMW5E?=
 =?utf-8?B?NUladjgzbk1YZk5JWWZVWmNZcTY3WVVxd2ZQaXRXUnl3UERtSFdCVm4yeTRr?=
 =?utf-8?B?QkZkTjd1bXh3cDFyTEQvSGdoL2RwTXplQkhKUkcxVkxDckh1TEVsK0Zyc1F0?=
 =?utf-8?B?MklDOGVaT2Vyb0MvWlFIcnBUV3kxSkhDQXJDaVRKbWJyd29QcFc5V0ZqTVRv?=
 =?utf-8?B?cy9YN2NjODdUNFpBZVJHc3JGYzkvVkNRbFpkN2lKWnVoRVBHcUdtQWdTMWN1?=
 =?utf-8?B?WlBqNEdwdVRZbEtBMjBZVTlzWTFnRklMQmttN1hVcElVVDF1ckh0SmxRYzBX?=
 =?utf-8?B?dWx5Q2tOY2RDZGQzMjlCK0tKQ1ZXdXVpdFhwQWxBWmhSZDRQcUk4ODdScjVt?=
 =?utf-8?B?RnYveVhORFZ1WHFyN09Zck9zODA5MlpNbk9qY3VScjhWTncyM0pZNXVCRG9t?=
 =?utf-8?B?c3k1Y3hxdFFJNlV2K1VOeUxwbFdOanQ0Y3M4SmZES1VQaWlxSGh1WlJQNkNG?=
 =?utf-8?B?WEtuclpaZnc3dGovYnNtT1VKaUpOR1VQbUtZb2tBRDlBQW15L1o4YlZEbXZv?=
 =?utf-8?B?ZjVodFdiNWFmWVplMnczaXBpVWRBb3VLaDdoSzVRcFFpeGV3RGl3SzJrOTRV?=
 =?utf-8?B?ZHBwb1U2dVU0RmNPeVBjK3YzQjdYb1ZTRmVmU1czbWZJMTlDcDE0ZE4wTERa?=
 =?utf-8?B?bEVDSWFRNDEwVDlzcms0aE5od3lJRUpHWUQybnBvYjBiRmZkUUJXREpUanlJ?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e832abf-cca0-412e-17de-08daadb22dda
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 07:03:21.4835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evvhiejAsTajVLYM3TtHTYs+S90BKxS+Xx0GNgSQNQ62KUkJmTjKcppSR920ury59Ch769nQzU6CPYNAjsJ6pHX3IU2m3Bd1tHV7TPs7yMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4984
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_03,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140041
X-Proofpoint-ORIG-GUID: wVQ_mR0yVWJB0NjsVZQ8bZsDpb85D9EK
X-Proofpoint-GUID: wVQ_mR0yVWJB0NjsVZQ8bZsDpb85D9EK
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 13, 2022 at 08:02:04PM +0200, Bence Csókás wrote:
> Dan Carpenter <dan.carpenter@oracle.com> ezt írta (időpont: 2022. okt.
> 12., Sze, 16:52):
> >
> > The "msg->len" can be controlled by the user via the ioctl.  We need to
> > ensure that it is not too large.
> 
> Does the I2C core not check that submitted msgs do not exceed maximums
> specified in `i2c_adapter_quirks`? @WSA?
> If not, other drivers may also have this issue.
> 

I fixed another driver as well.

The other related bugs we've been fixing recently are related to
i2cdev_ioctl().  So it's not 100% the same, but similar.


> > Fixes: 4a7695429ead ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/i2c/busses/i2c-cp2615.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> > index 3ded28632e4c..ad1d6e548503 100644
> > --- a/drivers/i2c/busses/i2c-cp2615.c
> > +++ b/drivers/i2c/busses/i2c-cp2615.c
> > @@ -231,6 +231,8 @@ cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> >                 } else {
> >                         i2c_w.read_len = 0;
> >                         i2c_w.write_len = msg->len;
> > +                       if (msg->len > sizeof(i2c_w.data))
> > +                               return -EINVAL;
> 
> Please move this up to line 225, as an invalid `read_len` is also an
> error and should bail out accordingly.
> 

I don't see the bug.  Is that something that requires knowledge of the
hardware?

regards,
dan carpenter

