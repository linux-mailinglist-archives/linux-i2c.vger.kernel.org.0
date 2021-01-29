Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF0C309067
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Jan 2021 00:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhA2XBV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 18:01:21 -0500
Received: from mail-eopbgr60139.outbound.protection.outlook.com ([40.107.6.139]:47746
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231666AbhA2XBT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Jan 2021 18:01:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOqsNzu7iX6W37uvN2BtzhKwHqLonvmNCdyVv5+FKGTITKERXL589AgwEyOcCxF0w7qPjJPeY6e1p6gKSwSTZgP5DzHdQBdXRl9gZKN+zUYd7tZ5EFTWcRe+8cniUfpNaSrjI3R9ElLeBv1csXsLH2xbiCSi3/JVAz6TFaQIK7xu5i017PtpjKM5QOekzxg6eISGxD7zRIVTPwdyzmwHnl00FxBNn3prjzqpZoDqAiqynE7+wkvpO4T5Rgu4toIhbBQS+QHejjYUGHDS+gzWIldeFCt78u2Q4S5wP/PbcV0drn9Y17cYCOZJQnkuAjakcz7irwKMU6zBs7RgFczwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35YhVqbFoeQlrXUgn5of3elN2TQyECeFGPSqlSkFe3k=;
 b=hcj+/rH53tBI33XgoEXKdxZ4JqyDsVScozg5oHlLOdm7a9/K08AbECHp8YMh2fMArsA/gSdKrL3NnM5K+uwVdc4X56f9/7AVDIREHD+MLhaWc/w1zZlT31pOEwmLDKn1VMqGS8u7MfiS5in1SU/A/83jnp/ZhFaWXtbXnPYKJ1u/R4zYl3EpK8vWI46WLnRJiumaw0NNHsuYO2OsZDHL2pcJzghvcfxUa40+JqnTOmoc9VurVzIpsazsjAziaD1/EXX0881Cjjoxt83Dns0bHc5D3I0h8e0TXvpA3Cvmz5WrP6EhX4qHDSOaStoPA1/sJF5ztNUzp5YdHQIb8ip4jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35YhVqbFoeQlrXUgn5of3elN2TQyECeFGPSqlSkFe3k=;
 b=nMMXySnsUsAqwOPx8bsIZypTDDAdVttzhcF/42MrOzszIG3ZLH3JYStigC+wsF3TK6HHBv5VCdTupeLVQJVPaHr/8HbdPyL87sP7MWrZ3NfJJ9NgcH3GjCLK2jQVxr5EFfFRBF9pEFKfpyxm4I+eHVnvX//76ILGmrOLm7WxSLE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB4105.eurprd02.prod.outlook.com (2603:10a6:10:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 29 Jan
 2021 23:00:30 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3805.017; Fri, 29 Jan 2021
 23:00:30 +0000
Subject: Re: [PATCH i2c-next v2 5/7] i2c: mux: mlxcpld: Extend driver to
 support word address space devices
To:     Vadim Pasternak <vadimp@nvidia.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20210122192502.17645-1-vadimp@nvidia.com>
 <20210122192502.17645-6-vadimp@nvidia.com>
 <c8dc2abf-023e-d8c0-7f49-bc0ee228fb1d@axentia.se>
 <DM6PR12MB38987A5C2B8A8429289BA6CDAFBA9@DM6PR12MB3898.namprd12.prod.outlook.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <67fb2f56-cac7-e466-c6a1-c46dab76b112@axentia.se>
Date:   Sat, 30 Jan 2021 00:00:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <DM6PR12MB38987A5C2B8A8429289BA6CDAFBA9@DM6PR12MB3898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0328.eurprd05.prod.outlook.com
 (2603:10a6:7:92::23) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0328.eurprd05.prod.outlook.com (2603:10a6:7:92::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 23:00:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b355673-0e6f-4449-dd8b-08d8c4a9ac89
X-MS-TrafficTypeDiagnostic: DB7PR02MB4105:
X-Microsoft-Antispam-PRVS: <DB7PR02MB410529AEEB3A5860724E29DABCB99@DB7PR02MB4105.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3j3ydMvf0QBJZi6dcYZevPx/Z2NXjBYuWcmUrgCnauvxD5B00Gp5NHmGCzit0RJV2ALvjryjgZzdceOj48DoPJBKQsVE9/xgyZglcgudMV1lw75ukAR4QeTeCTcQIwt3MyZypZ3amsbmcCMP+YGce+fK8LVZwdB1epD07SKjTD47mHvnOtGAbSstQV9WXs1mlOEUNaQv/jjegzwcCP5U+eXEKZdQg1O1d5cokncKkvtjViDxEayAlSIrEIHnu7tIfyMl2Gi1aV/i0WaXCswZMeac7vVshI4IUWdp029rEbfby2tqpvfI+f6QP+vMwY5CbdwHIq+PYgFN7IJ1OFvDzx8Ck4G/IpZ1W79amV7lHsmO2cycKCGgAo+Z7hk6rZPeR1sx/iYA2fz1g4dKNaur1y1UdzSXUmNOeDjdv9au75YxqODQNjaLsAC1f6B5uoItF9WUCz4bPXb+o+N703oc0vAJH/ii5DANZ25oaHvrNr065b8LCdRZTOISQVJGqGPMnlXCbN5hpe0ekdXEGXX6BuwN6sDp/CQOqxbg0gOUT5i8cGSq5/6y0otIct69DP5ED1Vd8I0mKfe3XwMQw9nY1p3J1buQOgtE+5NRNQ6Ocntwcbd7piF/tIVfTWwwodhf0Yl7hKyChv6yGeKHapf5tQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(39830400003)(396003)(366004)(2906002)(26005)(31686004)(478600001)(66946007)(8936002)(83380400001)(16576012)(8676002)(4326008)(316002)(66476007)(2616005)(31696002)(956004)(16526019)(110136005)(53546011)(6486002)(6666004)(36916002)(5660300002)(66556008)(86362001)(36756003)(186003)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NXNFR3VZNXdtNHpUSUhxcDhNNURpaEJIVWY3Nm9Td1R2VzcvdW1QNEhHTFRq?=
 =?utf-8?B?REVwNTh2MTlZNkhablU4cFpWZ1JOaUtHMXdoR2JxbkNQRjg1V2VoRUYxWnBu?=
 =?utf-8?B?cWpwcU9KdnFHUDRXQnhwMGMzWFd2M1UwYm45ZXRrTkJ1ZkFaQm1nanRDbmZR?=
 =?utf-8?B?ZXdPMHFnTm92YVR5QkxOaW9lK1JBT3BZaGFPZlk2SFlaU0lBRG5lNkRLaE5I?=
 =?utf-8?B?ak1jMkJSaDBGR3F4ZHdsNU9aRlRIb1RaQktSazZHTGtjQnV4Tk1oMXBBNUNI?=
 =?utf-8?B?VlQyS3BQbUVHS3VKem9EYXNYQ20yOGtlMU44S1VsUXlRUCsvVDI2K0V4bUIx?=
 =?utf-8?B?QWp1UDhBcGRMRnQ3VHJNdm1tSVlVVm9kdmVEVzdhcjI1eXpZa2QrU0MreThT?=
 =?utf-8?B?SVVmdlJCNEpxUFVnejRRdWNjS2JMaTM0ek1RZ1ZCWWlxdmorek13VHRTaWpN?=
 =?utf-8?B?N1h2dThnK3dDekFjd0VPcklocnhtVHBOZCswd01hMjkvM1FmaHhTN0RyaURS?=
 =?utf-8?B?RE81b1d6NllnYVFGaFNVcENNQ3VmbVZnekJ3MENWQmZzQWlPVU8raWRkR05n?=
 =?utf-8?B?QjIyNFV3TTVDdzlZbFN4YkF4d3ozU21pOFZLUGRsTEVreTRBcjdpOHBCZW9X?=
 =?utf-8?B?bG5zaWRleDJOUnFLeVIwVGRSTzV0dGs5SmpaY0NWVTBQWjBzU1l5VlRUYmRP?=
 =?utf-8?B?c0ZqYlRJdkF1UndIQjlTYURQWksyZnd4UkN0Qmp2em0ybFMvZFp0bUdRRW5N?=
 =?utf-8?B?M21iZ216NDJSTnZLQUlRT1h4dU5qelZ4VW5VbWgyNFRIcHBaS2lIQThlTUVj?=
 =?utf-8?B?UXJqTzlMWkJnMklQTnRPcmlJVm9kaHRLZnQ5UGduR2tvNjFDUXlHU21EMUJt?=
 =?utf-8?B?b2hmTFZ4SXYwUHFCQ01lZ1QwRWZKTlE0d1RtK1Q5Y0loVHh3Q0ZQRXBPekZH?=
 =?utf-8?B?c3FoVTZQeHlsclZzb3FVY2ZZK0xWUGZnRXpnc2I2L3NpUm1DUmw1cC85NTND?=
 =?utf-8?B?V1ZRY25OK1hsb3Y5UkpEVndCNG1oZWdBOXZEWG5EeFJweUFyVyt3VitSQ3R4?=
 =?utf-8?B?Sk5KT1BGak9QNlN6SDR6SDB3cThORm1KVkdZTTNtSkJ3ZlJodnFyVkJSUmJm?=
 =?utf-8?B?ME42bHpvTXpEa1NIcWNwcURqdnQ5b3NjOWthNnpublhaTnhKZDZlV2FnaHpE?=
 =?utf-8?B?ZmlQZENQTXhzYzY5aFhPVnVqN2dSeUNWY0x2YWNITytoNm5RbjZKZ3pWR0lM?=
 =?utf-8?B?ajh0ZDNJNDEvNVV5YlRzNSt5T2tlaytGZVVqRlFhVU5BRHNLZjJEK0JEaEow?=
 =?utf-8?B?NlRwRjB2QjNkRjNtNHE2YW9XNEtYL0IrSEx5MDIvYzdiMm9Bdmx3WmpPKzVo?=
 =?utf-8?B?ekJIajFka2JRN0t5WURiMmsyRGVrUWs5T1oxQnJGMDMyMTQ5b1BjUVdJcmhR?=
 =?utf-8?Q?AtvUxi56?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b355673-0e6f-4449-dd8b-08d8c4a9ac89
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 23:00:29.9026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vowBd3VNAfcRCsj5MhFybZP8hpAK+O5LyghwaB7ZzhRZrf1rITKktk4QaVLfu8hI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4105
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Vadim,

On 2021-01-28 20:29, Vadim Pasternak wrote:
> Hi Peter,
> 

*snip*

> I can merge 5 and 6 to one patch.
> Would it be OK?

Please no, that's backwards.

> I would like to not drop one-byte register support.
> We have InfiniBand modular system with leaves and spines devices on which
> I need one-byte case. Code for those device was not upstream-ed yet.

If you could have dropped the one-byte code, you'd have had a lot more
freedom. If that support has to remain, then I have to assume that it
should be preserved. So, you need to make it as clear as possible that
the one-byte code still works as before. The current series makes this
hard to see. I have to read patches out of order, which should not be
needed.

Look, when you add a new driver the most important thing to look out for
is that the new code isn't adding bad interfaces or doing stupid things
like double free etc. If the hardware works or not is not really important.
If it doesn't work, nothing is lost because it didn't work before either.
But when you extend a driver to support new hardware, you need to make it
clear that the old hardware keeps working. In my experience, the best way
to do that is to, if needed, first make the existing code more flexible
but without adding any support for new hardware. I.e. first prepare the
driver. Then, when the code is in such a shape that adding the support for
the new hardware is easy, that final patch will be as easy to take for the
maintainer as a completely new driver would be.

The difficulty will always be in the preparatory patches that make the
driver more flexible while preserving the old functionality.

In this case, you have a couple of issus that you need to address before
you can add support for your new hardware.

One issue is that the one-byte code is never writing regval 0 to the
register. It is instead using that value as a hint to not short out the
*next* write of the regval. You seem to need your new two-byte code to
be able to program regval 0 to the mux register. I would solve this by
changing the 0 key to some other number, probably -1, so that the same
mechanism could be used in both cases. For that to happen last_chan
needs to be able to hold -1, so it needs to change type from u8. This
change should be done in one patch, before adding the two-byte support.
Then this issue becomes a non-issue when adding the two-byte support,
because the driver already fits the need.

One issue is that the current mechanism for selecting the actual regval
to program is inflexible; you want to be able to not create all
the child adapters, only the ones you actually need. I.e. the change from
adap_id to chan_id. That change should be done in a preparatory patch,
before adding two-byte support.

One issue is that the driver hardcodes 8 maximum child adapters, and you
need to make that more flexible. Do that change before you add two-byte
support. That could possibly be in the same patch as the above adap_id
to chan_id change, but it would not be wrong to do it as separate steps.
As a reviewer I would probably prefer it in a separate patch.

Etc, take small steps and do one logical change in each patch. That makes
reviewing much more pleasant than reviewing everything mashed together.

Cheers,
Peter
