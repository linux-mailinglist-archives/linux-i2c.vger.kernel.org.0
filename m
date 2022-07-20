Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43EEF57B476
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 12:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbiGTK0K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jul 2022 06:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234780AbiGTK0J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jul 2022 06:26:09 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150131.outbound.protection.outlook.com [40.107.15.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C6625582;
        Wed, 20 Jul 2022 03:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k613AKrxy1ey6AEpL1BUJV4SdQ6aTHL7aVpO8mkOPNTq8oLvtPPPmPBvY5EStpQOwkbrzxXMSBv5V4R7rsW041UP26GkNedbW15qsw+EzRfXGeodL2HAAaEgDvBiH/Ra9XOZUKyZ2sujVphvAkew6wKP+mvzj16GiKyaxVKl+NVM2dgFPsdaglgXish/LDUGcBp8wE4+0PmX8qet6FwJwjIgr5uz34tnNmJXSs5fAhZOxZChJ9ADIPDKF+BCTORh3g/Ee6VoJLw2aU5UKd8vOuXfWj4vRwMs1/fvfdKX19Kpb1e2aZFLypelLsK1MwdwSWtNyktqlcS+kITXdTSmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wcuYgTRXXYnGP5I4KU3iJilOgxXcD0aSXtAOv4xT84=;
 b=bQf4sy3KRpBDpPncNW4qk8KV2rUfrOJiQomEz9UV6U0daNNCiNYKmMx/zZboev9AU0YM4ltmL+f7G69kk2znWw4V79K1DRNhBPyUub0OwLV6nSvsgnqpe7k6ZsGG598DPpJnGD2q+mnUxKJ44FYIax04FiJjihIgsNBbKiuO8d0TLwVJQn7s7hQHGuDmc00c+TaVulLzzG0CEa/kJokIDQPhfgR/3f9lFnjE/efHHk/bMO/+prfvXQpmmOmdU1+gzAkA/ZZuQrE9Rcf9CHha4wdgPrKJeiLJ3FWUVC80ffANuMhr79FVooR/ldKheS35ff6NKuESYuDHJ/Yk5qJnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wcuYgTRXXYnGP5I4KU3iJilOgxXcD0aSXtAOv4xT84=;
 b=CfblIQVSBNKF49dlP937gudg3THUIJOkzf093zZZbubCDzoh6JZeRa8UeELkhEZhEzc9OThPOcTJwldeTH7xwbMTvD2z/Soa30NUEsttQRiN2BmedC9T3H/hHoHTfJw5JfxpOaRwjajx/ep18d9f872bzKX15xbvyGo8i0SZF3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com (2603:10a6:20b:373::6)
 by VI1PR07MB6030.eurprd07.prod.outlook.com (2603:10a6:803:d0::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1; Wed, 20 Jul
 2022 10:26:04 +0000
Received: from AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::a945:75fc:5c8:3ffb]) by AS8PR07MB8104.eurprd07.prod.outlook.com
 ([fe80::a945:75fc:5c8:3ffb%4]) with mapi id 15.20.5417.023; Wed, 20 Jul 2022
 10:26:04 +0000
Message-ID: <7dcd75c2-2045-a265-7aed-bd62d9ee2e00@nokia.com>
Date:   Wed, 20 Jul 2022 12:26:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/12] i2c: xiic: Add standard mode support for > 255 byte
 read transfers
Content-Language: en-US
To:     "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>,
        Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "Simek, Michal" <michal.simek@amd.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>
