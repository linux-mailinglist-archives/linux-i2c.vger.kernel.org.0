Return-Path: <linux-i2c+bounces-3235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 428558B3D2E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E88A6282227
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A23D16DEC9;
	Fri, 26 Apr 2024 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="WdO9oFrU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2111.outbound.protection.outlook.com [40.107.6.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD6E16D4D5;
	Fri, 26 Apr 2024 16:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150242; cv=fail; b=sBavY7n4dudk/nwrxxr8oNkq/Bf3fl9xBhIVoY7Mym5SbZaSRBnU4PsmxA4fFOl7gxBEn8geLdWJ4tcIi2CDrmKxLPQ0U4z4/KM35vfBgDCdELpdoIrfgVRgE0RCLT/9i94yQUdemnaPqgUKRraC+L9EIAYFTYa8CMRPR3TnmCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150242; c=relaxed/simple;
	bh=pNeALKdiurSeFi2jOYfkd8RIL0dHK/xNMo+OynjozjI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=c5Ki3vR/0wRfz5jzk1nLmunodllhsI2uk+QTRoDqa2tPh3LoY5nrm5di4rqXIk+SVIwemOE93GdvZxqdGgGzqVahYI7iCtR9RxLEPn09+K12TqArwRbu2aOaOATT8+C/ZvzLDvMFgXZr/LghQ2s5ZhVhdzHZmurLvX6a5D8P2NQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=theobroma-systems.com; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=WdO9oFrU; arc=fail smtp.client-ip=40.107.6.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theobroma-systems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC0FGtYvnw+mO5urIZ7NBorltzvYaK63CFHAyy2zqiuom2W9nlO/C45H/6Ccx03Ox03msyJpFtRXPC1DNBjrTYsxv8+nGpapW5Dq7aOOZKhTaZ87CjKwvLjWzMzt2PpqhqXJRaz8uda2KbcA/0iKGhOjEozRV5/pwS/ku5DSRBrSIPA4kI/gVaoOKSr5zwTdKit6mGWddxdP99hGk04av6cxDiy1SdPML5CZm/klhcirAKWdS69Ke6N7pv5GMe21QWmhucbPt76ghWPEhQRm1HCD8a0GuRHYFKJfcpeopCP/rMsqG3WNU8IxsNT14lZevNq+fxasAqyZD82Z5kWT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSOxrfAk8esZpJgQFqQY0d2QAz9xQyNddfITsHJES/8=;
 b=Geo6AKh1s35DEDGAh3dL4ByyQkbEqdY9tDbc6ArlVs2Cv9rXm8Sh7Bcd7RTCroxora5b8BxstgtZGIzohV/kmkxOsPv2/onaVydKEjrXeKRsO+5m6QeF0ZsO3D5MG+TO2cFALTBOmrFGtbtlttiM378r02xizwvx8faOPx7B0DzBr7H2etiZu9kQudWt5YL/M+aN/iAT/aWYe0t/fyT9BdM6S739xUzJPbXJnJKkxcXGy6RDJvL98nh0nuyGE+qXYLNcfFGHl8/w+gOjOoXkUxcaPcOd2S2L+XXTzyULzXehFhDPL5liPgGIXerHsgzzNs0UsPs4dhMNOjTIEL636w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSOxrfAk8esZpJgQFqQY0d2QAz9xQyNddfITsHJES/8=;
 b=WdO9oFrUnfdW90ZMsJVq4R6fIJmW3cRguoDO4QJGc0Xl3siv4dnzQz1wKVOAUjOPnJy6QgnhJt4BHjLU+tlPaRe8ONn1XmCaHpfh5dbYxyLk8J7tt317yGQvoQGh+UxOg3+a5MZsm9EgkdhXZjAEbtAvwcbauvmi/dk2GCWUFYD75ytjpFmYYFNlHHp/dxBBT/1ruzOITyWjuQ7bwKSY6UR5j5VcxGs+V+3M6HLAIJhASFQTUa94xHPp32RWXUg2VWerMjLLbT8hz5eimz6IpVHxxQUneVwyf/yLQLWiscKXgYSv0P4Fj8Vjb4WOIHxolBfm0odTnRkX+g9R6XifZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:50:31 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:50:31 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Date: Fri, 26 Apr 2024 18:49:37 +0200
