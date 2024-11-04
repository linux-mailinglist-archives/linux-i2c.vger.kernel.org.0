Return-Path: <linux-i2c+bounces-7754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B299BB527
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 13:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697FB1C2194C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 12:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C91C1B6D1B;
	Mon,  4 Nov 2024 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Oxb1TVhs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D4E433AB
	for <linux-i2c@vger.kernel.org>; Mon,  4 Nov 2024 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730724931; cv=fail; b=oi4SLYx22W+u95Rpej4+C0HYn11ql1ibiAnlBAK5sLWURuuJn+4B34tdl2t35e38pS00NQhx4zff95vsCkH25BxmyMjtwqpGb7c+SgXqFUW7WbztU0vyKnDzy+PGv8N/g+i9vrYGo2yAHGfjWqihtiMZ9fFbutam+RZ2lI3RKeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730724931; c=relaxed/simple;
	bh=9JykrPcWBOtF+LoEeag2jdyiCGgWbMco6chrK4L7iuM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kCfYLiaTVJPh5lLiOjCTNihHsPqjQqkL7MwRulAmqPnmXCrDSd3DS9fcw5OmMQpUVAygru6SQ2AnFuvU10z8e/E1damiIQtEojGiByY4uhEUOBQrs/DcaXd9wu885sZycLYu9eShBa16lC4pA7l4eGUjPR0u9kaJGynzUGsL3Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Oxb1TVhs; arc=fail smtp.client-ip=40.107.104.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMWGVfdGK6OMfSPyypeUYQs1LSBIXkVs7HgTGY2VqYkfFrn9CenE9bz3cdvR4VjFYymrDY8/bZ/USx4Qe8y1cmtpsLMeGu93n+t7/fJWG4dlYo6VrKlpS8VdZVcbfGWUOI6243RZ0XWhlYAo8zgPH6Tdstl6JnLJl22LI4zTTYi9hFzrTmiWPIJdtKArUzOPr9ZEZLqxotB49rl4tRoTlRx18CjHbMuyj3e+ak8Yj2fUuJCc1vBmRnwbphsfqwNwSj9FNlxIDWTRrIzUgZAiNip3eBos5/J5OEDVLHMFlri7D8y0FqJCtd0EEm6KARk/VVHSq6KpaOz5jgp+CWBK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JykrPcWBOtF+LoEeag2jdyiCGgWbMco6chrK4L7iuM=;
 b=U8c5YV72MJGR+38le+U7j5tnE6Qh5vfE0b0JfRckRcSNZCharC5yk3z9pD8TPdEIMe9reBjRyRNKVHKpoDDpCRXIPYkNkuBZ1BNKRZIo6KLa37gCtToZMrMCufZN2q5PubmnPOlVc3vLIJdFfCTdYsIkUR8NkHHoIUsfG1PNLu/25PEhfNOaY9cctJ11CqPEiXEyguXqVbY+mMuZQcGCXspPH3pgQW0ZGw+401axd2DUzKqUoLMz7MLdqUUXgxcAAblzvMAKsprkSU2WR13BfYec3/hjvHXKYptJ/YlpdRyW321tq4YogY8xVkn+IRBsz+2dkC3+6q0N/di1oIj+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JykrPcWBOtF+LoEeag2jdyiCGgWbMco6chrK4L7iuM=;
 b=Oxb1TVhsTBrYAZdZnCd71F6djVjU3xfCb2IT0cmuY42NYKDUbeQkIBLmDDdR/3rberF4YhyLsIWBMmlWe/yZTJo++3/09a40b9q3CXneqmu9WsbOZUVs8YhYaKHg/ChkfIEWSoY+ef16pxBPtCe1fqpHbcwtnCkBvwoO98GsyhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:55:24 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:55:23 +0000
Message-ID: <105756ec-1233-4f71-ab0c-08f751ce02b7@cherry.de>
Date: Mon, 4 Nov 2024 13:55:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: muxes: Fix return value check in
 mule_i2c_mux_probe()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Yang Yingliang <yangyingliang@huaweicloud.com>, peda@axentia.se,
 linux-i2c@vger.kernel.org, yangyingliang@huawei.com,
 bobo.shaobowang@huawei.com
