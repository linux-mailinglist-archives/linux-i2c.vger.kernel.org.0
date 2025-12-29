Return-Path: <linux-i2c+bounces-14839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC4CE7081
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 844EF300FE28
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F2831ED87;
	Mon, 29 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BcmxIRva";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BcmxIRva"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023129.outbound.protection.outlook.com [40.107.162.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DD931D379;
	Mon, 29 Dec 2025 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.129
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018477; cv=fail; b=RPEKAnVldPYaGY0oKr4bb1L/kE2vGJJWSUHKbExeBZ6I5BZuLwfrJEs56VNLI4mFHBJ9hG0tyOb2kFyZLjTHcyTkchFjrWVQcfvh008kjqZYdvx+EkSs9dC4CTsdJC8SUbsYA9SnPA9xzX2STRR6z/tJzFW1gXqbIr4QVpy7iWo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018477; c=relaxed/simple;
	bh=iXUwiMJMoi+b3tIgSe+8YkE5h2rArsiFUHK+ajKHt70=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JjpRMYQEwo221vCpQdmVvTM6HLIaxGsKC3RDjpy0cJg8qOZvvAi6fcZxVHadrZ1XIwtb3FGoOsQJcmmvjmZXUKd50EJyfubPrA3u/URNJwIaeLGrbvJ47maus6y9HC06gD5Grl/dxcYwkRSOYcqiamKFYuDavw5TeQDLaN8POIM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=BcmxIRva; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=BcmxIRva; arc=fail smtp.client-ip=40.107.162.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E5sZhTKrXdgHFnmXvKOlc+1RZoNIK1h4ZHykpIgpt3JKZfk6pEVaV2WI5z8OoOq6gLR64r9mKuYtBGvUuJdxOjwDlk8i8C5XTb1InHKnrmRtswz9+92QfRYb+7cjkl7WmB5CBHbkHaVBzap3wXO8V5RBUX3GFh5oK/F2/6S+JVlUgf772dMqoF0RC+Bm+8jP01tQHQzB6nFiP+3q9kNSe0hhSZ0K+oG29ps+gPomTbGVn+MynLsugDLUofnnrQ2LX+jNKEtS9lupMzbazTvHnBE6XzNVemGEDOGyVI2cAJOKCLbOs7+Tjc+1CUaKS/CFqQGWOt+v5qLBralbHFzPGg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SI3g5JAhlfQKE0TPS28zp3jIhUDFFcxrki4KhxvqL8=;
 b=g30BjY/2P5BeHW7j7E/hUNEtyQp1kIKThCr1iX1qnAGwHB+gYaenO8M08gXiFQ1IMAzEWiWTACtLTzAKP21DjlUGyd13NYF0oMMkYsXp/UuNTIje3KfxLZIcEN98rujVrvPg/Huv+iKie/o2AZw+xWpwffoc1R0NgCiu6m99ISAEFR3/qNR8Mbty1fdSd2zpeACqXmi4nB8RABbvsFDvZzUvxQI8Cv9bzUPz03NMuE/vCoctx3IT3ePtQVhONKVpn0t2PSGcBXl98FD96fvoIgVO6+4ZQv8yO3Mg3ptGN80Lyj0ZbEciMOj8ItDXIuEaGiAYt/n5KKgvKTQ7a/qmqQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SI3g5JAhlfQKE0TPS28zp3jIhUDFFcxrki4KhxvqL8=;
 b=BcmxIRva9bk6MQbbRqG8sXZgnalB5Fan42Op7kblJSSf+MUuU+oAHzbJtAi+6+vf5jMvRgEx0TbZA9yapxn19UzhQ2e2S5FeZqB27Lk30ZgzLcHB/+ggxhauyqeMuuK7XsH+gkzo/TozCdlx52qgKK4Lc6QbyQ/UcYyg1jmmpjE=
Received: from AM9P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::20)
 by DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:51 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::c5) by AM9P195CA0015.outlook.office365.com
 (2603:10a6:20b:21f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Mon,
 29 Dec 2025 14:27:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 14:27:51 +0000
Received: from emails-6921961-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 625CF803EF;
	Mon, 29 Dec 2025 14:27:51 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767018471; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=0SI3g5JAhlfQKE0TPS28zp3jIhUDFFcxrki4KhxvqL8=;
 b=gtPTN+bBQ6Tu4/TefB/V49OQY4miRXpe+y5ApvtozzfsGh6s6fRgL+Tvk4J6C1H/7iOdy
 wcn5jm7cL77CBIai2UUTxmRLYVeBJoreaBpa+NsKFxnPAjj40Qhiami2w18eRX4s/nALAsU
 O0WBouQi5Uzz8zuqShY/gm9nmMwhizo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767018471;
 b=O8fOkE68S0uWSeXEvtNUVj9i0kvLeERkMgI39azxiGJxHFO+ZXNPDAkp/BRW/+2WJsOXL
 AHpHmOoE8RkKziWC8c4mtm4YBrS7O+ULZxjpjfh74Bx0gP+huA3ua4b2lA6NxlDjsO46R2L
 Bt4tQu7D4AzVLZLqEfxaxLrLdCvgpe8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBnSv2tPVL01cQeg/WdbT/7oG3s8YzNyH0y93RGZ2pQfnQL4tyl+WFNEWijaV7sldmbmFBtOsDt8slhEp2dLC2IcODzkzsyXcG05Pg2oK6fxjwK2D+DsoTwdOHlnCSepOsZCyEjuD2Rj9cU/tiYY8ZaXOn2DPhUOYGhazITuN1VgrcC0KlItLnxR8sWBamPEVHh2TqHHvGFAn57qRd2HmPfY+xXiWxy1mAduf7DNoBgkTFSEQKey8Zn9H23XiUmZRdzqI94UnWppBl9bV+oVRMBehCUIhS14AH2f8NkAWOrOy25Cd3Jqfs+rYnn85xM7JpLTAdL/K2krb5TPXV1WwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SI3g5JAhlfQKE0TPS28zp3jIhUDFFcxrki4KhxvqL8=;
 b=Empr4CF6PmI+N3QdB463usLoDoIC3/fd6wQyyFmS4024DTqjU2XInxA8StMnFko4ViPeffc+lHvj8ds9z5j5FYqvlRPuJ65hd3XYuhclMY+Ko5Dk6O0uLJFc+p4fdiUCngVUUHjWHixGd0Mw2BxNJupwsyDvgtBpd1vYX/gKxjiP3JNmOt47qlzmPYWjTcTDPLvHXoxwyEMmgPa1EUsrx8JeRefKVcujWqYcvw3gCufFk88A7BlMf6ZLmHRCeM94EDDSvIxBjoy+jhqLtS9+KtW5jRUzTRTCq2gApHiMgcG36aEWHQ8MXdOUqFGL0+MFxM5Cf7BwAC5VuP5g3sqIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SI3g5JAhlfQKE0TPS28zp3jIhUDFFcxrki4KhxvqL8=;
 b=BcmxIRva9bk6MQbbRqG8sXZgnalB5Fan42Op7kblJSSf+MUuU+oAHzbJtAi+6+vf5jMvRgEx0TbZA9yapxn19UzhQ2e2S5FeZqB27Lk30ZgzLcHB/+ggxhauyqeMuuK7XsH+gkzo/TozCdlx52qgKK4Lc6QbyQ/UcYyg1jmmpjE=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:39 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:27:38 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v4 0/7] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Date: Mon, 29 Dec 2025 15:27:24 +0100
