Return-Path: <linux-i2c+bounces-6899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F053B97D674
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 15:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B21D5283575
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 13:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7488C156F2B;
	Fri, 20 Sep 2024 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b="G4qCWVIS";
	dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b="G4qCWVIS";
	dkim=pass (2048-bit key) header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com header.i=@mail-dkim-eu-central-1.prod.hydra.sophos.com header.b="IjNcf7GB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11012032.outbound.protection.outlook.com [40.107.149.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E913BBC1
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726840026; cv=fail; b=ni4URNfyumeVhgLRFpuSCH5g66o72oais8PXlJQsNJCYkCbBdwHbmUnbVltPOxP7FZ+6duJ1Q36mdPHevN1Cz93Bd/jTFBn85j4j6Dz7d8rywB/9/MTygyYiZBo0d4kV2IM5P63nn+YR6TpXxLLiTEH3oG25xhcajcWCkJXWgBA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726840026; c=relaxed/simple;
	bh=lizLWlnMdb9Tphgux1Lfv7b9F/oRqKqu5zuGwGqlt/U=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lWTMaIQ6jPnn5hrMk+683XWMNGxjU6i+99CfitrXAuum5CRYlPNB5Es1nPx9Hpcm0tZPClLeR95DqQ59dGm4/DSyvHAR55cj0TEcdcszglZS5bHfglsmn0ku3J1SI6YC/1cg+ehQJaZkTTmc6WywvqOOMIyx2jdU4yPwZl5/f/A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=corscience.com; spf=pass smtp.mailfrom=corscience.com; dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b=G4qCWVIS; dkim=pass (2048-bit key) header.d=corscience.com header.i=@corscience.com header.b=G4qCWVIS; dkim=pass (2048-bit key) header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com header.i=@mail-dkim-eu-central-1.prod.hydra.sophos.com header.b=IjNcf7GB; arc=fail smtp.client-ip=40.107.149.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=corscience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corscience.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RgM6qo1Y4QZonxQsCmHphgHiRIg+/bxaDjKB+2Dpp5u1Qj9kunmYbvU5jBeyToOYSSusxw3F1yXOq0QTjV0//UOwnS3WAcdDuQ6cKxBbYSWGlERzEVmwfw74JLoqk/3Y4k/iGHX7H6MHcDydpGrV/UWTEKqx19usnw6v5s0WjBd3A0EtKW3IZyFcyR9u+4nmRYRhb7IfOnJwtvybXQWcs5Gs//JbSU7S0qROL3gJ0zSdxa46+3O3Qrocm9RxSLGgVq6OLqJrrsFiXXOGnvbUxXslNn1Sed8Rv4pcTgAe/upCuk8QU7jYYLh+VQ+fk9buTwAakiPi75yXRt8GkMHNMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/qSSRF2nN/qm8/Kt2bEYLUDVInoqD1rk2rVWNDliD8=;
 b=Y7SpPAq1/ojzf5vvwPCPFYzOJYuMF6BCm9RiROiIaIK2W+3QbEiSWNcL+qotsbq1oQgS9FPQ7JSu+zCpgTWpajTxM6wbOCTxeV3TSnfnYRbzcYPjTMfpPW4b2HGPpH4SAMOwMrDczCwPVaEVUjZjCT3H5eHxoIeW/sUs9oT0D/KNcUvs50RoMPl2D1Dm1aqzloPO0jHV3k9W+DwKAoMu0ZGUA5j0TNARI9VzQ7xH0aJaN8rMRdU4lKISCmJDG46FCNg4KSocmj22u57b7WtGIYsw8zNVny6qQW5KFDJzyIeGYEL1arYj4fizVsiN1qgqWEFqW2Te4E5dY4KI1K7kHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 94.140.18.225) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=corscience.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=corscience.com; dkim=pass (signature was verified)
 header.d=corscience.com; dkim=pass (signature was verified)
 header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=corscience.com]
 dkim=[1,1,header.d=corscience.com] dmarc=[1,1,header.from=corscience.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corscience.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/qSSRF2nN/qm8/Kt2bEYLUDVInoqD1rk2rVWNDliD8=;
 b=G4qCWVISr+grDNznEwkuXCoF4QyP4iVk7LN/uRdVrBRckt187oPdL2rRelvGMq7MMBjStfYcwhZykzWc5c2EfT7UZBTr99brr9wZi6X8y3XFd0dQJz6RhCgEifBoshD99hX9CGDR+LydwxTKQmZLKUnYGGkdOD7MxefLTogSzOJUiJhHxCPNyQ7/WYRfbg5r+495ytNKhIEU/4sGZ8yEwR/FNP6R/2rUsPuHwLpJpCWcFpSfFUKZww0GuTdXalX4MgGfhNj6Cj+cfqJt8iCrHBPKsvVi9eEDBUn83NQHeYz63iTidaeLYLeKGvTRYh5WH+LF2hxXBK15cFcbeREEAA==
Received: from AS4P190CA0052.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::24)
 by BE2P281MB4701.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.19; Fri, 20 Sep
 2024 13:46:59 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::8c) by AS4P190CA0052.outlook.office365.com
 (2603:10a6:20b:656::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.29 via Frontend
 Transport; Fri, 20 Sep 2024 13:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 94.140.18.225)
 smtp.mailfrom=corscience.com; dkim=pass (signature was verified)
 header.d=corscience.com;dkim=pass (signature was verified)
 header.d=mail-dkim-eu-central-1.prod.hydra.sophos.com;dmarc=pass action=none
 header.from=corscience.com;
