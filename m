Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4F16DFC6A
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 19:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjDLROE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 13:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjDLROC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 13:14:02 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C70510C4;
        Wed, 12 Apr 2023 10:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq+AjTnY8cdNNUDSQBAUvs6EC31FX+oIFYhUDyhOwIkuaX4SF6ob+bBmuiH5lsgF3seXa/Va6Bub7kBoNQa0miNBw1R5bNbHQxslri0Wj9+i0HBjHuOrdN0jQVsOA46jyczn+4+9vSwoZop59UcNDuYtYp3BwqMEq4jv4t9QZxexigB2h52pTKqvebFfzW0+ouG634Kb8rbxI7gkXAt+CvfLzPUh/rxi+aflR1kfFOfxWyebtNkPNOwU2d/M4htUY8CQn1nQa3y/wL5cqLoBTeemIK7Ry52gUx7PoTc6fUCZ4cywSYB57orE2xbPGAs+kC/R8t/c6b1GL1ELB//Xuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25b8WE+UaYE8ug8Jc8Vd5jei/S/838X2ewL0zV3cKxI=;
 b=IfLSqoNbd9K4ZbdrlOicqAiJYrkBO5Tpd2PcSE3GjBMc0TtqWiHkzKKN3c25O0abHqP8acZMWTmfLgvfiHz8yrv3MlOV8Q/SBtbCN3OduiEh+35sGfYFmdo5bTiJm09HYjLdpEC/sgyooxr9KmOKeXPsDcJZtHpNCVZXx7yIl77yFHRrYlpOQj6I0yPTXMecjf40qpGkQQ1p6oNzoAeCI1F48WGHuLrUUIh4f5imwGzNsIT1LDpVHQfC3kNM74ca6Oh5PgqdhjAO0/Qhb0Ah3Kr0S7xi/JvGy93nZH0eGei01xfNhIu7Axmejq7sZwlC3pa315NDSyDkALlKOvQ1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25b8WE+UaYE8ug8Jc8Vd5jei/S/838X2ewL0zV3cKxI=;
 b=MKp6BUbZmgaB1MpDLEgqnf7mquKX/bo0KPY9sjAV2X5cubn01oEoKIUBDKHjozOSObPv/SslJQNThyRMnB/JKZifcIoc0SCsgPQGQ49iiC9OIYTtn4xGCObOG4XUUzu0/5/ows03pNaxgyBp6qzRkTC3axFiZBHiY1bg3cWnStM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3108.namprd12.prod.outlook.com (2603:10b6:408:40::20)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Wed, 12 Apr
 2023 17:13:52 +0000
