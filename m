Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1993560062
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 14:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbiF2Mrt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 08:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiF2Mro (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 08:47:44 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2096.outbound.protection.outlook.com [40.107.104.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FCF36338;
        Wed, 29 Jun 2022 05:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7x2mMXJ2G8jOGkHCLHTQqRW9VLDuSeqopBgGVB1+qsFfSekdxk17ESgiRqKShGDS5EBWch9irVGpT7HFl1QvBtG35Av1aw4nNIaEkPKwdHTXrn7yww2+g9M0UwT7s8YxrP9PE/YagL5jH0P7u+M1gc76T9PbJtNiy4W6Y4RgDsRDnGucCBATN7mIEIGO6+16sFjk+fwuDWwcVbB88IPtbC2rQg/2FVKkqxTfU2g4ja0wTiOK9vlau23PQjQHIR1ZhAVB9whnt0tibVzhv/9oQoEfcd7ATaRng8K5I6CYoy4RgH1iJilVq3G+hw6nSdp8b34tRfIc4jihxJZdOFvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi+DNAZzU7djLV5Q5py83FGBo0pqKFjTzEBonf9jtbk=;
 b=BFDBHgdBlTzN27mYWVxM71eQ5+UTOrpNkKeZ4lsWLbk9hxOM34VlinXQNkKmOr+ue5ObyJOKblzjBxS5BdGkamVytwzGCPmMYocMserKq8wS7L6RDEWv2OX9Izkeid+Phq2MlvskFKfbE1ruHGvZ3O5ceU8sNVBglkP1WfbC0iOIAkHiyPwH8r/OCqT3nK69TYlkLgVVN4R0HnpfZrfVGYiu/6CB3nTwAPlwCwEsBAOd17/o5hTC7e7ig/STDDy0Auizy3tQmgDxQFzC8sqdhOoHSQ3XCyR7B431aAMvbVzAndjlrMpdCrrlkxj0iOpgh5XPtla+UAlY8kkRIZYVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi+DNAZzU7djLV5Q5py83FGBo0pqKFjTzEBonf9jtbk=;
 b=AMxoKA6uMDA1XxN58EIh3wa+QPIflg8EdtgsPVsBCFUeFakj7v3wZKjbZgWES7m/HUUhCg8yZYy43mTAaygRTq+vftbuEVcWE+ncbtPpxwvxSkPrxJv45NzwD9/KSBmBHS9wYC5+//OjchjCLVg3UYqQYgfOulwy5oXUc+PBm8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by AM0PR07MB4532.eurprd07.prod.outlook.com (2603:10a6:208:6d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 12:47:41 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 12:47:41 +0000
Message-ID: <ad7626bd-bcbb-48fc-5e32-bc95fafcb917@nokia.com>
Date:   Wed, 29 Jun 2022 14:47:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/10] i2c: xiic: Switch to Xiic standard mode for
 i2c-read
Content-Language: en-US
To:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, marex@denx.de, joe@perches.com
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <20210626102806.15402-4-raviteja.narayanam@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0254.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::30) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0246c780-13f9-40ff-004b-08da59cd8dd8
X-MS-TrafficTypeDiagnostic: AM0PR07MB4532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dlkzd087xbVlPiyzVTy2h6l5TkdoDjoB0Xhw/rVWAeJ89xma8pWS+9tJDaejE7hFIupOh9qGP6Gfasu9cR+hRMHC1+ijO4rgP+mcQ9AauK2tH2wa0lWbLK0WlXpvv2mL7jcM3b13nwlC/9h/b5BktEGG3sUGSDsoA02Ba0hPNdIRRUG0RNDEz8YRh0BdtfVdeZ8sLwL+aB1lMoREYfGtz77UJlrmEBTNYNRceiGD5x7Oa48uQPPBoBh7eb97ru0If1xjZL2Y6blfo9cG51uJUlXuXtEXlkH6DcI73l5xhl0hacgeGH51lqqCvBJFdUKeOCQg61+//pHrZuatYf7MPx0uDeh4axvv0OLuuGcQXhjObfd0CmwomCDq3iLdz9U6vT7QT0+6gbc9i+dWbfrO6QCWHVuqEUEjzGCQyOMEwjDfm6oz1wJoBkGJVOEAnzWpjimTIATCUmU7jILVej3L3wNjN0hjzHrafgSAu/RpUO6O/e/sqwJYwFUhpeHIOWbKKSqwxYiDTYXSXA2dwEcwdprZwccSwa7oV3XeudOge3dPO3qevaYWblmwGQapHNK1Vqa7lQbebQPI9fLIDVFGTLXZ9ZBH0AC/aw8LJ/hSms5/E982+cGv3CVqJgnpdcjq9VCZhTQRLPS1VPmphEogoVomKW54DfimakOdSqZO9BERTr3GVwAYRq6l7xRwE0ZgAV4f8g1szZh7LGOqbXL9udBYQE+WTSt3wIdq8JVFt6DEfJb28fDssQbFX9C3jqyuwR/JKazgGYv8iX+8Yh4oSC3uIEsoUF6waQ+AhXd8ENHPARfBexCMHnMvijS82LqOOek5yEbGTrjOzoHEKQ0EZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(83380400001)(86362001)(31696002)(6666004)(2616005)(6486002)(316002)(38100700002)(31686004)(82960400001)(36756003)(66556008)(66476007)(66946007)(4326008)(8676002)(478600001)(41300700001)(186003)(8936002)(5660300002)(6506007)(44832011)(2906002)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlLNWlKMmFWcTRMUnRldEhYb2pPV0w1V3pEUTFvazhiTWlka2JPT3g1TSsw?=
 =?utf-8?B?SzlSUUJBTnRNM3JiODhLZFByVzRqWnpIaWNOSHAxQUJHNk5GS0lVWGtlaFJY?=
 =?utf-8?B?dEFqR1ZGM1I1aVJkNFM3b1hVanprbzU4aXpMd1BTVGllL2x5NFJGUVJOMWxt?=
 =?utf-8?B?U09TNm5hYnI4Y0tuenpQTU5RNkpONTdIRVM3eGFyR1BhZDRJQS9qTjNtTnE1?=
 =?utf-8?B?SzBJV2JUZnRDQklNQWRudEU1WDZZeVBUOElaS1NRajIrQUduMDBKSUhxYUZD?=
 =?utf-8?B?L01POEFKelFWUjhCYi9oQUtpRWx3WlFIMUtRZm1Na2g1bFNEcXBZSDZDNTdv?=
 =?utf-8?B?MGFqV3lNTnRSQzErL3hVam4zMWtwWlFLbEcwMVl3Skw5Qm90Q0lQYzBCeWo0?=
 =?utf-8?B?SHNkbXlSeFB0dEtqUFVlTUQyMWxQZUNIZTMvS2tURGV4cXc4ZlRSQ2lMVS9q?=
 =?utf-8?B?TkZsN0l5STJMeFpBQlRtUHQwRjZkaE1ldDhEcEd6RDBnQ01kN1RtblVzY2M4?=
 =?utf-8?B?S2tJOGxDbGRTRmhLOGVVcWFPOTVZY1k5NlhhTkJZeVU5aXFYV0dSdjh4eWZG?=
 =?utf-8?B?RmRuWXZiOEQzNk5YaVU4cVJLYktGSG1BNGpQSTFNSERnY2pWR1N0M3hraFov?=
 =?utf-8?B?RkkwejJUelFaYU5HVnU4UllqM0p2VnRsMmpCd2lmbDNpRW9lQXphdlc3Q3c3?=
 =?utf-8?B?SGovaEJxWHUxcyszMmgwdy96Q2JZQWk3UVRUSnNhbkFhQ2hXcVhFN20zTitz?=
 =?utf-8?B?SGs0cElrZlE3OG1VbitMNVlScjJlWlBXcXZvY3UrQmxhbVZnQnBrbUx2QzVJ?=
 =?utf-8?B?QUtOd0laU0E3eXFtS1pwYjh5TmFkZW5vMW9QdVp0RFFwNTBYZ1RzblhTdlRq?=
 =?utf-8?B?KzY1MnZWVWtXZmRxM3RaZHR0c0xIV2Q3RHBJSDhYc05LS3BTSUdzV1k4YzM0?=
 =?utf-8?B?YTBtclZVS09xZUNMOWpkMWhPRXIrYWt5alJ4QjlkUHBHaHhzc1diUVdSeURD?=
 =?utf-8?B?Y0dnSEY5OTRPbDFnN0R4RDl1cmRobk1RSXo1YWFyVG0wOVNOQm1iU3lrUGh1?=
 =?utf-8?B?ZUFFZmpRdlh3VmxYdlZ3VHkvTWRyUWpkaXlFbGlPQ2lJM0VKUEF3RDVWZjdq?=
 =?utf-8?B?UUxoY3JFSkZPNEl4Zlo1RER0S0JUWE9salZkWEpyMHBscmNScUZEWFo5cXlq?=
 =?utf-8?B?SUNqRUpHa2RmT3JuVDJKYk44ejlxSG03V1pYeDFWaU94Wk5KM2l5cFV0UGEy?=
 =?utf-8?B?c0tYOU1mcDd4QWFMUWdzbmlHUzAwU01OcGQxN2RXeW53LytxM0cwZ3ZKNkpH?=
 =?utf-8?B?ZUVVdEhKaGM0aThiMWpwTEtJTXRKZEt4UkIvVSt2Mk5EM0k5RHlYUkFUL1A2?=
 =?utf-8?B?Z0MxL1UyOEltRjJwK29rOU5udjY2ZVU0Z3BhSHViemd0c3JNbEVWSGJtckU0?=
 =?utf-8?B?ZkR3YlJqQy9YYjg2UE9GRTNOOFN0OElkVE5nQm5mTmxma1A3NzdlUnZnQ283?=
 =?utf-8?B?R09ucW55bUZoSXYyNHZLWGJ4VUNyeWFVMjQvRE5DWnpqbHFlRFZLSzJ0Y2ho?=
 =?utf-8?B?ZkpWVlVaTWxqZzFaWEJ1NG81MkY4c0d4U2Z0cEVLbktVNHRqbHZ2WTYvbU1L?=
 =?utf-8?B?V2RkNTd3d3p6SkhkNStLMFJlSXJSR0VnVS9hazdlNW9lbUNOVkJEdmtxVVZF?=
 =?utf-8?B?dXVhSTlBRUlTNkZqaWhXZWhTU1lsdDZBMTNoUjEvUC96eVFhRUpWM1FTYXBJ?=
 =?utf-8?B?YjBsbFFEMHJtU0VRNWs3T09jbm5lM3dkM0tNWEhLSjhJOXNjdlJvbXozKzNN?=
 =?utf-8?B?bStoUXhRcE45T3JGL2ZuZ2JVTUt4Q1N4c0t5blFlV2FCWE1zeVpCOU81WDNI?=
 =?utf-8?B?SG0xSHBTSmMyQ1V4QXdqWTBmRXAyWE1iKzFESWtVK1JYdFp3OUVpM05WVUhC?=
 =?utf-8?B?c0l2UUtyK3NHTkFmbndhbjR5d0JKbHpsV3ZZcThVOGpuUmJOYlZyU3d0S1Jt?=
 =?utf-8?B?VmtGaGxuK1V4VzZPcTZzb3p0eE16OE5obkFEemRhUjVGc3A2Y2Y1UzJ6T2RI?=
 =?utf-8?B?MzJsVXJFbVY5VzJWYklBY1ZvNGZzNmdJMHdqdy9pRVVXaUFYNDJUUWYwU2VB?=
 =?utf-8?B?UERBNE4vcHVoSGFoalhNM1lWR2xpSzFGS01DdXNUZVVRa2NFWGZUY1ZiUFNG?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0246c780-13f9-40ff-004b-08da59cd8dd8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 12:47:41.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4kka2TAWxTtsQRj980agKxzkUHXRb0pS8P9Gnylf4hAOsl87xMzn8F3lcSwa05CpkN0VCCh/xFGGG5hFgkBA1UqI9VWaeMym3iRwW6HqqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4532
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W dniu 26.06.2021 o 12:27, Raviteja Narayanam pisze:
> Xilinx I2C IP has two modes of operation, both of which implement
> I2C transactions. The only difference from sw perspective is the
> programming sequence for these modes.
> Dynamic mode  -> Simple to program, less number of steps in sequence.
> Standard mode -> Gives flexibility, more number of steps in sequence.
>
> In dynamic mode, during the i2c-read transactions, if there is a
> delay(> 200us) between the register writes (address & byte count),
> read transaction fails. On a system with load, this scenario is
> occurring frequently.
> To avoid this, switch to standard mode if there is a read request.
>
> Added a quirk to identify the IP version effected by this and follow
> the standard mode.
>
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

[...]

If those two modes only differ in software complexity but we are not
able to support only the simpler one and we have support for the more
complicated (standard mode) anyways, we know that standard mode
can handle or the cases while dynamic mode cannot, we also know that
dynamic mode is broken on some versions of the core, why do we actually
keep support for dynamic mode?

Krzysztof

