Return-Path: <linux-i2c+bounces-6832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5026997B3F3
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 20:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C920F1F24898
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 18:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7762213A261;
	Tue, 17 Sep 2024 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uv0MzI2T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6DF4D8AD
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 18:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726596695; cv=fail; b=pZF+6U2Dz1ZyPIncYLBhBAmcFIGjZkf35g7SwsZzzQoyeFbkHcIdMTm5TMQESoW+MX72Q4nkecpBq4F66b2DYWpGq7WJYlvMY0ECGdFL+J+Hax9fk1rOFr7iX+50f8bC7c+ndjBGFPbmR8/u0raQWURqTOsig3GT2qB3/PEqA7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726596695; c=relaxed/simple;
	bh=YCnxJG270G4IZlwn7I52V/E2mJBw5cRchmsW78MGG+Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M9YoaOYAXo/AytN4npO24YqFsm4pE6ageFeCQQNizT2s46FJX2XzUkoQewu+eAX/NJ8uSO4sEE96Fe2EVSE/vVzD7QPr9yc1S69+6BGbltVTpZahhEI3d9gHDfIWKNZKW9nt4UXkEHyGuD0Qi2O74FUBty1ewQ7MjOqRuFfPgXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uv0MzI2T; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVU0kxYkoMcGoFcDSONh0Q+okPi22g8pVG7aoy0/Ibei1GJOmrbs82k7oKtd9iCXNjVk/qheytzxkO9CV/BrXINIMXbR7ba/sPXdBhILiAvRawbqF6jyoK2iyJU+YJjCrf8JsZa4iv9wQIelDkdCdsVgq6Wcp/OZnh4mQgGRhEBWj+EvKc9AOy6IOb+RS2ZVSOdkic21pMmnmQSOvh2i9RUKpA94the7zjoxe6qpjWrJkakr3CjsmRQMd4UVcc/AYzthaXSwK0vzC3XFRpkuIE6T79l4addSVcB1REQFC7Po4TE0oF/C8k/XVMzVXXlhrWigU1s0TS8R7YtE+9igsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlmAR2twh+H3yk5pO+bk1GbAWwNU40b7Z9MJguXYpzA=;
 b=EfTzUXvBzoICrljvx8fjYzOZk5HY8I2bZnzl8AZCMwIjn98oLO7qFoxu3tTXyGr884mjaCyKlmNjZh4hIZK3aTR2TYdpmSa622qca/1avljRZ92oKvcYZ7+HjAXjdVzw01uD45uJtCgx46nQv9hQufx8ZwA0t7Z3GpBLLLQBYyuVqzNLjWQiObGUGMFNI50Jljtwh2rKSM4ycM0kwcvOhf5uIEnRMpfcdUn/Pxm4qsYI93Fdyh9Zf8aukY9U/HUCZ9XF3frWBIfxmCg6JsdAKDIZb4gyGt0Otq3WgijiBXx0YV20RIxBc9mhPZyDdbb3xIHvD8JxB6gDpUhhd440Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlmAR2twh+H3yk5pO+bk1GbAWwNU40b7Z9MJguXYpzA=;
 b=uv0MzI2Tnuz8htmrr4W2Qw/21JClwk3ezmpGi8rThIfmLlY9kPZJExZrA0BfcwmrvQF/a4gqLzPDr9BYVPIcGitV2WftQ92q08ehkC0mNC/DbXL16KHfo4YuzO0awCFrsFoyTplZ/Mc/8pDug39zPvY8gcCVqL/n3TJjrw6BM6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 18:11:31 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 18:11:31 +0000
