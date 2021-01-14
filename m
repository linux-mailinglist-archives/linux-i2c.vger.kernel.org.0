Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF22F2F5B8C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 08:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbhANHuP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 02:50:15 -0500
Received: from mail-db8eur05on2091.outbound.protection.outlook.com ([40.107.20.91]:34657
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727306AbhANHuO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Jan 2021 02:50:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbEjjhekfABywnjpgdCgcgpsUQhDVpSWkZsvvOLy9ZYNkTKn9C1DbxRRPUwP6GQph8Uds3rm9xQ+ZHl6jaKV82zD+OwOPBNikPNqaNxB24hxYB1DQRysjYHRy4EFGxALFDmtaw1phIe17uaTNn52EwCD40Pvml8HSjoxWyIUJPvfYo4RP/K6Q00YEU/HzqmBxI5BT4OpfVpdWTMlkGDO4PA9ATfnSZ/OtFpKAZdjo/yOIpoCJLW1PpdJQdLZdeDeVbZWRTlAKJIbPEMbJBspGn+helMpkL0Haq2Hu2vdsbt7qVbx18dyNaHOyZfaDucLqfMf8M3oPXZM79Z/N0nWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBIhZBgQXrWCVobtp6PfBRdm9yprAaraze6vQ5Imuak=;
 b=X8hYgPMplwg203TziEKOTwDsAWrvvJezngnlwkBKpjSY84J74p8KuCpgVpMBKxV8lU88LM1wA3AQd+FLFg5JowKbkYquLb0zfBbBhJlONUUJ5UXFY+yxVOfpHKczBHKugkKOHZScKPZXuSy+o25yTLXEgrvLSrpFI/5zK0XwILlRjQHJL8DuFAKeQ3aYcafGnuoGQIk7Kuhdr6vVr+7LWjwFF0vA3/31VUnF4QozBxJjrfzoY8kWLu894eBqhsF1u495SZ49j4m3wapdsnw0ldaWdmHyeQ+4q9JOArG2wge090ceP1bQoFAHYoq/9K6JKdM+k3/7zPzS50bszP8FDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBIhZBgQXrWCVobtp6PfBRdm9yprAaraze6vQ5Imuak=;
 b=PTWy7xiX5kKftJQDRz1aZOLzkG0QmGxpTo1mPOTF89qX4H5zl1H1ZMyHLv+GASN8cVSjR1RXXGWC0s+AY1B8nOfaS65JPmA6NKswETSV2PsV0bRWDHXLtC/vpiCwX/ikK7cwR6xF+vNPDCxKGAEEupx/yD/lCGok76RYAk4C3+0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB3674.eurprd02.prod.outlook.com (2603:10a6:5:12::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 07:49:26 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 07:49:24 +0000
Subject: Re: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-6-vadimp@nvidia.com>
 <b1e3b52d-ddb2-ac56-665c-7500c939a55d@axentia.se>
 <DM6PR12MB38989872E06EA9593E862F23AFAF0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <268612bc-dc4a-cfcd-f529-e8540adfd8dc@axentia.se>
 <DM6PR12MB389804F87C41F41210837810AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <e02caf3a-86b7-23de-2723-3abe97fb92e4@axentia.se>
 <DM6PR12MB3898A35B743227426802C081AFAB0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <5860104a-f922-068d-18ca-32b69c7970f7@axentia.se>
 <20210112101144.GA973@kunai>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <827c0c7f-dbe2-2769-749e-be838d890101@axentia.se>
Date:   Thu, 14 Jan 2021 08:49:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210112101144.GA973@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0182.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::30) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0182.eurprd05.prod.outlook.com (2603:10a6:3:f8::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 07:49:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 257ab821-ed8c-470b-8496-08d8b860e928
X-MS-TrafficTypeDiagnostic: DB7PR02MB3674:
X-Microsoft-Antispam-PRVS: <DB7PR02MB3674BE83BF43FEAD6B41A98DBCA80@DB7PR02MB3674.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGE7OLb8h/1uSUp0UY7FvzJDEcjP8rL/jzRG6VAA43p82GOm0aTdtn39ebDsx3nKFWtC+p9MCIm3awdRp4BN88oiWPC7bA9H1x7a/LdxsYV+AMomHPIqBRWIdYFqzPdSRuRpkFAD2+33yHoO0/S4W5zzGeOWkoterCFbUDaKI6dIfq2iJh5sSt7BrakKjkQSqAebteS8le39Ik7IkQebrV3F8zWz5/eIEBXVfdQ1feM14EdUvSBID9EklenKoVpJJlIcBW23k3SlJAFCopHBAAEdOCfAvzCCU8DC9H8/cQwSq0J9N0QzqP7XI0ZjBxmWm52uh93Me6cdss/kQtlFyTsb2mQyeWgSUjDAlDRkY6qcBMXr47qJKljPNpwTieyLegvX2tPNwy1uNCrffcLdEnyctm4txH1tFHT9ci/UeNFL3Qq0Y3R4OFMDdRfEoPzWcBoWEoIG/LFlkNntVVKxaWp76AsEON6kherG0suVV5LikQRYzWVzT2sM9vGagru0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(39830400003)(136003)(346002)(376002)(2906002)(66946007)(66556008)(956004)(66476007)(31686004)(26005)(186003)(53546011)(2616005)(36916002)(110136005)(83380400001)(36756003)(8936002)(316002)(16576012)(31696002)(16526019)(478600001)(5660300002)(8676002)(4744005)(6486002)(86362001)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?FvRrIcBDCrNXBjSoxl+/vemCkkjItlfysq5tyzm2ugnAYjAl8Abr0fuT?=
 =?Windows-1252?Q?c+lqGGYoPuZZ3mOjL6j1hC38IPveg2+rI0OXsvt5neMXJx/ggyPGf7hW?=
 =?Windows-1252?Q?E+Tm+K7MOQuXMH0IqNMDqAcsE1K3mZ48hESlWtNKkDqj24rOtRCla8gP?=
 =?Windows-1252?Q?FfBv5+7q96+q330YIwJdqJXLaZ75HDowVwiNMpM3gG/j5krWtCJmRv1J?=
 =?Windows-1252?Q?OkF7nHo5jb5hNaB2WmkBpaa/tksiTtobon/+rl0qc1lpWDQlb/8wL072?=
 =?Windows-1252?Q?PSkeSC3RcPwsnZe0CHVYEwm/tij7b5c/vcmXl71jn/sqBvrFZfMDX02l?=
 =?Windows-1252?Q?EwNSETRa90cscZRZGCv0QC1JTL4jmBn9GoqoOtSWJjbnkd9/26bEyQM/?=
 =?Windows-1252?Q?ZhuIaMPObYSCxz29v1HfyqJql/96uQXavtVvcQFF0aYiKxCrogv7mZRE?=
 =?Windows-1252?Q?GvDP1wnckQRIZNSWUMS/afYMvax1pyQCWHHv+QtHqifFGn4JZXZTwmZT?=
 =?Windows-1252?Q?uHPnpm7ptEx6BDTTLJyF7Lijg+gCN3S6YD/Mj30eTPiPmi75r/jjKzAV?=
 =?Windows-1252?Q?n1b2awXjSjA9FnOxjnTlXUNlQ1Vp0VebeKJakFANj9ZtgOqc3407lPUZ?=
 =?Windows-1252?Q?fv4ivH6YAY8ji8UNwt9zaLncgZsvqwc5MYDouD8QCniO2FC1tWkhsqyD?=
 =?Windows-1252?Q?IDav/eVL/52DILuyLVhElbFqXxgwqqE0034L9SwSFub95D+kbGN7o40S?=
 =?Windows-1252?Q?1lq4wDz5Cxj7gT2DgIYA98hYoT+Y7Z5GaqIcknf5ZBHEPT7pvslyT3T8?=
 =?Windows-1252?Q?akS9sRTScj6klbs+0HQDs6CcIvwB9uIrlQqUUK8D9kvmjH5pgh6DglAt?=
 =?Windows-1252?Q?x/4ZYoym8yWkrDq6fYV4KB8kF3DTfoDLtbC2bX7R9sKNbQkTU6jvwGcJ?=
 =?Windows-1252?Q?D8XR4Y4gqYxiipy2u+3PMnwr0nNOP1NZ1n7H2jD6WOt424w6C5TNYF/3?=
 =?Windows-1252?Q?wuwSjBcXN9t0HN1WyN7sdjibVhCyplLUMyzrVp/mN9yMxwZUG64zAVpF?=
 =?Windows-1252?Q?GunL1eLtzGiMGqdI?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 07:49:24.0073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: 257ab821-ed8c-470b-8496-08d8b860e928
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hc4QnZP4RxZ0OItTHEtKeYF8CIMYpz1y9pPy4YYjahcKlzddTdMICYYd6k1hr4lc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB3674
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-01-12 11:11, wsa@the-dreams.de wrote:
> 
>> Wolfram, is there a better way to get something stable for user space to
>> interact with? Is there maybe a way to do this with aliases or something?
>> Setting up an ad-hoc scheme for forcing the adapter IDs feels a bit outdated.
> 
> Yeah, it feels rightfully outdated IMO. Bringing such policy into the
> kernel is frowned upon. I think the proper way is a udev rule to act on
> the newly created I2C adapter. This even could provide a really stable
> symlink for userspace to consume. The above scheme is only stable per
> "block" but inside the block, there is still randomness. Or?

Right, that makes sense. Thanks! Vadim, is there any reason to not solve this
with udev? Doing that with care could perhaps provide stable names even if
you swap slots?

Cheers,
Peter
