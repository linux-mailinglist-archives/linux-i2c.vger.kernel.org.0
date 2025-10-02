Return-Path: <linux-i2c+bounces-13370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740DBB544A
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 22:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 350F54E59D8
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 20:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE7729BDB5;
	Thu,  2 Oct 2025 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c6B6uhNB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFD299947;
	Thu,  2 Oct 2025 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438304; cv=fail; b=eHZvbZ1zubXJ28cPsslFqY3GqLY5vn1X5zg7suji6qnHXG2Qt0AJNaDFAHhAYoPE8qp5wlwch6hvfoi5ZtfybD6KIdhD0ygQv/+7f0bcZ9c7aIklkSlJXvJEU847/eP5BPgpnbat2NZhhA9c9v0EKEj6QQVK4/hw26ODXLhkzOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438304; c=relaxed/simple;
	bh=FnkE3IuBO18ljL1nwxnb2PapTBoHU1InTpCJtKQ3pE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PqhBESyAtZoAPKfAwp8XUfVr1JOUohASoNILnP7gl0HUNiLmPHlbUYC0dvEj7/vvhZxrRbQyoekxHr8FYQqPe2oMyje10Y0FX3pWq79X5Ud8opY+hdDgaguxc09ZAT63fEqjni+SMB9aDrfeq+sJl6I2vHgUqdzvrwi/ObR2lBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c6B6uhNB reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwBQHAp4/iWBH5/Lxzfm0PIUw5FPleEg56jNoN6mnr98Kz9K/9upv3QFLFHtis+ykHH4QV8ZrGALAVJf9xJpMqTNW3idOKIg5N7J1T5pHmTZ4qsZRvXKXINA87lu4DmuYBcLmrxIQCSCrqRz9ynLvxtugaufDStBftlEDtdbhIJ4Xi5IsjnGX//zSudO0iyP7Oz7xIDKl9lwxtGb2UkeVmy3IA+6Jpy8BPl4wOwrLwmRRGaJCCrpbyZbvmWjg+r3V4dMSTpSj75MXnDohheclDyTQ4gFUTH9OOS7InAfqE8k+0FSThfsItmA0OYLuK6eZaQs77U2mz4K7pZGk4Qv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bod8yl58FGT1BFaAGl8bd+XbceFopBBUhtEMnRJO0KE=;
 b=PouWn1CxieigTi4FeTntwZIa1EvzYBWTNTF/lD2KX7yyapWxaR17Icnz83b3fSQILHd97JL6sJWdTgwsIJ0ovLlaE3B40myyTHnyAOjB9PjwejZyAW2v/iONldz59dnpw1oL7ZauWYdPqIVXepHLS9PJQI1uF67CUzsjKZGKnaSoIqn4+zeEjZv3dPg78l7lPHRc86C92g/mBM+AdqakmIiiXt4cC0uAGJjMQPpvD5rdrwN0KC4X7Js3fIqV+kB9HXxiovEZAWHOcLn4RI+uB9YiDlXYKWzNaWi5Ti1Q2kPlzf0Ntwc4jiaJaG5kEmfiDlEhwoZoz5HtI9t3Z5Lxyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bod8yl58FGT1BFaAGl8bd+XbceFopBBUhtEMnRJO0KE=;
 b=c6B6uhNBiA8B7/oQA0vreTidi15oU9IEFYCK4pivDiC63sbtupbDIvpJjM94n8rMIzvUlq1AkBEoQo3OkcvvO0PHWb4KNhY0t8Zd+rCfXUe532u/N4f72serq9OEKjWutE4Yh6hWu1Z/77PwjovyG5QDZ3BQCqfM8suyt98ftmksWIDpL5ILKNhOVUU3QtZceLdI7JejfpTcX/pj8E0+g788HT8jhHFvOF/jiUDnS/Dnx41LVuGkixD3J08uA87w7JlCDVt6uAdrEN4YZwhbk8doVzdrPY3KEAq55xZ5Umx89jYaczsDoRihL7s2Vu5GXskbLdkKSBfzvNigr50bcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.13; Thu, 2 Oct
 2025 20:51:38 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Thu, 2 Oct 2025
 20:51:38 +0000
Date: Thu, 2 Oct 2025 16:51:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	carlos.song@nxp.com
Subject: Re: [PATCH 2/2] i2c: lpi2c: Use cleanup helper for
 dma_async_tx_descriptor error handling
