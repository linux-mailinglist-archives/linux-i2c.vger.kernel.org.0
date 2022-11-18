Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88AA062F999
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 16:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242335AbiKRPo0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 10:44:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241712AbiKRPoZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 10:44:25 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710D47D509;
        Fri, 18 Nov 2022 07:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enOgP1kDR8cR/WqgZJ5ptOLKg3NW6gMoxzO0+57yA/KgYFONEqbkzb7F95E28Krcx/tmGj+OZLkYxa6++Ytwln++TjVDTnXcMd5saSzYYZjuWuF+17wEMuNnfas7FcfQikxVvKMQfsRad5y7dxACmg1muhL39xasrAb7F/TLya83i9G40zPLSWOzqOUhXa9OfXV40A1N3b8+/JXIMDUdUBApBedGCZ9nEPyIwR2A5++FMKeqmAXsCfO3zskdprxuVCfI26uiMN+qlFsX2PCPIov4jmv8i4Gx9u53Lxf9E+6vDLWkTqj6O9zdo+jlJh50b+Y/OnLDdGLAP9PldwEQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wq76mKmYLbJBvcI1O3AsXWa8+TkjPSimB+++i2ejPGQ=;
 b=HSsTJrFHGDuX+PNe+1GH/edDW0YncNcC0NZoLzDbchcXl+VO/zE0Oa5iGcKD972ZdNRpixBvwpuSthpyCyHIQk+bAyGHXX8dQ9SOrVTYGJCKZ1H2bCVeM/x75wfYeASSWAHtNQ+XxOX+kq7V0JobdhuHnLHGj6U3LdECtV5gqYEP6ybo848EfYJpi3HYkOQKdr/4XUi8gml9xBuvsIZLLOmIpSy9peFxYLfyn4ryxPVNSHeDBRGQZuEHXPvM15itSvxF2mu0CQ3rrKBZSBiaHFKOJJyyNBJmg/r9tqLlSINBEnKqMJq3EAc5aNIYOgwBR5mseEn6lsnBL+SAA2UKWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wq76mKmYLbJBvcI1O3AsXWa8+TkjPSimB+++i2ejPGQ=;
 b=KWvwGDzvrgEbeGU6ALWNJzZkFHxSFDLWdyTGqY9jf7iaL5HQg/v3f8PvBqegLNL/qSM1WDwLBQjXGmTX57IJP24CcxFY28vsBLdaorCPu6WPU9qN/rrNnB2jovbkq6ja5SYyYHXQfjR8sdImMu9fMUQoP7iMiYUi/3fSc3IRkp7RHjw9a10BLZQxq5EKhcQ5plNrFYkprXEKVFS0Ld8n9d8M5blqqt30ZFlmwwCWkc7AX4lmtgCt3yWTByxarv1DVt72Vd0s9czBpGGiRXwNvqYybNDh+//Uz5bUvHr0YMCOTmGfprI09vJ1LY3HVzB8qTVhc6p7ibtb6wvQo1cdRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 15:44:22 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::8edd:6269:6f31:779e%5]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 15:44:22 +0000
Message-ID: <51806f6c-5378-9a4b-9323-f8bc2529de0c@nvidia.com>
Date:   Fri, 18 Nov 2022 15:44:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 00/13] Enable USB host and device functions on Jetson
Content-Language: en-US
To:     Wayne Chang <waynec@nvidia.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        treding@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        vkoul@kernel.org, p.zabel@pengutronix.de, balbi@kernel.org,
        mathias.nyman@intel.com, jckuo@nvidia.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, singhanc@nvidia.com,
        linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
