Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB3F7B1827
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 12:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjI1KTA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 06:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjI1KS7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 06:18:59 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECA79C;
        Thu, 28 Sep 2023 03:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8c077CpXoWpwjkIGcqAsfeT15OJqDn4kZr2VlLY+ANYEnaxlflokIzdArhX5PK/FBoaaDtoOEsGQuhgiAAPBBV9NIBcWjjZ5xnH7K48QIF1W799RO1quROJ5gDw25Iyy38zjadUcERI2j3Sc0wv8/5o7+8FeFPBlae5pmyAGW0vv7xnae1itlMYlkRLZmx6LCaIR8VH7G+adl7GtRoeZrkbw7TiO6sjtlTi5qFVQLzQKPKeBr2VLFZN3h60ER8Mf6SzzbfDJAZo2un2qr+zXanxCbbkrsSB37XtYT5I6w3Sl5gO6PheTbjaiXe0sQzPHOg5Vuy8VHRBQCsBnXq6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VayyAcTwBmHFjeQszHVSBjVTqTJQIVyWEJ4M7t3uPI=;
 b=AVbNKVssIAEmYbmOwnlj2V8bVrAnZz+6oYrnP4dVT8DUjQ4N9v2VKKGVvw0jDf5dBvoiFvcvQaIu5oZHlCxP5823HB8Vng+BA/+8fqgnfZdnjSqKk42inJDl0MqzBi4firIHfjFPdIRMQTaO70IhR7NSV/7d/KiXsgSkBzd4oIffLzjG+pmpaaBJ0YzWNKrdaeSlS33UKmB8QDf1gvFPTffPEsN2isPa+ppKjCjQ9yEa7MPrRevM8mbm5kcS3oJqjF4OYqr6DD0LSpCDrdT6TyuReyJK/R3dkpzgIMHaQ0f6VpfL2Ktlvr0vHu10WVzNcqkDEbytgX+N4o2SC8vwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VayyAcTwBmHFjeQszHVSBjVTqTJQIVyWEJ4M7t3uPI=;
 b=t+72ayf+OKCmlvCn85Rtc0zla+g8ezvMfD44s3TVv1zBdyd7p7SHi1f7EheX/uRFJC/q17C9yg/cYwQ9J4qSZv1eDNvOZ3UjmRcXYKVZGpFo5Hbk7KdfX987gPxJ//L7R83EYYfIZx38x0tZwFurCzaJVKcrzOKzgOlcPFgVgDqmLG0KCVqS0vvReQ5ktqY1sqahUEVRBlTh73royloc87reErsJmm7IvSerqhAsX0/PTqWqAazyawumGM2DFXNsj3OQHxxEOsED3kwsDfFtWeSerK5g7QvisTpZmJCeIgWHXnK5WQAeblIwyVjBsfpBHhX18wHeZ+QpwOb85jL+Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS8PR04MB8295.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 10:18:54 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::ae2b:2be:9625:d810]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::ae2b:2be:9625:d810%4]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 10:18:54 +0000
