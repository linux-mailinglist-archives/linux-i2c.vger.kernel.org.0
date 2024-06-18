Return-Path: <linux-i2c+bounces-4087-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8690D86B
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 18:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF666285C19
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 16:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F183B139CF6;
	Tue, 18 Jun 2024 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="cpv5e8Vh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2123.outbound.protection.outlook.com [40.107.22.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D252F74;
	Tue, 18 Jun 2024 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718726999; cv=fail; b=TGVsZK/756SeYsBao3uY/5eDlLWqp4MLW5byHnKOFhbkTza1NStr0zk1mnaGp+BER9z1wiB5cCS3lD/qyX8VbR3QfoqH2yWL6/mj5TXW5qY+dCbyIiWP/HZaq0817bdq0z7TWDabf4dZuQb76+Eq73yF4E4ub13r9TYjEFHQKU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718726999; c=relaxed/simple;
	bh=8l2URR3pIF6x05Xd/6FhcdJhOGXFxKSEmPT2xKP8XPU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ljg82347w2HGXRFYWnZWfyLwEluldaeXwV2ANmOWCOTuDP3kM+p8nyb4GtMgi4+xyock6Gsqq9mIicZ38A5GVjAg6MqNb2KUofxXuqlqRWufRWTq0m9mS1nZnS1anERjWxpwZtICpqcA+s6T6Cn8rijIhHE/uu/u12xdBA1uWY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=cpv5e8Vh; arc=fail smtp.client-ip=40.107.22.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpnDsf6e8ytsU4iMTM+XfLNb1phE3OWHqMPLyPkl4ht4GKGYdQI12NGSZK/7Q5swgoa6EhYcqdmnCY6ooAd9YOuNZlGce6Bm2u79X9L93scFxdD8iIy1tUb3pDrV1hL53yX66/DUnYUQTorGYugLfVSfeZD7Dclcfu+U2OkUZEsv80RqvC3LcBrKiighICGYd+qOqxPz+EonE9LheauyEssHvTESsu9Pq/YEah7SYbQwD4btLVqdJygXzsX5QlmwLiHBgVK9ctyV44hTfjJniOnU6i75b6s6ChUzQ7ZPHj5HUbfwM3ZZJbIDA80aO3N9zH/QyKcz4NrhkF/7aTo/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnZwsozoI3H87NtXzhxmoYVOIrhnbDSoIu2s+sHSEGQ=;
 b=eXf1HMSWunStALSWGknylR88NjtkuGUKmg2IzFCozE004tDTIaNNmG0DoAvnUpkSszLlMxkYe+Zzt8mAC6HpUIv9p63XH2ezR0cfVbrl/Y51F7/YC7Xs41MQFJRiNNpFJ1q1uvKvUKSN3OALX/bxQ2x3wAgHnAEx4lo2I+CRSygA+4l0Z2DqjfepLsySuEvGDg3NCFH/A/bVsWYkuiqWAV+hmPvm9cWtihB+LM+C1HDbbCowfvEKF9cQjTWB35eLabhsdGC/Y6Xc38hH2khYRAIjot6oCfvoRymOPumUHYAsml2fh9E1vCsFZikWASLHVPjHbL40+MlEVe8uSwYGnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnZwsozoI3H87NtXzhxmoYVOIrhnbDSoIu2s+sHSEGQ=;
 b=cpv5e8VhfKXwVKjftMoVJAHwmlLxbzTO9XkgZgFdGUtDRMDqrgAkGJK24C7PTkt+1IusAeojiGrk+PLadogfWjWPSwEysgsBL90t6sD3j5b0/d4x43ETQNwob2vr10pblrgA0mjOv0zTZFYgNAXi81MbbKFnFaYWf/RiiIluAFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI2PR04MB10642.eurprd04.prod.outlook.com (2603:10a6:800:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 16:09:49 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 16:09:49 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Tue, 18 Jun 2024 18:06:46 +0200
Subject: [PATCH v4 4/9] i2c: muxes: add support for mule i2c multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-dev-mule-i2c-mux-v4-4-5462d28354c8@cherry.de>
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
X-MS-Office365-Filtering-Correlation-Id: 3ebda858-c65e-4c4a-0c6d-08dc8fb11456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|7416011|376011|366013|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yi9YTkxNSU8rNlZ3aXAwZEJlTFBoWHlaRXJFZ1dxY3hzM20rUThSb1k4SjZY?=
 =?utf-8?B?c1NsYmVFUFlaWWhuVHowZVJWZndUYURqMnRld0xyc2cyWDQyVW8xL0FzQWgv?=
 =?utf-8?B?dVVMamxPNitEcjd2Q2EwQUt2OGpQTzVqMURHWFBsZzd3TGh3RCs5Y0hURVNs?=
 =?utf-8?B?YTJZek14Mlk4UG8wL0QvdGYzekszbVIwYk5tNTBubzdFTEpmYmV2QXNUdjB4?=
 =?utf-8?B?MnFpb2taQitvZ0VJSjBiSElEeWROOXRvdFREcmc4ZlFENzI2NGpoYW1RQ3du?=
 =?utf-8?B?T2xTTXpaWUJVTFRKNXBXQmZkRUMwTXFXL0wyc2liM0VwdmN3bmZRK1d4WVc0?=
 =?utf-8?B?Zm1yeEJrOTg5VmlHOTU3UGhQMmU3TTQveHh2V2UzZjBEeTJKQ29xV0NYUzlu?=
 =?utf-8?B?T0dsbVFSYXByNkJBOEhMc28xRDhtVnR0N2VDVmdyYWpId3h4ek1JMGVFTm5Q?=
 =?utf-8?B?TklYR0kvbFFlcUM4YWlPc0cveUlON09vUHIzU0w4QlpCb3JRK1FGcXM5U09Z?=
 =?utf-8?B?ZDg4elJRajRSZytFY0lxaHNRbDBJdlFjaEszd3RzRlJGd2V6bkpVVVA4T1Bh?=
 =?utf-8?B?anF2aFVuNk1MR1c3bmFnbEdsbTNxZWhkakREMlRkQnNYUzRWcFUxMWFCWXM3?=
 =?utf-8?B?UTh1TGliY2JkQXpLSUsxcGswQnErSEtpWGFWUTU5QWVQMGRNM2NkcVRnTWxT?=
 =?utf-8?B?UGZFNjViTnhJWk4xVG10SW5pdlVxdmdFTVQxbVlEU3JJYlU4NEEvNnY3MVhw?=
 =?utf-8?B?L3BPVFd4SndjTm9WUS9HTUZlcW45bVNJVnZseDhSa2Y1Y3ZMZzB0TUd2UVJl?=
 =?utf-8?B?M25namFnd2Jhc0ljNzhwalB5QmFsVDBnQ0NMaThhblhQMzhqRE00QnZWenpM?=
 =?utf-8?B?SWZrWkFYV3R0M1ByY3phZ3BLVXJMZ1daR2oxL1NOZkduYmVOVmRvTTI2ajVO?=
 =?utf-8?B?cUJKdHQzNnJJTHVxZUVzaEJuYXhvaWUxMHA1NUczRjlBV2FiNzBIVHZLR0hS?=
 =?utf-8?B?SUZDVmltOGtkNlVwYXJOYjVRVmdWMUYvYS9qdnovTGVrNjZhUUFiMUVKbVZk?=
 =?utf-8?B?bEZCbFppVGRYb2dVVTY0ejZOK2ZnVDVubW9aRko3c2h3dWt1SFFTbUZjS1o5?=
 =?utf-8?B?WmxwNzVYd3l1U1dKcGE3dnlpaWkxUU9mTjF2QXRiclR2SkExenl4OUJlcng4?=
 =?utf-8?B?MzFlTDZkb0habEdWZ1o5OWpvNXFjbDZFZmkvT2lxY1dyeHhnMWtJcXhCcllF?=
 =?utf-8?B?WjdOMVlTUzhwTExibi93UXlCL0V1K0tHTVZLYTVvL0ZDUEd6aWtQL1BqWnU5?=
 =?utf-8?B?L3hxdTV1L1RLY1l4VWhiK1Q5aTVWRVJ0YitrNzAyYW9tMThGY202ekYzTkE4?=
 =?utf-8?B?N2hUV0VLb2lkc1l2b2xhY1VrdHFzQVVWZldSNFp0R1FCeVRxV0xkS05aZTNU?=
 =?utf-8?B?c0ZqZXhXcEw0NVFzS2FFNHZTekh3Znh6aDI2Y1dCSGJVNnZGMkhtYU5Zc3BT?=
 =?utf-8?B?ZnhtVy9LekRBOERFSXBjK2g1QllsVW5meE1wMDdRQ1NuMFd6OWY2a1ZBNkc0?=
 =?utf-8?B?MThsQ2VGMitwWGpvUDd5SkJBbEtBUCtQSUdGc0U4TXlXbHVJb0gzYVo2dGhq?=
 =?utf-8?B?RFVnNHVGWWdNSHpTMUJGWjhQVEpyOWhCUHBaSTloRmYxY1R2UFp0aEh0S1ZB?=
 =?utf-8?B?dThTRmdkdmxDRFRHbThSZGNtQUNSSGx1cEs1TDY4azBnd1BMb2E5SVAzZ2kw?=
 =?utf-8?B?aXFnT014bVQrOHpJYWpQbVZiek9IY0lmS2phZG12NlBKY0haM2JZMmhCZFZW?=
 =?utf-8?B?ZVlhVEZsQ1A0czBwYnBaRnoyYlFoWlJXTzJ1Yy8yRzQyY1NVc2lsck9ORmJI?=
 =?utf-8?Q?CeBAStDr5zCBF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(7416011)(376011)(366013)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWtSVDU4dDd5aDdybkN5QW9zM21TK21wYVRYVWd4MWJNYjBBcktaaVUrM0x5?=
 =?utf-8?B?TEVWTmV4TmxjdmZBVkltZ25mK1lKL3lPRWhHYmdCOGpHT042UElYRkVKdzJt?=
 =?utf-8?B?b2diZUZONlRIT21mVm1SQk1kLy9yaEdqU0FOME9TZE95aXJsMWpxb25NYUJs?=
 =?utf-8?B?andnM2V2WlFsSU0vOUdnMWZaQ2JlRnhYSmsvUSs1MVJ4cmZtZy9zVG5USXJo?=
 =?utf-8?B?amNyK1ZxSTl4Y0QxRVRQWUs5SGE3Q3plaXJOZk9XNEcwVHltdTVGdjN1UGx5?=
 =?utf-8?B?NXBOb2JSZW05K2FwQkFkaTZQc3RLV1dZWG9lNTgxU2oxTjlXdlFZNDNhNTha?=
 =?utf-8?B?OTRPc29PaURUalZob05RaDhrQStNc2VUYWhpcTkydXBrT3dvWU9TTE5RUk8z?=
 =?utf-8?B?MmlFbTRZTGV5MlVHTDVWV01WR3M1SVI2aFVGaEdrSWh5Y3VteE9UZ1cvZzZ6?=
 =?utf-8?B?SlQ2bUtoWGdUalBSbmlrWFc0Z1dNVXZyYSsweWgxMkRJV3BJODRVeGw0UXpU?=
 =?utf-8?B?bk5ia2lxQkZxNkJJWTNmU1VDTjNrVCtaQUNxSTJLNlBDdllrWXhlYkw2QXlZ?=
 =?utf-8?B?UjlCRk1DRVE2MSt3WGYzVFVLQWhmSERndC90ZnNiS0R1RnBuZFlNZmxsUEVB?=
 =?utf-8?B?d1RUSCtkQnJjVWVUNEZTZHNMSEpGYjNsK3h6dGJzMllXQlFmWGw5YitxbTVa?=
 =?utf-8?B?TUxIV2lYSkpUNGVCZjdBd2gxWTZUWkdHaVI2cFBLeDlPakVQbjdEa1FQSStq?=
 =?utf-8?B?QmRaZ3A4NGZMZ0FZR1ZnQ0p6bzdmKzN5SGZXMEUxcy9wdS9uaCtUZjRwamlB?=
 =?utf-8?B?Tllnclo1NHVHV1dXYWsxMWRmSjkzZE1lbXE1NlZmNnBQaVd3Wm1aQWJ3aWNB?=
 =?utf-8?B?WVNvWkFOSDZrd1lqMktBY2lKYm9FNFNPZXFJUGtrbTQ1Sk1RY1J2aG1scWFN?=
 =?utf-8?B?ajlsNWlOOE91TnA5L2RUOHVCZ3dpZmFaQmhleExSUjU0TS9PeGZLRFNpVHo4?=
 =?utf-8?B?L0sxcFVvd0hzL1MzazVsTHVRUnRrNnBZOTZmTkdQTkkxeThvV2NsU1NCT09C?=
 =?utf-8?B?WmFoM3pCOGRTMk5xWjhmTHZzUDhDUk1ISVU2aXlvKy9FYmM3TUhyRUhYU0lX?=
 =?utf-8?B?aGZVRURERVFGTzFEZTF2d1ZreEJLNndUSm5BekhUUVBTN2wzWUhrSVZ2a29U?=
 =?utf-8?B?NVpqVUFDT2l1RWpIbEg2TWZCZXZYOVhnTVdXbmxKRDZVOGNFcldNNEQ0Zjl1?=
 =?utf-8?B?dFVoMDZVQ3Jqb1kzNzBhYmdhR25RM202SUtDTWhZVVpYUlBBWUFKYm02SDZo?=
 =?utf-8?B?Y01CeHlxMUZPa01MWk9UZjJ4d01jQS84bWY1blV4cG9YOHdHTk1ZaE5Wb29E?=
 =?utf-8?B?RnBBWFp2Y05tdE1MT0QwUGVaQ2JFWWU5VXVxZ05EZGFoSjcvazB0RTNiT0NK?=
 =?utf-8?B?aVBYRGNvWXUwQUdud252SUxhejljblc1QXpzaEVkVmkyNGdWajZlNTRaQnht?=
 =?utf-8?B?b0IzcExuSGsrK1RaMGJOYjBZMStIN3BlVm9PbUVWTE1pSmIveG5DalJZMmkx?=
 =?utf-8?B?Mm9idVBCTFl2VG5pQnloWXExYSs5YnZDOVVvVDNXekVDMmZYN04rcEFQTVZT?=
 =?utf-8?B?cXZ1Rm1tdjl4U1FteWliVzNqZGZ2T0R4dGliQWw0RXV4dTVHNU5XWmt0Y1Jj?=
 =?utf-8?B?VC8rVjRuQVgwNlRTeFV1UURSRzQzOHhJYXdoR1luZzlMRWtYZ3REeHdiK2E5?=
 =?utf-8?B?SzRqS25YNnRLV3ByKy9FRUZVbEFzRGxmYzBZZUV5SEMvblRSdVlEYzRFMUI5?=
 =?utf-8?B?UEZTMTA3azI4UEk5Sm1MZVV3RVdEQlBjSENUVm8ybVZMN1R2WFU3SFM2RWNt?=
 =?utf-8?B?ejY1STFldk9aYjJGcWdPYTNNRTNkeU5LOHppWlRieHhIdEhuc1Yrd2pHbmdi?=
 =?utf-8?B?WVJxRnRIb0RsVmdJV2dsNFE2eTY5OHgvRUdNbWRtREQwTFJZMU90Y05TWjBa?=
 =?utf-8?B?d2lZT3dOWEoxcVN3T0NwL2ZXeDN2SE10ekpxbUVRK3ZYMTc2ZHprTEpodWhq?=
 =?utf-8?B?TENVeXg4V0huNThNSkkrd1ZQeWMyclQxbHU3azlzbVBvNVlKeko5SFgwMysv?=
 =?utf-8?B?dWF5aHpucnF1NndLNFBWa2NjMUNqWExJcVU3SnVMZWFnajJ1SDRLcTZET2xR?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebda858-c65e-4c4a-0c6d-08dc8fb11456
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 16:09:49.4913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRanaumrjH8pvLayHXDVSt+FZOlIN+nRlGHSxxLYAIjAJQpoLMqHmagBmUe+8prOQ9Ok3fdISFBCEevXl0n21dZQUNvwT3G1Xp1/AZW2eq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10642

Mule is an MCU that emulates a set of I2C devices, among which devices
that are reachable through an I2C-mux. The devices on the mux can be
selected by writing the appropriate device number to an I2C config
register.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/muxes/Kconfig        |  17 +++++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 151 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..e535cd9ea712 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,21 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Mule I2C device multiplexer"
+	depends on OF
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  Mule is an MCU that emulates a set of I2C devices, among which devices
+	  that are reachable through an I2C-mux. The devices on the mux can be
+	  selected by writing the appropriate device number to an I2C config
+	  register.
+
+	  If you say yes to this option, support will be included for a
+	  Mule I2C device multiplexer. This driver provides access to
+	  I2C devices connected on the Mule I2C mux.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mule.
+
 endmenu
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 6d9d865e8518..4b24f49515a7 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
 obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
 obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
+obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
 obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
new file mode 100644
index 000000000000..530403adea50
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_CONFIG_REG  0xff
+#define MUX_DEFAULT_DEV 0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static inline int __mux_select(struct regmap *regmap, u32 dev)
+{
+	return regmap_write(regmap, MUX_CONFIG_REG, dev);
+}
+
+static int mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return __mux_select(mux->regmap, dev);
+}
+
+static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
+{
+	return mux_select(muxc, MUX_DEFAULT_DEV);
+}
+
+static void mux_remove(void *data)
+{
+	struct i2c_mux_core *muxc = data;
+
+	i2c_mux_del_adapters(muxc);
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+}
+
+static int mule_i2c_mux_probe(struct platform_device *pdev)
+{
+	struct device *mux_dev = &pdev->dev;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_client *client;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	int ndev, ret;
+	bool old_fw;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(mux_dev->of_node);
+	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
+
+	client = to_i2c_client(mux_dev->parent);
+
+	muxc = i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
+			     I2C_MUX_LOCKED, mux_select, mux_deselect);
+	if (!muxc)
+		return -ENOMEM;
+
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
+				     "No parent i2c register map\n");
+
+	platform_set_drvdata(pdev, muxc);
+
+	/*
+	 * MUX_DEFAULT_DEV is guaranteed to exist on all old and new mule fw.
+	 * mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mux_select(muxc, MUX_DEFAULT_DEV);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
+	if (ret)
+		return ret;
+
+	old_fw = (readback != MUX_DEFAULT_DEV);
+
+	ret = devm_add_action_or_reset(mux_dev, mux_remove, muxc);
+	if (ret)
+		return ret;
+
+	/* Create device adapters */
+	for_each_child_of_node(mux_dev->of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "No reg property found for %s\n",
+					     of_node_full_name(dev));
+
+		if (old_fw && reg != 0) {
+			dev_warn(mux_dev,
+				 "Mux is not supported, please update Mule FW\n");
+			continue;
+		}
+
+		ret = mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(mux_dev,
+				 "Device %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "Failed to add i2c mux adapter %d\n", reg);
+	}
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{.compatible = "tsd,mule-i2c-mux",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static struct platform_driver mule_i2c_mux_driver = {
+	.driver		= {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_platform_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
+MODULE_DESCRIPTION("I2C mux driver for Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


