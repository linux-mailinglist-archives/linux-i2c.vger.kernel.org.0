Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC686FBF0F
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 08:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234572AbjEIGLr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 02:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEIGLq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 02:11:46 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2106.outbound.protection.outlook.com [40.107.21.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F0193FB
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 23:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJFNlPrhMngRAKxyI+pSik074KYm2fnBeevC0nh/ku+gwJmmMhU/t8jogge3STinatb1i+OcZtAj4hiHUVRC1tlTiwXnYq2Chw/F4k9uWP5X+jIxtCozbU7P6kqJZZ976Es4j/wlvAGiea/8ZzAJMA6eZXvw2Kw1OPwRhM155qYNRcFlRHKXawpHVv7QOte3IL74VZeCseWQUUZogBQsHtEx/Yzoq8bj4Ossi4h7r0NHGzheQc65H1omeSsxAQaafGuYuuDrha57g/3hPZ2AcXOtP6G+NPmfxSTXeghfEsjoFsgeC30kWi/QlJqC2O7hVULDtA4gVfgWv0eMJ+hvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=Mw9y3IhYWTqUPGEKyyrTB2V/ZGAUYhD+DsHIWlN1zC/WuL8W18N2+J399HldcEAiSOJJUTZrsTjEUbXJm0+NO9Hm5lkY5rcofbKYmQcDjjJ8hJpA3vmq2sUuipSGECjgc1/YoVL4WNSQr1DQn+cMueSmdJxIp9RSVw5NIsp8d+sVTG5y+GCYFUpqn08wopTMrU5OWFUnHA9d4aa56891LbDBuq7+bpY8dyNfYPfKYI1OOSr5CmPz22K2aWD5uMXvl3Z2/rUYnXtYW2WQMegjtX0AgOJL8dftHecxlqRYgcVDV7MOBbZ7ZbC8oYQkEIVHbmtWdkPoxqGT5EV7hpgCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqknQwbXS4OBOv/HtNaYZe5AWgMLWsNlJKiWkjJE770=;
 b=N/ts5kZ7oEPcaANz+8Cefro1J1n6S0jGqpm9N9Dlaog0ATCs+NBTURGSsyqwogb/VkWmMdfCO5gfprwrsc1w5cLS6t6dtZWjsNxLa+V3tFakyqi+P+s2m44REb90HgWujI06qbfkrkGfSPG+r7sY13ymIoNiaUvE4FPDPIa15Z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS4PR02MB7855.eurprd02.prod.outlook.com (2603:10a6:20b:4c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:11:42 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:11:42 +0000
Message-ID: <077caa6a-ef2b-c3f7-0841-5f29a76546af@axentia.se>
Date:   Tue, 9 May 2023 08:11:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 89/89] i2c: mux: reg: Convert to platform remove callback
 returning void
Content-Language: sv-SE
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-90-u.kleine-koenig@pengutronix.de>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230508205306.1474415-90-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GVX0EPF000013E5.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::25) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS4PR02MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 902508c0-d7ed-4762-e0d7-08db50544214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IKYhUTnZnlbMlYVkLtTwKWCWe1GqeCohOlvZtfGFFI9CElxoRMBvowCY62/vKM+nIhKed0HmN7PlmJN5ZsKL+svs4GLHB+9mvy7ItIH0wUFwPAP4S2djLGsS0cW1ZePp53+QD9S1YX1bgwGNU0mgBYMDCCStSJoWiR/cu59DHOhMKXJonfoJ2oourQZXcLMpP2tZL3rTQ/04np5/5hfbUWzytebwIxGRvBl6aJKS4jKQ0aPsMoRk5CyROY1AP3IeUGoeGG/3StPUC5OHCnsLeyGf6JEQfChX00sQfQTIAw5Qjtz5pI+kJS96NpQ1KwAk9KEwZCjzNU6pUuA3GQQJoBq7RLya27+uSVJhzswMk19sDe67lK3QtaGUknNqDWdfQxndSGJEFcHEeGh0yEfo6vxj4FZdEecJIalkV92/ZGslDqFP3jZ/0RNCc3uZy7O/RPaFyZYsFL/5AYqh44nZ+TiLuS/WlmbWQoTfwoioMPZHup5shU9crNznDwU1PrwKfPL5w+UrId6ZjX6VA8vBwN2uErY6np5sX2QOFkcUJW0dycDJyy0IiF07E47oWIhvphlHeJCOAJL7vglFEK8IyJX6TeUWGiIA+x3bsjBLXhNINrUN6Hd8a9dRkwi79FP+exuJstI8iNWjiwhM4u6sqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(39840400004)(396003)(451199021)(2616005)(2906002)(186003)(4744005)(31686004)(86362001)(4326008)(41300700001)(36756003)(66556008)(66476007)(66946007)(6512007)(6506007)(31696002)(26005)(5660300002)(6486002)(38100700002)(110136005)(316002)(8936002)(8676002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9uQ1o0OXMwOFhpU0Nyczc4UW1raE9FdVhvY1N3cmc4cVo2bE1IS1dpZXlr?=
 =?utf-8?B?NjQ1cE0zQTVrUm1rWEl0MEIwOWRUZFEzL0ppK1BLdEVsNU5kVUhHRENqZlM3?=
 =?utf-8?B?KzV3OVdjckVOU3NmY2xzdkcxZEQ5Y2Z1RWQrMGtDTmRZM2FjQ0JMTnlRZ1g3?=
 =?utf-8?B?eEtTcEcrekN2WHlFSTYwUHc5cldmd3dER2pZcHUyR29KYkpYYmlnbjQ0aklQ?=
 =?utf-8?B?dVg5MnJ4OUNQcitiNHFkQml4VGFSVEswTEtEVXlpQXdHVVd6ZTRRU1hXY09C?=
 =?utf-8?B?QktxYjdMSFdaa05sUTdReGp4UWRQMVo4a2hvQmRPcmU5Q09xeTJIRlVpTlUw?=
 =?utf-8?B?M3VSTGV1eGY0VklvbGNheTVPbGJXbTNVVm9qQUY4M3lWQ0NwMXBNK3dEOW1F?=
 =?utf-8?B?K3BnbE5INWF1Zjh6eFVaSDUyTm92SVBydS91cW83d2FOQUVsZXcvQlU0OWZB?=
 =?utf-8?B?dGJldzFueXU5QlRXMmJPdmxEd0gzamZSeFIzWXhzUmpKTFdsM0FoQkZKcXlR?=
 =?utf-8?B?K1l4SFBsbVhla3RzNXVLaWNFd0ZpMGpyVmpRR2lzdnlVN1pSWldLS2lDdkRr?=
 =?utf-8?B?ZjBMWjFuUzU0ZGRNL1d3V3FBWDdmL094VjVvcUI0dXlJdGJEeXJwZkh4ZXV5?=
 =?utf-8?B?bXpTOUxaVHNqT1pyL2RIbXIxUFc4YkpicWZld3pwRHE5eWJZckJORGRPTndz?=
 =?utf-8?B?V3JpRHdNSktVT0xkSEI1MHludFZZcFVoL0IzR1pLblNqaHNzTmUyUnhYVjZC?=
 =?utf-8?B?ZTJCVHhEZGdneG9aUVJ6Z0JILytoRE41VmI0bFdPQlY0NG42cHBtMU5ScWN5?=
 =?utf-8?B?b2hWZGtCb0lveUd2ckI0M0pZNTFGR2J4WDVmMFFnZmt4NHZub3Q4c3JnaHVm?=
 =?utf-8?B?VktVbXpTT2pBVDgrcWxrTWtiTFdYTnQwSWdGVEc4ODN1N083ek1HSFJYMGNp?=
 =?utf-8?B?QnRCRWdpbTNFenZjSnhFdDBsTkoxMkpPaWRWUnl1SHJqOUE1NGUydGxkbDBB?=
 =?utf-8?B?U0JxVXBlLzJkYTVod0RyeFE0ajE2UFRrNXdOTlJXeW84TzJCK3NCV01NYkZT?=
 =?utf-8?B?WXpzSmYwd21lU0lVRVN6cTZqU1IzVTdUamhGdThXN3V6RkNhR3dKY255R0Rv?=
 =?utf-8?B?T2tXb24wV1RWRFBrdWxtSUdMaUdDbVdkd2I1c21JN0tSMGwxaGZ6N3R5ZDE5?=
 =?utf-8?B?c3BKNEhaNk5Zc0IxQi84QXhzNGliVHlZNjFIZVFuektpZEcxcTBzQVlLVTlx?=
 =?utf-8?B?WFFSOStvY2d4Rk5hVWpzdUtqMnJMY3M2anhMclpjbk5ldlhDQWtwQkl1Umgx?=
 =?utf-8?B?OUhHZ3hvcTArM3M4bDlDeWFmZHNXSzA3VXlGUlZUNWp3OVR6ZGVHWVF2MlFq?=
 =?utf-8?B?WDNEMXNpMUp0VGtQSHNrMEVBWDg5Z2F2V1Z1dFB1ZlpnaVd4d2YwS0I0YXl6?=
 =?utf-8?B?V1FIMmxlZEhodEhEaWNEaktobE1BaHpoR09PekFDWGdIUytaaUxRY3Z3akw4?=
 =?utf-8?B?eGxEM2twck5lYkx4bXRyMEdISjh5Ym44NlIxV04rNnhlV0FkcXhLdGowYTBt?=
 =?utf-8?B?V1hKMGFZR0lmQWJ6bHZPeVhEbWNUUCs2cW5VOTJ1STBsNDJ5UjJ3WG84SmhV?=
 =?utf-8?B?Umh6UFNsM3U0M2lxOFpCRHgxK29LSkxVT2xWZ0VqQ3hBcnMvQkxJaG1yOFNX?=
 =?utf-8?B?aTF2K0Nad3kzeEIzcy9XcHpScng5TW14RHJmTWJZUkovNjJ6RlJMQ1NzcUp5?=
 =?utf-8?B?K0EwQzhDNFhOUFRsT0VXRndFd1FnZ2RaaWREMTRIV2ROQzFBTFJ0ZzhkZm40?=
 =?utf-8?B?Vk1nSm9ueEVITWFBL285eWFxZzZwdVFwRlY0bnZDMy90c3BKQkNIUUVaZm9N?=
 =?utf-8?B?OW00UWFxV3MrRk5yc21DRFducVo1N3JEcWZibkdEWkxHbVdyYXNRcmFHVjBR?=
 =?utf-8?B?OUs2eEV5WDJoOGJtekt4RDdGR0d3bDVPVXdlZHAzSHU3WHkrcTdacmxwM1c3?=
 =?utf-8?B?NGdQZ2lTQmpNRXMzdWdLamg4Qm9xVEh4N1h6TmRNWTU2OTBCanFTY1VNVmZY?=
 =?utf-8?B?eVpxZk1LenY4bmlKR0pxeFZEdzBYOCtaZS9uOGVXdEpGY0xGS21KU1ZSVmcy?=
 =?utf-8?Q?fURQ8ftFSuTbb0Q72YRLw92Mx?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 902508c0-d7ed-4762-e0d7-08db50544214
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:11:42.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqoLZEkuy5vqAgjmqjAAxThs0cpbxQS6/cpCrMFH6ApPDnTPdddjbFh5W6NIcrpd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB7855
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

2023-05-08 at 22:53, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

