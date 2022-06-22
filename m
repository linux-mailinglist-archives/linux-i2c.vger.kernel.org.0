Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACA0554B89
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 15:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241717AbiFVNmD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 09:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235799AbiFVNmC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 09:42:02 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8293F21816
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jun 2022 06:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqQ6f9WgXRxWgnExb2V/NLGTUM5PoevlrgUB5vhaC5xlIT3pKvNZzkg+ypObDu2d5Ju33zohyH0qLbnvYuUeHO4KE4aclq7r2rMJpEj8Ll2FONGehyqdk3b54VEckmTEuSEQP3TVdjCv9gMs6ZiR5cOFkBXqmje6F0896qdG//BfNU8LA64kkn1Jyo065dHx2gftsa3TNk6E+noiDV1xmSbuOzB/Dudc+6TVjRlpwT9PxXzxbizjRheCeKCV03upgcoG+R9Fpz5B4yaxxwtcDYrMmbnZHaKphx7d/bb0NRc/LniaJkuHcIMI8XnYj5YPpuvxoklFgJL41sZktrdSUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTXEf12VB+m1pauUc45I63NUXM+uzhRWHp+qKaqN/dc=;
 b=Zq3AN+4XCkFm28oQuu8JmusaYk0aeHWKOcjky4QKZl1dgXuGseG5mACuBM2msrcC6tVcoPmZsDUpUr1SCg0IlHcPz2APG9H1DPe8ciQ5Nl73D8ZQk5TVxShtxH3L61caaB5zqE6hsbgp7dEv8jKmeDESloNgyhBaz1dH4j+fDlKLYpq8a+KRcoptzPtN5Xr+l0FDUwSEQ3UqK5cu3m51ZaHjY+FDKH8XaNOcDs6Z8RUnlVA5nK4weDPyq4NfU8DDd71u/DraDQXnvyrB1hL6m6ke27kWBDE1wkMGxtu+MdQSG5zguhyKHzyxUWfuwsTW0Ck/JflnvSydZ7KavARIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTXEf12VB+m1pauUc45I63NUXM+uzhRWHp+qKaqN/dc=;
 b=Hq/K+ATyTKwX9yQHNlIEmhUGj87KfgEOKKXqK9rh2yqTcyecmTscAbcPd43cwphSxGCfbCdsmuTLfz4fXnmbZPt45flNPx6tIAoTVEOqn4CjRPZRTfHHJA2f4UWCLAMPkQAHARmh8SR+/n2t4qCiANVNB2B6BYiqeg20ceHTik0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 BN7PR12MB2722.namprd12.prod.outlook.com (2603:10b6:408:2e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Wed, 22 Jun 2022 13:41:39 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::ed55:e138:4e33:611e]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::ed55:e138:4e33:611e%6]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 13:41:39 +0000
Message-ID: <7c892381-153e-3dac-1b0c-fecbc09acc64@amd.com>
Date:   Wed, 22 Jun 2022 08:41:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [bug report] kmemleak from driver i2c_piix4
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Yi Zhang <yi.zhang@redhat.com>, linux-i2c@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
 <20220617093818.37a721a3@endymion.delvare>
 <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
 <20220621144822.1d9228de@endymion.delvare>
 <0ce578ba-cdc7-6084-6119-10170d5e80a1@amd.com>
 <20220622083921.69c9f359@endymion.delvare>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20220622083921.69c9f359@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:610:4e::20) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67e99eff-6e9f-4630-a02b-08da5454ef20
