Return-Path: <linux-i2c+bounces-7763-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77729BBA6C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 17:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8EA1C2136A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 16:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C8221C2335;
	Mon,  4 Nov 2024 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MtcNUgYP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F350B20326;
	Mon,  4 Nov 2024 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730738252; cv=fail; b=qnmQTJOtUX5z/WcKzDvJCefGYC5o9MKfC4sgn9edD/6YvrKByEuivJ6TWpq4r+ehHwJVk7Bt+Kiu06eE6xjRiPg/luEv7yR/HWQFKM0L4a61iNiRXbPfT5HVt/7Yt06VCg5iSMtJE0ew4LX1g5VbfmBTVPKBgPn7uHeh3XXFs4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730738252; c=relaxed/simple;
	bh=genqBps5RbpVntzHoFhtR4Dd6/k9aMPPcoC0kKVwGQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U27rz6DhKBPEJh0dD9RD4XypZa02rFUoYAqu4vNfjHub+EQXJAk/Y23Oe+8Ccpz1wV44QLBoggQMd+DJ81dFFp9J7HVbxmdVsb1c0Qmf8i65i9Ve+5JDsF5JjJ7sj/Gpk/JmqH/Dif7ZqNvsAShRy7IStbJ3hkthEihColUI/Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MtcNUgYP; arc=fail smtp.client-ip=40.107.105.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW/qag/+aZ631HNhlzaRV5J1b2RcKX54Qfo5pBdEZHwDdsKwEJEqwyAJRw4QDuGIqYUzoOxmSDC5kEyr/5rvewVIYR5Hd2oK/TEdPEnakN7+88dxxcGj5INh+e6DANDRF3v/kUUhzvDlqGiJ6KSvr3yKVSyKsO+9s43vOzPPEfkeUJBIpGS3XhMTw7DJ/iRioDfNkkPh9umJPId823zoSk8yb7i7L7zpGUJDU9O1Wud7lx1BosXiWVUH7x6UcVqJxosTCgNE0eKQdX5KYU4fAZLkljKLVtPT6Pom9FbNVEt6ProZ7LcS6+XDPmzaB1SqzB4SnJvB+JLA2BHronvUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FWGM5SX3S70Ijd/TrFlSM5IdyVEVIGJ4G96FAvBVMw=;
 b=cORP99HwcvIlQ8rpxcJPo4RZYGkhsHXi3tP+Cgf8Y2sOtdForrOczYsTCzKNqQTBxmpsH/gB8vpWIwfz3GfoLfjCGEYIoS5nVa8jJb9MfWdYFNf15YlzeMuL/cHFaCTzi+Jmb/62nBhXLSW5uOrawkZ8c7WL55Ei4GDjEP3s9midvdPEIBMFKxnHaa2KrgP5dmwVViCD70IqwROoxF024GoOWuEkxzHv0A1JAxbQ00lwZdr0dlcMilfqpHITq1llvLLZYd/i/t4mzxwyG1YUyCTwE6J74SegHr/S0iOn96hixn3LmowCvU+iKHrY8sx76GndM3Xc1JWebxBFOaduLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FWGM5SX3S70Ijd/TrFlSM5IdyVEVIGJ4G96FAvBVMw=;
 b=MtcNUgYPsTQeFRzdJKOXFs5QENfNHglrjjotbV7zvywfVWLPomEdqhr/GH7dser0pX3uuJGOs5VZ/UzaUHsAn2xJnFk5P+e0kKxD35iOpRV+nzvxIOePAu2AnTa6WODptfvTY8HZXVUAcQoX5x506F9nvaskztsuHiECTZXA+SxEKJJcK6NOhY6qmMqMHNdDk1HAKwGltzLp1BHnvUp/qg7BzkJTED7j5HlG3tc1G6cim76JHylPm1A0w7yZGhJuRMevkUJU2dVl0WLyK9ooevxQlmVcL/RNRFYbjHzyqxYkwSiPvZtmZX7g2i+u6tlI78EJchTtr5CPxCWgJhRfvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 16:37:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 16:37:21 +0000
Date: Mon, 4 Nov 2024 11:37:11 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: imx: add SoC specific compatible
 strings for S32G
