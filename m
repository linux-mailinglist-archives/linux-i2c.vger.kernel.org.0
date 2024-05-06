Return-Path: <linux-i2c+bounces-3427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9008BCDC6
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 14:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22EE1F2523C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 12:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAC5143C4E;
	Mon,  6 May 2024 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="cVrJqxsc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2102.outbound.protection.outlook.com [40.107.13.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10182143897;
	Mon,  6 May 2024 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998265; cv=fail; b=Wb15w6a+BUksm46oEqMky4nqizO99HqSORJrQ6GCb/UxpKq4QTQvtJaCccIUSakVSdpUb8c2dCIvH1O6Z8eiyYsv/5rhtqphWyCAHu2PdM45ID/je0QL1HAk869NZMlK22H4wHQqmmbQ4by+lJGKp71Wzck9jczsabYF6Z+sUSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998265; c=relaxed/simple;
	bh=WO8NgWw1ZQ1CcmVR3OWPZTBaEpyYT6ZvIlT2acaWCL4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Myk9Q7QOlh5JS2OWgGT8l37ptE+rECVu0cOzeUtCPYOponDRwbtWUwsACnWGHrKeL+NDrveaGXTroHvD5Mw/yngKw2U2BjJy2ybNFS0fCttu835YsJ9pkmPaW4A8qjtKwLfrdQ7pEpVwxkSXLhRhPikhJf6dC3tia7JHD/+fAv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=cVrJqxsc; arc=fail smtp.client-ip=40.107.13.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DojoPtFl78ku7u99G1WAMoE8Es7hsWWn7g8ek9e/lBjPptdwfqjOzj/WMpUI6oUWI/a/650ZZoLEq8V3NfLCeENtVV7EXIGNd4r5WFFVSgbJWdd2I823OKoreAVZr8QAythmlVgvzWT6ywK9vuvaxlt7rBsqtYXGxIHIMDXkm3jujWHMM5UZ+10MM2YMZ7OKqVP+diMkH1Bi2dX20dbRYyugQE1UUSFki/GA8Mgf2EphPBfOp7DcxJI0CzoxmomG6BmRqPESuOm/oBa1DNRUfBzdmxi7KIRJ4U5iIalZI8Cg2Avtdty+RFfMF9Xj+GwfLTZjzyxJmo4QBTFWrub7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eUlbnPoN8w40E8M/dxF7d7o4jPw4X51BB6bfigs7Y0=;
 b=hmOCV+xGcWA8Tuq2Ur3Fww1XvcPj7DOnNPCQZUGP+K/+szRxka1OViXlhcFyaJCtJwIfiQ5ASLUWy+RlsF5FM5a16ZIRdXddik40nkAj8ulslKA318hOl+0yFCGHGeso1oCuAR3kLR9vWifvnHeXmrWT+KtaG27UxhwDpnz61DvwtCvDIyRYlGNWF8AE3DGQF2nprJu1TT1Z+6j8H44k9QF9uoGdnAxf0t9UTYR0APg9hTCNL0JyrcriZYhIe+cbU9bgM2mKmlSlxtGj6FhAgTObACxASzDQEveneU/4jWwzk9GFJADtzeKYiwI+TTQJpEjl7dJ0GgrwcMQ7mWYOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eUlbnPoN8w40E8M/dxF7d7o4jPw4X51BB6bfigs7Y0=;
 b=cVrJqxscNhPfptoFomSKoOfainQj3jwvCP4Ya1GgpkNBFHg51ofTjt2gVXBuq4qUGjOHxShgHQzoOnRXvooBAU0dXYJGhwlaSoLbCip5Y5aB5NH0bR4bB89yEdGHkpAAjos9mbhbUDJxNaUnQlJsqmi0B1uSY2S/i+axJ7YtpKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:24:17 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7544.029; Mon, 6 May 2024
 12:24:15 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Subject: [PATCH v2 0/7] Add Mule I2C multiplexer support