Subject: [PATCH 6/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 px30-ringneck
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-mule-i2c-mux-v1-6-045a482f6ffb@theobroma-systems.com>
References: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
In-Reply-To: <20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|VI0PR04MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4004ce-145d-4de5-e9ed-08dc6610fbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDRBZFNMSTBBcG9BNkZCRTNoOVI0bWJ0OFBJMm5BTlBnalVrYXhlSGNHb3Nz?=
 =?utf-8?B?MXY5SjQySmVOdzdWelZRRzFzR0IvNVlGbUZYQnBUd2ErV0xjR0N6UlN0aWQ3?=
 =?utf-8?B?QW1GYWdCVUFSZGU4QjBFNlphZlZlU00zaUJxaDB6K0FtMWR0eis2RWtFZ2k5?=
 =?utf-8?B?ZnpQYTAvYlBwbUc1a1VaOGxZNXVUWmZwZ0ZkZTFacVNGUlNIcDBPMmFlUW95?=
 =?utf-8?B?WVhYbE1RUkxHTEtVL1BIREVUMzJHRGcxTy9paHdKemROZUFiTFBKWEtKeEh0?=
 =?utf-8?B?bFFXcm5QNTJpWitoeFZ4cmh1Q3JnU0ducXJBaEQvK2UvOVh1L00zV2VCZGU1?=
 =?utf-8?B?enpQMDJEWmxKdnBuODRpSnZVaEdrMHFZRUpTYmsvM3BWZGJTRGpEbEVrWDZr?=
 =?utf-8?B?ek80Tk9XK2E2UFJ0T3FVR3Z1dncyZ0JNaGlUUGRWUGhKOUt2L21pY1dIeWxK?=
 =?utf-8?B?b0RWTWFFQnBqQktPZFdnaG4xS0xIQ3JqYnQxdFlWemk1VmEreDNFaUpPbTlm?=
 =?utf-8?B?MHJqdkdTWkR4ZVFnYWxDVG9uUVVodTZYdmxaSm5ZZUxBelZsbks0NlhQWUFx?=
 =?utf-8?B?QXI3clNDVGxWUkdpMjBBVzdMTktteFZCTGVkV1lEclZJK3U4b3JRQjNjOUhK?=
 =?utf-8?B?bXRjdlJmQjYvZGNkK1hjbXkydzlCS2tJR1VJWUp3MEFoZlJGWEFIMUJBTG84?=
 =?utf-8?B?cUdSaCt6OEtJTVdIRmJkVFlzd2xQMnJHSTdsVVZkN0hXdm4rTGNrcnBnZTFw?=
 =?utf-8?B?ZGNQM2lsYlZPRUZRMGgzLzhFNnNKMUJmNXRTcUJBNUVJaFl1TmpCOGpNTVJM?=
 =?utf-8?B?RzM5VSs1R1FiaHFiV3h2c3o4ZmZBRFFvaXRVZER1L3RNWEh3THV2Y3E5Ym9M?=
 =?utf-8?B?V3VRTFNDaVVjNm05YjNwN0pjL0cwSkRXbVpDejlER3hYSXh3UjJCTm14MEh5?=
 =?utf-8?B?VytCYkZFVm0rMzVCZnlnMHBiNFBrM3VwSUV2MWF5UUR1TjVZTHpIeWwwSTFy?=
 =?utf-8?B?UkFFTU5RZmN4T21SQWZlUFBEQTZZN1ZZTTIrR0xhbDdKOEdUaHZ2cVRtaHNN?=
 =?utf-8?B?R25odmEyRVU0RVo0dElKZldvNEdWL3VLdFpKRllHTklDS3FLY0NXTm84dCtG?=
 =?utf-8?B?Y0F6Uk4zSWVvUkRxaVlsekxtZHV3TmJOVE9LMjRjSHNrUDVscWpCNjlFZjZT?=
 =?utf-8?B?eEJRZDVDZDU5d0Jua0xFU3dPZjVZdCttdE1JTzhYZUNqVXNlSm9JNU5zbG1X?=
 =?utf-8?B?YTIvR1FERHNjcStJNGNGams4M1BjTUhETlArWGxJK3pPejVPR1llMDRKT2tk?=
 =?utf-8?B?Z0Q0b0N3WmU1elUwaEJBSFlVSlhBckF0bFg3QlFidWZucDRtSC9OdlppQTZo?=
 =?utf-8?B?eVIxQ3pZT0c3N1J0STlFMStOOGRqajU4MlA0Ylk3b3JOQ21Fa1JjKytVVUVq?=
 =?utf-8?B?b3ByNm8ySGYxLytvbXhad0VqVldBUjdURjladGxrOTV1N0c2dEFrQVNycmVu?=
 =?utf-8?B?bDdZSGhpQ2VqSU9pdmZ0c1BkSVVla3lodFdleUdNaUxOTHJlV1ZPRGk3ZHRL?=
 =?utf-8?B?N2VyM1FiQ3p0bWJzMzdRODFwM1YxNHpycHozbTRXdTZ2L3dIMWpQQ25Melg0?=
 =?utf-8?B?K0JkckRpNm5oUEZHN1pCcGZxMmV1TjVTL1lQUVJBNllDNlczamVNbDBtaHVz?=
 =?utf-8?B?alZRYTlWcklCcE0vV0tudVE0Tm9Pa0hBeVp0SkxLTnpENUpwOVhUL0MzZFdy?=
 =?utf-8?B?NjJpREtTRllCaiszbFJBeDltemFaM1ZaelNKM1FIMlF3YVNmaFNqLzEybEhN?=
 =?utf-8?B?dStqSE1KdGVzdWRyaHFzdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(7416005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0NkR05YMzRPNnZOUldyUERranJ1SHAvWm1rVkluSlF5RGxhSGRTZTMyc0Vm?=
 =?utf-8?B?NzVrWHdXNEJzVldNYS9iVzgrTzAwdVp1dmlYUGdHODZuMzZQNStaYlFuc0t4?=
 =?utf-8?B?ZUJmdml3K0NFYUlUeVVkMzBkOWdZdHpyd1Q3OEJIa1BTeUtqTFRRVXYvMmtU?=
 =?utf-8?B?c1NhSllraEtzL3dNbGtJWUNnaHlCcGtTZS9WdlQ3Z0JyYmRtYm8yQ3NKelUz?=
 =?utf-8?B?N2dOd2RFdmdJcDNMMDcrd3NFWjlzMmRHN1NOQ2JCYjNlbjdWeGsvOXlxaU1L?=
 =?utf-8?B?cXN3MkVHaFhQNTQxUmFHTlBvQlh5a0J3NXo2K01DM0ovdkxUY1Vla2FSTHAx?=
 =?utf-8?B?TzlmbFVsZmVZU3VCOFhtVTJBbmsrZlQxNnJ0bEh6OXZ2NjJtcW1nWmE5RXBJ?=
 =?utf-8?B?MjhaSHhvM1poL0l4THBxVVRIYkVSRlJ1Yzk2SUZ0Uk9MZFJvK0t0NTFhOXht?=
 =?utf-8?B?SFJEY21Wanh4UC92MEhoT1gzQWFBMVJWLzBndkF3UnZ3cFFPSHNTNUdlUG1p?=
 =?utf-8?B?QXk1U3A2TC9WV2tUb3pBbi8rTVpVNXIvTkhaT2Qwb2hOUDB0Y3Nqd01CQXhI?=
 =?utf-8?B?SVFkVFJqQW5wUFBUbzRGUmg5ZE9pdWJKRFo4ajNNa3duZnQ5Y3JJY1BKYkpw?=
 =?utf-8?B?T2FBa28wSW1mU3ZTVlNRQXpvZUNvNDlCUlYxUFdkQm0wQ0hyS3ljWnNyZXVo?=
 =?utf-8?B?Z05FUkJFWFdHUHlOSmNNcXlod29oTEN5OTFwRkFPdUhmU1lvYlFQL0h2SERs?=
 =?utf-8?B?UEZGVUYwUVM2TUZDRVdNeEVXS0pzeXVXZlA0cU9GTkZ3NDJ0TENDUG9LVExr?=
 =?utf-8?B?eDlGTlBtL2tjSElINFc0dnY3b1VxT1dUQmdVeGlqeE9RM2UwL0Flem9xRmVL?=
 =?utf-8?B?WEpjd001cnRlQXlXZWk4QTJMT0FkZUJab3R3UHZ1T1Nyb1gzT1UxZXZFU2Q4?=
 =?utf-8?B?YTA4NFo5RDNha2NINXRybEpEOFBUL3psOVRHd1pHRDNvRU4xWW54VjhIRTZ3?=
 =?utf-8?B?b2hEbkdHSy9uaGwrSkpUTkNCbFZBa3N4bDRacGRXWGMydjdQc1E2SGRkVTlM?=
 =?utf-8?B?RlJ2R2Z5N1hUbStpWGpzRjU3cTBTWTFYU0NxdnBJV1FSSDdueERyczNGZzdM?=
 =?utf-8?B?L2ZKNHcxZW1MbFgrbXNJMkFJRmdTUTFnMUtnYjNzV3g3WExFckpsa1pldnFm?=
 =?utf-8?B?cCttTE9JM3hVMTZJRUhFRzlrdVQzU0UwVEtuVW1tVE02OTdaa2NOZFZpMWNa?=
 =?utf-8?B?WUxIbnZEM1lMV2hlWWVXdzBkVW5oR3VHbFlZNHp2QUJDTWdZZXl2c2w4Y2o4?=
 =?utf-8?B?dUJoSFBISTZXdXhxbitHdm9PNEpiejdWUUxxU0s0YmNUOGRTM2tQY0xlYk1F?=
 =?utf-8?B?VGNvNzRWaFE5eVB0dzQreExSY1RqQXV4aTNobnNNMFlVd3c3R1R1UlVzd0JZ?=
 =?utf-8?B?bzJaNGtaSkxwc1YvZUo1N1FYN1RYU1d3YXdXNUM4MndwV0t0b1lKYkR1RDVD?=
 =?utf-8?B?Z2Q5Q3lYZ2VsTFBjT2hRRTNxbys1UEluclNRcXZuRlRsYjdpU0NSZFZqenV1?=
 =?utf-8?B?YnpVejY2d0prTUs0UkRoU2JnR0l1SFFTeGVabGVBN1BQMnFjb3NodmVvd2I4?=
 =?utf-8?B?UmkrL3l1V3BEMVJnamJjSGd5eGRLN3c5VlFQbEtCOWQ5SUQrVzdTdEU0VG1v?=
 =?utf-8?B?RTZ4RlhQdVpic08rajdZY09jaWFLVzhQdWRaamNWNTBwTlVBaTR2aCtORmZa?=
 =?utf-8?B?TTljSmh2eW9XSkpqQWZqekJ4VFhDSGRmV2dNbUFyZW5xWDJYOTROd05TcFRW?=
 =?utf-8?B?cncxQThva1o5UWcvc1pFZHpwTFNFKzJEWXRXejdNajBtNVJXbzcvVWp3MkJX?=
 =?utf-8?B?Lytad3FFdnc4MTdtb0FDTVNGVTVRVkhGZGZTelo0K3NhQnNTckFpb2syMFMw?=
 =?utf-8?B?RWNIQUJRZEJxdGk1QW9LQ0ZBWURSazlITVFuM1NDdy9MVGNGV1BwdHhXMFpH?=
 =?utf-8?B?bksxSnMvZUFhSGc3ak5nRFg5QXpmdkgwSnZtSkdnTVNUUkNocEIxOWs1bHpi?=
 =?utf-8?B?RFNiMGhLTzBPT0F6dDlWRm9Bd2pjMlNkWldON0I5T0JHMUdwYzA4YzhiQ0NF?=
 =?utf-8?B?bDZPaWpRcmk1eVhuTGc5Qi80TVdJc0xGWExUYVVVWDV3WklNSDdXVk8zYVIv?=
 =?utf-8?Q?73LzZEAld0S4ic4aASijXLw=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4004ce-145d-4de5-e9ed-08dc6610fbe3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:50:31.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FSG/iBB8k97NUM06cFJhjjSQ8jiz/oT0kk7kaRksI3TTeO4ySKZJuDO+v3C0zi5HO314pGebVr99+spj7LBsAqmDWZBBaaCJgfUJJPwpK/Mf98TModBY/lZAXO9Xuta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

Mule emulates an i2c mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index bb1aea82e666..eea906379983 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -9,6 +9,7 @@
 
 / {
 	aliases {
+		i2c10 = &i2c10;
 		mmc0 = &emmc;
 		mmc1 = &sdio;
 		rtc0 = &rtc_twi;
@@ -291,10 +292,23 @@ &i2c1 {
 	/* SE05x is limited to Fast Mode */
 	clock-frequency = <400000>;
 
-	fan: fan@18 {
-		compatible = "ti,amc6821";
+	i2c-mux@18 {
+		compatible = "tsd,mule-i2c-mux";
 		reg = <0x18>;
-		#cooling-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c10: i2c@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fan: fan@18 {
+				compatible = "ti,amc6821";
+				reg = <0x18>;
+				#cooling-cells = <2>;
+			};
+		};
 	};
 
 	rtc_twi: rtc@6f {

-- 
2.34.1