Message-ID: <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
Date:   Thu, 28 Sep 2023 12:18:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wentong Wu <wentong.wu@intel.com>
Cc:     arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS8PR04MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 681e3c30-cbe3-4af9-c1ed-08dbc00c50f7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jn46+J5CKND+MqDv7UaPyqOPscTVdBdFfwIGWIlf/R8hoyqcW0apNMn4kL+a7Wu/4xZ1PS4iFoWmhmSMNtN+kVOurYfmers+e7HoJstFYL8f9ZinkCQtL6YgplKrrWt3N0yNAPy6w9aWFNMDDxTBiO7XPAMCS7UTUbdeVSR8AiJzb16GuSKK/xzWvEv3pOjySgoSpH9t9LOzEpU+ItyHSwoWJU4wBnrxFSh2WCqfqNegjb50Snjb35tBPZveLkHNc3bacmsiuBKitJ0pbiwST/rNVUKtkIg8BJPc5lazKiqAgLvr/wzSm6ZXrK5o00bGrxWfsb3mO6RzMQkSBelqyGrUQsSMVTldwlhgU7EV8kQouU1PycLpq0o25BuhrDzQacaopVUWsTWYjvubPK7Jzbib0C+RQnzd7EGaEMWyFcOd+l/s6c9bMmBkfYxoVMtw5wv2amroctyb4Ka07BF4cos83g8sDphRJPIlNc6jJHBDbr5dmp9fipdJRqArCCvxspORlaZUWQh88WbI0IYAhL2knPZaa9PLPUosW+A9GtCHQL2ClZ9EG82AUymznsY0k2+hUmyFG5UGjzWZD9lc/gByQFjcAGUYAE8Uh0wH4VkfOnYRhxQiYr1luDZStqhPC4jfR3NBjzhxBzw09xS3yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(39860400002)(376002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4744005)(31686004)(110136005)(6512007)(66946007)(316002)(7416002)(2906002)(66476007)(66556008)(41300700001)(8936002)(8676002)(4326008)(478600001)(6666004)(5660300002)(38100700002)(53546011)(6506007)(2616005)(86362001)(36756003)(6486002)(31696002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzdUTGJNSVJaM1JwYk4yU2NnVUxJWmppWmZYTTQ1U0hLK1k0R0R2aWJwS1JN?=
 =?utf-8?B?ZWRVRnBmZzhDcFgxSHBKQjlXU3ZTcmVqajNWbG8xV29KVlovZU9LVkg1U1pw?=
 =?utf-8?B?MVNjaXlYbHpzUnFNZWh1VkNvcDdURkZzZ3J0RTZ6Qi9aUUw5bUc3c2ljR3Bn?=
 =?utf-8?B?dUtvdVFXRW5NcWVPMzJ4TWg0cVhMdTlObmZzeHFoamxuOENSalpDMjIydENw?=
 =?utf-8?B?dmxpK3YwYTY3TGdZTXFzcVY3RmFjR3p2dlk3Rmc0QXNYK2ZGalVMeXdXR1Vs?=
 =?utf-8?B?YkFzcFRoemZOdkRlYnIxZS9CcldncFBHbFdzc3AzS0psczRaOStLb3NITGN6?=
 =?utf-8?B?aDgwZzRsSjZodWpORGU5MGQrdFdPSmwzeU1KWDkycmRIS045TGRyTW9uM2wz?=
 =?utf-8?B?NXNIYVpNRU1jckJJRnd2K0w0TURqazF4dmpwaE1uZkl0aW43WGlmM0ZERTBq?=
 =?utf-8?B?ZE8zbmczZnl1YVZsTjczUm82Vi8rdEt4M28wY2gwMEswOEV6aHN3ZmNuQ1A1?=
 =?utf-8?B?dE1BTEYrcmZ4by9PaGI2dHdqZm16Tnl0MTVIUTBIM0pxZ1NNV3BSMm5RTGY5?=
 =?utf-8?B?UHNwRzBreXhaemlNTEpSN3BTK3JNRWxReStqbHM4Z2h0Z3pYM2RpMEhmZ09z?=
 =?utf-8?B?SVZFbFB3KzB0cG1tK2ROakdmY2gvMnU1RWlhQW94cEpYYmtqaEt5QStsMFdF?=
 =?utf-8?B?VzVwTUdWYlk1UFBabjIwK0VOSmdYSVBOeHErbXhyZlhjZE9zNFhRTkNpbWI0?=
 =?utf-8?B?eFVpalplTE4rcmVQRHE3NER0L1pDRkdjS2R0c0FJVC9xZFJPVTU5NDRYWllZ?=
 =?utf-8?B?TnRRLzFQZmFjODZkd3VLTi9wWmtWRmduZFZlMlYyeFZmOTcyM0lGK3Q2bjQv?=
 =?utf-8?B?SW83TjI3OGNKMi84aWpIRVJlNjJDRW12WmJCUE1rOURCNVh3NFBUaUlYSGdO?=
 =?utf-8?B?a3lsbXdqZGtXTE80RTZhTWdSVXQyandrUnc3c2o1ZWxmVXVqMmZXVkNUMXB2?=
 =?utf-8?B?MFFGMFc3Zy9DV3ljZURJaWFLVkVnUERLaXZSV3Q2cjRzdjFkVUlPUGVoZEsv?=
 =?utf-8?B?aVRWdHNMZUJNUzAvWm5WQlU1YnZQSUFiTVU4Ky81THZTQ2NXMi9DVVc2aTZp?=
 =?utf-8?B?S0JZeHJXdnpneitnL2JVazk1YUdsZS9paG5NRDlSQTY5QXNWNGFYMnlKT2lz?=
 =?utf-8?B?eEZQOTNXYzNmelRBVHhWbldwMC9Cc1JydDJTZjZwTzBVYnhsRDMvYytUM1Rl?=
 =?utf-8?B?NGd1a3E5bkZYY1BwWlJ1M2k1dFB1dWdwMUdWZmpEN2ZRUjk5OG9Vb0pwdllz?=
 =?utf-8?B?c0MzUHBiTFBJdm1OUnpCcEpIbFMzdnU3clhhdm84TDU2TytORjZtT2t2clpt?=
 =?utf-8?B?UFROdGdiV2g4elBmRTRJeGNjR240ZklmUDVNWC9NK2xzSG0vZUNwWmxpREQ5?=
 =?utf-8?B?dzBDdzYrSlR3UG9Eam5aaEk2ZUlPNGxGU0praEp1R2w4WWhCbzdUci9VU2hr?=
 =?utf-8?B?a1NMRzFaakdoTHpLSElNOGlIandJN3FId3dSZS9mS2FrOU5yZ29zSXBJU1FN?=
 =?utf-8?B?UlZXcC9mQk9naTJkWnpOeXllSGZjek5SME14eUJCVjZLclhmTlBUNlcxc3hS?=
 =?utf-8?B?VzBvbm9qbEhZYWNieHpoc21sQXU3aWQwUW9mSW1SZDBaL0o4cXdkeWZwZWR1?=
 =?utf-8?B?b0dtaGtaN0xkOHM5dGo1VXM0aEhQWDVUdFFXYXpEOTlNdEF0UDU2bC9oQWp3?=
 =?utf-8?B?VXZMVlc1ak8xa2hPaXAyaEhXRys0RGwvVUx5NGJZSHJZYXJCSmNxdWtHMEpD?=
 =?utf-8?B?Yy9iOGU4ZE4wbmlNekdCUmRpb1ZtMnF1M0oxY0VkT09VcXdoMGpJNm1JeDdp?=
 =?utf-8?B?VkpGdnd3NzRYYW15ZEU1K2FKLzc3RjFmUldIRUNySUFPbjRqbmpwZ0llOVlK?=
 =?utf-8?B?OXBDQ280aHVFTjRtQWJpSlVUaVlscE9TeGNFWXBxR0MxcVllb3RXbHltTWg2?=
 =?utf-8?B?QmViQUVQRUdMU0tVQ0pYaEY0RnNtekIxTzlKMmhlM2NKTldidHJIVGJmVWVj?=
 =?utf-8?B?K3ZGaklwQWd5NzhzekJCKzRWb05lZlpGcm0rNWUxRWtCQmFUaEdheUtSYThP?=
 =?utf-8?B?VWNBb1B2L29yamUvSndGekN5VlIyK0dNNjJ3WWpLeTZQd0Z0Q3VQdVBDZXFU?=
 =?utf-8?Q?lpKKS7yWiTPKfYvJdqj5Yf6QOJxsztTQqdMUnzo882Fb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681e3c30-cbe3-4af9-c1ed-08dbc00c50f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 10:18:53.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LT8zDcQ7gGkUIHpU+nnDx0GWdmWVqja9AHrCmyvbR3FlSNk87jVGKYAX/rcxP/tF+R/qhz71Rx/27tIpJR8BdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8295
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17.09.23 13:26, Hans de Goede wrote:
  
> Note I did not ask for a new version to be send right away, but
> I'm afraid there has been a bit of miscommunication and instead
> of rebasing the next version based on further review Wentong has
> send out a new rebased version immediately, sorry about that.

Hi,

what to do now? It's been ten days.
I am sure this driver has been very thoroughly reviewed by now.
We are dragging this out. Do we want the developer to do another release
or do we ask Greg to take it as is?
This is becoming almost comical, but that is not what we want driver
submission to be.

As far as I am concerned on the USB side everything is fine now.
Hans? Greg?

	Regards
		Oliver
