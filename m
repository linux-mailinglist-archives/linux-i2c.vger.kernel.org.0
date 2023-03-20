Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61516C06C3
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 01:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjCTAQ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Mar 2023 20:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCTAQ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Mar 2023 20:16:56 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774F1136CD;
        Sun, 19 Mar 2023 17:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2avuZVVzq1awhymJHuB70QhoVtjyWdcUD38h6WNsRUdhdfiirfilk0y8/TJoHjSYi3IQ7i9VoP+E+KrxJJY9FiimnZOi2hRwWVpnctHs4TLk59thlWW7pwlc2o+gpG1wTSb1k5JTqhccKj5t0uTwI+kg94NTR5QM3AoJBTYb1xmehD/Ucu+i7Q3noIzPdcoCSsjWE6TjvbLMDgSJW17llsrwp9QP39uFw/fDBc8PXxjIEdEVpQ5Y+HmBD/J/OUKAgjgGVWTtSYs7fa2lsnosRLVKR00vmOkG8izbRGpe6AHHP5lMKn+8d+Z9ZzpsSulWgbBU10MeJNBaPJ5yQiChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBGkBbE9tza21SNJI1/EQ7fLS5hQsBPBuSpEygvD8D8=;
 b=g5XIEvVR8HK1u4+1DensolY1NAuufSbsBGIWKuBihVk6DeoMQImr4n8vWD6hHSrrV8MBGdwz9m4K4mbXNGCvYNX0e88U8kSFcWnnr4ck9QYxXp3ZxckxylDZ1oNSZ5XOyA52l1G1i46OyHOHsIEXhjVRe4pU5NfEuuPrRHaokLil5zh7xSgx87shqLUMxpgvxK/a70DflKlXLv4rKPvA979TzpNfruopx49H98F49s6layyqV12V3C38rhzNBOSJFAAah3kJzBUI/TgzDEAsqvBfpr2BiYLe/hrMnPsFYSNA9nyD02CmHcuGxzVPmfVP75ND0WR4WdDR7cDjpxf3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBGkBbE9tza21SNJI1/EQ7fLS5hQsBPBuSpEygvD8D8=;
 b=face/DWO7NgilEFM6HMobbgQixo9VRUG9e6IFDcfu1kPWWuus+GWYhw/T+AtOOPB3aLlM0UgRBaU4iqlTW51SULgks9QSq4QJwZUiBxqVBqcAP7Tv33yH9Q0M2wXWfYidDvPGHfzF8GoKWPPSWPGnPKeAB2HHewqLpGt/joNMWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 20 Mar
 2023 00:16:50 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 00:16:49 +0000
Message-ID: <07b78baf-e9d2-b4c3-5fe9-01f1b57033ab@amd.com>
Date:   Sun, 19 Mar 2023 19:16:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH -next 2/2] i2c: designware: Add support for new SoCs in
 AMDPSP driver
Content-Language: en-US
To:     Mark Hasemeyer <markhas@chromium.org>, jsd@semihalf.com
Cc:     andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rrangel@chromium.org, upstream@semihalf.com, wsa@kernel.org,
        dabros@google.com
