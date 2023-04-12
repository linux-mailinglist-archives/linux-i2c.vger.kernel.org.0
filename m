Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E31B96DF2AA
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 13:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDLLLb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 07:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjDLLL3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 07:11:29 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on0623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::623])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC62976A6;
        Wed, 12 Apr 2023 04:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdJ+vbLrEEBrLXxthELgHPV2+ZeQd58qnaumPEX1Dgy/rASTcA8dTsoF5X9g/1sQ4lYcRnQe5gEcltjq7//lUQX8EEN5Fexu8VNxOrVHJ/0EKvVkAH8oaqyxBq9pJgbRBeKuKlSqZsrX+gqUyYBuEykUW+qAMWvbt3DtEkMcAVDTfB0bFm/OoBUmaMH/NHNGg5gbbvXAfxBl5HJupfUwByLYGVWdTTARLGEIEoLyFDrFpr1G719m7D+FKag7784y1XIAKDnOijSn8sUaRd/23BjlSIj3f+3IGxWFhLsYm452OOeUmRD0XKb/lJYarNrmSCGKhFJSmLWw8aih5l1Kdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C+NV54CbbVCVLZKW4R862Yi8i2+aZZo4I2UxQH985Y=;
 b=hDFc77s2PDHOLzxEoblEw3spJjtZzGdkevYDmKtRO46N1eF6mjsKnGUHQXqEcx0hvsXAvpb76GU1R4FOICdDT4w0ClsLo5cSRGQ9Z8/hyVPVceXxp0XSBYA9/HllsWUEsj87er/OigX+yYdTQxc5nQLg5wthFH79a+N3NBJlKcsfQrXmpEzp0lLM+bCBaOFTwjsM5/3CO3FUeTNnTAqUokkihUmCxnB0EBF9BLE6RXF+neTbU4xj82YoIS5PnoAttzdhVOm85FXzoO7Cgyovv+IFiXR0vOsqLpDH2rfpUiOzXWyEVueGEAO6+ad4APZpNaQ23mkR6SRJdWgeHFOm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+C+NV54CbbVCVLZKW4R862Yi8i2+aZZo4I2UxQH985Y=;
 b=PNQsSaGQ548Xru/e8MEMXxBniEqnfzANZZq8leKd6Qv2wDQEQTrDBkYvmLiQWnyOk3swq/5SZBiBgC1baVUcOyWi5VgNYpLugyQgocWwfptcxRyqJ/Oupu5VnQUtjq/SVHlEd/451r2j55Cr6RJHHA1hZILIkX7fQGjSeGDOdKYH8NkG6K/P7yV3AZ/hOs3yjno5E+pl/R+f6Q07K4291u32cq2CsJHOBdBX1czH9H7/w++cOjmcC+tHwxBnCyjwt8Kfxwe2kA+JGTJnZ0NwQ5Feh+BAEu7NngsDUDROQUiWvhLDoIamhOEhaBj2jGQVaUMJ82iwDFsI6YW2+l/IQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com (2603:10a6:10:12a::11)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 11:10:38 +0000
Received: from DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::ad2b:14a0:1f4f:b497]) by DB8PR04MB7097.eurprd04.prod.outlook.com
 ([fe80::ad2b:14a0:1f4f:b497%4]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 11:10:37 +0000
Message-ID: <abf246fd-472a-c5fe-1f7a-a6850c614dfe@suse.com>
Date:   Wed, 12 Apr 2023 13:10:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 3/6] Documentation: Add ABI doc for attributes of LJCA
 device
