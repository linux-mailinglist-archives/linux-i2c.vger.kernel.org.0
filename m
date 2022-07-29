Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57842584F6F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jul 2022 13:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiG2LSE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jul 2022 07:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbiG2LSC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jul 2022 07:18:02 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50CD868BB
        for <linux-i2c@vger.kernel.org>; Fri, 29 Jul 2022 04:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDtrh7xXLs/ywHZpbB3iB//sALqx2cdn/R+kFRRM251sU5ibZSfA3oX0i2a9/uQKiqAT4LOinYeZ0VLY+rv2xf1TxkhbSeuHPfqOTa2Njn7Euz1TCotyVXrfA+HvEqkEluxDhDydGtV0Gmf/8c4jdyB9RkZsdaSvkIAxnrPx7+iYLz6ytplLOcPz/FoWqkUJsTOWVLcUaeLdcQP/+eYUaClahvvlSlotcl1/BBbVBb715AFvTP+KBkYSOMpKOgryCKUOsLgPisCgzkQIelDDSLlxvaXHtjRBOQkZT2rO5PgNaulLGaIBY1gLwGQDPpB6/xuzF37JsORPfOm8PaG/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExxjgJY6ictWgMnILCvzWYMt0+D0zteaO447OaQiEvw=;
 b=Vmrhja6b/56SEgx6weDa1hLJPbXEFcUQzU14a4q7zAui8ppEhIyd+a8tdiaaX7jLMzQEZBNLCRiY9vPyKnq0cLdiLk+lZ4Pi2VGg2jcI60p2KcqNu1pou7UVC2531bU/M6VdyF1Y5ybnScyUwCCDBAPkfRtxAj503DbAoPE3RG7ZX/IU9WxxmZewZAoS1hfGZLrCMZqAoiJyY0JffFjJnvP43+uvbHtSnGoZRg/NNts2fbzZZQSGM0CNHZF2GBiPFyDtcqIpdRrvdxlGDHReMom4LW+FWJ5gjaRCxrZxh9sBgLNzDOviE6Sp5JvbgM9n5MZ3ziEB7Cn1OrbzEaPRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExxjgJY6ictWgMnILCvzWYMt0+D0zteaO447OaQiEvw=;
 b=ID3IitfWZY6GUP2kTED8shmnNe3/nsQY1gwXe5OlMbFch8eW/sJvjhuqw5+o9+eDs494GYRYAmELscVUlMlreM3wbBrS21LiisLRzs45oiZMbPZWTPRtA7kdLuhRKGf/DkOSU9ezqr4mTqVcy04vflxJ3xa+6iawGQ+wInKipGs=
