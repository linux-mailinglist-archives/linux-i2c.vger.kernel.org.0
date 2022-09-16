Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71C05BA80C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 10:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiIPIVI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 04:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiIPIVG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 04:21:06 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E657A4077;
        Fri, 16 Sep 2022 01:21:03 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G7fVmC030808;
        Fri, 16 Sep 2022 08:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=72wINZED8/d9OIf7qOGQaDIczcK02VwOczJPPbZGl58=;
 b=dFeJoZUSIZG20i2Lpw60aLo8KZ9q04CTV9BVLmgBYqNd3qnKzNrzYooAOzcL4RurW2Ep
 Rrbe51t7Ig7zjX3qbpRraVdW3fWk0psCsHuk1n0PX9T3XWfgxLdl11OerAXOilKD9hN/
 dYYa8Q3Gr+4FhmSczxylY/Kmo/XC4ObSCKpTvg8izxPg2D2LOPvVCHrEp88zxnUa3T4D
 7/mxbb+FNI767je0ndPnVXqRF0hUQnTWGQs81oYnjobKGyWOFf4aCq5jisMPcHq/v4mU
 xFIRadx5DkM6ASn/ZM/QpA0ExTA2C5I8wimKwlAG+F2gkJ4hQMvIfU0P7gK3txOTTy6r Jw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8x8ssdu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Sep 2022 08:20:37 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28G80MXU013180;
        Fri, 16 Sep 2022 08:20:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jm8x9drwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Sep 2022 08:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEaSvMfaQSjqwTXuYCrhzY5bavAhY4xfCcxnuOzuo0qkewdxEp1RtTezsq6F16xow96ozUgJjIo8qdmqxYQ0lfuSgg2c0yUb/+t0HMr5BJWfEhBqM0pUR+fVCdvav8D0jROS/rw1wwY93LWkpyvgRBIL7MSoGP53r2fxmdn9eLHeA1iVHjQb8qWwQcdwFNtEXMt8tCyEAc5pdBkBDRW/gk4gq2J6uzZiNkJmuUxsoPN7lbAGsXpEjDYthTvCN2qmwNnuG/pWAFWTC6hUn/6l9UJFlw8kVeZ8eTt/BuXqr/vRX5LebGvG3LOQRlqast4wikQdTrmKVBpfzqymJwlGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72wINZED8/d9OIf7qOGQaDIczcK02VwOczJPPbZGl58=;
 b=Iw3ZYcWbEeN6NqkQ6Tp1mYltbJw/c0qe8IB0vUqFK8LdGSWvd/MhRW2e0dmBBcinZ60pHc0nmleydq6kTtngTbl/JvpmK+SqcKplWNUI//62YU2P9+/fpu2i9d4g3qm9T7IFlPhX18zgBJB1mmjhzvVkqvlIYf34ukQHfy1Ne9i+pvNcAHAUbtyA6NUhrx9A2eDz10du9drSe8jyUhcgJm1qp8SePfoOGPw6vs9g/W8FsdJ/rKPBp2oWGs3fy1DoYlAh+LSK+Ljw5zHxu8OUUNv5FxJFnRBFZkp1Av9t+bo/277jjkBdFsiDPCe4y3wUc0dHh8xRnvpTEltNy2p7nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72wINZED8/d9OIf7qOGQaDIczcK02VwOczJPPbZGl58=;
 b=SjaBdb/+l4Z44NEgQrmrWO8Fv8PXRCH1aym2+CMoyRlIgaj6kBJBLz9UdFhMAaJLVAJv/6SRbYNeoUj0ZH5YqzI9vRr83dYslPGaEIk+3sYkLwKtopxoXXFJ+Wfw/drycEjKE8Wed3vT+vuDPs8e6BX+MObzbRE8yeFa+0ipU68=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 08:20:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 08:20:34 +0000
Date:   Fri, 16 Sep 2022 11:20:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YyQxuHi2iQIvj0Lj@kadam>
References: <YyMM8iVSHJ4ammsg@kili>
 <202209160046.016AC8B4@keescook>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209160046.016AC8B4@keescook>
