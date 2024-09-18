Return-Path: <linux-i2c+bounces-6850-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73F97BA9C
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 12:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41601F21823
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 10:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F64B176230;
	Wed, 18 Sep 2024 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KQuuMHOR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6033EF9E4
	for <linux-i2c@vger.kernel.org>; Wed, 18 Sep 2024 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726654463; cv=fail; b=MsqKPjrCvpKwpoe5+mlz2NoZz64+U/5eUwKHZUP/VVMMg1EGnloVEbashOcqpWnoGGOnnumKAnJkr1k6JLQTtg5oQ91CB6YsYK8D5m3rPuVbt/2BDcFUqbwiPcU6v5qs0LEvcKkyVcGWVWQv7WVzN84C5sMzXIdZX5tFzqlvJV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726654463; c=relaxed/simple;
	bh=e15Or2zts4bbGg+GuT+8DPRyetOHlpQ4mheTq+RhpwY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PcEXbLaMTlt+9UyXzLKsEtrWbsweBplA4dI3gS8l1JLmAKpLbbjTp1H8w/iMjP00YdowL7HpDFlmZnaoEsYhkdnj1gC6seXBdhr5QuvGI+wCELag9DalWnOqcqpl3wmdyV1wuAf3wCk3/A3GHQT5ihLJLQ1d16pcpYfmVMQPtkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KQuuMHOR; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0a/ejQP+kjFhSurjjZnBHqKTlJl5ueDjecEJJSM8QstNvOj/bi8KfKBBSfRyOUflAvAki7aexVMDr51BKvppwuo7HtQqh4A6iIlkDAW9VkplT4cQ9J9RilDlZhkaTxEuejUWxUc44DBLwy9PTTaIEnTSXXazyjtL+h2DnWOFvsj/PKGrA7FHjdC9htj07kbwus4r5NB55HdBwpY+biQH5GOjZExYx0yekzb48jufoUeVGa80NwwRBD/glX5tvlRdX9BkBIqixASPVXgkpB0vJ7UoiD/X0prLjB6RWp9VZ4ezHa6gGc8VADLD6hO3ey8n+dUvctFNkiYBGMdo8Q3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI8YvK9ZKgqdPFrgdMtDSGJiHvtOBvQ7LEN97SJsx+U=;
 b=h76TFFQBw0HItU9ZE2Y236Ou0Keg5bp810a2OAIsQSWHaxqNisw5g7GqINDDo6CL/6KiDBXyeA3JMVhGRNFkcJzs13uGNc9pB8OWG6gT12CkG9JJdE3PfXJtBgRUuv0cRv42UkyA5eaI+8Wl6tdUu2K5omUCAugMiFnAe3lziWxVhmmEVbfC9dQ00BUQBP2iNsGimaK0lJplPrGr/TFbReleu/LFxJAazmGyppznxK+QW/rLnLt6HLklS1RpUR83m3uq3fINFUVPsKdqukhWNdfy9q5xHBFwH5b4rJd59n7POk6YZZ5O2pu9TTGVSeZ2naSe8D6n6kyAOA8hDGhtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nI8YvK9ZKgqdPFrgdMtDSGJiHvtOBvQ7LEN97SJsx+U=;
 b=KQuuMHORQ/qXYt47bLpXBA1CMnWJp3uvyxufdcNzXh4ywF+fz1w1Qc0Ok2cPL/RNTDBRg+GL03l2wB+XpXF1PJ7ruV9TMeEl6rSP6gz+3DDjca0ibEDvBKZwPYs5sVV9UPP6hBBtDqPd+6JnyMm+4OifIRVV9QEBHD0uF26MHMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 10:14:17 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 10:14:16 +0000
