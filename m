Return-Path: <linux-i2c+bounces-4110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D290E4CF
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 09:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE73228137B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 07:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A720127733;
	Wed, 19 Jun 2024 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Kytfgaor"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2120.outbound.protection.outlook.com [40.107.7.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D04F2139DD;
	Wed, 19 Jun 2024 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718783156; cv=fail; b=JZQsYDdCP+YvUYmJwTN68533S/7OmZuJ3QfCaV0jRJgwDTOuzRt4Ccu7XxJXYOzPZMIMG3LeecgAaLWn0yxT7qNe6DKuvmdS91uYwh4NqFx+xSbtaWaoG3OPNMgzhw9Vkf6m+Gu6SeRVexvR5pu40qAMAPDoeUbRozXwWH/YDSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718783156; c=relaxed/simple;
	bh=qDOpBqwQ/sbegpwhQNDP+LOU+k/grHlLmXE8T5lmsQ0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hyf7VR1uUQZHEFrO1vPEj8dUbZo0agiGw0Z1gjckKZVPKvSvAcrpqZGNmqW8js14lTKDx/OkLgRNH9dU3LA1uc71yTMbOaF+Axtc4tsreWnqF6sDvrWdfQ4q2KVGPvpYVVqpTuAbz/9hOOf3hLtJReNutwU34muyrljbSYKNoqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Kytfgaor; arc=fail smtp.client-ip=40.107.7.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmroO0rpqC/+D9A/P30CTf9KhjjllYN7zJ5f0Bo1s/88PB5lHI9LGE/pCRmvWRqb8g+s/Fjf1ZvVb85EDLzWT1L/mW3X6ursAtsxzWw54YXZ/UyFxN5wlgKWNmUGHNdWMyO7m6IXXuK+LUnOuTfGIQY6VlCelEkufH0Sm3+xUguD6VKbtCfBgS73HA4UPWGMn1FhiKkT8J6Ep7K/PhdnFuBcdz4z2MCplGNX04FD8vBukPJWIRZ23mPTvs+Ho3k3cSBa1Ql2VG+12FTXXzvgeeHe367nc4JpMF/mMAXOksllaBQ1ifsnJ7APqSZ9yTvIx37qNUR14nCqqZd+LF5sAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGe85ViECbRmnepNhmjowAJLyKInoz7lcSR2N944/AE=;
 b=cFZKukAYIWkA+q9uiUcvROdd46qmNBTdOPO65N46/43G0Yq4TDiupirdSvn+fz8iAItv6F98AHAkQKJQGv01aiLt3DB7cdtw5zaVUfBTdt2xz9SDozrL7cqOuv/PlFpBeW/XHAF1YgJ0JTGHf8kSHdBroar0U4iANVEJz3WtI6RRI4VnEbuR4PGEoKUQt8K5rmZMZ1v8S6p9yYrHlS9A4d1N8ijnBWUzT6If+5r1Iudfi36tv1ZXB2iJ7ch3QVLpX5PvL8HZX+2+4ENtkrbu7jas2Ogs1fHi/4MPLcRzJtoKoIoPE7aczCuED+NTiq4ALZdEDjApFaX7rAkiFLwfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGe85ViECbRmnepNhmjowAJLyKInoz7lcSR2N944/AE=;
 b=Kytfgaoro47mXXyVhOw5ESyOw08wMoxUhmbuGjzGjFhMoZGcDHwHWOYRqidfPrAotE0CGITYO4siDGp5UeD4qwqiTiF6Hc/Ez3UQm3/cjFlAK7AAKM+3CPOjstaNBMLlOO68PBhF2whPIdZVNrj21j4aDnekroclKqQJN2gI+xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by PAXPR04MB8376.eurprd04.prod.outlook.com (2603:10a6:102:1bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 07:45:47 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 07:45:47 +0000
Message-ID: <19ee521d-298d-4718-bdc6-f282666de371@cherry.de>
Date: Wed, 19 Jun 2024 09:45:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Guenter Roeck <linux@roeck-us.net>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
 <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
 <c2803eed-b4f4-44cf-a7f7-9557d05e798e@roeck-us.net>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <c2803eed-b4f4-44cf-a7f7-9557d05e798e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|PAXPR04MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 488620a1-4cdf-4669-8139-08dc9033d4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|7416011|1800799021|376011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2R0OWNuQktrTUJaV0o4ZjU3WVFVNG5OaWErdW9QRE9HanB4Wm5mTVBwY1FU?=
 =?utf-8?B?UGdhdXVramhPRVo3SkhLZEFDemI2M1phYkFEd2FISE9IR2g3V1dDeStCQVJS?=
 =?utf-8?B?VGlPUDRHV1NBVUNEdmhCNGtKemVSelYvNng3VEREQWpWaTJLUmloMWUyOW1O?=
 =?utf-8?B?MmU4ZUxBMFRLRGpQL2ZWam5leXFidjZXaWtyVDlEaGZ5TjE4c2VjR0F6OU5L?=
 =?utf-8?B?cXJGMVYwc1N2VGtqQll4Q2kycTZjWXhGRXdmOXBmYmNIUDJLSzdMOFhadk92?=
 =?utf-8?B?anNZM2EwZ2tWS1pYZSt2K2ZpQlgxbDBOVDZUVmZROGhRWG1wTDVPWnVwREhE?=
 =?utf-8?B?WnZOc1pjY1l2dWFZT05ycjVnbm04bG1CTHdMNmw0L25Bcm4zREZVN1hKTWo4?=
 =?utf-8?B?WFg5V3VpcURGUjFPWkF6eEpFTzVMRWovTE83WGs3ZmVsbW5zbzJUaDY3UEJO?=
 =?utf-8?B?cDFKdVhYd0ViZVV3eVRkQUhMYlhFNHprYUdzVGE4MUFKbXR6R010ZzlmRVM2?=
 =?utf-8?B?WEREMU1MbDI2Vk14TWNOT1NSZThhc1dvMVdNeEhPNnc3VFRUaU96c21tUFZD?=
 =?utf-8?B?aWV0Ni9FajA4elFFeFFDWGhXZnJoU0dnNVJlR1VoVTlWNmcxM3pBb0ViZW9s?=
 =?utf-8?B?eTFzMjFKMUcrNmRrSitrR2FtMnNqcWw2cURVbC96RDdzODBvVDRWdEtPM3Fj?=
 =?utf-8?B?NlA2U3BubU5yQ1ppNEFwenZTczI0WUZvRTRYUVRHK2dncTRCb0NqeWRYU2xz?=
 =?utf-8?B?ckVCQjNJbUJmcGYzOXZMMHc4ZXhPQnJnOGtCSUR6RzhSaXZiZlBISkxWVHZN?=
 =?utf-8?B?bjlsaVo2aEplRjVSSHFnN0tFblRoV1RlYWVtNVBIODZ3TGhLTUNZZWVodGZn?=
 =?utf-8?B?SXpqT0ExZGdVc0t1bWRlQzJuTGgrNDd4dEpoT1NnRDFCV0Q4ZGcvUjJhOTM1?=
 =?utf-8?B?K1FGeUZ0TWE0dWUrcmhER0RIdmVBY0xPTmRMMG5sNUp6dDIvYnhJdFFyekNr?=
 =?utf-8?B?eEZuZVJ3aHFnUnNtb1ZKWEVjN2VGYlVySlBYNC80M1NjTzBRSXpiQW1YeG53?=
 =?utf-8?B?enJEd1llanVsbisyWXF3cTc3Q0wrUUFCeXlObkhQc293ZElzZ2x0MWduUCs5?=
 =?utf-8?B?bVN2MFhBWXRMTWl4R2dCdUY5V3pjUllISkdnSk51Vk45Rlc5YzRoNDFoalVQ?=
 =?utf-8?B?ak5ZTEZIV3pCVzNwWkxzalJaOVVWR09uNUYxa1hxRG9wWm5VYkk0Q2hrRTkr?=
 =?utf-8?B?Rm05SWpEbFdhNEg3TTJMVGR1bUdBTmY1MlFFMm5nZjFLOEVPYjJIZmlSUks3?=
 =?utf-8?B?V1dZcjIwMkhSdVk1VytNV3hkekJGcjVJQW1xakFPMEhYTWpTNTltUTY5c0pG?=
 =?utf-8?B?c3BqOFV1QUJCdUROQXpqdnByaHR2RGZtY3BoWDVSLzIwZ25QZVRyMm91dWg2?=
 =?utf-8?B?VU9TNkFjeCszODNISk1UVlIvcmpxQnZVc3UvOXMzRWd1TmhyejhBVHRTd3Ez?=
 =?utf-8?B?dnZOSFhPYUdoQnZ5d01rMkl1enZqWThjbmRyMi9iU0paclU1Qk9aTG84V1Uw?=
 =?utf-8?B?d1JDenFHTmlJMU9JaDRIUVZ5dGZZcWdrVWVUUFdMSUNaUmpobjludUVVVFg3?=
 =?utf-8?B?NGlmMEdRcW1lc0RxOGRabkxiWnJyVjFMVFA3TnlJZENmcmFmelpxeUFZdm1v?=
 =?utf-8?B?eXA1RndtWmNqdGtDNE51QUY3QWdHWll1aU91Q1UwN0o1WGhheTRUeUFwcFE2?=
 =?utf-8?B?VnZ1cEp2VWNjcVJRKzRYc2dZZFNMVnB5cE8vV3JoQ1FLVWMxNlVaWTRkMmVi?=
 =?utf-8?Q?RAAOT/1ODlhG8Z/xAsoeVJAGjA19/k6fpUifM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(1800799021)(376011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjR2K0lGNmRlZy9qOHovcXdVZi92NjhUR2k4dHdGT2RNV0lweEt0Y2hQR3VK?=
 =?utf-8?B?M2VJSExDVUpYdW5TZG0vbWJtMklJWWcxb1V0R2tXek9OV3FnME5DdVU4VGJF?=
 =?utf-8?B?ZTFoYkpoaUtkbHZTV25oNy9aU0ZPRDVaQnhMc1d4Y2xCcUIybXhvRE5DWlMy?=
 =?utf-8?B?anB1TlJETzFBVmphbmlDQzJDVE8vSERobEx0ckw2K2VsV2JkUHpDbHJMZUNv?=
 =?utf-8?B?d3cvTTAvWGRBbndwSVBIUHAyWVQyVXNiSmpjUzFLSVFTcjYyVDI5c0hkcmJ1?=
 =?utf-8?B?ZFYrc1VqQkpLajhoQ21oNnRmRG1pSjN6alo4TS9abnRDNzFjQTRrVjgzbENw?=
 =?utf-8?B?Nnl1VWFpSnFVaU16LytLNTZ4U2d1ZWFBblJjeVF1UXRSQytQdDJ3cGtMcytI?=
 =?utf-8?B?WTdDZlNZdDRWRlRiN0VTdzBsT3hFVnlCOC8vTnNPaXFtV2Q0SEpLYmphVFo3?=
 =?utf-8?B?akF5bzhETzZ1ZnAvRkJvRHBUblJmdDUxalBHM21DMmZFc2QzcnUyV1AvaUxN?=
 =?utf-8?B?dmdJcDhpaHRPQWxLYVR0QVZ4SUFLMEoxN0NyOFlGQ0JJcHZKQnZZb0Y1aklC?=
 =?utf-8?B?TnBFWWhpZlBFSit6Y0RjM2cweHNBRjV0ajZVNklNUmZmUENoNHgxazhjRXQ3?=
 =?utf-8?B?cThmb3kxeVBqdE5sWW9NMUovclYzeU1sOEFVVkpqRVMxOVliQzZoSGo1RE5w?=
 =?utf-8?B?Q1lPaG1KY1o0M0pqYzVhVmZTRTRaaWhuVEVQOWZJclJtbFZRKzRQUkxwSzM0?=
 =?utf-8?B?RVNSR2lFRlFjQm5wU3lDQzkwT2s4NUVOV1lQa0tjUm1OODNTVVNtSGdUREFy?=
 =?utf-8?B?SDcrSHVmQTVFS1NuckhaaHFuNXJDZEl5azdWOW5HTnorYyswWWhxY1FFRita?=
 =?utf-8?B?UzErc1JyN3hocU1MRitBTno0aS9YdUVKVXpmME15YkV0cEFZSzdpcmRiK0Jq?=
 =?utf-8?B?RTdSeCs5dlZMK2NidkJPKyszeDJldklmT2Fwb0EyMDFMSFROOElyM2FscVZD?=
 =?utf-8?B?emQ4MHNhKzhVMDlya2hVRDN5L08xeDRvOWcycEI5c2ppdk5RemErWFV5K3lm?=
 =?utf-8?B?WWRQUFJZZm8zcDFGdkVibnd2TGtvd2hNcHZxalh0Yk9ZTWR0eDdTa3p4SUt2?=
 =?utf-8?B?cnhmemVVZ21DeE1pSUVIQzhuTHZkU1dja2YzZWVIdWNMYmlaQkREcXl4QjJk?=
 =?utf-8?B?clZHRGZaU2s3anladGFwcXlEZFZwdWM2dlNKME5ldFZCb2VCKzN0cDB3eUs5?=
 =?utf-8?B?T0x4Zk5iMnRmYytOWkhUN3l2T2U2WDVFRTUvdk82QklIb3JhVTlVck9Hbkhx?=
 =?utf-8?B?RklGZTZYT2FiT0ZORkJIQ05GU24rcGdqVTBJMm9hbWlnN2tVQXhoOEZES2NR?=
 =?utf-8?B?TkRCQlpDci92TU91eUF4TDZSVnhuTXdwbTFOUkdRY0dZWm5MT3QvS210a24x?=
 =?utf-8?B?Z2JnS1VkbGlGOUE3dkRPdWJxMlBSZE80aWFtWENobzRIck5UbjJ6L2E1K3Vp?=
 =?utf-8?B?WERRZFkydW04YUM0RjRxdjFqbUZub2ViTnYyVUNKVllRNVJsV00rVGZqSTd4?=
 =?utf-8?B?bGxiZlo2azJhNkRJd1BwMzdmTFlkMXZiUW1FT3p0ZW9ZRlg0V21heUliUis3?=
 =?utf-8?B?L0xJN3pwQ3R0VVg4MlMyWHk2NDh2bHpoZGJwS3dLSXVvcTExMDVLRWxLcmlx?=
 =?utf-8?B?Q0lXc2plMk9BZWQxb0M2SDVPVkJCU2UzMVY0UERvOUJDTEE3LzQrWnlzazJE?=
 =?utf-8?B?Mm5hbXJBUlp6Q2tiR1l5a1d4eUh6eE9VNE9sVy9VR0tFQWpObnFlWlJqMkVO?=
 =?utf-8?B?VngzTzJYdGlNcmt1enVKRUlDRUs4ZWRYNDhKN2dhRThOWThEbzd4WXY5bXd5?=
 =?utf-8?B?WFU0eGZIQ1lKaCt1cmpUZmIvRk4vdVNJMGNnT3VEZE1EeVkweW1wSU52VUhL?=
 =?utf-8?B?Um52VzRPbXUyMUF2NkN3T2p3L0pxcGtHWmIvRnlKZzN0QUhsZTZaMTFFNXVl?=
 =?utf-8?B?MENHTU9GMmwzc1NNLzJEMEFuSWd2ZTE3NG5nbGthTGlRb2J2Q3FOcXIrUjRB?=
 =?utf-8?B?VFFMVzZDZURhdG03ZkhZSmgvOG9jYWtkNGF2eVJSNTUwSERyaW1aeUw4MGNw?=
 =?utf-8?B?VCtBN01WMjdaanNndVNEM25zTTRZcE1GQVhvYit6cm9IOGxVbUtQblptWlps?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 488620a1-4cdf-4669-8139-08dc9033d4b7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 07:45:47.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+CMURJs3y4wjpLWqbsqA+or1ORIFQL87ddUo9Y3DiOmCuKOWSAIdgetlCQ32D5i9QeJdvdOLjRj5pGIvd1BsgXv1c1znH3/iYIcI6/Mo8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8376

Hi Guenter,

On 18.06.24 19:30, Guenter Roeck wrote:
> On 6/18/24 09:51, Quentin Schulz wrote:
>> Hi Guenter,
>>
>> On 6/18/24 6:29 PM, Guenter Roeck wrote:
>>> On 6/18/24 09:06, Farouk Bouabid wrote:
>>>> Mule is an MCU that emulates a set of I2C devices which are reachable
>>>> through an I2C-mux.
>>>>
>>>> The mux and amc6821 combined make the Mule multi-function device 
>>>> (@0x18)
>>>>
>>>
>>> I don't think that is appropriate. Those devices should all have 
>>> separate
>>> devicetree entries and be modeled as individual i2c devices.
>>>
>>
>> I think there is a misunderstanding around the wording. They all have 
>> separate devicetree entries and they all are individual i2c devices 
>> (from the PoV of the kernel, they all are emulated within the same MCU).
>>
>> - AMC6821 on address 0x18 for registers from 0x00 to 0xfe.
>> - Mux (paging, however you want to call it) on address 0x18 for 
>> register 0xff.
>>
>> Note that AMC6821 is **emulated** in the MCU so this is not some HW 
>> trickery here.
>>
>> This MCU also emulates ISL1208 on 0x6f, as well as a PWM controller 
>> (merge request pending) and two small AT24 "protocol" EEPROMs, on 
>> that same address. Those are behind a paging/muxing mechanism. You 
>> access ISL1208 through page 0, PWM controller through page 1, etc...
>>
>> So basically, the point is:
>> - 0x18 on i2c is now MFD Mule
>>    - two platform devices behind MFD = AMC6821 (reg 0x00 to 0xfe) + 
>> Mux (reg 0xff)
>> - 0x6f for devices "behind" the Mux
>>    - page 0 for device behind adapter 0
>>    - page 1 for device behind adapter 1
>>    - ...
>>
>> All of the above are part of the same MCU.
>>
>> Mule MFD is a simple-mfd-i2c device with its own devicetree entry.
>> Child nodes of the Mule MFD are AMC6821 as a platform device (but 
>> operates over i2c) and Mule Mux. That's what was meant as "The mux 
>> and amc6821 combined make the Mule multi-function device (@0x18)".
>>
>> The Mule Mux then creates N i2c adapters representing the mux/pages, 
>> all of those being represented in DT. Each of those have one device 
>> on address 0x6f, all represented in DT as well.
>>
>> Nothing hidden or hardcoded, everything in DT.
>>
>> Did I miss something here?
>>
>
> If it is properly defined in devicetree, the emulated AMC6821 should be
> an i2c device, possibly sitting behind an i2c multiplexer, not a
> platform device.


The emulated AMC6821 and the Mule I2C mux are both reachable using I2C 
address (0x18), and hence the use of MFD as the mux only uses one I2C 
register that is not used by AMC6821.


Cheers,

Farouk


