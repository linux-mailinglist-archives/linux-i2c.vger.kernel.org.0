Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CB85BA824
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 10:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiIPIYr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 04:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbiIPIYa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 04:24:30 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08CBA7201;
        Fri, 16 Sep 2022 01:24:20 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G7nR4f014820;
        Fri, 16 Sep 2022 08:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=wapf9MRKCsglGVI04pSTvNdMKCtnj/wv7dgfDqVh7V4=;
 b=D5WhOnhhvNw4gC853i1BF12qsOtbBpqWTHBNA6RuJRbAus+qgKI7LTTUQ4O7pW+uiOz9
 F0vkNXYLJ4822/FAETqVpe/pRm/O6ScoHHLm3ILxBb4JQVIF2ne5X9b5ftajJBjXWCmg
 hye3bVp6AXfB3nqyj/4j2uUe8Ju48SHHdZsUa2bz9MPVKHAuzxwixN5OU3IWrcEOqj0V
 yZ6DrXD27CnzBGpPexIFEQKGRwb2TMxgdsKn1ibAunQALMW5ZNdNWHkPHB98Aib4Hrwz
 Zleo3WfGp/E1FbT0n/EGb6PH7W/7pB6k3t3oyISbIGWq6td1UuF6f8OaVBuRcTgifRpt Zw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jm8xbt0bs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Sep 2022 08:23:45 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28G7ZrXh015913;
        Fri, 16 Sep 2022 08:23:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jm8x8wur4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Sep 2022 08:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BubpQkYD26CKt/cWr6GwhVDhzANU3/aNSQXr/HB6EsbkCc48z27oOjeMrCUYhOkeyZR0STfXfcjs4qGbGb6VDxloRlqAbZCsc5RP2z7IIPU8q9gEX8HF40yN8aGBtVyiUaalccZFXHryHXiPsbZy891JbzMaxLLKz53lGEx4XcuJVnbzuAPQQOR9Qsn+LSbmbYewtCXNus7syVV3qnNLc+r6ppp+PcK8PjEM8vs9bZ01olKxDel/OrM805QZb+dCnNg+8vMwa8vJsBPMLlr33/YHNUDGe1q86YKmOqdpMhV6WQdfatB+t0vtzuxfy0kiVdnAth8ncG/walMPcX1VfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wapf9MRKCsglGVI04pSTvNdMKCtnj/wv7dgfDqVh7V4=;
 b=Y51aQHGSLJqSrlBJp8uZdDBkgmcU14No2fi594GwOBRtf+T4aP9Y50ih2CcNG+ltFDDgyexxTIFMkAkO48KB62frfJaPufWFh9LVbZYbRHuL9Z3QDFZSGH0a9WxGjSqaEsKxS+hDX4+i4QB5yHkrCEMRVHEJ4sm3ylOG6a3So81iDwwD28twbmUuu2h15SR0Gfre+zcwE6X3792ikcwzerYsGoTRuaIJsnuwQeZarUEP6wSeKEVCK7rZyIBvvv+qUrviYaaR+OFKXXogSrj3ke2kTD09woppr+AW2qsq1McHdJTYYDNx7nnR6rLeZ23kFBRLWUp20WFBS9CMnafTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wapf9MRKCsglGVI04pSTvNdMKCtnj/wv7dgfDqVh7V4=;
 b=aW30iRoPfu0mQ1J+1cORMVE28El9PTp6i/6dGbtlvLhkH6l8AlfxGdgY1DwE38ydTacWCtyzlWE7ZaEpTkeb6aIwBUef4xoG/Avhfih20fWbK1oeaPEiSKC2iAOHEtCBk9aiVUUn3aqXOu4vcbFQ0YHpfE+GTe/KiDAxEXZMnBQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 08:23:42 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 08:23:42 +0000
