Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B4D4ADC32
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 16:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiBHPPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 10:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiBHPPb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 10:15:31 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0205DC061577;
        Tue,  8 Feb 2022 07:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HO3sGbvNxkfFMUW0Dm32qF++ASxOVsgxpmG40JGi09+oZ06rUwPodcA9RLAKNI8Gh0dqSxPguTHNUnpKA8OLuC7lhw+vmNXXI7tJuHLbDadCpwwusCJy3utnNntv2iqgBT2bRP3bjVKqxaOjmJLZuIdx3+m/w80VfM/CTfLz3cygoJfZ88GPKBibS5iEu2DC2KvK9q3NQZAGrSr/VCz9z6pfXaBGGlHBrAlcoQ4gs20fChRFj1WyFmndNJH6jNkSFOiRF0I/KEsEmAiv4U//IfAOeNRauokuupORMsPujjxF891rYI2f3o3xDYlLJDUMvh5kRcfj+KRtJOOlPK2dkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIKSkHjjlw95M4Kty9j3JRZ+HRe1gXcXOLQzSM/6KUY=;
 b=KO3vKWHAhGYYfKjtRDO40qWpdCYCdEdrW0h94hQv/Fy2E0armLA6RQR1jcdvq9H6hVSJ2xmnd7w7c0W+HUKTxXC0yP/lTuZ465QBbKm7y1fXTsZ6+9bCo56POV0c4ARTEMG81Mwlw6olGP0RVR9Uu7GL78VmrfS4G6cn36li1AcYvz2dJ/lgcw24wXyiEgSGeFguCMgp9aAx4V3oAKXSHRpe/Jn4BVtYdoBY6s+HkWxlTGTa5XxQJ+4UnLXqA2JLl+76wpeij7uBVTNUhfOCBCVnj6LEWFIfyh2FkD8YpCzfyyKdjeSeda9YDNun97mtO0pJ75MsBG8q/VKsu89UNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIKSkHjjlw95M4Kty9j3JRZ+HRe1gXcXOLQzSM/6KUY=;
 b=2SMLfo2JKIkkRjK2S72U6nxbqSy/w75/p83Th9ASR124h7RPCmRYcNfcUXLZaOwjiwDFr53zqQK0XezSMQ+BjXXNYanpaIg5q1ccUe7mUL6OSYt1yItTWM+Oi28VzGFAGSc6mLkNC0B7DkQUoYHMobZvlwCXIOCUTYjarPCpXfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by MWHPR12MB1759.namprd12.prod.outlook.com (2603:10b6:300:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 15:15:24 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%5]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 15:15:24 +0000
Message-ID: <29238228-1057-c823-b9ad-60e64cea8468@amd.com>
Date:   Tue, 8 Feb 2022 09:15:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 3/9] i2c: piix4: Move port I/O region request/release
 code into functions
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        jdelvare@suse.com, linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com,
        linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130184130.176646-1-terry.bowman@amd.com>
 <20220130184130.176646-4-terry.bowman@amd.com>
 <20220208154524.283609ad@endymion.delvare>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20220208154524.283609ad@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0058.namprd18.prod.outlook.com
 (2603:10b6:610:55::38) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 698f747c-ca4d-4b7d-3d33-08d9eb15d422