Received-SPF: Pass (protection.outlook.com: domain of corscience.com
 designates 94.140.18.225 as permitted sender)
 receiver=protection.outlook.com; client-ip=94.140.18.225;
 helo=mfod-euc1.prod.hydra.sophos.com; pr=C
Received: from mfod-euc1.prod.hydra.sophos.com (94.140.18.225) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 13:46:58 +0000
Received: from ip-172-20-1-189.eu-central-1.compute.internal (ip-172-20-1-189.eu-central-1.compute.internal [127.0.0.1])
	by mfod-euc1.prod.hydra.sophos.com (Postfix) with ESMTP id 4X9DFt1N0rzCsVX
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 13:46:58 +0000 (UTC)
X-Sophos-Product-Type: Mailflow
X-Sophos-Email-ID: 99c335f0481f4e658182a7598bfe9a1e
Received: from FR5P281CU006.outbound.protection.outlook.com
 (mail-germanywestcentralazlp17012051.outbound.protection.outlook.com
 [40.93.78.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mf-outbound-eu-central-1.prod.hydra.sophos.com (Postfix) with ESMTPS id
 4X9DFr6XkxzlVjQ
 for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 13:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x35aS6iBUzOe747GYgOXTdBozMjbcdZulyOzR9EirvNEs0qmBphrjjL3FwWK1wMcjm/tu1uMUyx0yNUTjJnWOM9tUcqiEZBzQjeXGB/Dv/a7JuuOj0wcDy2U8OjIzyfL7pVvm/EKJgQ4ZLZNJ5LJzldRnfUJGB4sXiSXi7kTyrXUKxpm3KUocNfORJrFhEXFu+FAnn8KTbFu3LGCD8gwnE7M+5i1BxG3PZ+pvsvwS0+SuOYxrJmcSB+3vXTyxNYuidP4tCtiM6vXglUBA70AUJKKeDbg0lN2qqwx8cMoheiOj8A3TVWGgnnjE1Rt232Dis6YHjz0Izdpamc8nkngQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/qSSRF2nN/qm8/Kt2bEYLUDVInoqD1rk2rVWNDliD8=;
 b=xwdDcV6TOrEBHISWnQ7IxipmtkxKm60J6/4BRmNjsF6xIg5F8ycnso1eh4q78v7BhOZvgjXXfMK9LJrsvnO7aP87r73UP3a/HJXv32xJtO9QssUp7jfeU2OvfRujAqZpka2zwWTHYK5CNXWA//eQbtxNBbSyJjheJEzTZ9IDr4R2m8jGyF1gk8ErQ88oWbRKPo1qH4P0nJGJyrnNec0o2uwQmDxGPpqSnglCESb+ZzXy7zHz2nQbpBzemIbpEPADBg7YNSZlzmbvQWtS9EJryXDOfPKOrR3btfyZ/z3mFGPF9yE6W8JqNb1P+0zpfcR6UTHL2gFSKQfrStx6eYRWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corscience.com; dmarc=pass action=none
 header.from=corscience.com; dkim=pass header.d=corscience.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corscience.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/qSSRF2nN/qm8/Kt2bEYLUDVInoqD1rk2rVWNDliD8=;
 b=G4qCWVISr+grDNznEwkuXCoF4QyP4iVk7LN/uRdVrBRckt187oPdL2rRelvGMq7MMBjStfYcwhZykzWc5c2EfT7UZBTr99brr9wZi6X8y3XFd0dQJz6RhCgEifBoshD99hX9CGDR+LydwxTKQmZLKUnYGGkdOD7MxefLTogSzOJUiJhHxCPNyQ7/WYRfbg5r+495ytNKhIEU/4sGZ8yEwR/FNP6R/2rUsPuHwLpJpCWcFpSfFUKZww0GuTdXalX4MgGfhNj6Cj+cfqJt8iCrHBPKsvVi9eEDBUn83NQHeYz63iTidaeLYLeKGvTRYh5WH+LF2hxXBK15cFcbeREEAA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726840014; 
 s=v1; d=mail-dkim-eu-central-1.prod.hydra.sophos.com;
 h=Content-Type:Date:Subject:CC:To:From;
 bh=Z/qSSRF2nN/qm8/Kt2bEYLUDVInoqD1rk2rVWNDliD8=;
 b=IjNcf7GBnbkq96JGq73qr3sV5UmZ1jLjWU4sn7PVLkjucqtgFUhJ2LDkDvB4tyUf
 G5qzVSz6EwSv7ugSrnGaGFSAxKgWNLeF/hr3Dm7VM0zr03vq0XmBoLCGf+0mD0FI8DE
 fZm6liGCvRpskkGBEUPhkO2Ae4sdf7CFvnchFBfqE4mcG6cxLwnMx84/eOJsxQLjJMZ
 iNF36oqUFV40vbGcaE3zx0foIPDatrKunLn7Z+cYhRkPK8ToiLO3J5+ljGEIlAhya02
 eqQDjFOzJVUVzyD568Y/j8B4rrGo7md5YRQDDpPi32ap6SYPPqyz7hehh3aeYUa+f7S
 Z/fpA8rGQg==
Received: from BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:4d::9) by
 BE1P281MB1569.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:18::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.22; Fri, 20 Sep 2024 13:46:54 +0000
Received: from BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4f14:70e3:8315:3601]) by BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4f14:70e3:8315:3601%7]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 13:46:54 +0000
From: "Weber, Thomas" <Thomas.Weber@corscience.com>
To: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: "Weber, Thomas" <Thomas.Weber@corscience.com>
Subject: imx8mm - sbs-battery problem 
Thread-Topic: imx8mm - sbs-battery problem 
Thread-Index: AdsLYT7m1z8trsrNRdm1xxeaJVp5ww==
Date: Fri, 20 Sep 2024 13:46:54 +0000
Message-ID: <BE1P281MB2663A43414C772601C3D6AAFFA6C2@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corscience.com;
x-ms-traffictypediagnostic:
	BE1P281MB2663:EE_|BE1P281MB1569:EE_|AM3PEPF00009B9E:EE_|BE2P281MB4701:EE_
