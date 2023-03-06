Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480826AC075
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Mar 2023 14:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjCFNMA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Mar 2023 08:12:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjCFNL7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Mar 2023 08:11:59 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B023B2940E;
        Mon,  6 Mar 2023 05:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnImKYJDzV8oF8xvLlpV2f38fWM5P5trmTLYeXyPJ0BZZfNm6HKrKdttWyIkAHBMitNs5SfBO0FumfnFkZgDnShwluBrgEiEEatU9sshmPqja2ukIk1nv/JasCigVCPDssWgwALTXUEXX4e8boQRtxvPctzDjaI0wsM6jP9MBB1FJ6duj/DzCfwJk1rEez08mBkvttWx9matbHXctsMym9qKCZ+Qb5BRDy9PdfysQE/nMG8004XhMaFj5VboeY3Jxdf1hbzqR/aWeWJfL7qbCkK/7xXwDZeFilvuHUS+Ag5LbCjPDiJ3aeiTw9KKD6MxSKdzncDY+T9gOB41DlOOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeIUNZrIFZWOnjx24gQqma7iCs7aUoOnOwRvnQ6k5iU=;
 b=bMvNS7nV3lmFLRaOz9uwCb69Rbbo5rPpSczAbpHXUb65Fe5SJJFpVbP7zKkBhGn7kRZelMUXdJbOk8utlAt82fVkcSv4pyx9nIvOjCpqhaSBj/S/JqeFpX1ELj1wBF0m1pnARFU6T6TC1sN/xCPmzEtsR10cPTBR/4FyOXNRKLMOjCkt3cPspJSoX83XQgTNWYhd/T1EWCSF+rsWcQnw3P1bv1q6VG0Jn7KHw4I4jA8PpAxS7RAK+DvZj60PlLXYBPhXuzfkuP/nydPbezsSOUg//K+QhSaYTN4GSm8om3sqbswv87KKqFsEPqSwvc6EuCaIkBJ4C2M+w03vXHMwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeIUNZrIFZWOnjx24gQqma7iCs7aUoOnOwRvnQ6k5iU=;
 b=H7Ydt3IsL2fHL6ZGG0tjLpDW2bTVLbEZGt8lgiUa8w5nf90njgw8qxxcAMkgzTpZID2X40sUpjBnrFhXXRpoWpv4Si2yuLimGXVS3QSUKTlD3EQdLJUGAzEjCsqp1fT1h3/IidmnH9vZ6RHS7GtsA9OAJnP01wkWfWH1NfAR2Ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 13:11:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 13:11:43 +0000
Message-ID: <f69f0dc1-6fe7-7aa3-4555-bdd5ec3f8f04@amd.com>
Date:   Mon, 6 Mar 2023 07:11:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 9/9] i2c: designware: Add support for AMDI0020 ACPI ID
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230303165050.2918-1-mario.limonciello@amd.com>
 <20230303165050.2918-10-mario.limonciello@amd.com>
 <ZAXWzMFBjo57UUa+@smile.fi.intel.com>
 <0a872110-3f38-0744-17f1-74de3e78f84d@linux.intel.com>
 <ZAXiviOdddEK/Pak@smile.fi.intel.com>