X-MS-TrafficTypeDiagnostic: MWHPR12MB1759:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB175932692F408EB251795725832D9@MWHPR12MB1759.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMdAXa3aMA49Trf7ZvEqUc4pt6pgMwYSE+23F/tdo5maC6SysJ+m58gZnuyAVeBzW4rz23H8dMKneTU2aR1nnOOS20QIgXMXjAfp3xW5lSEQVcYk6kzRdNA42FHhaYdFiE0xWGbQvNcFA50tVlpzytjAAKgKOOnZOgyUDwAWJ6xFx3qTELwKtbqzgdygpDweMHtUdeRbhytMcSiUr32BbFiTtYiuM8tVe9YDwu8vJgEXQ4sk9+CfUftx3xv/bWNh3i6E9ERFhmxTTmItJdaDhyDXU92g2540pMRPiW2e7dM43EGb/PLhKxnKzwa0HgDIaAbKMkEqbriVJIhrUPLeN1SaSl/KvZfd8RKfXyZnXttr61jE/ojPJgem7HU6pDK3Pml/uw9fbqMglrsAkRrHLJ4eZrgb0maVle0ClIOTP+S6ojgD7QvXL21W6H3lYGG17XiXCe+A/KTS1Vnx7nZ6KwVDVt8yLUpO/1BXx1pcnwg7Ejqut6YAqY4idMlYNlmLb/yfXDPboFu6AFAtE0RBSFUzW+34HmH8HPxdOYLMA/N+PL+M/xYMJeYtxxsbSLf1dotS7Hz/88pkHGfArXy1kFtlUDWp8Xie+Jg1ZVX9E8pLCiQLKh/kCQSui8MoM58x1Lkmuz/vwxqk10z45T/Q5Z2S3F5M+GGTQStTkDOyzNX5AfkdbwYvyC3q/fcSJF+NYdmlT4xtnh/5jQPEa0+5mwGZyiDh6z0GBZnCCn4RVIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(38100700002)(31686004)(6486002)(508600001)(6512007)(2616005)(83380400001)(5660300002)(7416002)(36756003)(2906002)(6916009)(31696002)(66476007)(6666004)(66946007)(53546011)(66556008)(86362001)(8676002)(4326008)(6506007)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b05URi8xZktPMWlaQ1hXZHZydys1MW1wMHo1d0RKUWdjVGp1RkFxNDVGdzhl?=
 =?utf-8?B?UlFRTTJONHh2R1VLK2k3bnZvbi94Q1dMb1N0UUVuTXhVTVBDN1c5MStWendN?=
 =?utf-8?B?aGo5elRTR00wQnZLVUtsVURIRUNtb01oMHp5Vi9Za0owRFdybkU4Nmp5bjVu?=
 =?utf-8?B?Y09FaFVHTHRQWkFiNTVRWFozN3JQUDBEZ204d3Vhb3JQSVBKeEE2QUs0V2p3?=
 =?utf-8?B?QU1Mc2VteDlpdmhNVHUvdlFKYVdoanhYRXpJL1daSFFLNHE0YjM3dE1QaFIr?=
 =?utf-8?B?QVFPWDQyT3NyYmJNbjNYSVdneG9UakYwNFh5MlZPdG4wK1FvZVh0Y1BTaXVG?=
 =?utf-8?B?MDd2aVQxL24rMlZiWFlHbnZZSjlrSGdzaitWUlVLQktBQ3BmdmxLdEdPRnl1?=
 =?utf-8?B?ODVVUjExYndBYmRBOTZaTGk3UzZzK0lySGxPMlJKZGhkSmtDeWlXOXpUNlBw?=
 =?utf-8?B?cHIwekZCT2dpUDU0alJTUnRHVjVwZy9vWVRWUWowSVdqUjdkdmcvQzlpclpK?=
 =?utf-8?B?c2p6bkRjOEdEUDFEeDYrWVliWlJ5dXlIR3diSC9QK0JJb08yNXZrSWtyZ25W?=
 =?utf-8?B?TStLd3dIMndGbDhWaGZOMDR4OW1JSENETUFEWEM0dHdMNjRzODFzazZkSFNH?=
 =?utf-8?B?STVmWDd5UXcxTFZHVzlOcFRTMGVITk1ZcTBXaTVKa3ZIYWd3Z285WDhYTzE4?=
 =?utf-8?B?SzU0UElhcW13ajMxbFV4UmFITzBiY2I0aHVsZURhWDgvQUphemg0eWdCRGxC?=
 =?utf-8?B?S0pRd1loT1MwNWVmQVl1ZGI1U09aQlFQOWh0ek9DOVJPM3M3bGhiNmlMSU1X?=
 =?utf-8?B?azNPblRiYkRhL0cvaVBGWG9kUUhsSVhLNTFXdkJ4WVU4aHZ0elpaT09CSmRG?=
 =?utf-8?B?ajR5V2R0d01pREtsQmV6eUhEUUNlU2NrdXg1dE9yWnRiaDlOUmpqRWp3eERq?=
 =?utf-8?B?d1RKdkJlckpleDF5U2hTUFdQUjlmTzl4b2g3ZGpUSjhOQURCRVlnN00xYWtr?=
 =?utf-8?B?cUNRNDVQMEtaaU81ZnhQSWZvQ0hUOExRWWk2N3BRVDljVWtwT2VPMWNOVVlq?=
 =?utf-8?B?QitaSSthQ1Y2WVdUMysyMkthQktLbmNSaFg3TXRoVkE0VHp1ejFkdVZ5QWNu?=
 =?utf-8?B?anF4Sy9SbUljdzI4Z1JWd3EvdTRYUi9adXZzRTNrT21XR0xRQy81NndnTjBk?=
 =?utf-8?B?ZEhJR3FQbDZpU0FlNlNkVlErbWJldnNGQm1KMC9QN2cwdmF0ZHpzSGNTVFdZ?=
 =?utf-8?B?ZmFTQzIwTWFOdS9BRUU2V1hxeFFrTjl6MUtWckZzbDZSaUhQNGZvby95Uk5r?=
 =?utf-8?B?bEhvUGJqenVHa3cva2JEMzZaazdZUHBaRVY3RkRvVm02QVZVM2hkRVNUUGt4?=
 =?utf-8?B?SjRhWVdGSGhFbGxXc08xYnQ3eXgrck5qcUdmUUtWZXpZSGx6VjR6SGRVNWZa?=
 =?utf-8?B?U1pKa3RoTlBuZWk3QlZOakxFdkV0RFNIOG1MNGNzMnFLSWZGNVlxNHRLc3da?=
 =?utf-8?B?M25VdzJ6bVdxNjdQWTF0UVo5cjVhbEhmeGR4dUVnRlhqWUtrUU1STUs3SEti?=
 =?utf-8?B?eEtaanZ4UndwcGs1Y3NWWjkzMC9SaVY0VmZIZTIyN0l4M3NSZWtZRm9jK1Qy?=
 =?utf-8?B?aUUwNkNyckZwYis0cThheXBoTmZxU0VYODN4dHl0aEhhdmtUa1lOWGZQWW9U?=
 =?utf-8?B?SkE5Q0xqS3RVbm5ONmxnWEdQZ0JvTVNaMkJnV3VZbm5oT2JFVGxJdjBuaGxr?=
 =?utf-8?B?VzhVYnU5emxhSUxHUDFvZ215SHlkRno3MXVWTVZTNlloL1N0SXFGRi80V2dj?=
 =?utf-8?B?Ykh6SXlmVXlmOGxncGJlWTNPa3NpMHFnZFFYVXYva2dSdmtCdU5ldmRKc28x?=
 =?utf-8?B?UU9rVGFqTmtVMHF2N1NkUHVGNllqMVJ1TmRVajFac0Z4Y1Vwd1Y4dXg5SmJx?=
 =?utf-8?B?cWZDbCtRSDJEZmc3TUtkblVCdkUxNEMrTE1BWHlCc2RHdWNjaTlRYXVRMjls?=
 =?utf-8?B?RUttN2ZHUEl0RTFuTTVOaWJsaVEvRU14bm9NQmRUdytmRXFXVFh0SUtCRTNU?=
 =?utf-8?B?aEQwT2wyd1UrNVFyVmtnQm0wK29vUWJFbEtuTmY5N2VRZ0JoRkYwQWltZlZN?=
 =?utf-8?B?T2sxQlZXb29JclExQzM2dU1xaEdrZm8xZ0pyUUZwZ3ZzV2xHYmh0T0I3MVJn?=
 =?utf-8?Q?w6s6KvGhK5ZeLjbzJdpLssg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698f747c-ca4d-4b7d-3d33-08d9eb15d422
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 15:15:23.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5L6oewE1g7KhaDDcUeHY7GaScgz6h/Cn3krDWwmMwzt1vp5Y0s+g+8E83D5APJUCs65qO9jG6QwrwbdhJjbBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1759
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On 2/8/22 08:45, Jean Delvare wrote:
> Hi Terry,
> 
> On Sun, 30 Jan 2022 12:41:24 -0600, Terry Bowman wrote:
>> Move duplicated region request and release code into a function. Move is
>> in preparation for following MMIO changes.
>>
>> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
>> ---
>>  drivers/i2c/busses/i2c-piix4.c | 39 +++++++++++++++++++++++-----------
>>  1 file changed, 27 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
>> index 3ff68967034e..5a98970ac60a 100644
>> --- a/drivers/i2c/busses/i2c-piix4.c
>> +++ b/drivers/i2c/busses/i2c-piix4.c
>> @@ -165,6 +165,24 @@ struct i2c_piix4_adapdata {
>>  	u8 port;		/* Port number, shifted */
>>  };
>>  
>> +static int piix4_sb800_region_request(struct device *dev)
>> +{
>> +	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
>> +				  "sb800_piix4_smb")) {
>> +		dev_err(dev,
>> +			"SMBus base address index region 0x%x already in use.\n",
>> +			SB800_PIIX4_SMB_IDX);
>> +		return -EBUSY;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void piix4_sb800_region_release(struct device *dev)
>> +{
>> +	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
>> +}
>> +
>>  static int piix4_setup(struct pci_dev *PIIX4_dev,
>>  		       const struct pci_device_id *id)
>>  {
>> @@ -270,6 +288,7 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>>  	unsigned short piix4_smba;
>>  	u8 smba_en_lo, smba_en_hi, smb_en, smb_en_status, port_sel;
>>  	u8 i2ccfg, i2ccfg_offset = 0x10;
>> +	int retval;
>>  
>>  	/* SB800 and later SMBus does not support forcing address */
>>  	if (force || force_addr) {
>> @@ -291,20 +310,16 @@ static int piix4_setup_sb800(struct pci_dev *PIIX4_dev,
>>  	else
>>  		smb_en = (aux) ? 0x28 : 0x2c;
>>  
>> -	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
>> -				  "sb800_piix4_smb")) {
>> -		dev_err(&PIIX4_dev->dev,
>> -			"SMB base address index region 0x%x already in use.\n",
>> -			SB800_PIIX4_SMB_IDX);
>> -		return -EBUSY;
>> -	}
>> +	retval = piix4_sb800_region_request(&PIIX4_dev->dev);
>> +	if (retval)
>> +		return retval;
>>  
>>  	outb_p(smb_en, SB800_PIIX4_SMB_IDX);
>>  	smba_en_lo = inb_p(SB800_PIIX4_SMB_IDX + 1);
>>  	outb_p(smb_en + 1, SB800_PIIX4_SMB_IDX);
>>  	smba_en_hi = inb_p(SB800_PIIX4_SMB_IDX + 1);
>>  
>> -	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
>> +	piix4_sb800_region_release(&PIIX4_dev->dev);
>>  
>>  	if (!smb_en) {
>>  		smb_en_status = smba_en_lo & 0x10;
>> @@ -685,9 +700,9 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>>  	u8 port;
>>  	int retval;
>>  
>> -	if (!request_muxed_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE,
>> -				  "sb800_piix4_smb"))
>> -		return -EBUSY;
>> +	retval = piix4_sb800_region_request(&adap->dev);
>> +	if (retval)
>> +		return retval;
>>  
>>  	/* Request the SMBUS semaphore, avoid conflicts with the IMC */
>>  	smbslvcnt  = inb_p(SMBSLVCNT);
>> @@ -762,7 +777,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
>>  		piix4_imc_wakeup();
>>  
>>  release:
>> -	release_region(SB800_PIIX4_SMB_IDX, SB800_PIIX4_SMB_MAP_SIZE);
>> +	piix4_sb800_region_release(&adap->dev);
>>  	return retval;
>>  }
>>  
> 
> There's a third occurrence of request_muxed_region(SB800_PIIX4_SMB_IDX,
> ...) / release_region(SB800_PIIX4_SMB_IDX, ...) in function
> piix4_setup_sb800. Any reason why you don't make use of the new helper
> functions there as well?
> 

I didn't update the other occurrence because it was outside the codepath
for the device we are addressing. At the time I wanted to minimize changes
particularly for other devices.

> OK, I see that this part of the code is specific to the original (ATI)
> SB800, so it can't use MMIO, therefore you don't *have* to call the
> helper functions. But for consistency, wouldn't it still make sense to
> use them?
> 

Yes, it would be more consistent if it used the helper function. 

Regards,
Terry
