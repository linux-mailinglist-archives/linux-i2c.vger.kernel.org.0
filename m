Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2523501B8
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 15:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbhCaNxY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 09:53:24 -0400
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:40586
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235841AbhCaNxX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 09:53:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MN5z72ltrRNpwGfW3iigyQzXi//97TjTCm+8TlyAxBtw+RUlZFFn/16XeF+2zFWhup0yYr2z5X4Z4CwIsY1pcnDLSNOZphf54u36bOv/I7KGqYm7mJH2sF0OGZnWe3omIJFDExk7H0u8Fmar3Ht39wl5Dh6mxD7lb2QbQiWjvWkByC4puZTQ31bzw5/FS1ILk5CC4zrc6EbdRyjYMi7b5boEkT65wJmHqj8OV8QSZ2Rpg937ZUSDS2RqXWC6sXWssRgwCUcWTMs0reLAtaG/yYh4dvLfQLXZXj+LdUWkzNU6z1w2poABiXHQU+zyCIWYXTwS9c5sEi/SMluR8CxnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqlLYL0lfdJHB1OryJ77rfOZ0uuaqDs9TRaMDoV8gtc=;
 b=gLpCWr715Nes4wKC4dR2UfKKYWkwR1fcz03gqSl/LIimjOImMEHhUw4IyhbpSKDX/Z97Ri0xrxlU8afJo2U6F8YfCZkNb06XoLHeozdS42sKXPGZaKUYc8SEoKUs/K6EEIt1PN7s/mTA7TjGjlIoPESZvhU5EZKNmamuNNFuR3QSKlid/ElNBH3ZH0/ozYyxCwPpmAX/kbrVm46bl7ORW3fKcUZ3jSpaRbzCP14FGzb9HtqeMKBaNxXGA77oUolcBW9XW39ZNPpWVummSmjXS51z91W6naxjqy3PXyEiSRD08LeGg8vAnYml8sLcjGTWOfq0ekBvojTqsjFPtd3lQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqlLYL0lfdJHB1OryJ77rfOZ0uuaqDs9TRaMDoV8gtc=;
 b=Q/0XFrmRH9VgNBvG4NIN8VZyN/0sHfcSHKUZK5iawCqHDHJlykv1Uyi2KNTyYiLuZVci7dO2E3Ngn/JtEYRxyXcKkj2R5D9o3xR+VupEkNgX/D6veYnjJieSQ7zQg/FMKfSOIegNxQRxZvmisHOPiCvpghI2H7KJA/bf/VKqFKg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1835.namprd12.prod.outlook.com (2603:10b6:3:10c::9) by
 DM5PR12MB1834.namprd12.prod.outlook.com (2603:10b6:3:10a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Wed, 31 Mar 2021 13:53:20 +0000
Received: from DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052]) by DM5PR12MB1835.namprd12.prod.outlook.com
 ([fe80::508b:bdb3:d353:9052%10]) with mapi id 15.20.3977.033; Wed, 31 Mar
 2021 13:53:20 +0000
Subject: Re: [PATCH v3] i2c: designware: Add driver support for AMD NAVI GPU
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
References: <20210330064715.3620864-1-Sanket.Goswami@amd.com>
 <YGL0hogMK6Uqjx/3@smile.fi.intel.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
