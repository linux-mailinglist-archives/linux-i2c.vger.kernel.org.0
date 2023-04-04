Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095C86D5B3A
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Apr 2023 10:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbjDDIx7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Apr 2023 04:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjDDIx6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Apr 2023 04:53:58 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8CA1AD;
        Tue,  4 Apr 2023 01:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNrY8hnFySwFxYCESGStjPl+Mda1c9O4VYmx4uIZ3eW6BDOz6ZcYCgUoqREPHUMxGpm4gHT76LbCdi0r52gHSAqPPXD/L4UIIKZ65rSg0w5Le25wWAvaPPNuM4HFBzEQRhhAO7scnJIUawZNWhF9DfB2DsmCeTjqtYYMdfNbg4BVFiAxLk4IRqQgFW3OdM3BpTzXPURB8L3A8HhIGdEtpODg+f8CwAu3bP8JtVdXvb5wEjWTV+BVAaGsebHoHhGf1hODpdCEMq7u14Pvuh4tLATckxkml31Wwt0bEw0kRVdX2sTrkzbG3reJbkfCMG3gcti6vndX9QN6HLjt+eihGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6McrMdcL1HwLm1KM+/7u5p8mnGJF5pXiqFFNV+H8HE=;
 b=YipUMEYqv8zhX6ZSWeOnyzwkwgreABMgRKttRuBPODDhkEaEwGIbdf+Pr5eVVki2JDia6lK0lIrz9jb8uOlY775D0RD0LAOBdd5EuDoQTpjIcJHWgDKtn+SmFtabjTwMIsbzHb/SbtfPHYhAST4pQvdihBKJEw13j3j+8GIKU/UkJEQjA+PGoK5IG2QxGaAF+DIyYzDs4LFOA8nfbb4XMxF97VGAFdNmAO8gzX3FV0rxvwUibPvaVsRD22VrAUrlBoTG6MKFKQa14F4x4Y+0IHZu1JuIgyFwbjofVGgDjzpisGpYgJscpxz2OgyQhFTFVe/0UEn9VcpdIdEUCS8lIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6McrMdcL1HwLm1KM+/7u5p8mnGJF5pXiqFFNV+H8HE=;
 b=ZJnLkm+oBHcCbGHF+x3h3HxCk1Rqe90b5DVYwmOVHRaQKa52FeJCGKcFBNv8W7LMG6Y5hNRwKR0fS8swVHc3teLZ1PhhUKAO8V2x50PIOCeov9Jk6eJuj6JzK5Vn4oHc+oY3JGP2qsyKTqctl/JK2FBtIBEOnlrrbwcoPVj+yU7WSkYZwk8XtC2d7VSoHDpH1nyWPhZDk8ays897OFqaCpR1t+GZW4FMb58wSuk1y5Bk+GgxypZu8eX3AoVMOGkVeEVqgCEmblERgigoagZvIWsAYoIUWoDus/I8eZzPCF8fiYqExW5z4K661A447WphUAk/9/UdScdzNlhinhAF6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DU0PR04MB9371.eurprd04.prod.outlook.com (2603:10a6:10:35a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 08:53:54 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61%9]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 08:53:53 +0000
Message-ID: <b1eb8356-4519-4c95-b3ee-afc142b8d17f@suse.com>
Date:   Tue, 4 Apr 2023 10:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 3/6] Documentation: Add ABI doc for attributes of LJCA
 device
To:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
References: <20230325154711.2419569-1-xiang.ye@intel.com>
 <20230325154711.2419569-4-xiang.ye@intel.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230325154711.2419569-4-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DU0PR04MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: b339ff23-d36e-41dd-0db1-08db34ea1cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmiCk6o74yISVyKUJBLW1Kw5YMy1Xu/a1D4kqGHmes8gHgrGjnfLwhcmuxi86XUYBag6mLcHvi0VzjJMbU/fsqATnwqq3W9bes4Rlgq3eq0dyOWeA9pAhyB4YYe1TyMECcJslBvh0NmWgbDStRIxvsB7rifzZZWt5z3zrUKceAe8rHKE8q7C4p09NF53+HmTtJ6pmWiZLqiPrnQD3NbCktrFE/uEN07AR0Cyz1CS1x0Em6xyGGJ6jm+/oru/Ar6Mpfwc7Io4q3J3QEfacjEus2SvwnaP0u6pTkO36aUOXW4+McHqTH1k7CIHEnfR399YxssEx42NFBRUhBYdW3WjFRCJeKqeEDWnVJn5X959UEhBlx5msQfgwU8EdFuwGXtnYGwB4kVXCYUlkIgF5T9T4jkS3seBXdIehDdep/LPpt79fxsicSsUQ/83A6H2UDBTfXWQxS8ne6Pn1T1daqZ7x1vyU0cyugKcifmaC9dduxTAzfi+bhbMzC8mX23ZY/PjUbfzXY1EZVn83NOP7Puk42mfL3tqYC/yE8FvlF67zHTwM7dYUpYOJ3zSXbcmmepTZJbTUbooOaJBx76u30617uJg4y2BJCUBScJ7r3n/+RsCNTor2ePWMwkGPKqMvkSjXPsFeGMA1vl6VB1TKjiHxj/VxgDXiZeqCObAE3OBzg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199021)(2906002)(186003)(83380400001)(36756003)(2616005)(6666004)(6512007)(6506007)(53546011)(6486002)(7416002)(5660300002)(38100700002)(8936002)(110136005)(921005)(31686004)(4744005)(4326008)(66946007)(8676002)(66556008)(66476007)(41300700001)(316002)(86362001)(31696002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ni9UenNNNWR5QUhIdGxjMnpERTYwbEROdldYdnoraStvc0toZnJGRzRPdWVN?=
 =?utf-8?B?WkNzUDBNOWxVUXYwR3VjTjI5QTZoelhJc1hPb2RUazl2QmF0MWNnRTZxL0I3?=
 =?utf-8?B?Rm8yQXVrL2NJQ3NBZ3VBRWtaKyttT1JUTkY0d3Q4ampCWFJDNS9lYXFVSkpo?=
 =?utf-8?B?VU1IVU9VWWl1WjNnc2pmUnBMWnh3L0lsdU9RSzdvU2NkNWszdXNrUzZzbmJi?=
 =?utf-8?B?MlhmNHQyZUUreTJuUlJXSlp1L3ZEcTFtSktjWDh4Y0xDb1NJbzFuZUFzTUN1?=
 =?utf-8?B?ditLMEM5dTlPZ2FuYzhUN2VNc0ladmxtcExSTjlSK1YwRSsybkZIUGJOa0Iv?=
 =?utf-8?B?VWpZNG9wR2RTSUNTWTY5cDlSVlZ6TnpycS9lY3k5a0pWMi91MTRZMjZEODNW?=
 =?utf-8?B?QkVwc203aTAwOHhORENpM1diU0wyQThOTWZmYUpVdjNUWDRiN3RnSmRKeEwy?=
 =?utf-8?B?aTgvQWQ0T0JwZzhZWkZNNk5zbjFNbXpiVHI1ODd6Mk1VdmxOVTRIMitiMHpy?=
 =?utf-8?B?ZTlobkhibmt5TS9ZYlRlbFk4bkVkd3BpdUp6QjVIdXd1K2JmckxZR09GOWpv?=
 =?utf-8?B?WW1KeTl2VU92M3ljL01hSjIyTk9lK1J5N3NYNTI1UFJ6T0w4cHdlWFhvSzUv?=
 =?utf-8?B?QXFvb2JtUmwrblVjSkRCRWNzQmVab3prSTJ0b0ZRUUoyUkdmRldjeTBPWTFJ?=
 =?utf-8?B?TFhIOTFFVmVmdnM3eHhiN0o0QWFIZ2RZbEtZTnVuQXNKUkhIcUZmdmExZkxH?=
 =?utf-8?B?eUk0WDZyam04eEpzbVFCTDNQVWZqeDJrRzhvMmNBY1paZVgvSHdKeFhWdGgv?=
 =?utf-8?B?Y1NCVzFic1FTRTdneUdONDlwOEtpa1NOK2tjSTJ2MjhrdkhSNVdEOXd6WFJJ?=
 =?utf-8?B?TFdFWktHMmptNFhGRDlZMEtaWU1kYThFNFRVSVBJanNWTXdlalgrU09GcUVD?=
 =?utf-8?B?N1B0K2JHNHMwdHZMOGZDVktheGlCK0svQzRTeU9tTWYyekh1VFFVMGREYWFX?=
 =?utf-8?B?VGxmM3doTlRKaW1QTTF5TDB6bWg3L1RYY2N2STltQnVwV2hyNHR5OGxka2F4?=
 =?utf-8?B?UGIxdVFYckNYSDNUM0lWcGJEWENVVUJ1b0NRcnVwbnJYbjBidGdxN3FCaG9x?=
 =?utf-8?B?NnQzV3BjVzM3VlAvUDdhUTEzVXVIa21zTHJ3WlZyaGhWL1B0aUVBRS9kdWhK?=
 =?utf-8?B?aDFXTnBTOWx0L3orUEhPK1plbS9XK01US3ViQ3VHeEhGTDBMalZlOHhYcTZo?=
 =?utf-8?B?RC8rRG9BbVNMTTVGNTJ2U3hGdU1rVTdLOTlSWUlJTmEvYWNOY0Z2TFRkaVhZ?=
 =?utf-8?B?SlNGZFk1dFpnQTJkSHdQZHNVUWV4Um1kajc0c2ZVZUpvVEtzbGxFL05nUjV6?=
 =?utf-8?B?akxlSHcyUVRQZDlpOFNpK0dBbk10ZGJKTTBxeVk1UVFRZHBCY3pMN2ZnTFJp?=
 =?utf-8?B?NlBaZ2ZueWgzbitGSzRPb205MXZ1emFITE1lMjNiN0M3WjNMMUxWczdyd2Ns?=
 =?utf-8?B?WUZJYVJlSWJnYkhMdE5lU2hkZWdXUytaanBCaHRQdUY1UGNjYnVHZldNV250?=
 =?utf-8?B?SEFOemt6UEF4dHRnemRDWk96SjdJWmNGeHBhSzJINWZsaWw4bnludVcvYlp1?=
 =?utf-8?B?Y0ZQamdCbVBCRGtVc3lTbG4zSWVUZWtZTENkdFJhN0JTR1BGdzl0d1h4M0Z2?=
 =?utf-8?B?L2Y2RHpYM2J2akEwOStjUlMvVEhlNFgyV2RqRjE5YWJ4Z09XN0FMSXZIU3Yy?=
 =?utf-8?B?a01RSzA3Z0Z5YklqK2hNeFFJL2tZVmhKUGJBc04wUHRwS2Vja01GdmoxTFFP?=
 =?utf-8?B?S1l2ZVQ2alBFdmRsWEp4TkxlZ1N5d0NRODlrS1BnY0tlbUVEVEhKS3B6MU5U?=
 =?utf-8?B?UUZrOUR5aGt3QVUxZ1RnNER4cFI2QTBBbmQreEM0U2ZuNXZsYTBROWNoVDZS?=
 =?utf-8?B?K1B5RHhzTmU2RlZjdmdrbXNyOGl2bDNVYkxqN01mU25uL3NsbkQ4eDlhTk1l?=
 =?utf-8?B?VllXWGVIYjNDUzFxaHJvUWxNZWoySmZCQUo2TnM5MHgzK29RSDdkTEtKMmRB?=
 =?utf-8?B?a25CYnlKbnBEdFhKZm5tVTdKQTBCSC9VYVdhVVMzMkE5QXpqU3hQVnBZM2ZG?=
 =?utf-8?B?c0Qxakc4SlNQTUVoaGducHRPSTk5dkZ4UXk1VnZGZzl3dUl2Kzd3bGhUK0FM?=
 =?utf-8?Q?u2FbeExOwz32GOd+YmnYxwpoRoyBEvIFhbe7GeuuW6I5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b339ff23-d36e-41dd-0db1-08db34ea1cec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:53:53.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CyDD2uXpavlekMmYzuHaV1F6PODAEdbKBVIDmn32HwvR4zfJ5iWi+enOuILlYESJ4qOUHW2oFDhxiuM/LhfNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9371
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 25.03.23 16:47, Ye Xiang wrote:
> Add sysfs attributes Documentation entries for LJCA device

Hi,

do we really want each driver to have its own attribute for that?
It seems to me that that should be unified.

	Regards
		Oliver

> +
> +What:		/sys/bus/usb/.../ljca_enable_dfu
> +Date:		July 2023
> +KernelVersion:	6.4
> +Contact:	Ye Xiang<xiang.ye@intel.com>
> +Description:
> +		Writing 1 to this file to force the LJCA device into DFU
> +		mode so the firmware can be updated. After firmware
> +		updating has been done, the device will back to normal
> +		working mode.