To:     "Ye, Xiang" <xiang.ye@intel.com>, Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-4-xiang.ye@intel.com>
 <b1eb8356-4519-4c95-b3ee-afc142b8d17f@suse.com>
 <ZDPoku+k+S65cmeQ@ye-NUC7i7DNHE>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZDPoku+k+S65cmeQ@ye-NUC7i7DNHE>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To DB8PR04MB7097.eurprd04.prod.outlook.com
 (2603:10a6:10:12a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7097:EE_|VI1PR04MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 1334f6de-f577-4c23-ee6f-08db3b468b0f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ttWYO363lkXBIEK7T+j+G4qq/Oksu+yotoeTM1ord6fXxhma6R9LZqmp9ffG2US1vG7RUTjuioSAKqEvcUR+IMr3UVp8fxVZ1TWmxXno6aAft9bCnOEWwQaiySVRBy/+oBAoHmo+QYpEXc2oDNOKGy4EVA6cDCTGXX1e77wqSjNCDTs/cTBdOVMzryNMGNoRCJJRW865gvH2rXTZJT2Nu9bCgZMHroImz2AEIc1+QPO45ivib8pYPemCC89E9HZve3HK0a1SiG9yTCsdslv11PSzTGaaM8XGjLL2II19enatP2GPGKkArhTHgJTrMkwOiBO/IbVMgXS5H+tCkTCh2sZJ0lW/8utnAbvBBZpTrsDk34dWYSQtmDpyMebeTKS9FZxCJJwRqSZhCZH5UUVSnYZJtYElcyBlzLxNXnpHLfn9rd7g3MPKl2eWUN/CVZxz2ZrLCdG9n97tShb4bRVdR4Os586r9JHYcqAE4mzY8pzP5wTuQB3MzvoBQM2w5KHha/kBmZSWMRtX8Ofdc6kE1BC4giRds6M4BTQ997hjNhxCczZgSonwi72XpgUcFtmqUXQ9/66kvPOTHCjTiWI72+q32sVjy80QOYCLmWnaSY7rodDyWZz/xNz04fb4sJcQXOPkqHKWcyvC0R0wpiFFrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7097.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(39850400004)(136003)(366004)(451199021)(2616005)(478600001)(6486002)(6666004)(54906003)(186003)(53546011)(110136005)(6506007)(6512007)(2906002)(4744005)(7416002)(36756003)(5660300002)(38100700002)(4326008)(41300700001)(66946007)(66556008)(66476007)(316002)(31696002)(8936002)(8676002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBjSGNRL1lsMkhHcVZYcGVENzVhNW84cWp1WXl1eG1IZUh0a3E3OXVwKzBU?=
 =?utf-8?B?OGhFUjNpWkpmRFdrNjNnN0NES3BuTENEU0owelpPdE85NVdEZ3FnVXZUa2th?=
 =?utf-8?B?TEdwMWc4dFVrWmRkSVk5TXMyaFByL0R2a3VsVDhNMnhHeFVjeUdGUEI1VkdD?=
 =?utf-8?B?YzBBMzl1d3lKLzdhRWh1aUZUV0dCbE5hQ0lvNWtFZEd4UENYNDlsa3NCaEdq?=
 =?utf-8?B?eDRUOVFFeHdnMGpwcXdyY1lQVDFDNkJTYlBlWlFsZFpFRGxXM3NodGprL0Z0?=
 =?utf-8?B?UStwVkxrbDhjQ013eWFRUk05eDR0c2piR05NQlpSWU5mSXFIME9tYWJPa3hj?=
 =?utf-8?B?ODh2UnNuSHJjUXpvMVMyTlNUdEx5TnNwa243WUNFTVBUcDRJLzh1Nms2Rjdm?=
 =?utf-8?B?TzMzbk16TDBsblBXRUYraDRGYmR1REhjeVA3S2FDN2FEeEFQU3VtaWgyeHh3?=
 =?utf-8?B?QzZISG92WEp6K2hHYXdkSldWVk5GeWR6TkVTaHdsWklLUDJtbjQ3cGkxakJo?=
 =?utf-8?B?NkNpMEs1ZTRBbGs2VHQ1K1BzTDQ3QTYwTlErLzJVOUsrRWN3bGl0enpLWVBp?=
 =?utf-8?B?V1RpS3dKbFp3RE1nb3dQbkVaU0xZYjlpOUlpQ0dUV1BnWDh6dXVRTnlINmFw?=
 =?utf-8?B?cGxOQU52YVJZMy9yOXpJTXlCSjRScHE3QVd3dXlOTGlCYWRnK1lpY0hTMHRK?=
 =?utf-8?B?cndvV1ZxaVBYZCtGZU9lckxZdjFkWGR2ZE44R3ZuQ21QR3dVUW1CTEZhMTlw?=
 =?utf-8?B?Vm1QcUlGQ2kycXVZR3JwdGxyMlUyenpnWTZhNUI3QnF3RXFmQ2R0bUVIT0NK?=
 =?utf-8?B?bGE2M1ZYRG9TMzZZTzIvWDBJMHhpZ2s5ZVBzZ1pORzQwK1A1a2hvRTRPdXNM?=
 =?utf-8?B?TDYrcDRIMUM4QXJuQWNGVnlEcEwybW9uMlhXdkZERTlJK3RMVDVVL3kyU2tt?=
 =?utf-8?B?VUxkUFl3M3BYYkpnSmZFci9JQklhdUtrM3dmUEZNcmFsRURmcVloellGTEZH?=
 =?utf-8?B?MkgrM2VjODlyZ0FMaVNKNDQ3ajNnQTVOYXlONGtqNE5xbWUyVTJsVldnWUFS?=
 =?utf-8?B?WkZUZFpvQ3FjZXoxTFNYcW8ycVlnWjVoaHZXYjNreklHQkNsQkxTVzAyc3Qx?=
 =?utf-8?B?Mi9lSTgxSE1ScGx1V1htaEVlblFQSVlvcGF6YUdzRUZabU9DY0ppcEIrQjUv?=
 =?utf-8?B?QkI4TzRqQ3lwc0xjbzRQSFlTRWREeTVNQnNCMnJIWDVVOHVqSTlLRkR6dEU2?=
 =?utf-8?B?SzhIUjdFVzRuOGN4K3FtQStJa1FPOG4wTGZuemRjZ1RpWXZkc1ZmRlFWYW5I?=
 =?utf-8?B?K2ZKMFN1ZHYrNzgwOVIweEJLM1lFQjdFcVhhSWkrVWtCbGpWMEY1N3VRU0ZU?=
 =?utf-8?B?YVZuUThaMVFuaGcwVzBSalU4d2lpenlTc21PSWZKbC91bmRmUzgwK2ZNS1E5?=
 =?utf-8?B?ak43Y0ZsNXpGeklBRDZodGhpS3JycSsxOGxucE1nVGFoODBFYVhTL3R6Z2Vr?=
 =?utf-8?B?aXR0MFZVbWh3RGpwTkJtWFVMMFV0ai9lTTU3SGtMNkdiT09WRlFmb0x3Vnpw?=
 =?utf-8?B?Z1RlWEMvY2tyd3djazFYRzd4WDdUZXpzb2drK2duNGhkVWx3ek5xTTB3b1lK?=
 =?utf-8?B?N3I3OHNCaWVGRW9hOFFnWG8wRDY3YWViQlAxTjB1bmkvK050V1FpdUF1VEhP?=
 =?utf-8?B?bkFFRW5LUEFTVUNTTGVpenR0M0ZZd1UzMi9KcFhuR09Oc0hVWENPTkVxc0x2?=
 =?utf-8?B?WXpUNmRxVWluZVBwb2grNXk5SmVtNFVja0NlRHp2ekc1NXlhM0FPNUFZWW1n?=
 =?utf-8?B?VXByTnp1ZlpReE1yZHZ6UGxqdUpEK2VrRC90MlBqcWJiQWhKUWZhUnB2ZXh5?=
 =?utf-8?B?dkdRemsyQk91eTZ4bHZIVXVlTXdxaUJmK2xMSm9iRHYzRFYzdUJ3UjFvZG9M?=
 =?utf-8?B?WDl3ekl0aitHSWVWY3hGMEhLeGZZTE85M3YzZzRIM09YWGFPYjJzZkpIM0dR?=
 =?utf-8?B?MTQ2TWQ0VEhQR0VleWpSdFpwZTBiVEpJZ2kvZlRqU2J1NE8zWVVhOUw1d2JR?=
 =?utf-8?B?Q3VTWEJVNVZ1UWMxS0pNZ3RhZUNXUmlabEprV25lQXFXWktxUFNvRnBkU1hi?=
 =?utf-8?B?YXFUQ3RPLzBXMzlzVS9OSS9SOUxvaDdRTEtXa0ZwL1BMcjdNdEdnRm81bVlO?=
 =?utf-8?Q?4MmbNarVk4GJMRenXilbzZM4P0bxj3hGbSYrT1sxFWmh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1334f6de-f577-4c23-ee6f-08db3b468b0f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7097.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 11:10:37.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEOrp7GzgpeLk1Ehmtz20CHIc+r5d/BHivElxmB57ERd/9AKHouA4E3MOTMhexCTbO7TYGJxiYBkMcSG21dXfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10.04.23 12:44, Ye, Xiang wrote:

Hi,

>> do we really want each driver to have its own attribute for that?
>> It seems to me that that should be unified.
> Three ABI entries are added in this patch: ljca_version, ljca_trace_level,
> and ljca_enable_dfu. The first two items are specified for LJCA device and
> I think they can be kept in sysfs-bus-usb-devices-ljca.
> 
> But for ljca_enable_dfu, I didn't see a unified DFU entry in sys-bus-usb.
> I am not sure whether other USB devices have similar DFU mode or not.
> 
> Any suggestions?

What exactly does this attribute do?
Is it in addition to the normal DFU_DETACH + reset sequence, is it
needed for DFU_DETACH to work, does it enable the
DFU class interface descriptor?

A point of DFU is rather that the capability should be announced
via descriptors. The answer would depend on what exactly this
attribute does.

	Regards
		Oliver