Content-Language: en-US
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZAXiviOdddEK/Pak@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM5PR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:4:ad::40) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: a8ae6b4b-0a5f-45ef-1a2e-08db1e4454e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H6xI5ASmwwwBvOYtyT39ZxIVUkj39h6C3xYPnAz9u5mzRYkhUzbdDTW3BZM2TwvgiBSn7xuh1/8zLQ4k8bPlYq4OStncMvJwyy6N1xk/C0SlJx5i+JIHbgJHKJfdUw63cf7213oFoPowSxjgeMS3807tQ+yDMyfEpxq6//SL/5wG6vjokQuA/uq0D+Bu4iVc9udwv1y+qxJ44Wd8zchIg1QDshmPdNmeqAjtqvbjmVBUZ6iAJT2NQQB38xPtMI5A+YhsvJSRuH0GEhNMMyfewTkOT0nJWQydWbBimAiiraSj8+1QMDJUwkCLEgAsQ4ogPNVI1iWVJ3XZq7dsDL5cnpABvScoZevBxjr3RNYhvTxn9EhkWNt0YeIND3xK71oqKhmSQR/+YTchZI7JGjZngzaHLS880/1acpa+cuReKKLOqcRLe8ORieMaPkE8g/7GTt5xw2WJwJcoZ8jWVR/iUui+I0Y5SUf7SzE0ADR7kFbO2WLSXaNweW82SBsMHa3N/6AcQzQ97QbALcnQumGJgzHBfugSOIPMd4v2gi1ptNUXCE3i9lUVaS+4Z8LnB+PmzLHU8UdhBqI+nobS+1GOFmpKuXzfbnNe4saQW3TBJgU/rNZiHDIEuByoiWaPQDLUMNETmp+bnXlK3N0I3ncjXlUQAUDmft03gFD0sI+GrpShY6v6nsQDukYbhlRIsDsdJ5Sm29hyYE8j4H9GI7HDKyVrf5YW1Ku7lqpUGYsiiUQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199018)(6512007)(6506007)(53546011)(6486002)(36756003)(31696002)(86362001)(38100700002)(186003)(2616005)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(2906002)(44832011)(31686004)(8936002)(5660300002)(478600001)(316002)(54906003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9uQ2VZZU5nbVp0VTJnelMrVDFXUmNET1FxcS9vdWEvb0duZjFPRnQvbSts?=
 =?utf-8?B?Q2E5OTU3UysrVGJwZGFDcUQyMnlmZzhSZDFvY2k4NlRFS20xWm14aXNNL3NG?=
 =?utf-8?B?RVdWcVhMRHFodm1QTmFwM1FJSWxwbTBtcXVLRnFIa0FXOTRSOHI1UjJ0Z3pm?=
 =?utf-8?B?SnlVL3dwbXVaSzkxUkl6YW9BY0N2bXFNK1d0S1J4TzltTUU0RXpBU1Boblpi?=
 =?utf-8?B?TG54a3Q4UXpzT21VeHZJbVBDL3prc2RuLy9yK0pIVFkvaVQxY1RKb0lOQzhj?=
 =?utf-8?B?Znl6bWpDdDRoZFNQY1ZsS1gyRGppK2xzVVJMYW5QWEMxdVNOaVlLa2YvMlRn?=
 =?utf-8?B?MzdIS0hzNzJheTBDK0c0NDExN0JXd2FiSkNlTm9kcmc3b0NQQzg0YWVnUHpi?=
 =?utf-8?B?R3ZNYWRUYlkyaGxlQmVWdzJJMC9XTi9qREMrckJlSzlYdENYNFZFY29mUzVT?=
 =?utf-8?B?WW1FS3JoVXZhZHhKaE5XT3dKajc3UTJIaGRNZTNybHpCUnNpT2R4ejJ0TS9K?=
 =?utf-8?B?Njl6cXlzYnRDWjlLcHF4UUJzN1BQOWMrUU9SRkhBOFlrZ01sa2lFdVBXbWMw?=
 =?utf-8?B?RjFSTzRabTUxSXZqWmxoa2VOc3FPeFFzYzFsd0pvdXIySzFFNDczeHZ0dXkw?=
 =?utf-8?B?QjIrZ0RJQyt5YU5yVUpFQi9qYkZ0S0dUcUhKdkxWVHBqVlp3bVZyK2w2YWUy?=
 =?utf-8?B?RDVMejZ6czFYRGMzMkRLcmFHTEtrU3craXJrNlgyRzliZ1p4cjNKNlpPNGlE?=
 =?utf-8?B?RXgwSVNLSGo1ekYrMFpDY0tTL1BxbU5KWkJURkFpUTAzbDhuYXBHUGJpdzJZ?=
 =?utf-8?B?U0JoY0Rzdll2S01mSUFCZlUzaVM1eERmTG1NZGJoaXZ4TGRWNlpERFVEcXVO?=
 =?utf-8?B?SGp1cng1R0RSeFlUQyszYjczNi9BbWZ0blV5Q2VCZ3pTemJSa1ZUNEErQW9o?=
 =?utf-8?B?Q0NxcjVZMElrU1hDc3B4M1pKN09OL3NXQjM3ekV1OVNlOHI2eDJlR3VkWWR0?=
 =?utf-8?B?Y0kveFpHTWlCVXA0eHZmTXpyeFh0STBvVWQ3emd5ZThCWDJhQlR6cnZxQzlO?=
 =?utf-8?B?ZTBTekVaUURnK2xQVkVJdlhIVlFVd0xUT2U0eXI4Z3RoMmxVbFg2c1VicGI4?=
 =?utf-8?B?L2cwLzlWTWtkTktlZ0h1Z2NKSGU5N1AyNmVLUmZ0dnhFdEk4Y1VQNmRxL2Vp?=
 =?utf-8?B?T05OTG5UdExJV2pSRURsWDJjUWYrK2lkWm1ZSU5mWDAwOVVzbElsbGxYVGhs?=
 =?utf-8?B?NEpTanV3MEpMbHpDbTgydlpCZW5DcExQOHplQmtORXFQNk1INmh4anZVTWwv?=
 =?utf-8?B?NFBhRjBHS3R5Z0tBdmdNZ2pCTjhJVS90d3BIRXNTYUtiVXNJLzMxdU1Na1By?=
 =?utf-8?B?akF3dDAxTE8xcUdFamxmem9UR0VXSHlkRXNkVGZuOXd6b2lRN21Yb1c2RDM5?=
 =?utf-8?B?bVY2QzVWV1RaWFRHSW5XMk9DZ0F4ZTlVS2xEckVBWGlvMDN6ZW9FSi9xSFNQ?=
 =?utf-8?B?NVF4UU9VbzhySC85dlUyZVBndjdsV05nejJ0a2FiNEFSRjRMOTRIZ1JLdGYw?=
 =?utf-8?B?WnFGUmVZSDRBY29IZ1d2L3h1VktSQTBXSVdxZU9qcy9SSG5xdnhEek5jY0VD?=
 =?utf-8?B?bG5md0dsdlBjc3JkcDJ5VWowYXpNVmlUU0lkSjdEaWxZQnR3bmc3eFVrUXFV?=
 =?utf-8?B?djN5MCtVVC9RTm0rZDN6UWU4S21tdXZMaW9xWEwxQ1l5Z1p2QVpxUzdyTXZJ?=
 =?utf-8?B?UG9LZ3dFU3c0VERsbnhxKzdROERxcjF1aTUwM0RvSG9KT1NDQnBsV01wYXpj?=
 =?utf-8?B?bytBWGViQWFDZ1VnQUN3Y2dnTWtVRXMzTldjUUlwRllONFpyUnBPbUNJMC8w?=
 =?utf-8?B?dkplMTE0eUUwSHdacmt0NmF3Mzk1eUdpZTVMR1J3dlhVYStyZnVReW94b2tZ?=
 =?utf-8?B?VjFDNzd5NW12Y3hSUjhsT1dRcWJrVUxUYlBmei9SU1hJVHJDWndmTUpITU0v?=
 =?utf-8?B?ZStYd1o3R1hVb3pRODJwSTFTTkF2TWdsS1A5aXVReWM1OCtwdmhsSmJFWkZD?=
 =?utf-8?B?K3FOSzdseGdBZFVWZ0oxZFQ2QXFmME94cnJhT09OVFZDVjRMVTBUTlM1UFNh?=
 =?utf-8?B?Ykxvb2JGNGxvUEQ1T3puZ041YUFNeWVzVVRCN1dLS1N5MzMwd2M3c0FxdnVj?=
 =?utf-8?Q?ztqdCpTfjsnjKS2rsWRNg6/oh6mb9DnyYT80t3/JaMTS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ae6b4b-0a5f-45ef-1a2e-08db1e4454e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 13:11:43.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zxHvK460J6iE9DHvTsUN45wlfgZN58dhFCF0DosAttBMDIqIRxRNd82w9+uGjVTtlsj+N2mppWgL0kxE86fTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/6/23 06:55, Andy Shevchenko wrote:
