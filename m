Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3FA5BAFAD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 16:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiIPO4j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 10:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiIPO4i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 10:56:38 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D578B2D4;
        Fri, 16 Sep 2022 07:56:36 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GE45nk010382;
        Fri, 16 Sep 2022 14:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=I0VcvL0W95Cc3Tv5Ob8N/oX4ncgj/Wjlhik5E39TwkE=;
 b=YgSL2biRmgTy1dLJoTkHv0dmKWYrKe0jDDrpGXyndbWhkTfALkf5Z8One2F2Umykuw+k
 YYktT+R7VTEOmTnZbYVAsrLnOU1PJToev7MbaTyDmm2XZQMme9UWtp61dgO0jPP07B78
 VyuX6TbLpuysbRA7gzuUh2JI79teUdqiGH7oknRDUGSsSXdoSlEvisNFnwLXxq5H6Suc
 3jpqQsxBCz8rs2iy3BTaittBCCQRZ1mPuoubvzLSNxdvfY43hNxQ9mAkGwGxbMTUx3Kv
 gUjUuSS08fmUbejFSTaE2Un6gDfKpoTSIXh9pLFU/5jW8F3AMKHECpAJy0JX3S7/3Yq1 mg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8xcarap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Sep 2022 14:56:15 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28GEQKlK009299;
        Fri, 16 Sep 2022 14:56:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jm8xg5h9q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Sep 2022 14:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQKXvTAUdAC4KejgsvxkvU5oKShim4eWIugdGt3jGkxB3UAZKm1+1ewSY83hLWlcvBBaQlfH3DXqcV+3YedHVU2dCKIjdCv4ouAayuqN/l+i29PpDd2JDJfuDlLskosLRZf8Eb0JFndMINM+Q13iz+zz1KDQdZQspzfAZD4kXCI+h9fy3gHZuJ23DL5zx/laN/gW2qai3ws1FBSC1B6ARIb7K3rEG8gZV0EmareuOOmjhTph5xGizvdBHa8JE7ehhFGUlk8b9Pc+6W3XLCect5A85VuWVMriGN1Vhdx+CZBGJ/Ln5qBSBwewMnwVTJdSJ3NiGMkB/NBhn/mX8PVwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0VcvL0W95Cc3Tv5Ob8N/oX4ncgj/Wjlhik5E39TwkE=;
 b=HRAG2EjbKaONZExY8rWnSLfXpNGFGL8XJtWK9P5qtQ9DLAkw5/ylx3iY2CSVOSXI2/9YThNfQw1bm+Cr+mt6VDuNp6lKLLo7xfIyJgccLmsfm8NSNVsDq101kbi06t5Ot+CqSve929rijqG7aepxyG8AJQ9TUfdiejLXoOD2icbMLqf0VKEMWUGrqBXF4FVUvx31M/zERXZ0sLKMm9Z43TfRh/zjTLDGc/E1QK0zK9IsKNwqszfb/sQgRRTs5ty3Z4sB5/cQs9/px6oQyf8FP1+PkFVFhPU/1EiTGSEMAc9JzpISWgkwHaEVR+t5wto2svX+RpKxSARW094pWQsShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0VcvL0W95Cc3Tv5Ob8N/oX4ncgj/Wjlhik5E39TwkE=;
 b=r8sExD5LagADNuBhBVZ6lj7A9bfxjr4yKgoWL3MMvUFn+dRSt5nIvA4Kx/re3AMJxf67gyxZ9Vxd0pIHh7Oi/q3N12zzKB4BTefBaDhV0DQx27OnV9/Yd0TRocdqUW4N5Zz8s724L0+xJJA/wAEUgzylo+F5xoomcvuVMGt+BTU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY5PR10MB6240.namprd10.prod.outlook.com
 (2603:10b6:930:40::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Fri, 16 Sep
 2022 14:56:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 14:56:12 +0000
Date:   Fri, 16 Sep 2022 17:55:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YySOewo2YUY+fk1l@kadam>
References: <YyMM8iVSHJ4ammsg@kili>
 <YyMt2cWtHC2SeG62@work>
 <YyMyKQnWgu0SL6jj@kadam>
 <202209160101.2A240E9@keescook>
 <YyQyfaI0WCsQ8F48@kadam>
 <202209160630.CF7AE9708D@keescook>
Content-Type: multipart/mixed; boundary="QZOuGIceusSsHqxQ"
Content-Disposition: inline
In-Reply-To: <202209160630.CF7AE9708D@keescook>
X-ClientProxiedBy: MR1P264CA0151.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CY5PR10MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 672d675b-57b7-44bc-420a-08da97f39883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8sQDCR3iecHqmYR37PIRM+4A2i6YmLXI1+oxeUCWz5rh5aqoQSx7dtQYjk6UAdImpJChUZEbjLF4dsd3OshXXMS7TSbzzcuZySRs6YK5KdBP6sxLmR4KaMO1Z6/1Dd5CAqiy4ixSVMj1PrOjqdx07dGDOw2xL9C+F+QVO1jfrHZvNTFcoDFnfV4RdxsLAzJrR6MUuAESo1ALE2eHVRwILIO3SHT4rHJuOobOGwI05MvhiU8S4iXnfh8qd85xiCEKa3vQkeHYPrpYJCa94BRq5B2fRwaH02YAzSEEUthBa7Q2SbRdxcJb00i/V52v0Q8QtyBtXtOXZUwnRjSy+jX56sLV2jxx0ipD3j9Kid7DMGwi4iL68qu8DVIE7SWEMgmUaR2rN3JTNX5VniyVnIimsEz0YY/mTDfiRfi1DsT/pQGamcvmSBYPhyFLb2gwFa0Cwfr2f04w9piCz/PMmKhP/fVGjoZYHuhDHx+k//0hJTg+IURc3Pi7aI4J6QpyEPc2OTR5xhYlcRyIq4M8FThjOfLIdHlisd3ygy5s5wicUEDkjmweL9LeQhhq4LqM/BptWhJklHY7TxT4iOs5s9DfWGnFTcCBWMQrLJNVs5uhID0je76WKUfZ2TUl46GHHOmpZr2bldvlTiC6mitIpQqM8ezUY2GjDvA5TExMdjV2aezO0BVCiui1Wi+mSur4OZjfV78pZ3AKPo50uzUbtoxS/Ts/dh/qiXwzoyOm64ygBjX7tU4bE3BA4nBjLX8d5EycRti5aXQddM0UozbJfh6Df5NrpwsoNcv7qA0dCUWx4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199015)(86362001)(33716001)(38100700002)(6666004)(66946007)(66476007)(41300700001)(4326008)(8676002)(66556008)(8936002)(26005)(235185007)(5660300002)(9686003)(6512007)(44144004)(6506007)(478600001)(6486002)(6916009)(54906003)(316002)(2906002)(44832011)(186003)(2700100001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QsBT4ufKNMLs/r/9zgyaj1NDGeLl1iQFIbx6BRdJuNVJ56WHUh8//KtFDj9h?=
 =?us-ascii?Q?yznaHqQ1OLHmoJkvNpKI1CvGLLSTt8jgXRYNhNzmcsLwpXmj7SsETzo6KOt8?=
 =?us-ascii?Q?J4mos49v/J1CPVlLHmUDorYeYHngZ4SsX3CXUFQVgosH2P5ANclQM/COhDNg?=
 =?us-ascii?Q?hOycLDGLuKdXjVz7hVQ+JJNVrTvLXSOoqlUBMiP6J2+9uXm/eJiqexJsTYnk?=
 =?us-ascii?Q?ehksuXlhWUzlUKfzh7XrZj7gqJlIDWA/Tiauqhk6ojFMvRUweCeSbMoD95ue?=
 =?us-ascii?Q?e98HykXLwO6JGl0Gc4Hp4lf8bg8Mnwhhe2Enc4AglLFYk+nj44IayuFKQ2Pf?=
 =?us-ascii?Q?NTDtXJB+PzvwBRe5o61hoWCm2/hby3fhZwkeX67K3CU6tYqim/EjSPYXr3dg?=
 =?us-ascii?Q?E/zM7ft7JJH0a7x+J18/1QQx7ez7/B197ZjU8onBZuWuAbPpoHrLbCz2g4qV?=
 =?us-ascii?Q?/LvOx2JW+O6ViglIVvl+NTPs+aZ715d9dzkUQ8yA4a1PFLjeGry4Z3bo42Km?=
 =?us-ascii?Q?lL8oVLthllmmVBBxfxcdM24kNrqjqU2d5bOpjDfq8f+ionfbloZHI+NR6qGP?=
 =?us-ascii?Q?q0jLvwmp5b8deJWoCHMT/sg1yHUBAL64vPGOaBHZrhTEP8feNdxZ/8Sq2vPH?=
 =?us-ascii?Q?yfI2Mh8NMTz7xFRBHOTY6MVEkZ2+AK+14hvtTbX3Ipn+RpuAWP4CVitAX8hS?=
 =?us-ascii?Q?qqmWaQGqxIRD9+quIa5MJLrV/2DuSmH4c+p9qUNX35vas/r8GsWiMi80NR9C?=
 =?us-ascii?Q?a45Sxz5PWmUGc71noQEkATNgM5qHzZFqGNs5XmvLhzDp969oVI8bwK3bk4oI?=
 =?us-ascii?Q?wWxHOH8HHb8uFBzbOd04NT64KxU64TJ0K8qowIEDqfzzBwLop58yMNEpnKlL?=
 =?us-ascii?Q?ou0XVSGURWmOfGadZfOotmfR2CPqAmRYbWc1gHLdsAEpg9kkGmp68/nivMZv?=
 =?us-ascii?Q?upQ1usYwmbjAP+I54+iNn+cTWGDWFHl+oGCHK4hyh5YZ2AjxTgyUb+hn2pk1?=
 =?us-ascii?Q?YwulQ/c+6ORXkVRHw2N3g9BGy28DcUYPyRoh4ZeDlrkpeqfMCtjCdUGom9Fb?=
 =?us-ascii?Q?smU8nOB9AoGbm1aOyGxFWzGGPI/MLTK6jEO78+tfRI1o/fZ0hFWxyobbWpqL?=
 =?us-ascii?Q?+zsomK8iNbNlgPh0qG41aVZH7zyMedfKoEqbFjUPl8J/PlhIzw9vSVDkDZWs?=
 =?us-ascii?Q?eJN4FemnwcDGuIBSpLraYYMfRb0qIvLmHTTFIycIKQuOiEenxetxXJ4sTbre?=
 =?us-ascii?Q?m9Gdo5TciipZ7ZnCCf5qkr3k3dvH+Eb4Ipz39Hb2x9fhSNVbP425xt7C7S2o?=
 =?us-ascii?Q?Xrj9+3dPLskH56t32EPtfCcZBgHf99whvaZoE9ydVDTipTaYAW6sgqOt4U4I?=
 =?us-ascii?Q?tKUj+A9j92PVnuJRFOWhfEK4RO5AiY5n0JD1HTpufVItPHTLb1GEsBmdKBl+?=
 =?us-ascii?Q?rRfTDJZWJkz5tOnitpvcQh2hS3uWE/2mJJGCNVziY1dXPvGdRtAvWnp1BeqS?=
 =?us-ascii?Q?uEUOoYyJmtwVCBjxCLRNHcNuU9I3iI9tmPfWtQebTQAoqUeK5NHG1PzSHtlH?=
 =?us-ascii?Q?UYmr0H8NDRosG6BuG9Qod/4A1yzjSVvpFkEOhy4Z/iEgyeVVqA/17FlOStTm?=
 =?us-ascii?Q?Ng=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672d675b-57b7-44bc-420a-08da97f39883
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 14:56:12.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYn8uYvjAHjx19HqHalrluBS5IySMHOML+7sr0Y7ifWXRs0/f1sY51OZ20+WiMrmi4RqukYyHQnBWWrYXA973hEN4dd6v2c+AZsMEaH4R8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6240
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_09,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160110
X-Proofpoint-ORIG-GUID: EIjDpzYu4ud1kRWme9BRAnJV7hIfxCLr
X-Proofpoint-GUID: EIjDpzYu4ud1kRWme9BRAnJV7hIfxCLr
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--QZOuGIceusSsHqxQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 16, 2022 at 06:31:45AM -0700, Kees Cook wrote:
> On Fri, Sep 16, 2022 at 11:23:25AM +0300, Dan Carpenter wrote:
> > [...]
> > net/ipv6/mcast.c:450 ip6_mc_source() saving 'size_add' to type 'int'
> 
> Interesting! Are you able to report the consumer? e.g. I think a bunch
> of these would be fixed by:
> 

Are you asking if I can add "passed to sock_kmalloc()" to the report?
It's possible but it's kind of a headache the way this code is written.

When you pass a function to another function in Smatch:

	frob(size_add());

Then Smatch creates a fake assignment:  "frob(fake_assign = size_add());"
and parses that instead.  So this check only looks at the
"fake_assign = size_add();"  assignment.

Attached.

regards,
dan carpenter


--QZOuGIceusSsHqxQ
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_overflow_truncated.c"

/*
 * Copyright (C) 2022 Oracle.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_extra.h"
#include "smatch_slist.h"

static int my_id;

static void check_size_t(const char *fn, struct expression *expr, void *unused)
{
	struct symbol *type;

	type = get_type(expr->left);
	if (types_equiv(type, &long_ctype) ||
            types_equiv(type, &ulong_ctype))
		return;
	sm_msg("saving '%s' to type '%s'", fn, type_to_str(type));
}

void check_overflow_truncated(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;
	add_function_assign_hook("size_mul", &check_size_t, NULL);
	add_function_assign_hook("size_add", &check_size_t, NULL);
	add_function_assign_hook("size_sub", &check_size_t, NULL);
	add_function_assign_hook("__ab_c_size", &check_size_t, NULL);
	add_function_assign_hook("array_size", &check_size_t, NULL);
	add_function_assign_hook("array3_size", &check_size_t, NULL);

}

--QZOuGIceusSsHqxQ--
