Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413F355FFBD
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 14:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiF2MVm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 08:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233015AbiF2MVl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 08:21:41 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2123.outbound.protection.outlook.com [40.107.20.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D668B2FFF4;
        Wed, 29 Jun 2022 05:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Riygj2lVtSMQqNnkRofsy03+RK1N8MsVyH/o+t9qVOUC5zaEZGOpdvTAPPYJJBXVcTdN5QCppbFs6AZrhTAjvFo3fOQddP0cRDEpJSh1eFMkEqCdl2/8iJqQA9fuNwFdLS3Dm0BsHhm6v8b55QPVFHz0a3Gr7C0ssZpf3dhTGdnudb4BJLeqjgJA0v/ttl3pfycZJZsyvv49Qh6Gp5L935ZQ93RvKWJzOrJ3Nr6vzV6EXbLYIpqby7MMmzwniga8iPAAtCrPQMTlZAhpXpkmAtotihDmVg280K6nXrYMilqwhhUQ1H1MvB+y3BddI5iNOxE1WEC0iTnZgGzL7rtJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nht4bUPW6h7t5YX0JiRNTjZXc34ZuVl902CrTcU9yig=;
 b=Bkd8In7BanwlDjJ2kePBcLp9GSdHk+LmwkpwCgwdOa4LnvT8klUdjczgLle4x/wpRTXgPEoJIrJ4Tp09WHa93Eli0wcUJ2G60RAlMCRvRxVGqZIt3ZFAhemLv7JO1yMwxnlw2I3wNjynrNQUbyQX6aAIZZakVWHmsQfr4E581VWExmFrFPsdFO9zLXu/aFyDrNFymJd6LkXb8RbGSWcHsYLr8aAL33zs3v9x+bdmVEXdHCbxvayMf3bbMpjb3iA7g9giPdw9AIoAhK14hiHoNum7Q0OIm5kDofX2wJjhy2cXQmTFPQNP/0X8625sdSrSfT3FTSvFbCM7FzS7clVDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nht4bUPW6h7t5YX0JiRNTjZXc34ZuVl902CrTcU9yig=;
 b=qMRJkSipdreY84SbABsTJVN5JH0VljcYRfIB9XmvckeKAstL/QNAmONk5aGBF88Q/RiwSlgx0EVXUrNwsgICHnKFQS6PS0jOSD/TdOlJ6oRJ1mWxotILzvdH0c4pjFFMBq/GBDKvsR4pkOHzBSTRCTSDPhpQ7oFKekLFhILvJ4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8177.eurprd07.prod.outlook.com (2603:10a6:10:272::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.11; Wed, 29 Jun
 2022 12:21:39 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 12:21:38 +0000
Message-ID: <ba4ea0d6-b134-c0ef-962c-0adf8b3c924b@nokia.com>
Date:   Wed, 29 Jun 2022 14:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/12] i2c: xiic: Enter standard mode only for > 255 byte
 read transfers
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com
Cc:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-3-git-send-email-manikanta.guntupalli@xilinx.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <1656072327-13628-3-git-send-email-manikanta.guntupalli@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0250.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::26) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20eb677c-0306-4fc4-18a7-08da59c9eab6
X-MS-TrafficTypeDiagnostic: DU2PR07MB8177:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7OAXvdCYuwcwQ6EYzRhJZcZgSLWRCYN267Qf1O+X8GnOMkeAnqN0OvW2VKxsSprA2akmZBRQNXvLr0XdQA2fXa1cPDXOnHjpfbeKRitBS4BkJ7lVKRNlK1B0bQ2CVPfDBANWnfrxC+zbn6M4Yl0K7IosmHLiofWio6dl/8SZ+psCkMSLnXiHSjgeL1OurQ8qsOkrcW3XPnKHpJxuKuQfFbIMB1lBbD5Ao0PPqwe30IAa2X1qrWnOtn7j+1XPYbtcC4T4jsQOMQAnpMNcK3HhGoRsTg9DDLfspXpGHrtDT/Y4kG6SJbRAq42Oz8kGs2K/1w/AGbqPxQQRPR+PzIfg/Xg1d4f8DRNgBScZDRMJUYd/nDSTOBRCCSzKLR6VWxd4ZVR50BimSeOlWbP3KgXJnKkE9CP7sgQJKJ1akzA3H6jz6wrrXx0RytWgRhHU9ylfOkSBbdTzukNp1Ex082hfG/y67//g6pgV4MYZKoGUUbMhFajMc3Zp2pYWiyBpn9AhPPAEAgIYRiu6/gIRPfDAm1fGnsFBxNAqID9vBWHJZ0jsAaNrwH0zDkV472lNrBAclJAsErdc4LTbiiazLqcScjJvj0GXIm5qTASAYQTT5NUVpuw4MJiEIvPxPJtJ9LChY4pwgZ5/qNjWv+mQ0aHzPgaMLZaFGcFzY5WjZoXKAd4jA1UcwK9vUfcMQrtL5cSj3iIvX3CL6mGwRn+kOUQtQwJLC8k+vb5ioF1ZuhpVuPNXgUT5YwwDPm8kYYiDsSLPD5ymnwUYhvzgg6cZBPAAqUlUGmsWhHdl9tk7v916D0xoX87Lp/OPJ6JWQnP1FshkJ+O82SYYhjkm2ojygjv3x2Sj4qxC7FwD6JHph0+dVjkBQgw5UkktQFN+wUJj39Y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(83380400001)(186003)(86362001)(8676002)(38100700002)(44832011)(41300700001)(5660300002)(8936002)(2616005)(4744005)(4326008)(66556008)(26005)(31686004)(82960400001)(2906002)(478600001)(6486002)(66476007)(6512007)(316002)(66946007)(6506007)(6666004)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHVqbktDdkZPVnVJSkpTaUU1WkN5a1dBSkdvdld1MURyQWh0Z3l3VmdndXdC?=
 =?utf-8?B?MEhGbzRFOUFvVDJpOUg0YWdqL21ra2tta0lOek1NZktKUFB0cnpHRWExNkla?=
 =?utf-8?B?bHFuTEJ2SDRMZjVzRm51VWhUaUVLWWxmZmpSWW5yUVVmanBxVE42WUNvTDlK?=
 =?utf-8?B?YlJCRS9Pa1BQZWk1QXJXT1ViMXVUQ1BYTWswSHBoazIwZlQrZHh3YXk4NEN3?=
 =?utf-8?B?NzRITStkbUoxVUtMallnVmk3cm1MQjB3aFR6c0VsaWNRM21pcHlMRDFMQ1RB?=
 =?utf-8?B?azluZm9GK2FrLzBYd3l1ZjBRWno3RnhJT2Nmd05QWUxFVVJZanI1VEYwNUJ2?=
 =?utf-8?B?R2dRdnl0bEV0a3hFWHJOWHB0MG9rT3F1RE5wMGg1NVhjYmU5a0NiaXFvV2Mv?=
 =?utf-8?B?aUp2M2tCd215bVZ1RmRNUno0MXpnRVdudklibHB2RXMvdU84RUtlaUc4Nk1B?=
 =?utf-8?B?LzRlMkNFemptS0wzT3BzYk42dEliUU1hdDJncTlId3h1WlUxblF1eTVQQ20v?=
 =?utf-8?B?NE9tbFlkOFBNb1o4MEtjdzA1Q2k5WHM1WXpySXdIcnAyd0JWUkVHcU5jTW9V?=
 =?utf-8?B?T0h0TUV3TjFUOGdVTHZhRWY4Z093Nk9QbU02OXR1c2dRUFcwaVNHUkVGVDkz?=
 =?utf-8?B?eEFQbkVCVTUxSkk4V25vcFJIZXY2TVNGTUxyK2d2WWdONUNiYjlldkk5T3VL?=
 =?utf-8?B?dEFpRU9lVStUTFhpOHdaN2RkeXN2YmUzTEQvWngvMTJjYkQzR1pqeGhLVVEz?=
 =?utf-8?B?K3d4RnU0bDhtZ09WVDdGR3VidHlkQjhXcEYwYzNJZWEydHoyT1Y5dzlhZ0Ra?=
 =?utf-8?B?Z3F0c3lLc2s0U1R4WGlqaFJXQXJULzlOUVZ6a2ZpdTRUL2V2NW9RcUNPT2d2?=
 =?utf-8?B?VXpFVjBXZ2kyekRCa0Vpd0ZjNldWL0pXbFk3YTNwVVRYWDVxcTlMUENncmdF?=
 =?utf-8?B?Rm5xWTdYM0QweWFhYy9oRWhabnRxSmpOMzUwbjd0NHdYQVJxT1JGNWs1Wm0v?=
 =?utf-8?B?M21qQ2h1V3d4b3phci9zV2FyM09DbysrM1Rhcm9OZXh4MHc0d0dBVTcyazM5?=
 =?utf-8?B?eWZ4alZ3d215RnFHcVE2Y0tnaXQrTURjTVVYNUJ5M2RQYXN6d3pOcGxoZEZx?=
 =?utf-8?B?Y09ZTFdjcVQwdVkwYWxmdlZLSzloeXpORnhuSkhrYXlLZnJoeTRHMHpFQUVk?=
 =?utf-8?B?d3ZYaEV6cm1jY2drcHFjOU10WjhCT0FDc0Z1WW13RWlGb2hKK1h1TmxuQlI0?=
 =?utf-8?B?czczTFhtTkNSUVZqMnU4ZS9Ncll2NTlSTkVXcVBZMFhBSHBmU1M2Qmo4T1FU?=
 =?utf-8?B?bzZHUEVJYzR0MVBzNTA3KzEyTmUzMHNBUXdoTzRlaEhTMCtuM0tzZnVqb1Jq?=
 =?utf-8?B?RzhqS05sZlBMb0RzZFVPcUFHb2ppRW95b0FsVEZlczdwSTBKZnhBVmljeEZR?=
 =?utf-8?B?NEkyRWo0RGM1L2ZPSmZYb1NZVU5ST2tETW1ZZWRhMktjMUtzTXBSVmZWbW9l?=
 =?utf-8?B?bGRIRDRmWFgzR2NyOWIxcGEyaGFlVldoSWVpeXN5UlNVcHVCQXZsTkEwbEJj?=
 =?utf-8?B?azkyZXFzeDZVcWRNUlNvNkQyK0s0MG0rQzkrVXlNTXg5S0dxa3hidkppbWFr?=
 =?utf-8?B?b294d3JOUEMxTDlSOFBYQmwyUnVkeHRkQnhrSnBTa085MXF2VXhDZmVpWVRH?=
 =?utf-8?B?MFFKeGlqNkFWa0l6VzZnb0o2LzNNM2xCUkV2NCsxaEJTVkM5WVd2eWRlTzBm?=
 =?utf-8?B?QkwvT1pwMVBTRGhCeVNiWW1wTUIra3NPSzE4ZEppdm1CUXRROVpWQXpnbDZZ?=
 =?utf-8?B?OEdWMlF2R1B1YlpxdC9hbEJXZHZsMGtyQlB2TUk5VENRMjRKYS91UE1BMVNz?=
 =?utf-8?B?dmk5ckFTZTRnYnpxNmY1KzFmaGM1U0dwTVZKL3IyZ3J3RGZUa3VCenpxMGtt?=
 =?utf-8?B?NnhhRkN4T3JjcUxaVERGRThoZmV0TDBpOHMybmZVYmZBZ3BsSlg2Z1FiclNX?=
 =?utf-8?B?dG8rKzc1bUs1UGV2MkxVbVptNlpVUWlDZXNQYkd6VjIrZCs4djdGVjJwOTRN?=
 =?utf-8?B?RnduYUplejB2L0JkZ2t3b29SRWJBeVdpM2M4aldMbVNvV3Y5Ui9iRVp3U0FY?=
 =?utf-8?B?WGdnbG5BMmlPL0xpc1lXU3M4RGJHd0E0NVZ5dVc1WkZNVmZwVzVlNks1dkx1?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20eb677c-0306-4fc4-18a7-08da59c9eab6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 12:21:38.9165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e73MtzM7FWKKqq3Itf5gbkE9aNdeZ0N+a3WNYouspnYXlcpimSn8pro3o8cEVVMr2N08bRFojqAM4cv5u/7gJox1agBUZQjlFLr0GcRdAIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8177
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

W dniu 24.06.2022 o 14:05, Manikanta Guntupalli pisze:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
>
> To maintain backward compatibility the default transfer mode is dynamic
> mode. Enter standard mode only when the size of read transfer is > 255
> bytes.
>
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>

[...]

I don't really understand why this patch isn't squashed into previous 
one. The previous patch was only checking the first message which was 
wrong, this one fixes that.

Krzytof

