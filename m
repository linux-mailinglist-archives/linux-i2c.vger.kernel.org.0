Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C9E79E2E5
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239183AbjIMJDp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 05:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236929AbjIMJDo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 05:03:44 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C981999;
        Wed, 13 Sep 2023 02:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYwGOsm1epW3nh+wkSRjycB5Eree0jFDwkDZMnw0qKaqKwCXAHp045KZmJYBH+4V0x5BnIMgBzB01FVwb5XaYDXNh0VGT/VVwXmMKKXJjD2YcxARU1KxTJHpSISqpHdI0RdAhSWvT2Q9Sq8hcU0SYWLXZ/lOpNc3gAfHfaOtquSpf+dO5lyTZ5G+fwRnWgxMF0lGKl5BVt9yZ6uIyvrhgypfa87Sv1VTBb+asNRHldMnBhsGLnrjmPz+gywie0eNeS86urT6rkKwEEgoJNzq0tZk2TQbRAJ/VAy6DE8ECZgpn1e8KkWvibndQlHSBXs7tMr+Jrflftw3o8tLuec5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06ifFsRjV6Z+WBvcnzrCqn+tMldI/1dlAf8O/lWipfA=;
 b=cRty3FNsOX9zp1sdrLfBJXZv2+X4qHchnXMJ/ZeKrjZa4DASpFjpIpv3ShgAfSzE2yJ18ClyCmlXzDeDXDH81p01N/2Tn4NDDkotqL7Qx1INEOhUV2m3383BOVO7siw6YbP7xJ9X62OZABklBNXVIswpwbjK3Npq4/GAsReS5+3UVMUsamar202tm5kpz1BtF1eHdQZAgcStRLxD6BF9rEhvnOPzI7O2Oj4VgPFYqpbtU9UaZFaPIB1OgoYnEHXPEIiRuqLRkoqz7EajbYd+pjKYwggdZm1QHwlY5BCwnxLIvzKuEh5P4PY4xzga8g24BAIWrNHCgR5qLNA+3WxkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06ifFsRjV6Z+WBvcnzrCqn+tMldI/1dlAf8O/lWipfA=;
 b=vmgMAT7YUs1u/gCZsXt65mFDILx4RVmIe7NRzuIMmS28bi9ZC2DT5QkZSIwp1WHnGHPfLY6s8eMgEyY1lwl2SV0B4aPKjteohrxHCjZvXmTTYZitc4MFagTSgklYTln721AraNQXTSJ0OT5U+iidBU/D4YLz7hvu86AbtG3J44q+j3vUHfKYviljQeRHcx2ZHojqlIZTN3Nfgj5XsCUWzRcQ7sPHekj+9rdO9ZM1LUiM0Qyt44FIDEbpy0snikKQYtxY+EmfJhAmJxVjr9MrI/+viGM6FI6cp0rqCwA5xcUTtCKQgjsalN7HcnszG7sMAtno9z9zefaYa6bjozeNGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PA4PR04MB7536.eurprd04.prod.outlook.com (2603:10a6:102:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Wed, 13 Sep
 2023 09:03:37 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::cc91:7bb7:2f06:1cb2%4]) with mapi id 15.20.6745.030; Wed, 13 Sep 2023
 09:03:37 +0000
