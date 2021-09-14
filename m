Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDA640A96F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Sep 2021 10:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhINIlQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Sep 2021 04:41:16 -0400
Received: from mail-eopbgr20060.outbound.protection.outlook.com ([40.107.2.60]:24142
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229448AbhINIlQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Sep 2021 04:41:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH+if6rhODDEwEwxvKvt91o+60ojFF22T0m4rnufvRyI8GW+AVYaWZGyydkwU8yq4LbJEk8tMlp/9yw4Ec3x3Uachq7lCStPValbEukk2REKGnqFUpF0AYqK1tX/ZmgiP4lVwE8kjReoMyDPr15U3rhWV/XoPVAB4ry9vNT/ZS8ycmEy8/aGRGA0rDZbUVEre14f+NDgRVyOp1V1gEvKxHI/CCH77Y/G7/Zuo8Bb8qgXOoqVwXrcD8R714oaqokCpUlTnhlTC+trcXSaXsBqgHFSTBZMVe2PDyqSqoMTO/N2n36sToXYnYOG2rBZvnprLc74f/26bqoNBWZqyQ+8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Dcs75zWw5NDAsmxBRMqrNplhqKyewQddovnw+vjc7SE=;
 b=AJGTNuRZtcRWAdb0HiEdq6pvE8o1m7hzbeB3GJZCIkdg5QofP2b0hsqoC0Eai9PNoVOk8WBCz4YSMmztcNCRlim3U9FBbmsj7ic14q7czystFgLEi/FGp07blmfzZrj5AAnMo+aHYnD+/1ov7bc0BETtJTrDInLaeXMZxCYER3cxClOIVfevVVKgtrMsxZyoevN6mxiYMTxce0BTwXLGCPGnb8WfzPbibnqi8EmCwW+SShLy41BD8h0JZiWfRXXkkQxCh3SPfVA3ej+6Vd33WoEAgqKqdxiJxyJeYjwefhhSvOK/lNZI8msvuxNLDpbZLVKTlXCy185ZM62TvF7gtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dcs75zWw5NDAsmxBRMqrNplhqKyewQddovnw+vjc7SE=;
 b=CM6Flv9hBw8eg+3Xu1h473+4bO1it1tEgKOkHwOwrg2z1FwyPOFpTPxFW9IFFnX5piaUXDadLkQyBK13t/N/S6RhYp8iRLrv7QWVJ4FgESbLCC97g5fH5tgEgmw6BsslJs2A6gHLwbD19+zla/3EzgEm0EXEqA3zN7MowfptFRA=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0401MB2638.eurprd04.prod.outlook.com (2603:10a6:800:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 08:39:56 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::485a:4462:94c2:5edb%10]) with mapi id 15.20.4500.019; Tue, 14 Sep
 2021 08:39:56 +0000
Date:   Tue, 14 Sep 2021 11:39:54 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/10] dt-bindings: serial: fsl-lpuart: Add i.MX8DXL
 compatible
Message-ID: <YUBf2vNnXK+JiITv@ryzen>
References: <1631522874-19862-1-git-send-email-abel.vesa@nxp.com>
 <1631522874-19862-11-git-send-email-abel.vesa@nxp.com>
 <YUBXdR1RRWnItcAv@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUBXdR1RRWnItcAv@kroah.com>