Received: from BN9PR03CA0225.namprd03.prod.outlook.com (2603:10b6:408:f8::20)
 by MWHPR1201MB0158.namprd12.prod.outlook.com (2603:10b6:301:56::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Fri, 29 Jul
 2022 11:17:59 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::8e) by BN9PR03CA0225.outlook.office365.com
 (2603:10b6:408:f8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Fri, 29 Jul 2022 11:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Fri, 29 Jul 2022 11:17:58 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 29 Jul
 2022 06:17:53 -0500
Message-ID: <407919d2-c3e3-68e1-30d5-2d2db00db0dd@amd.com>
Date:   Fri, 29 Jul 2022 13:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
Content-Language: en-US
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "git-dev (AMD-Xilinx)" <git-dev@amd.com>,
        Chirag Parekh <chiragp@xilinx.com>,
        "Robert Hancock" <robert.hancock@calian.com>
References: <20220728055150.18368-1-shubhrajyoti.datta@xilinx.com>
 <920041df-0ac2-7298-4568-c8bba4a2838c@amd.com>
 <BY5PR12MB49024F4C35287AF1D66EF4A181999@BY5PR12MB4902.namprd12.prod.outlook.com>
From:   Michal Simek <michal.simek@amd.com>
In-Reply-To: <BY5PR12MB49024F4C35287AF1D66EF4A181999@BY5PR12MB4902.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89fc9ab6-77a5-4bd9-2f37-08da7153fe5f
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0158:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c163Pl4fxlj9hrHaEFRB8rHyhxZMo37eEWaa2faQX6TK4iE7SXNRb/HTTtMUGXAV4sk5jgFN40/NLsggn38UV8lj5eHZyvprJuy/Uivw+78WbimHMgcKw0dllkWQwjhTHT+tpZoUOVdBHg6cfHFXFwj4L9JPyM6qKKXe7ol0NCeWcKhlEU6WbSSQQuiQngDkAEOlMUDP/Y6Imjj6Q6n5EVDQE4Gkrba0UygKxGPCcwqXo7laMRhYK8v7sdWiv+FbeHQ5LViL+CUhKy8/D/vsfGEDEJ7J0ULLn4bCWNhTjXN3Sp/DZkzVt7OGeZiofSBQRX7iJIiQJ6sVc2Pzz0GBtlmd/2Am+DlDNHKrkoY4mzQ+sYIRModdvPhH/mr+m9uARmbsILvHX3gotb6usdIVbe4WeRStqCRKYOvi7GkDoENwlYRu8t3vBex8OL2bABxP5YnxFNu6Aiuzwnw/84iR3H/NwGqjCq7ra9FS5I68ujTeYy37blefIyjp+xf+RpNWlA7R/2HarWpsqcab4PcvxxVF+YOXr9I9cVVS5SLXOoDv84dkG8kY6U7yoFnUSU+grYKuq00+qT04uriTMLeoPrERgtRKF1dXa6I9SO6NUnrJcXPyOUOd5ZI5KyGoZYprYQCZnaReC1VqqwLn4tU4OQNAvffFUtDO0k1jadnMQIPY6rALoxLIEJ2U0xYGCnTmEkL2RCo04DymdTVHJALgTDhvMb2wec5Dtt94Z2oLPK9b09lOsbPExW2W0TQgqszKgkoct8ZgJaSNJAd4hIq/DfV6gIe468yJvzLGsEn8a7o3J9mwOp1KKa0tB1783WC2fJaRliJMTC6ZLe5aJB4XPYkwglXVx3X/OnzE/l6Svz7pnURrj1E6u3QWfNqDVL6V
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(36840700001)(46966006)(40480700001)(36756003)(41300700001)(31696002)(82310400005)(86362001)(426003)(336012)(316002)(47076005)(2616005)(16576012)(2906002)(53546011)(31686004)(478600001)(44832011)(16526019)(26005)(186003)(8936002)(40460700003)(54906003)(356005)(82740400003)(81166007)(8676002)(36860700001)(5660300002)(4326008)(110136005)(83380400001)(70586007)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 11:17:58.9440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fc9ab6-77a5-4bd9-2f37-08da7153fe5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0158
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 7/29/22 13:05, Datta, Shubhrajyoti wrote:
> [AMD Official Use Only - General]
> 
> 
> 
>> -----Original Message-----
>> From: Simek, Michal <michal.simek@amd.com>
>> Sent: Friday, July 29, 2022 4:26 PM
>> To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>; linux-
>> i2c@vger.kernel.org
>> Cc: michal.simek@xilinx.com; git-dev (AMD-Xilinx) <git-dev@amd.com>;
>> Chirag Parekh <chiragp@xilinx.com>; Robert Hancock
>> <robert.hancock@calian.com>
>> Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
>>
>>
>>
>> On 7/28/22 07:51, Shubhrajyoti Datta wrote:
>>> Hook up the standard GPIO/pinctrl-based recovery support.
>>> We are doing the recovery at the beginning on a timeout.
>>>
>>> Multiple people have contributed to the series.
>>> Original patch from Cirag and another one from Robert.
>>>
>>> Cc: Chirag Parekh <chiragp@xilinx.com>
>>> Cc: Robert Hancock <robert.hancock@calian.com>
>>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>>> ---
>>>    v2:
>>> Updated the busbusy check on a timeout
>>> v3:
>>> Added pinctrl_get
>>>
>>> Did unit testing and probed the scl to see the clock pulses.
>>
>> Can you please describe testing procedure? What board did you use?
>> What was the hardware configuration?
> 
> 
> Tested on zcu102 .  and then I called the recovery in send  setup .
> Also I had added the prints in the
> To confirm that the core was calling the zynqmp pinctrl to set pin mux.
> 
> The scl  line was Probed. I could see the clock cycles in the scl line.
> 
> [   84.286340] zynqmp-pinctrl firmware:zynqmp-firmware:pinctrl: set mux  for pin 14
> [   84.293779] zynqmp-pinctrl firmware:zynqmp-firmware:pinctrl: set mux  for pin 15
> [   84.301266] i2c-core: set_scl_gpio_value 164 1
> [   84.305807] i2c i2c-0: SCL is set_scl 1 i ia 1
> [   84.310331] i2c-core: get_scl_gpio_value 158
> [   84.314681] i2c-core: set_scl_gpio_value 164 0
> [   84.322519] i2c i2c-0: SCL is set_scl 0
> [   84.326439] i2c i2c-0: SCL is set_scl 0 i ia 2
> [   84.330965] i2c-core: set_scl_gpio_value 164 1
> [   84.335496] i2c i2c-0: SCL is set_scl 1
> [   84.339418] i2c i2c-0: SCL is set_scl 1 i ia 3
> [   84.343947] i2c-core: get_scl_gpio_value 158
> [   84.348302] i2c-core: set_scl_gpio_value 164 0
> [   84.356135] i2c i2c-0: SCL is set_scl 0
> [   84.360059] i2c i2c-0: SCL is set_scl 0 i ia 4
> [   84.364586] i2c-core: set_scl_gpio_value 164 1
> [   84.369117] i2c i2c-0: SCL is set_scl 1
> [   84.373037] i2c i2c-0: SCL is set_scl 1 i ia 5
> [   84.377564] i2c-core: get_scl_gpio_value 158
> [   84.381914] i2c-core: set_scl_gpio_value 164 0

ok. Thanks.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

