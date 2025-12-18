Return-Path: <linux-i2c+bounces-14637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A891CCAC8B
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 09:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 143003038CFB
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 08:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62ACD2EE5F4;
	Thu, 18 Dec 2025 08:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XMcCrZkI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FFF2EB87B;
	Thu, 18 Dec 2025 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045368; cv=fail; b=H7vmUkDFsAhpFGgT2Yiscomq1Vx7qa8R+Otn530DX+iwgUvUs3qoLGjDDq0MQ32JbPD9qs9yBjgXcxQBwCCHXfhPshfwksgc9hghPy/1bmKHJ8CWaZVKV8asKJ9VMge04FjWENg3dCkeo9YTiQ3AkaZFACL2jKKvO2qJw2qQa+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045368; c=relaxed/simple;
	bh=m+zseqw5o1doMxbAXxFP1TTuyG60Lmvj7pIP87ITtKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QkPNu7QwoqDfiF7Pt1dqHU3AVJwjriaK1WWmSnYH0bUr9HGQwL+RPwhjoMWu1oBtB+XQrnzNT1FbkqvZ9zHdwp+Nbgcd2WmnPC22WX2ekiaun75JknA3HZdHa8Eacf2Q6oXDLAIWwPx5P2Ruzt9spniImV7l3fv6mgLGqg+20oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XMcCrZkI; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCmt8DUzqCO4KZuiEwwow/DdOi8fioOg6ILXUdChlWHJ0DuabZxs89YhY1ultC8A6AxZcKHBEa0cFl+p5qPyk1PaFzzlYC9xWdPIHr4TBL6/yYZQRnh+daeZ3LI3NA3HRi8RB3cHCTyWQ7XJkr4bkexiSPJ/mOkKAi67CkcGb/ceYH28ZOKc015HHt5owjzAG9N+LRaNsdMh7pKb1P7JecGL5Uu9pENiChz9IRJKyY1w2EFj77ALMI9KMslgV8HAAus4N3oNz2b5SAmVOcHDy+BhaxRpNO4b0Q/rnKEgFJ8EeQ/+i9LqTUGcwTACCwuZa8fwBXwlEFg4hZFoueBRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Puhsz8H8gGU7OdWoMpMGX7wZFZ2+x0OFxdS1116SW30=;
 b=RasjHSUsRZjsOh97630fMEZutN3JSCF1U5KD+YzEbVZrvIzBsn606gvokW9gZfbEs1oQWQU1ywgJUL6mQp1u0Rn9XYutAU/fhQkYtrJIxrlzdSMlkPZFdpLGihkRIMV7FexzW+X4ZSP3q0aOt9B3CTe8xjuLdvdP30mDHjX8Ft4qsY/uWoireekKtw3jIiH7De+EQr1nOSYPJf+DOQVxEodb0MGhEnYrHPRkOyQNdxu05x635IYrlDRiGzYzaIf8fADGBEDW2p8KWBTLgbJfV2cGkcua1NtY2QZk6sKZNX9qcHtoYCp9Lr6TB3kqEFX6iV38elUyFYQvHPs4peI/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Puhsz8H8gGU7OdWoMpMGX7wZFZ2+x0OFxdS1116SW30=;
 b=XMcCrZkIlO3oOBeo4R7fHpDYCgLypsPs1A8yayl9Z0v88dGbiNMcL9weLYO+RS4zbF93wVsaKbJuL9IllE+hlH1ssneUyzPEov2guQ0dEvktVuUx5VRIcMaqH8LrK6nB5g9WTN2LMa9naNEfCiDHn4DF8zQWpcj1WUKI7UxFjcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB16946.jpnprd01.prod.outlook.com (2603:1096:604:407::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 08:09:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 08:09:16 +0000
Date: Thu, 18 Dec 2025 09:09:00 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
Message-ID: <aUO2nEPdSHSAP8lp@tom-desktop>
References: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
 <74a801d3-8653-404f-8531-cb99108eac33@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74a801d3-8653-404f-8531-cb99108eac33@tuxon.dev>
X-ClientProxiedBy: FR5P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB16946:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9bd106-8756-43ef-7ab3-08de3e0cbd07
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SDcgpUtihT5YOIOEZjU/yM1D2aCNoxWZvYKPG1wfIg1wQoPKXc4mQI7LcZvj?=
 =?us-ascii?Q?XN5YzZ2ZUQi0T0g6ZA3sSplAJSzN/aTSkdi/In0O9L46E2f2Pu3aVk8Wir3N?=
 =?us-ascii?Q?BYlIF/pBNt9qUIWt54F8EV+tfB/w762Mrg+e9BVWOBesGtAAyy+jnZa32tzT?=
 =?us-ascii?Q?x5WgawgINY6NR8ITgtO9exYyddTTXaNi6H4Gm7EuRq7tmbAm36dR9lgi5n+D?=
 =?us-ascii?Q?dlj4N4yEEdIiEhZnWs2lN9Q6y+EVatLz2VFrRlS22YBnvMUSBRy0hNg4qIqe?=
 =?us-ascii?Q?DubWR0Krl+mqcxUxSbQPMSoLWqlSi7BMbvCh1TkANMsLOwrFlITdphGOOpsZ?=
 =?us-ascii?Q?XNNA3gZwmQj0dAODkc9BFUNKrsc0FVLtIApNeJH/8i/wfJwEhURn5XL3u7bp?=
 =?us-ascii?Q?wqcZKNjQcr81bnP06d6kO9vUVPEUMKAjWfpgujaNAp1hsWCcC5nLhResYy9x?=
 =?us-ascii?Q?m9V1D6+YCBgKe6xZYCK7sExgQUPMLFBcMDV4NwuVmgjTIpOeG4XDhH1WWFRD?=
 =?us-ascii?Q?3s5Uov6PUkGRFvZV8Jz/3oXEtzt88pPwScGZfQf+e/RVaEVJd1bdCBlfCfZ4?=
 =?us-ascii?Q?jQWLVl0fbltqHgx2kWLiqbCx7IeEW7MoT+ATVZWGcc905y4aCEqyjM0bZMMB?=
 =?us-ascii?Q?5CujQAV5KBH1/xXgFtS5ETIFi9yQyuQbJk9FkuDKSIbzRqw2MHhhMHWpFiS3?=
 =?us-ascii?Q?3+57RixiDZAOpO8URIrUwoB9VGo23w4P1i2Stf0vyvMZ9qFOdzJt9ONdxmWs?=
 =?us-ascii?Q?jrU049/zYKPcZE7XD7h8IuGg4M751e3x3gL/Nu7K0MvZZtz+dBnouFC5uZyk?=
 =?us-ascii?Q?KfDOU3KWKOGUEsjpbk474C9BQgHG984GGmL0egNE+br0B2eM168m/IwTEJbZ?=
 =?us-ascii?Q?4XKMrZ1ScT18yyKGEFhEMF4oaxc8dor2VEWCrvYBPIcANWNz8GWc2Pfixzpq?=
 =?us-ascii?Q?1R9cSCoL8l6QDRBJS5JOsvMlU+4X0AFBNaMpbCYIn3aTgXuDLywID4lJJQLW?=
 =?us-ascii?Q?EFC90ilMAT/MrkYt6OJIFhEn6E6zheESR6pKgtyPI4S9XyG4jihYaFTVdE2m?=
 =?us-ascii?Q?275fyCNDjtIVZf1nlFaAwsmZStE7/EaAoO32lkjQfxe6Bb1Y5/IG+xsdNGzb?=
 =?us-ascii?Q?sZLBWl8zZkkdUtGxGWc/oFv3fsckIFqDr4o7tI6h1cV2zka9LgamlSwWkpLn?=
 =?us-ascii?Q?4+7EswHmrl9HypUSBfZKyixdaXJMDxXjRYlNERq1b0VjoYA3G/ZFDUloRbTc?=
 =?us-ascii?Q?C1gW3g7ON5gHasPgbRUSF+Ab/DFfBa+1joenzFJ3IDRSVIh6XnHl135gIxPm?=
 =?us-ascii?Q?u9KMEtd//cTgow9V4sRjgsZlzSfwNW5WL1CC3WZHT3FQF/PjAv2pBCCEEmYT?=
 =?us-ascii?Q?Gg/sJikXHcSSXqw4sG8id5FoD0mz8B3pPxhtjo05BcIXieSXtbnXIhY3nvfE?=
 =?us-ascii?Q?UE00XXnSD93t7bqWjEzBhxYvwVDx5ffIXdZa5TQEIxg8vTX1GndYlw4TN0aJ?=
 =?us-ascii?Q?oIhFRBVZpbjI9b+SSZ9ex+/y3/OZOS5e4Wc8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WxnBQoxmTKDB2pf2ebvWtxk2mXgIdVieZPLC7q/rcGUfZxiKY3Q6g3fd5Xo9?=
 =?us-ascii?Q?udSFx7j9oEiPvPlUUERjP6i1+h76Gaxb7NAh87EMgzQdWgCqlRUjTcFXuUj6?=
 =?us-ascii?Q?ZrD42r3U96H9Hf4xF39ZUo+f4fnFBY3kGzIeY3/e6CfP6q46oh6L74miteO8?=
 =?us-ascii?Q?Q/g7fLRCcoJDHDUF80bhxMfeJ6uwEkppMKpppnmwEoKJll4Vr6hnHVJ1G6WI?=
 =?us-ascii?Q?ySs6ERS++dpsiCCulfphciVJzlDWG2yafM0paDwVTqXYGizhaSBxMTgDIagG?=
 =?us-ascii?Q?crir8V1496w0VLo8Mt1oWvvVns/2IEB67xmwAuPYtiQpRMyUwy6aYsjHv1QY?=
 =?us-ascii?Q?TBNR09Gjd+KnNNo4aZdrz81bp1YKXuRlv6sb3JhPlxEDzgdcPSIZvnxQkD+T?=
 =?us-ascii?Q?flB+y8SemIOtRrQg72DRpIFIowM67PdhskPW+YU9+FOMr8/uzLG5F6u+rTDL?=
 =?us-ascii?Q?H5ixQTGK7/Lb9h4IyTziB5MkluIMMVeRpV3Pg3Gu4LypZC+kVLI+mUixvgGQ?=
 =?us-ascii?Q?U5XMi3YeTRXCLZdYxVjHKKFVtOERdv+lyBYM+Rq5cydikYA1X24/z+5Kkvct?=
 =?us-ascii?Q?nk7aaY2MQf1Hb4OzRQqJNNDpYN2mnlUKMZXeFUWU9m11z6VadvMjwEGIXBxG?=
 =?us-ascii?Q?HCGqgBcQveLvymNPj7KwkfY449BzCMjLxZ0oTj+2MoKEaWUFAakD5Z6N3/xu?=
 =?us-ascii?Q?LmtMB0B5BCLjMHF34bGChJrrH1mu9ROfqKf9Xc0x5kFMZ6VJdE8sH/HR91qj?=
 =?us-ascii?Q?KJPjsxv78ycPyeraFRvirRewNarGQh5aCJZPyKvVE56/hdL2gaKTLvNBoeHC?=
 =?us-ascii?Q?cNCMHUMsRvGCwRPROyNdG06HovIdDDihfU616zu6DznM9cS+sJ9lbeKipwcC?=
 =?us-ascii?Q?o9Jo4HtGBJ6Cvk047Qki1QETJZBt9uO7ax05mgdDsTf2KeaP5FYj/clYdNGy?=
 =?us-ascii?Q?i1wlkwSqJakrXUr+w2KSTRSrWoS4+VoEKTloveD+HlF+xWhdXe7rp6FCdqQ1?=
 =?us-ascii?Q?5QvNMb15Nf8v4RupXYLztJvCygreZmlkwEehCmzLzYYqcHb4PuQyYQCfk82W?=
 =?us-ascii?Q?/5OuFU+df1FIEgtaBXZciOlhEBwKKOYXXvVnpyZF23+orX2E6siHtrCG2LB4?=
 =?us-ascii?Q?m6OcpUzgJ2iYe8MmT+WCfNrMMXrQr0MLsnCSUUDf2k6Zr7tub4yskQMbDKgM?=
 =?us-ascii?Q?qBwPcOmB1UReUNwV+HfhxrqUDXN/V+BOAeJEfePCj8wrniLbaAqWTMhyhvIg?=
 =?us-ascii?Q?QjfjsDlZf3TgdpbQdStmS+ojaYpDcgI+djgz20dB4eVyFFvQ1eiIMLVLccyt?=
 =?us-ascii?Q?xQgf6+I3DGv6fbnSuPHT0J/DmnUwKI5+hClE493pmn14ZBy2DbplJat6lSR1?=
 =?us-ascii?Q?K3MxQq57AEDAGYYEgQmTTiE/CCReOg/jIqBWSkeUUlOuj9tSqYmp8fCwVzVf?=
 =?us-ascii?Q?knEUIN+F8iz2psYFUMWO9DwAlCiM7cTHmcEZp7Vdvz8FWiOuDauXSZZVUQ6y?=
 =?us-ascii?Q?NeMtpn+RQdCFHD4ozFKkm1a9b0+KfoFwL8kO1CLnyqwxQi1vf97OmWZ4i8QA?=
 =?us-ascii?Q?sUrgw0sTh4izkEeUQQlQIRSJMD20U2yJrJF6llVPnj83bu2pygDWmoCjAhkU?=
 =?us-ascii?Q?yXoWASaoQb0toT1iEGRotps=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9bd106-8756-43ef-7ab3-08de3e0cbd07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 08:09:16.7485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhXgrxbAv270VtvmmQCKRuvR8NWYsat+HLx/SCf8WToxzUXKYoYixpGrkghqeEMXAduc4PAft+xWVSPLXVmhhV/GwLbY29xqy3fE9mKOQF9BxdjlXQ+zMGDr7FOKH4g1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16946

Hi Claudiu,
Thanks for your review!


On Wed, Dec 17, 2025 at 11:41:43AM +0200, Claudiu Beznea wrote:
> Hi, Tommaso,
> 
> On 12/12/25 13:58, Tommaso Merciai wrote:
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
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 65 ++++++++++++++++++++++-------------
> >  1 file changed, 41 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> > index 3e8f126cb7f7..9acc8936cdf7 100644
> > --- a/drivers/i2c/busses/i2c-riic.c
> > +++ b/drivers/i2c/busses/i2c-riic.c
> > @@ -349,9 +349,8 @@ static const struct i2c_algorithm riic_algo = {
> >  	.functionality = riic_func,
> >  };
> >  
> > -static int riic_init_hw(struct riic_dev *riic)
> > +static int __riic_init_hw(struct riic_dev *riic)
> >  {
> > -	int ret;
> >  	unsigned long rate;
> >  	unsigned long ns_per_tick;
> >  	int total_ticks, cks, brl, brh;
> > @@ -431,10 +430,6 @@ static int riic_init_hw(struct riic_dev *riic)
> >  		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
> >  		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
> >  
> > -	ret = pm_runtime_resume_and_get(dev);
> > -	if (ret)
> > -		return ret;
> > -
> >  	/* Changing the order of accessing IICRST and ICE may break things! */
> >  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
> >  	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
> > @@ -451,10 +446,25 @@ static int riic_init_hw(struct riic_dev *riic)
> >  
> >  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
> >  
> > -	pm_runtime_put_autosuspend(dev);
> >  	return 0;
> >  }
> >  
> > +static int riic_init_hw(struct riic_dev *riic)
> > +{
> > +	struct device *dev = riic->adapter.dev.parent;
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __riic_init_hw(riic);
> > +
> > +	pm_runtime_put_autosuspend(dev);
> > +
> > +	return ret;
> > +}
> > +
> >  static int riic_get_scl(struct i2c_adapter *adap)
> >  {
> >  	struct riic_dev *riic = i2c_get_adapdata(adap);
> > @@ -572,6 +582,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
> >  
> >  	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
> >  
> > +	platform_set_drvdata(pdev, riic);
> > +
> >  	/* Default 0 to save power. Can be overridden via sysfs for lower latency. */
> >  	pm_runtime_set_autosuspend_delay(dev, 0);
> >  	pm_runtime_use_autosuspend(dev);
> > @@ -585,8 +597,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto out;
> >  
> > -	platform_set_drvdata(pdev, riic);
> > -
> >  	dev_info(dev, "registered with %dHz bus speed\n", riic->i2c_t.bus_freq_hz);
> >  	return 0;
> >  
> > @@ -668,27 +678,17 @@ static const struct riic_of_data riic_rz_t2h_info = {
> >  	.num_irqs = ARRAY_SIZE(riic_rzt2h_irqs),
> >  };
> >  
> > -static int riic_i2c_suspend(struct device *dev)
> > +static int riic_i2c_runtime_suspend(struct device *dev)
> >  {
> >  	struct riic_dev *riic = dev_get_drvdata(dev);
> > -	int ret;
> > -
> > -	ret = pm_runtime_resume_and_get(dev);
> > -	if (ret)
> > -		return ret;
> > -
> > -	i2c_mark_adapter_suspended(&riic->adapter);
> >  
> >  	/* Disable output on SDA, SCL pins. */
> >  	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
> >  
> > -	pm_runtime_mark_last_busy(dev);
> > -	pm_runtime_put_sync(dev);
> > -
> >  	return reset_control_assert(riic->rstc);
> 
> Reset assert/de-assert was moved to the RPM callbacks. Is this intended?
> You may want to at least mention it in the commit description.

Ack, thanks.
I will add that into the commit description.

> 
> >  }
> >  
> > -static int riic_i2c_resume(struct device *dev)
> > +static int riic_i2c_runtime_resume(struct device *dev)
> >  {
> >  	struct riic_dev *riic = dev_get_drvdata(dev);
> >  	int ret;
> > @@ -697,7 +697,7 @@ static int riic_i2c_resume(struct device *dev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = riic_init_hw(riic);
> > +	ret = __riic_init_hw(riic);
> 
> Moving reset assert/de-assert and controller deinit/re-initialization on
> runtime suspend/resume may increase the runtime suspend/resume latency. In
> case of consecutive requests this may translate into controller performance
> downgrade. If you keep it like this, you may want to increase the default
> autosuspend delay, at least, to avoid controller reconfiguration after each
> individual struct i2c_algorithm::xfer() call.


We can set autosuspend delay to 250 ms.
What do you think?

        pm_runtime_set_autosuspend_delay(dev, 250);

> 
> >  	if (ret) {
> >  		/*
> >  		 * In case this happens there is no way to recover from this
> > @@ -708,13 +708,30 @@ static int riic_i2c_resume(struct device *dev)
> >  		return ret;
> 
> This one could be dropped
> 
> >  	}
> >  
> > +	return 0;
> 
> And use here directly, like:
> 
> 	return ret;

Ack. Thanks.
Will fix that into the next version.


Kind Regards,
Tommaso


> 
> Thank you,
> Claudiu

