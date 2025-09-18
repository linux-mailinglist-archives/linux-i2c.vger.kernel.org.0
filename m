Return-Path: <linux-i2c+bounces-13052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EEB862C7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 19:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21917C19E8
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620393148CB;
	Thu, 18 Sep 2025 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IQY0ejaJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50B2641C3;
	Thu, 18 Sep 2025 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758215606; cv=fail; b=sKajNpyfcmIbg34SJirjGn2uOscU9mO/aaNKF5PgeJDd38qBco6ZnQO2hhAcatT43jbxEKBfWU9Dy1Sw+iCiYkQHV15+aY8qQNcoFGvqboq9PyNUlA5ZUY7fFpITAWRNg0Z1h+eJirUiM7Rzefe25XJdc5gJXk/YMQdYJ3yhDZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758215606; c=relaxed/simple;
	bh=h9vBagPojZHq+WFb+4e7+T77DklVTQUOtUgS+iU6XhU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4PZsP20biLZG3F2As0iOtpUtZnwRFipPEvC2HE4uK8RY15Xpevvemm06gBMXDBk67sz6bK5XjFjE6Lsx7b4DOK3iKHjQnI+83sNBCNTN0jvPOdJFnFb0AtxwAaMxEK6H71ExWvSNP5k8O0F8cX+z2QSGVH1gG7lA7gUTqzZowY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IQY0ejaJ; arc=fail smtp.client-ip=40.93.198.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQPI9IRRFrZDNHKfarx70JyePCTVvb/DEHhQiiZHRMOBGqBevknThsM1yWzWE9N+003BM74Pe+uYtjyueQqJyHgKcmbgUQK9TWYkrsgZmZbDIzgimHeed/JpGyOaUHNlrqPFR82kGSXhbkp9TGOeiO9V9SuIy4GosEyvlynXnjosPLT0DC86Re52n2nJ9h8ZGZh3RrJ5XtHD/43vglHIbtGXmuVqSPV8Bm0E7LjPoZT0HE45D+T9CPnKkw+XVRvxnSB9jnwE/VVn2mFNfIFXl12+zfQ6FpFbP23Jq9hKxDou5hcmf0yF2GOVJLvkw0dZpFEkTLzSfBSGA47JE2gThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afWwwqxOFLddMqZYGbY/RVr92Fuucn071rvF/oyte30=;
 b=YiTId0EVELLeK9GOVxIVVWkYqiIeoFAJzV37CSaO0+3vyjv3nsRz6/xVM42if00FTPGPlks4Dn05s74CjydQaX77dCOmQdYbcKEmMog5qC9IVSTaw4TtlZyFt/482ZQj1cYiOG+W4pl0v6DMy//jEx/tepcw9ZlkrgAygAXPA1/vXIVrvDR/8H3rNyP1mvJhNpM3d0S4/s/mrTu5OWwFGNK+tQofHCtvMHx8rp9UhnijFhbPs9/xO9g24UPsGeHY/VYmT6sQhmtOUSERPMUv/q+PJdT3ba7Wjw/wrEGqQr4LuGe4zILHf6dnz746sTOV4ExGKH+7LNTTCwJ4+8xbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afWwwqxOFLddMqZYGbY/RVr92Fuucn071rvF/oyte30=;
 b=IQY0ejaJEEh0sWPqEV/XgkJB1WaRuGOyvO6zvY0BEoWQJYXcN6CAvmy4+Eu/Mp7znvKwQ3HW0PeR4HejLQGrFvRNWcsNuCGUxeQiZepM7hmjECsXg3xfrlbuKa/DfCwq71fk/HaWPZ9C3nyeF2StPaG9bYeOuVa5mt1fgFjeNtwgds2coikdQsTvW2cir5rt41+snbcK3f535hFwl3DKrm37iwAJdh+ulx9bxZj5QjMRt5Tjc3QAXZQsJyEh9ZdITDcmmP0yO5odrPXhvgFJLz2TSi+3ILVFdfwR1g5y25SyzfiU2psW8Oyy4WAMZZ6qXxavKhIWCpFeRU1qyGOlKw==
