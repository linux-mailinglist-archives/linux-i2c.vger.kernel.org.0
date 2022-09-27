Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9AD65EBB1D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 09:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiI0HGn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Sep 2022 03:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiI0HGm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Sep 2022 03:06:42 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A7B26113
        for <linux-i2c@vger.kernel.org>; Tue, 27 Sep 2022 00:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzKukyOBr+RMljnVitav6YZRybvTeeY89EDfRaAcpM92iTwWQhHCoOSBh+H8JEGpRO96ZeiX1cGO1aMTKw0fiu8Fv6T7Nnv6ZIwAVN7uDilVquAaoObvqpW2K41TFeCxdOnMBUTwsH1lTiTGw/cbcER32gdPF+pW6Ii+qc3DagM6+irbYctPUKbgCx5vQWTAJ+JnIog3a+MpcrndUbxAm55nPzFDbadOD1DOJuZHRMnhPgUrTKAqLXFN9t1X1YVFHFK3KsOXsQiTjXgnomLA+pfocwgs1bdUASYtA3PZ4QjlTX2nxXqkldhuXsmROXcSqdjtWFCD7yGJACyYXWb6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoonXQcMs0BM6ZPtSwewq4DdizKqTZwCcQ30E1D2+kA=;
 b=AeEky+lSgEWpK1DbmoWf4WhFgF1l5cx7/3gAgCbhX+xg1vKhhU6tfsMHKFClgVtzdSEVnqifyz8KtV6Taambg6nko3KWd2YV09TAA60XctGbAII3/epDLXGULDB5JWCiF1KQluQuEylws6iNB8MbJQKTYSmdCaYjgNPwfNZq25D/9RmzbgeR1HLE2uxaZJPxY23w9me9zOoxe+grqxtBKlNDLelSaLSxZ9lQKtDoZOOzK1a1GhNsdcRthtA1ZlqN8sN0nyKm0jq/xdOzQfNGbuA73dMw6OQYQ4TcJ0XkZgSwNqrEY0D4WribpmrxoXNk1XoXb78Lew/NuNPuUbC4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoonXQcMs0BM6ZPtSwewq4DdizKqTZwCcQ30E1D2+kA=;
 b=5I/IZnJiIISAwxmr1jISKVezEp14Kw9L6cDG52Jq/4a3XOp0DEnDvpVu+HP7wVitej9y7H9HoX7dCWwDV9NnQPLaMPabiWuWd8O9MO4TJA+0nS0VttvNt6RWCauPpaP8Z97zzfrwqWjsqFmmYhONxH0HellTqQGUF6DAyJxx+ek=
