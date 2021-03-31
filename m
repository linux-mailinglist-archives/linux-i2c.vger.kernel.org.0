Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2C635021E
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 16:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236065AbhCaO03 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 10:26:29 -0400
Received: from mail-bn7nam10on2087.outbound.protection.outlook.com ([40.107.92.87]:35393
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235758AbhCaO0V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 10:26:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiZsw6aSBWK/zj1e7J0PqbWs3nhpHY81R/Qj26IXRBt2yUEmp43B6KyJUYLRA8N2ZDSDXbozcZXobbeJDNYBlQjiT5eG559nxtkNseW5i214qmpZZT3N0XQdHQytZ2lfOrPjwQo949WwL7SIrK7XFFbdwDzEzNnlgLdsa6YkmqvVRklp9yO+CFcEZGfV2bQnicmdGos0em1A4A0ECBTJSDhbhu6nnKuumeHkqEsbvL1ag4Km7BCLAtCHMi2+h7jmd2FHtjXMKlG3VJgnm1zkulh8pKeQ6jtEisNhJU4qP36wHKOPbH02nCftUcGGzOXB54+Kqz2e55J4TNLgSD4pPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9mbjDoZsdyiLEcUbebkyskzALUhZWSjPKQWsHYprsM=;
 b=IkAw//u8sty0ImPNu0j3fACgM1bxCOFsKwS8wKO9yPL0jMzLgT4jfqSooxj0xIYBh6V/IWje/OQcFIL2kqAhw+LlV6bztPiiCBNtn9KzP77Yid4O4FPoUr6oIp6Z+te6gTS4ACPiTlZ1fBk98QPZdHTQ56pBPG4Wr03e01kdy8b1Q9Ah5f6AiEFmKz7PHLAmhq9TQmUgtEN3OE5niRTS7lzoqWayoRz8n+MU5KSq+7Cl9MpgA6/T2MMAs15z9Xuj2SKYcwXNmRbSdbStoMRdOgzpoXyMb7RBjnDZpm2qkGJzrHNFIf92z4tBcNJ4ggeKfPuFhaE+ejvBSLyj44+bbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9mbjDoZsdyiLEcUbebkyskzALUhZWSjPKQWsHYprsM=;
 b=L2wCcExwjI4r1cF+GcTDdePDdY0ZJItlYiWG+lAEPgfbMYAHERjhrPCf0eSbHS5PLTv+vwpqu1kVyNwhPDc+aqldUJaKVjawXU2st1NsQNNDssYLPrO81cno0UkVhq6b4HQN697B+x7FBaHpmHrTFFeSz9la3/iOg/1qkQo8J5E=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM5PR1201MB0217.namprd12.prod.outlook.com (2603:10b6:4:54::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Wed, 31 Mar 2021 14:26:18 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3977.033; Wed, 31 Mar
 2021 14:26:18 +0000
Subject: Re: [PATCH v4] i2c: designware: Add driver support for AMD NAVI GPU
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
References: <20210331140730.2058967-1-Sanket.Goswami@amd.com>
 <YGSE5C+3E6BNR997@smile.fi.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
Message-ID: <9136b098-2114-d76e-7595-b1b8b5c7c47f@amd.com>
Date:   Wed, 31 Mar 2021 19:56:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YGSE5C+3E6BNR997@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.157.251]
X-ClientProxiedBy: MA1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::15) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.34.232] (165.204.157.251) by MA1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Wed, 31 Mar 2021 14:26:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9577fee-5d27-4f07-1b78-08d8f450f2d1
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0217:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB021734E88E28EAC4784E8D5D9C7C9@DM5PR1201MB0217.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5zUewk3DYP/7mhZQW6RI9Own70qODWtuJqPLL+T+7SzvrTN0IYEU1FVpLBZhvpdrF7breqcYUbE/dW9MHyM2X1nwh0cREs7KO31I9HgkIO2Z/voSQMX9/6fm4b5cDxFCZNJBzIqtG+e2PixLGbJEZAdqzsjiuxcAl8o4Ye4To043Qxe9IdPYZYOQoeqITgDXh4rNHOebIOqiX6hIDt261/saLobmPHOoB2q0QtNdwB9+CGPrQT5XbOpRY7xIqJsTRfp6ATFUYFdKFHQUwTcpv6pxqI2HuVsbnjia1VntTR56MQR45OcWND0GDhtllymLMYu2A40Fdl8LbtdK7lECnlaxr4heFjcahc6pUL+/L92Jo4b7Fst0aOua93u07HHdsUKEZiR/Fmjn+yJLzJ0+j0soi7ZQzN3KRGLs8/tuwXh3wTpQc/ehGFI05U9TZiX0u2QowCgxcubDaPoQc6FObFHHtSr8E4M59Zk8RkE9920xPj2X2pEmurtgs+E2pWqK8eKv1gtMQoMNa9D3kS0n6CFcrzUyDvHZOzVe6YeIYkduYNGdjEedLyxE39pvlJFLPEEyYQZG7EPt6Bl9w68tb4pqiTAqZV+6s+/KmaC2LeQHAr8om87MIXZ1RtOirlKGdiAPFJIvZZkK0OzAzWykZYgqWWTyUhQlYSH7/09nu/p15A4mGDXm53U3Ly0Iv/1cH5rTgng/LCV5W1kBRiKwhfV00u3JF5u73fephyrZb/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(5660300002)(478600001)(83380400001)(30864003)(8676002)(956004)(6666004)(186003)(2906002)(4326008)(36756003)(26005)(16576012)(6486002)(38100700001)(6916009)(53546011)(16526019)(8936002)(66946007)(52116002)(66476007)(66556008)(31686004)(316002)(2616005)(86362001)(31696002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?azk2SnV1dFkvUEoyM1UzRXZ2aHpvNHBLUFpneHJXalphcE8rbUYwRk5xSFpZ?=
 =?utf-8?B?R2VTWlVFRklEU003Zi9qZ1haODBhWGk0cTV1TTNIclFuYy82Wld6K1dEMzhP?=
 =?utf-8?B?K2VxS0VadSt5OXZsK2N0Nkhua0VEOGpoc2s0a2VRcHU2VlJUdDVWNXd4TzQy?=
 =?utf-8?B?TWxGdUVTTWZCM3RZSCtDOGNyU0NMQlFBN2ZGdnJSZWxQYmJhTC9YZzJmbm5i?=
 =?utf-8?B?cFVmalc5MHdlSFlPYXJBbCtuNXBCNGlFTDR5aDM1aFFoN1hKanpuREFGYjEr?=
 =?utf-8?B?TEZsZDZnZHR1NnJjY0c1RUhubVZNSFFLQ3c1Zy9xaHJ4WFplOCtoS0FOUmF3?=
 =?utf-8?B?aXZJYUZ0ZjJRL2dUT0UyYWNualpMOXd2YUJrYURFejVtR3BSZkVGZHhmdytG?=
 =?utf-8?B?TlQ2WkdZcnh6cXdjUE5HWG1UUGErbFF1bkc1cmJTR2dnUjdMb2gvM3Y4aFJG?=
 =?utf-8?B?NjdvajhFQVN3aENyV3hXM0xFQ2N2NUxMdUhrTkthWElRdzl6bEZJU1lTRlln?=
 =?utf-8?B?YWNNcHRucVJZWHpxdGkzRlNwL3FYTmVGcG5iS2RHQ1hhVnJHNXVnZEF0Z2ty?=
 =?utf-8?B?T29SbGJIbVROb3dhVEJqa0R1Vmthc0RmQXUrbjhuWmU3UmFjZmtrejdHczMw?=
 =?utf-8?B?bGtYSFFWVWFIMW1veUlLMlpOT05yWll3RG1HNEFnNHJpOFZ4aVlqV3FKdEFQ?=
 =?utf-8?B?dGMzbS8yeHBDUm4xczJVUUZiRGFCd1d6eENKTzUxN1RRT1BGN29GK3dGZ242?=
 =?utf-8?B?RnAxMktjWHF1SUJrUXR4TXpxZEFaY3NOV2RDQmZ2OXY3ZXZBS0YxcFdBUzE1?=
 =?utf-8?B?b0QvSDc3RmMwZGF6R1hWRnRTVTlORFFjSDVBZG9sd3N1Nnp2ZmswcUFzMHY5?=
 =?utf-8?B?UHRNRXErcWhiM0RURUdob1dPc2lockNVK1pIcFE1a0FnOWlqajh4bkwxSGFG?=
 =?utf-8?B?dXEyN0pkWG15c2lONWJEdU5yUHFMVnoxTy9uVTM3YW14UWRLeVpsSTBDUUUz?=
 =?utf-8?B?YitsRTFBeEZUNkd6KzNLUnpjVWRuYXBRNytTbFladjF3SGFuUnFIZTVrOEpB?=
 =?utf-8?B?TDVQMWNNMXdyR1lUSnJ6eElqZ3QySUpGaVlGcFc5MFpsTFkvQXAxSUNxU2Fz?=
 =?utf-8?B?VE8rMlZhUCtNWkZaYklhSkd3VUJqSDhucmtFM1M0MmFxQWNlY083K2FoUUlo?=
 =?utf-8?B?K0tmTEM3aFUrMi85M1RwSWkrSmZlTDlPL2svcEljandGamVEM1dleXhRekE4?=
 =?utf-8?B?dHpuQjdoUndCNDBZSFRsL3BLclBXMlpHTVhzaXdHWkRFamdWaG1Eem1zN3N5?=
 =?utf-8?B?Yjd3NnhJbXhZeFhzclByMStsQllMWVJicFFiTGZmL0dlcTlvS3J6dWhUM0VO?=
 =?utf-8?B?VXZObnVESGNVNi9VNzJDeXIvZmhwTmxPbWxidDV4b05yZ1N5bmpXTWl6dGVa?=
 =?utf-8?B?KzZHTFc2cU5uc00rd0NCZXl6ajVjaTczbjV6MXVQdlVMaDV0YUpuVGxYdXVo?=
 =?utf-8?B?TlppdUlvMU5nN3dqeEZ0bUxlcE9sT0Uydng2YWFqNTJmK2ZFK3NXWmdKTDNs?=
 =?utf-8?B?R0REVGYyV25rblpLcU1qLzVaQW5mL3RkVmlCNDczWHpsazFiM1ZueS8yNlVZ?=
 =?utf-8?B?MUc1Z3c3UHJEYlhXK2YzcFJwV3VkSFVaN3RabW1zQ2g0MUlGQUg0TTJnbkpO?=
 =?utf-8?B?RXZKeDJtV0g5RjlsUFE4eXZBQnpGTitHbHFNS2JpRytIamtKQ2NRTytMZnhN?=
 =?utf-8?Q?B2bJ0+icyuBI4dGfhHq/VW+Gm2XBj32cmG3kYnP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9577fee-5d27-4f07-1b78-08d8f450f2d1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 14:26:18.2715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Omo7NvoM6S3m74dq+iKXHqEKBPrTRVTSWjQRBIQjzBX4uTPRdmFykcUj5m7i2FkkQA7rruaYqOeiY3BHU8hocg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0217
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,


Thanks for quick and prompt review.

On 31-Mar-21 19:49, Andy Shevchenko wrote:
> [CAUTION: External Email]
> 
> On Wed, Mar 31, 2021 at 07:37:30PM +0530, Sanket Goswami wrote:
>> The Latest AMD NAVI GPU card has an integrated Type-C controller and
>> Designware I2C with PCI Interface. The PD controller for USB Type-C can
>> be accessed over I2C. The client driver is part of the USB Type-C UCSI
>> driver.
>>
>> Also, there exists a couple of notable IP limitations that are dealt as
>> workarounds:
>> - I2C transaction work on a polling mode as IP does not generate
>> interrupt.
>> - I2C read command sent twice to address the IP issues.
>> - AMD NAVI GPU based products are already in the commercial market,
>>   hence some of the I2C parameters are statically programmed as they
>>   can not be part of the ACPI table.
> 
> Looks good enough to me, thanks.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
>> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> ---
>> Changes in v4:
>> - Fixes review comments given by Andy.
>>
>> Changes in v3:
>> - Fixes runtime PM issue.
>> - Addressed review comments were given by Jarkko and Andy.
>>
>> Changes in v2:
>> - Utilized existing functionality of i2c_dw_xfer_init to configure I2C
>>   bus.
>> - Removed i2c_dw_populate_client and rewrrient navi_amd_register_client
>>   to deduplicate from existing drivers.
>> - Addressed review comments were given by Andy.
>>
>>  drivers/i2c/busses/i2c-designware-common.c |   3 +
>>  drivers/i2c/busses/i2c-designware-core.h   |   8 ++
>>  drivers/i2c/busses/i2c-designware-master.c | 133 +++++++++++++++++++++
>>  drivers/i2c/busses/i2c-designware-pcidrv.c |  61 ++++++++++
>>  4 files changed, 205 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
>> index 3c19aada4b30..fdc34d9e3702 100644
>> --- a/drivers/i2c/busses/i2c-designware-common.c
>> +++ b/drivers/i2c/busses/i2c-designware-common.c
>> @@ -150,6 +150,9 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>>       reg = readl(dev->base + DW_IC_COMP_TYPE);
>>       i2c_dw_release_lock(dev);
>>
>> +     if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
>> +             map_cfg.max_register = AMD_UCSI_INTR_REG;
>> +
>>       if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
>>               map_cfg.reg_read = dw_reg_read_swab;
>>               map_cfg.reg_write = dw_reg_write_swab;
>> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
>> index 5392b82f68a4..6a53f75abf7c 100644
>> --- a/drivers/i2c/busses/i2c-designware-core.h
>> +++ b/drivers/i2c/busses/i2c-designware-core.h
>> @@ -295,8 +295,16 @@ struct dw_i2c_dev {
>>
>>  #define MODEL_MSCC_OCELOT    BIT(8)
>>  #define MODEL_BAIKAL_BT1     BIT(9)
>> +#define MODEL_AMD_NAVI_GPU   BIT(10)
>>  #define MODEL_MASK           GENMASK(11, 8)
>>
>> +/*
>> + * Enable UCSI interrupt by writing 0xd at register
>> + * offset 0x474 specified in hardware specification.
>> + */
>> +#define AMD_UCSI_INTR_REG    0x474
>> +#define AMD_UCSI_INTR_EN     0xd
>> +
>>  int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>>  u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
>>  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
>> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
>> index dd27b9dbe931..e288b654cb47 100644
>> --- a/drivers/i2c/busses/i2c-designware-master.c
>> +++ b/drivers/i2c/busses/i2c-designware-master.c
>> @@ -23,6 +23,10 @@
>>
>>  #include "i2c-designware-core.h"
>>
>> +#define AMD_TIMEOUT_MIN_US   25
>> +#define AMD_TIMEOUT_MAX_US   250
>> +#define AMD_MASTERCFG_MASK   GENMASK(15, 0)
>> +
>>  static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
>>  {
>>       /* Configure Tx/Rx FIFO threshold levels */
>> @@ -259,6 +263,108 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>>       regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
>>  }
>>
>> +static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
>> +{
>> +     u32 val;
>> +     int ret;
>> +
>> +     ret = regmap_read_poll_timeout(dev->map, DW_IC_INTR_STAT, val,
>> +                                    !(val & DW_IC_INTR_STOP_DET),
>> +                                     1100, 20000);
>> +     if (ret)
>> +             dev_err(dev->dev, "i2c timeout error %d\n", ret);
>> +
>> +     return ret;
>> +}
>> +
>> +static int i2c_dw_status(struct dw_i2c_dev *dev)
>> +{
>> +     int status;
>> +
>> +     status = i2c_dw_wait_bus_not_busy(dev);
>> +     if (status)
>> +             return status;
>> +
>> +     return i2c_dw_check_stopbit(dev);
>> +}
>> +
>> +/*
>> + * Initiate and continue master read/write transaction with polling
>> + * based transfer routine afterward write messages into the Tx buffer.
>> + */
>> +static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
>> +{
>> +     struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
>> +     int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
>> +     int cmd = 0, status;
>> +     u8 *tx_buf;
>> +     u32 val;
>> +
>> +     /*
>> +      * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
>> +      * it is mandatory to set the right value in specific register
>> +      * (offset:0x474) as per the hardware IP specification.
>> +      */
>> +     regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
>> +
>> +     dev->msgs = msgs;
>> +     dev->msgs_num = num_msgs;
>> +     i2c_dw_xfer_init(dev);
>> +     i2c_dw_disable_int(dev);
>> +
>> +     /* Initiate messages read/write transaction */
>> +     for (msg_wrt_idx = 0; msg_wrt_idx < num_msgs; msg_wrt_idx++) {
>> +             tx_buf = msgs[msg_wrt_idx].buf;
>> +             buf_len = msgs[msg_wrt_idx].len;
>> +
>> +             if (!(msgs[msg_wrt_idx].flags & I2C_M_RD))
>> +                     regmap_write(dev->map, DW_IC_TX_TL, buf_len - 1);
>> +             /*
>> +              * Initiate the i2c read/write transaction of buffer length,
>> +              * and poll for bus busy status. For the last message transfer,
>> +              * update the command with stopbit enable.
>> +              */
>> +             for (msg_itr_lmt = buf_len; msg_itr_lmt > 0; msg_itr_lmt--) {
>> +                     if (msg_wrt_idx == num_msgs - 1 && msg_itr_lmt == 1)
>> +                             cmd |= BIT(9);
>> +
>> +                     if (msgs[msg_wrt_idx].flags & I2C_M_RD) {
>> +                             /* Due to hardware bug, need to write the same command twice. */
>> +                             regmap_write(dev->map, DW_IC_DATA_CMD, 0x100);
>> +                             regmap_write(dev->map, DW_IC_DATA_CMD, 0x100 | cmd);
>> +                             if (cmd) {
>> +                                     regmap_write(dev->map, DW_IC_TX_TL, 2 * (buf_len - 1));
>> +                                     regmap_write(dev->map, DW_IC_RX_TL, 2 * (buf_len - 1));
>> +                                     /*
>> +                                      * Need to check the stop bit. However, it cannot be
>> +                                      * detected from the registers so we check it always
>> +                                      * when read/write the last byte.
>> +                                      */
>> +                                     status = i2c_dw_status(dev);
>> +                                     if (status)
>> +                                             return status;
>> +
>> +                                     for (data_idx = 0; data_idx < buf_len; data_idx++) {
>> +                                             regmap_read(dev->map, DW_IC_DATA_CMD, &val);
>> +                                             tx_buf[data_idx] = val;
>> +                                     }
>> +                                     status = i2c_dw_check_stopbit(dev);
>> +                                     if (status)
>> +                                             return status;
>> +                             }
>> +                     } else {
>> +                             regmap_write(dev->map, DW_IC_DATA_CMD, *tx_buf++ | cmd);
>> +                             usleep_range(AMD_TIMEOUT_MIN_US, AMD_TIMEOUT_MAX_US);
>> +                     }
>> +             }
>> +             status = i2c_dw_check_stopbit(dev);
>> +             if (status)
>> +                     return status;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>>  /*
>>   * Initiate (and continue) low level master read/write transaction.
>>   * This function is only called from i2c_dw_isr, and pumping i2c_msg
>> @@ -462,6 +568,16 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>>
>>       pm_runtime_get_sync(dev->dev);
>>
>> +     /*
>> +      * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
>> +      * As it is polling based transfer mechanism, which does not support
>> +      * interrupt based functionalities of existing DesignWare driver.
>> +      */
>> +     if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
>> +             ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
>> +             goto done_nolock;
>> +     }
>> +
>>       if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
>>               ret = -ESHUTDOWN;
>>               goto done_nolock;
>> @@ -738,6 +854,20 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>>       return 0;
>>  }
>>
>> +static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
>> +{
>> +     struct i2c_adapter *adap = &dev->adapter;
>> +     int ret;
>> +
>> +     pm_runtime_get_noresume(dev->dev);
>> +     ret = i2c_add_numbered_adapter(adap);
>> +     if (ret)
>> +             dev_err(dev->dev, "Failed to add adapter: %d\n", ret);
>> +     pm_runtime_put_noidle(dev->dev);
>> +
>> +     return ret;
>> +}
>> +
>>  int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>>  {
>>       struct i2c_adapter *adap = &dev->adapter;
>> @@ -774,6 +904,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>>       adap->dev.parent = dev->dev;
>>       i2c_set_adapdata(adap, dev);
>>
>> +     if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
>> +             return amd_i2c_adap_quirk(dev);
>> +
>>       if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>>               irq_flags = IRQF_NO_SUSPEND;
>>       } else {
>> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
>> index 55c83a7a24f3..7ca0017883a6 100644
>> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
>> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
>> @@ -26,6 +26,7 @@
>>  #include "i2c-designware-core.h"
>>
>>  #define DRIVER_NAME "i2c-designware-pci"
>> +#define AMD_CLK_RATE_HZ      100000
>>
>>  enum dw_pci_ctl_id_t {
>>       medfield,
>> @@ -34,6 +35,7 @@ enum dw_pci_ctl_id_t {
>>       cherrytrail,
>>       haswell,
>>       elkhartlake,
>> +     navi_amd,
>>  };
>>
>>  struct dw_scl_sda_cfg {
>> @@ -78,11 +80,23 @@ static struct dw_scl_sda_cfg hsw_config = {
>>       .sda_hold = 0x9,
>>  };
>>
>> +/* NAVI-AMD HCNT/LCNT/SDA hold time */
>> +static struct dw_scl_sda_cfg navi_amd_config = {
>> +     .ss_hcnt = 0x1ae,
>> +     .ss_lcnt = 0x23a,
>> +     .sda_hold = 0x9,
>> +};
>> +
>>  static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
>>  {
>>       return 25000;
>>  }
>>
>> +static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *dev)
>> +{
>> +     return AMD_CLK_RATE_HZ;
>> +}
>> +
>>  static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>>  {
>>       struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
>> @@ -104,6 +118,35 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>>       return -ENODEV;
>>  }
>>
>> + /*
>> +  * TODO find a better way how to deduplicate instantiation
>> +  * of USB PD slave device from nVidia GPU driver.
>> +  */
>> +static int navi_amd_register_client(struct dw_i2c_dev *dev)
>> +{
>> +     struct i2c_board_info   info;
>> +
>> +     memset(&info, 0, sizeof(struct i2c_board_info));
>> +     strscpy(info.type, "ccgx-ucsi", I2C_NAME_SIZE);
>> +     info.addr = 0x08;
>> +     info.irq = dev->irq;
>> +
>> +     dev->slave = i2c_new_client_device(&dev->adapter, &info);
>> +     if (!dev->slave)
>> +             return -ENODEV;
>> +
>> +     return 0;
>> +}
>> +
>> +static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>> +{
>> +     struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
>> +
>> +     dev->flags |= MODEL_AMD_NAVI_GPU;
>> +     dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
>> +     return 0;
>> +}
>> +
>>  static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>>  {
>>       /*
>> @@ -155,6 +198,12 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>>               .bus_num = -1,
>>               .get_clk_rate_khz = ehl_get_clk_rate_khz,
>>       },
>> +     [navi_amd] = {
>> +             .bus_num = -1,
>> +             .scl_sda_cfg = &navi_amd_config,
>> +             .setup =  navi_amd_setup,
>> +             .get_clk_rate_khz = navi_amd_get_clk_rate_khz,
>> +     },
>>  };
>>
>>  #ifdef CONFIG_PM
>> @@ -274,6 +323,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>>               return r;
>>       }
>>
>> +     if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
>> +             r = navi_amd_register_client(dev);
>> +             if (r) {
>> +                     dev_err(dev->dev, "register client failed with %d\n", r);
>> +                     return r;
>> +             }
>> +     }
>> +
>>       pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
>>       pm_runtime_use_autosuspend(&pdev->dev);
>>       pm_runtime_put_autosuspend(&pdev->dev);
>> @@ -337,6 +394,10 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
>>       { PCI_VDEVICE(INTEL, 0x4bbe), elkhartlake },
>>       { PCI_VDEVICE(INTEL, 0x4bbf), elkhartlake },
>>       { PCI_VDEVICE(INTEL, 0x4bc0), elkhartlake },
>> +     { PCI_VDEVICE(ATI,  0x7314), navi_amd },
>> +     { PCI_VDEVICE(ATI,  0x73a4), navi_amd },
>> +     { PCI_VDEVICE(ATI,  0x73e4), navi_amd },
>> +     { PCI_VDEVICE(ATI,  0x73c4), navi_amd },
>>       { 0,}
>>  };
>>  MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
>> --
>> 2.25.1
>>
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
Thanks,
Sanket