Message-Id: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyPUmkC/23M0Q6CIBiG4VtpHEfjh0TWUffROhB+TLaUBsks5
 72HnpTNw+/bnnck0QZnIzntRhJsctH5Lo/jfkdMU3U3Sx3mTTjjBQBXNLxpROdp2w+0MqYAUdY
 gQZEsHsHWblhql2vejYtPH15LPMH8bncSUEbBohWgECSrz9HfHdLQdwfjWzK3Ev96zmDtefba6
 EKBVgqx3PLixwNbe5G9qSRXqAuJkv37aZo+X0+eSyoBAAA=
X-Change-ID: 20251128-rz-sdio-mux-acc5137f1618
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DU0PR04MB9417:EE_|AM3PEPF00009B9F:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa3b072-5f86-4962-cbd7-08de46e672e6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UHgxSDB6eUVVS0tNa3dwTU0wUm5NSk1JdGZoNGUwSXlFWk1OcmJaYkkyQ1Nr?=
 =?utf-8?B?WkYrWmw0K1FqenphRnd0NmNBeExtRExZMFZOR3FKamltZmJpWFBNOERjbmty?=
 =?utf-8?B?ZHY2VDRKTmE2V1RyN2JkWm9pa2l5UEI4T2xlcUUvR2xIbTZiTnRpZ0FJNW9Y?=
 =?utf-8?B?QXkxb05GajVrNWc1KzUzVFNlbS9TcVJrQTNsWEsxOSs0Z1lzQzhDWS95ejZV?=
 =?utf-8?B?SHg0Rjh6cVlHTHNBOFkzd0ptUEs1ZlEvaStBMkF6WkYxSitLeUJJWThHcmdo?=
 =?utf-8?B?ejE2VFZCOXlRWFFjSW8rcEpPMWp0UVlIa3F3VkxWQjhqS1dLZEVBWUpOcGJP?=
 =?utf-8?B?bTRvSmFaNkpZTjZkQWptSUhWQUZlamxBWnFZWVozczBJbFVyRWxqSW5wV1NI?=
 =?utf-8?B?RjdmUnVrQzU0SnRzcjhTRzJ5dkNrTytuaUUrclBtWkI1dVY3WE1iTnVCYUMv?=
 =?utf-8?B?VUJ2Z0xPdmcrRGVDdDUzT3JxY2JEWEcxdStHdWkrcnJKY3RTN21UZHkyZEw0?=
 =?utf-8?B?NjhuanQ4KzdLaCtzbzhPZHJERy81MUtqNHg5ZnY3eERGOUFSS2psdTZXSlFF?=
 =?utf-8?B?NUF5WnZtRzNlYjhwcm0xMnpVa1dkZlJQSWdFd3VBM0pqa2s2ZS9NWnRVYWpo?=
 =?utf-8?B?TW1uOHVSQ0dGTGd3dS9lZHlkOW9VV1prWEFkMUVFOWN0ZUpPMHNpcThhQUZJ?=
 =?utf-8?B?M2RqcFgrajJ4TG9FTFZvSGhWRENGUzhIVE1mbWRObmRUMDAzWlBzT2p0Qjlz?=
 =?utf-8?B?RzBZTzBjNjNWb0lQS09ieEdSekFVZ25UZ3FGb2d1dHc5SWRuRTloc0Fua2VF?=
 =?utf-8?B?VUxsK1BUVXpsdmFNV0dtemlaYzNrRFZmOU9zY1J0WUcwUXowekxJcm1vTDFk?=
 =?utf-8?B?L2lQdlYzMlJ2T0ViamlMc3pWZ01kNy9JQUtZR29ZMG1OdmJKeGpaRzg1RUVX?=
 =?utf-8?B?amJBdFNDb2xlYlMvUEx3VUs2VzRiMG1oR21hY0RPaklhb1k0Szk5RENEM1Qw?=
 =?utf-8?B?UTRXbGp5ZXZMMCtoczNJS2VCazhKQUk5WG9LcUh3Zk1YODNvTWxZUjFiMVds?=
 =?utf-8?B?cDZwcTh0QVNheHBHS3dBVlJCNVRnZWxPMDE1UGFHeURoSVl2QjZ6Q2taSG9J?=
 =?utf-8?B?UmJhZmlIRUc1dUNSRUM3QWRVSFc1TjA2eTB4VGgrQmFHRzBMWWZZV0Z5TlN2?=
 =?utf-8?B?NUU2Ni8zV0Y5am1MY1JPQXM5amxxTnZaSW05STh5bkY3bTVNUXlPU0x0UFFS?=
 =?utf-8?B?LzFVMjJMbG5TM3g3Z0pxSEJ1TUt4S2VZR2VRR2dVYWJjSWYrWkJOWnJmZGl0?=
 =?utf-8?B?RGpvc0g1K3BlSjlLZm5pZm5ZQ3dsYy96UndxMEtmVWVCdlkxODZiT2Fpb04r?=
 =?utf-8?B?TUtIQVF2MUtrY1B2U01xVFVJSllER3FDTXpya0FHcXVLNXIxVkdqMVpuNnhw?=
 =?utf-8?B?dDU0V3UzSjdaVFoxOVVOSTI1cEFnNzkvWEhnOVRJNCtlZ2wveitYVkE2TG9h?=
 =?utf-8?B?bGhyM3UwZ21pK0d2RWc3NFU3L0VNanRGK0IvSFNSQlFkR2hQK3J6R25jRnhu?=
 =?utf-8?B?T0FCbmNYOWpxVWtvYXBWRUNkWlhXUCt4c25nMmdKQzF6ZUhrQWZUSnhLdDVn?=
 =?utf-8?B?SDVQSG5qeWhwNHhUZithUER1OXF4Mk55dTZYcy8yckgreTYyc3o0T3I4UUxn?=
 =?utf-8?B?ekFKU0hvL0RMZ21jdGFwc2lSY1dIOU9rYVgwUHFhY2U0MS9GREhJWGE4Nytk?=
 =?utf-8?B?ZGh1YjlRZG40d0hqbXRyNWlLMEhNY0Q1ck8xV2dwK0hwUktPcmIyamdya25F?=
 =?utf-8?B?aDhQRGptRS9TKzBHOTJKd0NSdzVCSlpCdHlmTzBvZUdXQXZVZ2FSNHRUbUxF?=
 =?utf-8?B?Vi8vdGIvSEhZamlnYzUwY2lTOThKaTdFb2F4QmZoeVpiSDVwMHMyUmlHQlpG?=
 =?utf-8?B?dzBFS0lRMUZaVWJmbWJ6SnZBUG5qZk45eHU2amRDL2I2bHRNaG9RT2Z3MGto?=
 =?utf-8?B?UXEyaEZVUXh6ZW5KSjRzdlJlRWtUNlVyTW5XMk8wU1F4UHYxWHBEcVBMN1c4?=
 =?utf-8?B?dEJsU2pReGh0VkxyN3kwSTMwVDc2WlBkWjZEZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 100364db470b46c0aa3963cab8929ed7:solidrun,office365_emails,sent,inline:645ecd6cca06b82d0b30cc7ad8f78726
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecd06345-6d81-4ea6-2679-08de46e66b1e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|7416014|376014|35042699022|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGd2VVFjYjJOVnFBbHVtcE1lWXllZTN1aVQwejVtV1F4aTlTZVNqRjlON2Ex?=
 =?utf-8?B?MkI4UkNyNDQ3Mml4bHQrc1hhcmt4eEpmUjd4V3lmT1IwWEQrY2JBWnlrdWdw?=
 =?utf-8?B?QXNJVi93UDFaZTFTZVpuZjhCaXdCQ0poMkQ0enJleTNrUkMzSHNsSW9QUlcv?=
 =?utf-8?B?UWdzdGJjbTJnWEtYZm5ERWJ1aE5Hem5SYmtxd1l3S0o5dHpzNkplM0FyaFVj?=
 =?utf-8?B?aTF1cWo5RzV0ZVpabENNNUp2Y1NtcmVzNFVOWXRrVWJRL2pwU20zUnBDWWNW?=
 =?utf-8?B?dnorNm82WHJYRnpHcDFST3FsUDZOTlZFb2tlTlljVnRxZFR2K0l0T3AwWTdD?=
 =?utf-8?B?NERqVVVPWGJLTEZxWUpGaTVDNWJzcjZHMVBORDZQSlY5UkcvQnBkOUpxNWl0?=
 =?utf-8?B?L1BuSjY0eG9sdzZtUmdhM1Vra2YwMWNSN1EvYnhXVUwzQkVsSGE1VUorWnNq?=
 =?utf-8?B?R3VxYXowUFoydHdYMm1xNEpaNlRYY0pvU0cwZjlvR2xqbnpjblo4Y2lNUmtU?=
 =?utf-8?B?WW1BOElQTmdDRktDc3lQVEVDcDB2azNMeTU4cjY2YU5zL0RRMHlHelA1WnND?=
 =?utf-8?B?bm5NT3BFcGlsbnNyNk1jTTFPVzZySWZTWmVRa0psR3NXTlVNZDN2YTlYeTdP?=
 =?utf-8?B?cDZyT241TG5VWVUyWFFpRDZ1TFdGRis0NUNiQXRxaXZzSnpYV2NVTERBK1Fr?=
 =?utf-8?B?dHRvOWRBZWFBb01YU0xWeTRuZVlCT0IrWHp6WGJpR1hHcGZHWEpPZVBjMmQy?=
 =?utf-8?B?ZDZrYUIrYTgyRjllWXB5TnNPRm5jZDlNOXYrVndvaGxZTGdnVEVUNlpOS2pq?=
 =?utf-8?B?U0x5eC9uclBRT0ZEYUJOaGhwc3JTWkVCbFdhb0oreXpWclM0ZjhvODBQL0RP?=
 =?utf-8?B?Y1RPRVVva20yVnZzZFplZUM5azYvUmZHVUlPd1NvejZKWXNoaHJlZWlwVjI0?=
 =?utf-8?B?c201aWhiYlNVMlcyNUU3eVRHK25yWlVmS1UxS25HMlEwV2xOaHduU0NiL1Vv?=
 =?utf-8?B?NkFhNGx1eVc4RlVVandqYTFJb3p5WFBJY2EwT2pwZVJic0IwbFpXSDZzeVNF?=
 =?utf-8?B?N0c3eGlFYmNsVjE3Uk9KNFhUTGQ3UXZGTGpUVkRuSlpqeXFRUk1obGs3MFVP?=
 =?utf-8?B?bzRpT1dPaUFLZ3pIOEZQQmVJelE1bytGTHNhUjVpVG5DTHRHcE1ZWmRFTHMr?=
 =?utf-8?B?R0lmT0FaTm9aelhvWlBiZDNrTm9Malg3SXRBMjRDOHBxSFhEWDNTbjJwQWVv?=
 =?utf-8?B?dHNrOGFVQ2wzS1MvUWJPbndHQmxmN1c2WG5GV2RRdUNiMkNhQmVjVVBpTjM2?=
 =?utf-8?B?STgxQlNTVEtiYTFkdDVoRGI1RlZacmlzTVZzMjNyOTNFUkUyNGJ2SnhPRGc1?=
 =?utf-8?B?TlRLOEtscUpiYmJ1eVFHMi91RXc5eFN6UTlLSWFBbk9DWjh4NW5RTzdNOWd6?=
 =?utf-8?B?T1pqL2RoNG5rQS84b05nRGZLTnRKc1BwdWcvUW5OQXNtaDM5dEw1MGFoMzl3?=
 =?utf-8?B?S1hqcnNzOEg1ZjRJNjRQcFo2WUl5NlB0WkxXT3M3a1JmNWJtWTZwSnNVc056?=
 =?utf-8?B?RVZaTWxZLzVzclRtVHlLTmNsbjY5eFk2K2pSY1d1UlFXbG83d2VsdTlrMTRT?=
 =?utf-8?B?dGxNNktwbG1Sc05nZFNZS25mMWtVbmFzODc3M2JvTTA3RU1naG9PTWR0T0RM?=
 =?utf-8?B?SjliSEVKZnNOZ042eHRxdDQvWHJBckloNTlZNmpGU1A1dFFNMTVaL3MweHNB?=
 =?utf-8?B?UjRGZ05BaHZHSzFmV3RBRkJyMjdOQi9ZWkR5eWhwZWI5QWdrYks2bStuS203?=
 =?utf-8?B?Nkw5YnNVS3JSNG9yU2ZXczNEVU8ybmRYSWVKVzNvQnVwT2RXUVhZNUZoK2Ru?=
 =?utf-8?B?ZjhLbk14TWdZQ016b2ViMTNWWk1wVDk2bDJSZllmTm5zQ3Rxb1FTQy9rb0xz?=
 =?utf-8?B?U05qYWxiR2NwTFVFbm1PMHlWK3FNc1dLTFBaOXZCNzlGRVJydGZFanlBZlg5?=
 =?utf-8?B?eVJ1ZmV6N2tvWjRvS240YjBIL0t1MkJnK2dyRS8vQzJEYXZ2ZzJwSDUyUDFa?=
 =?utf-8?B?ZDVYMW5aMGk2V1pBbkNKYTFjUlF2djc0OFdXaFBtSlpvZzZ3aFhYODVvUkpB?=
 =?utf-8?Q?vPq7nhbHyHNTUf2K6NXDkeM3x?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(7416014)(376014)(35042699022)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:27:51.6354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa3b072-5f86-4962-cbd7-08de46e672e6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253