Cc:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-2-git-send-email-manikanta.guntupalli@xilinx.com>
 <9d90d39c-c5ce-409b-9b87-71592dcca1cc@nokia.com>
 <DM6PR12MB39320029A79C437D067B88A48C899@DM6PR12MB3932.namprd12.prod.outlook.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <DM6PR12MB39320029A79C437D067B88A48C899@DM6PR12MB3932.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0253.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::29) To AS8PR07MB8104.eurprd07.prod.outlook.com
 (2603:10a6:20b:373::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56888017-c8ea-4087-a54a-08da6a3a4061
X-MS-TrafficTypeDiagnostic: VI1PR07MB6030:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mqGG+CLFooCbdrhPsPMJEafA33cK8FaoFgbs+ioNl4/6HSamEgLR1sELH5mNloEqNtj5sXtzo3X5UZwkh5EMXpJLK6iG6DvrEKoWXwFlo8emxPsnfXhZUBlLXaqgBWQYnhC5UOs6AMs6+U4WtIXm4BKBuXg0xxjJ7JooWGwvQIwU9VraJr0LpB7nixvzAa2CxwiiZ9bzBzV7Axfj96ZlSTrfistCk4/g/hNs1pHYMfxCgaSSeSrY5nF2/HW2avX98FBmHYpps1lEJiMTWJieAd15ZYkxQu4dENlOUReh2zDalKsJCgh1k3r3d+cgzJKTHfHFk1lAecpZL31tA87waG+lp/jZVWwzTO32s54XVUJnQ4WsURteLHLOVG6pVFoiBB9bQVJFjWryFyqrjcCnrdOlXC3I1T7+igq3JbuLezTqt1PBXKq/7KgPMGzhf5Be9/axvxh6plEiSq3TjEl3qBRsR/FGgstTYzMnlqaTsZx/81zdM1vNQ5AQZdGUvMaZdVUYk4KMcUY14IvaUDBJ26qBeXiUJC5BwLkbqAjOJUqsZQOEkPZFuWaYm5wSZY6Dna0C0LkrO/WhE/SkyKygqZ1G0QvUy0+PnHJPcqJYEATrvevPFfOWMpNtf9M0LL9Z0Cxr5OxZ/L2FVL3YJIzpjL7yYrpzHA6WOvbf/1wtZv+UYRLymuN7MLolUHciGlM2dzbtnigC4h9uMzS27ZfKVpZ/mXh/0nk9zOqbHKVqc351kcWCFlciaFqXa0pwPy65w/lobE+GWZmx/d8KC80/xl8Hr+j8VcXiP/nYj+llY0/iwoMpWf1e4YN/OZMxe1n5pMOL5R2wSldT8HtDRYF1u/+HKyd/KrLIcI0YMJq+9e5B5r1mxBbnDg69gu4BZLF/c0wyUXpbhThZPiJg5b9Hz+r8LBXiyH2dD7xhc/GLnlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB8104.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(6666004)(41300700001)(4326008)(8676002)(38100700002)(66946007)(31686004)(36756003)(66556008)(31696002)(86362001)(66476007)(966005)(6486002)(26005)(6506007)(478600001)(5660300002)(2906002)(6512007)(8936002)(921005)(316002)(82960400001)(83380400001)(2616005)(186003)(44832011)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXF2R2lUSFc2ZEovQjRibmNmUnVlRVF4d2NhcDBuTVBjWnNYM1F0VzZhL3Qv?=
 =?utf-8?B?UDFrSUJDYzhuL3IyemdyY0xFK3dNZ2V0akpPMnV0Qkp4ZnNBbWNHeTk2WHlR?=
 =?utf-8?B?cmduM3ZFRytBcjJTdDdKR014N1R3STE4SFdOcHdKZXJseHNPT0p5Z0ZMYUI0?=
 =?utf-8?B?dWR1RjF5SjMxS3JPcFNTUzB6VHdjR09BZWlOY2ZKcHZLbHVtV1IvSDJKUkcz?=
 =?utf-8?B?VnBFdWRyeXpGM0dhUWNzZDJyaGdhYk9JUUxkd1RCZ2JlQ2YyS0NNOW5iblhD?=
 =?utf-8?B?ajV6RzNueHZJNVhmdGwwTDdLcDU3ZE55dDQ0eGpTMkdSVzhwc1VGVlRJR0dY?=
 =?utf-8?B?K2FVTUVPT1VVRnVGWEdUTmE4ZkEyRUZENDBxRUFTdmN5WEQvTWdLYkJJTHRR?=
 =?utf-8?B?a3BGOEJHcVJCenUrN29tY1BqNGxxODdYWFEzWUtxTzByZjQ4T0x0aHUwdkdC?=
 =?utf-8?B?djNtdWovL0d3UER6MVZlSWwrdHdXeEJQZ2NDWUtGckRBSkFzbm5rdWZtREE2?=
 =?utf-8?B?dURhc01ldEhnN0VFZnpPbm4rck4zVlEvTERFUDZNTXB4a2ZwK1BpeHA5eHZO?=
 =?utf-8?B?UkVTSHVXcm5ubzNXMHlrUmVyeDVvdVFGYXRWTFIxMTJvY09YN0tDRTlZTGxL?=
 =?utf-8?B?Z0Q1V2R1Z0R1NTJxSVY5VGxWejVzSG81UEJmRndHT0FCSXJzby9PdlZjZXd0?=
 =?utf-8?B?eElvVzAyaDBKVVhhQWV0NEVnSG9RdEJsRHFwNTN4L0RQVkJQN0EwLys2VmRB?=
 =?utf-8?B?WDVDeE04T3grSmNueUNPU0tqRGt3dW9leUFxK1FSQlN5eklHcHFwcUFNYlVR?=
 =?utf-8?B?UnBBR0lUVklYNkpqNGJiZHVIWncwa3ZYVGhkbVJ1cjg3UURaZ1hkWFNya09i?=
 =?utf-8?B?d0pUbHNmYUJUVVphRmJscE9ub3JDSmV3Z056TitjS25sUVIrNG9admErK2My?=
 =?utf-8?B?aWFpUXgxTGdZYVhmVktvMU8rSWtCVjcxdWgwY3htNTdyMWNYUy84aWdpTE9r?=
 =?utf-8?B?QmJLVGhWWGFJSW50aUVTdUlqaWlIVHhHL3ZkdnV6SG9UaWx1VWg0N3QxNlBO?=
 =?utf-8?B?YTd4UTlSN1VvYWRzWlovSUlneXM0dVlsOEsxVVlBN3orNWhBM0xBM2VMaE9Q?=
 =?utf-8?B?c3BNc3dUcjdmMzNUYXp2WU1pcjJtVFQzam1LdEtBbmsvT0piOGJtU2VNWTRV?=
 =?utf-8?B?ejlQalZuRTFhZDJ6UVFRY0N3d0p4cDM0OGplZ3JJeWlTNElpRmp2MjVpK1Rj?=
 =?utf-8?B?OVFRK3RjeDA5WGRDakZIZ2JXaXphVm5sNGJhZm81cGxZS3JZSFZWYmNoNFFV?=
 =?utf-8?B?eVlteDh6dTA3U2VjQWdOaGp4T1hEbDFkcHBSMkxTTElFRFdYeUo3a29hQXRZ?=
 =?utf-8?B?ZXhjeG9vQXM4THhvNHUrN3huTHQwRUgrMVdtekJZa1lJRlJTa2o3TWdXSVc2?=
 =?utf-8?B?RFBzd2NFMnh0T2xEMzBWSGRyeVN1N09JRWhrOFhBV1NzSXlnNkRDZnlTc3dM?=
 =?utf-8?B?RW5nb3NpMFBOdlVXaElhUUtXWTJaNFQ5QktOOHFlaE1HRlpOcVh3WnFMUkRT?=
 =?utf-8?B?OHZwOFlHOGlGVUo3WGtkOC9qeWE1Tm5BaFpXUUNWd0Q4QzFBM2owTGdUTzhG?=
 =?utf-8?B?NEtOZnRCR3gwdjJnRU5GYTZ0aU02ZCs5akdmNU12R08wTTVpeXdDQ3RydDg4?=
 =?utf-8?B?MVJNR0tKV2V4MlVUaDlyUFRhQTlldjRIMWFMNWZ0anN3VHlmNlJmSmd2N0RV?=
 =?utf-8?B?OWNqK0pveStCc2xwVDYvN0gzb2hTcVhhYU1aLzJoV1RLbTAxL2RhSE9DZzR4?=
 =?utf-8?B?T3JxeFpXY09NYzdkcURlWm94Q3lhQ1hNN3lGZFh2Lzlnc3NUcjN6QnU5YWRH?=
 =?utf-8?B?OFJ1UVUwMWU5NzNpMzZSRFBRNlFxbVFHSGRjMER1Wkk0ZFl2RTNPQnZVYXVN?=
 =?utf-8?B?ZUlhUHp2ZWZBZ1RrMGRTWXBxYklJV3ZDZTdEeElZdnN5NkE0ZWNKR2pBdWFL?=
 =?utf-8?B?eVJNeGRobG5NNkZWYVJpUWZHRVdRdkVJU1NNOVpaMEk5SUUwWExwV0NDTGNG?=
 =?utf-8?B?WWxETTBuS0poendUaE9KS3lldDM4V1ptSWFaSmFRWTJoaEd6clNHTUFuTmVR?=
 =?utf-8?B?Y3hVSTZUUWZIcWZrVjh4K2t2QzZ0czlWZEppVXdnRkwvU09lbjlSTmttNUZ4?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56888017-c8ea-4087-a54a-08da6a3a4061
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB8104.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 10:26:04.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5UiPjmhgNmdYcLB9HfTcJAn7S4/qCpNns9UI5oUGncaWYGP/mcUHdT0goR2umycl7bUGDeUWV6CrQpYFUBM5rn3MjpCYI7TsRFmrZX+u5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6030
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Manikanta,

W dniu 13.07.2022 o 09:54, Guntupalli, Manikanta pisze:
> Hi Krzysztof,
>> [...]
>>> @@ -579,31 +681,99 @@ static int xiic_busy(struct xiic_i2c *i2c)
>>>    static void xiic_start_recv(struct xiic_i2c *i2c)
>>>    {
>>>        u16 rx_watermark;
>>> +     u8 cr = 0, rfd_set = 0;
>>>        struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
>>> +     unsigned long flags;
>>>
>>> -     /* Clear and enable Rx full interrupt. */
>>> -     xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
>> XIIC_INTR_TX_ERROR_MASK);
>>> +     dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
>>> +             __func__, xiic_getreg32(i2c, XIIC_IISR_OFFSET),
>>> +             xiic_getreg8(i2c, XIIC_CR_REG_OFFSET));
>>>
>>> -     /* we want to get all but last byte, because the TX_ERROR IRQ is used
>>> -      * to inidicate error ACK on the address, and negative ack on the last
>>> -      * received byte, so to not mix them receive all but last.
>>> -      * In the case where there is only one byte to receive
>>> -      * we can check if ERROR and RX full is set at the same time
>>> -      */
>>> -     rx_watermark = msg->len;
>>> -     if (rx_watermark > IIC_RX_FIFO_DEPTH)
>>> -             rx_watermark = IIC_RX_FIFO_DEPTH;
>>> -     xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, (u8)(rx_watermark - 1));
>> Do we really want to write 255 to RFD if msg->len == 0? That will set the
>> compare value in the RX_FIFO_PIRQ register to max value (15) but I don't
>> understand why we would like to do this.
>> Also, bits 31:4 are reserved so I think we should not try to touch them.
>>
> Here comparing and taking minimum value of msg->len and  IIC_RX_FIFO_DEPTH. The value of IIC_RX_FIFO_DEPTH is 16, while writing into register performed -1, so maximum value writing into RX_FIFO_PIRQ is 15.
>
I'm not sure you got my point - my point was that if the provided 
msg->len is 0, then rx_watermark will also be 0 and thus we will set the 
XIIC_RFD_REG_OFFSET to value 255 which seems illegal.
>>> +     /* Disable Tx interrupts */
>>> +     xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK |
>>> + XIIC_INTR_TX_EMPTY_MASK);
>>>
>>> -     if (!(msg->flags & I2C_M_NOSTART))
>>> -             /* write the address */
>>> -             xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
>>> -                     i2c_8bit_addr_from_msg(msg) | XIIC_TX_DYN_START_MASK);
>>>
>>> -     xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
>>> +     if (i2c->dynamic) {
>>> +             u8 bytes;
>>> +             u16 val;
>>>
>>> -     xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
>>> -             msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
>>> +             /* Clear and enable Rx full interrupt. */
>>> +             xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
>>> +                             XIIC_INTR_TX_ERROR_MASK);
>>> +
>>> +             /*
>>> +              * We want to get all but last byte, because the TX_ERROR IRQ
>>> +              * is used to indicate error ACK on the address, and
>>> +              * negative ack on the last received byte, so to not mix
>>> +              * them receive all but last.
>>> +              * In the case where there is only one byte to receive
>>> +              * we can check if ERROR and RX full is set at the same time
>>> +              */
>>> +             rx_watermark = msg->len;
>>> +             bytes = min_t(u8, rx_watermark, IIC_RX_FIFO_DEPTH);
>>> +             bytes--;
>> Again, do we really want to write 255 to RFD if msg->len == 0?
>>
> Here comparing and taking minimum value of msg->len and  IIC_RX_FIFO_DEPTH. The value of IIC_RX_FIFO_DEPTH is 16, before writing into register performed decrement, so maximum value writing into RX_FIFO_PIRQ is 15.
You are not correct - in case the msg->len is 0, the value written into 
the register will be 255 (if you decrement 0, you will get 255 in case 
of u8). Unless there is some check making sure msg->len is never 0, that 
I do not see.
>
>>> +
>>> +             xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, bytes);
>>> +
>>> +             local_irq_save(flags);
>>> +             if (!(msg->flags & I2C_M_NOSTART))
>>> +                     /* write the address */
>>> +                     xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
>>> +                                   i2c_8bit_addr_from_msg(msg) |
>>> +                                   XIIC_TX_DYN_START_MASK);
>> When reviewing this patch, I tried to understand how the controller knows if
>> it should work in dynamic or in stanard mode.
> For receive operation with byte count greater than 255, we will switch to standard mode else always in the dynamic mode only.
>
>> My understanding is that in
>> order to start the dynamic mode logic, we have to set the DYN_START bit in
>> the TX FIFO when we write an address there. Is this correct?
> After deciding dynamic mode based on above logic, we need to  set the DYN_START bit along with address in the TX FIFO to start the transfer.
>
>> But we don't do
>> that if I2C_M_NOSTART flag is set so how is this supposed to work with this
>> flag? I mean, does the controller really supports doing I2C_M_NOSTART in
>> dynamic mode?
>>
> I2C controller supports I2C_M_NOSTART in dynamic mode.
>
>> Or does it support it at all? After all, when we skip this, we will still write to
>> the TX_FIFO register 5 lines below. How is the controller supposed to know
>> that the len that we write there is *not* actually an address?
>>
> Below notes mentioned in I2C_M_NOSTART section of kernel documentation(link mentioned below),
> " If you set the I2C_M_NOSTART variable for the first partial message,
>     we do not generate Addr, but we do generate the startbit S. This will
>     probably confuse all other clients on your bus, so don't try this."
>   
> https://www.kernel.org/doc/Documentation/i2c/i2c-protocol
>
> So I2C_M_NOSTART  flag need to use in second i2c_msg or in later i2c_msgs, but not in first i2c_msg. During first i2c_msg dynamic mode starts, so again no need to set start bit TX_FIFO.