Message-ID: <a3b75e11-9cf0-4ee3-be90-fba73bd5df3d@suse.com>
Date:   Wed, 13 Sep 2023 11:03:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/4] usb: Add support for Intel LJCA device
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com
References: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
 <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PA4PR04MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 544a5dbb-1aa1-407d-a3a9-08dbb438509d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tq166y4M8MKXmUfJKhoO3jZFJQCv7ya9XLzS5LeLNn8NmruFC9woPsGiYb/CTC3lZvYgzscltxTsFfZTa23R2argD7qPI9SMDkjDxN7wQzMP5HwhkWWAbT2PuzAdrE9nSWbx0tknxMHq+NAo6W33zyBE6CxPydeSZm5YaYtjC7iYrtt7KwansaMQo13x4LEQp61DLj1dm+5QUtZELlyQwViRf1onHsUQEa+WRm4M0LPuFsR0v9cY0wVqLEYUYyEe36Ww7DvTGi4Bs002vEM0lwa5BuuP3pE+VHNvzBDu9XDeDYgLeznwIqYoDkyLiDIfjShdx1E47niofTi4FkkFSxGcRPgrNchedyu1oFA3Ay2RlLIJ4P+9QOG448aNQ9/+ATo5Au2vUuoO/nw2KsgUXdUKGukpvFL4DEwkq6DpYhKvd2IMSl9i+7654Ff9SqtsvEs9OjZmFr0RpjyUl87+uv5N04feZcJDKIpeb7Xgs05Pc4lf3gjQucPQU9t/azXqfbOZeHUNAvgWfdPJdjcImyd1Kkxv+JshJUZaOtbf72KK0lsyFR3iGK00jZy703EARJPTa5pMJxlpR2AVwuWXbXxPOz9otKJcHVvL0R4VjYi5ybEBPJevjaE7UD2ZazffsLyQs+/nr7vFzNuJ3KRkq2zUVjgUXXwY3IGx86ap5dc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(186009)(1800799009)(451199024)(53546011)(6486002)(6506007)(6512007)(6666004)(83380400001)(86362001)(921005)(558084003)(38100700002)(31696002)(36756003)(2616005)(66556008)(66476007)(7416002)(316002)(41300700001)(66946007)(2906002)(31686004)(8936002)(8676002)(4326008)(5660300002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXR5RE1pOWM2MXhJaG5rSEkrSk5ZTkJUcjBMUXd5d3o5R1VkQXZIYWlRL05i?=
 =?utf-8?B?MVoxQUFINC9LbHpmNWlmb2hFZ3N5cmVIbW5SM0FkQkZGbzVCMGRzZWZMVmZE?=
 =?utf-8?B?emM4RzBQbTh2aXJtWmN5M042dHNsZHdSM2lpTW9icEc4YmtoM2dEblI3QXk1?=
 =?utf-8?B?VlBlTDVJNVp3V1NjN0tlQ0FDa1A1Q1o5bjVxZUJUWmc0WUQvRWFCRkFQNmtX?=
 =?utf-8?B?ZjlUeGxHb1Y5RVI1Mm5iQ2pLaFlvRWt6eFluU3FyL0xwSWJSQkFJdDZyV0o4?=
 =?utf-8?B?MldWSWN1bFdHZGwrd1o4NC9WaCtmMSs0VDl1ZzR6aHJBNXpycEhQc1ZpQ3dx?=
 =?utf-8?B?RndTL1k5QnhaNlUxMU52ZFp0Z0hvYWEzZzRJendFRzA1dTNFUDh0ejRKanp6?=
 =?utf-8?B?V3ptbnR3M01RclY1THNEZVVsd0o4alJmaHc4SlNaLzNncjRnbEU1Z0NUV2x0?=
 =?utf-8?B?NHVLNndwajFnQ1A2YXpNb04vRGdLajY5M3hjcFNMYkNoS0V2aW1HTmlVbVRD?=
 =?utf-8?B?b2trcmRVTTJhOHZOUGdTdkora1VZY0ZSdFgveHM5SGNSSzliMldUME9oK0wz?=
 =?utf-8?B?OUM4ajBMNkFpdjFraGtMK2RsNkE3SDFBWUtiSitJQ1ZMdFpDTUk3RTBNVTln?=
 =?utf-8?B?SWFRYWpIb3c1eDBFRlRxV3p6cHMxb2piblB5THFuMmczOHVFM1F4bGRORlhX?=
 =?utf-8?B?VGY2RXdjcEdBQzA0UjQydXVHR0xQc29kaUdwRHhwY2plS3JBQ3dtblExdkVT?=
 =?utf-8?B?WmlGTXpLRkN1TGdSWUd1MUMreXBqMUtVSGpWM0JVNTFjSEpCZXdENHRMWjRL?=
 =?utf-8?B?MVdqZFlseXV3V3BwVEhNRVh4M0JhTldDYWs3ck9GYlE2UVlXMzJRa25nQm51?=
 =?utf-8?B?M0xDZVM4NnJQcm9lZEROaWVBVU9wODlNUzRibDNSMHNTOC80WVhtRHFxK3Ba?=
 =?utf-8?B?Z3QxcU9vRk1SUkUwdnhockVBUk9vdlFGL0ZqVzJIUG1obTI1VTVUMWFySHVy?=
 =?utf-8?B?S3M0ck4wVjFYd1U5MHZ4Y2I4dmgxcHAxOE9sUTRkSHhsUFNKaTZVSDVJNWh3?=
 =?utf-8?B?cVFHWHh6dkNTaTZQODk5TnRBQnQxWGxHaUxhZG42MlBvcDQzYktpbjlpbVFO?=
 =?utf-8?B?OUJBY3RNTFdmYzhyWEVqV1lDOVpWekhJOWVrbDJCMHhPWTNpdElWbGZqQ01M?=
 =?utf-8?B?bWc4VVlhQTBqc2hqaGxUQmk4WTcvOWhXaWFVSHZYYTBvcjNmZndsTjMrQmlH?=
 =?utf-8?B?d0dITTJYWkV4dFVFVEF1N3IvUEJEaEpsQk11RWo4cm9xTjFvcGNObWkwR2VG?=
 =?utf-8?B?S3JBUERWT05MM01zZ3JRMEYxeWpwRzUvT1hOcnJPeHVWR1pwdm81TmpDb1Ay?=
 =?utf-8?B?dkNETm85allabzl4S2Y5QVk4VHdiV1BPRXc5M2p0Sk8weCt6S0JObi9WU0Z3?=
 =?utf-8?B?V2JPaW8yYi9zV1k3Q0pNQnNETEQ0bVh1bHVQQUJQb05oM3R1MEhuT0hHalpO?=
 =?utf-8?B?Smw2ZnZLakhHY0E0R2Y3RmFIWnJyTjVXQjhCVVR6WFR2dlNSZWpkbHczR3Y5?=
 =?utf-8?B?L0MvdmtVdWxkS1AvcXluYzZobEYvaVEyTndZTEo4SHlYVEIvL09naWk2NVd3?=
 =?utf-8?B?b1JQakc0T2I3RnhhYTdpMmxwNEN5ZGFQeFBIUXBTdmNBazl0QVNqTHl2b1pO?=
 =?utf-8?B?QWFjVjF1UDdRR1dmL3ROK2RmcnF1UlRqMlFyb09ERmJHalMySEtNeWs2TXNM?=
 =?utf-8?B?em0xcmpaOXpqdjQxRzFRYjltZExwNGc3dEVzNGpHTmlZOFc4NEpSME03QnFX?=
 =?utf-8?B?ZkJ2M1pOVUltWS94NzRuZzczUlZwWTg5cElBaGt6d3NXVWdOREtxZC83ZjlO?=
 =?utf-8?B?Y3RTd25NQzlIL2EwZWF2SXZpcEJXZU1KNDUzR3Ryck5PZ1R2dlJLRWUxUzFK?=
 =?utf-8?B?ZXNCRUtXUjdsSitOMnBMQUZtaExNd2VsaDhlSUVJRGtIbTNXMjRrdDFRNCtW?=
 =?utf-8?B?bUdSUndZN0lEcDdIOHViTFM1SGpyN3E2dzJMMW00RFd6M3ZWSmcyMUc1NzZL?=
 =?utf-8?B?NzdkQ0NUTVFkUDdXY2FuRXc0VjZWbWNLMnZOdTFvMWlUaFBjSXR0Mll6c3FM?=
 =?utf-8?B?L2Q5SnBHZzRQQ3BXcUhMWHA4L1JRRzdQcmV5ZysvTVY2bkJxeXJxbEdBVGFx?=
 =?utf-8?Q?CBmtm/LPVokXJzLMDDYL8dw/lR+KcL9IbXqr8E2OZwLJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544a5dbb-1aa1-407d-a3a9-08dbb438509d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:03:37.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efKCT05i3nyCaOx1l2ggR1RoNJF2Tb9QyQjC1rXkD3k0F3Im0J9mcX2rdHGIu253K0I/aAaHTdUv9+Nj4+rMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7536
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 13.09.23 03:40, Wentong Wu wrote:

> +struct ljca_bank_descriptor {
> +	u8 bank_id;
> +	u8 pin_num;
> +
> +	/* 1 bit for each gpio, 1 means valid */
> +	u32 valid_pins;

No endianness?

> +} __packed;

	Regards
		Oliver