Message-ID: <750fa16c-3ff7-4467-8a6c-070974ba77ab@amd.com>
Date: Tue, 17 Sep 2024 23:41:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Introduce initial AMD ASF Controller driver
 support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, Patil.Reddy@amd.com
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <ZuSQd0sXKEvgfjw-@smile.fi.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ZuSQd0sXKEvgfjw-@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9ba5e9-b3f2-49d4-9995-08dcd74427dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUEwVjBqRmYyb3QzWHgwZ0VDVkNwM2FDWHdhMDYxRkd4Y0prRkpHSWlwVWts?=
 =?utf-8?B?RG8wakRwcTdnMHJmeWlEclZqdHB2RDVMOW9udjdXZUV5M1dNbVczL0J0dE5Z?=
 =?utf-8?B?NUE4VDUwZXhRUUgxR3hYbUJ5UVdxcWVxNTY0MTRBS3IxZXJDUDdOTXQ4Mytw?=
 =?utf-8?B?czcvcFR4bXRVQkdrTHdqNytsM1d3UEdTT3czQ2NQWGxHSUhCNDhjV2Q1dzlZ?=
 =?utf-8?B?OU1vMWIzcUNjbjgyUHRERENjcld1eGZ5NzdWU2QvRVZaVHM4bDMzOWZJNk9G?=
 =?utf-8?B?K3lvcWhWMVB5eG0xL0NHZ1gzR09YdDNPazZ1UU1sZzlCUGNWblFTc0ZienMx?=
 =?utf-8?B?WGM5ekh5UHVJanFrdHVocDg2djg2Q3lpMnF2OEo3MjZCUHAxTHp1ZFlDOE1G?=
 =?utf-8?B?NnBKSHlsYnhJQ1E4cGtHV3lQcHpRdHNOMTFIQTVKQTFPRWlxdklKa3VhcjQ4?=
 =?utf-8?B?UDdVSTY1YUc2anJmYk1Wc0FmQXV4WnczeWNiODlTU1hwWVhESmxwTnJGZVRB?=
 =?utf-8?B?QWNWOGJUYXpoOTY5c3ZvZUZzOXRyZy8vREE3WkNFY3l2ZHZXbEs0KzJzRUdl?=
 =?utf-8?B?YWtPbGRCY0FYTURrOUFDUHJIN1JaL0kzWUlSUVI3UGZ0S09uUG1KM1NiazJq?=
 =?utf-8?B?NkNGeVV6VTZVZ0F3TjRISVdQQ1o2T1h0SENBaVVvUndrZnRpRVlSUURxNlpL?=
 =?utf-8?B?ZGxHcGp2OHRTU3VzK0xaRlJ1bGY2Y09VNDZiWnpHcHFNWnd1dHVCeCtnUE4y?=
 =?utf-8?B?RDNIVHZlaTE1ZWUwK1ZUVitvVnVzWGpnemlJdVM3WlFKTmlld1lzUlNzYzFX?=
 =?utf-8?B?cFZnU1ZoWUJZVnZMMXBrVnNsU25ZUWNiWUU4MHM2MDJvSTg0TmhRY1ZRTGRo?=
 =?utf-8?B?aTdLb3krQytLUHBvd2RSNHNObWZWenpOVjhxVzVCeGxwbU1kQkEzRnByRnhz?=
 =?utf-8?B?dGk4aklGM2N0bnVyekFuaER1QWNDTWxVRUZ3ZWlFTEFqTkdrNFNzRDZLQnM1?=
 =?utf-8?B?UlFoai9oRzlkWTJYbCsvNnUrb3dhcURGNHl3Z2FKak9UcnIwOGwvN2haci8z?=
 =?utf-8?B?QTBTdDBJRVpqalFWSkJpRXk0TVc3MitrTkJZWktIQnRmeC95SDZoa0oxcEZ6?=
 =?utf-8?B?Q1dmUHBpdHhoZDBSbUkrWjI1aG9jSG9RazVhZFhuUEg4bmE3eXJmNXhRMWw4?=
 =?utf-8?B?aUFlYXM3K1NHTThKL1dWTm1UbUJ2aVExLytuMElUZFJlT3NZL3B3Wm9rR3dY?=
 =?utf-8?B?ZUR6b2c4Z21STHJ2MjlpOEMzajVRVUpLL0o2b043R2g0Sktmb0dOSUFCSVc4?=
 =?utf-8?B?T3ZYaGxtcU9hem9Hbk1DN0NhYmx1WEtmRzZPN2hsakxXQWlXdEVFUUt0amZB?=
 =?utf-8?B?bVVjQm9hMjRhYlFtRnZJVTcxM0FnRjJaUGVvNEJvdExWQTZhSWsyRXhQQm1Y?=
 =?utf-8?B?MXhJeWlFcmI2THBpNnQ0Z1l5SFNHVWx3ZUdteUFrNmpzaDcvUG9BUGFHQVJH?=
 =?utf-8?B?bTltdGdLYUdZWmhXQTNMVVN2d2VpNHo0VXpGSnE5QWpSOG5EV0xnaE9wVVpk?=
 =?utf-8?B?RnBaN2NydkZNdm8wY3VSRklHZ1FjS0ZUMUpSSDIwem1zNmZUT3dZVXNJZmRi?=
 =?utf-8?B?aW5YSG9SY2NvNVJQU25GVXBrTWhMLzBQV3JzdHRtZGRGMFBSYVJ4QXBDYjVn?=
 =?utf-8?B?ZW1qYkRwM2RHdzFTTkdEMGRTeHVtakIrRklPTHF5RnE1UXZvaUxHeTBYMjlY?=
 =?utf-8?B?aUEwVys5bG5wUmh2Z1BBS0ZHaTY1ZFVIQUszOXpqcUhka2tsOGtmYlVWTkJQ?=
 =?utf-8?B?NUpCaGEyeW5acDRxcFBtQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHZGWHBSdUV3S0ljZGJJVnhoZTVLaVpEcDhMMVJjcE9RWHhxd3BrWTZERE05?=
 =?utf-8?B?Y0NKRUFyNWtDczdaNDJ5M2FoTU0vWWVBSXl5bjdPK3p1RmRIOGsyZVBBZGwv?=
 =?utf-8?B?ak5UdFFiM3NJVzBodGZVU1luMVU5U1YwdXZHbC9QSlBnVzhwR1MrNzR0eTF1?=
 =?utf-8?B?Rk1nZDJFbDdiVXR5T080RUpjcDFxVzNXMTBaVmZLSVZwdnhxOENrT1VTVmcy?=
 =?utf-8?B?YjNldFBxT0xoQ1dTcUhvd0x1ejZMU2hNVGFZNTBFSSsrcHZpWlFjVTZJWTRL?=
 =?utf-8?B?V1U2dFdielZhQmt3a1NHdUxYdzJOaGMrWTdLdFBOSU9Ga0UyZy9qam1BdHBX?=
 =?utf-8?B?U2JNNm1OQkFpNXJodm1RT3B4TzhRRWp1bHI1a3pPWkFIaHhNR050dUs3aXVt?=
 =?utf-8?B?TU5QQUZBRG80dVcwU2ZtYm1RSU82ZHNQWmdrdDV0VjNZdXAyQkVaTmRPdVlN?=
 =?utf-8?B?TjduUXVlT09nS2dtS1lzc2lTdVpnL3hEU1NoRDVTaVpCWTc4MmliL2RhZzF2?=
 =?utf-8?B?dFRudUxLTWI2cFJyWkpabmVGVklLL3lUemVIQ3UyQUhGVGw3WEttRndzSjZv?=
 =?utf-8?B?NGlBSnFXZnJ0QWVURThNZmM4YlpWMlBwQjFBVFZTMWJvSHNiNmVNbkkrYkw0?=
 =?utf-8?B?Tm9CMTcxQTNnUll1eCtyVzd4elJnaXdNaDViUWlvdklsRC9qaWM4OHVJc2l2?=
 =?utf-8?B?M2oxZzZsK0RzQ2RweUtkV0JpdlViUEdUU1BFeGQrRDZ0MjFpWm9XRWNCTHlF?=
 =?utf-8?B?MGRDd3dOVkZFUVdBU0VxMUZqK3FvRCtrS1krNm00V1Z0bGpSNmdvaEVIblNr?=
 =?utf-8?B?ZUdVTEZkK1hmOEV0WWFUdTV1QUMwSzZpMEZUbFBRTFlvOGlWbk1WWU9neC9h?=
 =?utf-8?B?eGw3MUJpaHdpMEZTQ0JsZkN1MWJrbUJURStEcWdtb2h5aE9Sb2Z5bmgrMGRI?=
 =?utf-8?B?R1FTRTZITXhBMEFSR2hCS2Y3ZmFVVURzeklGaUtkZS93ZzU0RVJhYmR0OHZO?=
 =?utf-8?B?Y2hDRUJlTExEZXZ1RFFCeG83SW1MZ2phSEJaK3ZGNTUzbTNmZU1SbGlISWo3?=
 =?utf-8?B?UDdSOGtxb09ZNTFpOFJsZzBmaXRwbnI1cExOU3U4aXZvSEN2WXBLZ2M4c3lj?=
 =?utf-8?B?SjRkZ01iTHU3eFpnNGtvaEI3RDQ0VDRPbEc1cjh1N1kyaTJuSTJWNVpJWmpE?=
 =?utf-8?B?NXJsdHJoN25vQy9zczRhdi9BRW5sUHNoNUUxWXB2UThGZmE4RU9HMnpzUjBu?=
 =?utf-8?B?eFdENFIzR0FveW1HaDV4YXE1dEh5djFtMTBnOWFZWGV1L01vWXVBZHlBQng5?=
 =?utf-8?B?SGl6QTkwcysvdzNrelNEc3ZESlZFUU1QSnFkbjAvNVdLTm5UNkNRRWpjOXpv?=
 =?utf-8?B?UDFVQVhTdXlTQ1dIRk5Ycm1aSzV2R1VvQ2NWNXFaeWRuNUZrd3VDOUtjbWRW?=
 =?utf-8?B?dDNKd3hFdkFqMjc3TDJjMkdrb1JDSEtpYUZHNXl1ckowa0xPTFZaNUxmRFdz?=
 =?utf-8?B?NllUWnArNUdpVDNkT3RrRFlTdWdjM00wT1pIOENucm5Kc0lqKzl1Q0xNT0ht?=
 =?utf-8?B?YVRRalhxU1RsTVFRcE1SM2VBT0hQRitnNk1MSGF3Nzh6QmsyWC9Ga21kMzA4?=
 =?utf-8?B?dWI0R0FseTNvdlo2YWQrRlVMZzd3YTlmQjhya2lJY1JKV2JkUElRSjlTVFJT?=
 =?utf-8?B?dmxvM3lzQlViOThLK3RHK3d3T3dSeHhPMXRlQ1doaE1VVFAxODFEVFlVUTFY?=
 =?utf-8?B?SHUrOUpqRnUxWEZCQjhabEVUZW5jT1ZTcE54a2FKQ0lKYUFGcXhWeHNEZjYy?=
 =?utf-8?B?UUlXeHFvd0lvcWtKWkVpdnlyeEZmZ2Vmckhya1VHa3BWL0hRMnlpdWVHTkZE?=
 =?utf-8?B?MkI3S0VyQ3BBTHNDWmNvNXA0ekxLMkxnWmlPbVBwR3VlSVg0ckNjQy9UWmVu?=
 =?utf-8?B?Z1YzdVpBWkludVl0dFQ4THBGTHlCNG5sMXhVK1k0U3NyVWtkajZmZDZFU2NK?=
 =?utf-8?B?Nmp5QmhBZHY2TDhMeFRRaVNCT3cya2paM2RYMlpBTTZQQVR5L2c5Mm00VlRy?=
 =?utf-8?B?TG56bkd5ZkdFbnloVjQraXR2Vm4wMitxeVlQRDQwZWQxelRNYnVYeDVaMTE1?=
 =?utf-8?Q?gjnQiNeD7jibuwuNyRN/25wv3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9ba5e9-b3f2-49d4-9995-08dcd74427dd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:11:31.0720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWfySRmjFAqjunCZt9DU9u204aUn7j3Fs3zM+mZ7Hogn6qIoLHCqmoY3i2ZdIfY/PuCkoAjZIS/j8Y0ctmklBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979