Some Renesas SoC based boards mux SD and eMMC on a single sdio
controller, exposing user control by dip switch and software control by
gpio.

Purpose is to simplify development and provisioning by selecting boot
media at power-on, and again before starting linux.

Add binding and driver support for linking a (gpio) mux to renesas sdio
controller.

Introduce generic helper functions for getting managed and selected
mux-state objects, and switch i2c-omap and phy-can-transceiver drivers.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v4:
- added MULTIPLEXER Kconfig help text.
- removed "select MULTIPLEXER" from renesas sdhi Kconfig, as it is
  not required for all devices using this driver.
- added stubs for all symbols exported by mux core.
  (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
- refactored mux core logic to silence ENOENT errors only on optional
  code paths, keeping error printing unchanged otherwise.
  (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
- picked up various reviewed- and acked-by tags
- Link to v3: https://lore.kernel.org/r/20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com

Changes in v3:
- updated omap-i2c and phy-can-transceiver to use new helpers.
- created generic helper functions for getting managed optional mux-state.
  (Reported-by: Rob Herring <robh@kernel.org>)
- picked up binding ack by Rob Herring.
- replaced use of "SDIO" with "SD/SDIO/eMMC" in binding document and
  commit descriptions.
  (Reported-by: Ulf Hansson <ulf.hansson@linaro.org>)
- Link to v2: https://lore.kernel.org/r/20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com

Changes in v2:
- dropped mux-controller node from dt binding example
  (Reported-by: Conor Dooley <conor@kernel.org>
   Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- Link to v1: https://lore.kernel.org/r/20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com

---
Josua Mayer (7):
      phy: can-transceiver: rename temporary helper function to avoid conflict
      mux: Add helper functions for getting optional and selected mux-state
      mux: add help text for MULTIPLEXER config option
      phy: can-transceiver: drop temporary helper getting optional mux-state
      i2c: omap: switch to new generic helper for getting selected mux-state
      dt-bindings: mmc: renesas,sdhi: Add mux-states property
      mmc: host: renesas_sdhi_core: support selecting an optional mux

 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |   6 +
 drivers/i2c/busses/i2c-omap.c                      |  19 +--
 drivers/mmc/host/renesas_sdhi.h                    |   1 +
 drivers/mmc/host/renesas_sdhi_core.c               |  16 ++-
 drivers/mux/Kconfig                                |   8 ++
 drivers/mux/core.c                                 | 153 ++++++++++++++++++---
 drivers/phy/phy-can-transceiver.c                  |  10 --
 include/linux/mux/consumer.h                       | 111 ++++++++++++++-
 8 files changed, 272 insertions(+), 52 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251128-rz-sdio-mux-acc5137f1618

Best regards,
-- 
Josua Mayer <josua@solid-run.com>



