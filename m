Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 518B3756A3D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 19:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjGQR0A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 13:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjGQRZ6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 13:25:58 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA95E172B;
        Mon, 17 Jul 2023 10:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIDEkVUsi3O+mmzrmn6hLLrj5koGKJ1ehO2c0tbpyqRHIPMSuotcZf7RQ761Y7WlCkWj613IkXEqCWAZJ7m8X/MyB5pGVn7yc7wtymF2NdjuMnUi25ZPmLDD4o8tNqwBKZxEFy9sT2Qwc0ICWA1IguRfymX88V5a53XfAnopzXZkNcPpaFeoftSNSnZ4HIQFHJXz1XnBHL8JrBX1giVWwBnTL/PpNHkh+HzQKflXwykg0M+mlTieJqXY1a/s8sQk0hPdE8UvzLbcZt98Pwg/ZhdOCs5utmEagqwSPdYrX5yI85D7Utpyel9B94/MXRmhIu3ER9YqSXKudIUmqPIZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEBKpQEmabVollA9l1d335ONcUXXHePHQb8C7vflJ54=;
 b=ZrH5ujXDKrs/E0TCYXRhhv2k4hY/y3L9gMQwnZy0uDSbE11wbNtkrjyI43d7CivinB43BCKnTLr5O6IaVNksoPL2DbDz3PXe+lw5rvwmnQoCiVVWSQCyW3+JEqBwlo+5ljx3tLryo3C7cHZ6LTb1q/DER01gDMD17V5rzQY9jOaVdDKIvCJWGA3lSP3+soDPfQCzXs7N/1teg0pRanXT0Ut8Ynl8rSpI6/tptsE4z4K9ApJ0hfz//tkB/mXUD87HXbIP4Y2KQzMuDt4SRdDHZAClawn4RVOXrsJxDel/OmkqdB9ENgmJUoW/piOkaXeNCDDUJK4xthUZPY8noZnNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEBKpQEmabVollA9l1d335ONcUXXHePHQb8C7vflJ54=;
 b=T+BOK9UBGMbnxjBDAyIjbMQKCMoqt8LARArJRTKrJo5XkyhLcWRT/alW45moMbYXrvPjmSqmnoXU+jee8urAGZuegZeSmt7im2TCyTX2ZKFwKDSK6p6D8A6TLEccDZmg2554yJYJBxeadXdN/bYdhjNHkrhR8wsHbxOFZqQb0D6mc3sgFabZ82nJe52XuZXi68ISJIT1DMctQbSoUEJdcLM7ZwJo1Ys8rKjHj2QUQznAjdX9pkLZhueM7j24PjC9DVTDIv60qVfFcVMA7ccMClU8O+xp/HdBMTXNbkOx9LsTliDWDF6+Kt0MHd+mehyMO+O7j8EyKnZXUg3cpxfjyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Mon, 17 Jul
 2023 17:25:43 +0000
