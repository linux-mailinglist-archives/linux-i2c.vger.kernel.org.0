Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBB15BF5EA
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 07:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiIUFcU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 01:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiIUFcP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 01:32:15 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2064.outbound.protection.outlook.com [40.107.212.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4C37859C;
        Tue, 20 Sep 2022 22:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEm2LnE3oE7sY/uY/RnRdE04ByQ723KwkzvtoybkoRaH+/xgyu9VvTiQ7RPKEVfCOiqAAf2bLEVAU/EhbJ6OwcucPotebn+h51Kf2elNAPVx4mJkb/NnTzVDaXBNM07M38RC6xtJCjY/RkCRiCWCeOKV2mmbkjhdO2no4K196pYLKarXvToQiD7asK7bXSpXsdbVrWSIL7HGcib3XtN8j0ELvhFBcswSlCjQglWUbwX+OdtQu2WXc6Yh1/ckZ4S7AxlbMCexqlbeJZG/WQA7wzx7vSHdX1k2HAwhF8MSQ6o5mXYROz4Ce2Uq1NG+sSkAWjU6Uv0JiE1ZCYRHTege/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LecXj3whdfYQH3NjeiCfnskQZ/J2CKV+fZrlsGHcN3g=;
 b=Y/c9858eoWe75J1nYQvrDJQAl09rNYUdfN2YaQV7AnJ0LW7846oQ9vsdku3KneCq4WDd7HsTOMfx3yIHjnuU5MZiFI/SdDLxLnDOZ8ViVws+NsLCEjZMmlhs9LAe1vl76guXa+lxTmD29BqtUY10kzbBL4jY87b2y0rP8Mc+Q0576mEwsQ6EgQBx90fJrTf4Wm8uwG164f6WHN8P2Hj6XXtsCGYFNi2fKVdNAS6QL+Yr4y0PoaY5vTbmuzIEwPz+2zvDPCj3Nmt+l/iPYmap/OY7STyIZ6GbGjpmqexYR5KpGT/GckPxF9891g53lVchjZ9FsrWFD7fELXUTfxPccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LecXj3whdfYQH3NjeiCfnskQZ/J2CKV+fZrlsGHcN3g=;
 b=U2k6ezx1f8ZRE/lBjA1ZMjKm2QACuGvH5mM8ZNbTg3Dmns7UVRbWotlMpikoaSWF9gepwbwwbz9CGdAa/SMaK910Z7LcoGUPo6nYhlN3rN2TNbJLoS4N4oyI1mrNZaL6He4WWc1dqrdwgVwgsIiYoX1zg8iUr6dGDerKzq+WzNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4502.namprd12.prod.outlook.com (2603:10b6:208:263::20)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 05:32:10 +0000
Received: from MN2PR12MB4502.namprd12.prod.outlook.com
 ([fe80::ac92:e220:f51c:895]) by MN2PR12MB4502.namprd12.prod.outlook.com
 ([fe80::ac92:e220:f51c:895%5]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 05:32:10 +0000
Message-ID: <40c6af79-9288-7a67-e41b-30c288dbe1ff@amd.com>
Date:   Tue, 20 Sep 2022 22:32:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/3] Digiteq Automotive MGB4 driver
Content-Language: en-US
To:     tumic@gpxsee.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20220919185556.5215-1-tumic@gpxsee.org>
From:   Sonal Santan <sonal.santan@amd.com>
In-Reply-To: <20220919185556.5215-1-tumic@gpxsee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:510:174::13) To MN2PR12MB4502.namprd12.prod.outlook.com
 (2603:10b6:208:263::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4502:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e6859a-e8e9-4f7b-f16e-08da9b92a177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tU2ELLoNG5n4WEwQMLrGPXN9q7OiVyKb8EZnWmF9VB0ac/xxGYKBXFC/h+jXs/zfkYtha0Nc1wPJgM2RyAkNjZxWTQ4/oyavEX8uz0K4w5Es7+KnxhkyId6yJfl1WiNVz8txO0jd60WMcaSRAYPPn6/eVpaGfYnVodYL5aZHb6/3GJAbTcee775kh8o00bCegLbMvgvdPO3oipimoJYshs603aQExrS+1wEDB2btXM/jyimuSK77eOZhcUZMDzeUZgDAfkt69dED4ckv07/phXEHDjHB+MPXL4Qg8TBjELV6tRv6bGQB91Wtho4t7xZVaoWYk0lqdImj/Q/FFUWRCsrtIcTuMUxMekMytTJMNYTYxLuMTC4pZpjyVww+iTNq7RYBfQCjgOco/acMFHTt0OkgSAyY+qplfn9eeqhjprcMj78YIwzxtY+i31o5EPYuzqMKyXB67dSwHzw4tYYAGVAFEKBquq6zVFX4jb1KucneffnXFi5MFAuyNafb31bcy+G7BeOubqSI/IYFNm6jy049P+uBhXZgV8AjyUZE05WRC45GX0obxo7ln3aebNEu5HxtWb+27Oob8sNg/WbEi1vTW8M2mB7tXxoVoz/CgGLUp4tjURQdjuQq2Cki+7jXDOyBYYygOwdS/NbzBTtcukMpZ9TbX7ld298K+ZCeKCZWK96cwcmkCfpviPPYQtb4S83/Wod5cqffHqQwbcVvFbKRMaUNRUu1fgWemQENt2Tq7P/puJP6lIYADXSoN35IUlpDyD7kZZ3qSpoieDuDmlmvuimEbHreZV+rwDGWnuepn8hh2OY34zWlaMz2+jFAMBITzQbqrvY+W5hXFZPxVZIyF633KnRBXzHC+1fR9fo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4502.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199015)(2906002)(5660300002)(966005)(38100700002)(8936002)(6486002)(478600001)(86362001)(6666004)(31696002)(316002)(8676002)(66476007)(66556008)(4326008)(66946007)(110136005)(6506007)(41300700001)(36756003)(31686004)(83380400001)(44832011)(186003)(2616005)(6512007)(53546011)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzRQdFJvYzh1WGdIN21pUGNqVGhZV3lHWEUzWVVoZnpWT3Y1RVM5bFdhNWRL?=
 =?utf-8?B?TFE4M2dveW9xdzZ3Zk1IK015R0xqcHB4bkk2NlJ5M2oyd21IUk9mSHpNYUY4?=
 =?utf-8?B?RE5La2FvRlFMc1F4WFFVRWplVzZXRTFtM3JIbWhDK1hXOWl6cFlUbGgrRUE5?=
 =?utf-8?B?bTZCQ3NlSExTVlpqdmJVMlE5dnZDcEF5M2kxc2ZMcWY1U1ZCbjF6aHk3dFV2?=
 =?utf-8?B?V1FOU1BxN2plekE2RStPRmlBS0ZZbDRxMmdSRkR3bUxuRGxYZlY4SHN1NTVu?=
 =?utf-8?B?QnB3MUFKWmxiY2VBRklMT2hqelBCUFpCWGlTMkV1N3E1enJEOElIMzRET0wr?=
 =?utf-8?B?Z2QydXNXMmlhTTM5eGw3YTlQRGFWbXhhalFqT2NZRmRqZzVtNlRGVDd0bE4w?=
 =?utf-8?B?ZStXd2FwMG81YlhDY2g1K0xiQWZDcWhNOVJqNzcrMWdlOUhRWmFvYkxOWS9N?=
 =?utf-8?B?TTNObW11R1B4b3IvTXFaS3hac1BVNWVpZTl6bThtYkQ4Y1ZzNFNSNENMWDRQ?=
 =?utf-8?B?RllLWjE2cmRtWHVTWTR5ZG9mYnpiV2R2OTNxS25zL042c1M4ZnlPUVQ0b0Vn?=
 =?utf-8?B?TmgvbnYxSGFDU3NMaUdqUmFmdmFNVmR4bUF3RWpqWnFtM3ozd1MyRzhQUUtF?=
 =?utf-8?B?QXllS2p0YlJDd3FyWnpDNWpQckFqeHRmdk1FeXd5S0wxeVBReHVCS2xENTZY?=
 =?utf-8?B?cXlPL3hLQ0gwWWczMzVKOU96M2wzZDFlYnZYdy9hU1cwUzhYbDdDRVZ0NWJW?=
 =?utf-8?B?N2tIS1FUZEJFOGl0a1lzR2ZOYi83RzN0VTJFd2tvMEJhSUJPYW04WlNPdEVN?=
 =?utf-8?B?SVJFWDM5TjA4M0NFcjVvQ1d3VS9ZNjhxMUdkZ2JwcGUxeXQ4Z2hRMHUzakRh?=
 =?utf-8?B?MDNkQTJKbGVjRTZtZUl5aUx2a1E3Zzl2Tm4xZVlRNCtqVUxwWkJNMzEvUnhY?=
 =?utf-8?B?YStCRy9qVEl4YklFQy9ka25rNG1ERVI1YnhBQ1Z3S3c0dWx2YVVDczNWUW1B?=
 =?utf-8?B?a2JjaHZFRWVkRkwrNGlrbFFwVTl6aFVISFR2anRKREFQOUdJSHc5eUtSNG9Q?=
 =?utf-8?B?NEpvQ1dKVzFQaWIxR3Z6L0NpK0puV1BEcFRNRzdGcUVtV3c2UmRUNkl2RmJu?=
 =?utf-8?B?WjBHUUpuTWxPQ2pjMjBwWm0vbmJLSTRpS2N5NFE3c2hjZHZPZ1RXaW05b1Yx?=
 =?utf-8?B?cmNDZStvckhtNVlMQTFOUFFWTFFIS2x0Sm5SNWFhY2NEQ284UWRFVUdJemFP?=
 =?utf-8?B?blg1R2V3L2FCVDVQM1ducW1JNEk4bWF5Q0ZvcFdRaUI0Z1BEV0RxcFRCOEFh?=
 =?utf-8?B?ekc4dEM0YUJrMGlRRVhwODBUUkFuM2RqZTdsWlk0T0wrYlI2dzdhL3VzaVdM?=
 =?utf-8?B?Nk1Xcjc5RVJTdUtDR09MOEZlYkxKY056eGJac1dNS3dsaTFoYTNGb3A3N1NY?=
 =?utf-8?B?SlZsRWNmUEV0MHRIZ1VLM1ZLVXFOSFlFL2FvMFQ4NmNoYXpNbWR0YWNxTFc2?=
 =?utf-8?B?dlVSaGZCNURZeUo5dFM5R3JKSm1IamRka2VRcDdLOVZLQ0ZmVUtxVzBCTDNI?=
 =?utf-8?B?bFVhbXpZVlh6U2dPcnRkQUJ6YVNGOWxLSGRmcWFGd3RlRyt4WW9jWEZ1TVAw?=
 =?utf-8?B?Z2tyV2N2aE9EcFFkUStHRitQM0VKN3FVYTJCRUl2ejgvRDloNVJtcitpbnFC?=
 =?utf-8?B?WXplZWY0OUIvRExCRGVTdHRzaC9QU0U5UlNjZXhhR0lWVS9NdkxhM2NnK1Z1?=
 =?utf-8?B?UjIwelo5eTZ5alR3Z1R5c2VoeGpPMlZOeEtUZlJGaXJXYlhTNVBwcDFWUkYx?=
 =?utf-8?B?OEVmWmY4bWQ2ME9DM2ZuTS92K3M1L2RzTzFKMVl6TktwUlZVSHVlVnJqNHd4?=
 =?utf-8?B?WmNRbjdjbE01Y1VxeWs4WkFKSkhqcjdDKzV4MTQ2YUFBbDFKeVBDK1ppRnlz?=
 =?utf-8?B?cFk5T3kyV2RramxYcnNoVlZQdGw5NTQ5bHJOMGd0UWtkd1RvSnVBY09HNFN1?=
 =?utf-8?B?cFBEb1N4cXFFM0hyUGk3TmY4dGRqSHowR1IyWFJyclVGNkQ1VHpXK2tweW9K?=
 =?utf-8?B?WTZpb2VPam52QlpjOWFBKzBpMUZLT0dhazRYK0phK2lCTkJXNjA5OXRuWTVr?=
 =?utf-8?Q?jFBQ/z92So1glRAOnQdVnVJ5+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e6859a-e8e9-4f7b-f16e-08da9b92a177
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4502.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 05:32:10.3494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MD6utbhMAiG82fwrpMr63yCpwXNoFEaz1ZWTFU7GEl6u+i5Y3521GO1XuQmZ63r6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/19/22 11:55, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> Hi,
> This series of patches adds a driver for the Digiteq Automotive MGB4 grabber
> card. MGB4 is a modular frame grabber PCIe card for automotive video interfaces
> (FPD-Link and GMSL for now). It is based on a Xilinx FPGA and uses their
> XDMA IP core for DMA transfers. Additionally, Xilinx I2C and SPI IP cores
> which already have drivers in linux are used in the design.
> 
> Except of the required xiic driver alias, the patches are split into two parts:
> the XDMA driver and a "standard" v4l2 device driver. The XDMA driver is
> originally based on Xilinx's sample code that can be found at:
> https://github.com/Xilinx/dma_ip_drivers