X-ClientProxiedBy: JNXP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::27)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|SJ0PR10MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd2b380-d01a-4d2b-8057-08da97bc5408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 55CakN9stSmbhq1j0lSvnjDxKQ9vxDsl7wAjE/jzG3rje9K9tPW4IioKNsR1ZDEJ0Wt5sZjXT6H8UVspPiiqJBZPQUViOmvMxrxJd2E/9AGLAjRg0MGGbMPgIqDNHyfXj5C9iPhr6sprpIHEV8ai2cgIUbDHsoftYSKGl5r/GlVwZLk9RypG0QWTAceGkcvNfJi9f5eiHCqvF+Od7aTH4Idn8IXpqYrbqUJ2qQlPLOOVYCa7Lacki0J/bdUXMdGCves21pSP950n0YQg7mgZTczpn4H6aPrian4HxBdTTPWuIXCvfev+kw/2uTaHYxV38u9dcKM0ATL0Fdi6KE+gMfljQ+DYuzt44TfbvW+3eO0DcxycaADOxHEjb4RV/qBk7HlAD+qk8+nrKBIgn+ULAokfoVNf0NJd0M9BTAVJSm6h7gLq435CBb/ps+KkcF+H8rlOILOVkhFSZ46emN25ZIzEW64gMKHyaJlr2klrfGMzKb0EB0Dg/xOgliJa5G9d2nSbM//Ffla68sihXEkBvYUeR5BlGeT/GTkZyXeh3+wVylU3lnkZnT7xLCh8BttGmmti5S2jzNOWQ6iZq9+C1EKcEI9UxelRX5rERpAwzqTbx0CxdRqb/WDGkzIB0iPVIAJVmiMql5hy+soo+nJ8xBh5MYhg0x0LPqL7OBh4QdnWlBiUo6X95NFso3bWJJ/AavRFwR5ggAcIpf/msTco6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(6486002)(478600001)(186003)(41300700001)(6506007)(6666004)(26005)(6512007)(9686003)(44832011)(2906002)(33716001)(66946007)(6916009)(316002)(66556008)(54906003)(4326008)(5660300002)(66476007)(8936002)(8676002)(38100700002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LR8s1aS59iiMjy7ouaGeZ02Y85tMkBLlA7iuK3dJwbTfl9BS2gU8GDfMzqPN?=
 =?us-ascii?Q?lZuYL6BdHvAZMoMjsWe7wBGkSR6XB7+NpsygvytxsQ6C9cCfEXpZEbGeg/QV?=
 =?us-ascii?Q?TfapsQ7XmnrDDPFqVkN6le/oPZRQdxkaxun9IN4fxDO6pjKwy/eJWVPeO4o9?=
 =?us-ascii?Q?2XGiLPnXtAd9Lz5a5Lo79UnZgXp1oN4jHAboFCkXmYbJ2nT1zwRGl3GSkI6E?=
 =?us-ascii?Q?u8mZb1VzoOQqMfF4XMYFVugs6T99k3UvuJJkYo0hMrPmzgB43G2PGU7HmYEh?=
 =?us-ascii?Q?cyYm2GqN2qEhj9DXiN/asWwSnpot6BSz71Iajv0fjUE7+JLDYmcRhhPxdvtF?=
 =?us-ascii?Q?VX9Il96dEz5C7VxvBT1xFTrqYkWysMTLGVG1nDcuutZA9svHww0M+05pnaOa?=
 =?us-ascii?Q?JFvnT0VUkljd1i8pckyOUlCGmlwVpIJDCqzSvRyb2J3DVVVh6wHfnGAmNSdr?=
 =?us-ascii?Q?NaHEAILkJzXS4LFaJ8NTN3IYMP8WHM9umjL/IpN4K2KnDdZQZjx++Yak136z?=
 =?us-ascii?Q?wpHyb+/JZLOSTqGK0rJV4gKG9lhTMn43iEAT1IwVLKvL9a9CHdUlkgT1+LAn?=
 =?us-ascii?Q?MAyV2DKBrM77fOpb/+NcKRj6hAG4PDVoRiIYGdn7XEhyJChhjOOeywCH0XSF?=
 =?us-ascii?Q?wXgIwa/jTsN9nmBLTj04MNwMy0Rwvoo7OyLl29yVe35eIw35VtGwe66HBqnL?=
 =?us-ascii?Q?lD/epmyNfp37PIKItbH3mWVRoAIKOzajrVWnG588et9vDmN1AnaZWxev/lom?=
 =?us-ascii?Q?inhMr78qgYtp+iNc3CTlilSJWX+OhhPlDDO9+Oz+hcNv5UR3hsw0JMtBO+o+?=
 =?us-ascii?Q?jPpi8Ha+f8klxPfkDwcxPy4W8juTLwVHYZnDrOtEBydI4FQvOYTcwAjCEAgm?=
 =?us-ascii?Q?K+7p6kJmHhkJs8Xa8o+lB7Fkg9MHrhkubPugSm3UdB9nlO4UYPhX9NvZTlK0?=
 =?us-ascii?Q?Cxig17SyNp9Snbkw2eosj++/kWW8G1D49K5g0yQevdPWAlQpnBtqIZg7Ecu9?=
 =?us-ascii?Q?/WX4VdOfWg6i1okPK4j40N8+QuXSmZ8D1rZyCUrnnnbgTPAYnRaD5NGcuX8i?=
 =?us-ascii?Q?c+rOOSjCwV4MUfsvblKWyaaaZKcnYyw9+xsnYaDmTunf39HJTNnVZGrnIhkS?=
 =?us-ascii?Q?LwMiGhjA/ABhcbZIFRam4xTP1lIGX6H6hJydG7OiBxx0lR8CVM+3s2tyEv3V?=
 =?us-ascii?Q?iRmwcKNPrPwPCt6Z6PXkRIaS1Kvy7D250a+3vf2xZMuLwS9vO1N+YYDrujLi?=
 =?us-ascii?Q?wunpmniJEYMZSP5G5PnVly80ddVjhBXf8Ix3g3iE1XBEWh4Yhoqi+h92wdoq?=
 =?us-ascii?Q?nFMO3n0q+nYz9lEIiah6oRMxkxeHTBiMLLA80+KAsCNFy2OTCaAckZRiMJ2t?=
 =?us-ascii?Q?9kCZ7LX0QQWn6TbCe540nCdWYqprxDCVHKgqciELODYPFCnaw1Pzlx0XDhmU?=
 =?us-ascii?Q?iL4n23OFP/q+K3/5rE6ExF0MNQP3rJXN4Eclo97cPisVxA9JDROVrv3bXIkw?=
 =?us-ascii?Q?M8LTTi91plMQRkmLauV9EKVaF4rMMaSMAbRTG5TcmAkxlM2zkv+p8zZfc1v2?=
 =?us-ascii?Q?gjpL98PSACJxkC9su+XjlTUfXfK30Ryt9Cv0Jicjf4efmHySfnnff3Drcd/Y?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd2b380-d01a-4d2b-8057-08da97bc5408
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 08:20:34.7710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeER7G4LjQWn1VudD2u0/9+d5S8QZK51fSlASdteNYnB3A6axrSsSuuXKudhLZbrVQYLwKqWGlK+zs1x4s2YNwXfGAB3+CHRHUdrO2OGgE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_04,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160060
X-Proofpoint-GUID: QStquy9432BobLd8MXtdfcMBKo0ntEw6
X-Proofpoint-ORIG-GUID: QStquy9432BobLd8MXtdfcMBKo0ntEw6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 16, 2022 at 01:01:42AM -0700, Kees Cook wrote:
> > diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> > index 774507b54b57..313904be5f3b 100644
> > --- a/drivers/i2c/i2c-mux.c
> > +++ b/drivers/i2c/i2c-mux.c
> > @@ -243,9 +243,10 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
> >  				   int (*deselect)(struct i2c_mux_core *, u32))
> >  {
> >  	struct i2c_mux_core *muxc;
> > +	size_t mux_size;
> >  
> > -	muxc = devm_kzalloc(dev, struct_size(muxc, adapter, max_adapters)
> > -			    + sizeof_priv, GFP_KERNEL);
> > +	mux_size = struct_size(muxc, adapter, max_adapters);
> > +	muxc = devm_kzalloc(dev, size_add(mux_size, sizeof_priv), GFP_KERNEL);
> >  	if (!muxc)
> >  		return NULL;
> >  	if (sizeof_priv)
> 
> The new variable makes it more readable, but beyond that, do you see any
> reason not to just directly compose the calls?
> 

You could do that too.

You pointed this out in your other email but the one thing that people
have to be careful of when assigning struct_size() is that the
"mux_size" variable has to be size_t.

The math in submit_create() from drivers/gpu/drm/msm/msm_gem_submit.c
is so terribly unreadable.  It works but it's so ugly.  Unfortunately,
I'm the person who wrote it.

regards,
dan carpenter