Received: from BN8PR12MB3108.namprd12.prod.outlook.com
 ([fe80::faa7:21a2:a446:973b]) by BN8PR12MB3108.namprd12.prod.outlook.com
 ([fe80::faa7:21a2:a446:973b%6]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 17:13:51 +0000
Message-ID: <e41399a4-c6d7-2b79-3f87-1a0efa64dffa@amd.com>
Date:   Wed, 12 Apr 2023 13:13:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc:     yazen.ghannam@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, terry.bowman@amd.com
Subject: Re: [PATCH] i2c: piix4: Print FCH::PM::S5_RESET_STATUS
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
References: <20230407203720.18184-1-yazen.ghannam@amd.com>
 <20230412185358.4d6427ce@endymion.delvare>
From:   Yazen Ghannam <yazen.ghannam@amd.com>
In-Reply-To: <20230412185358.4d6427ce@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:408:143::15) To BN8PR12MB3108.namprd12.prod.outlook.com
 (2603:10b6:408:40::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3108:EE_|MW3PR12MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 083d9bc8-1431-4fa2-fd28-08db3b7949a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dIgljkJGzPMWSJHC9sQQ0zE4FooED8OOrJaXUkDA0Z+zZmkDQLsdvAhD+lfMPP4LBQzWGjdgFGpgbg5BqfTk8+8kTDN8pYKjX42tTx/RdSfAgTMzGIjVH5qyOvIw6uGD0jIjix3BqnWVEdeilQn5H5FoR9mhVeaRqnOfH6TaPH+EUeUChs7If1T3vKw0Zv5Vk9p5hbdFmtcir4HJeCnwmB9WllYkU4dB9wE1t4udDuY+H77mMs1B9PvMtbineIKyaStRUWOE507RZB1MA72vYgdplZuj2/9byXxAmAbxjYflZtMR35dyTYELRPa81UsrBO2tFJpb50d3Oz4BfmaYY40ugJHo7XI5kL8jJ9dsugWacvFavgVA13W5e/QCTi2TzziQV4DZZbM/OBJNtMQNYI5ivMCldL2M+4gQwwbgUZZ825sedYFwqzgDJbl1jxo2UIPp//1VcCmHJgdxGMbSKzACSdAlJRE+PfqF46Mkm2x6L3wDtKNCE/2rTIlSzavChhXvrhu454Xl3y8lss4LDhGx9DB2Dbz4RS35J2q+1QiRpQgtDh69d6oz4nYM+UaK20EGQK2BGSrOCDl4AH8AEM15fW/S6eJGcftr4lbhPm51NX4J6PsQAnJz08KNG+2pz++JLBw/cLKl4jvP8CAAfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(31686004)(36756003)(38100700002)(5660300002)(2906002)(44832011)(6512007)(86362001)(4326008)(8936002)(316002)(8676002)(31696002)(66946007)(6916009)(66556008)(41300700001)(66476007)(2616005)(83380400001)(186003)(53546011)(6506007)(26005)(6486002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJPL2E2aWFMSENjbVRFS3h2RS9hcG5id0dpZjk1TUhETHJiY1g5V2ZRNFd3?=
 =?utf-8?B?TExRKzlaVVg4VFdsM2Zob0E1Q09ncDdWUzdhaHQyZHBjMkFxVFRHL1NEdG5I?=
 =?utf-8?B?ZjJreEFwcTJxMjJYdVRkSTBvT2JHLzhvNGlMNTFFMWJFY1l1Q0sxNXNDOTNV?=
 =?utf-8?B?bmVWNUQ4OVp2OUJoYjJMKzBmS2pEcnBsRFNxTDVWRmhtc0kzRjJBOFR3a3JE?=
 =?utf-8?B?ZWtxZHpBWERjTVplc0hYekNvQ0tlK3VLSE40VmhNS25xMkNHLzJUaVU3MW9Z?=
 =?utf-8?B?QjlZUEJZS2pqVDgwYWNSQUxoRCtmNlM2TDRMSDR3eUZkN0hKeWdiaWRYMVpB?=
 =?utf-8?B?eE12c2hpTDFUMlZCSEZsK2hXV1paNkpVVTYyT20zWU1IQVZJVzJVNkFYeTZH?=
 =?utf-8?B?TndoV2ZHcldnV3BBNlJMdnZNZmgraUJDSGVSNWNpK0t3cE5DTURmR2dMS0Vz?=
 =?utf-8?B?c3N6L3dUdmlRVXZRSFRlZkFrbDcxOVBxbVk3bmVpOEpIaVNUcGdiV0ZxUDJ0?=
 =?utf-8?B?N0NHRFc5dmtjSE9ieVBwcDF2Q2FUNGxDUFBwd0hPZEdjNWZ2VlRlTG5yZWhD?=
 =?utf-8?B?Smg0TlBKZUwwSFREL1RVbVFIZHlXQjMvY2RTbUNlWFh1enRPZ0ZwRTMxQmVy?=
 =?utf-8?B?OVFsSnkwYVdGaFBJamhjQ2ttNFR1KzNqYnBHbVByTGp6R1IrMFlIaDRIMHBp?=
 =?utf-8?B?N2c1OWRzMmlhNXkyU2lSRDByRUx0L1hvN2pZeDhCb0hYaGViOWQ5K1ZpT0Qy?=
 =?utf-8?B?bTU0emd0VXIxcUNzZCsxMktvdS8wRzdlQy9JY0tiL2liQmpEWlpkclBpUW9y?=
 =?utf-8?B?aEZkWkJvWklrb0RkQzV5Wm9RMktxVkVMUEk3YXNobjUwcW50c0VSVVhQMEVp?=
 =?utf-8?B?bnU0ZVBFNXp4VHVFVVVmZktYYVRNMDAwNUlSYUZBNWhuWHN5bjY0cE1sY2tU?=
 =?utf-8?B?WDFaQ0NvOUlZTzNpN1RQL1ZRL3k2TWJCeFlvY3VrNDE0U0F1VkZhTEFqNFZn?=
 =?utf-8?B?YUp1SGFZaU9yVjdOeU9oM29UY2huOTZ4SFZEQmNZR1U4alR2STR4OXp4Q1Vh?=
 =?utf-8?B?b0ZIcDhDYVk4bWlZUVZzL1pUblFkNUhIR2lTbThlZGlGSDF1YzRXT3Z3S3p0?=
 =?utf-8?B?RE1JQUZCWVJmK1ZVYjhBa1lYbVdibHdpaTVjU3llMVF0S2l3TnF0VWFRY0tT?=
 =?utf-8?B?Vm1yeDlIK3d6MmM0NjJMdjV1bkJwMTYvNVROQTdPSjVDbUF2Y0RrU2RVL3BB?=
 =?utf-8?B?QklGQXp6d1UyWi9ZMnJaYzdSbVE1elNSK3VDZWpKRFFTc0w4UUJpSTZrUmlH?=
 =?utf-8?B?M2svbFIxNGRDWFRHYWpvcmR3UE51QjBVMFNOczZVa2w5ZWVYS1JHS2dTVjhF?=
 =?utf-8?B?akxyRkRHeURONVYyMWVmT0l4RE1GLytpb210ekl3QUdIZmU0V2JGbFY3UFAy?=
 =?utf-8?B?ZitiRUs4OXc3VkRCVS9ia2lGU1JIanVtYTNGSG0vajVGcG9BN0FHbFhQR0xU?=
 =?utf-8?B?UzlTSnJEc3RqQXFZMEI1dmk5Q0lBQ2s0clMyQVM5dXV1dXBrd2t4blNFdG5B?=
 =?utf-8?B?WXlXVi9oNEh2dDg1aTZWRjVTMTJjQjlOVklRL2w2aE1uazcrRW1xSUZLYVNk?=
 =?utf-8?B?UE5oT1krQW5nY3kvV21KVDBCNE0vcFR3eDJ1cGF5ODlqRURURXZKQkhUN0V0?=
 =?utf-8?B?MmFwaEg4cmNtcm90bnZnd0Rtb2o0VDBjdk1WcTcvVkNjNzlWU285Zmx2b3JJ?=
 =?utf-8?B?TGh1OERvdzJnZE55anY5bnZRRnI3by9yaUVqOEg0NFhZNFJyNCt0emxrazlF?=
 =?utf-8?B?QUd0SkhGUERPS2NweFF3cDVpL1VobXhJbHR1ZVBCcnlqcUpGNkt1Y2ZBZkNs?=
 =?utf-8?B?WHF2VFRBRGM0TVp2TndLaE8yZXhSVEtZYnNqRTBPQmVXdm5qeVV5dHRnODlI?=
 =?utf-8?B?MlhlVlZ3Uk5hTFI3NzArdDJ0UnF1UGtRQ1o1UUZ1R0lGaWFSM1JCZTk1UzA4?=
 =?utf-8?B?OFpONTEweVVCdy92S0c3LzBoY0E5UFVPNVhUeEdxRnE3MS8wUklVREI3ZWRY?=
 =?utf-8?B?RjNJRjRrT0x3d0pvVDdSVmQ3azhuTUlKVTZTeDlQckQ3MVg3d2xMaWpxbDhR?=
 =?utf-8?Q?cxXOhPfsqfxYbWOpK4+t3tm2k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083d9bc8-1431-4fa2-fd28-08db3b7949a9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 17:13:51.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkBRvJXF3LwSCp4CPzBLJy8R52XbsFlWB2nHPf9KzeM2wKa9tWGhmH7Eu1UbwTiCKz+AlCZxFQrzYJrPrSWYEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/12/23 12:53, Jean Delvare wrote:
> Hi Yazen,
> 
> On Fri, 07 Apr 2023 15:37:20 -0500, Yazen Ghannam wrote:
>> The following register contains bits that indicate the cause for the
>> previous reset.
>>
>>         PMx000000C0 (FCH::PM::S5_RESET_STATUS)
>>
>> This is helpful for debug, etc., and it only needs to be read once from
>> a single FCH within the system. The register definition is AMD-specific.
>>
>> Print it when the FCH MMIO space is first mapped. This register is not
>> related to I2C functionality, but read it here to leverage the existing
>> mapping.
>>
>> Use an "info" log level so that it is printed every boot without requiring
>> the user to enable debug messages. This is beneficial when debugging
>> issues that cause spontaneous reboots and are hard to reproduce.
>>
>> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
>> ---
>>  drivers/i2c/busses/i2c-piix4.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
>> index 809fbd014cd6..043b29f1e33c 100644
>> --- a/drivers/i2c/busses/i2c-piix4.c
>> +++ b/drivers/i2c/busses/i2c-piix4.c
>> @@ -100,6 +100,7 @@
>>  
>>  #define SB800_PIIX4_FCH_PM_ADDR			0xFED80300
>>  #define SB800_PIIX4_FCH_PM_SIZE			8
>> +#define SB800_PIIX4_FCH_PM_S5_RESET_STATUS	0xC0
>>  
>>  /* insmod parameters */
>>  
>> @@ -200,6 +201,9 @@ static int piix4_sb800_region_request(struct device *dev,
>>  
>>  		mmio_cfg->addr = addr;
>>  
>> +		addr += SB800_PIIX4_FCH_PM_S5_RESET_STATUS;
>> +		pr_info_once("S5_RESET_STATUS = 0x%08x", ioread32(addr));
>> +
>>  		return 0;
>>  	}
>>  
> 
> I'm skeptical. For one thing, the register you read is outside of the
> mapped MMIO area. SB800_PIIX4_FCH_PM_SIZE is 8 which is less than 0xC0.
> 

Hi Jean,

Ah sorry, I overlooked that.

> For another, printing an hexadecimal value which is AMD-specific is not
> going to be really helpful in practice. Is there public documentation
> available to decode the value?
> 

Yes, this register is listed in public documentation. But I expect this value
is only helpful to hardware debug folks. The intent is to have this
information available without requiring any system changes by the user.

> Lastly, I can't see why this should happen in
> piix4_sb800_region_request() which is going to called repeatedly at
> runtime, rather than in piix4_setup_sb800_smba() which is only called
> once when the driver is loaded. If this goes in the i2c-piix4 driver at
> all... sp5100_tco might be more suitable as that driver is at least
> somewhat related to system reset.
> 
> Looks like a hack really, and while I understand it is cheap, it would
> seem cleaner to put that code in its own platform/x86 driver. Or
> arch/x86/kernel/quirks.c maybe.
> 

Yes, that's fair. I'll check out these other places and see if there's a
better fit.

Thank you!

-Yazen