But what happens if somebody passes the I2C_M_NOSTART bit in the first 
message? There seems to be no check for that. I know the documentation 
says that this should be avioded but it also states what should happen 
(S bit is generated by no address is sent) and as far as I understand 
this is not what will happen in i2c-xiic. What will happen is that the 
address *will* be generated and it will be the first byte from the buf.

>
>> That being said, we do not annouce the I2C_FUNC_NOSTART support so
>> maybe we should not care at all and just remove the code handling the
>> I2C_M_NOSTART flag?
> Since it supports I2C_M_NOSTART flag, need to keep code handling flag.
But if it supports it, that should be annouced in xiic_func.
>
>>> +
>>> +             xiic_irq_clr_en(i2c, XIIC_INTR_BNB_MASK);
>>> +
>>> +             /* If last message, include dynamic stop bit with length */
>>> +             val = (i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0;
>>> +             val |= msg->len;
>>> +
>>> +             xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, val);
>>> +             local_irq_restore(flags);
>>> +     } else {
>>> +             cr = xiic_getreg8(i2c, XIIC_CR_REG_OFFSET);
>>> +
>>> +             /* Set Receive fifo depth */
>>> +             rx_watermark = msg->len;
>>> +             if (rx_watermark > IIC_RX_FIFO_DEPTH) {
>>> +                     rfd_set = IIC_RX_FIFO_DEPTH - 1;
>>> +             } else if ((rx_watermark == 1) || (rx_watermark == 0)) {
>>> +                     rfd_set = rx_watermark - 1;
>> Again, do we really want to write 255 to RFD if msg->len == 0?
> Here comparing and taking minimum value of msg->len and  IIC_RX_FIFO_DEPTH. The value of IIC_RX_FIFO_DEPTH is 16, before writing into register performed -1, so maximum value writing into RX_FIFO_PIRQ is 15.
>
Again, only if msg->len is not 0, which is not ensured.

Krzysztof

