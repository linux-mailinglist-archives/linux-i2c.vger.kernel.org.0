Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C184F6AA0C5
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 21:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjCCU74 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 15:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjCCU7z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 15:59:55 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10106222F0;
        Fri,  3 Mar 2023 12:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jea1/JECABcPh2/Cnw1FCCmfEhpUz0RZ/zSu/Atn22AQmZNmtBNnpDPJ9SQ61zb9opJR+jbtFY0N7W/F0e9AlSepHbW3YTL3cSYHaPfEwLWiAPl2ErDboSMUX/lXnzHDGcJI9ujX9q3eTUIZFdjuYbmKowtJCf688Q06MQlUsF3j/Mct7KhW0RiJhh4Vd62S4NmzYHNBXv9mCMRSdfycYM84V23hKLkZrUhBYonRnjrNH+btgIXWrhVjsV9hHvstT9bZPEW1XYXD05IEhNcCWsGkPmDbiSPqCTFJS3m5qPSyRN7f3z6ecs8jwB/Ee9Dia5eR4wsmr5q3qqMWsAJxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMB2weuNZVO4byKx3oCeXhnfAYsUp+k9XCyVjJtku5I=;
 b=Ie6eRRWe06Hkf9YH+ockKeiaDsTEqUI+FzfmDNp43yNX4SceEKFDM2x6YxJrjmc3IavHStlxrIqGUlRHtgOu4963okYzh2NIGDehoRFqHuF7t0wCKcBzu/hO8A+ZukrjJm5aoh6Ng0SHmTQiogIVuZUhvqG5ryrEPvDNvDYqauTo61EmOUGyxHPuq+cjvCp8LZYBN8WCcCmCZ3Q00KsQd6D3ytGE6slQK1RXbk3VsPXMcUQRmtdhxtOvGvdBKwQhfeeysfaDOtqe+um1shBLbppH07ewSfDx2DvCJhaCZRB+MhyiS+AwDxqVS4YZANwyoJ36EKY7lzzMBeBNTJBuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMB2weuNZVO4byKx3oCeXhnfAYsUp+k9XCyVjJtku5I=;
 b=aRdl2SW5ZsJcr1awVUwlm+eH+ci0/y7yurDZ11B6uJhzxX3HvxdRwLiniX59GUODZ0qD75SOU6jkFIuopQcXS1cN5L7JJxPC7fTndxlbLwgi1OMpigHJii/99/XnpEBXXRfIiv41aStffWW89jS3wweluY9uQ1Gsk8LCTOXjFg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 20:59:01 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 20:59:01 +0000