Date:   Fri, 16 Sep 2022 11:23:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YyQyfaI0WCsQ8F48@kadam>
References: <YyMM8iVSHJ4ammsg@kili>
 <YyMt2cWtHC2SeG62@work>
 <YyMyKQnWgu0SL6jj@kadam>
 <202209160101.2A240E9@keescook>
Content-Type: multipart/mixed; boundary="Yf+M51qgCpmI+PBL"
Content-Disposition: inline
In-Reply-To: <202209160101.2A240E9@keescook>
X-ClientProxiedBy: MR1P264CA0145.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|SJ0PR10MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: d71db39d-df6b-4a27-6b67-08da97bcc3a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I5A6tZAkQlDx/JYC2CAoErDmMev+b/9SgQWHZcWwLbeEK5JARiutUhmWQhVA+K0jFrbeSfajdzbCbfVLoEFcgpTBmHBRDm/vFcGup9ohyosxvajNScXPXit1MPCGi+EPIHUT4ma/lqg2F4OMD+QRhc9eDmP3/pqXL9eVNiZTg4awDgXI0r2mgW8h1bxOw2ZeYppdyzQnsxvMJHG+W2vdTqSjbxEG2rqjCYq0rHPY01Q45KmcnyDQAZQkEfTghmlbgJ0mL7Ofn+SUjlNlY1UR4GVT9/LkfEIKW+if0MrNY+A7+8URepJzt+UpjrmOq3PdPwGQi8EZ1g++7d0r6b4zQrNvD1YScqxzZHmF0kK9mZIMPRdi+AsCsVRKAwS5C2m0UsG3ZYcC6ckvDliKca++Ree5x6mRXrk/TdApCC64ox6fzDGt9ku7qTgxJcbsYD60AvSzu6PSnRv3KBZVu13WEkCcD4pHDz2tth/9VqLv1riafQ6ZMiBbZGb6vURxqCkLdXsHzRgeMrzC8iLAyE0cwp5YNwAQ+YhTBlugvUv+HAimyeOyNwyazFWBP0LY8WyPWdrbkDV0CxYfmGBPcd//+kIdKKOC7lrpxjBoFqiu79rMuN8Jgyakdi/Rti4yIxTZlTYhPqgW6QnMVj+grtQ8DF3LTy908+uLweGyCo65QiCpmloYFE9bSJxxAUbDaLv+FfB9Giy3quw/JoCpQ5lKqtSISPzsrn8mv3ZP7nUlA+F+LCd7dOtUeWGHlv7BJ+PKkR8oCFJax6yvCH9akoGwcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(6486002)(478600001)(186003)(41300700001)(6506007)(44144004)(6666004)(26005)(6512007)(9686003)(44832011)(2906002)(33716001)(66946007)(6916009)(316002)(66556008)(54906003)(235185007)(4326008)(5660300002)(66476007)(8936002)(8676002)(38100700002)(83380400001)(86362001)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zOzsufuBfBV1v7fuvHJ7+RzJrbmncOUA5Wbe8GTi2FJF9oI2421wEoVxQfKs?=
 =?us-ascii?Q?JgieCnXdkMdi0A9YEKKIlpdR4uJoBYo2tXA0YMUI87E2Kg5Ei7TA+4uGp0Dc?=
 =?us-ascii?Q?yizfck9nI7+xKqrNXQqorpsak+fBcjTy/pxU7Vc4YR94xh+U5QBkSFdY50IB?=
 =?us-ascii?Q?bXSxCQQ722iTyMkWrh+hxJCkEYLwMEhNTCXsk9XIVpfXEl111ymvvIqxkAe/?=
 =?us-ascii?Q?jtc7afOErRiv5GUGLt7qaorFbRaP5DC8cPra/pDiEtZTc5xkUq3XbksOPl7/?=
 =?us-ascii?Q?8+d4YuL9tHi7mGOqyRTHuP+6Kg9QgJu+9yTnff3MZGLnd4Uk5p6F3QxAGmjM?=
 =?us-ascii?Q?FF0ESNZa2FCMtd3bWCfHqhlfsAgFUbdp/6ooHADupTXvNtEy0hYU+2Rd93fv?=
 =?us-ascii?Q?/CJIJnHnbnmvJvG/MuXhfv6F1iJsrtJjy28r0+oUdrgOXJnJ7hOXveZ20ILd?=
 =?us-ascii?Q?8IZO1nOto0OyCnuFrsPeBN1MVjsNlydWhv4cta9e3hBUxfAWy8xRuXuJAeA2?=
 =?us-ascii?Q?xoXVohoy4ZaquOtdqyKl0nfR3rUUOmWAo5UxBurf1pvkBRToIfrZmjsAT9Oh?=
 =?us-ascii?Q?XzK72Rq8vKi23piPu1l1r2zhteUSqjDfxODYNxiHC8uiyvxg3QYvKOlzu3R3?=
 =?us-ascii?Q?LmfnUatE0SEMjVTYD9qedCI/YH88rUI8cb09jPOACq7DlcNlD+bPmkXSPdUV?=
 =?us-ascii?Q?Tqnzv9Nmn9d5+iIFqS6HkYAZUIYmU9DVUew5iuPgZXNJ0nvj/B8LfYV8pLbA?=
 =?us-ascii?Q?LXpDY9onPtPHIQUeospa4PzjRJcweA6Ll6uFbIiQ8sVXzss14KCG2it6Uer/?=
 =?us-ascii?Q?ejBEpL+NrAMSKLN/ezUCCULx3DjLvTTNbwSNaCy1pUIcC7Bm7HVp/3OCk02v?=
 =?us-ascii?Q?DUcwxnK2AdcdrY7WqurFFtT5IXrR4V3OV25uvYgjUVL5G04TNzsPb4lvNo9E?=
 =?us-ascii?Q?2tmvbykTYSBzr1i3Ss74bPMKF8Q946JOzXYSxuuRxAgIL7RLjwitJ9BfeUyG?=
 =?us-ascii?Q?mQer7Xb2WQyGyHAsFeC4OxJrqA1VBjlWqMLF8EV/wR6W5V4mxg7k0j27liLB?=
 =?us-ascii?Q?YMc/JeSL7ceAvNRVfIjB/NhoGyOZ6/FLKh6Ia0JhP+ZUI4bTLkP+5XReogTQ?=
 =?us-ascii?Q?jj6Ts49zbX7HYjZ99CROAhLvu6abbf6KV3Z9WpRBSA77n/MUZb4nciW4pW7q?=
 =?us-ascii?Q?NberCocdEfBpMNurmyEbOED0DdceZx3MwwrQZFrpjPBZQZ45VJXIdSYjzQ37?=
 =?us-ascii?Q?OmJyUc4xGRJI626reDr7jjkKX52BWYlFaYS5FLHfGzLE9IeSvOMYOtAAc+86?=
 =?us-ascii?Q?1P4tNejELy0KWdc6bufYGmPMt7UsnoeC/oovNUbCL24WBOdGNFniDgv22MBJ?=
 =?us-ascii?Q?Atuq2GWK7HpYoSgmsv0HmnetEjBnk7JM+h67SdIpkj+s5u3lmSaDhNvv2Tzt?=
 =?us-ascii?Q?esoWl//ObYwOtwqKODszhrzo79WgU9Z9yFa7LzHXpUeH2syZuVlzO8uuM422?=
 =?us-ascii?Q?Vbw6Znyaw7k0CHraEpgJQ60IH2piAOz4DqtAOz8iFKtypAwmTpFxwLQw6TsM?=
 =?us-ascii?Q?rlxCbfhrkjfXhR4jT4i6U5+EOGiLyBqZdErysOGYBX3ibsFi+qPNC3+eboC9?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71db39d-df6b-4a27-6b67-08da97bcc3a9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 08:23:42.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7Ifg8nTTaenZxY7+dxC8xXvv36vyWVoKIoJLv1OF/EiThlK1YPMHccNvc+IMZPQPg6oU//+gxkqwW81gEpenAJlsHOXcgLRWTu5Y1Jof7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_04,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160061
