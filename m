Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC91A672FC5
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 04:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjASDwW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 22:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjASDtP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 22:49:15 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::605])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE846DB07
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 19:46:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLDK2KK9PW+F++12DLiK9sGvrFzgVszq4yfLJRTSv3cDFUN06+eYKZM3OunfoFRNNtrGkSWW9jzdbOglEQG6IbMdPpID8eY6GFsi4uGdu4S7RUmlOSBxHeumBj812VDpS2+Dvi4F/CfgVTGa19wD+le7NO4SevcoF/zONw6SeMGoZfGMQSLrWg6kXNOfWX+n5yDG0u53hUg43Ns9cNSMMka3f54Wu0XrNWB/O/4te9r8GE2DmQ+s5EfxjxsnmY+jGJEItby05qcySAfSQDnMy3e8ITvqced2v3GTR5/29Hc0WegYTbnTRpVp4uMH3f+TEmJJFv20zHLF9iQPfkj70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGxLINJqgXr3ebIVSLJOrxbghVDIbhDD/uT7A7er0Cc=;
 b=P6tqXalPIOnjsMoVAxHp2ekoAYusW1p7nxFuMcdjtlt9d2ZzDALeqt2ueRuT7ByH5QHNFYW2wpHu86stEgc3WopBfxH3PErpL+zt5OiNTYTiwNH0RSrvaBQ848jzB6LnTvltnr/fiA2COr4eIj2mKnIWJezhM2GsXRg5gsrx40UpXWbzlQhkwURqLCa+SSAN/+TsXWZjlyIGxXsfXXEt2gVg2TORweRm+Lc/ZFrHa0AvRUJ6BKcro6yXq0q6JDPVKvR7ZZy8jkFRVHwJ0g3LYCJc75QGMQWRPEghXb2DXe6ZKwwwOvlDH3VpKP0ETxn+FmZRBqjoq2eXizV3/Xk09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGxLINJqgXr3ebIVSLJOrxbghVDIbhDD/uT7A7er0Cc=;
 b=AOwGrNVrZvzjVZK7x4l4D5s6+Om0gfMRhOcVkv23UfFwHFVmTf+weEhxeaojuR3jQrXN7aaLmAsP9Fk8e5fSjsRoutmeHeupAyMlM2yEKT7DPMLQ69A254oUawdDSzZgALJ2WzpuPwAF4psqMpR5OWfeggV78mgqlJqerbJ9IAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Thu, 19 Jan 2023 03:44:58 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%9]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 03:44:58 +0000