Message-ID: <9b4b0c6a-3cca-593b-bbda-b138e93de513@amd.com>
Date:   Fri, 3 Mar 2023 14:58:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/9] Export platform features from ccp driver
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        herbert@gondor.apana.org.au,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
References: <20230303165050.2918-1-mario.limonciello@amd.com>
From:   Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20230303165050.2918-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:5:74::22) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: ed43a90c-1cd2-4611-925e-08db1c2a1d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3sNmnXZosuHaMyCfI4hiPA+DrLq2adDm5AEq9L7Qvg/8Q21CLTK+shFRxyjNESQJING/DRdknYMlhslhefCfFYOxRaMA7u6hmp63d9Q0r0/M26RHFNTT6MFXdg1M5jFQ+XaoF6ufZlXciXg9wQWKepy/eU1fSKnpckdsTyl0y/sV5CLiqVR/BP7f9cv/ZP+/VK7jPTYi5XCQ/l4xdfbClb9vTPlt2yoTnXnnz4YkQmITqcNULMFBbNDTCr7sGIbsTvkTR+xOPP/ntjs3Z2eLx2VNiGcHZ/z5J0QqAsoH07ppdHo0eL/HbPb4KCQG4Vak6T1qaAAGQtrrNTLouRnAf9U7BMlEgTwCpz2p11YqrcgyJrurb2MV5chycd1h4do0Gb1IlXEY0VQAdGieFP9VHtdAlBnIBjFUYS2lwoYMvFYv5vHuPkV/Uyl04VMEHHXrV6PUzAtLnFOq+AoDQlFJEjihAjsEiIoJ3nF5g5FAcJf9RtQdLzmGXbYVDSSGLbjLccXNI5ClGQR5SydlnYiq3gUNlqxXyrKtOxbe9S47oAIJvMQQ5Vg8ax8diZE3KWu2gSoMQMlUkyEn1GcIF1vE3syzi6sX7prgkMcS7puo4BWFo5UHVjOs21VWJ49KSTfIdmL9OIfIY3KesHlNWqXZp0W/TcW2ZSav3h7n5OzysVTXahyf8wYDxc/ORU8U2rbqla8V1bo7MTwDR4z6Q4Wb8GtsGYa+qhM3eNpguuqKgbEdV6811N1pR6rPoHqQpX+6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(6506007)(26005)(110136005)(186003)(6512007)(921005)(53546011)(54906003)(316002)(5660300002)(478600001)(36756003)(7416002)(6486002)(2906002)(6666004)(31696002)(86362001)(8936002)(8676002)(83380400001)(31686004)(4326008)(66556008)(66476007)(66946007)(41300700001)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3FOcXRPR0pZbU1ZZ0FkWTMvbjc1TWUzT2hicHBoVGZ0bjZSdHI2clBwOEps?=
 =?utf-8?B?RTlkSmJXcmFDUXFTeEZBcWxlWXdQLzNleHpSOTd6VlhZamRoTkFQZlhGczBw?=
 =?utf-8?B?TUNGZWFnUGxhNHVhVHQwZDlWditrN2tRWW5nSzR6QXlQSG9xY0RsZU04bmti?=
 =?utf-8?B?K0w2NVdUYVlvV3MvTVcxVFFwemp2Z0xoRjJ3OHk5N0JIdW1FajE5enpER3hh?=
 =?utf-8?B?bk0xb0xlb0lrN3NBUDI2MWFQYUZkcXY0MUxublVJNFJFYlN3YTh0QURwYWE4?=
 =?utf-8?B?cUk1NUNFWTZEVkRyMDlWS2kwck5GQjdvR1V1enV4cGo0b25YRklQTUhGUXJi?=
 =?utf-8?B?YnI2M3QyQ0k4WTVUNGZqVHNGdjU4QmczZVk0VS92Q3hVNWpQSjNMeEtpOGtn?=
 =?utf-8?B?WVdaY24yakQ5YWpqbmV6RldUYWRkM1hodHYwZnRUYXFJRS95aFFrejc4UFNj?=
 =?utf-8?B?Y3NucS9DQkpTemYvQ0UyZUtzMldNUm5oaEd2WFB1cGhjQ3F5b2tnbHdyLzBG?=
 =?utf-8?B?MzQxMVgrQlF2dkxiV2h4bCs1Mkc3NkNjYWNzRllhL295YVkyRDhoanBOaG5m?=
 =?utf-8?B?MFk1cktPdTNsNjZnUUlIYXVqWVdGeHFXd2dtaEFheGh5Q05pNXVwdE40bjk4?=
 =?utf-8?B?TWlHOVBjVno1Mk93cUtXZ3ZQWjhOcHNmZFJkQldZNVpUVjhnL1FEMlRONngz?=
 =?utf-8?B?TEpEcm5OMUh5VGtvUDVGWDJWUUZvWTZ3N0I2M3lMelZEaDZ6VjJKRWtWSVg1?=
 =?utf-8?B?ZDgxMTBJWnZpb25PL2puZUZpZEpSZmRDZG9ieTdTZlhraWJUWk1vSmdrRnEr?=
 =?utf-8?B?bC9XTDQxamhFQ0xOV0YvZG5WQTFnQ0IwZ3RQMk0xTmZuOXgyVUl5a1JnalIr?=
 =?utf-8?B?dkZRd2ZMMzcwc21ORGFuMHEwR1RwaEE1M1AxT1BwZk04RlRBbnBxd3Q2RWVJ?=
 =?utf-8?B?NWtVQ2lEaWxDZDVtbFNBR0xNUVZCWTdhcnp5MlpvaThOdGluTmhuajN3ZDkv?=
 =?utf-8?B?OGR3NUpoUXN1TXdmd0lPb05MUDhSU2pETjVpYkVrNUczbU1nUXJuRGp4WUs5?=
 =?utf-8?B?aEdUemtXM0xDWTJnZnNxUkdvZjJGcmNjZjBwVXVmOUZjcmd4ampGUzVTZ3cw?=
 =?utf-8?B?dkRMaFVFMldGTHllZXd3TS9nbUNJd3crVnZCcm0wdDNyalNaVUhQZHJoT05l?=
 =?utf-8?B?R1ZWZUpLSGV1RktIUWlMVDhibGN0a3lSK0wzRVZHKzdzUi84VkdTQnRqWURH?=
 =?utf-8?B?eXZwMzVjOEFnV20xSXZCRGRNM0dhVjkzVkF1NHgzbWJWRjUwMGlEOTdLbk9H?=
 =?utf-8?B?Z3MrY0xoYnI5cjZRYTRJay9lNEI1a3JyNlN5SEFUakRNbmF0Rm81THRTQ0pj?=
 =?utf-8?B?OTdUUnczR1JBQ205MXJNRHlvRzZleXl3VDk4WUpicUlOTmRBS1NYNHRnTXZX?=
 =?utf-8?B?UUNtZ3NTblRPNnBvbHkxalFtYWl4NXkvWUt5RjlWVm5wanE5Q3YybTlSMmMv?=
 =?utf-8?B?NDBtZnR5T3JiV1JTMHRGNldXZVc0b0MzeUNGUEZBWHJkS0FnN2MxUFoyM0xq?=
 =?utf-8?B?R0hCdTdidGFDV1NBSGdHSDZiUE5DZVlsb1ZtSVpFOXdvd3hucU51WWoyRWN5?=
 =?utf-8?B?Y09qc0M0OWYxVWFlMEFaRjhJekpTZnpFRDZSNVVtSzZkVklIWkptbGZEaW42?=
 =?utf-8?B?M01WM0NaL2tlZ3pha3RYZjc3SXhpY3E2MlJvd0ZVcVhxOGEwQTlVOUkwZUN3?=
 =?utf-8?B?dE9KUmUxdjk2ZFNJWDhURWxpeFliYWZJdlBDclJBTXF0REVSTTM5em1UKzJG?=
 =?utf-8?B?Yis1MURJVXd4QjdXVEg5dGFvaWFsZEZ2S1B4YkdFVmNXeFppbktHYlBuRXd3?=
 =?utf-8?B?T1dLQ0M3RTIvWGU3dkF6cUNHTHJMNU93TCtNTzd1UHJvOWxlTlNmb2NFdlNU?=
 =?utf-8?B?VEZCRjdoenJPMG15SXA3eTh1Zml3Rk44eUZXTXVFRlJFWnFNTW5KUVRlajJF?=
 =?utf-8?B?Yy9JVXQ3cmQ1dm52SHN0WDkyL05leXJKOTRrZEZBQlFScnpQY24ySUhUazRB?=
 =?utf-8?B?Z0ZRQ2JLVHQ3SnVSMXVQYWZmd00xT3c3Y1NhM0ZaVkNRNm05VWtqTW4rZjZ6?=
 =?utf-8?Q?vumFQPHcBGAUsX9QozPG6UaHa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed43a90c-1cd2-4611-925e-08db1c2a1d33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 20:59:00.9379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmwBKhXSfnz9FZ1NZNCdWFNizBY+Rw3ejOry0mUdNST2KYovOzWR8LvYEvqdSCX/zjQobYFAq4WT7Zz3E5G0pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/3/23 10:50, Mario Limonciello wrote:
> The i2c-designware-amdpsp driver communicates with a platform
> features mailbox provided by the PSP.  The address used for
> communication is discovered via a non-architecturally
> guaranteed mechanism.
> 
> To better scale, export a feature for communication with platform
> features directly from the ccp driver.
> 

If there is agreement with Jan and Grzegorz for patches 7-9, I'm ok with 
the rest.

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>

> v2->v3:
>   * Split new ACPI ID to own patch
>   * Squash doorbell offsets into doorbell patch
>   * Fix all feedback from v2 (see individual patches for details)
> Mario Limonciello (9):
>    crypto: ccp: Drop TEE support for IRQ handler
>    crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
>    crypto: ccp: Move some PSP mailbox bit definitions into common header
>    crypto: ccp: Add support for an interface for platform features
>    crypto: ccp: Enable platform access interface on client PSP parts
>    i2c: designware: Use PCI PSP driver for communication
>    crypto: ccp: Add support for ringing a platform doorbell
>    i2c: designware: Add doorbell support for Skyrim
>    i2c: designware: Add support for AMDI0020 ACPI ID
> 
>   arch/x86/kvm/svm/sev.c                      |   1 +
>   drivers/crypto/ccp/Makefile                 |   3 +-
>   drivers/crypto/ccp/platform-access.c        | 218 ++++++++++++++++++++
>   drivers/crypto/ccp/platform-access.h        |  35 ++++
>   drivers/crypto/ccp/psp-dev.c                |  32 +--
>   drivers/crypto/ccp/psp-dev.h                |  11 +-
>   drivers/crypto/ccp/sev-dev.c                |  16 +-
>   drivers/crypto/ccp/sev-dev.h                |   2 +-
>   drivers/crypto/ccp/sp-dev.h                 |  10 +
>   drivers/crypto/ccp/sp-pci.c                 |   9 +
>   drivers/crypto/ccp/tee-dev.c                |  17 +-
>   drivers/i2c/busses/Kconfig                  |   2 +-
>   drivers/i2c/busses/i2c-designware-amdpsp.c  | 179 +++-------------
>   drivers/i2c/busses/i2c-designware-core.h    |   1 -
>   drivers/i2c/busses/i2c-designware-platdrv.c |   2 +-
>   drivers/tee/amdtee/call.c                   |   2 +-
>   drivers/tee/amdtee/shm_pool.c               |   2 +-
>   include/linux/psp-platform-access.h         |  65 ++++++
>   include/linux/psp-sev.h                     |   8 -
>   include/linux/psp.h                         |  29 +++
>   20 files changed, 438 insertions(+), 206 deletions(-)
>   create mode 100644 drivers/crypto/ccp/platform-access.c
>   create mode 100644 drivers/crypto/ccp/platform-access.h
>   create mode 100644 include/linux/psp-platform-access.h
>   create mode 100644 include/linux/psp.h
> 