X-Proofpoint-GUID: H_skVaTKxSoox-irWDE5hYZG1jq6Xfzd
X-Proofpoint-ORIG-GUID: H_skVaTKxSoox-irWDE5hYZG1jq6Xfzd
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Yf+M51qgCpmI+PBL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 16, 2022 at 01:07:25AM -0700, Kees Cook wrote:
> On Thu, Sep 15, 2022 at 05:09:45PM +0300, Dan Carpenter wrote:
> > It would probaby be useful to mark passed data as explicitly unsafe for
> > integer overflows.  Smatch already tracks user data.  And if the user
> > data has been capped to an unknown value.  But this would be a
> > completely separate flag which says that "this value came from
> > size_add/mul()".
> 
> I really want a __must_check_type(size_t) attribute or something for
> functions, so we can get a subset of -Wconversion warnings, etc.
> 

I have a list of these.  Attached.

> > drivers/char/tpm/eventlog/tpm2.c:57 tpm2_bios_measurements_start() warn: using integer overflow function 'size_add()' for math
> > [...]
> > drivers/net/ethernet/intel/ice/ice_flex_pipe.c:2070 ice_pkg_buf_reserve_section() warn: using integer overflow function 'size_mul()' for math
> 
> I see size_add() and size_mul() here. I would have expected some
> size_sub() opportunities too? Did nothing pop out?