X-MS-Office365-Filtering-Correlation-Id: ef060008-1de9-42c1-f6e7-08dcd97ab2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?HKkpUOQFNWcr0XXSXZmfj2KRghpi66XeJVyZcWuJj+Q4mVJd7tWXmTw31D6f?=
 =?us-ascii?Q?8A1en5HFC54p/88QNlpAqJgv+DmBpp70WlvIwjiJJHmfNTvrYDc3JaJyFYZ6?=
 =?us-ascii?Q?n96ISuZWQ5Nj50MR1mp2i+w4X0RtBJMUfklm9S5NXqbs87qIgluNnKWy6UY0?=
 =?us-ascii?Q?bxOJXvCBo2WC609tI1c4/3oCtCrPv3OH14He1jptt+oyTszthazowNR+ahRN?=
 =?us-ascii?Q?iHuHrCqdqWrDxqEPXkicW8KyxtqzV72gXNt8nY0lgt7gyEVGiTBJF8Ienb8c?=
 =?us-ascii?Q?0GKGqsxr8KqGEld0QEnoVmBOMEGeEuu9pKnQgR56JJYfqlxDyAHOuvoVFcCU?=
 =?us-ascii?Q?g8GMcGcx7r9Z+pH3rQ+cF01SF/bajXvJFsqtbODdzn7WbfvSJSJYHZTIsKZD?=
 =?us-ascii?Q?Vaun6qJc/mulXerDPBGguHftHjrdmAqXQfsF+xNyxYBoijX+If1clGyNgWg0?=
 =?us-ascii?Q?yRuY/Bn2bc4Y0N+W2F/I6wquX0/kWHZEOLztTbV3+50t8aBDbejkglU0vnzr?=
 =?us-ascii?Q?pjhkLfYgwvyeX3i17CYqF9wMkyolgwt4Y4s8/UuqrSg7yLKn1w0DXzWeIda9?=
 =?us-ascii?Q?AqrUtFiyHgwqEyl2TlIEKJPMvdvs8dkFMa/3t6/MIVLPvVys5m4lVL0QniKp?=
 =?us-ascii?Q?wmpnffohHt1o7pYGgaX9SY1Lof1hNwFn0Gp4N4jmRGWWElQ6y6UPaRiXbNe5?=
 =?us-ascii?Q?5aSz0GquBcVlYyD+iUqtclrdyWiI4x6TsPXaBk1srBGVfVfsNXuKUSgFnYeU?=
 =?us-ascii?Q?2rcCAJzd4k4rvyMR+RALreXn/UB5FAEf3Mek2ZxMFkuWbhj9yttGp4iVIKos?=
 =?us-ascii?Q?AUaKOYHfvh5x2Q2Wbif0l33HIVnBD8u3KEYi5hDGsN+VzjF7JwGmfZImpWcT?=
 =?us-ascii?Q?6erUJm7zBnGzB6tF0r9BKO+u1YP87SeFOJgU6O4pH9bkUkCOGzSetR2tkglB?=
 =?us-ascii?Q?AuBqkzpTjcVIwreyxlTURSENzP830I6y5j9hAr5Gt8Kv8uYd03PS5jI85cc4?=
 =?us-ascii?Q?lle1wiBrtcE5BQBuybRyjV+ADDQOAyuwwMMVah/8MHAuxUUJiVDA8G4Y2i5f?=
 =?us-ascii?Q?zPFmzk3nHRwiFibB7oGLMzFTvTe3KQJfk2M7H129VkJ1oQeF4JBe9LF+J5tq?=
 =?us-ascii?Q?GYtCGThiF0QttOjPqIylIxd/YrrevhwW207yK8RENPlnEmmdfGXiCm+2N+Fa?=
 =?us-ascii?Q?t5Ue0FXODp45CWlQlwcQbk+Haet0VHE9PLMp2JJ4LGU/CRfJUfF3Wb7O83Kv?=
 =?us-ascii?Q?CxjI3CZ5n01dax2oKpm0gNfaRWJwsA0Ix5QtgKwwD2Qs+Nid4Z8WWtLdhzQZ?=
 =?us-ascii?Q?i7jMI6VJ572eGscnlUELt/eYJsAkYb78YQEW3kom2mcoww=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1569
