Return-Path: <linux-i2c+bounces-14147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 12703C6A773
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 17:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA2184E6087
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2677132E13A;
	Tue, 18 Nov 2025 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ET3H+IAw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7612F39BF;
	Tue, 18 Nov 2025 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481498; cv=fail; b=UflZwQdMNz6zX3BGa/LLRC9HjwjClRMpz5baeFZpTr0PK85XVd1SxrgINpLNByhI0X9TocHregMWu7YWgZCDaJfi4dC4VDnkWQCNwudST+V5LChnvv4Qj9XEJMAH0jhJB+u7FJEYIRbSeDCynKROW/6kzpnzeEai/C9zURNNIBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481498; c=relaxed/simple;
	bh=6Awrr3juM4wPL+JQeNZhXAKosFtlztkBVyv56EjYXL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gL9ZjTWLxuBAt/Fw6fLeiEP44Iw3GcoUZnDFDzMWXaRC+A7Ivx3ReJPz79NKvr7YQW6FY1uUGKrdmaD6AuEJTFY5Y1QhGth+MNw7PGfITP0RtP07B5oHNL9jJhSc3C0WWHKRDOhS7OOzthu/bahwyvjdZnNtprg6zBknX6LyZM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ET3H+IAw; arc=fail smtp.client-ip=52.101.72.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojF9Gx+RqEj1/8GyWW5QMF2McGDkIr2+xK4qQDAL4HxkYVBUxWWttidlGCBdaDdRZg1iUHOrAVoRTeC6GCjbk+vxH6gxveEarAd2MvX320f239rQOFWLvOqjagzXgkRAwWKZGb6ZQrN279v/q+C8K4Ry09oOVqegL8r5xDGYCto3cxnWW4gwo9GDGZXEBeDhJsa/OtShCy0AkHbSXhBsPJEonPwpOcFzkXoWNI+W+YucFDFAYdqx28OfcyFZJ1duETvO2fso03gQyXdxfaocb/16B89BDYPgRvGF8pRyrGF0cB1zKvQjRFS6MuRnqasf/y7lDHLVcYpa1v/zn6vepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBwEkffcPX3jrHmRi8vTvgbsflhFXWdFKKqshviHmjM=;
 b=Bf89F0pABZAMII3CZ/pdMRAwBEGjPvUFeP91dAXB9zLB/S+8IlKX8VqVZKyzcuUD0R+svkhQZzD3sVNaWIg71XYYeFTUhxX1pUWRnMwN5ITcgkkEJ5D6QEPJH3PcOjX50dhhooE5TU6HwkAR2I+C4LdRQo2or70zP6E3XQkAw/8PXk+foueXejjCqcK1Ew1pXndcufD7CmmK50yNjE8hDOI56pIOhBKELEb1LG/zkh8gI4pAlIIhdbSHI/yVS+4/qX70+D9p8iHbg9Y4a7RCnB9Orgmz6dXf/oqvQN8Ssia9PJ6P9Szps+wVLf4he8sEpZVGo3kfKTfSbzPpEhhIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBwEkffcPX3jrHmRi8vTvgbsflhFXWdFKKqshviHmjM=;
 b=ET3H+IAwwKDS6+XbOgl+cdlZXTH0KFoD05UZREL1XntxluCxAe7nn5+VCN1CpK8OmpQtyNz46+stHhVyABSgfQ5mTXIGJUseC9nYMKFYC+NAEL/of6scrpMPxJgYwtdanBir87BH7cNpkfkwFoFLcXS1NbJInLOZGCj1/lusbAnSF6bQZ3CFT0UZFx449xVwigJ6xRf0ITTl741h2mHqmC9S4tKsG9RpyHMGxTmGswopTGlQDCTqD+j/IRG7BmLTbdH/le2P+kFe9EW9+yS7oYBg2bzpOpT9yj3Us54KyQBoiVGd+/Uo3W6czKW7BjD/guIzv+dmciKHrkLdP8GPtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PR3PR04MB7322.eurprd04.prod.outlook.com (2603:10a6:102:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 15:58:13 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 15:58:13 +0000
Date: Tue, 18 Nov 2025 10:58:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Message-ID: <aRyXjUF+x5BdK+uS@lizhi-Precision-Tower-5810>
References: <20251118071837.1419558-1-carlos.song@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251118071837.1419558-1-carlos.song@nxp.com>
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 1692fb37-a5b9-488c-7e18-08de26bb47b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qm1uUWlDTVVxVW1pbVVCeG5sM0UvM2VvZU9aRDFidjBORVJ0OStEQzNFQ1Ni?=
 =?utf-8?B?QkFpMWxJWWNyMCtwYU1nS2hoZ0o1MVRTZ01EYnpjY01QR2NUQ1c3VjJMUzFK?=
 =?utf-8?B?VEFXakJuZnVicHFJejkwbU8rYXZZMllFa0dEdFlSeDJleWlTWE8wb1gwZFYy?=
 =?utf-8?B?bDZPSENOajJ2NVVjZUNLeDMvdWpnOU54clFuWDE4enBaaXpTd3R6WFNaRXMz?=
 =?utf-8?B?NGpMNmFkeFdNS1IzdUF4c2IzNkxYUThzNmFVS01qcldnK2RQeCtWZkFhUVRL?=
 =?utf-8?B?bVRYcVlPeTZLM2MxRUFxS1BNUHN1b3NYZ1B0cllTQ0JKSTJXQU5pVC9nQWxI?=
 =?utf-8?B?M3ZYMXdQZFZ0cHpqcFhEOEtrelV6MFd3b0J6Z1o0dHU0YTJmSnV1UGlwODNu?=
 =?utf-8?B?Q0pvTVgzWFVPUnZ4bkJuVlNqcVc0S2dkOEpLM1RuZENsa1RtZGM1Zm9XUGQ4?=
 =?utf-8?B?eHMvb2o1WVhYMFVWTHhBMlJEU1hoL05FYUlqVTRpaXc2c2tVM1Rwa0I2TG8v?=
 =?utf-8?B?c0dhVFMxOUVBcURZRzF0ODhqc2xGcGR1R2ljM2lqNE1SanpnRlh0K1ZEOUFR?=
 =?utf-8?B?Z2FHeWJvZytoSU0rOXVaSkFpcmphb2wyK2FWQm9KdWdwOGtyanZ6S2hqRHV3?=
 =?utf-8?B?L2lnamtWRndYdEM0UFRsaHpGK0Zzd1JvS3lBSzZ0S1JlNG11SWZMVGZDdkR4?=
 =?utf-8?B?OU1sWjNMWFhGczZZM2xTc01oc3BIQ2pqeFJJV0F2QlJQWXlxTll2TFBHMGxp?=
 =?utf-8?B?blhCd1JRQmNQalZ6QWZoN2tVd2szQ1V3UGtoenV5WVZjdTdwV3dwbW91ODNl?=
 =?utf-8?B?dTduVlpiKzA2Ry9tRUsvYWVhRGZudDc4S0dXT2puSkZZdnEyYi9qRmwzcG5y?=
 =?utf-8?B?Ri91VzUrdkdEUFBBdUZ3dDFheTdqZXhneC82VEh5Ylh1d2ZjYUI5WTc0M3Q3?=
 =?utf-8?B?T2s2dlpHbnNTOGVZeXdpbktveGpmcmFmMzUyTW5QZHJiK0pmdFR1aXExK0JK?=
 =?utf-8?B?NUFrRzQ2LzhLYUo2S3k3S1NUNVRRUURZVGhMeWRrT1hiOWo0MitQeGJ0aWc5?=
 =?utf-8?B?Wkc4aVY3aDRKNUYxZ1NKQXdmRnJ6RThWTkd5RUdPR2FKQ1VLS2FrWTRFUjd1?=
 =?utf-8?B?SVFkcTNaSjI1SXVrZWJwOHRHVC9TWXV4QnIwUkNOa0xjcEZJNkJMMlhSb1BW?=
 =?utf-8?B?eUVSVHl4QmRQL3loYnY3a252aE5jMW5EZnoyakMxL0R4bStVcFVFZDVRQU1n?=
 =?utf-8?B?TWRpS3RkaDNJNmtRcElFR1daWDRTZzlMNmVFWTNvdmJHTWZrQi82Q3lLMEp6?=
 =?utf-8?B?eGZQMlFXWUgwcGZhV1JDdE5BUGxSdDJKRldyU1ZvZ253MWI4dmo0TmhORFV5?=
 =?utf-8?B?bzYzNDkwRmlyVVladjU4MGFCcW5ub0tvU1NsRVBvZkFIRTlua1c2dEN0Umdq?=
 =?utf-8?B?VXlvWnBCb3BKTEhCV05uYmtkMWVjRDM0UGpSbDhHN2JQOVkrWjBwaG1vM1p0?=
 =?utf-8?B?eUhPYTNOSmNWZjJ4S3ZPTEZWUHRCVXo5eTBBZnpFWmp0WWF0WkFjM3gyckNO?=
 =?utf-8?B?dEw3YWNDTkd1aC9YWmRPM1BtOG14aENtaUpvZGRxLy8rckxLZmg0aDRKdUR5?=
 =?utf-8?B?ZzBCU0todTl5Z3NoNFllbEVabUNPSmtDMnpFTE5pSk1Ud3dXK3RhNklyZXpy?=
 =?utf-8?B?a2JJQkZWZ3cycDRMU0dJcjJGU1FLQ2F5cEQ3QVB2eEVNQXEveVkzMEhTSHRE?=
 =?utf-8?B?N0xRd2hRS3JlYUdkUnM4TjdUV0UxdmUyaFl4aVVCd0NaQUhwbzBiRk54STUz?=
 =?utf-8?B?NkxZNUVCM095Y2k5ampqSUp1RW55TWRkRGIvTVB0RGN5QkttYVEwNkt2QnNj?=
 =?utf-8?B?MnVjYzNWQlZrY2xzTElnbko1MWxKZm1uclhOUk54NUhIMG5OaTdSallRWlFs?=
 =?utf-8?B?a1RxWlh0ZldTV2l0NVpONDE3ZG5uYWF1TnZWMVpjb2ZIbm8zYmwvZDRkL2tG?=
 =?utf-8?B?WHlTN2FDWWJPdDZ3V0JaUlZiR25nUEN1V0hhMmNBNER4bUROVjZ5WjRyL1JR?=
 =?utf-8?Q?fxnPV5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEJSR1kvbDVWVWlhK2pPd3l6SmNiOTFONWU2c211TVJLTjN5MHg4VDlpQTJq?=
 =?utf-8?B?R0dwNUlzemxHQ3kwWEhHMlhCSkRVTlpOaFpRUGtvUzlpVm9lV3labzg2UTgr?=
 =?utf-8?B?SS9JMEQ1eU9NNy8zaDl1MytqTEJlWXRIRzZsb0dUcGN4MkFqdi85QlVUanZ4?=
 =?utf-8?B?d3dMRHIyOW5WZmo0VVJ3eVR6SktmNnluUlBnNkM2c3BxZDMwaHRVWW54QTVE?=
 =?utf-8?B?RjlkVEtERW03eURXc2lnY3ZGQ01OREdmT0d3bWhtR0lDZlZaZGZuM0RJaXJl?=
 =?utf-8?B?c2hxMFM2STZvNzc5M01uSEhYOWIxeE56Ui9nRjRTTEoxbGpjZnRKVlRlL3pL?=
 =?utf-8?B?NDZoa2tKNUFDVmFGUzdobGhzNGtLL1pOU21nTGhBdkRuaGdkVldxMEhDYkM2?=
 =?utf-8?B?bkZWQjZrb0pTUzBEVUpIaDlSbjA5djQ4cGRwQ2E5alZwT1Axb0dDNVhBQjJh?=
 =?utf-8?B?ZGFOT1JORE1PRzVnSjVMNWdSRnJYWm1CajBXRUk3NXRjMVRiZERlRFdUZUNC?=
 =?utf-8?B?YXRTYmMzeUlDTUJKVHUxdFRtZ2EwZGNHbkZ2ZVB4bHFmeTk2bnRocm5NK0hq?=
 =?utf-8?B?NytEOG9xeitmSDF6a1lqWUM0TU5rSEdQc3oyWVhZT25XbVNaWGFsVER5QVNT?=
 =?utf-8?B?Qll6WWZReEMvUjNXckptbURQTXQ1MnIzYm5GMlpXKzd1dXZuT3BZekVFOXE1?=
 =?utf-8?B?YnpWQm1IWC9OcE9CeThlb1AwUHN6K1hEMnI0MzRvanp2bUNQMkdyaGc4ci9t?=
 =?utf-8?B?Lzd4NUliZm9OQzRVemYyQ1BjcndWRml4ekNIeTM0RlkybTNBdUZRNk5iTE9M?=
 =?utf-8?B?OGl4YklrTmY1RU9mZUJERzhHd1ZOR0x6Q3FWZkNzQXVXc3BDTE10bEFsQ2pW?=
 =?utf-8?B?UThKdTZBZUxjNjhmVUtabUtwb0I5cXE3VjV5YnhtMEsrdmdOQ1R4NmZINk16?=
 =?utf-8?B?bXhIUUZ2RWpVOUlTUzF4QjY4dnFGSExTZWpVRUVqZGp5bjl6VXE3VXgxd0dL?=
 =?utf-8?B?dG9UbzhIYjdTQVJFZ2tKSE9hQ09RYWljcVBQRHhpRWVMNE5jUjlOajk2QkZj?=
 =?utf-8?B?TWx2c2VGaTZHb3RhVWg2WGMzcnA3ZDM4NHp1cVJBNzZpbXE4bmdrL3F6c2hK?=
 =?utf-8?B?cmUrMGlWcjRzd05CNW53V3U2UG9IY0hBSXFJaHRsQXJVeHQrY2dRK0dpcXBw?=
 =?utf-8?B?LzVhNm5pc3pSN0RNdFo0UnNjL3ZLRmdLVWpTalQrcElLVzVTZmNwcWdHR1Fw?=
 =?utf-8?B?NGtVbmIwRVhxcnlDNVh5L1hldzNRZ2grY3JYNXloVENaL0N1ZHFBUW1VWVI5?=
 =?utf-8?B?bFZZMUFaZjZZQSs3U2IyMW0xWFQwOC9ET3k3eS9ZcnZ0enpBY25IRTBNZFpn?=
 =?utf-8?B?bm9VSGVoTHpiWTNqUVE1TkRLbnNFemJYZUMvSkowbFFZYnI1T3doVHBIQytj?=
 =?utf-8?B?NUlIN1F1U2NIbnpKMDVXZzlUNUZuc3ROTVFQMG4xQ1lPTW5ZVFM3SFMzUGJC?=
 =?utf-8?B?UkhYN3p6L3JucVcxUHFOWStpNnZPMURSYVYyclhxUlFCRks5UXQ0bjVVbUZ5?=
 =?utf-8?B?SlZwakhFTWY0UUdxUUN3REVqZnkvUWVUSHJYRWV3RU82YzYzQkRMWkFXWXAx?=
 =?utf-8?B?eGNZTUNFUks5aVJDelhCVHd5emx5b2w1WjN3UEswdGtVSTdZQ0Uybmx1dVhS?=
 =?utf-8?B?ZzVyS2dhdjVKVnpDTWZNUm1LcFZlblhlbllQblk2OEg3U1pzWjhmVzJTZ25z?=
 =?utf-8?B?NDdXVVpIcmlVMExwakZuUmJ2a0djNE04d0tSUk5ERUZIb0N6ZXJhMjBkSFA1?=
 =?utf-8?B?ejdIdkdnZnNnZU8xR3RwZitSQmhZNkpwUHkrK1ZQYjM3NWR5M2N2V2psanlo?=
 =?utf-8?B?YnRWNFhVYjMwRDNNMEVXb0licDJMSjZIeWtVMWR6bHk5RDhPN3VvbDBUMTlw?=
 =?utf-8?B?dlgwNlVIdW5sMXYrS01wemJyZ2U5c3JlYXNhWEtERVhDUXhFL3pqcmZFM2da?=
 =?utf-8?B?a0JaZFpoRDhmZmJQc3czU0tTWWFqK3djaW54czlPU2Vpa2JaOFN4b3NWbkdT?=
 =?utf-8?B?SlRlUDdkUko1ejRQUFJPNGo2NVJIRFVJMUpETXQyUldGSnpaNys0aDMzZWlG?=
 =?utf-8?Q?Dyt2SB9Og/x0+mx47KEpz7I/n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1692fb37-a5b9-488c-7e18-08de26bb47b4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:58:13.8286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXEjDhMVe/kR+H0GGbuPQ5AnXGES6nhDMOyrsJxz0bjP7Wlqy69+dTp9a91QtjKz19bUwAhXszzQ+ZKruFqczA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

On Tue, Nov 18, 2025 at 03:18:37PM +0800, Carlos Song wrote:
> If a system-wide suspend or resume transition is in progress. LPI2C should
> use PIO to transfer data not DMA to avoid issue caused by not ready DMA HW
> resource.

Currently there is no device link between the DMA engine and its DMA
consumer, which allows the DMA engine to suspend before the consumer.

To avoid this, switch to PIO mode instead of DMA during suspend/resume so
the transfer does not rely on the DMA engine’s state.

Notes: I suppose DMA engine suspend before LPI2C. Do you meet this or
other reason cause DMA HW resource ready.

Not sure if below
https://lore.kernel.org/dmaengine/20250912-v6-16-topic-dma-devlink-v1-0-4debc2fbf901@pengutronix.de/
can fix your problem.

Anyway, I think it is fine to use PIO at suspend to reduce dependence. But
we need know why DMA HW is not ready.

Frank

>
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 2a0962a0b441..5050e14a9919 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
>  	if (!lpi2c_imx->can_use_dma)
>  		return false;
>
> +	/*
> +	 * When system is in suspend process. LPI2C should use PIO to transfer data to
> +	 * avoid issue caused by not ready DMA HW resource.
> +	 */
> +	if (pm_suspend_in_progress())
> +		return false;
> +
>  	/*
>  	 * When the length of data is less than I2C_DMA_THRESHOLD,
>  	 * cpu mode is used directly to avoid low performance.
> --
> 2.34.1
>

