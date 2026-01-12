Return-Path: <linux-i2c+bounces-15076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8794D13F64
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 17:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BFE23004620
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 16:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AC63644C3;
	Mon, 12 Jan 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pHsoa6tQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813292D8DD4;
	Mon, 12 Jan 2026 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235046; cv=fail; b=tCZzlLIAWi5utxTqx70Dq6bTAp3ZzhtWhgpS4DiXpHAXhsYOc0u9Zb3QAetzBo0D/7gQstrR7Fy2D/51LY5TlikErOQykkGVBpd/Mye2kCuGHYbVaXKJ+mHgzEakMPkhskFa1o24JWn5yjxdxANkVSuebf9gAjysOfWLDNQTIS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235046; c=relaxed/simple;
	bh=+IpJJW867L/RAnG7vsKg2ipQ96gMaM+Zm5Ogik+SVhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WQKDkM/1DI8tZ3t+qH6LylX6Tgn3UNW1pGD4G8vJ0WOheSf2HJK2Bh3645m3cXTLUQopCEAFP0W7v4/DauHSjMSaS42PKx7/HWWaiTpcNBE8SPeaSRsl67xiq3YRFdFOhoSSshmEKoSHu+ETgoN+Di3FMTZfil84GeaF5KfP7VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pHsoa6tQ; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9JoWL39mwKldZ1gmZ+j1O4uB235//tK/37drPSNRc//YpJ0zmzTwRIVTNYKfUqPEBUsRZGcUwBihMiyfvIy5AaYmAn6TQ0PYGuiC3eAKV7OBUggrViatYeY/HkRxaqKsbjuRYdkqXurXpXNQgvmQsieT0NHLt/T8qrZl9CKRkQgrKQdvc3MD1gmQiYIZPndIdR77nhunfhq2guOpaNvolLf7yB8YVHOnA/0oT2QBvC1RsQv520TIZSS4qIn6pM2xiLZxtpjb6D/qKLbdVH4h4nsWHMKIrlbG9PjRRKeQxckxk5u4lL+cd7lwDHL0VlUOIhnAqKTs+zFYPLeQkxN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aebz3vv5JWKS+xNgws46wSxNxCVvJcqZgVmofQ4SCFI=;
 b=C12c20pj7OYLUFBbPyjaA18Ibdhn8iTeLBMi09QxS/lmF4MJr/aZYrELiDFhUZxW4A6O0KhiKl/X/awfplk4y580zyaXrm6d/oE2PeQJ/waj2J/GCWLZu/Hnpq3673dWFk4SB/DmllfAB5BXgCKvZb48MsERtclmwEyZVqiULJQuP5NyNpuF+ZZ5gBiWz6zdCbVCyuVNRK+8cf01RUXaqJ8zN9iMRqIAnaAB2PirvrqBizRwl5DDYsrlio4QvEvN5MzXU88fPNQLYZO7jykFfGlkJ7pcOKp6JUFX+R81HkMGRupa3zTvDYLDXn6m8Y9eQDbMhzcBfpv1R74pbqY5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aebz3vv5JWKS+xNgws46wSxNxCVvJcqZgVmofQ4SCFI=;
 b=pHsoa6tQl4UlOO7kAgh1UlhT0MXIA2sK9Ym7AdbK5sKSkrqZC2tJBKw3wibfzs+vQSO41dfceLRKsdvmOVQrkfJqODZPONznaJDxEA8rhEqPJIGhDhC6ZcdFVrhdvfoVOHfGDoFAYn0OYXeN8/47Aihxma5ORBV5zu8bBnid4SQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB14266.jpnprd01.prod.outlook.com (2603:1096:405:206::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 12 Jan
 2026 16:23:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.003; Mon, 12 Jan 2026
 16:23:59 +0000
Date: Mon, 12 Jan 2026 17:23:45 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: riic: Move suspend handling to NOIRQ phase
Message-ID: <aWUgEeouTeow1pvB@tom-desktop>
References: <20251218151022.728661-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151022.728661-1-tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB14266:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e436155-3038-4f47-1326-08de51f6fdb2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sLG0FtmuLPTnGdvL1i6XXBEVHcmNe2B2DQ69uQ+iHt7GnCaXx04wzKRr2mA+?=
 =?us-ascii?Q?uTRRgDmjrAG54wuSKmSu2ONNVUUdq7BA/StR0F0yH1ERQBpP5w8scfgyxw/6?=
 =?us-ascii?Q?laILoepJsM6fhoH/XdY9/ctmIod50TH3poHkc40qYY+I1tqS1HZKxHdK4nEj?=
 =?us-ascii?Q?OnH2b2mUM8j4IAUQG8/V8+1/vaZg/Raq+veJMsOURcudgfuo/E89v/P3jJ0r?=
 =?us-ascii?Q?JeLA+npKefGG61MyCdnQUyVhdr4bdCpee0wb+oQy4FEud44MfHTj3Nq7DBYv?=
 =?us-ascii?Q?S7xZJ0ESoMwrQJ5BlqqN4fqumQqYI2v7Hv8S1BgkpsX8qagwlAziYiPXjqHB?=
 =?us-ascii?Q?Aik2ZtCM9l2QGp3dOnLzXfQkpRv1n/06HZSvpCQyrkPHzdk039Uu7OUJ6kC1?=
 =?us-ascii?Q?FnM8HocGq5IrT2eIxNzOabjgbrKQQPuvymwgrzCqP/p3zPRZYAf0Aayr9BWY?=
 =?us-ascii?Q?AERyyTDPVLqZu9C3tTLF7RszkIq63XV+pE4TLILahLFv4+8t+XyFi8bTbh2F?=
 =?us-ascii?Q?zzrsKENH/fnz1HmvbLEFiJw0TZHdy77hzowLZNRBAcVQoL8XQrD1Z+r/b/NO?=
 =?us-ascii?Q?z7SEhgT6a9L+M+fZU6edeBPFyZmCUFY9P4dFMB0qydwEHN2/Sy8JPP4Ueovd?=
 =?us-ascii?Q?IolS1y4nCxxLORRR6KOpa3fVPqmKjNTV1BuXFl9zko2prIVOQPsv4Tfif5yn?=
 =?us-ascii?Q?7YCV5x+pZtfwgmsdI4syKSiz3dKO9oiP/dVWRvKM+RDew4zkGX2nNoRIliGP?=
 =?us-ascii?Q?DXm51FKt3cRJQOEcVGmtTSvYsxioeHJv3ZsN6xE0UQs3RvRjvRi+BwOYLj5O?=
 =?us-ascii?Q?uJf/PuB6fOkBP12qkJnKTlJjAGeng60/DXV5czG+6xu0G5RE1uw+LZOo1YwE?=
 =?us-ascii?Q?rFHtaYssmGAVopCKQ8FbdsQ8jhEku9LMRulmOzCkexCEXxk937WXrtZRUY2E?=
 =?us-ascii?Q?dmTxqjuQL2Lt2IB6X0offTq5y6I9l9fv8QdzAgVkXZH7rQSzYJI8TQnYRmya?=
 =?us-ascii?Q?hV0ONwKUlVoYl6AeiUqe6I5M7vmvsAqKG6ibdnHIpucKfN+oZ9rjzgj1UwJz?=
 =?us-ascii?Q?2bGX+0nR8o29L6X1kB/doMhU7q4Y8BnUClCUtoRFYU+3xsYbg2Uzw4m32qs9?=
 =?us-ascii?Q?tGYi7aIYVDYZsOkNWc3U3K00trSTDrC+1BrT9LBtSE9S8EgNKaFJWkRcqTg+?=
 =?us-ascii?Q?8cd+rRTUGzZ6EE9wTdNvp75fgixgcAzPDpeC9Jay052CjIy3T1u9luVu9gQ/?=
 =?us-ascii?Q?Zow2+gN/U7VK4UemkEC67SRvsIgL+1mW8CJGWlpiOP/y7JN956hGenaLd7aA?=
 =?us-ascii?Q?IAR6MoS9gBVrnDCkyDk6sXPeP1p0S7/0FacsmPN8wt+7sNWTblX7Dxj3l/zX?=
 =?us-ascii?Q?e/TEmyh/aIA6yXrJM8CGirDVQ6lGGgiRme9k8p3MnBxyVf5WphbDl58uiP4t?=
 =?us-ascii?Q?VM7ynj+rgRdLp/auCoeGoLK8bh+YPI9WikJHNtqrrpGzJWbmLi4ugtMlm5xO?=
 =?us-ascii?Q?XtDh0Ewjq6Al8fo5IFEuEHq6c6e8mUpubZI6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?69beVkplvEZlOJHZpK2Sv+84bmFU5tpeSK+jakHVNjmDc7uNxxufWHnUEaew?=
 =?us-ascii?Q?yubTddfM8mXJNSfoJo6tii44xTK3k1121tZlyxdl65rMxsT0EUhF+7gHu28/?=
 =?us-ascii?Q?uMpLE2ZdgF/D4q8S9vDEkd0nmlDzXab4w0gN4euFzK3bzOtuofiMtvcGSQiu?=
 =?us-ascii?Q?JhMh4XUwxshFM8yFVrv84cSqL/YIfpl2PCasBNveWuGhkNzeSAtePlMyoQxs?=
 =?us-ascii?Q?dHM1x01lN7uG8QtV2JodKtJ/vCRaciYK2C9GLqNFbxvr4scPZkSkLTikRJCf?=
 =?us-ascii?Q?BxHNU7eKfqVPZ2FidPQ2eG0Xf/UL4ISilVA0Tmlh8Y5hwQ+c02pj1tD1Ie7E?=
 =?us-ascii?Q?j9idZmuQGIO0byJ6mEtajxItj9srPp2uF0vw6YBB/c+mbOIJE4e5MDKYUgMz?=
 =?us-ascii?Q?SFTUDongswtXxYW4Ubf67+uXK0rL9+4cr16jbWv4U4jUpE36/U/py9Zg5Ys0?=
 =?us-ascii?Q?JMDxO1sGJdJ0oCNtPZnZ9Fy8DyFGBKp17vL8vCepD8FUx+KZwiQ/Uo4eXy7d?=
 =?us-ascii?Q?ApgcdhqmntJ1XOSxmtRSmSWf0WQOHqGaLWeHaMXVFwnKf3UL9ctxxlM0FbQs?=
 =?us-ascii?Q?k6fWFnuFINGfUQhfoVxnnd0iQXIJ7t7+w8gDRddTf+FdihTv8R4aPmA7KiF/?=
 =?us-ascii?Q?ltnCv0NXB7EIqGJkAF6xuPCCRmGc2x5se5F0R7dvCANcdb6uJD+67m7Ok0Xb?=
 =?us-ascii?Q?pt8502+w6pniyA+uwARgwRC2yxGpaKbfhCe/m6jpcluPplBb1w7KjK9uqpX8?=
 =?us-ascii?Q?ltajsupyPegRVwyzJ6MHgC/7rTQMSUIUA9YBxafRrWLthvt2t8XLWUTdaCv+?=
 =?us-ascii?Q?zco44AYJzD8+ldAG0KYC3TviFmNvzGBybbNr5mmNhBFunUFeLWYt6rxHhQNp?=
 =?us-ascii?Q?JYh7vISOBlodIzrWd+rM6Ysl3YrnMncT1L47x5+AGrkORaGgymzqeta2WiPh?=
 =?us-ascii?Q?QIJHYEAIxTEiNH3u7P42WtGc/T+2gtjUxEhANdlWnJ86PEm0U977JQk3en0G?=
 =?us-ascii?Q?oWkE3BH3Z8RGzEFGqSQh0D0KIzI43LpbVZyDgcu2VzaH+2UbgnM/H7g7glJ8?=
 =?us-ascii?Q?K3aghj0VOCNtLza5nhQtQMt51OTF1qrp/GhMvHF4QF4bh6Iu6pAdpKx3gX+J?=
 =?us-ascii?Q?z3D8awzrcqMYj88BDjLFPI50y11v5AGQ2JLzSe/jk+hXzKLzwTjyAeDHAZRD?=
 =?us-ascii?Q?osJImxYRTZzDIkzICFo1dh7pQusxCO69x8vZ4LXWc83Bu3MvgCRkmX0uWBbc?=
 =?us-ascii?Q?Q078DjT75St7EmfWKFNxk6Ogm34lH+jq2uzNGYlKMVR9Civ92Rf85tLRbHjO?=
 =?us-ascii?Q?7yvR8aDUPXfmQUkviF0yQotmWF8YJCcONzHoEcAe0YOw6A8CAjnLJWhq4FQl?=
 =?us-ascii?Q?U/XjM0EnxtKLvGfjadnlcA2IXKFFMD/Q1QPtfVrVSGBrrZk7YNbfWcBd2sYv?=
 =?us-ascii?Q?RCFfJVyxG0XdDhNR0uvLqMf9N3DIPZQ8wQD6w5n9B41n5LYOboLYEnBmE8bX?=
 =?us-ascii?Q?4r85cBfyUfLSU9GEDQ3I5VG44j/k/o9TMSDnAoPXn5hkfhJeNpiJ2pGzECot?=
 =?us-ascii?Q?xeWwUCE2t19oGJRU4VjwWJ3G99/ZkA8NMYynIplB+rDqLCcIoagB5ByEyMea?=
 =?us-ascii?Q?ixTP1MxiSNPn5/MkRlH9p8djPvLtG0h2b+Dl1X5V1XcLeOB7ZWU0mjl8N5NQ?=
 =?us-ascii?Q?0ZYqE+XYGA5AfpqIOXgwCyZvKdeY0MqvC1yUow/Tq326uGK4to7E3IXM1+Yz?=
 =?us-ascii?Q?Z/wOdg/V9fRxO/37paf02UIJQSlBWh3piKebCo6gTnztF8g8HdKE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e436155-3038-4f47-1326-08de51f6fdb2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:23:59.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieyOogp1Of3jErvzpSG5TAgyjkSojDmwlGbePBkiqbQZ0aghriOx/0OcDhGwSMqEbsavtMjIjJXMHSKMY8kynpe1ogP76C5Tt6pt6Z98kz+p2Waup6k3Qxq9LPnNr3ds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14266

Dear All,
A gentle ping on this patch.

Kind Regards,
Tommaso

On Thu, Dec 18, 2025 at 04:10:21PM +0100, Tommaso Merciai wrote:
> Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
> suspend support for the Renesas I2C driver and following this change
> on RZ/G3E the following WARNING is seen on entering suspend ...
> 
> [  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [  134.285536] ------------[ cut here ]------------
> [  134.290298] i2c i2c-2: Transfer while suspended
> [  134.295174] WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0: systemd-sleep/388
> [  134.365507] Tainted: [W]=WARN
> [  134.368485] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
> [  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214
> [  134.387329] lr : __i2c_smbus_xfer+0x1e4/0x214
> [  134.391717] sp : ffff800083f23860
> [  134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27: ffff800082ed5d60
> [  134.402226] x26: 0000001f4395fd74 x25: 0000000000000007 x24: 0000000000000001
> [  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff800083f23936
> [  134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006
> [  134.423771] x17: 6f63657320313030 x16: 2e30206465737061 x15: ffff800083f23280
> [  134.430953] x14: 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09
> [  134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 : ffff800082b16ce8
> [  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000fffff000
> [  134.452495] x5 : 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000
> [  134.459672] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c9ee9e80
> [  134.466851] Call trace:
> [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P)
> [  134.473715]  i2c_smbus_xfer+0xbc/0x120
> [  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
> [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208]
> [  134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208]
> [  134.493226]  __rtc_read_time+0x44/0x88
> [  134.497012]  rtc_read_time+0x3c/0x68
> [  134.500622]  rtc_suspend+0x9c/0x170
> 
> The warning is triggered because I2C transfers can still be attempted
> while the controller is already suspended, due to inappropriate ordering
> of the system sleep callbacks.
> 
> If the controller is autosuspended, there is no way to wake it up once
> runtime PM disabled (in suspend_late()). During system resume, the I2C
> controller will be available only after runtime PM is re-enabled
> (in resume_early()). However, this may be too late for some devices.
> 
> Wake up the controller in the suspend() callback while runtime PM is
> still enabled. The I2C controller will remain available until the
> suspend_noirq() callback (pm_runtime_force_suspend()) is called. During
> resume, the I2C controller can be restored by the resume_noirq() callback
> (pm_runtime_force_resume()). Finally, the resume() callback re-enables
> autosuspend. As a result, the I2C controller can remain available until
> the system enters suspend_noirq() and from resume_noirq().
> 
> Cc: stable@vger.kernel.org
> Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Taking as reference commit:
>    4262df2a69c3 ("i2c: imx-lpi2c: make controller available until the system
>    enters suspend_noirq() and from resume_noirq().") reworked the patch with
>    a similar approach. Updated commit body accordingly.
> 
>  drivers/i2c/busses/i2c-riic.c | 46 +++++++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 3e8f126cb7f7..9e3595b3623e 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -670,12 +670,39 @@ static const struct riic_of_data riic_rz_t2h_info = {
>  
>  static int riic_i2c_suspend(struct device *dev)
>  {
> -	struct riic_dev *riic = dev_get_drvdata(dev);
> -	int ret;
> +	/*
> +	 * Some I2C devices may need the I2C controller to remain active
> +	 * during resume_noirq() or suspend_noirq(). If the controller is
> +	 * autosuspended, there is no way to wake it up once runtime PM is
> +	 * disabled (in suspend_late()).
> +	 *
> +	 * During system resume, the I2C controller will be available only
> +	 * after runtime PM is re-enabled (in resume_early()). However, this
> +	 * may be too late for some devices.
> +	 *
> +	 * Wake up the controller in the suspend() callback while runtime PM
> +	 * is still enabled. The I2C controller will remain available until
> +	 * the suspend_noirq() callback (pm_runtime_force_suspend()) is
> +	 * called. During resume, the I2C controller can be restored by the
> +	 * resume_noirq() callback (pm_runtime_force_resume()).
> +	 *
> +	 * Finally, the resume() callback re-enables autosuspend, ensuring
> +	 * the I2C controller remains available until the system enters
> +	 * suspend_noirq() and from resume_noirq().
> +	 */
> +	return pm_runtime_resume_and_get(dev);
> +}
>  
> -	ret = pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> +static int riic_i2c_resume(struct device *dev)
> +{
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}
> +
> +static int riic_i2c_suspend_noirq(struct device *dev)
> +{
> +	struct riic_dev *riic = dev_get_drvdata(dev);
>  
>  	i2c_mark_adapter_suspended(&riic->adapter);
>  
> @@ -683,12 +710,12 @@ static int riic_i2c_suspend(struct device *dev)
>  	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
>  
>  	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_sync(dev);
> +	pm_runtime_force_suspend(dev);
>  
>  	return reset_control_assert(riic->rstc);
>  }
>  
> -static int riic_i2c_resume(struct device *dev)
> +static int riic_i2c_resume_noirq(struct device *dev)
>  {
>  	struct riic_dev *riic = dev_get_drvdata(dev);
>  	int ret;
> @@ -697,6 +724,10 @@ static int riic_i2c_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = riic_init_hw(riic);
>  	if (ret) {
>  		/*
> @@ -714,6 +745,7 @@ static int riic_i2c_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops riic_i2c_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend_noirq, riic_i2c_resume_noirq)
>  	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume)
>  };
>  
> -- 
> 2.43.0
> 

