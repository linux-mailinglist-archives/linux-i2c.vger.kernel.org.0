Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A651E66DB39
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbjAQKem (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236844AbjAQKd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:33:56 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B2234552
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 02:31:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeB3hSapydhxJmctz+4mMOw+U/U2g7BuDhsopgum4ZNVRAUr1kcaGguw+34O+zaW4575E74/+ThcpsIXT0A6mR6xT+8iAlmCfRZVpaEu+vlotChEe/+EwwjDiUSvlOh37m8INsG4UVc4Cp67PBEDMpW4CdbtlqWKaGotUspqVtYgXAGHi7S1q49NVcBC+V19j2YAYOAVMyZTc+2YrZRJmHnQPVagW+Y6Q2t82kpm+M3S2l8yoKdye2Be6zB/Vr5ENm7xco1H9G2QzcxxND8MdpuVWj+4h5Ke7rrjuEEhoTr+A72+kn1DuNGxZ3XUBgwmiPvdND/iW255QNnkb/6Tdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkMCZA136k6Qn07T8zHb0MjXVrp7A2oWmvO0Sh0lRpc=;
 b=G/YrO1/yfsiXuBRqlrg+JHo4u6eq5A9iQmLjWXiV36Ke7MA/dqCK0goyuJABkvoYYoUZhENPVaFbQxhel0km3qH4iV05Euqo6yZuRTPclALOuX3pd7HUWgkR7NE/tkRaSxBpTN4+CJwzE0lSQ9mJOodCdCrqS8PCcxgkaX0S6ciVq2H6DEMPPtQC0wSDfd0U2YZtYUS5gvOLIFYlxm3c2deJZBqsj7DCQpvONRk3z13bTXD9HHSwndsN7jPILLUpYrjTicxC5vpFJ+ZmzwN6InHFx+OLCUcQfRVHl4XrFxiVdxgSskJsl4sgc1LWtY0HHvZhJjQov74viTTgC4dP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkMCZA136k6Qn07T8zHb0MjXVrp7A2oWmvO0Sh0lRpc=;
 b=aH4nijh2Z2fno2ZOgabpaL/3smfMeLae9LNwjZ+9cdVdkkt7SPt6AYTeSkVV5piEG4cFkN/PJe27onr14oTCC/KaSfcbwdMDzPnESbXiGN28c2q+a+6vKPPQVmzdSyOuONKDTcEj5c9gN4Y2zjcpEXJ/qlWsDRa5+jx7rR850vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS0PR12MB7632.namprd12.prod.outlook.com (2603:10b6:8:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 10:31:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%9]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 10:31:34 +0000
Message-ID: <fda9b261-0b42-1c13-b40c-8ad93088cbf2@amd.com>
Date:   Tue, 17 Jan 2023 16:01:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] i2c: designware: add a new bit check for IC_CON control
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Cc:     linux-i2c@vger.kernel.org
References: <20230116043500.413499-1-Shyam-sundar.S-k@amd.com>
 <59fbf54d-9bbc-efaa-bb2a-74880156e310@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <59fbf54d-9bbc-efaa-bb2a-74880156e310@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS0PR12MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: d6765ff7-066b-4420-fdf1-08daf876017d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wy6bwnD8hPu5BzbZyJ6xi12K7jNPWOLTiNFIEJtUR6jIWfjox1gZBwTd5C3ZW1hykTQfuZZQfC2nFaQWQdpUVVNNQtRrHOXYlh/Q3Y8mKv6R1f3D7BvlIALc6MtRBylPIca7eLWlsspC5M+4Q9Xf69IKSBa+JQIznrFV0UwVDWZjL4v+c0aYKGupCu4b1PwBVCeQ0byc3S91SiwYh0YBND3/g4uwp2VgLbXgXnUBRzRdQuD0H5aqfA1wmPHKKA+jGHfff1yMIHFsK2Ab9CiWOhom4n0kthjgblpif+iKOjXo9rxwx2GJvkjKBuH5wh4gHxwvCLaQDw/2KZFkeM/xyRAIFHrW3CIhVG9DVGb9Eq6wCZ79vV3AqD1YLJe3hDQE/+rK37Ss8oesEXqfw2TTUp+5pPLRw6jKr727NRBhvFwPhdB+v8Fz01RGxf6Ca9Je9m0Kc4cOI/yBZNa10fGxWByyke3x33DjU1a9y0EcDVuUp5SVxnCHeAjbbTC+2Xo3TXTZRCjPrmbKPbbQ81x8iA01kpL2wd3UhiJVXq+wndmZO5LvdfePRP4sI57Ql/zM0rwCvsg2KiH1ecB7LtuvFxCMymXt15BnOK57W5g3ah1osvWcyw4I9q1tJzsT95hM2PhfB2FJ42enwHLgVXbOJjgs7wu8WqQKLZLJ4j8dU9fyWV1wZjMpifOmeogY0uglNJwsyiqF9TEMfHA0KbLDCwgfvG9b+Cn5nKXqXGU1wbo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199015)(36756003)(31696002)(86362001)(2616005)(66556008)(4326008)(26005)(6512007)(8676002)(186003)(66946007)(66476007)(41300700001)(83380400001)(316002)(6666004)(6506007)(110136005)(478600001)(2906002)(6486002)(38100700002)(8936002)(5660300002)(53546011)(66899015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE1vMG5aMEE2YTFpRXVwT1lTWVE1ZWRtbW5uWHVZUERkMGFTaldJOVVwSEdO?=
 =?utf-8?B?U3Uvb3kzVWlzTVA3eDR5TmxhM0hoVTQ0d3BLendnQTkzbm5ZZW94d2M3ZWFE?=
 =?utf-8?B?cExlUlBXdUswNWxIYXZqTG1nSmJJMUFTRURTTElieFBDY0NZelV2SmpKa2Iy?=
 =?utf-8?B?UlpkWEYvNmNmOWhkT2RydzJ3dHViOEZvSGgvSFZScXBndGcySnFmaDN6NHZK?=
 =?utf-8?B?TUhWWXlHRy9GRWRzRUVoUzNRWTJ2dzFKRTg3bTZEeHhJZzM3OEtGTVRmTG9E?=
 =?utf-8?B?K2JyUXBrNUVNN29Qc1pQcmoxb3dOczMwN0duNjNaSnlDamw2STErY3NFYjlq?=
 =?utf-8?B?YUxnSzd4RC9wMDdSUzVTUjdXb1NQSERhRGJKZnhMcy95UWxVSitJYi9WS0s2?=
 =?utf-8?B?R2ZJRFpMYXZJQW43RDhWUXJBWTd3VmhXaEo3SEYwWHN2NjdnMHhnMi85Vkpq?=
 =?utf-8?B?aU1pclowZWc5NWFoMDFyNTRWYkN3RVViK1hYaWhNbXlXNG5HZUVlUFJHNHNp?=
 =?utf-8?B?Y1VnclRRVUFxV3g4L1luRUhNREJjdjhhci9VNEE3WU1xVHJBdE9QY3hZeG5a?=
 =?utf-8?B?ZFZMVCtqb1JHbjk0SStCSm1seHduZHJQNzRYSWhVdk1RcWZZZ2tWa1A4aGR0?=
 =?utf-8?B?SzltaU9LSTJrUFVxV2UrblBndHB0K2RTVzlieXdHWUdLblN5TjM3b2hIa21X?=
 =?utf-8?B?RkdEVkI5cWpzT0RQMklsSlpHaHJJdHlIazVQY1RwZnRuUGxUSmx0ZXBPdXVw?=
 =?utf-8?B?akYyejdTT0phUFVtZWVxUHJidXBmV2Nkamw4RFVST0ZFeUlDUFl6Z0dyTk01?=
 =?utf-8?B?a0FVOWZGVldpUGs2L2JRcVk1WU9CNEdQZUxWK0Z5RXlaamhKNW5Wb042aDZB?=
 =?utf-8?B?d3NEcmJKSGwycE1jS3FmOGlVcWtRR3JvK29zY0hLN1pKV2ZxMGNDY2RTODVu?=
 =?utf-8?B?UHlMVjQ2RVg5OHk5bS9Ua252c2dLRHdZZnRnNU15bzJ6S1crcGZ2WTBWYUdO?=
 =?utf-8?B?dUptYVdKblI2dzFGelFaUGtOalJqWmNOUnQvamdtdXF4Z0dlR0lMT25uTW1O?=
 =?utf-8?B?TlVISUxRTHc0dUd4ZkxGNUw1dkY4WEJxd1crbHh1QkU0M0FubzY0c0l1eDRm?=
 =?utf-8?B?SUltVnVsUHRyN2VnSFY1YTZmYzZWSEtrR1J5cjlhRVB2RVRFam1hTDdtZkJ5?=
 =?utf-8?B?MmtuQXZ0dEZaakNMakdBZVhvOVNWMVNVT0dpUW9wZjgzakYvUm5NdTVUM0ho?=
 =?utf-8?B?clExRlZzb3RnMlBFZ2s2YTVkTU56NGFBbTJvd3AxcklVcFFmY1NiZ1RlSHh0?=
 =?utf-8?B?N2hURUZsenZucUNhZVppaHhPNjZNMjMrc3NIUVBINkFSSXhta2dZUFY2R0tr?=
 =?utf-8?B?c252Y1N6VmpuOGlhcCtjSmQ3cWtkVWZseWdqMVh6bVJBanVBR2lRamErZ1h2?=
 =?utf-8?B?Y1pWd0JlaW1sdWx3cU9IbmZ0Wkw0OEJRdGIweUNFOXZtdEkyV0ZZYjRTU01v?=
 =?utf-8?B?NkhnenZ4Y0k2RmNSREF0bDJrTGVTRnNDUlRZbzV2NVYwdm9TeG1YWVlDam5o?=
 =?utf-8?B?bW83Y1c4QVhpMmRaUFFiYTd0OWR0RnUvdzhWaDM0TTd6dzEyWmZyUjUzWk43?=
 =?utf-8?B?N3ZlR2I5UUFwWlZQTk1RR2l4ODhCWUl5ZTZFWG03K1hMeTFWN3N1cXRxV0hs?=
 =?utf-8?B?ZHM3TGRldlY1djB1QkEzY3pCZXNKWlZvbDNubnI1SFRmeStRZ0dpMzRpVXFS?=
 =?utf-8?B?Q3NjZ3c2WmoyNEJZU2ZPeHlTZzBjNmZwbTlzUk9nRTNYTHozZFZPTnkvWHZ4?=
 =?utf-8?B?bW93MHFReC9ubWs0Um8vMHloRUVUUlBXSG9DNFdtWjkzVXd1OVJyazBKTzhj?=
 =?utf-8?B?Z2owQlYrTXZwVmg4OG5HRVRXVUlvUFgvd0lJS3N3WmtGNWhtVzBjQklFRnVY?=
 =?utf-8?B?d1RYVjYxNTM4bmJTc2lmazRlYzl4VVRzNW9Kd1hUVXVMRlpickwra1E4Z3pE?=
 =?utf-8?B?NWhIV0VZOFVac1pVbWtTenpBRDBTMEk3R1FPTXRNQVVJN0VaUk5LQ1I5aHZm?=
 =?utf-8?B?bnFEM3g0NFBwSWQ3VFlLek9DYk1wa1Z5RDRFNnlrbFJ3cTJ5MElPVG1rakRm?=
 =?utf-8?Q?0IyPHn30XIMKufIEnXM+GwQbo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6765ff7-066b-4420-fdf1-08daf876017d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 10:31:34.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adHO9Tnq/xucwl8+bNY3yiTdB6JRplWIiFqZn6QiFEVCeix4KTjtLC7+bJ/ji5EnksgJFgnouG8ug/uziKm0EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7632
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/16/2023 3:08 PM, Jarkko Nikula wrote:
> Hi
> 
> On 1/16/23 06:35, Shyam Sundar S K wrote:
>> On some AMD platforms, based on the new designware datasheet,
>> BIOS sets the BIT(11) within the IC_CON register to advertise
>> the "bus clear feature capability".
>>
>> Since the current driver implementation completely ignores what
>> is advertised by BIOS, we just build the master_cfg and
>> overwrite the entire thing into IC_CON during
>> i2c_dw_configure_master().
>>
>> Since, the bus clear feature is not enabled, sometimes there is
>> no way to reset if the BIT(11) is not set.
>>
>> AMD/Designware datasheet says:
>>
>> Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
>> Description: In Master mode:
>> - 1'b1: Bus Clear Feature is enabled.
>> - 1'b0: Bus Clear Feature is Disabled.
>> In Slave mode, this register bit is not applicable.
>>
>> Hence add a check in i2c_dw_configure_master() that if the BIOS
>> advertises the bus clear feature, let driver not ignore it and
>> adapt accordingly.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/i2c/busses/i2c-designware-core.h   | 1 +
>>   drivers/i2c/busses/i2c-designware-master.c | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
> Is this change alone enough? I understood from the specification that
> the SCL/SDA stuck low timeout registers should be set and a bus recovery
> procedure (additional code) is required.

Double checked with our HW and FW teams, and understand that (atleast in
AMD platform designs):

1. BIOS actually programs the BUS_CLEAR_FEATURE_CTRL and also enables
the detection of SCL/SDA stuck low.
2. Whenever the stuck low is detected, the SMU FW shall do the bus
recovery procedure.

Currently, the way in which the "master_cfg" is built in the driver it
overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
cannot initiate the bus recovery if the stuck low is detected.

Hence this proposed check should be sufficient enough.

Thanks,
Shyam