Received: from DS7PR07CA0018.namprd07.prod.outlook.com (2603:10b6:5:3af::27)
 by DM6PR12MB4563.namprd12.prod.outlook.com (2603:10b6:5:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 07:06:38 +0000
Received: from CY4PEPF0000B8ED.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::b) by DS7PR07CA0018.outlook.office365.com
 (2603:10b6:5:3af::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 07:06:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8ED.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.14 via Frontend Transport; Tue, 27 Sep 2022 07:06:38 +0000
Received: from [10.254.241.52] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 02:06:32 -0500
Message-ID: <467ccbda-3e06-57ec-564d-00926c10725b@amd.com>
Date:   Tue, 27 Sep 2022 09:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
Content-Language: en-US
From:   Michal Simek <michal.simek@amd.com>
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
 <407919d2-c3e3-68e1-30d5-2d2db00db0dd@amd.com>
In-Reply-To: <407919d2-c3e3-68e1-30d5-2d2db00db0dd@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8ED:EE_|DM6PR12MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: ec33c484-235f-4565-8e42-08daa056d23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bQDcVpcYVuutgMkjDkqiWNXzsULXFEH3epCr9eV4HemRPgXv1ObiIo6N18e1ZLCz35hznk1A/a49tenG9xNUR6LaMtK8ydfQqTe5oQWWaw8XMJOAQWSS1NS5VhnfdRCs632Tcfa3fxj3xne5i+CY8qURH/w4Fr2TOMZcWX9ZGkdu8dlCNP0URFQdCS6SRw0MmzAB3h8SLlcwwUcCLxB7OSZU6UQNryvNJcil/NI0tGVaS+hHLKFg/JyQIAgfpBrDuh8825yus5DWL/S+yF25mQS4ao4+T0Ci3tD2RNrO3JBRh86WB4GgF/uhH7TqJzARB3qwM56DLh8zLmYrlWp80bjLc5xDvyay3cSneU6Z7CoHJRXRfLitdhL4lFgYBM/AXCHzqbY0LrUdhUGbrU3gi8DIyd7zy1NTJN68sVY8Y3HluJuJx968F8YbLOb6xRHnIIANAOX3tP1XqSnbv/TMM0bU9bI8xRpjYVp7/6/IHtnG5EUmfjCnnodEhOW6vYDnkAkU/B8TjhpzZ5xuIhCabZuAuVkCbsqy3zmBJza1Q8RrUapqRpAeLHst6TU/GObRoesuD7sdmJLGAvvQJqYsl4PBdfCm9KSqx2LyP2hEo3zPoq6l9AVPAsbU/Ut5rJcOiMGLEG2epq8H3fZrlmE6iwafJmoVG6iVcJDt1ZBd9vjNcmdS65t3wdOxfUukuh0ouw+mbXddj/Ynk0fjQ7VLX0QU+u2AoXIDRX+d8tTimFBGUTlPvztDoA3fg9FJc8MAXgt2+OPc43c2RJrCykgY0e8X/FXUloUYDbfAgIi7pwObQLqDr0MHiUnmSIHIzIPFIA9+8bX8KNYnLnzveGTLCg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(53546011)(41300700001)(478600001)(47076005)(83380400001)(426003)(40460700003)(186003)(336012)(16526019)(5660300002)(2906002)(82310400005)(26005)(40480700001)(44832011)(54906003)(110136005)(2616005)(8936002)(70586007)(8676002)(70206006)(316002)(16576012)(4326008)(31696002)(82740400003)(81166007)(86362001)(356005)(36860700001)(36756003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 07:06:38.0043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec33c484-235f-4565-8e42-08daa056d23e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4563
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 7/29/22 13:17, Michal Simek wrote:
> 
> 
> On 7/29/22 13:05, Datta, Shubhrajyoti wrote:
>> [AMD Official Use Only - General]
>>
>>
>>
>>> -----Original Message-----
>>> From: Simek, Michal <michal.simek@amd.com>
>>> Sent: Friday, July 29, 2022 4:26 PM
>>> To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>; linux-
>>> i2c@vger.kernel.org
>>> Cc: michal.simek@xilinx.com; git-dev (AMD-Xilinx) <git-dev@amd.com>;
>>> Chirag Parekh <chiragp@xilinx.com>; Robert Hancock
>>> <robert.hancock@calian.com>
>>> Subject: Re: [PATCH v3] i2c: cadence: Add standard bus recovery support
>>>
>>>
>>>
>>> On 7/28/22 07:51, Shubhrajyoti Datta wrote:
>>>> Hook up the standard GPIO/pinctrl-based recovery support.
>>>> We are doing the recovery at the beginning on a timeout.
>>>>
>>>> Multiple people have contributed to the series.
>>>> Original patch from Cirag and another one from Robert.
>>>>
>>>> Cc: Chirag Parekh <chiragp@xilinx.com>
>>>> Cc: Robert Hancock <robert.hancock@calian.com>
>>>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>>>> ---
>>>>    v2:
>>>> Updated the busbusy check on a timeout
>>>> v3:
>>>> Added pinctrl_get
>>>>
>>>> Did unit testing and probed the scl to see the clock pulses.
>>>
>>> Can you please describe testing procedure? What board did you use?
>>> What was the hardware configuration?
>>
>>
>> Tested on zcu102 .  and then I called the recovery in send  setup .
>> Also I had added the prints in the
>> To confirm that the core was calling the zynqmp pinctrl to set pin mux.
>>
>> The scl  line was Probed. I could see the clock cycles in the scl line.
>>
>> [   84.286340] zynqmp-pinctrl firmware:zynqmp-firmware:pinctrl: set mux  for 
>> pin 14
>> [   84.293779] zynqmp-pinctrl firmware:zynqmp-firmware:pinctrl: set mux  for 
>> pin 15
>> [   84.301266] i2c-core: set_scl_gpio_value 164 1
>> [   84.305807] i2c i2c-0: SCL is set_scl 1 i ia 1
>> [   84.310331] i2c-core: get_scl_gpio_value 158
>> [   84.314681] i2c-core: set_scl_gpio_value 164 0
>> [   84.322519] i2c i2c-0: SCL is set_scl 0
>> [   84.326439] i2c i2c-0: SCL is set_scl 0 i ia 2
>> [   84.330965] i2c-core: set_scl_gpio_value 164 1
>> [   84.335496] i2c i2c-0: SCL is set_scl 1
>> [   84.339418] i2c i2c-0: SCL is set_scl 1 i ia 3
>> [   84.343947] i2c-core: get_scl_gpio_value 158
>> [   84.348302] i2c-core: set_scl_gpio_value 164 0
>> [   84.356135] i2c i2c-0: SCL is set_scl 0
>> [   84.360059] i2c i2c-0: SCL is set_scl 0 i ia 4
>> [   84.364586] i2c-core: set_scl_gpio_value 164 1
>> [   84.369117] i2c i2c-0: SCL is set_scl 1
>> [   84.373037] i2c i2c-0: SCL is set_scl 1 i ia 5
>> [   84.377564] i2c-core: get_scl_gpio_value 158
>> [   84.381914] i2c-core: set_scl_gpio_value 164 0
> 
> ok. Thanks.
> 
> Acked-by: Michal Simek <michal.simek@amd.com>
> 

Do you see any issue with this version?

Thanks,
Michal

