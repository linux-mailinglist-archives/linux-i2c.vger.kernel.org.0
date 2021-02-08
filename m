Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00BA3141BD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 22:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbhBHV2N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 16:28:13 -0500
Received: from mail-eopbgr130128.outbound.protection.outlook.com ([40.107.13.128]:10025
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236617AbhBHV15 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 16:27:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0xnKCObNJnllRqBYRzaGZ6XEvqFd8okqLr61WFOl5pi7FYrJfgC2PBTSQy1tQyqNUifaJnQFr1tDPwwUnEceLlNs4C/wG3dwpNZOdWyO4t02tu28mtBMjevZO3Ma8fnHN3dZ7+cjbfwYgfzuSANOmbJqRjABkaTOxQU6KiDJSMSu3vZNO7jT7zhz/arWBZThvZ0Ii0YQbIcalsLGWCRDr8uMtS/N/2lI0/2hcKwZFYA7lnHWTQ4sMIG90CctI4BTAaivSCgid+3QHFvINurVsYvQ7ec+9UxNVNgIiMp3s6+ApCFBOBemxD1RExpv3fS+HWehWJjrc7PZUvRnM/1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itQAMxYIFIItQ+twOcO8bhVJOJjnPhoWpRy4GvbiZ6o=;
 b=ZHrDR+NhaYymSZ4Zs2WHzX/PwP/ZYgore6ZfEp2CcjyAOZkTvvrXowPJKuGtUbM+X4pH8O9LAObgWYxSq2QwkrMogt6XqnbvSTknNTPSgUWvzyRPnkIQeCXIO6dsvCfRFUzKwLpHhzUIU8aVMMp5r5IryeJydwFsUiuSQ1R/SQb+FCUsClqjXYFGpJ6r7z69suk5UAKrSiS0v8C5MbWmnTHylektWIIi7emWNkh20Bp4LvCEDDSyD18woMz4as5Ul5GJrslQ/UgewzvbX7I3IcUVop6L7cU+38eY8yziO6y0eNn3H6jgEOErhbN3vzbWkU47QAmVSv4yjA12GId46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itQAMxYIFIItQ+twOcO8bhVJOJjnPhoWpRy4GvbiZ6o=;
 b=grPWjlVdGA1HHryxZ3zCUQFtV/QC52F5KsfIraSjKj0u6yydp5FuwDnI0AlRY2zUX2mwX2fwYjjZajsn9sGvS/rFQ4rAbCMRbzJUMGMcy7Te+T/Yf6aw7/HdCfGejEj7TpmgW5flnMt1s1KFA5o/szQ5xZ7Il+d/bcikAFY6w3s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6245.eurprd02.prod.outlook.com (2603:10a6:10:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 21:26:33 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:26:33 +0000
Subject: Re: [PATCH i2c-next v5 1/6] i2c: mux: mlxcpld: Convert driver to
 platform driver
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210208201606.10620-1-vadimp@nvidia.com>
 <20210208201606.10620-2-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <7138121d-49d3-7e0e-c7ee-46d2636bf7c6@axentia.se>
Date:   Mon, 8 Feb 2021 22:26:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210208201606.10620-2-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 8bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0264.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::16) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0264.eurprd05.prod.outlook.com (2603:10a6:3:fc::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 21:26:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a64169b-f89e-4d66-20a9-08d8cc78354c
X-MS-TrafficTypeDiagnostic: DBAPR02MB6245:
X-Microsoft-Antispam-PRVS: <DBAPR02MB624523E7AFAA0919BEA737CABC8F9@DBAPR02MB6245.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yrTHIIwDZHJOZPWjupG+yEYyA+HNDSAAjwxiVTMu05KAq9vDsYc02iHx2+WPXtcIyCv5KH3xJehXVGUyhOdKTWqBAqMIhSBVDyoiACMYoRSpA2QI8Jxb7dfIUNLfrPLTHyCOzymZ/hK6fDo/GnCZM84ZAwWCAVZoJUTLPz+2CHjdyiYdjiuapTJgMfBlpyssjsRQA0zi8Q03MiJj+4CscIRS5AvYVYvFI4z2/bMT84f9npzqBN4dZvXIfdFlJqCpLbHuj04hXThcAAAmP+Dx9B1eqh8QoxKL3BKmO5mSXbrzrlbY++BkduTdbBvlx7b6Dx6EBV7omcteIgmm7wif/Fnv/0dy3XCfcpg3x5CjvTs4WSjZJsxtFevMoGciAayd/VUK9IqUpQrb1smKlW0Qn89Cbx0hHJ6gLIksf00ntpWfMrATQZrKxJAxCksfPWwASJHR9Ml45wV+ofYyRcEXPO0IJBWGcVdw8HgD2xP2E+fD2E1Vxqi9opYkDfmXu1UNkx7xyNL3iuVhbPlhr6fcpgitFnUb5Hp54BLq5ZuxZQwmFcZ4b0+EHt9FSDKlyR5jsNRlLFTlkd2c1YqjIyFxKajRQADSzwIh3oP3ceDi6IiTFU3FCv34bcj0uisv5qT9RihC7sTpmiFzbYTVF1+sUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39830400003)(36756003)(5660300002)(8936002)(16526019)(31696002)(83380400001)(6486002)(2906002)(31686004)(86362001)(316002)(16576012)(26005)(4326008)(2616005)(956004)(478600001)(186003)(53546011)(66946007)(66476007)(66556008)(8676002)(36916002)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0tVdi91cStiZ3c1NDkzeGNlL09oaHlUVWprSVNQZCtEYnhWbS9sM0NySXZ0?=
 =?utf-8?B?czE3cmw0aEFPNjF3SUJLOW1INFEvNkQ5MHRSZ2pzb244eTZzS1VGdDNPTExC?=
 =?utf-8?B?T0ZZNUJHT2pTRFFNejk3emFUcGdNWVRkanJ4cUoxdHFDTkxCQ2h5dC9lQmhv?=
 =?utf-8?B?bUg1K1prTW9VNWdQVFFOWUgvekZ0THBIdnM0TEVJeWl4ZHZkWUlmZ2MyTUJZ?=
 =?utf-8?B?YVhvVzRYQzI3NExLMGVGeEdnUStXZ2lNTXlMWXZsK1RGYnZlbm8xVWJjK3Z4?=
 =?utf-8?B?YStycm8yUTdGVlZ1enNST2xENHg4R04vanRCcmVGN3lUMDNzRk05U1Y3ZE9a?=
 =?utf-8?B?dXVBZnhlNE5oRUFCOWcwWjltQ2haamNaalJqdnFRMTUxdFdwbmJLU3VPaWVz?=
 =?utf-8?B?U0x0RXdTdE9mS3VkNGF6OFY5ek42cHhJMEJuRUhTV2lMaVdDNjhPRXpleThC?=
 =?utf-8?B?SHlzdkg4RFZqelJmVXNnRiszYVAwSWNsV1ZsSWRqNitMOXhIWjNMWDN5c1JF?=
 =?utf-8?B?bXdRcnFSZmZvMzFjK0E2a1YxeGk1bS8xSGh1NFpsMi9BNVRST1ZrcDRtdkNs?=
 =?utf-8?B?eTNrOFdEbDh5cjI3dnhUQittWVJWQ1pvQjBiSmNZbjhLRVhzQXdyMCtZdmph?=
 =?utf-8?B?UU9OSS9OSVNmSkRyZUdhak54V3gwZytrejR0ZnVGVmVoTk0vSzBzVnpodlVv?=
 =?utf-8?B?K1BJenlweGRCZHNIZDVOTmlmSXp6WVlVdThmQTYwYUFMa092aWhyYU1JbWlz?=
 =?utf-8?B?blBBS3R4TzRiUkhmQlBIUW1lNnNIQ1VRMWdWdlhYVzFxQjZLOVY1ZlNGZjlG?=
 =?utf-8?B?NXpJbi9acEtYL1pwYWJGQm5ESFdLSjVtUWNPTXpsVDVGUi9ZV05iY2dpYjF6?=
 =?utf-8?B?MlJ2Um9yYW1HM3g0RGxPTkRIZGNzNGdVK0trSWN3NHdaT3Z1cnhNcjE0V3Jy?=
 =?utf-8?B?Q0pGV2szUVV3VHRTT0l5WXB1VmxiMXVJRlQyTE0yOEZuODhCellVTHc4RGY5?=
 =?utf-8?B?OVc4UmozQm4rZ2NIVHA3N3hid09jRWllSXRoakpwZDY4YTZ4WUxKWldhQ0lY?=
 =?utf-8?B?MG83VUpNMjBqMlF6WUNkRzZLbytZUXIrVXNIVmxOSFYwRml6bFh0S2l6TjVI?=
 =?utf-8?B?VFlsMldDNUlnTjBBRkRZdDJVRmRYT3E3ZWl3QlRoSnFBZVdCaG14WkhQdS9B?=
 =?utf-8?B?czFDcG5UQUtoNTVNWTJqb3FlYVZGL3ZGbzByNGx3RWxNREc5bHVRVyt0R2lJ?=
 =?utf-8?B?LzFnM25JNzM1OVNhNGJrYUlxMlpKMXVSVHk2L2tlL3dPRFc2Y0ovYVFKcGhE?=
 =?utf-8?B?MXdiZnQ1NW80TGQzbngyQTNrd3NRVHFkaUJNUXFYemFUV2JaZEMySDM3U2Qx?=
 =?utf-8?B?ZzFBY1FNeGQ5R1lVRktwVmc3d1kzS3BDOTBmaGRlRFI4YS9uRnBCaERhQi91?=
 =?utf-8?B?YzhiT3VQcVZsYnhsLytCN0ZpY2lSaHBjeHZjZ1NqaE5JcFNzUmoyL0ZsQ200?=
 =?utf-8?B?TW13QVE3eTR4RThtbkRxM1psN1hkbEc0M0ZzVXV4RTFWUVFvMG5Sc29QcDZ0?=
 =?utf-8?B?TjN5NVExOTQyRGp4allMSjVWT2o1OXcvQUcxZkJURDl3NGVLVDAxaEZkOVF4?=
 =?utf-8?B?Q0hwTm9pTU5EV2NMNEk3bWNaSWVrTDJJS2pnNDdSb3hYbVpkVGtuT3lrY3lL?=
 =?utf-8?B?ZGpYRS9xTk5iTGd3aDNBY1ZGRmZuRytKQjgyQUFzRzJuT2l6S1RnOXhmbkpU?=
 =?utf-8?Q?TmHJrzlO7r1U56agdqmovSxrsAMrrzkToLllrE2?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a64169b-f89e-4d66-20a9-08d8cc78354c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 21:26:33.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwOZ214HWI2uHVFPmFQeZrZ4KbrswhQ4y32OIl6JVlR2j390AU+25ggTnTcHYFOk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6245
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-02-08 21:16, Vadim Pasternak wrote:
> Convert driver from 'i2c' to 'platform'.
> The motivation is to avoid I2C addressing conflict between
> ‘i2c-mux-cpld’ driver, providing mux selection and deselection through
> CPLD ‘mux control’ register, and CPLD host driver. The CPLD is I2C
> device and is multi-functional device performing logic for different
> components, like LED, ‘hwmon’, interrupt control, watchdog etcetera.
> For such configuration CPLD should be host I2C device, connected to the
> relevant I2C bus with the relevant I2C address and all others component
> drivers are supposed to be its children.
> The hierarchy in such case will be like in the below example:
> ls /sys/bus/i2c/devices/44-0032
> i2c-mux-mlxcpld.44  leds-mlxreg.44  mlxreg-io.44
> ls /sys/bus/i2c/devices/44-0032/i2c-mux-mlxcpld.44
> channel-0, …,  channel-X
> 
> Currently this driver is not activated by any kernel driver,
> so this conversion doesn’t affect any user.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>

Acked-by: Peter Rosin <peda@axentia.se>

