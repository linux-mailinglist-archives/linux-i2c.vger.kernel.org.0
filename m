Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C689655FF38
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 14:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiF2MIJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 08:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiF2MII (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 08:08:08 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60122.outbound.protection.outlook.com [40.107.6.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A40EC47;
        Wed, 29 Jun 2022 05:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifWn/YazSc1d9tHn9eWj5uoscRAHRSxQpfr/Q8LGDgD0NceE8VqE/Lym/+I5/hbWqJ4euuqH6wWjZqRgkpmtiwEsHIkV9rkkPKeeeWAHGY1XTUVhYhRIfM8LqeqGpaj0tE17jHTVfjV6vjdxtYvuGV0FzxO6iTRn/+VWMT9GyFQp/mvDyaHwmZ/WpQLYl5HzmSrOBpcm1QCDcL05UHHlNXI/R8Sdf2bdoew9Rrm04xhEOE6PG9DTUFgkLLbcpVFGSVu73AsVclW22IAJWeuc/NZXGbB6SLsxUV5Q8K1bz0wRmUIq4t0bZYG3lQh2v+jt7pdx4dMnumMJV1Z5j6vD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTviOZgaJwdx+fR8uDMSgbjYqB3wGZaJg4EUbsVWbHw=;
 b=c6QarNmZGhHfJXc5q+kDavS/T8eKiwLa4ebVyRDCZLfoKiHIpidq3recAoSv7aqxiZFhrA+tN4Cnym3/M86esWGcz4kbZ/J9jAN8M1WsTl16i3bJiXIjp65WbnB9sXaGIH/Sy3Yllv7mDvnvKe3j7iPDBNF6FkM31tNPpIM5Zf8PdtuXPjVD7kIsDekNyuJ45xVu0EctRtLbZm/BJl/xSnF2g3k87qJ1/Qp9xPUTP16dHGXHKFVLWXr7HAavUgPl5H4x5QJidyIDDfShsO29z2/iuKmXC16SLkjXIkAyiZMlhfm4D2SNXyAVamVtvD1oPdqj4GB2GSF454FmR5UuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTviOZgaJwdx+fR8uDMSgbjYqB3wGZaJg4EUbsVWbHw=;
 b=tJjkrzwq7xfgEJyJY8abRz/b+ec+H/8xCjVyyfzw57gQwqfPfFutZOkoThVb29aoDdvL0nCzxdGCKJ7bLdob7Riq3M5F5QuAs4Qmqyesb+Z6OOLFp1VIMAvcEN21mtypRZ1Yq4SoO13EJzHmvA2R/u7N0SYvRyJLub4aRD++cJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by VI1PR07MB5742.eurprd07.prod.outlook.com (2603:10a6:803:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 12:08:04 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 12:08:04 +0000
Message-ID: <0c252770-f06f-0bd8-79b0-af637ef27cc4@nokia.com>
Date:   Wed, 29 Jun 2022 14:07:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/10] i2c: xiic: Add standard mode support for > 255
 byte read transfers
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com, marex@denx.de, joe@perches.com
References: <20210626102806.15402-1-raviteja.narayanam@xilinx.com>
 <20210626102806.15402-3-raviteja.narayanam@xilinx.com>
 <c8d4faf1-5f0c-4adb-e52a-92d46179ffa4@nokia.com>
 <27c88580-51bb-7813-c29f-b8a3faaaa294@amd.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <27c88580-51bb-7813-c29f-b8a3faaaa294@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0246.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::22) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf05492-7d4b-450c-2e43-08da59c804ce
X-MS-TrafficTypeDiagnostic: VI1PR07MB5742:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0HxJrUSeC6iMbf7MlgRoxfj8jreZ1rL5GurtlHBXtgHutgqufmikB3xy9I4ZnU1vRXo9puYhr1+cJv1Kcs5mo/okxaMoAUXdRzh9fnf4JJbKK8yBCO58b7mguhm2YhlsV5MXcbAlRPND8W27JAuV336Kd2msz/Atksl4zJnEWk9fX75CeKY7Xp4F4OYumlHMmmTZSOFSC7QOAlFplQ1Tr/suoh42z8L1G4M6AwJiSuVAzP5/gvgHVWUzmwTd8vA1wZZjs7kyAa4K5qL3X+CVYA3IjHgcMlClwsA76ztMoYfhrIpjOxO/RfJiczbTeN6+UnaG3naIUKOeYIOtRJXEoYAnRJl8wRCzHQDvK7zAEblpIyNEmZY09GIIz6RN9z8m8ZshIgCUmL4QVphA4fbU4A0ZVPGoPpRbMWPivGVELUCkwuTuBtDNXVGv3ICe/Za+yoiLpr/s+ftOjkdgT3nav/qJIXPMwDXQc+C4nEPSUlYMnF/J44lEWRTm+VVbfl22xxHo/ZxW8uKXMTVeIq+VsZxwRpyN1mZV9fQL5YalJrosSnzOtzMQD82pGDPrpHzMEwBSbdcXm2Uu9kN9VpRjEFSawAvvqooaWuW3eyFO/8+tN3w4s9zswUQZzVnGW2jYUgoLPKlEgvzJlJsNda0r+ySR3Is2bqerLlpJINN8FlB0OIPlWtzESn0EJISBh9SrAJADzAQxHh/POFIACiIvy2/SrIem66ILQ5yCURyDVTllCJuxkqtlHgx8C8nvefMSzzfv5n5DN14THMwKgFq8WQiqi7hr9RLJjGZHuo+0OZ3tTzNF/Qe5ANON58hx1Dxl9RdW+2csIO+MMm9NPZHTDDJyKVbXSTgGA8JIJK/KyCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(4744005)(44832011)(5660300002)(966005)(8936002)(82960400001)(478600001)(6486002)(186003)(83380400001)(2616005)(6506007)(6666004)(41300700001)(2906002)(26005)(6512007)(53546011)(86362001)(31696002)(36756003)(316002)(8676002)(66556008)(110136005)(66946007)(66476007)(38100700002)(31686004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTFPeUlDdWVJTGQybXBWUnZ3dE44NVl5blBGS3RVWnFJbm85YjdxTWY2cm9S?=
 =?utf-8?B?MS8vK0VhejQvNi9Id3plQWQybmFicFR3QU1LVkNzYjFnN1JzRGRUTGZHTVFG?=
 =?utf-8?B?b09RdWQwQWdzbEMyN3o1Slc1djBNZmRPOVEyVkRzSlJ0d3VVQ3B1aTVOUENq?=
 =?utf-8?B?akR2TlM2RVZkSkVMalVoRGVLR0U5dmFyWWdtVTU2Ry9WR0hTbU4yK3NsOG1U?=
 =?utf-8?B?UE5laWJjQk9nMVJBYkgwaTVpeUtvM0RHSm1kUXlYUW51bkNlN3REaFRjaE96?=
 =?utf-8?B?U1F1K2w3ZnVzSWFhOHJrMFRjU1ZQbkhNTkxKZnZWbitJZlNQc2pPa2h3YUNH?=
 =?utf-8?B?alNobHYrYS9seWpNR2VoSTd2TmY0UHF2QkpsWmo1MzREeW85aDdwWmhETDlj?=
 =?utf-8?B?YWNwM2RCNVlscWFYY3JLVHV3dW1jZENDV2YxSHFTNmk1R1FwVHZaS2toelYv?=
 =?utf-8?B?MTRqRm5DVm52aUwzd2lNK29DNnExR1BVbVlNUkxlT2FjQll3UWQ3ZmsvWTNz?=
 =?utf-8?B?eXMzU1lOWlZKTEl5NGtoeHVQNC84cUdVbEF5c0pqVTZteXh3TmFvVnZjd0RI?=
 =?utf-8?B?TnVsdU9TdzdZbGRzeGFESlhwbUpEb1hYV01TbWRBa3NkVzhneUNPeEpUekM0?=
 =?utf-8?B?QzJkUXlXTHRVNW12UkJBQVJ5Y3BXN29aR3JkQUkwYzc3ZlMraVpiY3N5YUg2?=
 =?utf-8?B?QUVudzMyenVvTmtaVVkzV09ISDZXQkhkMkc3SHVkcW9kc2RFZ2toU1pJSDZW?=
 =?utf-8?B?dGwwc2dGVENkMGp6eXRmUTBIRE5LaDFHWHdabHJ6SWNlUGVRN2QvR0RBcXl1?=
 =?utf-8?B?U3ZUeDdyR3BILzZwcUdGanZ6cFFSZVVIZ2drbmVYUnorN1EweThrVEdEblBF?=
 =?utf-8?B?bDhtUWZDais1RVpBbTZBLzMzYXVwTDRPR1NRbTBLcVZJWUNseUZDSm5xYzlv?=
 =?utf-8?B?QUdDVDBPVFZybEF2SDNoTzRCZkhFckNpUG9FM0wxZ3R1dHVyQlZFeTBIdmtV?=
 =?utf-8?B?cUY3aWkrMndPKzdlbFduTHRYZldUTUtndExET2xDYTdJTnVYN2FoeWt2ckhk?=
 =?utf-8?B?cS90YnlHYWl1R3gzclIyT2cyREFrb3M1VkYzcUVkUmQ3OXlKTS9VVHFwOHkx?=
 =?utf-8?B?K0trTTZaU1k2Qm9kWEt6REJwamZKNXFVQmJOMUxSM3dTeCtWY2JpenRtV3Ji?=
 =?utf-8?B?b1I5YmYwU3cxQnNuQVVsUWhYbFZNckRNZGpCdDNsNi8wRFNScUo2Z1dJNXdT?=
 =?utf-8?B?SGwzbFRNeUkvSXpNOHkrQmpoYWlyL09ack1waHFjMHAzTHBsMVUwbzhCRkdR?=
 =?utf-8?B?NW1LU05TMW4vNkdUeFFyQjFUczJMRks0VDgzVjBXa2dTTkFpa1NtLzJ1OEta?=
 =?utf-8?B?aE5OdGluNVlJSHp3aG51QmtLamNnazJxQXpTQ1BZZ1o5MTlQZnRpOG84cEVJ?=
 =?utf-8?B?MVdTRUFQbzFHUU1xWFBucmZkeVdMcEFZcVZBa3gwT2FKYUh3UlJMWkc0bnpw?=
 =?utf-8?B?emxPTER4aGwyaCtSMU10ZnUxLzJXeHJKZWtOZ3JPa3ZNRGJsQUFIQ2FVSlFK?=
 =?utf-8?B?dXp5cnNEaWxhMXB3NVA0UFYxK1orNGhUVm1iNHBZQ0ZONUlwVVFpZCtWTy9p?=
 =?utf-8?B?eXVKcHc0c2lHdjlxSnJEVVpMNzVqdmhBYVJUNUNCQUxqQkFLZjFHbFFJL3FS?=
 =?utf-8?B?bGREdEplVG1QeDVmbE8rd3NzVVpxZDU0V05pWXpIWk0xZmtDSkhsR3FzaXRV?=
 =?utf-8?B?Rm4yNlJzQmdxdGlueTFFaFRjTVhWMGQwNUU4dUVhNHcvWG5teXdZRkg4Tkxo?=
 =?utf-8?B?aFRBRmEzazR3OUVlbktKM2VBQ0p4NnlhQk9mREN6clBadmRwbFVUc01aVFlE?=
 =?utf-8?B?Nkd5NS96MldqQlVQdjZGUmlpTkdobG8yckVQSDl5ZFh5UExhK0p3MDhoOXpn?=
 =?utf-8?B?YWYxdW94N3FoMUxLYStNRVhabHllSkZTY2pTeVpQRzZZMjVNd284eEI3OEd0?=
 =?utf-8?B?czdWcmw3QlNtbExOTnRxeUFvRmI1b1pWME9iVVIrRUhncjIvVVlEMVdPMXBM?=
 =?utf-8?B?YmtSUTN1NGZvQXpRcTRBbXplQ0hEd3ZnWHUzSlRDc0VYeU14TURNZC84R2xm?=
 =?utf-8?B?WGVCTTIvak5WcnlHUFRkRmN3NVR0VEV0S1grdktaMFVBSWVtbDFSTjlWWnhR?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf05492-7d4b-450c-2e43-08da59c804ce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 12:08:04.1547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djAqJ857To9JbJMCzmJunkzFy2UqC6GlN81W4kBKX+FCM1TMoXHaZuiQHHH8RL14bMwDTTQpzLaFxWA43VnsMQPobHlb3wigA7ptW2ztOyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5742
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Michal,

I did not realize there is a v3 to that, sorry. I have tested those 
patches untill the "Add smbus_block_read functionality" patch and it 
seems to be working fine for me. I will move my comments to this thread 
instead.

Krzysztof

W dniu 29.06.2022 o 13:39, Michal Simek pisze:
> Hi,
>
> On 6/29/22 13:02, Krzysztof Adamski wrote:
>>
>> Hi,
>>
>> I know this patch is quite old but we need the smbus_block_read
>> functionality, which depends on this one, so I would really like this to
>> be merged. See my comments below.
>
> Please try this series and let us know if it is working for you or not.
>
> https://lore.kernel.org/all/1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com/ 
>
>
> Thanks,
> Michal
