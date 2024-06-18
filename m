Return-Path: <linux-i2c+bounces-4091-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3690D9DD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 853F0B2CE96
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83FC13F44E;
	Tue, 18 Jun 2024 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="krHicajR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2116.outbound.protection.outlook.com [40.107.22.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928113C9CF;
	Tue, 18 Jun 2024 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718727004; cv=fail; b=cNP9UQnTFV2RI4rIo+2/cTdMbD+SHm28qgQbfsbs7dEDzQI57uuNBempGCMCWjQXnFZaKC4n28JVjRd4V/6CTE3cfqT5KPqLO/77x9Eyuj34/GpXYXl3NAvzH3oZMd+pl45cDa2fKKG5y8X0KUFkhrQl0pIUOukA2wlyef3LP1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718727004; c=relaxed/simple;
	bh=gPEggTVcyiCzVXhELuEmuf2BtpXmLnnN7oiGezUPSc4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M/nyrR23PO4JujFE8fkmsTyLhKSZeDspj/LhNbwgyInbqMolv4zTF8J1CwZMUmFjc9h24HBTgWwxrs330KxWWQMr72EXXURvih+6O37ECyZZ9SxSbNfraBJLXUROlRlpSoWqpBdRV8UonGESO/fyBenG2rMkMprLAO+TMe01y9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=krHicajR; arc=fail smtp.client-ip=40.107.22.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbn4rePg7DvEI8OJouaBzqKDsxmgiQPvbf8Pas8qpBsU1EEBg95Dajv6PqOCeBpgMRskzS445Tk7IeDXTonY7L4uYX1Ve4j8CKVCTPlal6kJ+j5siEh6M9FmgMn5ymX+ZrsV7SquUpNZcdhN0mKO2shQQWK//NMrenOlUxBGrWlpXFVUb0D0XEdfxJUAlwYuUowPHsNXr7SEN4e31/DLdbe5lFYENCP4aqlKHCFwCszRfoD3A/Xh72a51tgj7glTZ0jP6C0tjNmuQ1XANCt7cXbVnC0vIA89y4V/67rvyoWIAgvy9yYpiP+sJrK5cEJWvEjVTDTWOnX1CPo1yxCX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNzqLlROhiUaVRtvwgh2JlueytI+aFRy0b6MpZJr3HM=;
 b=IohSgKjv4OspN7ykKursZYc6zY6DHKvWKDMDTrSdMWgkQlxrkWtGehbm/XvcK7T81n6wnZfqga+4LlEAIHANszSGUA1VyH/p7A5eLrU5t/nbEaBogftw8/i8k9QB9e2f+jHL/PA/XIdo5aq3zdyx+1VCgVlF5gczGFn0GBq5ktYtixKhcZixoXoXWfaEu3H6pc6HqPcnj+iv2rqrfwWrlez33O0WZL9kB3Oj1VLJavPOx1lRAoiGXSzBQVtcUpNc6oY7PwDNV9edCtHoRv2D98aDet/kSW2+vzrHhJbGM1+Ho+WJwhzPCDCkIUi8bIbtyyh/XF6IJf7cXI6HfSTWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNzqLlROhiUaVRtvwgh2JlueytI+aFRy0b6MpZJr3HM=;
 b=krHicajRJ/i4D2ZijR82eHn/YR8p0nBi8yZiGvr3E2WS4kIz/i93zYF5O+KVQLVWufp7Cu9CkFXy2um+olf5TfEJltjxV6+ROzsQPNveXv+wk5TF+BGeUpSrhSg6Kx22Q48lTpCJ4PMqDbRw5M3WOSvxoZpIhRocNUs7vbQd7Fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI2PR04MB10642.eurprd04.prod.outlook.com (2603:10a6:800:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:09:50 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:09:50 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 18 Jun 2024 18:06:47 +0200
Subject: [PATCH v4 5/9] mfd: simple-mfd-i2c: Add support for tsd,mule
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-dev-mule-i2c-mux-v4-5-5462d28354c8@cherry.de>
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
In-Reply-To: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI2PR04MB10642:EE_
X-MS-Office365-Filtering-Correlation-Id: 65597078-c78c-4f8e-62ab-08dc8fb11490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|7416011|376011|366013|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEgwRE9odHd4OGRZWk9jWTVMTGlCU1k3eCtoV083TkxUWUVBOWwveXpzbW1D?=
 =?utf-8?B?cnZjQU91TldPUTQ0Z0tqam90eDFkSmtlK1pLNHJCWitsenVDa0Zzd1pWM2kx?=
 =?utf-8?B?OHJzcU9RaXFGRUpzWDZyV2NvN1g1K1hpaTBiUkhuRFBrRWJVQVdvbzRSOVRy?=
 =?utf-8?B?NGVUc1UvMkNQekFjYVpDMHBuUDBpTStIeTQ3MGY4T0RyUkNERW1XMDNHRWVS?=
 =?utf-8?B?NzR5eldYYzV2bml1Q2wyclY3NkFxUm9DVThMMmRkZEE4VTZxT0Q1eDZjWVY0?=
 =?utf-8?B?M253c3FJaFJZSTFKcnNBTGRDV1lEZUViVzcwWGxJdU4vOE5QbFdhY0xGa3I2?=
 =?utf-8?B?YWRHSHcvU1pVbXg1VWxFNHgzbFVRSmJaTnBLNTdwSXZQRmY0cXplZlRwbnd2?=
 =?utf-8?B?aVBPckJOVGs3TWN1YnFNNktvVDNWQjdxTUJyZExISTJFNVRTZnZmZ2Y0Z1o1?=
 =?utf-8?B?SCtkNGdqdEV3QnhXOE82RmY5Vllmd1VIS1I1UE9hQ3dpclJuUUVXK2tuVm5G?=
 =?utf-8?B?YnJQQWFJeUFZNU1JakpLcTBVcEhHalQrVFRmaGFmZnA2YlBOcUlUaXVLOG1z?=
 =?utf-8?B?bE1oSVBBbnB4YzN5aTlvUVFhdi9Udjc5SjdiWGFxRjBWK3JwNk5WcHBHWWxN?=
 =?utf-8?B?YlZtYlk2QTRrd2NqTW9CTC85eUd0NTBwSVVjOGVsNnoxTHhIbUlOcnh3Ujl2?=
 =?utf-8?B?MVZBalVlWWNhSHg3NHQzN0d2Tm5WLy9PQTJkL0NhYjJEL0NYbk9MRVRvMmM1?=
 =?utf-8?B?c3hDd2dIUFJUajh3QzJGR3ZlWEtnSWNaS2d2RDJmMGloeHlJeUFua0RjelZU?=
 =?utf-8?B?NlVDT2lwNjBVR3NXdkhaMWxLQWpKcEVKaGtqK2tkNnRlL1hma3lkNFJrTlh1?=
 =?utf-8?B?K3l6UnJROUxqUFRKZXZSeHZzN0h5RHo1Q1hBRTdnNk1oeUhwb09weTJwMFdm?=
 =?utf-8?B?bE1DLzlxZDJoN0ZGcDJtUVZKS3VONGsvSlAwOXN2OUNBMG9kV1ZERlQ2RW5x?=
 =?utf-8?B?c0IzemtDQWlQNjNUWGpJVXRlUEZwQ2lHc2JKZUk4QzBBcTB2ellidnd3U0tL?=
 =?utf-8?B?d1h3T3U4RFJxMmRKd2c4V2xDL0p5anBMd0VHL29SVXRvb2o4RXFSNjhiNkRh?=
 =?utf-8?B?K3ZCUzdYTG5lcEVHSlE3OWxNRkxBZ3pTczZSSnZ4amk1S1dmODFXOERPOG9m?=
 =?utf-8?B?NnZkWHg0SFFLK0VMOHdmNU1DZyt1RG9Zd1g2R0tmODB6eG9lL2pDRzQ3RnNw?=
 =?utf-8?B?RGpLZnhKbjJRSkhjV00vc2pNa1U0cmxldlBSK1R6WlFNN3cwRFR5MFJQQzA4?=
 =?utf-8?B?ZkRoS3lWSDJ2UG9ld2RDdEludi93QVdWWFYzc0VkUnVnVE1hMGZNdUQ0S1I4?=
 =?utf-8?B?QndOSTBSeXd0bkRLSGU5TkM3TW12RFBGYUJQb0xhekM1UXppTzgzNU1OTE5F?=
 =?utf-8?B?RW1MUlVYWDJpVG9LNWMrSG1GQzY4S3BBbnVJZTB5VTc0NEpHN1l4YTBCK3Yx?=
 =?utf-8?B?czF5Z0E2bE9kRVZRdFl2Z29kTllNR2pqeHRhcUp6Ukw0NW5MNVRMamRZYjJz?=
 =?utf-8?B?dkZoU3NyR3QxWlVEV0FGbVRTMGVCZ2pLOGxRbjZsejhYRUFWM0dHOGtUZU04?=
 =?utf-8?B?R0R1SWFTRzd4QW1WcGFXeTl6MUxOQitVc1l2ME1xa3E3aFI2Z0NQWkxKMTZy?=
 =?utf-8?B?VjJpYVVNdzBjcG9iUFJHZ2NtbG1xQnVaMytsMWorUVcxemtNQ1FTTnhLWFYx?=
 =?utf-8?B?TkVrM1pzVGJlOVFzQWFaTkN0MVl5YjFsUGliczNYWWh5QlkzSTVzZHg4bHgr?=
 =?utf-8?B?UWozV0VvdFdSUjY5RmNKWXR6Nys0S3ZGZGdzVHdFemZnTDRVcG0zMldFczdw?=
 =?utf-8?Q?DMMBytRe7d3cU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(7416011)(376011)(366013)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhCNHhzVmhnSjJrVDhMcldtUm5udnVtWS96cVJqL3A0cmI0MnNudmNvYmEw?=
 =?utf-8?B?TXBhRjNWeDVlMVhuazY1Nk9DY0lCOWltMy91QkZqUWRoUTVuNGswZWdxQ1ZZ?=
 =?utf-8?B?YUtwelBET0JxK29kdXFUazNRY3BLeHc4aUJ3T3FiN3Nud0tJL3lXY2xZMmNE?=
 =?utf-8?B?TE9kOHd4bjIvWWhXUkUxVjNEWVQzNGVCd2lLdysrVUt4V2VhSlNoU2JIbFhD?=
 =?utf-8?B?cXE4NEZBeHZkSlc2RHdaVjUwYXRWUDcyRm0wYzhLZTl5V1o4ZFMvbmFiQTlq?=
 =?utf-8?B?bCtXMmNOMnE4ZjhQWnY1VjFWV1V4ZmFEaFpUQVZpamhDMkJLRlZWMyt5M2t4?=
 =?utf-8?B?NmVhM3ZTRi9NaXY0SkFQUnBBd0h6a20xN2tkN05lR2JwS3BRVm9JcDhaYmJE?=
 =?utf-8?B?SWZEUjZhRzhQWFRiM2s4M2RnKzM1alptVlBXekxJdFZxOUJOUXhvUVV2ZTgv?=
 =?utf-8?B?cy83V1dWdFl1M1pPOFRzUUNoc0d0M3pNSTNYZ0pwZkV6aW5BNStSUDJCdlNF?=
 =?utf-8?B?NzM3ZjM5bHdydTNwclpTRmR6WUhYcGR2V2ZwRXQxODVtZG5lMFFOUllUT1pu?=
 =?utf-8?B?Q2sraE1ieUdpTnF3QlY2ZGhUdHdLU3grYnFtbnl2dDlpcTkrbjZrekpWNHZ1?=
 =?utf-8?B?dTRvYmtxWUxPMmZRZWtqcDNmWE1NSHFObEdjOXJzM281R2htUUtlY0gwcWNL?=
 =?utf-8?B?Ym0yNlFFeWkzSGh4MVVmeXBiS2wwa3VHS2YwZGwyWExtMUdEcFh3UW16MjBP?=
 =?utf-8?B?Y09kM3l5eUk1cTJFYThRRytwK05VNzM4cStaVUpmRkQvbHE5RytmdUtnK2tw?=
 =?utf-8?B?SlBjNVIxNm1HeU1HOEV2cStSL0tLbGdYNHBnUk1SWVlHQVd1dENveC91R1VU?=
 =?utf-8?B?S2J4emVSRkNWakhYVzVIR3FwUS94WjBYemtOdjlOaEVBMVlOcFA2SWZzYXNC?=
 =?utf-8?B?ODhubXFOdEllelJRYmh1RkxsMklFdGF5UkMxbUtxd2pZR2hRbHMwREJudStE?=
 =?utf-8?B?NGhOUVR3QytsSzllQjdPWVlMTW5uZzZNcXZYV0RUQ1piYWpmTmpVeUtOdTdY?=
 =?utf-8?B?eXh4anpHYzdQOE5zQ1cweEJKaVNtb1BsVWtFRGZQa3lnMytIQTVMV291aTZK?=
 =?utf-8?B?U3lnU0JBUFlhOFpUMUpGaHJZZFNnOE56eEhkZ2pBTGRuZUwzSjhxMUQwWGJp?=
 =?utf-8?B?Y0I0MDVpb1g3eGFzSWFTQkJVLzIrdmRiVllCMVV0KzkxUEYvVG80WDRobVMy?=
 =?utf-8?B?Q1hlNHpqTldBbngvZGd6U3hZV0t0QmpmUEh0MmMwREtiNWlrRHp0YzRTVUEv?=
 =?utf-8?B?RlN0VlVFMWtMbjFFQ0xQZ2hPVmhhNlYrRUZMWFdjUm9TR21TOWJCd2JWQXdS?=
 =?utf-8?B?OWxEUGhoYThHeDJSRVo4a2FUMW03UmMrOUF0bStFTkJwR1hHcWdwMlVDcDlF?=
 =?utf-8?B?VW1TNExVdnh2Vm5pRm41S0p1YVhheTNNOFcyK242TU9OUDVCN1QrcE5rNU42?=
 =?utf-8?B?cmRKY2x6VkduTFM5K3R2N1g5dmFDZnpLZWRtdFpTMkExZWRkVm43RjJ4WDNy?=
 =?utf-8?B?eU5FWjlQd2J1bExKdGNWQ0xsVDNGaXVOeS8xdi9DdzFTa2tWNExkZ2NoUVVl?=
 =?utf-8?B?UWV2cXJZVVY5VGRscHhSVDBLaTgwRmYwUGJncFBad1pRUWh4eDFFM1lLcVdr?=
 =?utf-8?B?TG5LVEVIMnlseGhCa1ZGRGI3dnArd2RibTdsS2ovSGFKRzJmTjZORTFEa1Y2?=
 =?utf-8?B?dTlneEluZEliaEFZN0VJbkJ5YkJsa2l2NEZPVlBOSXd0dENWNjlIQlk1NGw5?=
 =?utf-8?B?cUc5YlJDS2VwOHI0ZVhsSGFycXJxbTZVMFZFd2hmeUtmeUpxTWQ5dkFJN3Jv?=
 =?utf-8?B?cGhGdDZHVXBRdzZCTzJQOGFidURjTEN1QmpEdkFLejZjVFIxOTE2RzFITW9m?=
 =?utf-8?B?OWVaeWxSc3FYK1RaMUpJS0wyTmtibkltbDJmRlNBd1JHdTRSMkJtUkJmNzNk?=
 =?utf-8?B?eVh3TW1BTVVaVUF5d2ZCQTlEdjRTYUpHYUR6cTMvQ3o3QzlGdlFIQ1JWQ1Fu?=
 =?utf-8?B?dzBHaExIZmprUUg1NDRrRzYvTUpFWTFycThqM2o5NFgvN2pLNzYvYW1TYzQ1?=
 =?utf-8?B?R3AzTGJjc2ZBcEhOOW1NTUE0UzN3ODFONVJ2c294Yy9nMS9xc3FsdnlQdU9Z?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65597078-c78c-4f8e-62ab-08dc8fb11490
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:09:49.7784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gje6fofuReYxtTO73A4LPQBD/JKMApMbGEgrTn/2vLO/Autpo8uidGphK+NEnJJAF1FX1mDk0izu+Z6EyUuCxfj6zNL5fb3iaFmvXX6ZY3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10642

Mule is an MCU that emulates a set of I2C devices, among which an amc6821
device and an I2C mux that exposes more emulated devices. These two devices
share the same I2C address. Only the I2C mux uses register (0xff) as a
config register.

Add a simple-mfd-i2c driver support for these two sub-devices.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 6eda79533208..1c5853868022 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -88,6 +88,7 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a},
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
+	{ .compatible = "tsd,mule" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);

-- 
2.34.1