Message-ID: <33c1fc09-e721-4d75-90fd-ce9510f4ed72@amd.com>
Date: Wed, 18 Sep 2024 15:44:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] i2c: piix4: Export i2c_piix4 driver functions as
 library
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-4-Shyam-sundar.S-k@amd.com>
 <ZuSKUCC1XqBURdib@smile.fi.intel.com>
 <5361ddf5-e1c8-4512-8982-9404f12fe4c1@amd.com>
 <ZuqjsaeTAKs5TaJH@smile.fi.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuqjsaeTAKs5TaJH@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::8) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 02819055-167d-45a9-ade0-08dcd7caa6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXZ3TUczcXJjNzFibXNFL2VmVm1YWWNHcWhZM3R3eGFpSS91dmQ1QUUyUDhQ?=
 =?utf-8?B?Yk1pbW9OVlg4d0xTeVdjRm52eFFCVEZsbEJRZmRBUDBqMWFvWXBiTGpxMmdS?=
 =?utf-8?B?VW50ZDNCS3lFYjRhN0JOK3VhOTl5YzVxOFBUNEFyQzBGNEJ4MTZDcWdXdlFo?=
 =?utf-8?B?SjZpNjJkRVFIc2M0TzBPM2dOcFVrVlNWUGxvY3B6WmFWaFVxS2xDM3hlc1NW?=
 =?utf-8?B?dHFESnk3elg5NnN2NjB2MmI2RkVjN004cHhpdzdCY2kwZ2JHbzRQSzFlWTJO?=
 =?utf-8?B?SmlrN2QxVnBtL1ZjaUZNYWpZaC8xWUFjL21wdjlCQU9HQUhjWHZhcnBFMnBZ?=
 =?utf-8?B?SHRqY0pOQ01ZN1kwMXZveTVOM0UrWnNWck9VMG43SG8rYm9WRjVSQ0E4RUxD?=
 =?utf-8?B?bFU2RGdjZXYxajJrekNOU1UyMk9waEptemxmb1o5YWV0OVMvKzQwWUhYSlVV?=
 =?utf-8?B?VzR5WW9ETGpRSm8wbmVkQW5BMGdGMVVVTitVVjhNT2liMjBDY0NGOXBLQnNs?=
 =?utf-8?B?QTk5NFdHbW15RVgrNlVTNmord1d3U2NlTDFXNDVmWUp1d3dlTUEzWmFUc0ll?=
 =?utf-8?B?REIrL1o1d1FaQlNBSFVDT0JJVTdOd2R3QnZrcytsTGYrWk5OUlVYOXJTMEF2?=
 =?utf-8?B?bFNKaVAxREUwYnNYZlllUmpZTnFCdnZQN0lVTUhIL0NGN29MQ00rU2VhRFk2?=
 =?utf-8?B?b0tHNEJNVW1uU05pUUlqOVNUdzd6cVAzMzZxUHEvcmlITE9ZaTRqZUhzQUFG?=
 =?utf-8?B?T25MN3luU3EyUHRiUTNxSGFiTk90YXlDaS9rdlgxRnFycHhtUjFnWWlIZm5s?=
 =?utf-8?B?SExpSzZMUXdSS3JPQXRvSHBhZjZOQVRtM2NSZTAxd0ZyMW02ajVOMitubGp6?=
 =?utf-8?B?MWY5SUJCWmVXTVNuOFVGTzMrSUtwRnRqT1ZVSUpPZ0RPUk1aOE1UTW0yREJ4?=
 =?utf-8?B?SzBBeTh0U2tCeW0zL0VQazhrTmVtWVkvNXEzYzJ6eDdySm9YdnBaYW4remVo?=
 =?utf-8?B?aGQ2bmJkRTc5aVNxNXhWWjZYaFNwZklaZ094YXo0REoyZXV2WVhLN0pXaVFY?=
 =?utf-8?B?cTROOGNjTkFYTjdMTEFvT3p5Q3Y0WWUzZG9zYkNtNFd4K1VVb2owZG1RZDZI?=
 =?utf-8?B?U0dmMjROTFduejlXQldpMmpRMk5jYnVSQTdVQnNURmRFdk5idXNmcCtvUkZa?=
 =?utf-8?B?NkpqaTRxbnZhNlFBNnlKR1lsWG9TLzk0Z0huTGVGa0N2QlQ3SXdwMkprbWVr?=
 =?utf-8?B?em9xeFFJOHZ1emlDK0s4dzVPRTVEZmVXQjl4OUs4eGN3NDE2TnJya052WEor?=
 =?utf-8?B?SmNNSjA2ZUtwZDd6UzZtNXE2MjBadXVtbGpNYWFOMGlsVmFZSldQWHV3enhw?=
 =?utf-8?B?MmNQeHBzV2JpajYweGo0Y09HNDg5UVpxeFE5Z2Jra09LTVVDc0FrcWtRQ1V1?=
 =?utf-8?B?WUp0dElEMFY4d1hvZ2szMWdaS0dMUVNFdjB1NEtNRDZlTk1wSUFlc014dW94?=
 =?utf-8?B?aGIxTUtYWVVwR3ZJeVN5WCt2MkhsbGx3R1dZZDRtcFNMRUxEbTVEQUZUcTRh?=
 =?utf-8?B?WkFNdldUdUxUNXhEMDZTeU94RFA5Y2xQNlo5TGJLa0hZV1VnUHhXdzgyeTFj?=
 =?utf-8?B?ZDFodGZiaTVXTFJ3dlYxTUJKVUxQNVEvSlFYMGRwMlZFWXZpY3VyQjN3dVlT?=
 =?utf-8?B?UVp1Q005MEl2Q1dHQ3ZxejdzY2lJK2FUZHFna3gvVDFlSWhUOUR4MGt5Tldr?=
 =?utf-8?B?S0hiOUUzUTdLZ3dJY3k2RFlNWTZBY2FJcUJ0V1VpYXlJdE1UQzBGQTgwK1ZJ?=
 =?utf-8?B?UWxCUXNnV0xqWHpVbnJpdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2dvd3pTVGthdFQxSG94SlVLS0FzRHgwUi94SUs1WitJOWdLT1lYb3psOExy?=
 =?utf-8?B?RXZSb0ZNWmpoblpqdkQ5S0N2ZVlsQk5PcXFLK0E1WE1pcVozKy9ySWtZQUVT?=
 =?utf-8?B?dkQwcHpvZitITTM1aUEwZzBZUjB5MElYUTlZT3BiNmRSMFRPdFkvZDNLL3F0?=
 =?utf-8?B?T1FscVNwRWNtdjdQbzIzY29JT1Zna2FINlpaOUlqUHk0WW1BQVQ4SFdJV1Rt?=
 =?utf-8?B?OHhWSk15K3k1T244R0x1UEd6NVBvN2puS0lOaG5lWjBqOFNGb3MvcEJVdGp3?=
 =?utf-8?B?aDVIMFBTekZZdGQ2d1dNQ2U1V1VhSUZHRXljK3ZTeWdwQktMY0UvK0NWNEtm?=
 =?utf-8?B?ZkxxRmFxV3B2ek0zZ3ZyVmp3UlFNY2UzMFlPajEySkpDMHRmSWNkRjNaclNn?=
 =?utf-8?B?Znl2UDhiN0t2MzcvMFdOWTkxNUdtR0ZVZ1htanllZU1UQUpWQUI0c0lmV2h5?=
 =?utf-8?B?eXBXRTJZMExrVFlueWJ5amZ1a2dwb3pMZ25oQXV4WE5qREwrM0d5RlpjQU9J?=
 =?utf-8?B?eTdiMTNtcHNCZXVlaHdjTjUrT1Q1cVdqMGJRSU96V29LTlhPbzVZSnhOQ2Jt?=
 =?utf-8?B?MG0vU2JuVWlJRlBNd1hFQ0FxcnRSSi83MVlrZGJ1K0NxM05GWGNrWkRqeTVB?=
 =?utf-8?B?Wk01K2RyQStyVTU0Q0d1VndqNStPTXZtS2hTU2Y5eG1WMUpEMlJIZkFMNW5T?=
 =?utf-8?B?ZUJPVWZCdWgrMmwvQzZ3THVBL0FLaC9DUDhwTTF6bDJMbmd5S1p2dmxpaEJz?=
 =?utf-8?B?YUo0dnJFNHlrTHpuWUxKdkJlckpkeFdoNU9FeHl3UTlLdHpIamhFYWljWVdK?=
 =?utf-8?B?dTM2RzV5RUVMYkRoeEtpMDFhWnB2d3BHQzMvdjVaOXdsR2QvcHExY3ZybCt1?=
 =?utf-8?B?THI4RnhOaEcxTFBQZUVxaVg4RWxzY0hrbzVpVTFXd3dtQ2pMYmg4cE9kOEU5?=
 =?utf-8?B?WE1OMXFrc3ZybXJVNkRCK2x2RzJHNGwxMFhxRm9ZdmNha1FKZ2hubW9TNlJp?=
 =?utf-8?B?SVJQOXluUTBycmt1SXEvYy9Ba0NRa2VJdEhjRGxkeDdONmZsUVJRZXFEN1da?=
 =?utf-8?B?a2J0WERYMkd6ZkszZVNCWGFiUWhtOUllY2FIbXE4NWVrRlJaVVNVUGtRQXNj?=
 =?utf-8?B?TER2SndRd1o4eDlUdEJ3OWd3VEcrNTkyWmszc1lrQ3laV1htK2k3NjV5eTB2?=
 =?utf-8?B?UDJWcEd5VHdWOGY3RlNvc0NWUUlDMEZ2ZVVNYzdEV2ZSNGkrVHlNTmFCKytx?=
 =?utf-8?B?SjBFZnRzSXRaQWYySkoxS25mb1k4bG1wellMbklRdldMalU4a2xhWC9zQXZq?=
 =?utf-8?B?b1lNQmRBR1Rhb2p2RG5TQ3RPSXBidkQ5c24xS0JONWJmbGRMTGMwMWRxU3NU?=
 =?utf-8?B?SGhtSmRob1VHV0treWdIckhwUUxlanQxN0I0Z3ZzWXF6YjR2NDA5OWdHbk9S?=
 =?utf-8?B?K24xQWNEdmcyeFF5NTNmb1QvWkNWeEZxbnpicDR3Y1JEWXNZZDBOWGdHbE9l?=
 =?utf-8?B?M29PUklubnZwYzYybThGVnZzSXlPOHh0enNqTUlKMEtZRVhCU1VOUEEwbjZI?=
 =?utf-8?B?U0xSM2h5OUtEM0Z1TldZMTdJQS95SFRJK2ZKQnB2R0QwUWRXSExVSnhIdklV?=
 =?utf-8?B?Mi9iSW4vVXdjdDUyaEFKRmk2VlUvZktieStrMFc3ZGlPbWprZnFyTGptWXEy?=
 =?utf-8?B?SFB5Y0FKdm1ITlN3SEZLSFF5VE1FQUIzWmh2WDMwQ2VLcTdEVWlQVldzMTZN?=
 =?utf-8?B?RWNwSWdJcStYZWRiMmZpaExycjV2UnhQY0JoVHAwM0hweWxVYisvbU9FbmZt?=
 =?utf-8?B?eVREcHB1QkUzUFVxSEVQZmtZbWtQcDNydmZJYkRIWldMNWNqZ05EMW9HeGFy?=
 =?utf-8?B?ejFJa0EwSXV4QUd6ZGFRTDUxd2FvRFg3TEZmOVhnUmVhSVNsR0NmNnBOY2g5?=
 =?utf-8?B?QzQ5am5iRDdGNldMMnJzTE16ZE9xVklmMHdTY1hCTHhhUDZQbWVPYmZiVEU1?=
 =?utf-8?B?ZlVpQXU2VTk0ZzY0YnVPdWRBVHFrclp2WEZxbG4zb1FXdVVFdzZHbTJYbXpj?=
 =?utf-8?B?SjZzSmZQaTF0bzlneXVCb3d6SWRnTWdVRFV2Zk1EdEFteGVRYnVtV2NFU1hF?=
 =?utf-8?Q?tDPJ56IQq72RRj612a9IFQ5KE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02819055-167d-45a9-ade0-08dcd7caa6a3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:14:16.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhp/R8/AJwsZT8SCUYB1lsJCrXkpMiAgxCzOw5a8SaMqCICHAJWmLf+286KYISPiYbvRiaEUH4aE97UDZL/VvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082



On 9/18/2024 15:26, Andy Shevchenko wrote:
> On Tue, Sep 17, 2024 at 11:44:04PM +0530, Shyam Sundar S K wrote:
>> On 9/14/2024 00:24, Andy Shevchenko wrote:
>>> On Fri, Sep 13, 2024 at 05:41:05PM +0530, Shyam Sundar S K wrote:
> 
> ...
> 
>>>> Note that the git diff view is presented in two separate lines in order to
>>>> suppress the checkpatch.pl "CHECKS".
> 
> (1) ^^^
> 
>>> This paragraph should be in comment block rather than commit message body...
>>
>> I can move it to comment block but in the last version Andi mentioned
>> that I have to leave a note about the function within one line.
> 
> What function? I'm talking about (1) which refers to Git and checkpatch.
> 

There was a remark on this function to make it into a single line.

+int piix4_sb800_region_request(struct device *dev,
+			       struct sb800_mmio_cfg *mmio_cfg)


Anyways, let me not confuse more. I will put the paragraph what you
pointed in the comment block.

Thanks,
Shyam