Message-ID: <ad005c44-4a69-1cf4-0e0e-e30e42c76d5c@amd.com>
Date:   Thu, 19 Jan 2023 09:14:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] i2c: designware: add a new bit check for IC_CON
 control
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230117122801.1605176-1-Shyam-sundar.S-k@amd.com>
 <Y8a54u1ipywtTIlH@smile.fi.intel.com>
 <dbdc2d2a-8fcd-8667-3088-ca730212c162@amd.com>
 <Y8gDcaPT+WcsGRRA@smile.fi.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <Y8gDcaPT+WcsGRRA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 5929ba24-7ff2-458d-797b-08daf9cf8927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3rYozRYLugkLCoN7Yi93Dv5skBsukVydB1cv/w3riHaZS38XkO6Mm+MqvQXoaf6cG/H+Dl4lTpN7MqBX1CXdwv2Q0+amYhXambyuYBRYfFooNvT9E1VVYT1v8YW6Jxi7n/Arc8HaKqmZA8eBQsMR8G3WaAFTGClrjQGl3qG3kQejVuPteQhIzPCZgL61hXpiWpFjCUOX8sOTjOUPjAZawHZWx9bUg3C7Ji2cCCqvtl2IE2E5C8EfsyFTsGlhmtaXL8eVpXqp7z/3N7jsPvs2bYmAq7XKGa6pVeHtjBvO1/gtBlyRqo3tt72/fiS8MKga7Rw1BdBHx+LZKDOlAZcOfPSvwJ3qRFPJaHUIdIEfKGCy2NSCZ8cNM2S3Hj5vycmVDgx2fm0duXA85NVu1zT0azq4VSue/nisOkzYnuIkYVL7Y4AxF+56QZ8Amcee2jE0wNVT+OKmBOpKmDZXv433Ousi/9GHl/A5fvN1RQYhvXcQSbIspOIDM3SLEt7cGR48hDQWCYzbX/d45l5DdKdaUe8JGK5ov8YbRoVZKnGRmJwVDaH9OLle/yCNmBHiX4adjGeN+xmPs6vKHJW90DnenBEeBG7jQa/Rz2RKAOFDt2EkHTAP2UwUt4fufSbU48LWTWBCpZpX9f/AOw040khQW75+vi/Wqw2G0yOA2M9qET9MZmfSABKTd1JsY0nNIKlkb+fpg7O4an2BDm//HKYLHskXsDl4J7UFl7qD+PaKNBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199015)(31686004)(2906002)(31696002)(38100700002)(36756003)(2616005)(5660300002)(54906003)(316002)(86362001)(66476007)(4326008)(66946007)(66556008)(41300700001)(6916009)(8676002)(6506007)(6486002)(8936002)(53546011)(6666004)(186003)(83380400001)(6512007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTFsQ20rN2NoOWx4T2ZRWFhtR0NjSmxtUjk3QkNmejlZTkFBa1ZBUWszLzBV?=
 =?utf-8?B?bzFNc3pRNFZ5aS9DSnhDU1lMSUU0UDRMMFNSTlg3dkZLOEtaVHRLaldoSjFp?=
 =?utf-8?B?VUR0L0llMjVHUWMvK294Q2kyZHhwMVRUQ3pYK05kbnUySGNhNi9nSTg5bFlt?=
 =?utf-8?B?NWdKTkZ1QzZpUWQrWkVKVWswdGRyS1B5M0JiTnEzcWFkS3dqbWRSd0phdFZG?=
 =?utf-8?B?WHJTUHlKdUxDSkkxd0Vheklma0RTM2F3eUYxdnhwS28yUDI3dGNGYnNhTmdv?=
 =?utf-8?B?MEIvRjk2UVlITEZXeGVJTXVXQnRlM09IeTlwc1B5Tm84WitGRlplRWxCZW5h?=
 =?utf-8?B?VEtwaXNRZVREcEtXRGVraDEyUlA3b2svMWlBTFRQSE9VT3NIVktxalJjcjJl?=
 =?utf-8?B?amlJeXkyeU84M25Wd1BIZkYxK2R2amdXN2kvRDVnVjh4N1ZUS3pLOGRWdS9j?=
 =?utf-8?B?UVQxTlRmaE05LzNMdERYeTFENVovVkZ6R1J0YlZHMW5iWkJ6WWhKQTZYQTRi?=
 =?utf-8?B?akVSYkxTYUYzdnF0Z3g4SFFOYWhzbE5vRG9BYmF4bEFRT3diN0ZPNHNoTVRM?=
 =?utf-8?B?akFOZVlFNTBSZUtEMGtMYnBUQTA3dElxUThuK1p1R2MvLytiMkRib2RKdGZw?=
 =?utf-8?B?K0d5VmhJcFowTmtxaDhxQVJNK2tNQ1BKcW9SV1lFV3RianBvVWhvdEpxUENH?=
 =?utf-8?B?QnE0UkdqVUZzV3h3WVo2L2J2di9NQ1BYeHE5NGdYMFcvdzJJVEg2YTBzMHBQ?=
 =?utf-8?B?UjRwQlFCZDFmbFcvNk15RHk4a2xHR1V4WXc1czdQZHBrditpeFBCL3FMMURW?=
 =?utf-8?B?ODlkbFlnczV4K0FiN1VZSVdWT0ZQNnFlb2Zha1FydjlNVUUxRU9yeG50ZXVy?=
 =?utf-8?B?NFcrSDlDN2pLMHgybGtjRmQyTEdtYW16YkNZYkk2bFhiVVl3S2hsdU9WdkN1?=
 =?utf-8?B?eGwwSmhOM3JzOGJ6M0pUSU92ZVVDdGV5ZCtxWGNjTDJEU2I3TkE3ZURjanFk?=
 =?utf-8?B?dzN5TVhGZVU1b0ZaYitFTFBvNDJTaHpWQVA4UkQvSVRRM0swUDlYRmtweWlx?=
 =?utf-8?B?c0c0Q05xQzBZa1lPcy9xMTcvcXFhQUx5c2kwbExBM1BFWndRdVNFYzJzVVEv?=
 =?utf-8?B?ZFlURXNldXhqamxHRGllWjRob0pUTmYxdi9DdVEweFd1YUpLV3RaV1pDb3Qz?=
 =?utf-8?B?ZkI1ckRIV0Vwa2dBN3FkeCtPVnF0QzUwZnM1ajlRMVVNSVJRUVowZXZzS1Zv?=
 =?utf-8?B?clhUVnlZRkg2S3dORVJwSVRuajY4UlhweHJRdzdrS3VpSW44YU02OXo1VzRZ?=
 =?utf-8?B?dHlVbjExWDdKZEJ2aGttNHYzVjNJV0d6U1kzRkZGUDdhUGhrc09mbCsvWHl2?=
 =?utf-8?B?SW55RHo2bTdHNWJHZzBqUDBuNVBEek02OHkxR2kvWGM5d282dkdGWWVaazJm?=
 =?utf-8?B?SHI0eWhIdU05dkFWaElmQUtDbFBFdHY5bXlNN01oRmlPN3RvOVVvSHhISUhu?=
 =?utf-8?B?bXpuc2UrdTBtL3ptTlZEc2g0V0szcVg3bm9HQUhMR3FNdWt0QmhxeDk5YmNO?=
 =?utf-8?B?dHdkb0dKZm9IUElIMTdZNjdTQng5WG5sa2cya3JiOFpwdHk4ZVZDT0JaOHpz?=
 =?utf-8?B?WnJ0QUxJQ3plL1lsdUdjQmE1WnBZVkRLWmJsNmNERlA4SXhvSjY1cFNUait4?=
 =?utf-8?B?VmVBL1loYW9MY1ZmYkxtdmtJUUFSdDBpdjBJVEJjZ2VFQkNkNTJ6TU1CZTBU?=
 =?utf-8?B?MUJvdE1SZVIxZkY2N2NKdWt3MTdoOENjUThQclJMOXBDQjJpWjErZlZnNHlU?=
 =?utf-8?B?cERxWnoza1lIMm56T1d6VDhnRGFqL0NxWjZqVjN0bjAyeGNDK2JFVngwVEdh?=
 =?utf-8?B?enZDK20zREtRSmp4RkVZVDFHZDdDemZER3VoZjBiYWthOGRVOVB0eHlsWURO?=
 =?utf-8?B?elJsV214NmkyTnpPT2VUSS9MNm1OUS9Za0RPWXBYZ0U2bTJhQ3NGMzFaenNn?=
 =?utf-8?B?THBjWHVWUGw3cC9jTzZoRzBsV3FkUGVaeW5TanYwM01BbFU0c3JtaVF6b0Fw?=
 =?utf-8?B?Z0RCU2ZWSmlGS3BUYWtsK1lIRnMrM1pCZUxOKzEvWWlFeG04ck1EUVdybkFB?=
 =?utf-8?B?LzhraHN6cVc4ZXd5MUNyclQ4a0VMbWhlQ043bExpQ2RNYVBOeU03M0hneTlX?=
 =?utf-8?Q?WLtd22VWw6BKmxF1X+gW6ODBozVLI01Q+j/Vf+yyTee7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5929ba24-7ff2-458d-797b-08daf9cf8927
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 03:44:58.4551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRcNAAi8sm0CuEba9FgcK80e2+IZMIjXcTpil8lCPwI/vzX/jx8Gyd2zp+ic539m9QSXkqWgy/TjE1mbJ6XwOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/18/2023 8:04 PM, Andy Shevchenko wrote:
> On Wed, Jan 18, 2023 at 07:27:06PM +0530, Shyam Sundar S K wrote:
>> On 1/17/2023 8:38 PM, Andy Shevchenko wrote:
>>> On Tue, Jan 17, 2023 at 05:58:01PM +0530, Shyam Sundar S K wrote:
> 
> ...
> 
>>>> +	ic_con = ioread32(dev->base + DW_IC_CON);
>>>
>>> Any particular reason why regmap_read() can't be used?
>>
>> Yes. init_regmap() happens at a later stage in dw_i2c_plat_probe() and
>> i2c_dw_configure() gets called first.
>>
>> So dev->map will not be initialized to use regmap_read().
>>
>> In order to use regmap_read() instead of ioread32() in this case, we
>> have to defer calling i2c_dw_configure()
> 
> I think we need to try to be consistent with IO accessors across the driver
> which means to try hard to have regmap being initialised beforehand or other
> functions being moved accordingly. However, it seems a bit non-trivial
> ordering case and I leave this to you, I²C maintainers and this driver
> maintainer to decide how to proceed.
> 

Jarkko, How would you like me to proceed? Would you be OK to pull this
change without regmap_read() or do you like me to submit a patch for
reordering the _configure_* call ?

Thanks,
Shyam