Received: from BN0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:408:ea::35)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 17:13:11 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::1) by BN0PR04CA0090.outlook.office365.com
 (2603:10b6:408:ea::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 17:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 17:13:10 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 10:12:52 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 10:12:51 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 18 Sep 2025 10:12:47 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <jonathanh@nvidia.com>
CC: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <kkartik@nvidia.com>,
	<krzk+dt@kernel.org>, <ldewangan@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<robh@kernel.org>, <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 2/4] i2c: tegra: Add HS mode support
Date: Thu, 18 Sep 2025 22:42:46 +0530
Message-ID: <20250918171247.72087-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <e5c06b4e-3edc-4977-bbcc-2035cf11811e@nvidia.com>
References: <e5c06b4e-3edc-4977-bbcc-2035cf11811e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e52462f-0e94-4595-9527-08ddf6d6a52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hiWa7niDLWcwdqyBVJA3cNd2Z303/pzfkO+Bru+xkq58E0UyV5rgIhNT1qYq?=
 =?us-ascii?Q?LIuTX8ERHvOpxiblbZW7OhJ1KsiIDCo/KF2dpPNnFG9YQ+zyUfXHpJhBvXSF?=
 =?us-ascii?Q?xqZpxQfb9P8MZWr1v356Jyw7gir2SBCCMPXCas6aswmHSrpOkceEzqTs+zIV?=
 =?us-ascii?Q?b6MydFNrL93UFfPbm7wYnvxaWTi/Tx+T+9Gp/JFgu9lrc5QdKeiRIqTQJ1Lq?=
 =?us-ascii?Q?seaMZlXRIyybU+9rpvT/5JlJcJ88wy3OLY8rNfhLAWv9O0MT+/78jQjOfNJ4?=
 =?us-ascii?Q?UU98loywQ1OhhcmP0qtBituBIG3/1nxpfbjUqb0M5hsFgFhwVzCIOENMYUxY?=
 =?us-ascii?Q?JwFKBmlKkuA4pWjDlZgIuQwMe41xKnSaZTFaCKL1FgB9+Y9RG1Xzmhxcyi/l?=
 =?us-ascii?Q?8rpsrYhy975EMi7MO+yUwfFpTH7SFSIQSZQipAz3JWoWl0IBZ6HF+1dZs4Hs?=
 =?us-ascii?Q?3iopvkReqzQ2zXS54Q7e7fWW05nUaHfySyhnh6or5byz1cv+YD2MfcPZ8O8b?=
 =?us-ascii?Q?ozwxkUDB0GAfUzc+SNBETLw1UZKNLHaMdKDG9v950829b9dtPh79qDYEnr8x?=
 =?us-ascii?Q?nUVjNlsbrHXgYLXDi94hqKp6DwdnJAGOthlDxns4mxbNbddtw/5d/75ovymA?=
 =?us-ascii?Q?x77bq19DxEofF+GPsoAszQLGOnshoDxIdEUqNG6ET2ZHOUh2C81JcOo6/sg4?=
 =?us-ascii?Q?3gB07J4yP7Hcb8YbF74xaJE1UTZX5FY/MUA2eDq23g5LHioA8uygrzo0VHEQ?=
 =?us-ascii?Q?6spnxgMO+cMgCR7EoCvOojvxDQZPmlaAOs3TXTVHOp5W40v7a8UtPdlmiVE2?=
 =?us-ascii?Q?4aMeVgBvvqHnBmvfDd5cdxMUb+xol7nagWjTgeIaXasVz4OigeXnmFJr8Ju+?=
 =?us-ascii?Q?7OJFfT1SdOZW8i963KNzRIwweRbQhrnudTg+kHivN8u/LYtkeo4Sf2btAhXK?=
 =?us-ascii?Q?OZ78mpMgOSzjhbhkG9p44iS6UHUZcE3x0KXmag4A+ato2492Fk9dzEbQU5Cs?=
 =?us-ascii?Q?PAl975mkZH8ZxX90bYQMozmrTSCMV7DrU58448Jsls4IQ+9yBeCyK9L+aKGL?=
 =?us-ascii?Q?l3jVr0AGJKlGvEeKmg+fVTX/Z6YzSDWbvR8/yLkdJ0CGPYbnAebVJWwO3pkH?=
 =?us-ascii?Q?UXVUqvlGbppCRSN1hokXDlNo4zRAceQg3V5OZ9EapLF8Ns6iLkrFG+uFqO+7?=
 =?us-ascii?Q?rE+pwhEB+k4R+IiW8p/ldwZrwrb2WjxOpn1v9zbgAmfuQILQxby4l78JsNT6?=
 =?us-ascii?Q?nGoqUt8HKS71vDJgsvhgfS2jlAasE+BRmkPbTy1/wxgpCrHqFnYfGxI8ZnTO?=
 =?us-ascii?Q?asRQaI0+6fl6/jm0QJd2JYqrMwknawM1mF0FjDmpM+q7rmBR3bwmA1mx4rm/?=
 =?us-ascii?Q?SkHgoiz6M03lY/ytEObjYkb8Kuh7TElDMXl4I+c6n70Ztz45Ua9ZVxjxQtGy?=
 =?us-ascii?Q?dUcZir7Z5E0PIOAiA95VC9Al8Q3iU37GUgO4mF+dbIL955ABK1VF6XVre2nV?=
 =?us-ascii?Q?DHzr4aDNjK5QgibczJXW3XuF/wv34HLVaX8c?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 17:13:10.9340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e52462f-0e94-4595-9527-08ddf6d6a52d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066

