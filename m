Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9EC55347C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 16:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351562AbiFUO3v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 10:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349141AbiFUO3v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 10:29:51 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2084.outbound.protection.outlook.com [40.107.96.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B223A2316C
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jun 2022 07:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7ZEleHxNVbP2j0rN82+4vHn/NwTqdRgsyfW6Yjr11dpWU8vzKY4LGEy9qOTHstpAEfC2Bm7zkJ8Z4xHHgPuG+n1atr29LZT7kC0o6VWdFyKpg0vNm4e+wk7w2X4R9W8Bze3d2dqT6g+83/A1GzjyuhvkEV6b+ehE6KTUoxZiw1MRInLLPJODXE+C25Oz511MaVWh+ZfoxEQqWSC7UjjkOWcORu5J52uLkITNJbyz+kvqRvRzkfPSseahesPSyTHttI/eqZGYAVU8CxnKqs+qvAr48aaDgJreGIjVDmjagfAazjUkN5ChtMdiEPHMRIvE8rm6GHZbjZYszXIobDQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L979bol9IKIJQLYeOBwkXwGdJ6dnlyJhng/UF9OsnBM=;
 b=MoxAOduBejOuX/9xPtioeWfdCADjmLZd48Cnz7jAAaL8uWuVaI+4Vz3oWJYSVfetv9n+ZmZg6NuUz6BifGD6OFlSMKnsHBl/6K41FLKRN6rabihomZQXjqHs4FfBZJmMjKZcUR6Q7Yyiayk2ss3RgKTyencuMPceD2TvEwpJutLBcNJKt36qIKpbupFoXR7jR+yyhwWpbC7WjPmbk0MVQFt8msHhmZdro/BdXZ3HrWrLWNM6uEC1XQwh/lnBbqaTvZfFw9w5qPbSGpblotrYRCOIGT9oCuJj0k7qtqhf48eYUN+Fz56cABmfvaJPIl//tsYxuVLh/tChcEWNpuSRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L979bol9IKIJQLYeOBwkXwGdJ6dnlyJhng/UF9OsnBM=;
 b=jCsAwDt3aOqjbMEgHNqVRrdhOvmZ1aMqlnUROV/76isSa8nYBxfq3vFGUe3iE+C+GtQH6sDMM81z3Ims1JTyRvo6E3YD1PJmCvsV8SpD2LegceVlo/whIfeL+BL7HJCAkTG8vtMwTr5PMtPuugMTFahbsLfMTJ4lmQw2Cykg3F8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 CY4PR12MB1205.namprd12.prod.outlook.com (2603:10b6:903:38::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Tue, 21 Jun 2022 14:29:47 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::ed55:e138:4e33:611e]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::ed55:e138:4e33:611e%6]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 14:29:47 +0000
Message-ID: <0ce578ba-cdc7-6084-6119-10170d5e80a1@amd.com>
Date:   Tue, 21 Jun 2022 09:29:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [bug report] kmemleak from driver i2c_piix4
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>, Yi Zhang <yi.zhang@redhat.com>
Cc:     linux-i2c@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
 <20220617093818.37a721a3@endymion.delvare>
 <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
 <20220621144822.1d9228de@endymion.delvare>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20220621144822.1d9228de@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0391.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::6) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3e15610-7f25-4d07-c0ce-08da53927dc4