Message-ID: <b03c8a5f-bd32-43b6-f1c5-1ffe970826a7@amd.com>
Date:   Wed, 31 Mar 2021 19:23:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <YGL0hogMK6Uqjx/3@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.157.251]
X-ClientProxiedBy: MA1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::28) To DM5PR12MB1835.namprd12.prod.outlook.com
 (2603:10b6:3:10c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.34.232] (165.204.157.251) by MA1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Wed, 31 Mar 2021 13:53:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48a1fb14-e3fd-43bf-f11a-08d8f44c57c5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1834:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18341073FB96CDD105848C5D9C7C9@DM5PR12MB1834.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRrHYBSFg+Ay8y6xAD6xepxCXR6zNHEAkRFgJzDlUlFeifiWn5G3R482iTfyI42StphycrKnuVCzkIfOCVRAEadzaJEHBQLHollDHwcWuTTOnvRwMAma/2S1gg3mu3s7DSqq5/Lzjz1/eKwfuXdREUvg4YOzpFGNqxJm+UZcpmA9Bqz5HuwfV76GDEzUWIBfGqXXJ1bMeBSz8k9FIzqz7/zf0TQKTheJYR6jEArdO8QO0ZhFd81lquJO8ERMjXsfxTsAGImYd9HddTeUhKOIT/uz3Xy0TtZBT/bsPOvzoazktdR7/zD7Y3zMQYb1SV4YYhKX3MGhTbTprcbSFAU2NbMAKnV5KYQw3PEgU9pTOd0cCxAToZdO5dqdhe3zcLnEdB6ect59sRghYL/BGHJjgaUb1/Z44oPCng3+X5ChncQG50k+r932sbtgv/wCMAVtULJUTRetfEi2SvSuK+wTNBjXIexBklKNAzOww/3j2LKBGaKjwkbUpt7CYrWZOnHRva2FdHyjS7S10RFWBilH3fR6veTWlz8D5215JL2ip+LJD2NIGnd2A11G4Ke73x4KV2wRjV2I8iPpEMXdf59n0CLO9CwFfoRlvERexW+E2WgyduXG+BSB0Ldavspt7F/TQ18ILLM/jMdjLJHikM603PaA29z8r0Qb3NUU/+b75+Tn8n0DQg7CrJZJcXThV4uUmJq9pQWuydDiqoJi/38z5CSyCT85fPj6PjdBxzXrKEI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB1835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(2906002)(66476007)(31686004)(2616005)(66946007)(956004)(66556008)(6916009)(26005)(4326008)(83380400001)(316002)(38100700001)(186003)(5660300002)(36756003)(54906003)(16526019)(52116002)(31696002)(6666004)(478600001)(6486002)(86362001)(8676002)(8936002)(53546011)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVVjcnNBVGd2QjhJYnNRN2RaU3ZFUkp4NDZTL2MrMTRUaVFkRWhnaUdBWVN0?=
 =?utf-8?B?VVdqWENlVkU0bEJVWU5ZUE95V1hKeUdHaGNaaEk1cEFDWkRyT3gwYm5ITXJV?=
 =?utf-8?B?aHQxcllxRk5OeFd5dm93Y1pxOHBWQmdQMWJOcE1mQ2NtMzh3alRPWndiRVg3?=
 =?utf-8?B?dE0wUXhyTzQzWXlQSjhEZS80WFk1RVdLSTVjQzdlMGZBaHp2NmxxRnMrMktR?=
 =?utf-8?B?TGdycUJXK1luVHFhMlF2Qk4xbGtEcVNlczdQZFF0RjVuR1NNZjcvQ1BMWjBj?=
 =?utf-8?B?R01ybUtOVXp6SFcyVFhiY0wzUzJBQmlDWWp1R1prWmJ6YS91MVB3cDVmeC9H?=
 =?utf-8?B?N20raCtzOSs1bGpsRU1CTk1KME1QVUtNbEN5NGZCSWVTelJ1Qmpzcjh6MDUv?=
 =?utf-8?B?dWxvQWxHdXVHa2xiRXRTb1l6TG1NRGJxTmxGMmNGYWczV1lEZC9GYU9mL0tH?=
 =?utf-8?B?NE9WOVNFbUl5b3FrdjU1cW5Gd2xVYUJLN2Q4RGRyNDRzOFE3NmJPY0pDbWZz?=
 =?utf-8?B?WGxyOUpQVHJGeW1HZ21CeHdIZjcvMnlIK0p4bDN6amhyLzlwNGtndWtaeTA3?=
 =?utf-8?B?cGJiVDlySm90TC81bEYxTk5BbWlVZ25qL3VLa21LMVFOMnRQZnlyejBCdDhG?=
 =?utf-8?B?TkovdTYwdWFSeVFOcXJBYzBTbDBxSXB6bnZTUURDTysrcE54ZmU4NUVDam9a?=
 =?utf-8?B?SWJiaHdmaHZCVGIyQXZxWjJ4Q1kycGtJRytSbGtwNUNldk82cmcvRlg5alhm?=
 =?utf-8?B?VXZOeDdiVHVjK3huN0pIeU1DVEdvcStFNGxoUDNPSWR0eXdZam9TWk9hSDlB?=
 =?utf-8?B?QndGbmhtc0RTSXNUMnVlSTU2bWZLY09HWkl5M1RtalRHQTBsVU5pRXNPMm51?=
 =?utf-8?B?Sld5aVIxY2lPSjgyd3d5TEkwRUJKbzN2eHd2R293aDFPRlQ4UHhJNFM1Z1ZM?=
 =?utf-8?B?Vy9GT1hoTkNLL0JEQXhHbFBNNzhKdUFPTVRQeURRV2lJNVpMRXVvNjhDays3?=
 =?utf-8?B?L1pSVElQWWUrTTh3UjFtakpvK2d3bVJKekVoRW9Vc0ozRk9iQVFTTlZ0dUJM?=
 =?utf-8?B?RWFOZTRML2JobElOM1N6NjdVTzFKd29uKzV2RFA4cEFRM095ZHlzRWlROGtu?=
 =?utf-8?B?L1hpWUQzb0tiaXh5S2w5VTR4R1p2TDVZaDB6eStPQ3RKSk1NelRCMWhBZ24v?=
 =?utf-8?B?VTNEcGJmRnNCb2FtSWw5MTdWeHlBYW9zcWJaeWh3RzNmT01DazNLSXU3WXM5?=
 =?utf-8?B?YkN0VmZ3MFZFMGltMStUVWthbUwyMGVUNVJ5U3lIOEZ3OHZiYm15cUwzSEds?=
 =?utf-8?B?WUZiMklTaW1jd0xuenFrOTFRSjlVekVzVUdBdlBGM2pEMmh2djMxZE9yNVRQ?=
 =?utf-8?B?bFZpN0NqMmVoMUZ6VHdyNzNpZDBJa3VEbDNDa1RsR3E0em5YSElkN0h5NHJx?=
 =?utf-8?B?STEvQ055akNoYkNNVVg0SXVtS2NGM2FCZjVVMEJ5ZUptUVZMV0JtVGJrOTJM?=
 =?utf-8?B?ek9NNGIvQS92K0F1elM0aEdUbG44MW5oYTVsY0lmbzNFR0UrZDN4Q2h6eDVU?=
 =?utf-8?B?Zm5yQWlwZkVxeFhhRUdIUzdiL3BGWkFaZWpRK1ljcjloT3hpS2F5YTN1bzEz?=
 =?utf-8?B?TTh2VjdwYVJ2ak1FZVNrV2FRSWlvMEYvRXRGalRjREFrVEF0S0hRQXRBUUF4?=
 =?utf-8?B?bm04K2FnM1RGbmJ5RVFRL1F0NXV6T2hVV2RlQlZFVnpZYzJOcm9ManJkOVpL?=
 =?utf-8?Q?gZ7UUZyB+Tge4hI8x/mi43a3U3Jipfj6R3mkBNo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a1fb14-e3fd-43bf-f11a-08d8f44c57c5
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:53:20.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3f9LoQHqpVVWnkctK+KyfBzBIC7qu/0uCNuxxmFs4n7gFTI+qbTkwW1MjGxxo4HdnOG6Xq50cMSiUH805N98Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1834
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thanks for the review.