X-MS-TrafficTypeDiagnostic: BN7PR12MB2722:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB2722303C38E53B531B63B87383B29@BN7PR12MB2722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7NzRHCcchnhVLWdQ4xRzU6ZxmdRnQANFDWk6QXlrr86ZxaUqqmX4/amj3+SRh7F85ALwL0s9EsItoB3URRWlbJ9eii4Za93+dd8tR/Tn+WhU5kBJgnAt0uHAzWbojdIxjH1nIQQcNfqgB9rLdrtPwaNGuZZVpno2JlX3kj3RMkShUa4z0X2fUvQFVzIwQw0b97SlPwsSOFZ/LR8Pq3RxKO/Zfwb2P2RWtREyqTHyO0ONeGzMLEFvF3uMEuYYD/AWPSRj4H8HMIaDyibCN3xGplhh291ofzGjtnlzMxYi0uFettKGSBOo4UqEDw/Heiq44jERgxrLQM3SK+EkmtGDRJ3faLqqIwjSKqWDEbwLcOXWpg1WEYuCgoOkgWuhzNsPZvn581BL+En1hbuUW6X4GAr6e3sEcModArboK0XmQIZO+QvZotFdDFmmIcRoPZ9ZDozJM4qhz3MB5Z6KSphJU9Bvfxj3R4GocFiUGWLPbYvMAHLumav8fdxNCEukqrgiH4qmcRXpKpkfZSTChn6I/40nkE25uZT8x1LaXM+FsoNjWda5Dd8ajiHUTflOprUgTaN7Y8pU1NPunI+VtVu6dRwDlFQajld52PhzJpa3WKqlgewtQb8S1gbPQN6w0aZpqAWtwkQAc11+G424dwkC18Ywyrk7KjxFF2LumE5wCeixtr3HfrHUImNDlTC2RweyITOoLvWQFeypPnkqT0OCgELHZIhx3WnBuYI1Zi/Xud5g6E6Pr2EujVNSmstREtDhU7QUXgjaG12+Kpvtc5zLTy0aI0aOnLoZ4fi+i4UHGOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(4744005)(478600001)(6486002)(8936002)(5660300002)(83380400001)(186003)(41300700001)(2616005)(8676002)(6512007)(2906002)(316002)(31696002)(26005)(53546011)(6506007)(86362001)(6916009)(4326008)(54906003)(38100700002)(31686004)(66556008)(66476007)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZNWG1XbFBYUWtkeCtYb2FYdXlTU2d0WHZDc2R0ZERNQitHWDNNNTRiV25h?=
 =?utf-8?B?eENVbGNBSlVnM0hRVnhTSkpYVmV4MTlvZExRU2dQVWFPcTZvNStBdXliNWpy?=
 =?utf-8?B?MUFUVTJCMlRsMmF4cVduM1BQV2drdjdJQ0ozaXRuVlVzVnl5b25xdDJmN1NF?=
 =?utf-8?B?eFNMY2VyL1dpQklhZndTU0s3NzBKczdvejliYTAvUGVKajhaTEsxL2NwaWxh?=
 =?utf-8?B?cDRIWThYVHpIaXFzNnZlY0xCOGVBcE9BQ2doUm1VNng0VFhZdXZFOWpMZ3F1?=
 =?utf-8?B?amtYaHZMTGJMNkV4M1BrMUtlMm95VlVMbGJ2a1BXKy9RSEgzVVJrUHBXbndl?=
 =?utf-8?B?WmNWUDhFUlBhTWxqbTdTRUtxWlpyUjBLR0xONTF0RjNDVzBQTGx1YjJMdUFF?=
 =?utf-8?B?cFh3RWRoRldFdkpnZ1RmM3J1VnVyTHFCcDF5NXQrUm5TQTF4b1YySVUxV3Iw?=
 =?utf-8?B?MDNzRG9DR3dtdTRTb0szSU04aTZFbWNOWk9TelJUL2Jaa2xtanEvbXRhbWF2?=
 =?utf-8?B?Q1JIVEhJczd2NC9TUzM0R3dPcGc4akZ4LzZUaTZmRXJPRHp2ZlkxYmRHaXJi?=
 =?utf-8?B?VFQzbUJRTTlXbzR2bWFudDhERVlzekhxaHltTy90MFFubnJOV29UWDBVUG1y?=
 =?utf-8?B?M25FRGFGdnJmNkdCS1FFSnNsd25TSE1XUEpOUlhoT0huakxROVl1VGxzaFRw?=
 =?utf-8?B?WGc0WUFMclJEdTZmbCtibGRjZ0V4VXFidE5xNjBYODVDQnVKSUh2M0VHZXZh?=
 =?utf-8?B?Zy8wd1pyV2dzRE5CL3ZjNEtsdUlmYUIrZFdYVERGLy9GSkJhQjN3MjA1RnI5?=
 =?utf-8?B?L2dUTFovN0d0T3RWa0x1V1ZYdkdKbE12YkRSSXRlZ0VyYURZMFk3aysxTUhC?=
 =?utf-8?B?NUwvdU00N3V5cnNGYkdibE5mTjAyMW1VYndreStYR1lDcStRSkJobEJLdG5Z?=
 =?utf-8?B?LzlyOW41TzY2RGYzc2ZLaUtCWUQrcG9aamdtU3hSdkUyUkRVa1ZrcmQ1UXVv?=
 =?utf-8?B?RHFMSUphVC9qZldEUUU2L2tJUkxOVFVKaVRYWS9aa0g3RWJsSlQvaEtvVXJh?=
 =?utf-8?B?UmdOa29BR2tOTi8zMllCd1gvemNHblJ5b3NmT29PRlpiZXI0SFlPQUx6bnRI?=
 =?utf-8?B?RkdjdjN3N2RRenZWVkZhR2dWWStXQTUxOG9wNmVZYVNHTGJyb2Rnek11b3Nv?=
 =?utf-8?B?bFZUTTdxaTE5SzdtTnJlYTRhSU9hcXk4N21EbUt5NUpscEcwdWcwbFRhNmln?=
 =?utf-8?B?NndHOFNibVBQckducHZ3cVg4Wk00c0pkSWltRGM5aCtmTXlqLzV3OVNFR201?=
 =?utf-8?B?SW1Za2hOd2xiaG1WanlkMHNFYjloa3dZWTkzNmhxRCtocnFlZVI0TEFsajUw?=
 =?utf-8?B?dzhoK2hEL1o2RGUxWndyT21FM1NIbUt4TzJkYVBncm9Na1ZKUFdnejlYdDdt?=
 =?utf-8?B?aWZKWTk3NWhDR1M5Qk5MeFp0U3RUS0ZMUVhibWJTT1VjQ3RhRTJBdjFCa2hU?=
 =?utf-8?B?RXNXcFFUTmNYK0VnczBzVHlMd0hmQkpyU3R3QjBTL3oxa1BZei9XZFRhN1BU?=
 =?utf-8?B?V2djOUIxd0RWRnRXQ0hOcWZ1NnVKN2JaUlVtVkNTL3pONVo2ZThxbjhwTG1q?=
 =?utf-8?B?OEFEMkN6QkVtK0ZRRWwxdEM1TTFDM3hCWTJ2aTVtTTNWQnJubWZadGJIWks3?=
 =?utf-8?B?QmNvdml5SXVUOUZZZ0FWUHhjMUxpYkloQ1BxeFZCZkRMU2JlOHZYK2ZINXFw?=
 =?utf-8?B?c3ZJZUpodWZsazl0QTVMUmRSOVJQYldGMzFRQU9mMHR5bmI1d3IzVHpiZ2R0?=
 =?utf-8?B?eXJKQmJhVDBxZDlIOElSQ1RjWEEvdnMwZVplNVIxNEo3Q2RBN3NseUZPalI0?=
 =?utf-8?B?aGZpVDNQc2tiL0ZRNm11WFVQek43MDFiOU5yVTBsUmtoSjhEY0g2SDFLMWJM?=
 =?utf-8?B?N0lrUmc1Z0QwYjdjaWlscnlWMkN4OTVaVTl6OG13dmpNNy9GN1pVaXN5SUR2?=
 =?utf-8?B?NFRDa2NjdDROd1pBMUtJR0UvMWpLMnpKUEpTTzJSVE9HeFJ3ZDU0NjJ1MG9w?=
 =?utf-8?B?eGx4Q0ZNa1FpY2tac096T3lST1NaVzlsS2ROL2o4TUs4NUp2ekhCYTllcGc0?=
 =?utf-8?B?WXRHVGd3R3NoN2poMHcrbHZLb2NwdjVrR29EemNLMytZMER3OFpPQlpFcXJV?=
 =?utf-8?B?S3E2ZHhMaVdseWpVY2NId0hUbDVwVmd6NXd2eWF4VFBFNUhENDU5MzNjN2lT?=
 =?utf-8?B?UFcvdTNCL1JtTld4bElUYUx3Tjg1WlI1NDJ5cFJrajUyRXFpT0VPQXcxbFFI?=
 =?utf-8?B?UkwwWGVpT29ob3BhdGNPK2d0b3ZGZHFzUU1iMWdrcXBGREl1L2pHdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e99eff-6e9f-4630-a02b-08da5454ef20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 13:41:39.3331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUxXoaILv3SzdFnrtrGYpj8gSZSsYZ2ZRmczj+hb4eTUPL08rLyzUfTt42qrMCwW6TeVkXw0l2kxd8k7AqQC0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2722
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

Yes, I'll respond with a tested-by and reviewed-by later this morning.

Regards,
Terry

On 6/22/22 01:39, Jean Delvare wrote:
> Hi Terry,
> 
> On Tue, 21 Jun 2022 09:29:44 -0500, Terry Bowman wrote:
>> On 6/21/22 07:48, Jean Delvare wrote:
>>
>>> Yi Zhang, can you please test this patch and confirm that it solves the
>>> memory leak?
>>>
>>> Terry, please review/comment.
>>>
>>> If my analysis is correct then the sp5100_wdt and thinkpad_acpi drivers
>>> suffer from a similar leak and need to be fixed the same way.
>>
>> Your analysis is correct. The kfree() call is missing during the release in i2c-piix4 and 
>> sp5100_tco driver patches. Let me know if there is anything I can do.
> 
> I've submitted patches for the 3 drivers. They are pretty
> straightforward, but anything you'd be able to review or test would be
> welcome.
> 
> Thanks,