Message-ID: <aN7l0MYFQ7AUlD7P@lizhi-Precision-Tower-5810>
References: <20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com>
 <20251002-dma_chan_free-v1-2-4dbf116c2b19@nxp.com>
 <3c07c2f0-d069-46d1-b2a6-e2c071198cb6@wanadoo.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c07c2f0-d069-46d1-b2a6-e2c071198cb6@wanadoo.fr>
X-ClientProxiedBy: PH7P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::20) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 95397ad8-17b1-49c6-91cf-08de01f57ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?+cjyKyVi1hjxd+yxIcaQ8EMq4CB5oBVMHiPi35ctxUDogqwFQcRR/Ks9FY?=
 =?iso-8859-1?Q?HWhecLbLuY9pOrlFvt4hspzXkvscmMaqAio8g2iyhDEPVe8i05XmmGuqZs?=
 =?iso-8859-1?Q?5MEGXDa2DG2TkORsC0lgBYwEHzeYumTDuVNHfGvb+CY/DiFdPhf4hUkMUk?=
 =?iso-8859-1?Q?yAJGA7gSxRfw5k9kMBFhuuecwn5RcSIVgcFm+2/o2/JH2EqimeH+dGqm/a?=
 =?iso-8859-1?Q?E1HAAozCPe3CsGhTaur2GFUIYYqZnXvd4tEXMXJOm4kgn+ZDxsQyg+m4iu?=
 =?iso-8859-1?Q?fZW2rC71Z4gtRexo0HTPVeb5h6pwIqA4NwMhr7yVKA1YqDtWi5OOvxt7Ke?=
 =?iso-8859-1?Q?3IcD0Koxi8upnNu/egfJ9Dt3EZTC9C8T5orJfFeY13jGL5IWnFNQy3gim7?=
 =?iso-8859-1?Q?UHYEMZYRpdaDAu6dYkOmg12UJximbGqfWeOZMXMcrHthK2gkz7XisXb5SA?=
 =?iso-8859-1?Q?Ovs8tAjS9sl44rq6/8rxTqsG4DkfEP3mNYvEo6IMmsbqrQOqjz+ZSFU5SX?=
 =?iso-8859-1?Q?aAdTDQzC3HAuvQpSDR2bkimKiJ2xsX/qF70Sp5TaYLy2W01ZAhk4ThmHyp?=
 =?iso-8859-1?Q?jUjwAhFOEDBoAJECuqinXkWr4kXzuBmgHfh/Ln2+eU0Q54FN0jLY/492tR?=
 =?iso-8859-1?Q?i33JVKwChUD0MeEM/XSfQRvXTmnqYIzGm0aO7XlOPnpFI2bUQgYTc7jOz1?=
 =?iso-8859-1?Q?M7xV68ywD78c4kXMKsWewHYZc6vn9c2Z4KNfuYjUUxHCN8nOttqhC/0Cnv?=
 =?iso-8859-1?Q?GjOzXYjQz8emT/hSk+6i2sPpA0GnFottSBNEVS1P/ETl5NDk9behPwrYy0?=
 =?iso-8859-1?Q?pHCo+mMmiYV16KSPjuUIl1G3iV/IxZdO63/WVfRm15aM5fTObmfzbwjIKN?=
 =?iso-8859-1?Q?ZBfnsgiLXT8N5uaPswTau6AdAZIr1W1WxXLrHldJKU/E/RQaxTD8pT55gr?=
 =?iso-8859-1?Q?slGpNBixbSrDzEHDCqqAqKWIvbRQmQEiSWMCi+QfTuJEM8heRBRQoEAlAz?=
 =?iso-8859-1?Q?AWgGSJUZP2vld8kzlQb5BpvaMu/KFTl8dW4fbAUEGdgYrhusCuUiZ7SXt7?=
 =?iso-8859-1?Q?9Bq2jK9V/xh2D1MA/Hs+v12m9gIFZuUVTuRvBXREIz76jGWNddltrA9FcE?=
 =?iso-8859-1?Q?uB1k9l0PujzPYuq5Lnzrxubr69pF3KQacDUhFNyNuusl6E8e7BtCvg/DIu?=
 =?iso-8859-1?Q?3PlvTmMJe07OhUWgZf4+SHJu6OnYX0oNa07z1zt4d/iWgbqxZ3ljY8xtw8?=
 =?iso-8859-1?Q?GZeVZfFnzmSYzK+pCHmuCV+XnIaOWk1m3qrH/XhNAQUzrpVz/D3Wf08uwq?=
 =?iso-8859-1?Q?h+STD+jb4KjEIk/4msR9lzecu2kj8e8brTYJC+UI3n3reylrpKBCKBVGBM?=
 =?iso-8859-1?Q?1K7uvWdKXN66l9/aXRU/JX1F0lBDyZk7iIw85qTUdcMBtpQPbtmZXcH3/N?=
 =?iso-8859-1?Q?UZIvP+fI2NNJaWgY/MojfJ8yKckl5bYYdcZCUtej9Re9JtGfV6tEnZ8wrk?=
 =?iso-8859-1?Q?6lMiG1BsDUwPjfPq8vZgItnzriEOfVNA0pabQmAempZwRNea3mtMpBpV4W?=
 =?iso-8859-1?Q?UZ9aaUNhHIqg39icqVeoPDmnNEDA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?UE/Ynr8+vkGVMEe/D61RfvI5g/mqRSzSpkFAhkQwvHji1g3kkv3uIOyNpr?=
 =?iso-8859-1?Q?TavyVDoylJ7F+qi9SYOGKMo4YycxQh/DhMEUDKFS4gxJNyEDmFPKLeG3tA?=
 =?iso-8859-1?Q?x7JMsCfwqtrrN2p1cQuTyxguD+I8GUJMIulq6rw4Oo6IGfOHN0QI4l8KIH?=
 =?iso-8859-1?Q?07KC5mhdPFEUrhvpXjkncVFUkokOjBstHDBdz+qkM0MRWk/RFsmtHo8RhE?=
 =?iso-8859-1?Q?bSnwH65ye3o8pDcGSERUSlWWGfNshDV5sV0lhsv22anSYC7Mw4JrZ5TwdV?=
 =?iso-8859-1?Q?4Qjks46GnQKhinMQyD91C1kLfbNH3oIKDx8LTKDBFE9A+o+zQqtAUwPhqv?=
 =?iso-8859-1?Q?uYdqMW+8150IcuoN4/B4o1BxSawrQXshZQ27R4QUi/sFh+fO8ZLxXfUNlO?=
 =?iso-8859-1?Q?v1F9C/mOyhDYFwBgNmq7z+3EjD/IbSvTbzLqQXiPKRktWRyUZkNaYtNuTI?=
 =?iso-8859-1?Q?oJc9CyJGtkFzE7Kcy3gsWc1KOQ/hRMr5gpLKJv7nnkxAQ9iyVeVelZUZwN?=
 =?iso-8859-1?Q?q0uvGTgLv1mVlvjn95qBKh72uoaTykzZHQL5b2wiwzwbEwlWrEfKylr3vK?=
 =?iso-8859-1?Q?1BEea+Ka2jLleobFna7M8Nt2ve5TqPw5zechMUoHVLZatZ03PNn/gcUSjq?=
 =?iso-8859-1?Q?RlY2gKlFwvN4Bma7N242lWg6WPFcsMnMpdWC3sORsOc3mq8kiouEI808dW?=
 =?iso-8859-1?Q?XG77ff7nmtzBmbZ+p8AWG1aZYOSNuuyfyip3tJwxYQEa7RNOD0O3BibSxl?=
 =?iso-8859-1?Q?WY9EjOxIv/LDC+Rv6JEWE1lSAhjZmHD60Ao2qmcIzMuHemTf4du0rTlEi4?=
 =?iso-8859-1?Q?2eqNTFZreJKJmuA6D/9FZVL51TO0MuSgP0E4BjEunFid50YkBEXOrtpl27?=
 =?iso-8859-1?Q?B17Ts6vONE97zWgD4Ei+5soedurIcuitFPJLLeudVy5TTa5FvutWsFD8QU?=
 =?iso-8859-1?Q?PchMMsMH4ntnTojgOxFpQ/wqkPJzlDNdmumcoNVDZROU3AT7o0w2mqu3or?=
 =?iso-8859-1?Q?CY7ijyTQ8Pqk6yxO1KBPGLwDXTlL8u0gWEW9oCPwI/3cjfGjbUl0ir38He?=
 =?iso-8859-1?Q?J4/ToCMBSOpBMGaSRPNPhND96iadMJRBoS0/PaVrejnh8R6Lrd99CTZqx0?=
 =?iso-8859-1?Q?4ZBPjx2ngJFlQTDMyxMuEI8yhy9MNJfg33fBsVIPIpxut2Rg9QweU1j0Bc?=
 =?iso-8859-1?Q?W6r1Kx+L4dTYUJPK/TJkKA9/9LvGXvmiY7/Eb0i8DoeLgNNySLGio1NOol?=
 =?iso-8859-1?Q?SiMxbOM4CsAogbyqAXwfek3N9+N41EkB6EZx/JZL5ckH3uFMdqHXSjx5rD?=
 =?iso-8859-1?Q?yzFG5G/Gy4kz8gS9TuZKVoTjgphnAUbTbLDfBjIBOgWltRbwoNLiSOCxU9?=
 =?iso-8859-1?Q?/Rh+4+PUnAIgvV2vu5BCkFZfBE9qimKe48OIKvOc1VQ4EEp77WW5kPEBPm?=
 =?iso-8859-1?Q?TSd0D+kv9BgLZKUe9xmAbMxyPh5hwHSek6NAl7z4hiHlnZbB/ZvNu1uL/g?=
 =?iso-8859-1?Q?IsemHlR62SUjRZ1qT4EL4onvItHN0S2HqumEz0nS+ClCgaLgNKv+DG7ECP?=
 =?iso-8859-1?Q?Mm67Z5HfMz6GTHbCZyfOtWEQN5aQSlRogDhx6wnmHpHu5oUWnnybBeb7Xb?=
 =?iso-8859-1?Q?fLA5DqIfwtb9uxAQ+fY8Cr1xnyVRXJSwLw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95397ad8-17b1-49c6-91cf-08de01f57ad3
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 20:51:37.7755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3U+VlPkui9cIvSBF+P3jJA52eEVVnBG9+tvRSHm36SRXC4+7U+EcI3sZdA/cCwRyR4PN64B8HJooPvVQfXSrHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