On Thu, 18 Sep 2025 13:55:48 +0100 Jon Hunter wrote:  
> On 18/09/2025 12:16, Akhil R wrote:
>> On Thu, 18 Sep 2025 11:21:14 +0100, Jon Hunter wrote:
>>> On 18/09/2025 11:04, Akhil R wrote:
>>>> On Wed, 17 Sep 2025 14:59:54 +0100, Jon Hunter wrote:
>>>>> On 17/09/2025 09:56, Kartik Rajput wrote:
>> ...
>> ...
>> 
>>>>> No mention in the changelog about this part. Looks like this is a fallback.
>>>>>
>>>>> Should all of this be handled in the case statement for t->bus_freq_hz?
>>>>>
>>>>
>>>> HS mode timing parameters are programmed in registers different from the other
>>>> speed modes. These registers does not affect the timing in other speed modes.
>>>> HS mode registers being used or not is determined by the packet header.
>>>>
>>>> We may also want to program the regular timing registers, because it will be
>>>> used for the master code byte to transition to HS mode.
>>>>
>>>> So, I guess, even if we move this to the switch statement, we might end up
>>>> doing something similar outside it.
>>>
>>>
>>> The 'tlow', 'thigh' and 'tsu_thd' are configured under the case
>>> statement and so seems logical to also configure these for HS mode under
>>> this too. I see that there are different timing registers for HS mode,
>> 
>> We are just reusing the variables since the fields are similar. If required,
>> we can define separate variables with _hs suffix. Do you suggest it that way?
>> 
>>> but right now looks like we are programming both the normal ones and HS
>>> ones. Do both need to be programmed for HS mode?
>> 
>> Yes. As mentioned in my previous comment, the normal timing registers will
>> be used for the 'master code' byte sent to transition to HS mode. We need
>> to program both for HS mode.
> 
> OK, I see now. So we need to program the normal timings first and then 
> we are re-using the variables to then program the HS timings. And 
> because of that we cannot setup the HS timing values in the existing 
> case statement?
> 
>> So, I am not sure if moving this section to the switch block will add
>> any benefit. We might end up making it more complicated that it is now.
> 
> Yes that's true. It was really this else part that caught my eye ...
> 
>   } else if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
>    	t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
>   }
> 
> It feels like at least this part should be handled as part of the case 
> statement.

Yes. That makes sense. If you agree, we can remove the else part because
we weren't doing this before when HS mode support was not there. It is not 
directly related to the HS mode support as well. We can add this at a later
point in a separate patch if found required.

Regards,
Akhil