References: <20241026030942.1484-1-yangyingliang@huaweicloud.com>
 <yq3ncphzoexlecxqqo5y4qhepc6u7sks4glb4n6jzlytynuylk@ndxwo3twzl3j>
 <ZyiodI3tFe9xbLVv@shikoro>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <ZyiodI3tFe9xbLVv@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: f0185449-eb61-423f-e0d1-08dcfccff258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFhCWTNVTkdIdDIyNHhMQUNjYkgxWk9VenRkSG90VWNFRGZBZ0ZSMHBKWHFQ?=
 =?utf-8?B?cktRVDdxUUlHTUs4THNHdTZsQTZJcEdFZUdXWVhaaGI5UEFMVVEweXg0Rndo?=
 =?utf-8?B?anNlN1RNaXBTYTZGYkh1T09rM0hNRDVjeWFOdUVQUVllNEw0T1lwOHloemUv?=
 =?utf-8?B?Z2xxQmdvV2MyQVM3LzNVWE0ySHFhZEhkMHJhcXRHZmFVdTBORWcySDFaSzNZ?=
 =?utf-8?B?NUFrR2xQUk5VMWUwWUVFTDF3TE9zOEJDZGNVZW04eFhJSHdwcVNBeEhZNFZF?=
 =?utf-8?B?b1VqOUVDVXFPd0N6SUg4NGJqRHpoL2FZaXRJUm5DMHF3Ymxpc21xRmc2cVVN?=
 =?utf-8?B?a0ozSlQ3RmQ5akdvZ3Rid05rdGdPR0RCeitZMUwxUUY1ajZCZjVlMm1NNGVP?=
 =?utf-8?B?b0JMWjFVUHE2Y056dFZOVjRiSEJyUXhCWHpxNnlqTzhQNVFEWjZPelozSkg1?=
 =?utf-8?B?UENCV1JxV0hMT1ZjQzFTQzR1MWpsT1VLaUdleFNqWS9mU1hqd1lycytaR3Fs?=
 =?utf-8?B?V0lwL0NEeG9lS3gxYnVFa0JkbDJYa3JnSlZOelo1MVFUMC9WNEhpRHhuS1NI?=
 =?utf-8?B?UVFZVkVaZ0R0ZExxOWRJQ3p1cU1aZW9ncWFhTTFPS1FCdy84QnIzTGdUVnJ6?=
 =?utf-8?B?SGFYcjhNc1JaditJdGJxVlNoOFVHaVk5clJpcnpubVlUYi95dWw2dlB4bnJy?=
 =?utf-8?B?VUZONjgvc0xkMXBLejRLQmNPOHdmSEdCbWxqSDltZUo3WEVReTJ6STVWUmMz?=
 =?utf-8?B?eUdqZXRJbzdiWm91MFhzWENxN1NEcVRzNjZYdmRRUjZLZVpsQ3UzTmZSdFlz?=
 =?utf-8?B?Y0VtU0Z6bUVZOEpzUFd1YVNrRHNlWUVzallXa3o4UjdzUnhzZDkvTmxQaFJx?=
 =?utf-8?B?Uy9mY3ozcW53SFlpbk5FbHYxeFh4Mnp1UCtIYjJaK3JVQm11VVprNnFKUkVP?=
 =?utf-8?B?NWtTSTYwQ3JFQmRLUm5XMnBtK00vR28wNHpudG00OXEwN3JYaTNIUjdjODVG?=
 =?utf-8?B?QnJCVzFFRGlnQWFmUGVhS3lFOU52Vk1LMHgwT0xVbzVCWVZyZGNFK3htWlkw?=
 =?utf-8?B?RFRuVDd1UFlaNTFDWjRKREwyamVSQW51dW42Z1g1WVNKYkNRdSt0blBFbFpv?=
 =?utf-8?B?K0FzcjdMRzVEb3YwTGRUTjUrNHQrOUo4UTdVL0R0cFJGNUZ3VkN3RlFtdUow?=
 =?utf-8?B?akx5YTNBSUhEelVNR3oyam5vKzFvazB0RXd3S2l5U0l1ajhJQ3lJejZGVS9z?=
 =?utf-8?B?WjVyYTM0WmhsQVMrb3R4NjVxQzlaN0syWjlWanVQVmNqMlNGREczM0lmTUdO?=
 =?utf-8?B?ZEdjSkIyTnMyMGlaWTFnTU81d1drV2Rudkc2am5vcHZqaElmWmJsVUpFa2F3?=
 =?utf-8?B?ZzRPMGs1YWZmc3Z2L2dzeGpZK0NOYm9YOFpWQ21OcWh6c2FVZUhTa0U2M1lr?=
 =?utf-8?B?d04ycFNGVVpBN29RYWxHYkZTK1BDU3FFN1d2dE1OWG1EbkFocGcvR2llRzdu?=
 =?utf-8?B?WkI0NzN2S0xWZHpqWE1ST05Sb242SEY3Wi9FZ0ZsdUM1TUJtMERlcTNNTGNH?=
 =?utf-8?B?c3NpR2pGRE1DRGtsQUFQdHA0RytjeE9lZ2I0WlpkWjF4eDlRR2s0b0R5NVhJ?=
 =?utf-8?B?d3plZXNFNVAveTczcFZCQmhucTM2cWplcnRFUWt6L0RIUzg5OXJtSFBKVm9x?=
 =?utf-8?B?b1NJVTRSNHN6dWlYNGdWV2d5QU1xZ0pBM3A0Y3JvUHAxK2ZPMldHU3dNeXhr?=
 =?utf-8?Q?0zT0nyStVCshjhStJ1eXHNffkamlIGogKtD2EBw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2NEVXVlOFJhMEVyVndZNzRQYkpBcUpUTUsyR1pvS2s3Rm5FV3lKRk8wRFZJ?=
 =?utf-8?B?ZTJ2bjczTExvd3phZlJCZ2x0OUxTWHVETVRtb0dEVHJzRE1pMjJCenNveDgr?=
 =?utf-8?B?TGw3S1VXaGNxaDEzbnp0Q2NSb2xSTXNYZWZJT0VIMHdoUlYweTdYZjkrQVZi?=
 =?utf-8?B?c2hhYzdvekJKWVdmbzVtampodkpkY0RpdlBXeldnaVR2ZzFqOWhPNkdmcWdE?=
 =?utf-8?B?QkNDWFU3MTZBelhqY3licGVHSGdnNVRYeiswS1F2SXIyTHYyY2ZTZHZuZnVX?=
 =?utf-8?B?K1Iwb01HT0RmWGwwc0dUUHNSWTNPYkI0S1ZRcWFVZlJnSm44YlE5MFlDbHJG?=
 =?utf-8?B?SThHWjQwOWdmMDN1d2xKRGFHTTlwSnlVQnNtYmV6ZGt3ZUFPRk1YY1M2aVhs?=
 =?utf-8?B?NTI4ZmYxV21SSlZhZEhucG1rS3NRbkpPaHVyWjRPcmV0MXJ1UjZOS3RsZWho?=
 =?utf-8?B?VVNJTmJVV3VFNzRjN2xGSFFzTEFteitoOHhSL0dCMWhMZkRDK3BWME9iQ0Nr?=
 =?utf-8?B?VE5zZXN4bU41aU1oakM0enJPL0JCKzYrdlNDdmRvcVk4ZDdwLzNTVWtMV2p6?=
 =?utf-8?B?anhIRGlNMzUyU2xVbVBxdEIwWnlUY3M2blc5dlBoK2FaR2FqOEVSUjIwZ2Zy?=
 =?utf-8?B?S3B2UVQ5NXZUaFlCY2UvTUlOWlFmaGxuSi9GZEtpd3BJNTUvNW4zK1I2cnU0?=
 =?utf-8?B?VjRCUWV4VkdzU2JzNmc1L2JzNURFbWJjeG9zSGVqNXRnUmJvYXVUZTViUEtp?=
 =?utf-8?B?WXAyU3RKWWhaRlpXb2lzSlRNY0taaTBqRmp5NjJVQzBxeXc2NFpFVlZ1YzhW?=
 =?utf-8?B?TlkxY1VySnluSDdmb3JScWExVDFnc2VGa1NTeThsKzNzQU1wWHhzR1h3ZHhK?=
 =?utf-8?B?Ums0Vk5uL2xmNnNxSWU5WUd3ZVFDVEl6Y3VCbHVHWXJpWlhpNGtIdkZQQlZy?=
 =?utf-8?B?YVR2MVV6VmNSUkpNcjVGYk1MMlI0VDJDS3lvT3dMRjZ3OUNpOGVEUkZKRGRx?=
 =?utf-8?B?ODB0cmkzaGMwbmtEMXExY3dmQ2V1SFcza1daTDl0V1hoT1VVU3U2OWdKWkZh?=
 =?utf-8?B?WGlySzlJdEQ5OG55S1hBK3h4Nms0OEJsT25VYnNuaHF6a0VwT212ZUNhc1NK?=
 =?utf-8?B?WVRsaFA3bFdtUXhNR1laOFV2RHVRYWlpTUc4akowTng1U0ROYTUrQi9qdmtW?=
 =?utf-8?B?UWdFYjJuQkJaRlcwWmV4MTNMWldoZzhXZWVPNUcxOHJLRnZSZTVaOTNnN2du?=
 =?utf-8?B?MTZtaDdjYzg4eGlMVkpCU2FtWlFScUp1bFVvRUFOcXgwWVltYTJVQXBFcXNx?=
 =?utf-8?B?Mk1tSjFoa2MzSTlGRlN2Mkg2Qy9CdFkwbm4zMW82a1B6LzBXQ2Q3RE9TQlRL?=
 =?utf-8?B?UUhxa1NlRXREdWV0NjNDajRaTG55VjRFT1ZIbUV5emF6MW1LZFhXUTVDQUZM?=
 =?utf-8?B?cGdCaEdxTHlYWDdFZ2pnR2Z2N1BMZ1VJd0lUemV6eC83TENTZjk1cmZadU11?=
 =?utf-8?B?UDVWRFg2eXkxQWZEczBnakQxSysxcFNkVHdxRDYyam0wOTZBS0o5T2YzNVJB?=
 =?utf-8?B?SjJNK0NJaGo4Wjk2QXA5SDlNRk5pSjlxcTdvTlYzbk5VWkRWSFpESkV0UFV5?=
 =?utf-8?B?dmVJQ1owZUZnNThTdXh5V0VVR3pqVC94MzMwTU04RGlIU1U4OW02U05TUjJi?=
 =?utf-8?B?UkV5U0dwbzBPSFF6QklqTnl0NHZaV2lpQ1lDOTJGMm02azJJSDArQjA1dDZX?=
 =?utf-8?B?MjRkeXFHak14QlhmQ2p4Ym5jdDgwckxwSVhhZ0diTElVUGw0VDQzYnpBakVk?=
 =?utf-8?B?WXpHZndLNVBjUnltOUFUOENPTVpoMjdKcWRzcURpKzU3bzdCdG9WR0pOdTBi?=
 =?utf-8?B?bG1La09vUVNjak1mU0xPbTZYd0FZR0wyK3ptZXZ4SWgzdUpqenJieUVtVHdW?=
 =?utf-8?B?TkxPRXFsNHpYQ2NhNzVyU3pWOUJWNjRWMkNSaGpmWXhBQVYwREFNWE8weDEy?=
 =?utf-8?B?TndjY29EZWJMUWVBTkt2ekZwbEMwN0NYNUNNVlNjSldBWUpvSTJhZmhHcXZM?=
 =?utf-8?B?RmovcGpCbVhlaFlOK0lnT1JWU0V1RlQ0VTVNeWVDZ0ppaWlQQVJJNVV3MHdr?=
 =?utf-8?B?TGF4bFNoUWdVdnhZaGF0Z0VzaGRMMDlaQjZrK2pSOHJRRnZ4dHRmNmJDQUYy?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f0185449-eb61-423f-e0d1-08dcfccff258
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:55:23.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WABtbfhnPiRET/ShKZVC6wCpb3npIqAwF9Ujq0iIOJdU2n1T4nu09A/4V3cj7/p1hIWNx3ujrYuPJ7QsvokAzDJx8ItKNGHAccJxDk89MHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

Hi,

On 04.11.24 11:56, Wolfram Sang wrote:
> On Thu, Oct 31, 2024 at 01:09:17PM +0100, Andi Shyti wrote:
>> Hi Yang,
>>
>> On Sat, Oct 26, 2024 at 11:09:42AM +0800, Yang Yingliang wrote:
>>> From: Yang Yingliang <yangyingliang@huawei.com>
>>>
>>> If dev_get_regmap() fails, it returns NULL pointer not ERR_PTR(),
>>> replace IS_ERR() with NULL pointer check, and return -ENODEV.
>>>
>>> Fixes: d0f8e97866bf ("i2c: muxes: add support for tsd,mule-i2c multiplexer")
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> merged to i2c/i2c-host-fixes.
> I'd like an ack from Farouk here. In general, -ENODEV makes the driver
> core sliently fail (ok, we have a printout but still). But not getting
> the regmap sounds like a real error to me. I'd suggest -ENOENT or
> something. But maybe this mux is a special case, Farouk should know.
>

I think the -ENODEV is good enough since we already log the error.

Thanks

Best regards


