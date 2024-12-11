Return-Path: <linux-i2c+bounces-8451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76B9ECB6D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 12:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D353C2813F7
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 11:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916DB238E2E;
	Wed, 11 Dec 2024 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PwjMNyFP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A1D238E27;
	Wed, 11 Dec 2024 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917007; cv=fail; b=WnzZ6mJFqXgmWetL7OqGOTjVHdpdB4hEWBCM04e8qUCickIOveLvTUaaFfYYK1jmAq7tud51qn2fvXmfkKOMJPfjtZYhwYYvTuSK1mvBLTpbKydtV9mk4lcyuw/7/Q2Wp0vhp8FbAqU2xWlohAs4CQhY+eN5aLkfccydXYTqAyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917007; c=relaxed/simple;
	bh=4M9dHsBKXt1ArgUTeogl25UHVI70EJCRJnjngQGnTfI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dC2jla9eXlrRe5+IfBHT4Hd2V8mpBQ6py4DZCjWnGMiyBdIkYbQeFaFesRYa6ysMYFauAkUoU/qz97OVVUtS+zD2Up0U8xclBQIYhMa4bB451yo0I6CRTfGyJiuQWkLXHvwxC+zEaVjpzqn7Ac8PZablX03vKVRMfGaXB671Qeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PwjMNyFP; arc=fail smtp.client-ip=40.107.92.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsJSRizk1c1UsMnvJCcl+9IOno8oSKZPtyaFS+CRAWOIwNfnS9d1f1qxm4t8eATDg+oBiXFBEFqTMi9zavEp1BJp2mMHj4JEyMS+cvrQcuxThpx6iAg4BF7WOIhilPkB6NjjtUjRFCqmf16yqbkOy05nZ1QUVoYOdFMJuTO85C1fGsPGxHlZnElZukDhsnCylU5fWZwWGj1LeIVAkplmAqsz3gduR2jdFkTp3JKeoHyTQiJuYIMrYF5wuUS9UWbcjHl3LN00H4RkFv+u///uuSFmlxqrsbBQ82fc36jOYuPRP/sUMUIVIQLGRFWpPlH5Je+nrw6ctVOWZt4V8oVYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4kepETMGFwvsipslLeU+Nbo0CKXGVTgbH78uye19Jg=;
 b=WHwWBwqwHSCxx05BSazhtmt5pXbop0vwmerZcS4t4Ov9s41eUpdIm5KuMh6BVIMioBz6/McuGCOoaz4Ml6irop0804S6+N/LXFzpPZHGCiLpxlgnsXAU3qrUSuVkgzMFTyBgHnSmQj38r6+bntMu4UDcBkaGy8Z+LAfykGTAkA07U68BxQ+zn6JiDMq8+Q6vzLZYU/bon414hTE7aPKnDmsauFXok+67iyMQcA/fP+DaGnad7mdryxvL+RbOL1wdgZ0E0xTMG6xWTJ/DF1GpgRr7wUrsIPBPUygnMtjGUav0YENawdMewPak/Crz0XJibXl3wJvGNrYiY/Vv8NOUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4kepETMGFwvsipslLeU+Nbo0CKXGVTgbH78uye19Jg=;
 b=PwjMNyFPfkpPEfP6Fi88LXeiqzrixx24nDUrtShse68maCIfc4uZEHgSbDj9vrZTZ16vG1NNqv8u8nUJIzDWipDOBPN5A5xVaWsHJ0K+Ke7lrq/3AgtuPFDWj/BS1o/SvIGBj4dnsjZmf3mLQsMMkznYEhiy61POuTqi93TwS30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SA1PR12MB6969.namprd12.prod.outlook.com (2603:10b6:806:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 11:36:41 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 11:36:41 +0000
Message-ID: <ae05a342-1b9b-47b6-92fe-502505abb111@amd.com>
Date: Wed, 11 Dec 2024 12:36:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] Add atomic transfer support to i2c-xiic
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
 andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kees Bakker <kees@ijzerbout.nl>
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manikantaguntupalli09@gmail.com
References: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20241210095242.1982770-1-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SA1PR12MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c969cd-b7b5-48a9-5062-08dd19d814ed
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c05HZkY0TkgxZngyMm5VSDFGK3NwbkpNTTlwYVZCd3dKZ01KaUN2MWZ1cWIr?=
 =?utf-8?B?eGxzdFk3aXRldEdDTHFoQ3p5bStkM3FnUW5tT2h5eWFWT1lySHBHNm43OTg4?=
 =?utf-8?B?b2l0S1Zpd3dWREg1MXBvL0haVzkvN09Bbnh1SVBLTCt0RmpUa2Q2MFp4WHRL?=
 =?utf-8?B?VmdGd25QREs2WEVmcjVmOGNncTMzMFdpWVRnWjFKZkF5RWxBa0V0eW5Tb0ds?=
 =?utf-8?B?ZTYzNmxuU3BmcERnbmd0TUtQRUw1RTgxL01oQzZBZUQ3Z1FzSlVBYzVidW82?=
 =?utf-8?B?VXdpZkNvSUFiNEVpclovbTlVRzN6cTBualpDU3hLbDc4bTFHL0Z3K3VITFJH?=
 =?utf-8?B?dm50SGVUN2FJUElNWUdzV3ZwZU1SNW5LNkRBNVlhMmVmQkdFeS81bmoyRElm?=
 =?utf-8?B?Z3VMTHNMQm1JRWpkTVBIelpLM0RHQkI5MktGWmNodG02dyt0azVNQWRyN0FM?=
 =?utf-8?B?MUFBWWVkdm9XWXpEYWYvejFReTc0VlZvSm5WenFsR05ndVRPRlVNbklQbnBl?=
 =?utf-8?B?aUlDcTJSRUVNMU9XMkxCM2JMVHdHQTBsKzc5OUhwTDM2MkE4Q1VKWFFUamNu?=
 =?utf-8?B?dXFacEYyTzRHbjVZM1lubXpIdUdkNzZmYmdISkJuSGczSStXaVNRTXRzRysz?=
 =?utf-8?B?UFFsckhpYTMwd2RtWlFNaUJ4Z1EzVklobVdPOVFpUU00Mk1qRnorQ0Z1cHda?=
 =?utf-8?B?SkMzaDdHUUExeXJML0grMVBxMGtLTnV3OXh1MUtlTGFpcTZ4QnMwaVpHNC9R?=
 =?utf-8?B?U0JNWEd3YnNQd1hDYTNFRzNOSjZTT0tTbit1d1RTcVBUQmk4MWR0QmhqMFZX?=
 =?utf-8?B?dktNZzRVbTdaVDQ4VGpzS3J6L1o0eGhjcnlML3BuTVRQQjlQVW4yMWhDN0th?=
 =?utf-8?B?cGhKdyszaWcvUEVaV0lONFFKNWpoKzF6R1NVUkwrMFA0QnpxV1A1cGJiSGdN?=
 =?utf-8?B?SThDV084YmlwanhJRTBIUEdDQVlmQzJlSExQM3gzakFPN29Zek5ydUk1TStR?=
 =?utf-8?B?Z2x0dTQ0ZytrVklwMlhXRWJTdW9tUFU4L0x0UHE0OXhlWDlBZU81YSsyOXBw?=
 =?utf-8?B?cVNoYUViYk4xTG53WHFEZkc1S2FZdGwyV25xV0hjSWVPRHJPcWNxLzdOZ2lF?=
 =?utf-8?B?cTN5ejIyc2poeEl0L2tBK3laV3E4M0dNMmM1WmFsOWdPb1kyYlBmR1cwekRR?=
 =?utf-8?B?UlMzVjNLMGNLNkI3S2dXdjBWcFRTWkxDcis4SG5adm9CVllYazNFRnBEY3hB?=
 =?utf-8?B?Rnp3dHRGbmZtcFhPSm5SYnlWa3VJdWoxeXFIYVRRVnBncHJXWHZxaHdFV3Zi?=
 =?utf-8?B?Vks0NXF3RWxIbC9hUEFKS0l1N0orYmlCOWxxcHI0aDZCOGZZa2xWelR0bGVl?=
 =?utf-8?B?STQvQ3d2L1lMNW0wMUVxT0NOY0hQZVFEbm0rMjBxMFJZNmtaeVlmcUt5aHRp?=
 =?utf-8?B?S0NxN2kvQ21PLzNJNGNucURwbDc3WmJ3T2lrM1VNbDY3MzlBRzRMYXZxSDIy?=
 =?utf-8?B?TVNOT0dFa3loN0VqOHZhazdKMlJQcUV6NHliUmZadWJYNkZ4RytIKy9zOTVr?=
 =?utf-8?B?ODYvbHVIRmZKcWtUNXcyVW9WTmZ2OUF3T2FvSzIrT3VzbmxSdXZYbVJSOEtY?=
 =?utf-8?B?TFpldEtINWtJTzFVeVhrd2RJaTc2Tkl6RHNrZDdLS1hWaVpJVEV6cHpYK3Zl?=
 =?utf-8?B?VzhWL2gwN25ER2l3ZTNaa0U2V0ZzZDVPbW1KaFRJZU1PNG03dlhuSzJWK1pp?=
 =?utf-8?B?UXV4WVdCeDB4WkRWWFkyQS92ckF2eWpCeXQ0dVFZc1lpdlA3WEtUVFc4T09t?=
 =?utf-8?B?N0IrdkNYQzJHL1NjMXR6Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHJOYW82TVR0V056ZDZuYnhzTHN4Nk85R3VNeTNndHJ1Mmc4ZWtqNWVDY2NE?=
 =?utf-8?B?V0FUK0cxRElFWmsrYUJ3dE5WOUFhR0d0L1h6S2Zra05sN0ZPL0c2b3FNekll?=
 =?utf-8?B?U3BiM20rMVowYnRjbE05dy96R0JPVFVqalNpb1NRendsRXdjUGhtU3dhcVhT?=
 =?utf-8?B?VzZrY3hRdStaZlV2V2NnRHdoa00vQ0IycTZGYWlSZTE0OFRUSUFUTnRjeTU0?=
 =?utf-8?B?eTB0MHRlUDRBTnIvUGdib2ovQllKb1BWL09MNzl1UnV6RUZpYzVRWWZpSGR0?=
 =?utf-8?B?OGwrZGRxRzViYkRJUDhlanh0UWVjS3lJbGFmWk9tYTJpZitCUmROdmVMTlh6?=
 =?utf-8?B?TFVsL2dZb2Y3REtPdTVValo1My9oQXFuUnBJb3YvZVNHT1NkTWl3NnJ3Wno5?=
 =?utf-8?B?Mk0rRTRsMTdlb0krSUNLZTRPUURNTC9qS2pId1hZd29oRWtvdmNZNFZwYVUw?=
 =?utf-8?B?bjFkZFpxMGxITHBOUEtVSVNlT3MxaEc1NmIwMjhhU2FpSWZ3c2c2WE0zbWpD?=
 =?utf-8?B?NEpFT0ZWOTRlRk94THZQdERnNFdsQVQ4SXNjZzAycWRJUVRPdWZMTEdQcVBq?=
 =?utf-8?B?YW1ZckdtTEJlU0lQd21Ic2pwWFZhY2FYK3dWMzluODFLZDVwUjFKRDRTcFFV?=
 =?utf-8?B?TENmRVFGdDhGT01KUm9Ld2ZJdUxlb1FiTlI5Q0FtWnJhelQ2UXdieE41VVFO?=
 =?utf-8?B?U3ltNWV5N2diTDJsN2lOQUVrRmxwWFdHTzluMC91L3R4Q3hTaTh3OFpPMG9u?=
 =?utf-8?B?RmVtZnMvT2FFUjA0aGt4elpQNGxmZFFsU1JWdFQvREVmLy9nMUg2eFVSREF2?=
 =?utf-8?B?NUFzeGYyUGNSSWkwUlE2aUt3RFFtTlN1dk1KeEhVZUJjRFptaXo3UXFlNmMz?=
 =?utf-8?B?YjEzT0h3U0E1dENmejgra2s4cnV0Rk9Ieksxajh0SGhDcmE5dVpLdTRyN2VO?=
 =?utf-8?B?MlhlR1Rya3lLZVpKSjltcXVscFBnTFFIRmJUUkM4MU9xMkwrU2trRkc2Y2xC?=
 =?utf-8?B?K0lOVVc3NVFPSGw0ZDlXYkJNeWhZc2tvNEFJZ2YyV1FYT0VXNGNTTTJKayt0?=
 =?utf-8?B?elAzS3ZWWnIydzZyMm4xOHZZM21PcTQ0ZmE4RWZxeGNrTURmVXBpTDlNMXgy?=
 =?utf-8?B?a0tFY0hScEI1anNvazJ1bSs0bEFaMk54UDB5amRvVS9WQUhVRC94alViaExI?=
 =?utf-8?B?NXRtVmUwM0xVSHBzWlh5WnpKWi9GWFNkU04zTHBsVmx4TURNOXN5Nzl1R3Vh?=
 =?utf-8?B?ZGZNSm91UHpPVlZWS2tvWXFySU1Hdmx5dU1yUndQMlNjUFJmN0lBQ3ArMjhk?=
 =?utf-8?B?UUo1UGJndERWRUkrZU95eXdMdEZJakRJYlhsRDNZL1RRMFA1UXdVcWlqcVJp?=
 =?utf-8?B?Z2NNUUl1azI4empmbUNXOUJVY0lMbzBrS0tFWHkzanNsT1krdHpjbGFMemVL?=
 =?utf-8?B?SEhzQW8vaHY3TUlxcEZTK3pzRzBaalNPQTlvQXA2MlkvT2NIUVBYdlpxbEdn?=
 =?utf-8?B?endWNnJHSzJqWDdaM2xzRTJTMkVDb08zanR1bjY2ZHIwUXdMWXZyRmdibk8z?=
 =?utf-8?B?SkpaeE05SjEyblFSaGVRSmlicE5ZQWlGekRtblFxK2FxNStCbVNjMFF2ZDFH?=
 =?utf-8?B?MjhtR21FQ28rNWZVR0tVK2tCU3dZOEdKVktCVU85a2M3ckIzRk1IN2xWL1o5?=
 =?utf-8?B?VmxQMGxXNkkrd3FacGV6Q1pFVUdtY0tlUnV4RXh3aE9sakdzVk9VNStqODdU?=
 =?utf-8?B?NUwyZzl2T05nQ2VuOXlaMysvMU1pU2k4azJtUmtKdEY0SC96N1kxSmh2dnUr?=
 =?utf-8?B?OXdQMHRPMHVCSmt5eVZURWFpYm9HcDZwNzFQZEpZWHJocnlEeU82ZEJCR1By?=
 =?utf-8?B?RjdWQ0hJWVBmNkRBa0xNK0pZSVo1QklTRDMzaEtYUXFleCtEQVJqTnA4aGtz?=
 =?utf-8?B?SHVBc0xDZ2F2LzFGdHZGNGhnbTVWMEV4SDhQY1ZleEpsbmNFWDVTdDcrTWZX?=
 =?utf-8?B?ZGpOR3ZKbFJYczJPanNES1FwaGFjR1lNVFRCeXhIdExuZVVKZ1JKQWQyZi9E?=
 =?utf-8?B?RnE0dDJheGt2eUZBUWM0YXQ4eGhldFdmSmpwRGlQNUhUWnhVS3RaaGxXSG9s?=
 =?utf-8?Q?qBE9Z3hRD/4bE/ioD8wbarLDS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c969cd-b7b5-48a9-5062-08dd19d814ed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 11:36:41.3702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VrEVC52vNfSZ0mR9qbmBAQ+cs4b577ZzD5PcWwhdqpyZh5HApHSby2jrjOhAngr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6969

+Kees

On 12/10/24 10:52, Manikanta Guntupalli wrote:
> This patch series adds atomic transfer support to the i2c-xiic
> controller.
> ---
> Changes for V2:
> Remove NULL checks for tx_msg and rx_msg, as __xiic_start_xfer() already
> has checks.
> 
> Manikanta Guntupalli (2):
>    i2c: xiic: Relocate xiic_i2c_runtime_suspend and
>      xiic_i2c_runtime_resume to facilitate atomic mode
>    i2c: xiic: Add atomic transfer support
> 
>   drivers/i2c/busses/i2c-xiic.c | 281 +++++++++++++++++++++++++++-------
>   1 file changed, 227 insertions(+), 54 deletions(-)
> 

Kees should be in CC on this because he was reviewing v1 version of this.

 From my perspective this is fine.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

