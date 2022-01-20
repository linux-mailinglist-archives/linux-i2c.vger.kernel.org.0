Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202E5494FB1
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 15:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243828AbiATOA0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 09:00:26 -0500
Received: from mail-bn7nam10on2072.outbound.protection.outlook.com ([40.107.92.72]:10242
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242624AbiATOAW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 09:00:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EikozTm9U2rVnANRil9XtAP7g8zN3QqLFQCXRkNUd1N8QROpGWccSfSXdLO8e6HeGliRUJuxDHUS34uZ2WfZiwDNoUe2H3J9vjGTy7/yZqluVVYbB4CuveNmYCYzEp+C9NjvDKxxjxPEAM8Ur+dDi/VxkrXTK+e+d0D2fDchAk/X2ijg8FPlnhTwAxT0ygVgtqWwHGox+Nz1f3IUmJ1YC6U0fcUHYfDHyMpxes0s4Svd/hWMlCmNkcUfh8meK3JMxshPQ5Rp1xBKWyry66s5BYQ25YQ2vnENJbSRU/FqdTNAhsl5AOxMhMQjZc9qW3mCA4qtYqAfZhHWL12TUaO76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1y9LMaoBXrRjfGTF1smfC9lenHEu3KbGSvd4UWq8RGk=;
 b=D/Vcw8jMI2jojf+/QoATg4LYnRR95vX/2dX39M3g36qJdaJCTmSOuk8TFmZ8xI8URl+EU2/eWdNsChLerhIbuOLlAmz8VhNMCUvlg0vMAirQtXSC9fWiqrfLePjVws6lwTcpcSrlPloICVI8e+xu6gaJwpCZjEyj/iSvjRuGor+Em9TFazWWyjMENpJXVrDVa2RnckdP8kpGSqIiPQUDrE/MZG9UyKHgQ2FGDfuRlZvm3bc4uOFb0wJlEozVNPc9kpV0ClnJF8r2EIggmMcejPm8akvOeRwWVbaXqONg/NmnH+iYYgLZHrsKyfzSb17fo3Iyz+/nejgi3kzT9qTwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1y9LMaoBXrRjfGTF1smfC9lenHEu3KbGSvd4UWq8RGk=;
 b=bD532hfM6TiMUWnVtQEfD3z8SAUwjxfxENGuvqJomw132ZgTU570AdKNUk7F6NVWnbXYczMtq7erSq8UwjLGKCr0MeGZsFNXWxHzg/dwsxm0T3mcEros3vp/rdEKt7JIXtFEhiIB2VvHzDwPRk0OYt3luqKD4ZhEbq/iKhQBeN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24)
 by BN8PR12MB3443.namprd12.prod.outlook.com (2603:10b6:408:63::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 14:00:20 +0000
Received: from CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e]) by CH0PR12MB5346.namprd12.prod.outlook.com
 ([fe80::ad10:b9b4:d5cb:af1e%4]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:00:20 +0000
Subject: Re: [PATCH v3 8/9] i2c: piix4: Add EFCH MMIO support for SMBus port
 select
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220119230626.31560-1-terry.bowman@amd.com>
 <20220119230626.31560-9-terry.bowman@amd.com>
 <CAHp75VcGmmRpRD99tFHd7WOPs6uyz3uWuTEoc=G+VmbPYAUvuA@mail.gmail.com>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <5725e209-f9b7-c2b6-3315-184b493fa360@amd.com>
Date:   Thu, 20 Jan 2022 08:00:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAHp75VcGmmRpRD99tFHd7WOPs6uyz3uWuTEoc=G+VmbPYAUvuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:610:e6::35) To CH0PR12MB5346.namprd12.prod.outlook.com
 (2603:10b6:610:d5::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd62af83-8a14-49d8-0273-08d9dc1d3210
X-MS-TrafficTypeDiagnostic: BN8PR12MB3443:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB34434D8C639819272C2D59B7835A9@BN8PR12MB3443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: babwUQcQzYo0jO18Kx86xpReOxO+rCb8K8AD6yHfEeAROT0gz5pvhlXfTS3J96ETsrXIBFmGttSu5+cn0gJz34gvnm8pEn2ghKytSJSCbb3rjxCxyhcD/JyEeQLSI6MEKxKHHt/nPeXh0c0mHJt3t6ZkWZWmrhTWZlZGOXg8ChrHnfsAc1/tBEk902+IOm4WJvSBcaLI/qy94Uof26dq0fLMJTcRAIKxFD9P/BoPY8KfjSNg9IBlge6PE++dJl6lQjwB3FMhZafvtRV3Y2j4C7QluUe1rjAIa7or9KnX28Z2BjERU2Iw+953TXEjh3R9BbAAWI182pkZX1+n3M3fAmZ3MZIrLpf0BmsS3JCONy8MxnGnLtHKH3r7vDfYD8PUMtfxxbHpkdXzCRHRHmnnLC+qrpNUZWnNTuYm/dT02yGzSm+Dmt8l27aTNQ2KQ8nuuRE798ayKJF5XSZ7qHIfOEi0i9rzriud2XiGjBhadtCisIep/4EtOkaO1GcluqzXNMjQhgkpC3hKd9censAK57pGJElBz5+O2vn2fJ5+6BTE6dORIXkkCFJJTpAzMK+WX8IwZaiKCAiz9Lxewez92cmMPExCt78YMQ/6BQRf9G6Im7eCh6NIrtClEkhUtMCv7bvRYmwb3tzvpNxyDr5NVY5iFK701uSFWupvw4ooIP21duPnCj2msRWCQ3jtCKgnmV92gI99QVRAQ0DF8JaL8EVrmL4SQvH4nCdKZxt6e1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5346.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(4744005)(8936002)(86362001)(31686004)(6486002)(38100700002)(2906002)(8676002)(186003)(26005)(508600001)(6512007)(2616005)(66556008)(54906003)(6916009)(6506007)(4326008)(316002)(83380400001)(5660300002)(66476007)(36756003)(31696002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hnVjQ2cDRsc1k3UW9FK3NhVkk0L0Y1QWpVUWR2SDlPL25KLzE0cXVFc0oy?=
 =?utf-8?B?SXdvV0diL21SU1JrdlBjQkFQVi8wVlhxUFk0Sys3SW1mcUpOdzZvUlFSbnUv?=
 =?utf-8?B?dXhOeEFvTXZqamUvTEFvODUvOWd6ZEpicUlSdWZJMDdsNDNqRHV3YmFpVzJx?=
 =?utf-8?B?NmgxSzlFWlBiM01ka3lQaGZZRUhyRCtQblp6RnNHUnVTeXozZ2xsaVRtQk9Q?=
 =?utf-8?B?NU1BWFVWSmNJNEt6ZGNKWGdqd3Rxd1NDVWhHN1RhckUvci9PQnZibm1CRlp5?=
 =?utf-8?B?Nm5VN0M0blcvZ052b0N4M3E2SHFyeTcyanJVYUp5UUdzOE1qcFJzRzloK0Rt?=
 =?utf-8?B?TGllbXp2OTZKRWw2bTdSYVlPZ1ZTTExIc1UrTkxvVTBYMnlzVEFaajMrQzJF?=
 =?utf-8?B?WnFRczBaV2Exc0VEMzZaalpWRzNPOHlCYU45Y215NmJmTGtQdU9kTXU0VFRy?=
 =?utf-8?B?LzNoMWZROUF0STVQc1lTME5vNGJvdlVFTE9iU25nMVFLaCs2SHFqZDc3aTkz?=
 =?utf-8?B?eUJuK1JmTlk2MnQ2VnBOdDlmWHNaWDViQ0NvV0ZKNWVSRU5Ja0p0c2xZRURi?=
 =?utf-8?B?YzdlMGRVcThqUDR6eTBPazNTZjN1SzJjWDF6WGk2aXZMOGRIeTZWcElsV1lt?=
 =?utf-8?B?YmwraEQ1eElweHE4NjFhV2VnZlJVcC9JWklhaVFkMitrWFdKSklaOTBCRWFU?=
 =?utf-8?B?ZUFBMXNSUlZUdDUwS2tleHlGSUJhblVJamRvZWNCZE1IQ05KN1lWdmx4N2dj?=
 =?utf-8?B?b3A1WlNTUEJSTkVIUmdPZEZXZVpMVUxCRnNNeStUaFZNTENiOWloamM3SFF0?=
 =?utf-8?B?TmdEOVJtQUp3SlVuaTVEWEZscVlaaVFkVVFKWDY4TUltR3ZsRWtoSWQ5bXYz?=
 =?utf-8?B?SzhpenpENWN4NU5wSFRra0hBcHNDcTRkU2g1SDJyWmZGTFBKbm8zaFp5VDNz?=
 =?utf-8?B?bE9kTFVycC8vMXRqeGtGb1pzcWQ5UG1iOVFGcUhIL1VhRWNKQ2ZxdjlMdjg3?=
 =?utf-8?B?blRpTTQ5d3BTTyt0SmRtS0N5MUJZcENVU1UzdldXM05sRW1IcEI2NE1KV0U4?=
 =?utf-8?B?TGFyZjZ6WWF0SWRYOGNMK01ZbW5DNjRBVUlUNHpSb1RDU3JsaTdGTTFrbXN5?=
 =?utf-8?B?VXpkVDkvcEtQczBDNzBlSmE3d2RxeHE5bEhCVDR4WDdlYkRKbCtKbVlMOXh5?=
 =?utf-8?B?VW96R0xVc0pFNlc5akJkcDB3cTVNWlJrbldyUDd3ZTlYVHBiMmpnS2p0Zmpk?=
 =?utf-8?B?bVlpZ3QwdTYrbU1LM2xManpNSjdYMy85T0ZRNE9tbDQ3Zy9USElwU3pJUEdE?=
 =?utf-8?B?NVdIcjJMckpuNk1PZVNUZ0hsNmk2M1MzTGllQlI0eEdQRDhHLzVzTytoU0NW?=
 =?utf-8?B?Y2s3aWVsRzU5WVI3TFlRTHFKdVR2R2xtVVFTeW55dEYvcWphMGpxdHhwdE1v?=
 =?utf-8?B?NkROdU00ZDRsRmF3OGxpYzI3bnExOG1RZVN1Y1NRTUpLR2Nza1lZVm0zU2NM?=
 =?utf-8?B?RWJVL2ZlSFBaOWM4OHRwU3JUakhkeG82OWpuSE1PZ3N3S21GbFdXaFRFR3Jv?=
 =?utf-8?B?ZElYc2RpbHZqOTQ1a2Z2eGd4T2VoSjkzTm44NW1VZ1ZxSUx6N2hBcnBOV2hs?=
 =?utf-8?B?VnFmYVVWVm1FTjFJc2huNFF1Q2xnamYzUlcwZXp3cndza0ZZVmIyZjZNZDlF?=
 =?utf-8?B?OFp0UzhEaHovUmp4a3ZwNTJnNzNQeUtsNU5ha0JZblB5bVRPeEp5L0ViMWgr?=
 =?utf-8?B?a1QwSUJ0OEk1ZitIT1ZtOVJPOUI2eUh3RkEwUDhkQ0JQS1g5RmQ1TGUyWUJk?=
 =?utf-8?B?QkM4Q05UNE1ZZHMwOCsvSFEyMDlvOXB0ejM5RUhPT3RrSXBaQS8zTERCVUgz?=
 =?utf-8?B?dTRUM0RXZTkxczk3RjExeXZBZUdYQ1MwSVduMjhOdVN1MFpvUVkrUGkySzZC?=
 =?utf-8?B?NXY1NUQrS2Jpa0x5VDRFeUZTNTJEUzhsQVUvREN4N2xSdHZvVmtxS2lYcUJ4?=
 =?utf-8?B?enZTN1h1OTRNQmtkK0JxakExaE1MYVJLc1BsVDQySjBEQ0lMa1RGNmMvaDky?=
 =?utf-8?B?ZFM2NkQ5VlhTcTBUZWJtcElLRU1GZXVtMFZyRXVUT244S0g2QkRQTXhEdkxh?=
 =?utf-8?B?MC9lR0hUNnU3alRaWWZrOE1QbENXczZlQVZ3L00wQnpNOWZxeE5MRUJqa3ls?=
 =?utf-8?Q?wMiPLE9Sv6XbppEsm7S64vY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd62af83-8a14-49d8-0273-08d9dc1d3210
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5346.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:00:20.2801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+sXRqwRccL2re73PumneyIS/Ybg6a1wtXEsBteOFlP8qovGb9pyxGD20qGjD01g7AjoF49A9vRanW7jTG5NPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3443
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/20/22 5:28 AM, Andy Shevchenko wrote:
> On Thu, Jan 20, 2022 at 1:08 AM Terry Bowman <terry.bowman@amd.com> wrote:
>>
>> AMD processors include registers capable of selecting between 2 SMBus
>> ports. Port selection is made during each user access by writing to
>> FCH::PM::DECODEEN[smbus0sel]. Change the driver to use MMIO during
>> SMBus port selection because cd6h/cd7h port I/O is not available on
>> later AMD processors.
> 
> ...
> 
>>  }
>> +
>>  /*
> 
> Stray change.
> 
> 

I'll remove it.