Hello Martin,

Xilinx/AMD is working on upstreaming the XDMA driver into Linux 
dmaengine subsystem for use by all users of XDMA IP. You can find the V3 
patch set here:

https://lore.kernel.org/dmaengine/1663631039-49732-1-git-send-email-lizhi.hou@amd.com/T/#t

Will appreciate your review of that patch set and hopefully MGB4 driver 
can be rebased on top it?

-Sonal
> 
> The rest is a quite standard v4l2 driver, with one exception - there are
> a lot of sysfs options that may/must be set before opening the v4l2 device
> to adapt the card on a specific signal (see mgb4-sysfs.rst for details)
> as the card must be able to work with various signal sources (or displays)
> that can not be auto-detected.
> 
> I have run the driver through the v4l2-compliance test suite for both the
> input and the output and the results look fine to me (I can provide the
> output if required).
> 
> Changes in v2:
> * Completely rewritten the original Xilinx's XDMA driver to meet kernel code
>    standards.
> * Added all required "to" and "cc" mail addresses.
> 
> Martin Tůma (3):
>    Added platform module alias for the xiic I2C driver
>    Added Xilinx XDMA IP core driver
>    Added Digiteq Automotive MGB4 driver
> 
>   Documentation/admin-guide/media/mgb4-iio.rst  |   30 +
>   Documentation/admin-guide/media/mgb4-mtd.rst  |   16 +
>   .../admin-guide/media/mgb4-sysfs.rst          |  297 +++
>   drivers/dma/Kconfig                           |    7 +
>   drivers/dma/xilinx/Makefile                   |    1 +
>   drivers/dma/xilinx/xilinx_xdma.c              | 2042 +++++++++++++++++
>   drivers/i2c/busses/i2c-xiic.c                 |    1 +
>   drivers/media/pci/Kconfig                     |    1 +
>   drivers/media/pci/Makefile                    |    1 +
>   drivers/media/pci/mgb4/Kconfig                |   17 +
>   drivers/media/pci/mgb4/Makefile               |    6 +
>   drivers/media/pci/mgb4/mgb4_cmt.c             |  243 ++
>   drivers/media/pci/mgb4/mgb4_cmt.h             |   16 +
>   drivers/media/pci/mgb4/mgb4_core.c            |  554 +++++
>   drivers/media/pci/mgb4/mgb4_core.h            |   58 +
>   drivers/media/pci/mgb4/mgb4_i2c.c             |  139 ++
>   drivers/media/pci/mgb4/mgb4_i2c.h             |   35 +
>   drivers/media/pci/mgb4/mgb4_io.h              |   36 +
>   drivers/media/pci/mgb4/mgb4_regs.c            |   30 +
>   drivers/media/pci/mgb4/mgb4_regs.h            |   35 +
>   drivers/media/pci/mgb4/mgb4_sysfs.h           |   18 +
>   drivers/media/pci/mgb4/mgb4_sysfs_in.c        |  750 ++++++
>   drivers/media/pci/mgb4/mgb4_sysfs_out.c       |  734 ++++++
>   drivers/media/pci/mgb4/mgb4_sysfs_pci.c       |   83 +
>   drivers/media/pci/mgb4/mgb4_trigger.c         |  202 ++
>   drivers/media/pci/mgb4/mgb4_trigger.h         |    8 +
>   drivers/media/pci/mgb4/mgb4_vin.c             |  656 ++++++
>   drivers/media/pci/mgb4/mgb4_vin.h             |   64 +
>   drivers/media/pci/mgb4/mgb4_vout.c            |  502 ++++
>   drivers/media/pci/mgb4/mgb4_vout.h            |   58 +
>   include/linux/dma/xilinx_xdma.h               |   44 +
>   31 files changed, 6684 insertions(+)
>   create mode 100644 Documentation/admin-guide/media/mgb4-iio.rst
>   create mode 100644 Documentation/admin-guide/media/mgb4-mtd.rst
>   create mode 100644 Documentation/admin-guide/media/mgb4-sysfs.rst
>   create mode 100644 drivers/dma/xilinx/xilinx_xdma.c
>   create mode 100644 drivers/media/pci/mgb4/Kconfig
>   create mode 100644 drivers/media/pci/mgb4/Makefile
>   create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
>   create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
>   create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
>   create mode 100644 include/linux/dma/xilinx_xdma.h
> 