Date: Mon, 06 May 2024 13:37:51 +0200
Message-Id: <20240506-dev-mule-i2c-mux-v2-0-a91c954f65d7@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/BOGYC/2WNyw6CMBBFf4XM2jHtiPhY+R+GBZSpNLHUdLCBE
 P7dStyZ2dxzk3tmAeHoWOBaLBA5OXFhyEC7AkzfDA9G12UGUlSqfNhxQv9+5p5MDhNetDqYjtV
 JkYY8e0W2btqU9zpz72QMcd4+JP1tfzKq/mVJo0JVHpvyTLaytr2NPYc2Bt+gzDKyl70JHup1X
 T9r0Qv9vAAAAA==
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.13.0
X-ClientProxiedBy: VI1PR0102CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::44) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|AS8PR04MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a500abb-9885-41ab-7c3a-08dc6dc77155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|1800799015|52116005|376005|921011|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aC9lQVJuM3c4bkJFVnIwZTI3NExtQmw2ODZJajNOVFRzVGRka05KRDNERkpN?=
 =?utf-8?B?eXQ0YVJLMm03a0xwQVM4dVBBdzhDSStxNUVxQW1UUlVXQzkwMXpRbWZTOGw2?=
 =?utf-8?B?b0lwcndhYXFLc3Y4VlJmTWV5eVlHdWRycVVrdFdibVpSdi8wNUc5QkJXZ2xX?=
 =?utf-8?B?WHZpbGkySndsblFidmVzMzJ3RHBxdzhUOGVBVTFKVkg2N01GWit0ZUw0b3di?=
 =?utf-8?B?Qm0xSDZTRkd6UVVaMmwzSjJsSzBhdUU1eE10T2dnbG80SWtDNXh6TE91MTZ6?=
 =?utf-8?B?elE0bWZCMXlKanppeCtJRFpkdHVvdHhvL1lzWFA4aGlJUjhPMzRwa3N1cEJU?=
 =?utf-8?B?eWRxaUN5c1l1aFJ5ZXlUclZFM0lxb0tQWDc0RFN2clVvQjBxdHpzVHlyNzlL?=
 =?utf-8?B?Y0thRzkyYW5oMU5ITTJud1BMVUdaVkp0WFl2TkdUamR3L0NBN21MTlBoMjJx?=
 =?utf-8?B?M2EwSXBoODZmS0VVa3F1RkJsdWF4TndwWnB0TUVyUlVobW8yd2tpcWpYZ3FW?=
 =?utf-8?B?UExkRHY2M3VzaE8rdDJRSXlKUEZ2Mm0vZXZCcC9zeENqRFkyQjhRTjhMQ3dy?=
 =?utf-8?B?UlVrMjUzNmxCd29JN3BtVWJVd2FTeGtEeE1ub1lqZ2FucjJHNlMvcEw2VFNS?=
 =?utf-8?B?Q0RCYlJkVmxqRzFtZGY5TUJrTUkwZXZSZzZVeVdNVDlTcFRtdkIxclZqQnoz?=
 =?utf-8?B?NnRFU2oySkQwUGR0TzN6b1hUNTluMkRvMU4zc2V2STN5WlRvVTVQKzlxK2VS?=
 =?utf-8?B?ck1laER2aXpwdVVEVnRIbG5GdHJNSzEzNlQvWE5DcEc5TUl6cjQ0aklPKzVl?=
 =?utf-8?B?QTYwK3RVUnBHWEd1NzFVNTV4bEZ1NTVPUUVrSG1jR3FOeFVid1ltbmRrU0lS?=
 =?utf-8?B?ZmVWbUZGSVo5SzhZcDhDV09ONUh0WGxoT3lrenpuNlBwbVVGQjd3WG5iK2ZG?=
 =?utf-8?B?L1crRGdwRGJOdzlQVHdEQVJJbDl2Ry96NnR4ZHlOREFJNEhvQVFaWDluTjA2?=
 =?utf-8?B?VFlOMFN3a3VlWGhqTlgwOG5Rd1VuQmhGNDR0dnZYK0NRdy9hdFpEb05Xd2Zo?=
 =?utf-8?B?clNrTVBZcWxMcVZDM3M2cUZZcGtWTGR2Q3Nza1NhbjlxZUpIRDM3akZtNWlM?=
 =?utf-8?B?MnBlbUZVTGxhNlNwdzgrODJVZlA5Z1Rub0JTZnFnalJUejA3SDF0U0FKaFFF?=
 =?utf-8?B?Ti9KUElFeUQwdjhKYS9HM2pkQytkODMyMDdXWWR5blZYdWV1SFB6Tnh0eE5N?=
 =?utf-8?B?ZDRWLzMyazE0dUZWTm1qc1pCanp4SVRyemdOUnFtUjRwNnloZEdBaFZxSXB5?=
 =?utf-8?B?eXB4bktpaXczTElzWTk4UW82OFEvTTBJVStzNjJPenFlUjFTVkYrTEpMc0ZQ?=
 =?utf-8?B?bjNXeEpQb05TdVZrOVNKR0xxSXltT2RxODRidTFOQnVmZDVBanVuS2VUMStz?=
 =?utf-8?B?K0V1ZzdnaVBjeVBVUkh1SFoycGYzckVNMnUybUZUUVQ4UVRUTGFWNGpCZHlp?=
 =?utf-8?B?NDJPRVNiRGJvbWdRd1FLUHMzL1VuZlBZbmY4MEZHMDByWHd4QlhhS1RqenpN?=
 =?utf-8?B?RzBGZ0JhWW5jRGFwUUV5enovV0ZYcDVXQndtTnhUN2E1eEhERFV5aHJxMDJ1?=
 =?utf-8?B?eTNWSDVhSmdXRk1keFo4cUJ4N0Y5akRnTmx4dTVadzkrT3lwNDlOSDJ6MEFB?=
 =?utf-8?B?azhaNytCTDR5NFUyaUtDWS82aDBsNzRnaEhOOWtId1d5SGN3S1FMSkkxMWEx?=
 =?utf-8?B?K1o0bnY0VDRON0VjdGwrT0VZMDlzcDNkSEhZTU9McmNjditDdXJvTzRxYUlW?=
 =?utf-8?Q?JnFiLoHU941uEXE/UK5eKIlpUbQG0HhzVUhpY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(52116005)(376005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2syWEFVck9oOW84amhTL091QXgwNzcwbUI4dXZmc2J3S1pPemE4NktXN0tN?=
 =?utf-8?B?TG1uZ3poeCsxOEhwZE84VTNVODh2REZmbkdMcklCMnd5UW54dGdoS0hrN1hG?=
 =?utf-8?B?VGUvSWNMdmpyZ0pSSjRmOFN4RmNJTGZlOFV5MmhWaisrYXIydnR4c0tHdXdh?=
 =?utf-8?B?NFVMVXVCZGprNVBVRTdCNE9GRUNFaWd4aERrMWVRcU8zSHB1Q3g2a2pjZFRO?=
 =?utf-8?B?RjYxUk5RTFpLYmtNd1JYNUlwYlpHWGhEelBwY0YwYjFpSWEzNTVQUGplKzN1?=
 =?utf-8?B?Y1NSYmRRdHVoSlFiaU5aSjBSZE5wc3NWb3lvVzBENjRLQ0pxRjZ4Um0waWdt?=
 =?utf-8?B?eWlOMU9MZzFDcnpFc0J2aWlaS1ArQnN5TjBJMVRINXN1bXRpZkdLZjN6YXBz?=
 =?utf-8?B?YUthdXlkelNSazRtUXRDNlhUQ25QU3VjbzNndlllcDFKVmFIcXEzV0lUbkVJ?=
 =?utf-8?B?dVNrSC85c0hCYUJleDNXOThGNVR3ODZEWERoUXJpRjdSdmNKb29NQWc5eFFS?=
 =?utf-8?B?emtoWEpqamgrUzlWWkNoVlZ2MGpKZnE3TVNpQXFrRDFxT1lZaE9JbXN5bkkr?=
 =?utf-8?B?WGFDZCszcFIyZDFKK2x2R0EzODljS2E1aHNueXNPdVdDNkdqL3ZSUlkzZDJh?=
 =?utf-8?B?RHNQUWNWWmxEeUcrb0hIeDExcHlQTnI3UkQ1Y0RacFFaanZJL1pTaVhLdTFN?=
 =?utf-8?B?dmQzMXFJRVBJdDNteFJxeUszem9hY2F4U1FCNXc0WmZlYk44aFBIc0hvTHhx?=
 =?utf-8?B?MTV0RzBEd2s0a0VETjYxcGh6ZUNtaGtOb3hBY256K0F6TDErZ1YrR2htZFds?=
 =?utf-8?B?UmNESUJuVnBrVXlvRmhOZy9BTW1GV0hLc2N5cURKL3JmNlUrZGZ5WU10cnlE?=
 =?utf-8?B?SndxalphdjN2MXgrZkQzbFlDNUZ0MWZ0TmVQTFBkMmkvV01mV1lvNHFhVDdn?=
 =?utf-8?B?N0RQQjExTXZESE5MaWtweE1QUllkRFAxanhqU0tMWFFBVU9HaWV1Z0h5Rm1M?=
 =?utf-8?B?bWo1Y2FhWnlPZTVERGM0eTdWUzRrVVFyMGlQdUtmaUtDZTJjMmFJcTBwa1VV?=
 =?utf-8?B?TzZJYWpyaVVOZnhJNTgvZUNMenNJUTczc3FOQTBmT2kzT0dsUmt0cXZYTUpv?=
 =?utf-8?B?eG1Fem96V0tTSWdkR2RBc1Bxczc2ZlZDWkx3NzRLQ21OMU5RZTJMVDBvbTV2?=
 =?utf-8?B?Z3J6WFFOcjJGZ0VQakpmVHUrY1FhSWpLWXZNQ0dTdHpyaE1kdWt5UVI5Unpu?=
 =?utf-8?B?TW1OTllyUG1ZRWVhZHNFOWpUTXVhenhTMi9yaE1sK2FtQVg2cWVHSUxxN0Zu?=
 =?utf-8?B?cldxRjk1K0tJNXRSd3JTSWp2cU05cVVFNktVQ0twTFRuRjVGZGRqcXV1WkUx?=
 =?utf-8?B?TnVPdHdGa1VRRjlnL0VlNmZJZmZEZTV3WHNoWnF4TU15WDB6Z1NRNFZtVGMx?=
 =?utf-8?B?akROeXJta2JYUExkQjJXUWo5NG1YRWVUMG1MOThWYzdTcm91K3M3WWlwb20w?=
 =?utf-8?B?bGtlME5TQXZ6ZDdBVEdmNHpuTE1LZHV3MDhQTlZNSFVXVjZwOHVsMEFYWWNB?=
 =?utf-8?B?TXlab0g0eUF0MldXQ1VOVkZNdjhQdy9DSm9EdnhWWG44cWxMVWZnMUlzNmZq?=
 =?utf-8?B?Y1pkbDZVcU5WRzVINm1LSXJaWWpkcXVEeTR0cFBOUkIrK3kyZmQ1bng4RTN4?=
 =?utf-8?B?QndLMTl3U0FTLzdzaFpEd3ZNbk1wa3ZWWWkveTlyVS8vSDlmVHRDaUxlZlNn?=
 =?utf-8?B?RGdzbFJHRkQ1d0F3Q0Fjb2g1NmliSzFNYnVJRjc3Y3hKNC94dTMyYTlOaUNE?=
 =?utf-8?B?WjRwMGcwRyt1V1BNQUc2M3oyS2F4aDhpTFNGWlI5NWEra1NqM1Z3YTNseXBl?=
 =?utf-8?B?aFFqV3FkQVVrNlZUWG91NFNMeURTYlplMW9JcFRwd1RBTzNKMCs0M01mRWNP?=
 =?utf-8?B?VkkyUHJKemFEc0JUb05LcUk3bHFmZTN3eW1KVHRaTDRWUldMcUFHdTNzcjFx?=
 =?utf-8?B?MzNNL3RvOFJ5dTc5TmRuUWhzUFFFb0R1dnNRNmNiM0llQ29QaDdkK3lMUlBN?=
 =?utf-8?B?Wk5WS0hyVVJ3R1A1K3VLN25IRUVuU1QzS2tWbVNkU3J1RzR6SVdqR04wU2RQ?=
 =?utf-8?B?M3JPTVY3V0pHTDZRVGRBcXk5U2hCZmJYK1hyRGJ1cWc2dkhZVTZDVkpoZnNL?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a500abb-9885-41ab-7c3a-08dc6dc77155
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 12:24:15.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VeMBjK/v9rhofRl92gg/yJhGCKWJnYKCLBjBip9LtGOQWHQJj/5SIsD+94YqSEgMrnU4HVrEoIcHlTNOeUe7NFnEPCupJGpAgRyjhiZEt2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512

Mule is an mcu that emulates a set of i2c devices which are reachable
through an i2c-mux.

The emulated devices share a single i2c address with the mux core itself
where the requested register is what determines which logic is executed
(muxing logic or device logic):

1- The devices on the mux core can be selected (muxing functionality) by
writing the appropriate device number to an i2c config register (0xff)
that is not used by any device logic.

2- Any access to a register other than the config register will be
handled by the previously selected device.

      +-------------------------------------------------------+
      |  Mule                                                 |
      |        +---------------+                              |
    ----+-(1)->|Config register|-----+                        |
      | |      +---------------+     |                        |
      | |                            V_                       |
      | |                            |  \          +--------+ |
      | |                            |   \-------->| dev #0 | |
      | |                            |   |         +--------+ |
      | |                            | M |-------->| dev #1 | |
      | +-----------(2)------------->| U |         +--------+ |
      |                              | X |-------->| dev #2 | |
      |                              |   |         +--------+ |
      |                              |   /-------->| dev #3 | |
      |                              |__/          +--------+ |
      +-------------------------------------------------------+

The current i2c-mux implementation does not allow the mux core to use the
i2c address of a child device. As a workaround, A new i2c-adapter quirk is
introduced to skip the check for conflict between a child device and the
mux core i2c address when adding the child device.

This patch-series adds support for this multiplexer. Mule is integrated
as part of rk3399-puma, px30-ringneck, rk3588-tiger and rk3588-jaguar
boards.

To: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Peter Rosin <peda@axentia.se>
To: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Heiko Stuebner <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Changes in v2:
- Add i2c-adapter quirks to skip checking for conflict between the mux core
  and a child device address.
- Rename dt-binding to "tsd,mule-i2c-mux.yaml"
- Add Mule description to kconfig
- Fix indentation
- Move device table after probe

- Link to v1: https://lore.kernel.org/r/20240426-dev-mule-i2c-mux-v1-0-045a482f6ffb@theobroma-systems.com

---
Farouk Bouabid (7):
      i2c: mux: add the ability to share mux core address with child nodes
      dt-bindings: i2c: mux: mule: add dt-bindings for mule i2c multiplexer
      i2c: muxes: add support for mule i2c multiplexer
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3399-puma
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-tiger
      arm64: dts: rockchip: add mule i2c mux (0x18) on px30-ringneck
      arm64: dts: rockchip: add mule i2c mux (0x18) on rk3588-jaguar

 .../devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  |  80 +++++++++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |  20 ++-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  20 ++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  19 ++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  19 ++-
 drivers/i2c/i2c-core-base.c                        |   6 +-
 drivers/i2c/i2c-mux.c                              |  25 +++-
 drivers/i2c/muxes/Kconfig                          |  18 +++
 drivers/i2c/muxes/Makefile                         |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c                   | 157 +++++++++++++++++++++
 include/linux/i2c-mux.h                            |   1 +
 include/linux/i2c.h                                |   7 +
 12 files changed, 361 insertions(+), 12 deletions(-)
---
base-commit: 23918f4e52d072b96a4d909e91298b8dd6ad4325
change-id: 20240404-dev-mule-i2c-mux-9103cde07021

Best regards,
-- 
Farouk Bouabid <farouk.bouabid@cherry.de>