X-MS-TrafficTypeDiagnostic: CY4PR12MB1205:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB12052479D0CA51FCA9D4F0E783B39@CY4PR12MB1205.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eeHdYD0B3uh2Sw7VmnyE7z54Pe7UYol1mz4ZP84DSW/l1JSMuUhxLHp0PQbkZB708oHIXtmEcwQ3RiOexr3DQZWLgVxaqtBidtfOMibBcaIMbGyk3EcusVbxT8VSA+p2ltMux3ySqtYPV1UFb5jU0NJOnqrhqsd6chk19/bChXxn++SkZ4+gLjDXIrtxqORqNTvfvmV9XZmsYebaLQ21gS5Hf1bCpjfansdiSMih95Phnchb170Ccg2C56ZEYDiWNeB0KPc424AS08I0/bt/HVyfV3Q95YNSeZsD1/AJRmvy+pOp02WFglHXs3K/JIB/abAd4JzIslBA2y7qurUTrVgwAPxOIlQdOHfS6V0MzdTVeNwNwXFNyD0vIH3qYfkSF8cSURyCqXO58LrodRCoq5P+6tsbNRIAw/KtTX1tYaRIdthRgtuZMkwmA/nZbo2KMBahmEs+Y75Ni80bc7G5dC9fTd4nZHDF+qsx9qS1zCBedAb3U8P4EzkOKrfZvew1e/XfInyGsmBPVdLbySe+ptATPmWIwHAvnq0m797TvVPWK93ziDaa/KZcADkT6EzJXkwITYoN0o6dtkf9PvBCngTjGfp9xpZHW5njDIFw5xJxdrfop9Mtgl80CASr61LpnqTX6nnMC8tTiBW9AWD3FI6tuSdz31t8vAAPwfYSALWawk0ZRykCvErZ8rc2ZF/qjAQkFIUFLbYhFl/T55ouG1TVTVnYkAhS41ag/xLhNqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(2906002)(6512007)(4326008)(66476007)(26005)(41300700001)(6486002)(66946007)(53546011)(31696002)(186003)(66556008)(8676002)(83380400001)(6506007)(5660300002)(8936002)(86362001)(6666004)(2616005)(478600001)(31686004)(38100700002)(4744005)(36756003)(110136005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUdZQVBwWGZnT0t5ZllZeFZwUEN4dy8ramRXeDllRm1TNkdxZ1F0Z0Q2SlBo?=
 =?utf-8?B?bnpXOE44SGpOMHhKL0JaVTQwallza1IyUEZhbERCUFZSbmt4SW9yQlJ4dThx?=
 =?utf-8?B?a2VSTjFGeHlqK0lQRWk3aE1CaDlicUVjUjNGMDQrbWRxNk1scDJzTVRKUHIx?=
 =?utf-8?B?VUU2dzZISWYyZXdocDhFcHI3QzVpRHQrbytrdDNkUDJLcVN0a3FreDBSOU5r?=
 =?utf-8?B?RzNSQ3ZuemZKTm81UFZmYWNabHc3NnkrZnRnRldjMkx3Q2UzcEYvaDgyM3pw?=
 =?utf-8?B?TGlqZzJoYUZHNVN0N2ppdjlXelIvNEdCeFo4bmc0aGNFYWIyTXI4dStHNUJM?=
 =?utf-8?B?aVpNNnlCbXJxQk03SUY4K0REL25aTXFSZ0xuT3FWaWtEaWxnQXBKTGkwK2dR?=
 =?utf-8?B?NndjSUhwSWkxSC81YUdvQk1nYWxIclBsaG00dmVFT0dyYlZJa2pTbm5xT21q?=
 =?utf-8?B?SGIrWitzYmk1Mk5pYTI5VGMzWUZEdFR6eEZROU1sTkhzdjhLRUpNMVExcHg2?=
 =?utf-8?B?dTUyaElvQTEvMGZJU1dzbDNTUm1DVFU1L2xkQ2JZY1pUSGl6b3JUZmlUQmJq?=
 =?utf-8?B?N2w0VmpqOVh2RkhjUUJZMVBUT3VnaEpaQm54em5leVFRdVdnV1BoYUNVTzN2?=
 =?utf-8?B?d0RMTnlhNnFrZGYxZTVJNDE5TCtxOWVMTU8yL215bGFCZnRFYkN1cU5tZ05I?=
 =?utf-8?B?RVNHMWJJSm5uVHFTWGIyL1FkL2JYQ0V4OWo2NUpYY1UxejgreXNWNlRRQS9Z?=
 =?utf-8?B?NjBNU1JPY3JQb2VyOXBmQ01IalM1S3lrZUEwRTRTQWRuUzViVDhGV3FBcFRK?=
 =?utf-8?B?QXIvaGs5b2N3Q0Y4OU8rSDRKTjB2RVp2UTNJZmNyTGVqQjhHYUQxK2hQRkdO?=
 =?utf-8?B?RTA3bEJxT3RiVmJWbTdUUHJaeHV2bjhiU2hKT2szODdiVGx3cnRwTFc2elZy?=
 =?utf-8?B?a0FlVWV0aHNyODFkcStRM1JpVEI1eHkwcDR1QUlaZmp2K3YxZkMwL0tQd1NE?=
 =?utf-8?B?bHdXUVpFVWpkcUJhN2xpQ2ppNlhCdUgyVEkrL3h6VTlXdnRFSHMrbnRhUUxK?=
 =?utf-8?B?UUFqSjIwN1prcHJKM2lGVHRDWk1DUGl4ZjhQd2p1Um5kc2kyemNiVzAxTVFI?=
 =?utf-8?B?MStGNnRjREkySGxWQkY2NUwvRFNSbWpyaVE0WWl6SG10V3JZU0EyMnlKSFFh?=
 =?utf-8?B?cmE3N2pIcTRTeWZITmdXeER2Q2gzajY0VllPSFdoR1EwaHZIWlAvWlY0a0N3?=
 =?utf-8?B?Uzl1NGN5UTY3QTN5YUhHZkhham9HK2xIaVNDb2M5UW1uN3c5SUQrWW1sUUlL?=
 =?utf-8?B?UStJZGJaSkxpeVR3dE1COCs2SGFhQnlvSUgxRHdIZHVHaXQyOVY5Q3hRbzRI?=
 =?utf-8?B?L2xObG1mTmJrVTFUNFlwcHBtTnFka1FId0hlRkNPYnRjWWpocDR5VG02Vmh1?=
 =?utf-8?B?NmptNDlrZjJWUmdvR3kyTXRxYVcxMzJSUDRLSG85UXY0NXRIWm51S3pSMXg4?=
 =?utf-8?B?U09ZU0Z5V0lEdzU3TlBKMktwc3Ixci9qOUM4Z2h5MmxXcFI1QzN1Z2YzT3lC?=
 =?utf-8?B?Z2JaMkJ4a25oM0NmbWJCUFZmdEhYRnFqV2FPRHNZaVMzNEU0Yi9PcjZ4eldC?=
 =?utf-8?B?WHVvOFVmblgwcjVvQlBLM3FhUFdmMnIzSmZVOXNkc1VjRFREdm1Ua0o5VnpK?=
 =?utf-8?B?Zm1XNG9sSE81TUlXYmdSbWdjYXI0YjJlVzNqL1Y3YmpzWW0vQWlQdkdrZ1M4?=
 =?utf-8?B?QW1IQ1ZSMkFOUGRnSVI5QU9KZUp5TENOeDR5eDh1T1p4WEhISFBsK2xXMmNl?=
 =?utf-8?B?dDNPMTFxYUY2dW5WN1g5RkNjbHhyZG5iVTZrUmw4M1FXMEZRendJenJ4ODRP?=
 =?utf-8?B?MnJlcVJhL2J3enFrdllabmZ1MjlhS2pFTlRlTHUwWFBaT3l5ZVNEU2xBUkp6?=
 =?utf-8?B?M3QrLzRIOERqTXRYRERLQk9YUWZsTXVGU1BrVkMwRVNjY2JXVmVSd09ROXpD?=
 =?utf-8?B?VlhiTlYxc21RdkpmWWhQTlhOcTVOWDd1eTRKbVoyZDVxNHQrSmIyM0J5dVhy?=
 =?utf-8?B?dnZKSTR1R21XSytiMWdyc0Zya28xcTBoZGt2aWhiZTl3cHRGVStKT1ZDUGNR?=
 =?utf-8?B?ODhoRFBBbk1KUWJlbVdZMW5MZ251TjRCVHVVS0kzS1VJRHo2RktkclJMT0tC?=
 =?utf-8?B?MHZpYnJ5aHNLaCtIc3BCU3h1REJSNkNXSU9rbW14ZER6SzJsaGFCYkt4dkZK?=
 =?utf-8?B?Wjhub09mU1NjQ3A3eHg1a1pyRGorTi92NzdvMFBoNFlxZXNVRUtYTWxkcDJl?=
 =?utf-8?B?cmhtSFQ2bGpXZ3dja1QrbVgwM1pQaEdLU2NNN3JqbnBBWnJ0NVZBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e15610-7f25-4d07-c0ce-08da53927dc4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 14:29:46.9379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JWtVQFe8X0eIRkvPvYMFXjM9nnLUn9uLXfD4sX8Xxe7tb3SpRL+TOojLi3ryiv2lNDVtxx6xhAyAc8TuZdfzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1205
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/21/22 07:48, Jean Delvare wrote:

> Yi Zhang, can you please test this patch and confirm that it solves the
> memory leak?
> 
> Terry, please review/comment.
> 
> If my analysis is correct then the sp5100_wdt and thinkpad_acpi drivers
> suffer from a similar leak and need to be fixed the same way.
> 

Hi Jean,

Your analysis is correct. The kfree() call is missing during the release in i2c-piix4 and 
sp5100_tco driver patches. Let me know if there is anything I can do.