X-Sophos-Email: [eu-central-1] Antispam-Engine: 6.0.0,
 AntispamData: 2024.9.20.130916
X-LASED-From-ReplyTo-Diff: From:<corscience.com>:0
X-LASED-SpamProbability: 0.079439
X-LASED-Hits: ARCAUTH_PASSED 0.000000, BODY_SIZE_3000_3999 0.000000,
 BODY_SIZE_5000_LESS 0.000000, BODY_SIZE_7000_LESS 0.000000,
 CTE_QUOTED_PRINTABLE 0.000000, DKIM_ALIGNS 0.000000, DKIM_SIGNATURE 0.000000,
 HTML_00_01 0.050000, HTML_00_10 0.050000, IMP_FROM_NOTSELF 0.000000,
 LEGITIMATE_SIGNS 0.000000, MULTIPLE_REAL_RCPTS 0.000000, NO_CTA_FOUND 0.000000,
 NO_CTA_URI_FOUND 0.000000, NO_FUR_HEADER 0.000000, NO_URI_FOUND 0.000000,
 NO_URI_HTTPS 0.000000, OPT_HEADER 0.000000, OUTBOUND 0.000000,
 OUTBOUND_SOPHOS 0.000000, SUSP_DH_NEG 0.000000, TO_NAME_IS_ADDY 0.000000,
 __ARCAUTH_DKIM_PASSED 0.000000, __ARCAUTH_DMARC_PASSED 0.000000,
 __ARCAUTH_PASSED 0.000000, __ARC_SEAL_MICROSOFT 0.000000,
 __ARC_SIGNATURE_MICROSOFT 0.000000, __BODY_NO_MAILTO 0.000000,
 __BULK_NEGATE 0.000000, __CC_NAME 0.000000, __CC_NAME_DIFF_FROM_ACC 0.000000,
 __CC_REAL_NAMES 0.000000, __CT 0.000000, __CTE 0.000000,
 __CTYPE_CHARSET_QUOTED 0.000000, __CT_TEXT_PLAIN 0.000000,
 __DKIM_ALIGNS_1 0.000000, __DKIM_ALIGNS_2 0.000000, __DQ_NEG_DOMAIN 0.000000,
 __DQ_NEG_HEUR 0.000000, __DQ_NEG_IP 0.000000,
 __FROM_DOMAIN_IN_ANY_CC1 0.000000, __FROM_DOMAIN_IN_RCPT 0.000000,
 __FROM_DOMAIN_NOT_IN_BODY 0.000000, __FROM_NAME_NOT_IN_BODY 0.000000,
 __FUR_RDNS_SOPHOS 0.000000, __HAS_CC_HDR 0.000000, __HAS_FROM 0.000000,
 __HAS_MSGID 0.000000, __HAS_X_FF_ASR 0.000000, __HAS_X_FF_ASR_CAT 0.000000,
 __HAS_X_FF_ASR_SFV 0.000000, __IMP_FROM_MY_ORG 0.000000,
 __IMP_FROM_NOTSELF 0.000000, __JSON_HAS_SCHEMA_VERSION 0.000000,
 __JSON_HAS_TENANT_DOMAINS 0.000000, __JSON_HAS_TENANT_ID 0.000000,
 __JSON_HAS_TENANT_SCHEMA_VERSION 0.000000, __JSON_HAS_TENANT_VIPS 0.000000,
 __JSON_HAS_TRACKING_ID 0.000000, __MIME_BOUND_CHARSET 0.000000,
 __MIME_TEXT_ONLY 0.000000, __MIME_TEXT_P 0.000000, __MIME_TEXT_P1 0.000000,
 __MIME_VERSION 0.000000, __MSGID_32_64_CAPS 0.000000,
 __NO_HTML_TAG_RAW 0.000000, __OPT_HEADER_ALL 0.000000,
 __OUTBOUND_SOPHOS_FUR 0.000000, __OUTBOUND_SOPHOS_FUR_IP 0.000000,
 __OUTBOUND_SOPHOS_FUR_RDNS 0.000000, __PHISH_SPEAR_SUBJ_ALERT 0.000000,
 __SANE_MSGID 0.000000, __SCAN_D_NEG2 0.000000, __SCAN_D_NEG_HEUR2 0.000000,
 __SUBJ_ALPHA_END 0.000000, __SUBJ_ALPHA_START 0.000000,
 __TO_MALFORMED_2 0.000000, __TO_NAME 0.000000, __TO_NO_NAME 0.000000,
 __URI_NO_MAILTO 0.000000, __X_FF_ASR_SCL_NSP 0.000000,
 __X_FF_ASR_SFV_NSPM 0.000000