Received: from MN0PR12MB5762.namprd12.prod.outlook.com
 ([fe80::dc1f:d331:aa12:a7be]) by MN0PR12MB5762.namprd12.prod.outlook.com
 ([fe80::dc1f:d331:aa12:a7be%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 17:25:42 +0000
Message-ID: <2a05decb-de03-6fb6-a436-d0e483553d03@nvidia.com>
Date:   Mon, 17 Jul 2023 12:25:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
References: <SJ1PR12MB6339382ED219ED363041659FC03BA@SJ1PR12MB6339.namprd12.prod.outlook.com>
From:   Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <SJ1PR12MB6339382ED219ED363041659FC03BA@SJ1PR12MB6339.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To MN0PR12MB5762.namprd12.prod.outlook.com
 (2603:10b6:208:375::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5762:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 680921be-5ce0-423a-794d-08db86ead8d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ws8eABkWhN5KAilOMmyUTJ1mcC4pyMZLXrBq4D9FV2cb74GhlbQvxEWJIIjYzyk9d0ij85tqSw6YmyOpaeyQBR9RF0FII7g6O2u3QGvZB13J1THhJCtjb+SoTEUOyL/oSrlJUg30mAENod2OhWFs3lNpklRJO/U0LHN7oUwbHGq3g9ciuQhdttVf8VZH0kdhg8QllBvG9mcbOzqwi+CbNrzEub1dhCeP6HoFjNJie+UKpotzuM9gl0hflP/nxnO63Nh5THze5lOqZ62VGU6Df75yPBmDCQEIsVOUdYyvkny9bixSW2feKDAal4pyAJ4mJ1BoieeAm+uo9sU3q2nJG8tDqRnIZ7tlJqQCHscnatGXMhVW4nMePy2sfVkr2uYLnpeJRNOQyPdz72WVUakF6irqpCeazBl/7uDNCGYIsczm4zbDA1/6TNbOKXjL0sc8PIBX3jtbfMrNtuB2gwNW405FZ2MU9aE1eQzkzNBwSjk8Tvixgbmc97d+zFoWk38vdZxYoF1Tn15AkP7yn4ubpzaroZAI8ZFZtBNU7MuaPUQ4A++4zjbGtyKQ6vJUlSc3QhoC6IKOgYKCb2Pua5WlOdEhSVLb3H/xtnkAkSLgTGXpoi6YuMC9Vy63t9qi/KsYVxENuQ8Np71K59LodqOL6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5762.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(2906002)(54906003)(110136005)(4744005)(86362001)(66946007)(31696002)(66476007)(316002)(36756003)(66556008)(4326008)(5660300002)(186003)(26005)(53546011)(6506007)(41300700001)(38100700002)(8936002)(6666004)(6512007)(6486002)(8676002)(2616005)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29Rbi8zemQ3SkcyUmRyNzU4VUVFcDRpK1JiZVExR1hGVW1WMElGWUlGeWdr?=
 =?utf-8?B?Wkx6SGRCZ2JkZjZBZW9SYXR0em1sSUFSTzlzN0dTM1BsWG5ydFJPMitYeXlq?=
 =?utf-8?B?V1hxWnkvRDBWTVNMNXV4WnlvTDZxckU5emxid3Z6VS9xWmxPNDUrb1Rzd1Yw?=
 =?utf-8?B?UVBlRXJGNmZQaXJTVWVhdTNWNFJrY2JWNFA4RTY3WVpUQUxHMXJhb20xT1gw?=
 =?utf-8?B?RVZhNjRaeEpxZDB0RmhlT0xoOVgvb0JxTkZkSURNZndUVXFoTFdxZkw5SUNp?=
 =?utf-8?B?WktWNlZOYUtpWHBTU3RnQmZTMnVMUVVGQmI4Rmk1bVpHdllLTlFZSXhqZEpF?=
 =?utf-8?B?WUQxRHE1TVNhc01OSXlDN2RxMEtFSEN0VUp5WlRvajliSjZMbGNDYkIzWmJD?=
 =?utf-8?B?MmVxQ0Z0QnBUckxseGZxMEp3TVh1ZHNwZVpDNXROR0NKNGZkaGVCb3k2TFlW?=
 =?utf-8?B?R2QvcDNIeWY4V25kcU8xVTlCaVVnV1VTUXRicVFKZHNOZW9KR3BlaG1DVDVG?=
 =?utf-8?B?TnljWVhWUmxuaXU0Z1ZGVDdBRlF1TlRXM2o4Z2xpa29yWU52bFlxZFMxdG9F?=
 =?utf-8?B?U2xnQlhVVTNobXowTkh1ZmloZlN1Qnl2MlFBNS9hZEs2VTk1bUs3RmlzbVNE?=
 =?utf-8?B?SENpb3RwdXJVOHhHaU03aW9acEhWNnVvR3U4aGY3NmV1NHczOWpYdDhPTmFy?=
 =?utf-8?B?TUxsQ1UzajAyd3RRTGs2am9rT05TQTgrbXJ0c2psd2ZTdW5zSTNhVEZVczdI?=
 =?utf-8?B?NW1hMlRiOG5UTmJ1bEFTVUQyZXEyVWdXUGZ5eGJNalZ4MmJTMGVIdWJIbTJU?=
 =?utf-8?B?dDduVTR0LzNtL3pQNWE0OGNtejh1Y3h0K0FmR2pvR3NyZnpSQzdxZzFpUTM2?=
 =?utf-8?B?d1ZXWTYyMGxTZkRCSjVOQUVzN2dsSWZPN2hCUDJFN1p0WlUxa0VCck1PdGU4?=
 =?utf-8?B?UVBSbVJwbkNVc2hUcFNRNmtFckc4VVE0K294Nm1SNy9vaUJUV2lNbDhVMm1w?=
 =?utf-8?B?c29FL0Q5V1c3Vk52Sy9iNWZ0L1lpSEFYdVNLVEthWms3alFrRnJ1czhvUkE5?=
 =?utf-8?B?V2dLMWppM0QxWGczY2UwcjdSSEM4cmNOUTdMQUs3VFJ2T0hCUWM1Y3NOc3hU?=
 =?utf-8?B?cEJxN2JucE9Ub1lYWUlrZ0VOd3VEalVtRnZwaVNzS0RhQ3hJTTBjQlFMSGZy?=
 =?utf-8?B?enZiNkFBZytDajY1N1IxSFZrRkU2dGUvSFh1eWpTb3c4UzZsYjZnd05McHFR?=
 =?utf-8?B?dTZwd2VRVit4RnJwSmUyS0NQUlB6ODlSMnpoSmorTDR3WmR1N0RhU3VpWkQw?=
 =?utf-8?B?YnVORnpzdk0rVlFMczd3V0tjU0pqUlpSZ2k4L2NQaDY4TlE1TkEwZkM0VXgz?=
 =?utf-8?B?QTF1YzYrQ0k1ckRiVE44OHdiNGdlemJJbjF0L2pzVTU5bWxidmt0cGIxa0RY?=
 =?utf-8?B?VkpMdnVReE9OQjNPK25XdmJLRUI1N0dRbjRLd3pyY3lvQVJONmk2UE51bEU0?=
 =?utf-8?B?bDZya0hpbUR1NlhVQmxIV2MyTFo1c1JkWHdTalFQWE55d3pPWkZPUlhtL053?=
 =?utf-8?B?Y2hnWTVqbVJnVkxVT1pYSVgwMzFYalVYcHlkSmZMeGJlMVdYeHQyck1LSUdy?=
 =?utf-8?B?WUpOTFBZcWhsZTkxaVhBS2o0MEpuMGtHTFErWUJ5RGc3Q3lpeExzbVd4cTNI?=
 =?utf-8?B?M2ZMbUpnRExzdVczR3hXV1BEanNTdVdEYTF5aVdLcjBVbWplekszQmhuaWtU?=
 =?utf-8?B?cFlUQlkxWTBHb095ZEE4RlZ3WXY5cGc5WCtwbHllOUEvWVUwdGQ5Q1ZSTjh2?=
 =?utf-8?B?Qmh2MXJtbVRVbVVLajhoSndYMHlQdS9GNW82TWtNQ0xLclE0THdLeVlZOTF0?=
 =?utf-8?B?bitXZzF5SmZzS3R2RFI4ZitnMWFMRzh1K0NnQ3BDL1BWeUtqNEs5Mkxpb1hW?=
 =?utf-8?B?RWtQZVJaUHRLYllWM3JqWkw1VU90V0JTOExEaUpKcVNrT3lWdTh0TWdMRjdr?=
 =?utf-8?B?SDArYU92c1llamlBNHFtZFJIK1BsRkF0NXAyOVZ5UDlJUXdoeXkyVFZYOUpG?=
 =?utf-8?B?Zm01R0xnS1g5czMvZ3owMkdMZEp1VkVPZ3pmdjR1MUhCZzJuSnR2bEQ3ajNs?=
 =?utf-8?Q?cQv17qlLAhxeiertQJMwu1WTN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680921be-5ce0-423a-794d-08db86ead8d8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5762.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 17:25:42.4974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D69ouSYToJUC5hvBP4XRqhDz3tS4tYWf02AHltu7fTCRms09q4k3vZsIAkpVnaMbh2d9nT/8tOsm0PSFxmPBTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/17/23 12:15, Akhil R wrote:
>> If the driver fails to obtain a DMA channel, it will initiate cleanup
>> and try to release the DMA channel that couldn't be retrieved. This will
>> cause a crash because the cleanup will try to dereference an ERR_PTR()-
>> encoded error code.
>>
>> However, there's nothing to clean up at this point yet, so we can avoid
>> this by simply resetting the DMA channel to NULL instead of storing the
>> error code.
>>
>> Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
>> Signed-off-by: Thierry Reding mailto:treding@nvidia.com
> 
> This fixed the crash issue seen when there is no dmas property in the device tree.
> 
> Tested-by: Akhil R <akhilrajeev@nvidia.com>

The kernel crash issue has been fixed with ACPI based kernel on T241 (Server) platform.

Tested-by: Shanker Donthineni <sdonthineni@nvidia.com>