X-ClientProxiedBy: VI1PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::38) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.25.164.198) by VI1PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:803:8c::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 08:39:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c245aaeb-5900-4498-e19c-08d9775b3ad7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2638:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB26388BDFE8178E2551D00163F6DA9@VI1PR0401MB2638.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c5f/U3YLrJQtOt0eXGh0UTbekuSJYF0/L7KXTA9kmJbuVEPImyI4IiHV4qy5ajCguniPJXABvj65JxXgtXNndetUHUE7ldsBj5B3KfKGfyq3ivtEIwx8aA+hSUofUE6qYRfCUmTOLv1110y6SCln2d3nwfLHj8GlWaVzjlUoZEcdbi01Qql9SaVC5zGuqX8hn5uKf4VaSAPYOQwOtuoKOXmaCimMVLnkE2dlj0a/OwjafN3KKiyurm1VSeLg1Jt3FoEnRDiK09wV8BT/MPJxQZ4cZc1IhcsNCLzT7TBIzlL/SCmadrvNzIAMIpaXqUM0BiR1HDd/qfcSoo+nAAhIbgIPreCl3wumyZp+GfQLOKCRV75HHGdUuHRlejb8UB36vZTjDqWcKy06+rbRSwVxpxHMjEf+EmsN+KHAShrBzqu7QkP1lzD+Dl6ExK0lQUMkfTZBU4tJGeovjNdpMghgeLnckmmea67ET55G6h/dKWNKhQWpLlUWdbWIkCnFeyWCMmmK84CkZitHwXWZXD7ef4w6Cz/zV/mx0GXmUuooV0TcEMVKU9mP6LTf8CJYtmbv68WH5WtvEkHkz/QYuCuqGMqnBb49eEHY4Er+fD3AnjkDpLSYQpBwX7t9aGPIbVUc/3f9S87u16fik5aY2s8doBBaOg64qPEnWYHSNkQtVCKO0JCqZpv0VOnVUId8NtZ+RnDxQkPyYzyyZONs9fHo1QRUYavqXVih1jg1jZcAyy4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(66946007)(66476007)(66556008)(5660300002)(26005)(186003)(52116002)(6496006)(38350700002)(38100700002)(478600001)(86362001)(6916009)(33716001)(8936002)(53546011)(956004)(83380400001)(9686003)(55016002)(9576002)(558084003)(2906002)(54906003)(44832011)(316002)(7416002)(8676002)(4326008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0zyneJvHCeTJhjxKnOFfNjeV+Kt/4FChkZ1EsiEfvf973Y3sYj/hnQSGmbK?=
 =?us-ascii?Q?awtau+75drSupz3nXHxEfQ6Yql2R3dqfFJjdVTe8xpnTwPoKteYhFRbqsFJD?=
 =?us-ascii?Q?ZwOUQm7MeR5x+Y0kqSLAbAtwDQLT37p/Et7ExI8REIK7dOMSr5x5a/bogZ9Z?=
 =?us-ascii?Q?1hduTvWXYchpmzjWYn9EGWvejeOSHHz2isGlSrlIR4LZ752cYZFX+lAd5Wqa?=
 =?us-ascii?Q?HE5lz+VkJmi+CivKRfhwMkT9UWmLdzBFmpUah+HpCM/dxuD1cYseuilTi2IU?=
 =?us-ascii?Q?ydiSjsg8IpH/ScJ35lonhuQLfoiJVlTvZsJAX9dpHnJdtD2NYanH9gJiEqT9?=
 =?us-ascii?Q?56ZC/4m2gI29rY5mo2mdl8Wp7/HjBClExPZ9EIxMmuz685/AAdc+udI48zYo?=
 =?us-ascii?Q?nv9D7N9CYOBx7EsWI0APgpU5bt+TFEcDq8h2MbC7d9w677lwP3dpT+fjNdpQ?=
 =?us-ascii?Q?X+Pn41LI6bf90Q2wPk9FOVaLEM3TCgRUT1iv/hcssaa/b8ELnHT8ZQmEbTRM?=
 =?us-ascii?Q?lK3sgKXmOpWRq+Tv0jHr9kAf6oDAoClfzrV+asYispN7LdYhaMgKnY659Wor?=
 =?us-ascii?Q?0QyS+q8uPfHoTtVjfPWt1siD8wncueYGiIOv2SvtLPivAZxX/mgBwGWUiEAm?=
 =?us-ascii?Q?GMbbxD2ZxnBF2tDGCQH3ZVSsmWMbnXoeraXX2C4FQKuRWeeYynQlEy8QDpp6?=
 =?us-ascii?Q?8SwFpAGdQAlM/KcN8ID605HA2Q9W8RHLC+eg3lgl5+xAVtQuVXBqY/P5E8x8?=
 =?us-ascii?Q?PKZSkjKsDOcnr+pFStR/v3wUCGZLcVe1ftn3CWe7LAyJFite2NPkl1ysd68G?=
 =?us-ascii?Q?f5rMbBr42Ay7N8EG6BcOgJcjQkW9lxk6781w9K03Qbxo2eYVU+m8eKt8kmf3?=
 =?us-ascii?Q?Nq0bs6KUDGGD/ud+mjCHNyv8aIqVjwqGu3jkyT3jeDJo+JMPYPvu2gyiJjM0?=
 =?us-ascii?Q?jZs7j0FxUjUGHEuPeK7ryRJvlbYV2Ni06ozR8/b9HLPXO9BvhGdYbnEnWIu7?=
 =?us-ascii?Q?H/pXVniqADtoypD66o/30IMuzmXKQf4sRKh7iMfsJOhNPSIE50FF9d25gKqP?=
 =?us-ascii?Q?DVWgGzkC3fcbdy1w8/PFmxMHIBjVhrIA88ayGEC+m4ktmLERZBHfwh+ODEo5?=
 =?us-ascii?Q?dGr2in9U8M+qNtqVBeeNrdkMEEVwCPjjQ/aQiA7HEkyG42wkHPiyxy7POCbx?=
 =?us-ascii?Q?ezKetPqz6q5pOsFUWXWgT8Y/oDLM/48Rl8dSm8Ip2VSkfhKPX8js9I+7QUW/?=
 =?us-ascii?Q?e7qkvwhb8k9n115fhJNY0U52rVH844tu8QEHhMdJP8ouy/ZfViyesRoz+H6v?=
 =?us-ascii?Q?pDQL3sly6xJq+wRIvYI6b3R2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c245aaeb-5900-4498-e19c-08d9775b3ad7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:39:56.4750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnH23BR3Cb8Esr1krRrrrdRAVKoQIPpC+NISnEWXMVuaVknLftsvJTkzJyyjR5Js5eS02vwGdXyYgv+Gxk8I8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2638
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21-09-14 10:04:05, Greg Kroah-Hartman wrote:
> On Mon, Sep 13, 2021 at 11:47:54AM +0300, Abel Vesa wrote:
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> 
> I can not take patches without any changelog text at all, sorry.

Oups, my bad. Will resend with commit message.

> 
> greg k-h