Message-ID: <Zyj4N1NmnR30c9y/@lizhi-Precision-Tower-5810>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
 <20241104100044.3634076-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104100044.3634076-2-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a83cd4f-582b-4d2e-3c4f-08dcfceef474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?plRf+ekm4kPknZdhih2xmMNaUQZMAvq52iwg7+fzI5oAV+5HgEPpvsJCjteZ?=
 =?us-ascii?Q?JwbBeZLTHM7nq/sWqnJ1ISp+IxuuYWBI/8Fh+xbx5DsJ7FP+HJFAH4ULsoKS?=
 =?us-ascii?Q?Zbq/2K6hEhHHR0v/T379TOT9gDr3FRaC9OxYFY1ObV1qEghK80FOZjE3c88O?=
 =?us-ascii?Q?sT3LQ9w0U9yG2kRpfS/Ll53I4q9uIlm4I4bs6xjsXe7t/Lie+H4JWXdyFX31?=
 =?us-ascii?Q?Q73kDr9uxEifkXN7/cNnu8DDnrnX9Rcgx3jzTW1c4nNboWTmYjiXF5KywkOH?=
 =?us-ascii?Q?TxV8OlYdgnIaziJAO9YsT0Zh3f73mrUchMgEGctSJZRSl/Ri5P7cpOsfLr3U?=
 =?us-ascii?Q?MPse4VhntJKu6bOs7RGnK56Q3yjwHj0EXfb23t/1F7bV9LhoKK/J4ZyFX365?=
 =?us-ascii?Q?C/aKiF5OW8pvhDyFRDHToWLDxCmz8n/+KIlDTnlFavvvKuicxHWkBvaUFnc3?=
 =?us-ascii?Q?14WXWqrNIq8teURUW3Dhnh85dBvSvbdblSUlMI+BpD4TqF6J9D878ebdIIGf?=
 =?us-ascii?Q?9JQIV1snQYtGbIkDukzhMRXGd+XXmVXCybY/8d30tz09EapFyi+trR8EYkqf?=
 =?us-ascii?Q?3nC3Z8MZDm0GzDoSrIzpf6nEpFpPX1YBb2U0yPpeWB1orjZzN/o+Q2jcSk8p?=
 =?us-ascii?Q?Ing8Bfw+5gZiJ+2+JyErT6Bm41AfqjRftIE1OsNqaA4vOmPGrCKDYfnrK3x7?=
 =?us-ascii?Q?6IylM1cMzL3EKnCBx/9f3/BbtZ6ScDbvot7TSakdIcurrEA0jIH4uQgZX9Q+?=
 =?us-ascii?Q?0mcOvlCuZ1XomZu5wBLUJ25BGAWHxh/IpjFOjDNcY2jDUVacHV3jbnYkJGDp?=
 =?us-ascii?Q?IK6m597cnkX/y0C6bDQFXx1v9hzCVFIIJxImgbOZVTbOIN2nNnyuOnhwXbjz?=
 =?us-ascii?Q?wCIv6PYwFh9Mc3NJpRYVL2peZ057u1GQdLTUlU1VCfO2wAotEm60JseS8FR6?=
 =?us-ascii?Q?s8CplUPrkrF2yAJ/oHkiuwOHOm7QN5WTNaAb/IjBD+DHxvxICoUedAPqRjAc?=
 =?us-ascii?Q?PB0me//8WgwZdypdXV821+cu9ZlWw4oZcyh1FH2HUbUAFThOcq6iUfNsaZB0?=
 =?us-ascii?Q?0eZYuhmiNSo/sZvVfqxCQb2CwapAfVxUKuODYDjgiHnnAAByactfbTJ8fRXK?=
 =?us-ascii?Q?wqeoR2hemCy3U/d727wj6hj/jEI7okmwTABgSWapQ9slFb6kyIqERBQOsjVe?=
 =?us-ascii?Q?FTSthQl/smI3cobXBQXuWHdBYMGqQYsVdsaXNUgvyigZFH1T8p8mWys1TId0?=
 =?us-ascii?Q?rmMmL4UsbiaCpPhqnn1z3cmueLYXVjTV+ujqPTqUS8oi44rJGfqFdjjZS7ju?=
 =?us-ascii?Q?eKqMHu8J43y8Le5l9ZoLgNjiyiBRHR0ewbYNl0TabKVusnTAGT0EmyCEXpJZ?=
 =?us-ascii?Q?8D3tri4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QooxbIyzAa5mMjK1+g78bQ+htUqrJa7kthQpWTmj4SFlgLuPz6JH1wQPqy4R?=
 =?us-ascii?Q?ctQH+5AYN2+uLlhSDLih8IHXVHYRvLEPhIalkAVGsDzgEmm7dyCMNc6ouLjC?=
 =?us-ascii?Q?dOy8gVqdFWhR+CQpUdRAlFj6tw3z1j8ApPCYyAvtFuSSJ3Nwy8p2t7F1NkHm?=
 =?us-ascii?Q?NBDohdRln/zBvbsPDl3Rv5ycztsb+O1+IKfkPKB3cZDnH2HbGl+0KABiuCoO?=
 =?us-ascii?Q?fk0CsorSrMGqg09pS7U2eBzhIYL2hgp4LgT74skEIbW22y1h+guKoUkGs7+C?=
 =?us-ascii?Q?vKWG+P3Kjpzj2zrESGXTlNN559k3TE9dv5If/BSItB4pnRWoS2s+38UNEuBh?=
 =?us-ascii?Q?0Rj5knN9w7w+Czq3KRgm+XR/vuNItlTAK5Y7D699NfxXp61NBv3K0cXvtofE?=
 =?us-ascii?Q?8iu25HfF4VHGrkoDUEWsQpRIzVUFRr4XkxkWVbm1C72emN6LfmsPnCzqDPcd?=
 =?us-ascii?Q?zXuo/8VquS/qdjVKk4u+hwF3Rxfs57tUwdIEX+y4rVoxVTil1YxiUbO6W0Eq?=
 =?us-ascii?Q?QfNMmwP8vhuWRht4M1Ecrb6uXhq72L0tDAHqDyjEmmw8ep5Um6AuiUkN0JDj?=
 =?us-ascii?Q?L/J89p5GUSmOawrdhHjHyWHauoOvl7rbxQg2oWv2E0mc/Lmtb5rOdIhFJM73?=
 =?us-ascii?Q?b/zpcLQ7xPeeu28BYsSC7x8a4kU0a6NY+EfvY51fWFxhCnX9foYBMYksq3kZ?=
 =?us-ascii?Q?K1XmXuG/UDgEiVggUvSR16iu+ZZj7b9rRHjvLnmZjrkp+3zo+4O7dcTl9E34?=
 =?us-ascii?Q?TH4jp0UF4SOywjTtdPwZubLAGwC3uvlt9+BMYZx5mUcIh5Ik6YSUAZVT3CLB?=
 =?us-ascii?Q?7Uf7KlGzZ9Rz4So64gB2wglHfUy9r15BACuw0zLfb5riklQOpwoj9X1Ciqfn?=
 =?us-ascii?Q?0DAJS3Olh9+gwUy0KCkuWjirM3Ln+WCyI+RWpTCr3Ra9HbP1LfPVv307nC42?=
 =?us-ascii?Q?Pq0DQkJxII4TcECckBFSe85UyFqbN8KZQCGM4P9AQyJvk+s1MqWUiaTs5Bt+?=
 =?us-ascii?Q?acp6jNQyjAYas+k+/uBqe3vEKBBCJF/nMRJEHUakssOhdoy33AwtsGDDoYDQ?=
 =?us-ascii?Q?LeWTEajFd/IZE65psqdAhlBL8s+1r1CYKwTAineskDsitaxMSWbex/9iVas5?=
 =?us-ascii?Q?pyVv56EjCnm3DYbP48ueBdCP2gT0HlKvVWS9AxgA1gxOa6U8k+4L1lxi47Lj?=
 =?us-ascii?Q?WgBEYPiBEN5EwXjCufN4/Ut+xIvFl0Ipw+1hDgZ/eS1psogLpbI0Ltx8QPDr?=
 =?us-ascii?Q?S6RvwSZg5kplnfWHr731/lDzPUPhH+E/BofmgPBAWVGDzX23E2/M9zCYczZh?=
 =?us-ascii?Q?B3Y53q70hM8QiSUo9blPo1JAJgEftx+fYLcbOWSDZGDwp1S+F8UcYN5DqiLZ?=
 =?us-ascii?Q?nOUNFEqr5a/mWn5e9U0/deV9mDUqQ16/8BfaJ/bFe/dx2kWnuoimdjhHbm4b?=
 =?us-ascii?Q?ny+7Ol/vdremd9EBv7yD6uDYajww38b8J0HGObGkPFPPei3Ko8LlImkE5Waq?=
 =?us-ascii?Q?kTmDMKWec2MH9mzF/Kb5EzmqFIv/JT3vklCLU4NUpKUljMjTL67e4+xEeEGX?=
 =?us-ascii?Q?Ec0kWbGji7PbV/a7uXo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a83cd4f-582b-4d2e-3c4f-08dcfceef474
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 16:37:21.5592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZiQRgHYjJl6AP+1RIhiWvjYp/auaDbGutnEy38dAlWoktE0lmNx7PuJSpWhHLoqgjDA8upN+ke34j3UFP7X4MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

On Mon, Nov 04, 2024 at 12:00:43PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> S32G2 and S32G3 SoCs use the same I2C controller as i.MX.
> But there are small differences such as specific
> <clock divider, register value> pairs.
> So add new compatible strings 'nxp,s32g2-i2c'and 'nxp,s32g3-i2c'
> for S32G2/S32G3 Socs.

nit: Please wrap at 75 char or need empty line between segment.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> index 85ee1282d6d2..0682a5a10d41 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -18,6 +18,7 @@ properties:
>        - const: fsl,imx1-i2c
>        - const: fsl,imx21-i2c
>        - const: fsl,vf610-i2c
> +      - const: nxp,s32g2-i2c
>        - items:
>            - enum:
>                - fsl,ls1012a-i2c
> @@ -54,6 +55,9 @@ properties:
>                - fsl,imx8mn-i2c
>                - fsl,imx8mp-i2c
>            - const: fsl,imx21-i2c
> +      - items:
> +          - const: nxp,s32g3-i2c
> +          - const: nxp,s32g2-i2c
>
>    reg:
>      maxItems: 1
> --
> 2.45.2
>