I didn't look at size_sub().  I'll add it to the mix and report back on
Monday.

regards,
dan carpenter



--Yf+M51qgCpmI+PBL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=err-list

drivers/i2c/muxes/i2c-mux-pinctrl.c:96 i2c_mux_pinctrl_probe() saving 'size_add' to type 'int'
drivers/i2c/muxes/i2c-mux-gpio.c:156 i2c_mux_gpio_probe() saving 'size_mul' to type 'int'
drivers/firmware/efi/efi.c:655 efi_config_parse_tables() saving 'size_add' to type 'ullong'
drivers/staging/rtl8723bs/os_dep/osdep_service.c:227 rtw_cbuf_alloc() saving 'size_add' to type 'uint'
drivers/i3c/master.c:928 i3c_master_defslvs_locked() saving 'size_add' to type 'ushort'
drivers/isdn/hardware/mISDN/hfcsusb.c:264 hfcsusb_ph_info() saving 'size_add' to type 'uint'
drivers/gpu/drm/i915/i915_query.c:146 query_engine_info() saving 'size_add' to type 'int'
drivers/gpu/drm/nouveau/nouveau_svm.c:930 nouveau_pfns_map() saving 'size_add' to type 'uint'
drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c:525 amdgpu_vm_pt_create() saving 'size_add' to type 'uint'
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:527 amdgpu_discovery_read_harvest_bit_per_ip() saving 'size_add' to type 'ushort'
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1186 amdgpu_discovery_reg_base_init() saving 'size_add' to type 'ushort'
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1236 amdgpu_discovery_get_ip_version() saving 'size_add' to type 'ushort'
drivers/nvme/target/admin-cmd.c:267 nvmet_format_ana_group() saving 'size_add' to type 'uint'
drivers/nvme/host/fc.c:2924 nvme_fc_create_io_queues() saving 'size_add' to type 'uint'
drivers/nvme/host/fc.c:3555 nvme_fc_init_ctrl() saving 'size_add' to type 'uint'
drivers/cxl/acpi.c:58 cxl_acpi_cfmws_verify() saving 'size_add' to type 'int'
drivers/acpi/prmt.c:106 acpi_parse_prmt() saving 'size_add' to type 'uint'
drivers/acpi/prmt.c:126 acpi_parse_prmt() saving 'size_add' to type 'ullong'
drivers/dma/ioat/dca.c:279 ioat_dca_init() saving 'size_add' to type 'int'
drivers/media/test-drivers/vivid/vivid-core.c:1780 vivid_create_instance() saving 'size_mul' to type 'uint'
drivers/scsi/aacraid/aachba.c:1251 aac_read_raw_io() saving 'size_add' to type 'ushort'
drivers/scsi/aacraid/aachba.c:1382 aac_write_raw_io() saving 'size_add' to type 'ushort'
drivers/scsi/megaraid/megaraid_sas_base.c:5157 megasas_update_ext_vd_details() saving 'size_add' to type 'uint'
drivers/scsi/megaraid/megaraid_sas_fp.c:329 MR_ValidateMapInfo() saving 'size_add' to type 'uint'
drivers/scsi/virtio_scsi.c:863 virtscsi_probe() saving 'size_add' to type 'int'
drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c:720 kvaser_usb_init_one() saving 'size_add' to type 'int'
drivers/net/usb/cdc-phonet.c:354 usbpn_probe() saving 'size_add' to type 'int'
drivers/net/dsa/ocelot/felix_vsc9959.c:2233 vsc9959_psfp_filter_add() saving 'size_add' to type 'int'
drivers/net/wireless/rndis_wlan.c:1691 get_device_pmkids() saving 'size_add' to type 'int'
drivers/net/wireless/rndis_wlan.c:1724 set_device_pmkids() saving 'size_add' to type 'int'
drivers/net/wireless/rndis_wlan.c:1770 remove_pmkid() saving 'size_add' to type 'uint'
drivers/net/wireless/rndis_wlan.c:1813 update_pmkid() saving 'size_add' to type 'int'
drivers/net/wireless/zydas/zd1211rw/zd_usb.c:1890 zd_usb_iowrite16v_async() saving 'size_add' to type 'int'
drivers/net/wireless/ath/ath10k/coredump.c:1568 ath10k_coredump_build() saving 'size_add' to type 'uint'
drivers/net/wireless/ath/ath10k/wmi.c:6616 ath10k_wmi_op_gen_init() saving 'size_add' to type 'uint'
drivers/net/wireless/ath/ath10k/wmi.c:6679 ath10k_wmi_10_1_op_gen_init() saving 'size_add' to type 'uint'
drivers/net/wireless/ath/ath10k/wmi.c:6750 ath10k_wmi_10_2_op_gen_init() saving 'size_add' to type 'uint'
drivers/net/wireless/ath/ath10k/wmi.c:6844 ath10k_wmi_10_4_op_gen_init() saving 'size_add' to type 'uint'
drivers/net/wireless/ath/ath10k/wmi.c:7555 ath10k_wmi_op_gen_scan_chan_list() saving 'size_add' to type 'uint'
drivers/net/wireless/ath/ath6kl/wmi.c:1967 ath6kl_wmi_startscan_cmd() saving 'size_add' to type 'uint'
drivers/net/wireless/ath/ath6kl/wmi.c:2023 ath6kl_wmi_beginscan_cmd() saving 'size_add' to type 'uint'
drivers/net/wireless/silabs/wfx/hif_tx_mib.c:103 wfx_hif_set_beacon_filter_table() saving 'size_add' to type 'int'
drivers/net/wireless/quantenna/qtnfmac/commands.c:206 qtnf_cmd_start_ap_can_fit() saving 'size_add' to type 'uint'
drivers/net/wireless/intel/iwlwifi/mvm/d3.c:636 iwl_mvm_send_patterns_v1() saving 'size_add' to type 'ushort'
drivers/net/wireless/intel/iwlwifi/dvm/lib.c:1007 iwlagn_send_patterns() saving 'size_add' to type 'ushort'
drivers/net/wireless/intel/iwlwifi/fw/init.c:126 iwl_configure_rxq() saving 'size_add' to type 'int'
drivers/net/ethernet/freescale/enetc/enetc_qos.c:88 enetc_setup_taprio() saving 'size_add' to type 'ushort'
drivers/net/ethernet/freescale/enetc/enetc_qos.c:738 enetc_streamgate_hw_set() saving 'size_add' to type 'ushort'
drivers/net/ethernet/freescale/enetc/enetc_qos.c:1186 enetc_psfp_parse_clsflower() saving 'size_add' to type 'int'
drivers/net/ethernet/google/gve/gve_main.c:141 gve_alloc_stats_report() saving 'size_add' to type 'ullong'
drivers/net/ethernet/netronome/nfp/flower/cmsg.c:49 nfp_flower_cmsg_mac_repr_start() saving 'size_add' to type 'uint'
drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp.c:1080 nfp_nsp_read_module_eeprom() saving 'size_add' to type 'int'
drivers/net/ethernet/chelsio/cxgb4/sge.c:2550 cxgb4_ethofld_send_flowc() saving 'size_add' to type 'uint'
drivers/net/ethernet/intel/ice/ice_common.c:2022 ice_alloc_hw_res() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_common.c:2059 ice_free_hw_res() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_common.c:4080 ice_aq_add_lan_txq() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_common.c:4164 ice_aq_dis_lan_txq() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_common.c:4222 ice_aq_add_rdma_qsets() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_common.c:4780 ice_ena_vsi_rdma_qset() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_switch.c:2561 ice_add_marker_act() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_switch.c:2701 ice_update_vsi_list_rule() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_switch.c:6063 ice_add_adv_rule() saving 'size_add' to type 'ushort'
drivers/net/ethernet/intel/ice/ice_sched.c:240 ice_sched_remove_elems() saving 'size_add' to type 'ushort'
drivers/net/fddi/skfp/smt.c:1066 smt_send_sif_operation() saving 'size_add' to type 'int'
fs/btrfs/subpage.c:166 btrfs_alloc_subpage() saving 'size_add' to type 'uint'
fs/ntfs3/fslog.c:392 lrh_length() saving 'size_add' to type 'uint'
fs/ntfs3/fsntfs.c:1686 sid_length() saving 'size_add' to type 'uint'
./fs/xfs/libxfs/xfs_attr_sf.h:41 xfs_attr_sf_entsize() saving 'size_add' to type 'int'
fs/xfs/libxfs/xfs_attr_sf.h:41 xfs_attr_sf_entsize() saving 'size_add' to type 'int'
fs/erofs/zdata.c:126 z_erofs_create_pcluster_pool() saving 'size_add' to type 'uint'
fs/ocfs2/dlm/dlmrecovery.c:1124 dlm_send_mig_lockres_msg() saving 'size_add' to type 'uint'
kernel/trace/trace_events_user.c:1275 user_events_ref_add() saving 'size_add' to type 'int'
kernel/audit.c:1482 audit_receive_msg() saving 'size_add' to type 'int'
kernel/dma/swiotlb.c:361 swiotlb_init_remap() saving 'size_mul' to type 'ullong'
kernel/dma/swiotlb.c:487 swiotlb_exit() saving 'size_mul' to type 'ullong'
kernel/auditfilter.c:1095 audit_list_rules() saving 'size_add' to type 'int'
kernel/bpf/reuseport_array.c:158 reuseport_array_alloc() saving 'size_add' to type 'ullong'
sound/soc/sof/ipc4-topology.c:1408 sof_ipc4_control_load_volume() saving 'size_add' to type 'uint'
sound/soc/sof/ipc3-topology.c:1657 sof_ipc3_control_load_volume() saving 'size_add' to type 'uint'
sound/soc/sof/ipc3-topology.c:1688 sof_ipc3_control_load_enum() saving 'size_add' to type 'uint'
sound/soc/intel/avs/apl.c:25 apl_enable_logs() saving 'size_add' to type 'uint'
sound/soc/intel/avs/skl.c:24 skl_enable_logs() saving 'size_add' to type 'uint'
sound/soc/intel/skylake/skl-topology.c:869 skl_tplg_find_moduleid_from_uuid() saving 'size_add' to type 'int'
crypto/algif_aead.c:254 _aead_recvmsg() saving 'size_mul' to type 'int'
crypto/algif_skcipher.c:95 _skcipher_recvmsg() saving 'size_mul' to type 'int'
net/netfilter/ipvs/ip_vs_ctl.c:2857 do_ip_vs_get_ctl() saving 'size_add' to type 'int'
net/netfilter/ipvs/ip_vs_ctl.c:2898 do_ip_vs_get_ctl() saving 'size_add' to type 'int'
net/mac80211/cfg.c:1123 ieee80211_assign_beacon() saving 'size_add' to type 'int'
net/mac80211/cfg.c:1127 ieee80211_assign_beacon() saving 'size_add' to type 'int'
net/mac80211/cfg.c:1150 ieee80211_assign_beacon() saving 'size_add' to type 'uchar*'
net/tipc/link.c:1536 tipc_build_gap_ack_blks() saving 'size_add' to type 'ushort'
net/bridge/br_multicast.c:2768 br_ip6_multicast_mld2_report() saving 'size_add' to type 'uint'
net/ipv6/mcast.c:450 ip6_mc_source() saving 'size_add' to type 'int'
net/ipv6/mcast.c:461 ip6_mc_source() saving 'size_add' to type 'int'
net/ipv6/mcast.c:530 ip6_mc_msfilter() saving 'size_add' to type 'int'
net/ipv6/mcast.c:549 ip6_mc_msfilter() saving 'size_add' to type 'int'
net/ipv6/mcast.c:566 ip6_mc_msfilter() saving 'size_add' to type 'int'
net/ipv6/mcast.c:2607 ip6_mc_leave_src() saving 'size_add' to type 'int'
net/xdp/xskmap.c:76 xsk_map_alloc() saving 'size_add' to type 'ullong'
net/mpls/mpls_iptunnel.c:191 mpls_build_state() saving 'size_add' to type 'int'
net/sched/cls_u32.c:1295 u32_dump() saving 'size_add' to type 'int'
net/sched/cls_u32.c:1359 u32_dump() saving 'size_add' to type 'int'
net/sched/act_pedit.c:450 tcf_pedit_dump() saving 'size_add' to type 'int'
net/bluetooth/a2mp.c:170 a2mp_discover_req() saving 'size_add' to type 'ushort'
net/bluetooth/mgmt.c:2856 load_link_keys() saving 'size_add' to type 'ushort'
net/bluetooth/mgmt.c:4197 set_blocked_keys() saving 'size_add' to type 'ushort'
net/bluetooth/mgmt.c:7103 load_irks() saving 'size_add' to type 'ushort'
net/bluetooth/mgmt.c:7193 load_long_term_keys() saving 'size_add' to type 'ushort'
net/bluetooth/mgmt.c:7888 load_conn_param() saving 'size_add' to type 'ushort'
net/ipv4/igmp.c:2250 ip_mc_leave_src() saving 'size_add' to type 'int'
net/ipv4/igmp.c:2399 ip_mc_source() saving 'size_add' to type 'int'
net/ipv4/igmp.c:2411 ip_mc_source() saving 'size_add' to type 'int'
net/ipv4/igmp.c:2488 ip_mc_msfilter() saving 'size_add' to type 'int'
net/ipv4/igmp.c:2502 ip_mc_msfilter() saving 'size_add' to type 'int'
net/ipv4/igmp.c:2516 ip_mc_msfilter() saving 'size_add' to type 'int'
net/ipv4/igmp.c:2575 ip_mc_msfget() saving 'size_mul' to type 'int'

--Yf+M51qgCpmI+PBL--