On 30-Mar-21 15:21, Andy Shevchenko wrote:
> [CAUTION: External Email]
> 
> On Tue, Mar 30, 2021 at 12:17:15PM +0530, Sanket Goswami wrote:
> 
> Thanks for an update, my comments below.
> 
>> The Latest AMD NAVI GPU card has an integrated Type-C controller and
>> Designware I2C with PCI Interface. The Type-C controller can be
>> accessed over I2C.
> 
> Entire controller? You probably have to rephrase this to make sure
> that everybody understands what you are talking about (presumable it's
> "USB PD for Type-C" rather than "Type-C controller").
> 
>> The client driver is part of the USB Type-C UCSI
>> driver.
> 
>> Also, there exists a couple of notable IP limitations that are dealt as
>> workarounds:
>> - I2C transaction work on a polling mode as IP does not generate
>> interrupt.
>> - I2C read command sent twice to address the IP issues.
>> - AMD NAVI GPU based products are already in the commercial market,
>>   hence some of the I2C parameters are statically programmed as it can
>>   not be part of ACPI table.
> 
> ...
> 
>> +     if (dev->flags & MODEL_AMD_NAVI_GPU)
> 
>         if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
> 
>> +             map_cfg.max_register = AMD_UCSI_INTR_REG;
> 
> ...
> 
>>  #define ACCESS_INTR_MASK     BIT(0)
>>  #define ACCESS_NO_IRQ_SUSPEND        BIT(1)
>>
>> +#define MODEL_AMD_NAVI_GPU   BIT(2)
> 
> This bit number doesn't fit MODEL_MASK.
> 
>>  #define MODEL_MSCC_OCELOT    BIT(8)
>>  #define MODEL_BAIKAL_BT1     BIT(9)
>>  #define MODEL_MASK           GENMASK(11, 8)
> 
> + blank line here.
> 
>> +#define AMD_UCSI_INTR_EN     0xd
>> +#define AMD_UCSI_INTR_REG    0x474
> 
> Not sure I understood where is what. 0xd is a value or register offset?
> Needs to be register offset first, followed by values. Also add a comment
> to explain what is this register for.
> 
> ...
> 
>> +#define AMD_TIMEOUT_MIN_MSEC 10000
>> +#define AMD_TIMEOUT_MAX_MSEC 11000
> 
> MSEC -> MS
> 
> So, it's 10 and 11 seconds?! Needs a very good comment about such a long
> delays.
> 
> ...
> 
>> +static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
>> +{
>> +     u32 val;
>> +     int ret;
>> +
>> +     ret = regmap_read_poll_timeout(dev->map, DW_IC_INTR_STAT, val,
>> +                                    !(val & DW_IC_INTR_STOP_DET),
>> +                                     1100, 20000);
>> +     if (ret) {
>> +             dev_err(dev->dev, "i2c timeout error %d\n", ret);
> 
>> +             return -ETIMEDOUT;
> 
> Why shadowed error code?
> 
>> +     }
> 
>> +     regmap_read(dev->map, DW_IC_CLR_INTR, &val);
> 
> So, if above stops the polling, the condition is that bit is cleared.
> How this makes it set again? Elaborate, please, why do you need the below
> conditional and under which circumstances it may become true.
> 
>> +     if (val & DW_IC_INTR_STOP_DET)
>> +             return -ETIMEDOUT;
>> +
>> +     return 0;
>> +}
>> +
>> +static int i2c_dw_status(struct dw_i2c_dev *dev)
>> +{
>> +     int status;
>> +
>> +     status = i2c_dw_wait_bus_not_busy(dev);
>> +     if (status)
> 
>> +             return -ETIMEDOUT;
> 
> Why you always shadow error codes?
> 
>> +     return i2c_dw_check_stopbit(dev);
>> +}
>> +
>> +/*
>> + * Initiate and continue master read/write transaction with polling
>> + * based transfer routine afterward write messages into the tx buffer.
> 
> tx -> Tx
> 
>> + */
>> +static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
>> +{
>> +     struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
>> +     int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
>> +     int cmd = 0, ret, status;
>> +     u8 *tx_buf;
>> +     u32 val;
> 
> + blank line.
> 
>> +     /*
>> +      * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
>> +      * it is mandatory to set the right value in specific register
>> +      * (offset:0x474) as per the hardware IP specification.
>> +      */
>> +     regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
> 
>> +     ret = i2c_dw_acquire_lock(dev);
> 
> Do you need this? Does AMD have that ugly ACPI based mutex?
> 
>> +     if (ret) {
>> +             dev_err(dev->dev, "Failed to get bus ownership\n");
>> +             return ret;
>> +     }
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
>> +                                     if (status) {
> 
>> +                                             ret = -ETIMEDOUT;
> 
> ???
> 
>> +                                             goto lock_release;
>> +                                     }
>> +                                     for (data_idx = 0; data_idx < buf_len; data_idx++) {
>> +                                             regmap_read(dev->map, DW_IC_DATA_CMD, &val);
>> +                                             tx_buf[data_idx] = val;
>> +                                     }
>> +                                     status = i2c_dw_check_stopbit(dev);
>> +                                     if (status) {
> 
>> +                                             ret = -ETIMEDOUT;
> 
> ???
> 
>> +                                             goto lock_release;
>> +                                     }
>> +                             }
>> +                     } else {
>> +                             regmap_write(dev->map, DW_IC_DATA_CMD, *tx_buf++ | cmd);
>> +                             usleep_range(AMD_TIMEOUT_MIN_MSEC, AMD_TIMEOUT_MAX_MSEC);
>> +                     }
>> +             }
>> +             status = i2c_dw_check_stopbit(dev);
>> +             if (status) {
> 
>> +                     ret = -ETIMEDOUT;
> 
> ???
> 
>> +                     goto lock_release;
>> +             }
>> +     }
> 
>> +lock_release:
>> +     i2c_dw_release_lock(dev);
> 
> So you need this? Why?
> 
>> +     return ret;
>> +}
> 
> ...
> 
>>       pm_runtime_get_sync(dev->dev);
> 
> + Blank line.
> 
>> +     /*
>> +      * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
>> +      * As it is polling based transfer mechanism, which does not support
>> +      * interrupt based functionalities of existing DesignWare driver.
>> +      */
>> +     if (dev->flags & MODEL_AMD_NAVI_GPU) {
>> +             ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
>> +             goto done_nolock;
>> +     }
> 
> ...
> 
>> +static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
>> +{
>> +     struct i2c_adapter *adap = &dev->adapter;
>> +     int ret;
>> +
>> +     pm_runtime_get_noresume(dev->dev);
>> +     ret = i2c_add_numbered_adapter(adap);
> 
>> +     if (ret)
>> +             dev_err(dev->dev, "Failed to add adapter : %d\n", ret);
> 
> Why is this under PM hooks?

As driver supports PM runtime, PM runtime related hooks/calls are maintained
as per the existing driver implementation.
> 
>> +     pm_runtime_put_noidle(dev->dev);
>> +
>> +     return ret;
>> +}
> 
>>  int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>>  {
>>       struct i2c_adapter *adap = &dev->adapter;
>> @@ -774,6 +922,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>>       adap->dev.parent = dev->dev;
>>       i2c_set_adapdata(adap, dev);
>>
>> +     if (dev->flags & MODEL_AMD_NAVI_GPU)
>> +             return amd_i2c_adap_quirk(dev);
>> +
>>       if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>>               irq_flags = IRQF_NO_SUSPEND;
>>       } else {
> 
> ...
> 
>> +#define AMD_CLK_RATE_HZ      100000
> 
> Shouldn't others be also defined like this?
> 
> ...
> 
> Add a TODO line here to point out that nVidia driver and this should be
> deduplicated on how they instantiate a USB PD slave device.
> 
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
> 
> ...
> 
>> +     if (dev->flags & MODEL_AMD_NAVI_GPU)
>> +             r = navi_amd_register_client(dev);
> 
>> +     if (r) {
>> +             dev_err(dev->dev, "register client failed with %d\n", r);
>> +             return r;
>> +     }
> 
> This seems to be on a wrong scope.
> 
> --
> With Best Regards,
> Andy Shevchenko
> 
> 
Remaining review comments will be addressed as part of v4.


Thanks,
Sanket