On Thu, Oct 02, 2025 at 10:10:16PM +0200, Christophe JAILLET wrote:
> Le 02/10/2025 à 21:49, Frank Li a écrit :
> > Use the cleanup helper to simplify dma_async_tx_descriptor error handling.
> >
> > No functional change.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
> >   1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 03b5a7e8c361abe1d75fb4d31f9614bbc6387d93..b1d035ca8002e9648b67bfe4d674578373394710 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -722,7 +722,7 @@ static void lpi2c_dma_callback(void *data)
> >   static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >   {
> > -	struct dma_async_tx_descriptor *rx_cmd_desc;
> > +	struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
> >   	struct lpi2c_imx_dma *dma = lpi2c_imx->dma;
> >   	struct dma_chan *txchan = dma->chan_tx;
> >   	dma_cookie_t cookie;
> > @@ -746,10 +746,11 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >   	cookie = dmaengine_submit(rx_cmd_desc);
> >   	if (dma_submit_error(cookie)) {
> >   		dev_err(&lpi2c_imx->adapter.dev, "submitting DMA failed, use pio\n");
> > -		goto submit_err_exit;
> > +		return dma_submit_error(cookie);
>
> I don't know if it matters or not, but this may change the returned value in
> this error handling path.
>
> >   	}
> >   	dma_async_issue_pending(txchan);
> > +	retain_and_null_ptr(rx_cmd_desc);
> >   	return 0;
> > @@ -757,12 +758,6 @@ static int lpi2c_dma_rx_cmd_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >   	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> >   			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
> >   	return -EINVAL;
> > -
> > -submit_err_exit:
> > -	dma_unmap_single(txchan->device->dev, dma->dma_tx_addr,
> > -			 dma->rx_cmd_buf_len, DMA_TO_DEVICE);
>
> dma_unmap_single() is not needed anymore?

Previous label position should be before submit_err_exit to avoid
duplicate dma_unmap_single() twice at error path. After remove
submit_err_exit, needn't dma_unmap_single() here.

But previous return dma_submit_error(cookie) is wrong, should be
goto desc_prepare_err_exit;

Frank
>
> > -	dmaengine_desc_free(rx_cmd_desc);
> > -	return -EINVAL;
> >   }
> >   static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx)
> >
>

