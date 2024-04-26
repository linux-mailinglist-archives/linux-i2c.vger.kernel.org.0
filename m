Return-Path: <linux-i2c+bounces-3233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE28B3D29
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 18:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A0D61C22876
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 16:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6BF168AEA;
	Fri, 26 Apr 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b="Yxxup9gJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2111.outbound.protection.outlook.com [40.107.6.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85615ECF6;
	Fri, 26 Apr 2024 16:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714150239; cv=fail; b=lpx4bm3nkZpZtONCwITnBaqDxkMN2baCVYBEmrxk33j/Nwadpt8x22SuScaPXupZfshaTJWMNWKRA+yhTP3xC40e/Sdi0519bY5fm3Wdqv6sUd5iBn5NJyHnQm4OU8Bps5H3jzVsSOENjuHYG4xcNZWjy5mrT87E9tYqv9tpJyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714150239; c=relaxed/simple;
	bh=SIbH7VWYou0Rmp8WTz126ZvnKU4l/JR6hUeaPrza5qI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h43wU3CzkD+M+5xhCZM9mEZRzHcrtbY8+F+X7e+AntxOfdCUSjyXPly6AQustg/uV97VsOUWaj7dpNnujbBxwXmLzd6XPzk4l/v/qzkOGMkPspI/WGBpXoGV1n0VBcHceOrHJ92dKCfPKDri6Co7KXcVmVSKX5ruI95EHAjIPls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com; spf=pass smtp.mailfrom=theobroma-systems.com; dkim=pass (2048-bit key) header.d=theobroma-systems.com header.i=@theobroma-systems.com header.b=Yxxup9gJ; arc=fail smtp.client-ip=40.107.6.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theobroma-systems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theobroma-systems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DU4ftIo91daBlzHVJFA56euaAquCq50XGDSskRncSH53vzJg5X8reSXCmYF3I5tfgLE86eoZQ2/nVK2eXPn9zy40HXZXsVP097PyoyEGfWJZQn7naRa1Lv9+ufku4VvYz4X6gf+MZAnV8RXaQsRz+t2WidAiFQneHpLzbKAV7ycNAC1n6BIsx/z9vVLSJgQropxxzQRTNh1+tXx2Rt58HxD2FjDQjKhRnKSxPdDlKfyrM5z+D1S3F0/Was53DN0ya036cfegQneOvMBhD6lGiuzZ9N3s3RI0sku8cyrfFDVwg5R8vy2phoIwUU/IybThB+Imgfur4ekEsRpMZOMVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oRT6bHEb9rMmvzVNQAdfABwzPzcqwjzZRzXFe/1ffw=;
 b=A+pbKGbINzAxmKFIHXbriEWH8n4mNZu/WlcyPn/4lqgf3VFAyugKoA0CDXpuR3oh4KcGfA/uwM9GW+jgyXy+bXY7ZmVKGAk0vy+5GddjmXPkMMTO/g64ax5/NDbJo3rstM06++bwcuVVUSNMRnkA5Gzgizgyd952QomB3oZ7r8OGnwDasypYrXDYWaz5IoK99tc8ZkGjKxNMRlW4JC9QdSnQoUpU1hjCllpHwM984fDANT6OHNo2Y6uurlJjsF7ceiM5zsFBKkeAKIxkYg1sAnKKl/cCNTK5eeO/6RGJrXxK7cm5afmUnU+MOf/a8ckpgR49jDBjkQpCa0SgkFdDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oRT6bHEb9rMmvzVNQAdfABwzPzcqwjzZRzXFe/1ffw=;
 b=Yxxup9gJnRCuJ1WaZqEFbL9QqkZXUGpNMrysfbuHcygzNSoP8jJW8ghQCHde5geHu7wMvg71KRKJprDlNYCG8DTSfW9IZQ2DqxdZU8UB5x306nAvxixbL06JxPXTopg/AmQv4wUQ3n4a0FIDDPT1FvOMFPM13xw+xxylQ5wdzqQMBP8t91uu4Sjigv6VvfU9uGJbdZZPL3h6aGlr3fiRxy3f8bvQO3ewCi4Sf9JcfneBbzocbfMLmlZuvRy5BFOjt7c0mNv2Y94/W7MRgih5ao3vCH55wf8WeRf+4Pa45rFyDjEIFgTze6QI7AL3JSRF7Y3v2GuAMswNnqkequ/wVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by VI0PR04MB10230.eurprd04.prod.outlook.com (2603:10a6:800:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:50:29 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::59d9:878d:65f0:3936%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:50:29 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
Date: Fri, 26 Apr 2024 18:49:35 +0200
Subject: [PATCH 4/7] arm64: dts: rockchip: add mule i2c mux (0x18) on
 rk3399-puma
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-mule-i2c-mux-v1-4-045a482f6ffb@theobroma-systems.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8969828b-ecb6-4721-b5aa-08dc6610fac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0pjMHhkY2U4aFdmRG94VndoUzk3TC9LR1JwWHNENVN4cmllakpNbllkd3B0?=
 =?utf-8?B?eDJwdXZYNHA5YTdia3c3US96WjRhRVIzWkJDTXRoM1I1c2FEWGNyZzlBaWdX?=
 =?utf-8?B?QWFKYTl0QTZaZTRiMVpqY0dlWFlRV3BOUTh5c1NRdXRLSEZkYWtkVjc1MkRM?=
 =?utf-8?B?V3R3NjlaTnJDd0JNL21sUlhWaUlhZkpwZDlyOUNuNnJtcXlHTE44bVhNanJx?=
 =?utf-8?B?LzFNZ0hkd2N6ZlMwME9zZ25iSTdWczRPZG8vZ3NjZ3JCYmYreHBvbGVOU0lY?=
 =?utf-8?B?Tnd3ZksvNUUrVkU0Vm5Wb2xqKzNlM2JPbVdQdmMva3kzdFhJUkNhT0ZmTWlL?=
 =?utf-8?B?SW03WTh1Nk1vMTZKMlp6dytPUmhkOU1FSFdYeFdJQVVCenRPcHhycDQzN0tl?=
 =?utf-8?B?ekd4YmQ3b3crT083VmFra1lpRGl2b3YxV29jUFdXNVpQUDNMYTBZNHAwU1Ry?=
 =?utf-8?B?TUxFSEtrRE5YMHNwclpldVpXdnZyTmxsMVV2RVUwNFB1a3ZKTzdlaVdHclBy?=
 =?utf-8?B?cXZlbXpqZ0gzVVpGdlhOUURDekZMcU43STM4KzVNQnorekVIb1JpVDV5Smh5?=
 =?utf-8?B?M09ROCtyOVhuMVB1enB6SnFNdWxXYjU4ZEMybDdQK2pFSGxiSlJiL3JYWERs?=
 =?utf-8?B?Ym1TYmN6ZlB2bWJhWGNYcVlkZytOMWxmc0NCME9YVHBxK0dIUHRnTHlwZFFw?=
 =?utf-8?B?TzZBWWZaelpmVzZWc0tjM0x6TUk2L1pVT25VRmtGSm9PNFdKSzdjNlVxaWpJ?=
 =?utf-8?B?bDliNnpGUnh5OUMycjRac0ZCSnZSdE5hVnpWaHY3SzJVUjhES1JkeDRMWGxU?=
 =?utf-8?B?TGxUT0w3TWVFT1RQMDFlSklCYUZ4UUFCQk9aU21Gei9vbGRtVVlKeXZiN0xi?=
 =?utf-8?B?bnBnTERaRjlQKzRDMDU4RFdKYnlnL0paY2VONTRVUjkyS2Y0cXU5T2Fia2JE?=
 =?utf-8?B?aU40WmtqenltKzB2USs0bjNGQkpJRXhQWDJ6NmV0Zk9JZjRLQmpub2UrSy9t?=
 =?utf-8?B?MDcveHQ0eTUvRFRncXJ1bEwxbWhMb2k1S1lRZ1JKZ0xzTWlucnVyblMxUTg5?=
 =?utf-8?B?bWJKZGJBREdod1VrU1FJdGtNOGpHMnFzMnZzbkVYN2tPanpJa0hxQUo0NG5z?=
 =?utf-8?B?NUZhUHZjcnhhMVVhUUlMQjVzOHZhNXNBa1U2Z0NvdW1hcVdMTXQyd0I2ZFpm?=
 =?utf-8?B?YU93Q2FHeTVzaDk5a0ppWS9xSFh1clhwZnhnd3M1dFl1Z1UxWTMrNVFEaTlF?=
 =?utf-8?B?dy8vclFpSGZEVkNHWDUxbStzakpMeGxpWWhtdUFVT0lKYUd2bGRLcEV2eE1a?=
 =?utf-8?B?Y0FkNUdSdHFUUGNFUVJtVGdXN3ZIYkhTYWl5V2RZUmpVbU1uS29hQVJrMGxL?=
 =?utf-8?B?MXRnTlhmSFIxU1ZRdjJScGVGTlBuMHprblZ0cThxMWRUZHdSTFQ0OEg5aGFD?=
 =?utf-8?B?d1diS25yUWZyZ2NKaGE5aUJhS2NRZEtmdWFvdXd4T2hHRFBCMFNGNXBvOWk0?=
 =?utf-8?B?MHduNlA5MFc3UXFmV1lYeElTRkdIWmV4Yy9KaVFpSVJZQTNRRmhPdUVwdHZu?=
 =?utf-8?B?YzRibWxlS0VudzJ0VFpvMjRvbzlxRlRySldOS2thTkFTUElCdmhMRUhMcTJX?=
 =?utf-8?B?elVtemxjQUJsNDMyeXJraDJZN2YvdWY2VTNKOUhWUVpDZDU3dEQyVGxzWmd4?=
 =?utf-8?B?RHlWMnJGM3hKajlFcHZyOElXOFA1ZTUxdkVVbkxtdlI3Y1grZCt6WWRUY0Ro?=
 =?utf-8?B?dlFKaDZvUHZzUkFHbWRDR2hKYmVKK01xOWt3dHA4NHlEcTd2bDNGS0ozQ1Bx?=
 =?utf-8?B?UWFoTGt1NUdvUUZhamc0QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(7416005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1NETi9kN3VIeW50bllVTVZmRDlOSTFoNHhmenFzVzRIbU11b3FjbDZ3VjFj?=
 =?utf-8?B?ZTdpMXhvVXZBL0N3LytuT05LcGdVZnlaZUIzMW9ZZ1hEaElxem9Bb3ZoN3RI?=
 =?utf-8?B?NXdhYWFpMG5Fd0JYblRlK1lpcytjVjlmZDNzUVhMRzJGa3FTeDVLWkF1MWU1?=
 =?utf-8?B?S2dXc2cvMTlRdjNwRXIwNGxiaVMzc2tHMkRqU0N5ZlVIZmlvV2VqeWdsWEJ2?=
 =?utf-8?B?OGc0MHJPU2ZPUHNWRENGVU9ENzVXaTd3UjdpREcrMHp6T3VuV0tjanpjcXk0?=
 =?utf-8?B?WnIvMndmaC9FZTkzOXQ0MXc1Qkk1ZDBrVGY1SkJlSTZ6K2lmdFg0ZzNZSEVV?=
 =?utf-8?B?MC93cVhRVFdZZENQN1RkNFBMZUZEU29LckpRc0RLSnZYenVnSEZ4VERUaWNn?=
 =?utf-8?B?SDRmTUtGZkE3cE1qSHl4U1owNm5JOUdESlFyakFXWUdGczJtVHJ4aTRPREQy?=
 =?utf-8?B?MW43M2xMUCt6ZjVmeXhOelVvZDBaNTZHREg3ZVRLMEdTTHJwRXpnbXluUCt4?=
 =?utf-8?B?NmhQZHlaMEo5SS9NWXQ3cG5XT0xHVXJwa2QySXdmTDhRMUtPMzdscEhPRlph?=
 =?utf-8?B?c1g4b01iaHY4cWxoMmlFT2JiUVVIeE5SdE1iTWNZM2pPTHB3bjhrTzV5aEx0?=
 =?utf-8?B?OGk0aUxiamtHTkxMeHYxc2F6Z3N6L3BJeDhWZk9oMmNlQ1c3Um1XbE9CMnAr?=
 =?utf-8?B?OUdEOWxsYThrRjBzQ0wva3h2L1hWeFRodkc3NDJCL3k4UDVldERaa0g5MHE4?=
 =?utf-8?B?RWVKd0t6RnYvZDE0RTFRNFUwT3pZZ3lTUWRKa0krd3ByYW1lMk1vMVNacERB?=
 =?utf-8?B?YWVSdmtRd3hQNWRWMi9qN2wzNVJJUmVFUk4yS2ZIbGV1YTFzcWlISklwZ0hR?=
 =?utf-8?B?MWxYRkQ3Wk5jMkN3SWtCUGNNZ1FDa09lQzJPc1B5RzZYVC9Rb0g0UU0wSnVM?=
 =?utf-8?B?Vklmay8vS0xZZU52N1h3aFpPamhxNmtYWE5DZjZiUThVbTRvTWdsalJ4UG53?=
 =?utf-8?B?dG95TGdoVisveTFhVm1na2tPdUgyYzAzbVpJY1czZkVBVGJNQU93cC8weGdO?=
 =?utf-8?B?N1JTSUFzdjhSZDlHZjhrR1JteWtycEhkbWtOUjRueFRpdExDbFcwSGdGWm52?=
 =?utf-8?B?dHJvcUtXSXFHY2VFMzFTaGdYYjZMZzY4RlljS2k0amQrR0pUKzE3RHpBL3JJ?=
 =?utf-8?B?dHJOQnZtSUo0MXdJUlJjY0VESllBcmxCY2Y1UVFMeW5rbjV0MkpIa1JCN1dH?=
 =?utf-8?B?MWc5emZkUUVENm5WYnRxa3FpN25ZbUd4NC9vRndwNXEvR0JiUG4yUGpnYVUy?=
 =?utf-8?B?a280YnA4RnhhYlBkcHdFV2JDQ25jbDYyQXF1WnhraUlwdi9zUGllNWloTkZJ?=
 =?utf-8?B?UjI0UFBDelNoaXp5aXphdnNhNkliZCtYSFNjbERtVEU1WHNXV1JBNWZFb1dE?=
 =?utf-8?B?MUlaNXlkVWdWVWJrRG8zNVVlSDdZeVE5OXNDWXBkS1FZVWJSSnpYcUgyTE1K?=
 =?utf-8?B?OHIvSGdTTUdtT2NESWIwSHJwQ0lwclMxNTNhbkltM2RkNWRiSE8zYm5VWGdU?=
 =?utf-8?B?aTVwdlNvNUR6M2p5b0dZeVVFTDhDUVlJeU5xbDAzeGtkVjk2Um4vTFdTUGZI?=
 =?utf-8?B?Q05sS0dibzNNSHdJdStic0QrNS9Nc0tHc09zQXBsNW42SmRVclpiL2lKbFFm?=
 =?utf-8?B?enFUQ0F0OHZnS3MvMmU1OCtCZkV5MUp4bGVMbWhLK1RyMWpsdElTOVdaeTVt?=
 =?utf-8?B?TkpaanoyL2Y2Uzl0ZHNJSU9CMmt6TE1tR0tncFpQTnVlWmpJU3ZDVG9ua2xl?=
 =?utf-8?B?RVJBZ2ZXUFFSZERZcEhVTjBLWDgyQ0N0Zk1pWGJBM2VaQ3hSVGZzZTQzQk1W?=
 =?utf-8?B?RjZoR05jeFBvdEFmMTdZamxEVDFFTVF0TEt2UEJKbUMrajRwS3Y5anAzQzNr?=
 =?utf-8?B?djZwSExXUjFjNTJwN3FFVzhiMUs3SEwxQmpGRjNneGpBZDlZQU9CQnE4SmRm?=
 =?utf-8?B?d3NJa2taWmVSSjhHRzZYTk9NbXViR3YrMXJWMG5oRm42YjdlWmUzOTBmYlU1?=
 =?utf-8?B?b2Y2RU9CYWh2WC9oRmVzbWQxdDRJZGpJOG1ZMHFCVGJlMDE2aXF5TU5GZ3Zj?=
 =?utf-8?B?c1hieE16a1NIc0F0Wm9DVkZRTGtSeFNUWmUxV211V0lweFRSdWc3Lys4bW0v?=
 =?utf-8?Q?7OW/gmZ4dUWH0CheVAxw/yY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8969828b-ecb6-4721-b5aa-08dc6610fac7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:50:29.3699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr6wYiSKJNSAELW9kyYyA/smD7pz5N6lHzP1ZxUKHQDPyUh6vxHVD5nmsWQK2HNsqd9877KKGVC/EH+TNg5HCsxdXrSyo1Nop/dKxczT01KLQKRl6mQbjsWqJFdo1RCK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10230

Mule emulates an i2c mux (address 0x18). The amc6821 is exposed behind
this bus.

Add the mux node and amc6821 as a default device.

Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index c08e69391c01..e7313be24c1a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -10,6 +10,7 @@
 / {
 	aliases {
 		ethernet0 = &gmac;
+		i2c10 = &i2c10;
 		mmc0 = &sdhci;
 	};
 
@@ -357,10 +358,23 @@ &i2c7 {
 	status = "okay";
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


