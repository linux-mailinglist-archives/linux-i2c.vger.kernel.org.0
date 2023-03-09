Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04FBA6B259D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 14:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbjCINkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 08:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjCINkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 08:40:18 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC11EBF81;
        Thu,  9 Mar 2023 05:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyWxJcqH/k57zsT2yAfr82G4JEBYB3MbODhjqCgRUhVfy5DKhFuKs6S2AiNY2+RGPWHn/LJNcQAO3cyAoHHHIEdcmyQj+ZGD4zR/7oyy3cqCa5cJK74GiGB3aUf5p36uO5Z7hOHitWu2Ex+6z/AILicKC7U+9sDVVywSJjLlIonQrCl4mwnmLGURUYG2fUt0L0gas2uJdSZQf29VaHmXCXaCps8wHo2gp+2AdQMLpYP9aZotE+zb8KoJifkUiyiWlVNwKAL5+NnX7HS+NhTLuaPSX0zsaAf2a6aRHsexfOpW+nbDmpRxw5T38lYr7LL/XPiuLsduFLz0J1hZ19HWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aq0W5QMwTjORBZ34TzCtBpEATvvo9HjEGgKFSusvFUM=;
 b=DUO/+yBrWS6RJaoKD/f6v+g30SV1sfDgwqw4C8aDBRErwZJH1veh/lf9922Z93Yy39gfzUMY5IdeZi16CZIMR2GeOf3FHDWc/yoPEPPS83AKt9BFHVIV51yfPrkbuAiBouIl1Krho68LUyTsztWxq/zsfHzVE/hpjugefci1oj4n/2zU2cTj7nIszujekm3dLKyTNXR6pMOeUYx4GOj47Q4vUfAovYuRdb5pSHL6rlSmnCUHqB4O7EcdpXFXCL/170idrP272pk1FMZ48pzJMxlmaGFLzQynBqVrIIgIDLlF44JNbh/p4Kipxiq1/t+Ez//f1/uUkiele+gnSUo0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq0W5QMwTjORBZ34TzCtBpEATvvo9HjEGgKFSusvFUM=;
 b=ls0TyOjhlGd7aqgLL63RYJPjagG4x6E6O5XRg1x5wRtdO83Q3DheuH7/st8ptnYq3iO8oFdEZ00/3vj6g5kTkuMGYJwi411yDTeQLJcrB9/no5qG49PYxZgGlRhn3XscyQYFQgFh59+642E3WQfCIC0wCXMRnyuULSyOen8uH/wC2HI1m9FdSlAx0GQosM+34+bMzUhj4vMJgcVu2toUORWal8Op8K0VVNIeiAteUlZWTMQdtu8/5rktWbffl8MShwV7JyNRKAhWANpuV/QGrpKqfLMMXwOCvKYQWKv+Zf4pW88qSQj6mXjdrTdJJCm7JJjJX/PLD8ORNYoMCUpTFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 13:40:13 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.019; Thu, 9 Mar 2023 13:40:13 +0000