X-LASED-Impersonation: False
X-LASED-Spam: NonSpam
X-Sophos-Mailflow-Processing-Id: bbd3f74249a14118b76bfd72e9c46875
X-Sophos-MH-Mail-Info-Key: NFg5REZ0MU4wcnpDc1ZYLTE3Mi4yMC4xLjE4OQ==
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6f5dfc4-7b03-4bc1-59b5-08dcd97ab04a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uxyT765+7x0BWTgu5HZvHyX/44lk0RpCmh5+akwKDJKDQ3d0kyDoMKO++yQZ?=
 =?us-ascii?Q?CQbHSwH6s6BVcTn+gDOVoT+mHZXlN1kipD9VhxX40Uxscnw3h33eCbyNvtHF?=
 =?us-ascii?Q?YpvnyB/waCtwdPj4ztxc3jdk//26lb2KEA/CzO70UATa2DZxMOzVsYu6dn/w?=
 =?us-ascii?Q?50zoz+hXxjWz9M6hjmhdE7oAuEEyupCnC47bfwjfr/9cq86WLUe8zXRb0dEV?=
 =?us-ascii?Q?zbt9e/vhTcvDpuV4lFaJXQB0iU8ZlOtKqfpHdvoLRnNamGCoT1wwlmLwmMQ4?=
 =?us-ascii?Q?JBR1Li/L5k7cwZZpZ0JAExWeSQFwwqrFyeMkQHIT5vik8K+f6dfinPYrIULz?=
 =?us-ascii?Q?pjzBrGVps1TnyULLBfzBvUcgHszQCofe4yCWU1cSDj96TgDDp4ey127pnwPj?=
 =?us-ascii?Q?QxVoqX+kyV/DI79GQh6RjjZpIoh2xrOzoJlVrM4fTHl6788PQ4ZaUzFU0Y8X?=
 =?us-ascii?Q?C+CwCO7ypEdLpOJIf401NRId270KzMdFRo0Yfu/LAr7CJ5iHi7Zd+r4nIam7?=
 =?us-ascii?Q?4DhwgqF63KBAepx1gBbsz/PjXy0ijuiCyzJ1CkFGBjvJqjhOR8hTKDB7MY4a?=
 =?us-ascii?Q?SxsgkqQCzv0QTGFMx1pFIlsk/ODCrHUFgZ2/dfhMyK4LSr3MrweO1CpY0HkU?=
 =?us-ascii?Q?SnQf9SOWNec83PBUm/64uXHYiWJ1ulfh/JL7iDDYzXF2973BDW3gOwd+hR/R?=
 =?us-ascii?Q?cmCxtmrAt9k1Z1/d7Q91k2EePn3dreeVBjpXTh4siyOossOHSSOdGfYIVFsu?=
 =?us-ascii?Q?awfc1W5CO7tc8b2DV4xL4sGmO2kn9pRn2N6aYVcqreaBVC6JET6jEP6crVtD?=
 =?us-ascii?Q?m0IRDCT7q6Xqj/QcFaliuD3AlS08RbUycCu38QEzdXZnv7yfGvo74uRy3ED6?=
 =?us-ascii?Q?R2or69gAzc9KjloF+8e/3Y0Q50W+Bl81SMVWRIMFFW8UtGMiLFPuxgLgMJrJ?=
 =?us-ascii?Q?hdNwohob+rlHIX5++0Lcqx/A/L6RmG3TlUzNQsx/IJj/oF/ujN9J3oWgIwUp?=
 =?us-ascii?Q?fWwRamfWV0Knbg9s74N4xHk4lej5wIFL8mJMLCb7gB9WIE5JhZNfWjt1G0Lp?=
 =?us-ascii?Q?saNZhOkXS51DlP+wcZhrktYO6vsHjALznAePaCuSeKH1A+dTjBZGLX0GW8Ni?=
 =?us-ascii?Q?gEo6LP7zUWgsKB+9V06YN3lxTUjo9UtcqA4ZEZ4XY6lw8Sk++FZGG2XP1cDO?=
 =?us-ascii?Q?XIJjUukv33Q3lsHR5UuvlkDjARkcuvC7k1Haf9ZuGr5ZcJXSXfbBpoYD+Ip0?=
 =?us-ascii?Q?Zfll3xjyA7EnrhJRemG8HTXAN7pig++S9uqQQZ7Io/Xfrlwxas5+NgiuGtU1?=
 =?us-ascii?Q?QNuf5Q+n31gjZKTqL+Sjs3xmG4kGu21wQwnFACItyZCvhm5t8CBi74tog8wL?=
 =?us-ascii?Q?zrDAPz0=3D?=