On 9/14/2024 00:50, Andy Shevchenko wrote:
> On Fri, Sep 13, 2024 at 05:41:02PM +0530, Shyam Sundar S K wrote:
>> The AMD ASF (Alert Standard Format) function block is essentially an SMBus
>> controller with built-in ASF functionality. It features two pins SCL1 and
>> SDA1 that facilitate communication with other SMBus devices. This dual
>> capability allows the ASF controller to issue generic SMBus packets and
>> communicate with the DASH controller using MCTP over ASF. Additionally,
>> the ASF controller supports remote commands defined by the ASF
>> specification, such as shutdown, reset, power-up, and power-down, without
>> requiring any software interaction.
>>
>> The concept is to enable a remote system to communicate with the target
>> system over the network. The local network controller, such as an Ethernet
>> MAC, receives remote packets and relays the commands to the FCH
>> (Fusion Controller Hub) through the ASF. Examples of these commands
>> include shutdown and reset. Since ASF uses the SMBus protocol, this
>> controller can be configured as a secondary SMBus controller.
>>
>> This series of updates focuses on extending the i2c-piix4 driver to
>> support the ASF driver by exporting several functions from the i2c-piix4
>> driver, allowing the AMD ASF driver to leverage existing functionalities.
>> Additionally, this change incorporates core ASF functionality, including
>> ACPI integration and the implementation of i2c_algorithm callbacks for ASF
>> operations.
> 
> ACPI code is much better now, but can be even better.
> See my individual comments.
> 

Thank you for the feedback and apologies for the delay. I have few
questions that needs a bit of clarity. Please see the individual patches.

Thanks,
Shyam