Message-ID: <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
Date:   Thu, 9 Mar 2023 14:40:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Content-Language: en-US
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
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20230309071100.2856899-3-xiang.ye@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::10) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: befe4798-c276-493b-98a7-08db20a3cf7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2df784DL3cMenZ+ZhPFQmkP9pMUr32qMKVkimIslIPq8QWycOrjkSp7F3fJnts2YHmsiOxfBCE1hJaGVTY70BkNq83kDL1WLaPzOTqm/XO4GdCO4Jb6o5XcPaoEYQpp92YuDtSeBkJ5BjYhI2kZNDmGrffGxC9N3vtPIcYxPVnmKBNtrzqZatXDZdRxqbmagh5EmTGtrfcSPGvGL4CwDzYkRT9ZJnx+GVCfC4td8tuS7FZ9thC+d8R8lZYkbgO3u3KdaiqjIOpe0bQY+f+Tu4b6exuK34UmuphhPi44iBd7n1cevXjBVa9/IzirXqyufmKZSfvX+bugjmLrKXfthbX65WKCDEj4OlOmUCHNc4yJcCsw8NJHQWcoOZblkPFhwQbYX1Q7TwNGVakIhLl7Nqecki7ZofqxcWzTethLu3rG7D87vdV0lO5nr5gvPWRqe7xPAoChDmX5TeGEkb8r/oXbUNfIA0xpEUFDvPeHWk18XzuShF7IVpkFdf+xmjSXpuc2XTNZR7opAilQg0NSpcbKrnHi0trLE8WIgs6qIQ8+f4dMSJAIitJTiaCCn7ONvGVOR6ngGHXfrLCDZO2P9pFkNVmJsklEnSBA/OzKHaEBAL96uG9dp1ivNz5y220UXuCtTu8M9d3iNoV1AN8OnL4BBqig7ixx7NnAqMDcoYBaHvGSrMdYnMM1bGDXu+ePX9YfD7ByN7Y55bYlg6jLABFDxcDBfuFGS4f3gI4gyVULfal1sQW1IUt6+fug7R2jZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199018)(478600001)(2906002)(31686004)(38100700002)(186003)(2616005)(5660300002)(7416002)(8936002)(921005)(6506007)(53546011)(6512007)(66946007)(66556008)(31696002)(66476007)(41300700001)(86362001)(110136005)(316002)(83380400001)(8676002)(4326008)(36756003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZ1OGlzVXVXTUxLbW5idW9wenltR25rS0pjbTl2SWt5SklpS3dsblRBMTcy?=
 =?utf-8?B?cllxSnd2Y3M0VGNvK1V2ck5HKzRHWFE4OWhTT1lTeVNBcmVKTUtwK0txVHh4?=
 =?utf-8?B?QzE2bHFscklrTW1ELzBTVjNEZERNTFY5SW5sUDFGUkl6cVRWYkRpdHBWYVI5?=
 =?utf-8?B?WHhZVmdnT2ZJblhNNnhybUpwZTZram1YZUFLREhvSWpDNUk1YjhQQnZHWWR5?=
 =?utf-8?B?U1Buc3NLQUFBNUZGVFhvQUpOeTd3UTl5UzMxMmxKM3lTOGtVYm1RdUJDcVlS?=
 =?utf-8?B?WW51VVFMSXdzRmpuY1dhNmpCWHJka0F6bjYwc0hyTjFRRjU3VXJYYzFCR3Q5?=
 =?utf-8?B?dmFISlN4dnNTK2wwL1B4MGY1RkdwdUxLbm5GV3d4Rnl3OVFLVUN6Z0NuUUxx?=
 =?utf-8?B?Y1BRb2ZtSmFhNVQyQzJxWHdVSDVXT2h6N1hTRklVMEtwdE5KcU5lRVNmeFlW?=
 =?utf-8?B?aWdmbDVJZUdXYXhaTDlBdVlHYkhuNDUxdlN4LzVmTTVxRWNTYzhhajEwd0N1?=
 =?utf-8?B?YWZpRWJwOWpuN1pMUFVMWW9IUXBvdW01RTFuMDd1Z2V1Njh1dkRlaWMydnZ6?=
 =?utf-8?B?bjRsM0gvT1VIU0dnaWUyb2gxUTVvV3FRNVNpNnNha1RtMjVFa1U4ZFFzVWZJ?=
 =?utf-8?B?WU03NXFPbFV0bXRRek4wL1hQNDc4TmZpa0txUjBOZHdhVG5WWFpaVWpoWEQv?=
 =?utf-8?B?ZHJpaitSTmFQV1B1MG03WE1GK0YxYkhtdjdrWWRQVmYySGptaXZuSHRsaWtU?=
 =?utf-8?B?Nk0rZ1hxaUg1T1paWjNuM25lalBuRzhRMVFBMXRxZ3ZsK2kzRWFUNE45Nlpv?=
 =?utf-8?B?a213NmZUK2lIaVhzZ05QL3RtNGtubVpiYmphMXlwQ0NLVHR3WW9DUmkwdkZG?=
 =?utf-8?B?QUttOUovVzVKWVZ5S1krU3RCSXAzanQ0V3B3WTJZellhdW5QZWx5TDZkRDRB?=
 =?utf-8?B?eGNjbzQzbXJIbU1rSDNpQnZqVEUrd0lOWmVTak4zR1U2WDlNT2RrU29waEpE?=
 =?utf-8?B?cWFKN09zYXFQYzVVZFZibEswNy80dURaWjR2TFJpV1Rva2o4NytpVnVYVVR4?=
 =?utf-8?B?bXFSeUkyQTVkSStBaERVYWxxUHVLV0JSR0txVE1xNG0xMDMyeGJpVEJyRmN3?=
 =?utf-8?B?ZmZrVDk1RlppSUF4SU5xVmRWcnhEcWlLM3Jacll0ZUZFTjUwK0FNT2RNMjk4?=
 =?utf-8?B?U0dKYmJSOGNrYWlDQzErSi9VNVVRcHpkUXFNTTU0N2d0WDFJdUFyeFp6b1pH?=
 =?utf-8?B?azNhY0QvQnRuZ09iayszc1hMM2l5b3R4VHJQOTlZaVMxNGt2Rm9WbjNTUzlm?=
 =?utf-8?B?R0pOTjBEWkpYNmtRNHlQYW5YazloNWlKa2FkUmlobGRKUERHNjQyTS9DK2RK?=
 =?utf-8?B?eldZNGxEZWhJZktvNEJDYmZyYXltQmsxcHFEZEVFWlkwL0RORjNWOWNsV3pP?=
 =?utf-8?B?WkxLN2FEdDd0WmNDYUN0M251WTFUNXhBaDJwbjRRWFRuMXZ5NzZCWHN4OEE5?=
 =?utf-8?B?NERFcjJ0TnpCQjZDSml4OWdiVzQ1RkxZRXExQVNuU01iMDhHZmN1R1EvUC9a?=
 =?utf-8?B?MnZnbTUvT0ZOQUxjZmZwMVBSMmc1YzdyVVdBMitJSVNhdnBNRE01bUlnS3Vu?=
 =?utf-8?B?NVFyNGtUTHc4MVpHZGFKVDl2ZS84N1pwZFAvMlRXQis0elIxR3ovZEFhbTlN?=
 =?utf-8?B?ZmNMclNCdHlaSEx3a2ROMU5EWlhLQStVWVdvN28zMVdqUlN2Z3B2SlArZW12?=
 =?utf-8?B?M0Z3R0dHc28yUlJXRTVmM25rVWExK3Y5U0JzRTN6NG13aitacDJSdjJNdndn?=
 =?utf-8?B?c3ZSTW5FakYvNUw5UEVyNWhiSXh2UkJKdnlmb0gwQXdWS0JEUjJpQmFUWjVW?=
 =?utf-8?B?TjFnOCtLRTlkRUw0ckNpQUtHVEVaNmlialhmNUc3bmRlM2xzcEo1SEV6WWdv?=
 =?utf-8?B?K3d5LzlsSTg2R1Rra0xBZFJVTWE5ZitnSVpmVXRPdGc0SVBrTlpvWnM3SzVm?=
 =?utf-8?B?RzFObVlmdk5USXM2ODJiY2JlK1pER3ZPZVB5WGl3cUZEcE82MU5jT3VKMzNu?=
 =?utf-8?B?OHc4MUg4OGxOVSt5YjVmbUVUcTJmTzlWdDFVOGhJK2g1em9paFo5UExOSlVo?=
 =?utf-8?B?SVlXZkZhZG5pSkw5NXNyL3NEN0luc05uU1p3V0orL2lXQlV4ZEkvajVuVnZp?=
 =?utf-8?Q?Iz+8ejdT8POzuNGujCTIqy4a/OyQR0eELBIS4be+PCME?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befe4798-c276-493b-98a7-08db20a3cf7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 13:40:13.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH2EYmlPhuSxURqPs9dVFvQf8rLex0u/FoANYh+IdThhkWgfbyZTnfMWA5OUSsAZlxRJwyNc3irUX78ECWZnyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 09.03.23 08:10, Ye Xiang wrote:

> +#define LJCA_GPIO_BUF_SIZE 60
> +struct ljca_gpio_dev {
> +	struct platform_device *pdev;
> +	struct gpio_chip gc;
> +	struct ljca_gpio_info *gpio_info;
> +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> +	u8 *connect_mode;
> +	/* mutex to protect irq bus */
> +	struct mutex irq_lock;
> +	struct work_struct work;
> +	/* lock to protect package transfer to Hardware */
> +	struct mutex trans_lock;
> +
> +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> +	u8 ibuf[LJCA_GPIO_BUF_SIZE];

And here we have a violation of DMA coherency rules.
Basically you cannot embed buffers into other data structures
if they can be subject to DMA.




> +static int ljca_gpio_remove(struct platform_device *pdev)
> +{
> +	struct ljca_gpio_dev *ljca_gpio = platform_get_drvdata(pdev);
> +
> +	gpiochip_remove(&ljca_gpio->gc);
> +	ljca_unregister_event_cb(ljca_gpio->gpio_info->ljca);
> +	mutex_destroy(&ljca_gpio->irq_lock);
> +	mutex_destroy(&ljca_gpio->trans_lock);

At this time, what has made sure that no work is scheduled?

> +	return 0;
> +}

	Regards
		Oliver