References: <20220916131854.687371-3-jsd@semihalf.com>
 <20230317191834.186690-1-markhas@chromium.org>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230317191834.186690-1-markhas@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: a84060f1-fdc9-4478-bda8-08db28d8663b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m80iNOCcFFQjK8Sdu5WEdy9JMv0Gtjxd/8ZPI4rd4oib8hp3PnxU8zidlY6EjTeS/2YV63rfiG0axdIq1e5mDZZBGhU75o1GL2675DM63kAY/XVf+pY7kNbgMuO/TGo38Mj+4oFvp4j01Ky47xdUEPQJD4W1whT312DWx7v8AOLVgyDwpUCWW0gERq9bNZ7aqeTU+NYTeNKhpALUl44O83l7II8TEYVpi1RhL8x5vctlebdxzKUfHQ+wo1dHEOkyLBjIjbJvelgyKBd+3x3YfFiaddWI/wm3xEFayPBG0CaIAdolRS08DglBIyTYDFu9oTZ8TAqXTtr40KK+oi4z9bJAg76BHTf4N0G/GDCyCQQ3pfrXHfCL9v45WaZXusGqRvBNdAnJEvqypYn7IYTDFr+XgYrK5azV48wCg6ONuFhKV4PjhYZrPah5J4kgl5N5og/7OYmaLA6EuB9mBmZeeojsUGSb8HjXnM6LkMdHogo3fm5cm9uN+veDH9e7m6i1RAFNSZGZcBnULY8h3DGyQcEib1NgyCLC6lSzx/BZExzKmZ1rrnSVw03iSJdEp76/9RvGjCuUufRh6XC/FWDt4+aV9ZapXdrvjzROvsw5y/Z0C9MHCASDMTSrBOgtqc/7hcnzrQDFoewCzXJCEB3UnzwIUpchUShdz69K+1Tr1m3pRfI0G7FGIoESK3glwNVuhaBNHUrHP3luWrEH+/oW2LyMO7I9Vdq5L1qgtyVFX3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(6029001)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199018)(31696002)(36756003)(86362001)(5660300002)(41300700001)(2616005)(6506007)(8936002)(186003)(6512007)(53546011)(7416002)(4326008)(2906002)(66946007)(8676002)(478600001)(966005)(38100700002)(6486002)(66476007)(66556008)(316002)(4744005)(83380400001)(44832011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXpmaUFOenZ1ckhxTm5ZTDA0aWRxSHdhZFBPdWFRLzhXSCtZMGVJU0FBeEZR?=
 =?utf-8?B?OEwyd3ZHRS9TVEpXQUVRUUI1bFNjcTlnWGZQcHpBemlCOVEvV1NkZHpqZlh1?=
 =?utf-8?B?MTJxQlZCSVJTem82a2Q4WWlvS0RvaUprSGdKbi94Ni93K2REa2RRM0ZvL01n?=
 =?utf-8?B?UUQrZnF1dVNFbGtodE5DUWkzMm81L2I1S1pTeTdjcjl0UjhibHlhbTc5eW1p?=
 =?utf-8?B?a2NPeTZaM0ZmelFoZ3ZrdERTV3F2cTNYbUVWWHVHa0FyR1QwaldWUSthZCtO?=
 =?utf-8?B?dS8xQmJITHdzbUtFU1pNNVFmMy9NRFFGbW55bTF2clZjczJIYkNXSFZ2R0hw?=
 =?utf-8?B?QkptWGdXaW5WaUgyZUZNUElGejMyNmRIbW9sc1lVRkZIbVpTajBNVXFaV1N6?=
 =?utf-8?B?dnpyOGFLZmxqbGdTcFQwT05WVXdmMllCTkx4ZDl1emRqaW8ydnJlRHlTMnJU?=
 =?utf-8?B?Wk5BTHhLLzk3TGljc3hBTmJiL3NGYks0c1RoNkFERjE5N2xIR0RRK1dSNDIr?=
 =?utf-8?B?U2NmTkJDb1NIWkdJZW9scDduYm04aWRtRVJZK1g3bjNLalJCRzBBL2N6YW5l?=
 =?utf-8?B?dk9SbFhQM0cyYnBoTnJlSHJoTE9kZHpjUkVkYWpzOWM1NVR2Q3pBaTd2NXdq?=
 =?utf-8?B?ZmRwZFZKczRNY25BM1A2VURKVXE5QnJ5YU5XVFZLN1M0ZysrdnNLQWlCNmhG?=
 =?utf-8?B?eGxZbWhYVEFmUlQrRmVZWStlcjM0YmM1dmV4YXhobEdibmtuRGw2OXVZeVdq?=
 =?utf-8?B?K0M2L2R2eDB6VWJiZUd1bVE0NU5aSGlFcVRsU2t0dEtCUjBzb2ZpR0J6OTNz?=
 =?utf-8?B?YkF0YmdodGFwMnZ3QWJ6Q2RmTmhxeG9ZZ1VFZTV6dEJkNERDUFRlaTN1Wm9P?=
 =?utf-8?B?MnNOd1FPMmNDM08xOE9RcnVEUXVYSEJEL0VhOVNuRi85YkJVUmp1UGtjaEVr?=
 =?utf-8?B?YXNTcmRjUHRPcTI2blZ6dnQ0ZEdka242eDE0azhMNU9QUXdkY1IrMjJCejBO?=
 =?utf-8?B?S2EyVzJiQUhrbldUM21SOHRrYkdkczgxb1Q4eXlXbUdvMHhUczRxK25XT3Rr?=
 =?utf-8?B?eklhNk41bGVKMTR0dDZ5emdTay84Rk5RU1VBNXBaTWZyWEpKMW9HK1I0SVRx?=
 =?utf-8?B?YkNnV20wT3k1WGZRWXpuanRYREVqVjJ3S0pqK0trUDV6L2xRd1ZkdmlNODd1?=
 =?utf-8?B?MnoxQ29ReTRuUVp4YVpEdEF4b0ErT2dEVTlVVGxEbVRQbEFVaW9JODNHSkRE?=
 =?utf-8?B?Sm5JYWlzT0MvbFdMdC9mNjhvdnQ2bnJqT1JKMFhlRGlhREtCU1BBYlNNR0ZW?=
 =?utf-8?B?bDM4Q0JYN3dhM2lsbEdFUHFsaStZVTljQzl1RktLaVp0NDNDNXJjVFVod0Ev?=
 =?utf-8?B?ZzNiQnlsOWozT0JKckJMTmdqVWtheDRMelhySkZTcndVTFNGcmFrYTJpdXZ4?=
 =?utf-8?B?ZlNBTTdSN0txNEd2Sy9zOXR2bld4aU5QdkdOU0lHaUI4anZPcHNxYmMxNGhX?=
 =?utf-8?B?R2hLY3lIcU41Z0RxSi8yOXEzWFVKVVhvNFd4bGk2VWNBanVCenJrVForbzRw?=
 =?utf-8?B?YVowZVQ4ZDdHN3RtYUFVNlMxNitmdjFRZ1p0WEh5WFFabENxdE0rZVU2UFRp?=
 =?utf-8?B?SG1rbmxFc2MxRzdIWk9ZR3BDZDIwVDkrQ2phMS8yK2VtYkcxUE0rK3VoN3ZZ?=
 =?utf-8?B?WVVSMkNPRkx0UFAxTUMwV2I0WnF5YjVka0xWV2lUSllaN0tBL0RCVEgwaG9X?=
 =?utf-8?B?MUpJREhiMmQyc0xzQ0ZxbEVFM3FzUDM3TjMxSjNtRmdsRTUrUGRUbnl6QzEx?=
 =?utf-8?B?dlU5aGh3Wm1qdDVjQjBubnJYcm5SUkZOS3laRXkxSWJrQmgyenRSTkNsaWt5?=
 =?utf-8?B?YjVlaVhFYTF5alNabmwrSmF4QWhFOGNwYUlTUytFMFpPcmEvSGkzdlg2T1Ru?=
 =?utf-8?B?R3ZFMkh0dkw4dFZSSTVINVFHTEkxUGMyUEhhdG5JYzUra2p3UFhkbmFNMWFM?=
 =?utf-8?B?TVMrc24vcTMwbWJZVWZkNlo4bEJBSzdtVHM1L1NpbG81SmxGbjQ2RklyUnIv?=
 =?utf-8?B?R3FJUCtRZUJwRGdzYVJNN09MQTVqZzNlMEgyeW1iL09yUmZNVHE1SmVEWEl3?=
 =?utf-8?B?UDZzdHhZNmpkVHdHSUJvK01IS1pqeUN3VVlkd1FqL3ZsNjQrQm85cGpKY0pX?=
 =?utf-8?Q?dwFdqykL1kOBDCp1VnPx0bms176ffs5dDm44psrAgU++?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84060f1-fdc9-4478-bda8-08db28d8663b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 00:16:49.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAXlDWM6G315PFtgvtxAuhHUAxJJd3tjP+35hlnbf+/7cVu7rOyHtILQH1kDw8zi9N6exdiWu/tor/+8xhUikQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 3/17/23 14:18, Mark Hasemeyer wrote:
> -	/* Status field in command-response buffer is updated by PSP */
> -	status = READ_ONCE(req->hdr.status);
> +	if (req) {
> +		/* Status field in command-response buffer is updated by PSP */
> +		status = READ_ONCE(req->hdr.status);
> +	} else {
> +		status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &status);
> +		status &= ~PSP_MBOX_FIELDS_READY;
> +	}
>
> The value of the mbox cmd register is getting clobbered by the return value
> from psp_smn_read. This can cause bus arbitration to fail as the driver will
> think it can grab the bus when it's actually in use by the PSP.

Mark - FYI this approach is being superseded by another patch series 
that instead uses MMIO from the CCP driver.

It would be better to comment on that series.

https://lore.kernel.org/linux-i2c/20230310211954.2490-9-mario.limonciello@amd.com/

