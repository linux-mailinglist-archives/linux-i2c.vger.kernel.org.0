Return-Path: <linux-i2c+bounces-14634-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBACECC97C7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 21:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F020D3044B87
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 20:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C363090C5;
	Wed, 17 Dec 2025 20:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HyDFTDLm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D5AD24;
	Wed, 17 Dec 2025 20:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003242; cv=fail; b=oGfX/rVaZoFw5sR/eQ/pBTJqj78nBTQY21cnq0X+piHiMpYQQrY4BhoHzjKpVaNjhjrAvcOeop6BISRUqF+BXgTsBAdThc0Ix/IlUIi4/jkXUm+HYBGNTR8+P8xkLIZVYtgt95ViWoTPC7+Y1VpkMkhHrAYnIawzqRv4WNktxPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003242; c=relaxed/simple;
	bh=haNDGunyU1V+TQTCGk4d8Llpay8q/YE5EfUJeMnMB9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eyXlgX3gPKIhEzgDxRDjPuFytRRGznG/pc5JE3M5xfirwQyt9FYBjy0ub+sQO9dYHr7Uat9z1/k3gBuX9ejCdErDR7elFZTzgT9uXyazto8CdzcCDyfGK//DLGE2yoVUWVH6QZBuirqZ2gY6C/AyMYcK9BD41KBcxe9okbNhqz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HyDFTDLm; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afFVhiv+ZaKyIBHRk5MQFtf1zpNRJi0Gn8N7z05ia08olIv8/1SnxuhVwA4qKQnyW+yVlhPfayXq6tDC95ZlddljJPUWiQ7zJvoMAaJPisoe+vIQFHFL4EoW1DhzC+JY/ECqrzJq9goqbOkuxi2LURCLBnrODSK5Ae1CNNl3rNn5EWYOhTn6Oi9vkvjTwdMcFP9tD8e5zW9AUr4U7KSjpVmB3wXcGu5fdhaE+BYEZ53BwwbIb8khzUVR2X+p7ZJg75ooMErgkbSnGN1xBxCS48ewsVL9npHUhTGVbfdRxMoIx3E5VXYbVqItdAMTMSkBSzVEb31nhu0S/yPmRSNUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxfqvzzzN2zLUBGxnfqdoNpVWYiKX37oEpU44Rx0+Ao=;
 b=jckjMt2/3ppTvEXr6/rVpXwUipLrXwkE7t4JxQ7a5J6Ep+ITtIILxv6g77pDAQYOG+WcOBCM6G6e1hFI4zBQwo9BKO4YkSLOxpRKL80S5rRbs90ir8myM5PtkSzsw6EDnWL1vMGINUEdjo59O4BMsMXwVfWkntmSced7g21nNXdm1UuUcCDIzfgNm8wFulPzsEH7CPeEt8XQPJrhlj0Uc5D8CVvE6GGpXeU43F4FwZqWnsXwli33iyBFrCMwE599uEb6NYL7fuvNixzu6Tmm3B1Hrj7vBVRp5TOpkuBMQR9mHFGQopP9+gXOYQRj/Mvkca9o8OIFJsdYWRiGy5rkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxfqvzzzN2zLUBGxnfqdoNpVWYiKX37oEpU44Rx0+Ao=;
 b=HyDFTDLmV0vR60Z3AX6WOmnl5vFQMST3C8xTQn+Gnk0onbWzXKhpvWqZjj3fA/STIrtblAo/IXg21poUSl7lSp1ZedCnrt5rsf2rWNhkv7B5p3SdquybvHKSgL1SfxaP9rQuumuPdMuIxQxmaSBpZdgNcZ2vL+Z3/egnI9OR41A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB8729.jpnprd01.prod.outlook.com (2603:1096:604:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:54:42 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 17:54:42 +0000
Date: Wed, 17 Dec 2025 18:54:31 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Chris Brandt <chris.brandt@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Message-ID: <aULuV2hf1XmL2qb1@tom-desktop>
References: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
 <hiriaxgujokllanjmdouw2ojstpxfpcpyo6dfzwnkq6qazl27r@zr2amt2tsuq2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hiriaxgujokllanjmdouw2ojstpxfpcpyo6dfzwnkq6qazl27r@zr2amt2tsuq2>
X-ClientProxiedBy: MR1P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 2355a067-4a42-45b6-4692-08de3d955ae5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EIVmPCeDpkDIYX5kzd/MqLhfgSLP0YhaelUxyFJmkA24PqSI+zaYkGY2hTvd?=
 =?us-ascii?Q?ffbzNBvWs5v2UuKcQt7Y1GEaRZdQua4YmqK0QkPo1bo19ewkKFwAXvRdDo1f?=
 =?us-ascii?Q?MH4GrabEfwzT/0Vg3ZWLXC6eFu9vJ6TdNOJNsOb/Z8WCRjcrKWYolgdrJmP/?=
 =?us-ascii?Q?xgCKNKhd0KzyFBtYHYd8i6r+AVC8hlmpThel1ZXj4GND0xR5KHLRlDMJVAS+?=
 =?us-ascii?Q?pnUzhjcN5Wcx36BSeBq4zpJ5QMYFmMd6ASLucVPv3bWGnWeEdXxLupN4tCWt?=
 =?us-ascii?Q?/EGGao5q7hh4NTG/ZzjKVJvRG5Ut49/bkUULYcV9h5v2owUyKLkukWAzG30h?=
 =?us-ascii?Q?/ip7Ehb/gIPQ/bvQOAtMrfeh6EyhpIZfsQ2l7AQr4tyqdJRRnnbCXsFiwncX?=
 =?us-ascii?Q?783IkgSmbM8EBX4RwWBX7I208of78jjnKaZFohQ9MrGw1oVtolbYRhKSN77G?=
 =?us-ascii?Q?E9NDuIyxFLi5iuYC9HffxTfZvJGfexRk0EGi7ZBZrN2Mq1FzxNpPDLmQg23Q?=
 =?us-ascii?Q?fTZIvzZPqgUO2E/WveiKr/MEWygIg21hMQCawdcE3g6GGE6tOJ1UOQH5d8TC?=
 =?us-ascii?Q?BP9WRlVj9LEnUI81IFZqEagl8pWEAAI6hccQSDUUs393hRa3omX5OET0Vmuw?=
 =?us-ascii?Q?zuiFfiGRoz0j5q0GJYAQYTTWcAhzT31RgQjv5gT7TZCNAQ0meSq57YlzJzug?=
 =?us-ascii?Q?/UDIwBqFTGWJnboQiAisNjsRbhx7ayopZ/gnuW7HuxvpgpDgGa7b5mI5Vj6v?=
 =?us-ascii?Q?yLwOr9uZtOgITkAORuYAGY9NzxuxQfpa9hUTLmrqHHwae++qcLVakx4i4l9v?=
 =?us-ascii?Q?/e8tLvu6iLRwD7Cr04SOlY5/OHCdoUpcn5VH/M8jJ5HFc1pnZeD2ITWpMSYL?=
 =?us-ascii?Q?jVrwezNegmQYaR75hhxYQdW00tdA+28Q/5XHzEGuWLsuBRBnJqvHPnGBAD/Q?=
 =?us-ascii?Q?xnjXUgxVi9SI+NxTd8/9NXG/Hkyi9Xji+90euDTq+Rtad4wtZ6kggBLN1Wjm?=
 =?us-ascii?Q?7GuBkcVUQJt4e9MGOXiYBvOzDseZ2WLjz1OZO2GYdL6K/wm47xCA51JTDFJ0?=
 =?us-ascii?Q?saSUwXqMPfg7bQcVtyMpm1pmiL3Dx6Lc111IL85hpPwb/7sEfwGaEuYnzmQW?=
 =?us-ascii?Q?NSiAeA3A7fCoD0kZZ92/hURumgskCOV0IrpM7/+rAifodoHl59tn5w2byy70?=
 =?us-ascii?Q?vPnPGktB4LVqT9EiySh3y64ya1znNOJndn62MX4tch6at3B3EB9mwx5IO3My?=
 =?us-ascii?Q?d9i8+NmeM8k1Clwq+No+E16HpIuad7v+HOTmF3t66Z1QmHotnPSQR1Kpp7zx?=
 =?us-ascii?Q?jVWJ/bYr/kzblS2rNRqxsC7KKIikHHj2csnY3eZehXXO20jUiLJHE12bILbE?=
 =?us-ascii?Q?WZ0NIjStNpPvcyF0VZjwnpNNSfl6yE74i9ewSiajpzPFBxabLaal00NnAN8+?=
 =?us-ascii?Q?xmGFXqA72p4PSyRuhZnyjYG7ERys8h/mutJJ5n23YWn7XZL1ukF2bb0K3jtO?=
 =?us-ascii?Q?+c82P0zGeR8aIdDhSdj5MIRs/wn3xYKA6T7f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cBH0qUURg8feStYBIquEJEPU+3UXgseAfl7MApLcqfi7qHqHvLM5+BlA8Dh2?=
 =?us-ascii?Q?UuWx8A7wjntF84EtPpF/VLhLoKBQp5yuJpWdecxBoglcxzEi5h24+SDrG2fh?=
 =?us-ascii?Q?LFhKcmdv3eu/pT6ttsCmdtLLy8isTeeLhS3bU+/CD0xRFUgW/1EYeCX0+tLH?=
 =?us-ascii?Q?oDId11Cj9dK1mBQ7HvQl3J+yr27LmmA6aDJowsVBOF8m7xevCuqlMuIp3tCb?=
 =?us-ascii?Q?yEOllnJBNvjPOMgaFKjv3bNVa08naU49Ub0naLxm4467YNowC9IkAxBrnmkO?=
 =?us-ascii?Q?IwiTQkeC1fN59O3ifEHvGyY9WVZDoEDtF7us2LWA+xsWCRsvyp2m47mYKV4P?=
 =?us-ascii?Q?v26xVwMLyhuKD7ulX7HhEI4snacbCrDdOHTAN+4+kqkVnDaQeSjSu3O8Kt3z?=
 =?us-ascii?Q?bPZbf8WctshV6nQ/2kQjX9WamQaFJysG/QgfzkjjhSYxHI9TfZWUjJJORoJh?=
 =?us-ascii?Q?YD/FKVf4VPPza5sIyDIfaJu2vv5QCGndiQdYghbxWQHCq+bdJaD34euLFzZh?=
 =?us-ascii?Q?TDDa1452M3cqSTGLzAMvMU134brVewLJgbA3HmTDovDg88iYgXV8D1X7J2F5?=
 =?us-ascii?Q?WeFfdMiX4AyKWxICitvr1BDEcUoBRjdyjYYj4AgN6wCfm72Ld2YRq2jPiNYa?=
 =?us-ascii?Q?Hml2Ci2hFedss9XBAeMzp9g3GGQhU8rNgCJqIcyL6fgGMcNHpXMeQJAv8Rxv?=
 =?us-ascii?Q?AC8hbZNY2NrjV+T1WllQNIW+WQkkXlter74FyH8budFudhsV+hMNYawyefiZ?=
 =?us-ascii?Q?GBt6KdKC590ptDGdD+9rfdyH5rtB+UdzMVASt2NdnpGvoJGYrfZBOxdf5HDD?=
 =?us-ascii?Q?ZDekUPBhjS2tlf2lIBthtv7JuWy6rNuhLu6JVkzI2TrLamg7vPuT8ynNOVut?=
 =?us-ascii?Q?mrQALMjdP8aX1NF6HqNLNnG0HJpuVF7XCSlkyZ8KPev8XfqpAYivOgyoyoAN?=
 =?us-ascii?Q?RTFL7tnwURRjpIAlphr0pRUPGIYJXbgCvvOnRKnJCzmNlQv0CmSex/VXh+GD?=
 =?us-ascii?Q?E62Oz3oAIhIPhCrxNK7c6m2YdjN4PB1Ai6kue6SplDji/7OWuIfd+eUmcGAN?=
 =?us-ascii?Q?Wf29wHQHmbcp7wNxln/TRznoN96/rRJErA28Nm7Yj4MLBFK8T+WW3CY+IIxf?=
 =?us-ascii?Q?lNd0Tk5GYe5N/yG3fDPUl02xfLX0Iz09ZeVty3vcwkFSLWxXUWc3eEB5JqKq?=
 =?us-ascii?Q?/EJzMoMI4017C8Lba7tz+1SlZu9lb6S+tJcaa1gDavGnQ75f1D1RqydaHTrx?=
 =?us-ascii?Q?a876VYzM8vj0jR6fvtcmRFcOkXFLjSfKQ62VWbu5a4r9TqAjsYcWvRhGhZ2g?=
 =?us-ascii?Q?ogivZp4QEcLsQPsz/4DbX1W2UOTXx03nMyKFJ5kSxVRvGd/so4ZDGYcCAUoj?=
 =?us-ascii?Q?sRIHPfwyogme7U5zMzl7b/CfekQjk/jmEXH0CLE382bHGGbTJtD65FW51gwZ?=
 =?us-ascii?Q?RjGOQn3SRmrxF1ainWzSsr+xdiUi1SUCXfHrrJYytZDISJaAPCD320Hh8HTN?=
 =?us-ascii?Q?lOWsMeSS9Q8vYlybgS6Pt7oRRANnoeTb27hGdq0ykjfAiWScUx2YvPxM75Og?=
 =?us-ascii?Q?5sGEE0lQzWceCvJYoUFoaNjbErdPA0UzkRgIhEOhCdZkXz9ptMnC+V4TZGm3?=
 =?us-ascii?Q?h1vjlwcPf2ykAt5/Avbro2M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2355a067-4a42-45b6-4692-08de3d955ae5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:54:42.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhVJunwNXZoSLpDNOBmwfmQlixjQ5qoH/OirG1pxILbldYqx3p0RF6OJcNvLHZiRCET97OvOtyNTz8uptC1xtmmsUvn82PBmVfu2gtJyql0Xoj0tpswhtseXaxRjvZGs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8729

Hi Andi,

Thanks for your review!

On Wed, Dec 17, 2025 at 01:10:27AM +0100, Andi Shyti wrote:
> Hi Tommaso,
> 
> On Fri, Dec 12, 2025 at 12:58:57PM +0100, Tommaso Merciai wrote:
> > Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
> > suspend support for the Renesas I2C driver and following this change
> > on RZ/G3E the following WARNING is seen on entering suspend ...
> > 
> > [  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> > [  134.285536] ------------[ cut here ]------------
> > [  134.290298] i2c i2c-2: Transfer while suspended
> > [  134.295174] WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0: systemd-sleep/388
> > [  134.365507] Tainted: [W]=WARN
> > [  134.368485] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
> > [  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214
> > [  134.387329] lr : __i2c_smbus_xfer+0x1e4/0x214
> > [  134.391717] sp : ffff800083f23860
> > [  134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27: ffff800082ed5d60
> > [  134.402226] x26: 0000001f4395fd74 x25: 0000000000000007 x24: 0000000000000001
> > [  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff800083f23936
> > [  134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006
> > [  134.423771] x17: 6f63657320313030 x16: 2e30206465737061 x15: ffff800083f23280
> > [  134.430953] x14: 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09
> > [  134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 : ffff800082b16ce8
> > [  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000fffff000
> > [  134.452495] x5 : 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000
> > [  134.459672] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c9ee9e80
> > [  134.466851] Call trace:
> > [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P)
> > [  134.473715]  i2c_smbus_xfer+0xbc/0x120
> > [  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
> > [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208]
> > [  134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208]
> > [  134.493226]  __rtc_read_time+0x44/0x88
> > [  134.497012]  rtc_read_time+0x3c/0x68
> > [  134.500622]  rtc_suspend+0x9c/0x170
> > 
> > The warning is triggered because I2C transfers can still be attempted
> > while the controller is already suspended, due to inappropriate ordering
> > of the system sleep callbacks.
> > 
> > Fix this by moving the system sleep suspend/resume callbacks to the NOIRQ
> > phase, ensuring the adapter is fully quiesced after late suspend and
> > properly resumed before the early resume phase.
> > 
> > To support NOIRQ resume, the hardware initialization path must not invoke
> > runtime PM APIs. Split the init code so that the low-level hardware setup
> > can be executed without pm_runtime_get/put(). This avoids violating the
> > constraint introduced by commit 1e2ef05bb8cf ("PM: Limit race conditions
> > between runtime PM and system sleep (v2)"), which forbids runtime PM
> > calls during early resume.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> can I have an ack from Chris here?
> 
> ...
> 
> > +static int riic_i2c_suspend(struct device *dev)
> > +{
> > +	struct riic_dev *riic = dev_get_drvdata(dev);
> > +
> > +	i2c_mark_adapter_suspended(&riic->adapter);
> > +
> > +	return pm_runtime_force_suspend(dev);
> 
> We should perhaps swap i2c_mark_adapter_suspended() and
> pm_runtime_force_suspend()?

Please correct me if I'm wrong but I'm seeing similar pattern into:

 - drivers/i2c/busses/i2c-sprd.c -> sprd_i2c_suspend_noirq()

What do you think?

Thanks & Regards,
Tommaso

> 
> Andi
> 
> > +}