> On Mon, Mar 06, 2023 at 02:28:05PM +0200, Jarkko Nikula wrote:
>> On 3/6/23 14:04, Andy Shevchenko wrote:
>>> On Fri, Mar 03, 2023 at 10:50:47AM -0600, Mario Limonciello wrote:
>>>> Cezanne and Skyrim have the same PSP hardware but use a different
>>>> protocol to negotiate I2C arbitration. To disambiguate this going
>>>> forward introduce a new ACPI ID to represent the protocol that utilizes
>>>> a doorbell.
> 
> ...
> 
>>>> -	if (boot_cpu_data.x86 == 25 && boot_cpu_data.x86_model == 80)
>>>
>>> Ah, in this form it's getting better than I thought!
>>>
>> These removed lines were added by previous patch. I think a bit too short
>> lived if the same patchset adds and then removes lines?
> 
> That what I have missed. Okay, coming to square 1, i.e. dropping CPU ID
> completely from the series.
> 
> Note, for testing purposes you may always add a HACK patch at the end of the
> series, marking it respectively. So, people may test it all and maintainer
> apply w/o unneeded tail.
> 

If it still works then new ID can be reserved and patches 8 and 9 could 
be squashed together either by subsystem maintainer when merging or for 
v4.  My apologies if this wasn't obvious to reviewers.  My goal was to 
separate the scalability and functionality for test purposes.

The way I did it was the series could be tested with patches 1-8 on both 
Cezanne and Skyrim platforms and no BIOS changes.  If it works, BIOS for 
Skyrim can be patched and patch 9 could be added to test kernel.