References: <20221114124053.1873316-1-waynec@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd55210-8e5f-433f-1bc4-08dac97bc2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mH+gpAZHWiBGm8PUXDq1aUzJF7Vd4F1D9yA00KciwyQ4VfEl7ptm8YjquhdNoRPy8RSOb8Elk7q5po33mMciS4/HSxYlxqC6GIvEMJRkb3xpS8Z8TsqSEyesuvmQqT/o8T/3VS4iwA9BtLOzo6rBFU89t77eA5tl3gJ5+RFAJ3TGIMTy6IwxruQErhoKfWSExT+jS560maL+FJj6F3SAS4bo5rOCaSe4/rCU1SEiWPIFtvIYet0+saBhN3OJboRX4w7l40SJ4iqdvgv2tSZWyzp25GQN1YCdNpJLp6MExjAEZgPbj3vDs1ScCFTTotn9msBuY5PEscienMJsxHal2hgW0yUn4AnFY8H2aWEsg7kXNBP5uFZBQR7IyEaGs3KXL4geXAH/i60r0Ol0C3fcfT7PhICxHlnvUFYrpvavB7Xv1n688AGQTeJ3zElLrQUyIL7jbJFrQyNKBWae0v5bzeOCfjlVksbnuLvIT4VvlK/rvvOyR9oQ5z8q0T2QLpjMybaas1fZg2veQR6TM5xdaQp+QqYcutVV7NGMQkh+erXZ1oq0c5DzUmmIrRZTDKlUT5JSReJP8T1HZa6Lbncwj3eJl7aKpEuFgpfWWUeDIDEBvG+MWFQtEB2XQ8IDu9rBcT1PleawGdXhQ+62SEFILzFANeU8PS3zTE5QAyQjlsVf8BI3qDEuysx0Lo6LhSy/fz5SJj8a4qp3AH1R1u8sfgs2whhZe5lAPuKfYt9CACGXwqLeh2Hf5ESuZwegt/1qb7mhfc33ryiH04XXpDGYRNRRN6fH7UHfode0cZ6q2r/3Pe9eEKeXI6zXODR2oc4tAkPdxTF3cvxGEgODlcsolw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(86362001)(966005)(478600001)(38100700002)(6486002)(31686004)(6666004)(6506007)(316002)(186003)(2616005)(36756003)(8936002)(2906002)(6636002)(53546011)(41300700001)(921005)(31696002)(4744005)(7416002)(6512007)(8676002)(66946007)(66476007)(5660300002)(4326008)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHhWMmUraHErZmd1cXd2di95WmhwUGI0SWJOVFY5dG5WOTU0dHJBNERHc0Nt?=
 =?utf-8?B?T0Q1MVBTM3NsbTl4YzZyeG0zdjh4aThzdXJmVWpTTnZ2bDdyQmgvYXAwUkdP?=
 =?utf-8?B?MW1TQlV2YTZkOFd1eHBlQnFZdHNqdThXNXJ1cnpVL01vcUFnVTNxYVVoQVlF?=
 =?utf-8?B?d3prV2FRUWFzSWw4cDhoSHRxQTJhMDZWL2VtNzZFY01PQndqRDRidUdvdnRu?=
 =?utf-8?B?U2p0K1UzR2VsVm1McVR4QnNiTEltcVQ0ZklDaUZhbFpJcnk0RTYvVjBiWmpm?=
 =?utf-8?B?akUvek02WjBySld2elN6K282WjhVU1BIeHpFSWxVN1Zna1pDRUJHY3BFUlcz?=
 =?utf-8?B?ZVR5aW54Zzdoejk4bXN1TWJ2MWtmSlowaGltV1ZFakZHUkhGNWRzb2NVQmYr?=
 =?utf-8?B?TU5Ya2NJS0dXQkxWSTZhN3N5MmV0TzNBaHJzQlM4MUdCN0lvUHJsM0pKaElU?=
 =?utf-8?B?N3F6TXNqSy9NYzdoZEwrMmdsVzhGdEZkY1lDcE9YR1dWVlFHWThCcTdkSlBs?=
 =?utf-8?B?eTJLRU81OXl3OTVpdGtlRWM0azhYMi85S0RGVVZ0b0o0dmxmTS9SdTlzZHB3?=
 =?utf-8?B?RllVdzQ1TkNEc1ltMFpGVkFPWC82cVc2WmluaWVVTlZXY1BkUFNGK094eGZa?=
 =?utf-8?B?OVpqZUdMQmIwR3ltOENwWEtqS3dXYVBHVHRTaGNHWlVXMzVhRTg5OTZVSnY2?=
 =?utf-8?B?T2dpVmVWQ3hKVFIyVTd0d2ExYUR4S3hTT3FIRW5GcXBiSTUvTUlNVmszV1hz?=
 =?utf-8?B?SXArN3lkdWhrZlN6UW1JcWlaSUhGTVFiWnF4emtGalVRVjQ3T2MrMEtUVWdR?=
 =?utf-8?B?MDFZZE96SnJ0Y25xdEU2cEcvd0NIeXZTTGZiWkE3MEIwc2RMWElVbC83TGgz?=
 =?utf-8?B?QlMyaXdMbTM4S2UwVTRiS2N0NXNWL1l5ODMyeE9RL25NTFFDb2pLTjdSMG5H?=
 =?utf-8?B?UGY0S3NmaW93ejRMazJXVGFxVlZOWDFKRXQ3a05BM2tiWnROOFhObnNuZkJD?=
 =?utf-8?B?cEFjSXF1Y2FFUXYzZWpoR09VMHcyVGd3WDdRWVdhV0Zpa3lCeXpvL05zejRM?=
 =?utf-8?B?YWh4czlmSHhVYkxIYlR0bWZ4Tk9aZkZMQkU2RkQ0K2w5ZDEzMFFyYUlpdUdE?=
 =?utf-8?B?S0QvaDBwN3Q2TDl0NHZKa2F1RWtuNXlLTHlhK1BuT1pySWcwenFJdGZlY1N6?=
 =?utf-8?B?TUsxYnN1MUZRVWJBRkNGZWdJTUJnTVQrbTN4RERoUjdVZC8yYUJlK2UrcVFT?=
 =?utf-8?B?Rjg5RmRkMncxVmdlRi9SZWhUdjVOMU4yd2ZVNzdDOVpzSE9XU2tFQWdyNlN4?=
 =?utf-8?B?eU9CNUNCZzRyeGZwVUxDaHdMYlZ0MEZOZW5aSlFEelYxY1M4MktidGdsdUR1?=
 =?utf-8?B?U1k3NENtRnh2TXhhYTJPbGZRK3MzeFR2SVZqei9SZHlNbXo5Ymt0NXluQWVk?=
 =?utf-8?B?UE8yYVJ5RnVXaE5xcDRubjJzMzljeUVHdUkxZlBNaHYrSEZCWHNVc3k4alZL?=
 =?utf-8?B?WnhxM3VHdlYyZjRWQVJpczFaMmdSa2dnYTM2SjFtYmtybURha3p5VDJudmRR?=
 =?utf-8?B?aFFiQlk1R3ZsSndYZ0pGcWt3TUd4V3R2bllJTkVNRHB3cjArWm9KUThtNlNH?=
 =?utf-8?B?ZWNLZTdMUmlBNTl3U0NBRENzTnBvVmxlM0lUdTdob2FEOU14c1IxMzBjTkxB?=
 =?utf-8?B?VXNEc2RqOEVJRTNEbmoyNnB3QlVjMnJCaGFab0ZjeGZnWHQzQ2Vvd0VYYWgz?=
 =?utf-8?B?RkYycEkwZVIrckNXL3J6Y0M1SGR1K2RpRmRKSGJXTzBMMkhVNGlIZUhJM2Ft?=
 =?utf-8?B?YkZYYmNHcmorRlhlbk0wNWs3Y3IwalFiZkEvRDdCYWFhRTk2U29CdVNSMS9w?=
 =?utf-8?B?SC9HM1VpOU5wQ3EyRXNzMm92T0VCRDBGREFaWkNFb0lRMU04RnY5Unc4V1JH?=
 =?utf-8?B?YUhDcXIyQTdMNzB0aEpkUExzbk5uQ0VEVWk1eDJNWXFYQmMrcENxVEZVYUZm?=
 =?utf-8?B?MHkvOGJmSTkzTHFkTCt0OVp1Qk5LYXZtWHZxbDl1NW9ocVJzb2gzVUlJRUN5?=
 =?utf-8?B?V3BtZ0N4RkcwNXJYc0swWmpTNXk1Q282aEY4MC8rZ3JsYnhQVnlqbzZBL2hJ?=
 =?utf-8?B?TEhwazljWkdqcUZvQVJ1UXJLVGI4enNPOFpDRllqTE5KeC9KUzF1UjQ3Y3ls?=
 =?utf-8?Q?Zoy831vxYY6aFtaTqjqQ0n3P4PO65N9Od3gp1+nJqY7N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd55210-8e5f-433f-1bc4-08dac97bc2f7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 15:44:22.0167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yu7Vk+KiyEcg7on93baDGgr+mm9CNv8jpnywSqiZUCwAzf/9UCioyV2r2jriKQIDhhozRsVTVY30akPyN2gE/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 14/11/2022 12:40, Wayne Chang wrote:
> The patch series enable the USB host and devie functions on Jetson AGX Orin
> and depend on the following change
> https://lore.kernel.org/all/20221003125141.123759-1-jonathanh@nvidia.com/

I have been talking to Wayne about this series and for now we want to 
see if we can get the USB host support merged. Then we will work on the 
USB device support next. I have sent out the USB host patches on Wayne's 
behalf.

Jon

-- 
nvpublic
