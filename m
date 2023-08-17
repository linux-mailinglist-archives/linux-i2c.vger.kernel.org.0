Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E60D77FBED
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 18:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237056AbjHQQWY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 12:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353606AbjHQQVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 12:21:54 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2091.outbound.protection.outlook.com [40.107.249.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29AE358B;
        Thu, 17 Aug 2023 09:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU67TCYMjLBkOESPPU0ks8unJmfhf/T0t9C0Rz1fHT6ytEcvW7ca4dznOG0CVTtI2vKZoCVq3LCLfEqqcYmaXWdFp2ZoFY3xeWLdL/BmSCH0W92NAqmjI36+cQp1pbb/ok1fVrwH5qMzB8Tg+LQPrIW8RjaBHI7aFnAenvu4BjqOZrs9jSVtWZitMlqtTqEfkpBjMWDPGr7btYWNHmvcyjTCTQ68q03EO40rMU6f3BP35/FLykAR1NpcGEd07e09vWyB99xpz5l/p5aNEI/6bafh02UuhL2t3DHH+S743TeqN92PUnoXwK+SRwBquKuCx1fPCpU15lJbRxvIDo1Vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wvJZCExNIWp+6q6CbHUU9+jLWjRGewGJUnnQsAiI4Y=;
 b=lVmDEziFP/dXsLgqT2x7F92NpRqyYK5JJPOx5lASC1W/5Hi1hUMEc+s7ROkgJq3VqIHuvCIUAggDivr8Xxj513YturGU+YBLz7GVeWDX6FH/T+93zRWINZ98GyddIRQ4vv4G+n7LxM/h2A1/YU0uhG1p542d8WbMmjomoOVk58HLzYz1nev9m8KZjdr0bWm2IHt3HBHs+JHo8M5yO6NPJxHiRftElbnjNITos5Hdd6cyXa8ELXAFaaJYZMNUCoYBbI+MUT346FFPib00GCy7Nba8AgvPmEZm1/iotHSXWgEYSBELKz8mO+WZnXYxxpt4DYQA7faT2hkb0ouEAUea5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wvJZCExNIWp+6q6CbHUU9+jLWjRGewGJUnnQsAiI4Y=;
 b=h//lX0zQlpqoYGSVcGjF9fnE7NRB9wOPM+IGSv6D8rNLC1xhLaP777F8Z+7J+Xis4iQ6U3/OwqvsThw0tOreK9NCJpzqHNiM1/TX+v+QSQ0RECXctvnVLx/Bbn2xG3tpF5zUxIZ1XUX078ZtLToFMwOkDH9vFfSHuuckjEzD6nU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7318.eurprd02.prod.outlook.com (2603:10a6:20b:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14; Thu, 17 Aug
 2023 16:21:49 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6699.013; Thu, 17 Aug 2023
 16:21:49 +0000
Message-ID: <b40e0dce-4e7b-8599-734f-d6e70fdfbb7a@axentia.se>
Date:   Thu, 17 Aug 2023 18:21:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 0/4] Add support for Maxim MAX735x/MAX736x variants
Content-Language: sv-SE
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Cc:     naresh.solanki@9elements.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00000105.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:1c) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 44cd308e-fe14-461a-b431-08db9f3e0ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnnYb70GFcHiEkutFbsdnzhxFLIShXD4f3o3nZ+0Q2qc0SyEPJfnpuf1JvpWsv8lILsjlYy/3cRVOVsdbyGPZnisczwcJwNjnp7tu9+OrSI+rxZo4WifOjQGh9Zippam++YNHOLQF7GItvRFIGLELoFQkrBtOGCOBcEoVOjLYOwQ+cPHiDQAPDRIIa+364Ej6VEXa/dMW8RdhOi/wKWUSew+m80mDJIP8BN60/Vd69WELbrqvb3MiPL1yxKgOevXVlh9jMEOgq6+iMJcj0jyszLgDDpAfyr0b/QbBHAzkQlDenVPEa8n35/6Xg+tL9ogYcfmg6h00AusAT3N16bURaAOcGlT1QO7vST8Wz6QMttIKoo6hnJvfxsXt6mXfj6tpzac8o7lBI2pz90mzuuRAD0bW7UloYt1hG1TKcvBp1kyzFm35QyPVTPBEJp/+tu1f3xTIuekg5v0PUWzOHOW6ipR7zPkQiKLfNV+y066GyzlKLTCgxvq6kLE1IDu+QTslhdXXs5rqbRcJY0h6gZa+umJOpJeJ16/dyrhFul4I2/5g8rn12r/kVtpjRyN7LsUREAPDWqrn4lGMwEhoSn+VZ5ciTAeSqdWubj9H79KXuQ7gOKTB1zPwAf0A/yN2Y57aORzqjaXtGKXpq+vlIPD7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39840400004)(366004)(346002)(451199024)(186009)(1800799009)(2906002)(66946007)(110136005)(66556008)(66476007)(5660300002)(8936002)(558084003)(478600001)(6506007)(6486002)(4326008)(316002)(36756003)(8676002)(2616005)(38100700002)(26005)(6512007)(31696002)(31686004)(6666004)(86362001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy9kQys1WnBHRlcwb3hET0Vpbkh6dTZkd3B0RjlmZGlKeUQreTF1ZHV0Q2Js?=
 =?utf-8?B?R0E5bzFLWkZkam9FNzJnNDM0Qmo4bk1oZnRqSndJODFUQkZyMEZ1ZVZnK3FN?=
 =?utf-8?B?anFaRmVuazRaRWR2SmhBMy9od1E2QWJsNFdWZlVOUldrTGNaUmxmMVU2R3NX?=
 =?utf-8?B?a3hyNUpiSmpYeGQ0WGYrNWl4TmRDdlp4Z3pPSGN4NWhST3JxenFiUUVCZ0ha?=
 =?utf-8?B?TVVncWM4aGg1QjRLUkZtMnVjS0d3K1JrTExxVVF2dUgzSFVCVnhqcHZHM2JR?=
 =?utf-8?B?bVlhQWtsUGRvL0RMeWFxaFY2ZWhUNlNNY0UyekQwSWxScUNYUVpHYjdtK0VO?=
 =?utf-8?B?SVZOYlhNYWVIWWJybTB6ZHQ5OXVUVGdpbmUwRU16clhzTituZGg2VWg3ZjRt?=
 =?utf-8?B?Ry8wSDRNRmRpMDNoR0diTHZlb210d1lnVlY0YXREMXNOSTdlbkJzaGE0eWY4?=
 =?utf-8?B?SUZoQTUweGhNZFpTRk9KTmRjcENiMDBqamlHUEZNdmVDUDVHbXlaTWFqOXRs?=
 =?utf-8?B?aFRiZUFreFdOY2l6U2FyUzFya2NEWXY3MnZnWjdVaEJpN1FYZGZreGhxempG?=
 =?utf-8?B?UFl5RHhyUk5GTU44Sml1RE9JcFZEVDlDM3I5RzlVbERDMVpzNm1INzFaT2Vm?=
 =?utf-8?B?WXB2TGlvOHp4U3VyRGVWRjI3T2xHdng3TGVsZ0kxRGsvc1ZtU2pDTzQ3TWpU?=
 =?utf-8?B?MHNaTmwxREEyMk1PbUVwZVBhM0lkd0pBelhlaWRKNkdQalpFY0dUc2szbEI3?=
 =?utf-8?B?Q1Y0L2lZcHo1eGlidUpxc2dCejFJUy9OUEpjblMyWVhrSDdaQ2NjQVhYMnVD?=
 =?utf-8?B?UmZ5dkJOMnhDNWFoc2IrcnhWbWt6aUVhejdzUklTWFhMOUgrTTJKMzhscnkw?=
 =?utf-8?B?ay9BUzlyRm5DTndUMEhsNkJUU3V6UWc5VlYwVldIKzN1OTFNZVQ3UUptY21i?=
 =?utf-8?B?RE5GTUlWbFRNRi9oS2VGUFZncUhOdWdFUlhabnJyenh1ZFdkZC9ib1pDWStm?=
 =?utf-8?B?aFNna2RFbGhnN1NMM0NQQStTRUdtZ1RCWGVrQlU4YmQ3QzRIOElUak1raDlO?=
 =?utf-8?B?eUdmNWZhNXNpMWZ4cXZIaTRpSDUvQnBiaUcvS3psSWVXSGFGNldjZjVZaVZw?=
 =?utf-8?B?d3BLRFhIQWVJUU9yc0ZHaVJUZlgwZXNwQllqTDllbmdZd2NYVC9Wc1d0YUxk?=
 =?utf-8?B?cHptUldwVVh2NXRnNjIxcENQZStPQlJ1R1ZwL0FIc1JhZHo2MEg2MG9vMHk2?=
 =?utf-8?B?MlhNczBTVDV5NzNzMDlDMW9qcGMyV1ZZZzFsZ3Jqbk5xRWNBa3ptemYxc3Uw?=
 =?utf-8?B?emZtUGt1S0ZGeXRrc0RtQlFheU5Nci9BWDVkYjZqT29KNXQzd3hNNDQ5QmVW?=
 =?utf-8?B?OWZESnpZQmpwbStXbEowaTBic1lNcUpGY1RVc29oZ0RCbmxBbGt6d0N0UFpz?=
 =?utf-8?B?VzdaRHRHZ1lER1B0KzBrODRnQ2N6LzBTaDJrQWVNcE0zZWJrYUtaSTErR3Qw?=
 =?utf-8?B?U3RhdHl5VlNRNXQxUERYQkNGM1RnSnhOM2ZqcXExOW9UcnRnc1JrdnIvUkp3?=
 =?utf-8?B?THgzU3hEUk12UXJrUm53a1VLdzZKd09rRGFnVDdBQ3JBNGJaakdqTGk4NDlo?=
 =?utf-8?B?NWhiVktRWEVRU0RPbURDeWw2RlFyRVBDN3dIWjBOQk5YV1Q5ZjE2QXF4VFlm?=
 =?utf-8?B?UUNYRTB3TGNLNWovMUxlYmxWaWY0MlU1L2RMNHpCR1FQV1c5WUFzY2drVHp2?=
 =?utf-8?B?VTFXM3FRR1NaNDdJemxIVkVsb2dWL1pCN2JHT2l5amhab0NwWEkyS0pVdUox?=
 =?utf-8?B?Yjl0bUF0c2lYbUtqcFZpak1SVTJxUzBPY3RjMzJNVGhIVy8wbzRzaDZsMnd5?=
 =?utf-8?B?Ri85S2NJYVpLcFYyajA2SG9TRUNHWFdSc0gxYVI2R3c1NWdCZlNQU1dCWHU1?=
 =?utf-8?B?TFNudUJuVWpNcHowejdXcG9ZNkh6M1hRcmVPVnJjdUFZVi9vK3gweDV6bVlO?=
 =?utf-8?B?VnNNUjdBOEZyNXpELzI5Zzd3T0luM3J2L1JlVU5oS0kwN3IzOThYTkUwTmlj?=
 =?utf-8?B?SGZpRFV6dU5XN3FoNlFyS0FrNDQxNDUwREZPSlMrcTgyYy9MYlRhenpqRHFH?=
 =?utf-8?Q?IuUumYdZxphhR8trCBzZEt86W?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 44cd308e-fe14-461a-b431-08db9f3e0ebe
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 16:21:49.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noUPyx8dRHD7OlhbqOZdxDNTT1VZvmswVwPOjGrlRdJVObGdAPTb3Efmk3YKq9mH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7318
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-08-17 at 09:10, Patrick Rudolph wrote:
> v15:
> - Clarified VDD usage on PCA9846 which has two VDD pins 
> 
> v14:
> - Added comment for interrupt support
> 

*snip*

This has gone on for far too long and the series feels more than ready...
Thanks for your persistence!

Cheers,
Peter