X-Forefront-Antispam-Report:
	CIP:94.140.18.225;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mfod-euc1.prod.hydra.sophos.com;PTR:mfod-euc1.prod.hydra.sophos.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: corscience.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 13:46:58.6125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef060008-1de9-42c1-f6e7-08dcd97ab2ad
X-MS-Exchange-CrossTenant-Id: 6fa424d4-13d6-40c4-a9ea-681919dc6b2f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6fa424d4-13d6-40c4-a9ea-681919dc6b2f;Ip=[94.140.18.225];Helo=[mfod-euc1.prod.hydra.sophos.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE2P281MB4701

Sorry, if this is not the correct mailing list.

We have a NXP i.mx8mm SoM connected to a battery (bq40z50-r1) and a battery=
-charger (max17435).
The battery is broadcasting charging information to the battery charger.
The battery information is collected on the SoM by upower.

We have the problem that we get the following messages:

[  757.014871] i2c i2c-2: SCL is stuck low, exit recovery
[  787.015004] i2c i2c-2: SCL is stuck low, exit recovery
[  797.017727] i2c i2c-2: SCL is stuck low, exit recovery
[ 2257.017638] i2c i2c-2: SCL is stuck low, exit recovery
[ 2257.023154] i2c i2c-2: SCL is stuck low, exit recovery
[ 2287.010567] i2c i2c-2: SCL is stuck low, exit recovery
[ 2307.015255] i2c i2c-2: SCL is stuck low, exit recovery
[ 2357.018429] i2c i2c-2: SCL is stuck low, exit recovery
[ 2367.007989] i2c i2c-2: SCL is stuck low, exit recovery
[ 2377.014786] i2c i2c-2: SCL is stuck low, exit recovery
[ 2377.020321] i2c i2c-2: SCL is stuck low, exit recovery
[ 2397.015635] i2c i2c-2: SCL is stuck low, exit recovery
[ 2407.016731] i2c i2c-2: SCL is stuck low, exit recovery
[ 2827.015186] i2c i2c-2: SCL is stuck low, exit recovery
[ 2827.020808] i2c i2c-2: SCL is stuck low, exit recovery
[ 2877.017770] i2c i2c-2: SCL is stuck low, exit recovery
[ 3847.014759] i2c i2c-2: SCL is stuck low, exit recovery
[ 3847.020281] i2c i2c-2: SCL is stuck low, exit recovery
[ 3867.017461] i2c i2c-2: SCL is stuck low, exit recovery
[ 3877.014779] i2c i2c-2: SCL is stuck low, exit recovery
[ 3877.020308] i2c i2c-2: SCL is stuck low, exit recovery
[ 3887.014755] i2c i2c-2: SCL is stuck low, exit recovery
[ 3887.020289] i2c i2c-2: SCL is stuck low, exit recovery
[ 3887.025852] i2c i2c-2: SCL is stuck low, exit recovery
[ 3897.014890] i2c i2c-2: SCL is stuck low, exit recovery
[ 3907.014850] i2c i2c-2: SCL is stuck low, exit recovery
[ 3927.016968] i2c i2c-2: SCL is stuck low, exit recovery
[ 3937.014902] i2c i2c-2: SCL is stuck low, exit recovery
[ 3947.014960] i2c i2c-2: SCL is stuck low, exit recovery
[ 3947.020480] i2c i2c-2: SCL is stuck low, exit recovery
[ 3957.015375] i2c i2c-2: SCL is stuck low, exit recovery
[ 3967.014761] i2c i2c-2: SCL is stuck low, exit recovery
[ 3977.015700] i2c i2c-2: SCL is stuck low, exit recovery
[ 3997.014773] i2c i2c-2: SCL is stuck low, exit recovery
[ 3997.020292] i2c i2c-2: SCL is stuck low, exit recovery
[ 4337.014896] i2c i2c-2: SCL is stuck low, exit recovery
[ 4337.020428] i2c i2c-2: SCL is stuck low, exit recovery
[ 4337.026014] i2c i2c-2: SCL is stuck low, exit recovery
[ 4340.383912] systemd-shutdown[1]: Unable to finalize remaining DM devices=
, ignoring.
[ 4340.518821] imx2-wdt 30280000.watchdog: Device shutdown.
[ 4340.524265] reboot: Power down


The battery seems to send their messages to the charger during transmission=
 of the imx8.


My device tree:

&i2c3 {
  clock-frequency =3D <100000>;
  smbus;
  smbus-alert;
  multi-master;
  pinctrl-names =3D "default", "gpio";
  pinctrl-0 =3D <&pinctrl_i2c3>;
  pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
  sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
  scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
  status =3D "okay";

  #address-cells =3D <0x1>;
  #size-cells =3D <0x0>;

  battery: smartbattery@b {
    compatible =3D "sbs,sbs-battery";
    reg =3D <0xb>;
    sbs,i2c-retry-count =3D <2>;
    sbs,poll-retry-count =3D <10>;
    host-notify;
  };
};

There is an alias for i2c

aliases {
   i2c2 =3D &i2c3;
  };

I configured the i2c as smbus, multi-master because the battery is also act=
ing as master, smbus-alert because battery can send alerts.

But it seems, that the imx8 is ignoring the second master and trying to res=
et the bus.

I would be thankful for any clue.

Thanks,
Thomas


