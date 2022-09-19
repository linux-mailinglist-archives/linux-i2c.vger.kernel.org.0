Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482325BC2E0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Sep 2022 08:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiISGgB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Sep 2022 02:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiISGgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Sep 2022 02:36:00 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B01E084;
        Sun, 18 Sep 2022 23:35:59 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J0xBJV006387;
        Mon, 19 Sep 2022 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=z/ErioY9FX4iaW3yRf306T9zo7hh7qAuVp2JsDEf40Q=;
 b=nYGa98bldbTHM4q2PjsT3O8xUJVkDHeBxFhbjaqYzzNrRs5YI+EtDca/+OWuN1D1d0LQ
 pjuqc6AR9BtwrLMV0yyMDWiTt8I2SzGzwAE0MENasqWzJIVp7GGQqfnUslZ0yobrOrIA
 9opUzLBbe08N8FcwKn9A3TPuE5ynrgOMJ4Kv6S67JDzB/DJRCiJItbwhP13XQb6iSvTt
 FDhQrlRAInZbHoVYFc0uwPwxsc2jSIaG/e6L1CEI6hg8/+oEm2hvPyjOPxWcPKiA0m6I
 kII90/JR86aZW4BxrcLNf9k8W+TSiP+rUBoH4zIzzJlI+HsL68nFTHDo4yS/8OZIMlIc fw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68m2tek-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Sep 2022 06:35:39 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28J3Uve4016599;
        Mon, 19 Sep 2022 06:35:39 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jp3ckf9ke-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Sep 2022 06:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad+8Y/RMAyfdSG4xiI9C4/1jbn3aF6hPIGKH9WmZtFOJpo6+6bxwN7XVTDrCc9rfnzCFflgXnvyctoHlf3kiuwfiBSqol4Qzw8RE6yjtSeWEvcuGR1y+jp1NSvOLwR6ZSFRcWsI8TnSzOOkMFXhCB20He8Bt7lFUVs5N2a6AeJJcUFKaeVkyKupjSYZs3FA2Lgf6Nzt68eLLOwcYS+ENrUQWxMdA4fccLu6Xl7ViEo53o05gwX75T+0OxPVD+kRxgbH1PvzAre6RmVGLV57rzKmfpq35E268N3ezLRgK6POVFD1HjBNBX3Klg9I/ZfmhvAzRZHrPto/gpD5mwbqZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/ErioY9FX4iaW3yRf306T9zo7hh7qAuVp2JsDEf40Q=;
 b=HOUafsK0yuX58y6J2+upqxJE/UVTA7UcV+lUNODxkE6VctGyH81vu2hDDNbrvzxl063HbffU/QMoJhxgAdAPuJT6FwzZEjSmqDMd7YdxvBlmX4qr5snji3teZQmLd74wAy0TE08Se3tjkQZc6ya+Sh6O9n3tni7G+VuPoUNKpfO2lgfMVIFI91wWea+yPrf/BW0wAiOAd+ChnCDCbnqQoumFVqQopHAtVOincYiOC8Kdwhpb82YFqX52OBETVeUPJaWUu/EBWaQfdUKKboTyY4Dh7c3GL5XwRZzPqxwyHu2Pg7Ey6F6c7O7435W6CjXITqrY1auS7RvxCc7NYsjs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/ErioY9FX4iaW3yRf306T9zo7hh7qAuVp2JsDEf40Q=;
 b=I5FH+oCesnVRrRA+e2Cq7T9VykMpphtmO6zaFPZOor0lvvsIWoNZ4cn36bzGn7F0ntaxtdhw4kJ3yvr+0mDEpVYOA96zUKhTVHM/4TE8yLiIRcjwR0erR8okzdkJK9L5TA4AZcfX5Aa3SvFJnT+vS1SPEgRt53vk8r/Ha207LFM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB4935.namprd10.prod.outlook.com
 (2603:10b6:408:128::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 06:35:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 06:35:37 +0000
Date:   Mon, 19 Sep 2022 09:35:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Wolfram Sang <wsa@kernel.org>, Kees Cook <keescook@chromium.org>,
        Peter Rosin <peda@axentia.se>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YygNoO3Xr17ThMlY@kadam>
References: <YyMM8iVSHJ4ammsg@kili>
 <202209160046.016AC8B4@keescook>
 <YyQxuHi2iQIvj0Lj@kadam>
 <YyTPLkOfPlgkLaxq@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyTPLkOfPlgkLaxq@shikoro>
X-ClientProxiedBy: MR2P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BN0PR10MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 285e9c58-8b9a-4492-9dba-08da9a092942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p7WjmjYJKs4vqWuQVIeTun1lkImqlXaCsHmO0cGswIUlHpr7ABZsAacaQR7cD4q1+X6VP8sGqdpGE2c4RhOdEG1/wdvGSNA/tNFvUVGLLA/7DrpFUsUEVpfYe3AsMvg89+9DZEadFSyyTBvdIbIsNzSjSx4LdVKjYgoP/doVFwk9dLSb62Ax+zpUCZg5rdX/r2vj31rLEeD9j6RQHvGbd737UGUyqdTYMYmJM5JcpMKk2a4Gkl5ck3shyWdqxoSofKemz/l1Co9MA1DhKxgHPO4qwn0MZpbrMyPDWtPVumWlGFs0h2avQZXu0zRZTLzdve7UFGTl/ol0Z78GF8rkCjHUPzzZoc2Q8mXwOuIb3eq0nEW49xVEXT2PiMjxZqtVjDX8oWGuCxKOaE1hjrTMygIaxg8NUrpo+cFZJnguC48AOxg5DeHCU7nb+XCJ7xfIh0IK0sdfTarPtIn9so+ZptKyu+8DcvrJ+83clXY9sArLrx7pocpazY0/qSb08AdRsdOmvn/pDL3tNGXhUD3CNqVNDC2zon5MmMsDzV/NmeLe6f4Bhtp6myBpIwx+zoYqe0MOp8QoAR+kN3MD93/Euffxebzf10ftRYqP5f1Tn5iKn1KyCBgG36ltB2lT1X4hoS2OOHXD5Qa6L1ORtXaiiYmXMtn7FSCqB4siWp9LRg0PeKHzVAuvHH5CDW5zEVFPe4a0s5cQOiyZT0PXujuH0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199015)(66946007)(5660300002)(8676002)(66556008)(66476007)(8936002)(110136005)(86362001)(316002)(38100700002)(83380400001)(6666004)(41300700001)(6486002)(6506007)(478600001)(186003)(9686003)(6512007)(26005)(33716001)(2906002)(4744005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40W+S2Z8/GRptHVdyjor1NBhjNBrrG3T1rreau/C85VZ75GHDjOyN1TX8jYc?=
 =?us-ascii?Q?jl4nL5ffENosuun4xu7OYpnVlm0gChrhmAw3SVl+sAUm+jcR6+zc1l7ebkNO?=
 =?us-ascii?Q?bzHYRTSi6e2SUYw7eg1S7anvXOLbRzQkv/BvqmzP2fiyx5QOkAOMjk82FVf9?=
 =?us-ascii?Q?OIhwdOkQeh7q46LQVXZ8VNI/Ep2869uC1sRBrop/63aqM83rL2LDBkRNePR0?=
 =?us-ascii?Q?juOQVjuoPY7GUW+uY2TDKWSLuC2I97O64/ISQEIWMyCzFSxtrPrdegbMfqZ2?=
 =?us-ascii?Q?q4Hsjv/vVk1Fgz6EdSt2BETSdz1PSK2JA/ive9GnaD3xN5ZTyYsth9oiLZqQ?=
 =?us-ascii?Q?7L8hCvh0EJNBJ9xzWCDoUiXF2u6zUB0NUm3R6BlJ5hhl0eFDpjdwjOY8P9Zu?=
 =?us-ascii?Q?eUvzjXTYAjB18FfQHCdYUKdyQK6t7EriJBq4e0caGQdPYvcJkv+sRQxwjIVI?=
 =?us-ascii?Q?KDtPTJg/1AziXbawTKW3/GtPAaez1MxaowHymYyOiWNIaYrb8aKdNDpciSZg?=
 =?us-ascii?Q?C6mmX6fsipPqiFOUaL1ZAC0LNC9uMcQVULoMaNXyFrSxeUg8vQ/TIYQsVi/X?=
 =?us-ascii?Q?3qBxMUfGMnbQIjd4fTWyvW+rJ0zl3WwILHI06OlVUnV8fIqhk7FsVfQYZkzw?=
 =?us-ascii?Q?V6/W7D+e9X+07XuTxvDjpyRhGu8JmPeSVEKRRjrxoZkNOp62FPuEj/jtZXDj?=
 =?us-ascii?Q?4L2F44pknOTLDrwKdaYgfFDwyMPcetDTfWBBjFtdMJo+TosFYUywg0GvsutK?=
 =?us-ascii?Q?l2s5Oh/bE3UlZ8k4xTRso8BR+9q+sJuTySGkqgX/sOJDnmHOZOKctRNId/wW?=
 =?us-ascii?Q?T+e1vqRsFC9l4qZ0czrot4HWoeTgddv7qfVnEg1qte2hSzJcPnZZD5JaSz0/?=
 =?us-ascii?Q?h7gbBOuDxXdXGtIpVo68ggoRlNoCATsOud6evKQ9QOMnLUGMtpoBccG3v1s0?=
 =?us-ascii?Q?HO6F+IR46mR9fMJOWzOjUQtJ1iGhUBRfD/B45PB5ZO88GRdERen1tcxPcOZa?=
 =?us-ascii?Q?wPAgWjCvqgBdl7GH2t4R2F5jT2fVd/cB1MteeU350+s9ou1QvpOpENgPgyUW?=
 =?us-ascii?Q?1F7x8Hfnq+JsfQTvfZFj/HtRVyt+BwFuQim+w7rvaxoXBj+I9VqNiJn44aJR?=
 =?us-ascii?Q?v2v1J9GF/8ybPK1yTBhrv06HHvFzzMqMBPuehAqPUuzumqAVxhQWKf1Lti6X?=
 =?us-ascii?Q?z7dyKjo75PRHMW/Nn05J+hj0cgrOUlyBzEdfM5nmutOihriZmu+D/N4bOkWY?=
 =?us-ascii?Q?r7Thl3l7mGeqciXumGVmp5qxvvWxgHOwxSIPyeVlgy7eHfU+/xJlnn7AOxjJ?=
 =?us-ascii?Q?sFbyUjW8EovEsffJ54lrM/dCqN7s77n0V47ZktBtziQvGRbyvdlb9s5Pi0lg?=
 =?us-ascii?Q?K9uA8zKeZtatOhg+hx9MH+kISWQvMMVQR8hY5WnSXi17vKI/XdBqfmagOB1x?=
 =?us-ascii?Q?JQCZ/MNr6LhdY9Yh7AvexojSPtobBYGuqXmLNSh6qnU5gI9MxkywoVxRt+o1?=
 =?us-ascii?Q?SdTeWJj4XxIU416GQ6Qgv55lSOVUxdju6VFEPiIGkwIuv1rEJUybxV1jWpp+?=
 =?us-ascii?Q?jJbmpAanIJTkQBVNFTqoa56AwaysectapDYZ1lly5b06m4/jmwQcvC1ZCoh5?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285e9c58-8b9a-4492-9dba-08da9a092942
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 06:35:37.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJ5phfAluJ8PSDHHSV0Ty4X4D9v4XAPmOkWwaY6d46W5WKoukKm/mqf1++9iPvMCU2wD504JfCFAy7SVvep5EJ2IAuRkR9RiUV9ttTa+pqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4935
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=933
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190043
X-Proofpoint-ORIG-GUID: SQ3AS3TtPn6o67_jrm_tnzveRtBp9eh7
X-Proofpoint-GUID: SQ3AS3TtPn6o67_jrm_tnzveRtBp9eh7
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 16, 2022 at 08:31:58PM +0100, Wolfram Sang wrote:
> 
> > > The new variable makes it more readable, but beyond that, do you see any
> > > reason not to just directly compose the calls?
> > > 
> > 
> > You could do that too.
> > 
> > You pointed this out in your other email but the one thing that people
> > have to be careful of when assigning struct_size() is that the
> > "mux_size" variable has to be size_t.
> > 
> > The math in submit_create() from drivers/gpu/drm/msm/msm_gem_submit.c
> > is so terribly unreadable.  It works but it's so ugly.  Unfortunately,
> > I'm the person who wrote it.
> 
> I can't parse from that if the patch in question is okay or needs a
> respin? Could you kindly enlighten me?
> 

It doesn't need a respin.  We were just discussing related bugs with the
integer overflow safe functions.

regards,
dan carpenter
