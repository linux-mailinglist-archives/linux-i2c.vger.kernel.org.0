Return-Path: <linux-i2c+bounces-14662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4CCD3EA9
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 11:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B6BF3008575
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Dec 2025 10:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC845288505;
	Sun, 21 Dec 2025 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="DjkRgPBq";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="DjkRgPBq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023112.outbound.protection.outlook.com [40.107.162.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249F25B1DA;
	Sun, 21 Dec 2025 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.112
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766313484; cv=fail; b=k2G66w94y/8W7SYM1OZVDLd6y3sL4w68YFnWTXvddri6X5Pu55BQJmfqxfRvCo/asJXExGRSvPJ34Tut34QSZdEHpoIVOfUnFFuAjctDMqOfW5e5+eq7aovhRzsiUs3JIDnj2hD1yeYr6gps/fK+LFRSkWUg4H+8hsdGvjs36Ag=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766313484; c=relaxed/simple;
	bh=QHLLYX2gn4S9p1jpS5i1Epj2I0NaFtH8RqxrkG0kSto=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ezrX7IaYlhAQaAHXlTfM4Qs1iTcaoomguVzBryGkzbPss1Dwl5P5MEUCBZ0evU4+i8Txlh8wiXjR8OJCg5Sw2Z9RaPBsh4X8g8infaKKOJmxjJDujdjJaD/go67tNUUcwtSvjsWAlmRJa1iF/uApP3H6TVVK9zBdHpdsJE/daBM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=DjkRgPBq; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=DjkRgPBq; arc=fail smtp.client-ip=40.107.162.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZwjDJcMSuulq0C12oPsCqJi9kZypeh6ECCRsn0FRNqsWcq0Xb2nmkUgrqvuQ8BqL2xieHXgh97pwr+fMqccSdMHHDpUyrs3lhMSORtlZ6OQd0VprT0AkspbyyB663miioO6lAqXkpAXpT8vOJdyaHm4sgsCnJlrTv1rUImlr4YKGBPuemDHFy4xZqksW0oTJ0Og1H450Zt2jDseLM70MbH5e1Jl+dro24n7I3Lja8GP8ZsLvngywFQbyKb/xbgKUG4z9sM4UK0M+GzstgrXyXHzMpinxWRzygO9M0iqJQiQajzkqRycTlQlpCoA7oPPqIMWnE4SykokcF9lZlp60rg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHLLYX2gn4S9p1jpS5i1Epj2I0NaFtH8RqxrkG0kSto=;
 b=G+jLsrquKxk9PobOk+CFsK1aQ2fGGddyGIZT6iKqPE/FQ5ozjv9TZHNBoZxaH+7AU7uc3M9xEUD/MW6N285Gv3sG3y+L2egmEAnIM9eukScAaPQ1+lC29kE4Nl0NYHbyZXoQjceRNDwpNb2mfxPfWKm2CSnqeC0dhJXAFFzCm+PR1z+dNDHxupZGeptV5pmNesm489TevVlZDLWrLDC/bqt5nAg132eTlATwRzKCva4y/zv/d0G9D5N8Wttsdu9xjhajS7c18jivkCFmIjXpYrRxNRtS8O9n6EeAna3GGzQN2UR4o+rctU5VPho/9Odyw1CiVe13vxXXhJNOBX35rg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHLLYX2gn4S9p1jpS5i1Epj2I0NaFtH8RqxrkG0kSto=;
 b=DjkRgPBqQauuCSxEe2b/4bJ/zBjtp69g7YBUFdofViqL2+z06NEGl0IX1Kk/tBJcXDNnHTLRLE5lghjiDgLfaLvaaZXs6b+RQ0nMFkz1NSK3Kp6KkYPhNv2KnUqnx3PJe1HT1ea3J1J1+e7WPgoFxOYLci25yNtY314afiz83DI=
Received: from DU7P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::32)
 by AS8PR04MB7749.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Sun, 21 Dec
 2025 10:37:59 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::6f) by DU7P190CA0025.outlook.office365.com
 (2603:10a6:10:550::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Sun,
 21 Dec 2025 10:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9 via
 Frontend Transport; Sun, 21 Dec 2025 10:37:58 +0000
Received: from emails-4040425-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-225.eu-west-1.compute.internal [10.20.6.225])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id A82897FFAC;
	Sun, 21 Dec 2025 10:37:58 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766313478; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=QHLLYX2gn4S9p1jpS5i1Epj2I0NaFtH8RqxrkG0kSto=;
 b=q9SCbMhZggT6Eq/GpbLrEy25z0/nzKNc1iytNniojO8wkVNK7FElvYtaUjJ7qNbyVYqgq
 3OWPHd6w4V/GuayyvWe4wpIncsdo4ljqPuhQt9cPNc7X1khRf/aBhUngq6sJJ6pFrMhgz9z
 0zprOv8dFbbEmdIOuYPjQX49in3avug=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766313478;
 b=kUgQRQ8rzv5iSUtLKwA+wftpSgpxfO5tTCvb3Dzj/yzyaKuDAQGA9/GDYE75tSxWbq/ca
 o9uFsfh3PyN419o0kLXxyrxPggPT4U6SwrQdj0DRc8KGa63+W/jGeU0Hkr8+gbVjRA8vx/5
 zj2Kl2oMe5I4qh6geprSUZsftOm4x84=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGIJ95X0tI8qWrxOZaPyMmyIVDUNstKeKK+wyNEBm6/KsMw9GGxhmSETsbN4AYNm5LELBCmQpE6X6P8pPnWNYvutGLbo3xmy6PvKoKbPetAwFoAOHozu2pv7X7m+xGTmds4Vv6jgZtzRqOqdwF6ojKGSuOK6QwX/lhXM6to3Fy6ZLhFUqw4yqxMPdzGKjKNuvNGIZz5DzMM7ljEo2hFleI8hCA2jcXPsxGnBanA9kMQHGvTUGM8hrCNVTl+5Ohn1mNtgyvlEbJLKhL9kov1CGF2iehHgmb4UhdmOscnuUyQeYA625SGE3anFxai79dcfXJLFJpfPXOvl1y3aIZQrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHLLYX2gn4S9p1jpS5i1Epj2I0NaFtH8RqxrkG0kSto=;
 b=DvIfOpI6pPsNGgTF/t+Mlvl0KtXLGRveVWhheL9hwCX6G1EmcrXfQOFRAxBIaRtEfbvFn0mFCyLV9YZnuhs6soLMAB32KysMQDRLzlw1MQV0wdkZx2X+2wkuMW+G5s5h6tjiSuHF70dsRgqDr40HvOMMxRRWqGWQi/WGO3P+qPTSaG6ch8kFe/cfrujGeY3XInwPikcII7/viX5ZHAfGm8aTCurtm8EVLLbZmIovJx+Sia+4oWZLka2UOQweZgLw2BKnmiKbY+9ji5BSv0WcKrRpF3ZQCyisR86sUPkh1LqKoEh6ELaaAHgm8mgnFoeQ/U5I5L2NEl+BdLj2UHRVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHLLYX2gn4S9p1jpS5i1Epj2I0NaFtH8RqxrkG0kSto=;
 b=DjkRgPBqQauuCSxEe2b/4bJ/zBjtp69g7YBUFdofViqL2+z06NEGl0IX1Kk/tBJcXDNnHTLRLE5lghjiDgLfaLvaaZXs6b+RQ0nMFkz1NSK3Kp6KkYPhNv2KnUqnx3PJe1HT1ea3J1J1+e7WPgoFxOYLci25yNtY314afiz83DI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA1PR04MB10746.eurprd04.prod.outlook.com (2603:10a6:102:484::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 10:37:48 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 10:37:48 +0000
From: Josua Mayer <josua@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik
	<jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-can@vger.kernel.org"
	<linux-can@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
Thread-Topic: [PATCH v3 2/6] mux: Add helper functions for getting optional
 and selected mux-state
Thread-Index: AQHcafvjRT5zKouON0q90YQR/1KWr7Ul4PSAgAYWxYA=
Date: Sun, 21 Dec 2025 10:37:47 +0000
Message-ID: <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
 <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
In-Reply-To:
 <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PA1PR04MB10746:EE_|DU2PEPF0001E9C0:EE_|AS8PR04MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b4861d-ab5a-429a-2f7f-08de407d0260
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z2NYN2Y4UU8wcWpNRm5FOTFYVTIzNjY2a3pOVHE5Zm5aUklBc1pZUFhWeERa?=
 =?utf-8?B?ejhCTCs4SVZmYWpNdU1XbjROdVU0akxOM3ZnZjl1SGhOU0crUWxlUVFWU0Vi?=
 =?utf-8?B?YUJvaEVFb1poWDVtZDdZWGo0ZXVxdUoycDMvV09lV3ppYzcvVFlrS0kvSVg0?=
 =?utf-8?B?bWo2R0dUTjcvV3dvenF0azFHWjdCSTU5SDEzSWRkMHNWTVBJUURESVVoR3Bh?=
 =?utf-8?B?SXl1UmlabDNHSVNyVUNkMFdqS2dnbm9EQytjdWIybnhyRXVhREFvL2EvT1Ru?=
 =?utf-8?B?MkU2cE5wOHZvTnFxSnVPMlNRbzlTQTdjdHdYZWk1YnhoY0NmbzhyZlRSUTBm?=
 =?utf-8?B?RnZOTXpPRlRTTysrVXYwNno2Q3BOd2Nia1UzZlRhMHdZTEJVM2loRmcvUk5F?=
 =?utf-8?B?L1BHUFM1bFFBZ2d2cDFsQUt5U1k0c1VkOU5jYzBFOG5LMlhNNE1MbWdxWkUz?=
 =?utf-8?B?bU1Odi9Hc2NmUlRsOWZ0M3M2K09hd1Q5ZHUzRWNMWEtTTTFETklXZkdmdk9I?=
 =?utf-8?B?RlRiVDcvcGxhRHgrcE00dENoRVpBRlFtK1UvVS9wWmtJWnN3QUs5MU56OUlS?=
 =?utf-8?B?M3RySlZ3djJ5VkdSc1pTQ0Y1cHFnNXJ0VlhwZ2orYlNXWGdJUXRtSDlWWGtw?=
 =?utf-8?B?UEVjQ0N3dlhZMWJMcTMyNEdMR1l1K1p2V1p1SU1YV2M3dnV5TnZYSzVjanAr?=
 =?utf-8?B?VitWTFZTM3psWFZReEREbjV0VFRjTVo2eG9EVlkrZENyYUw4UEhheHFMRHM1?=
 =?utf-8?B?c00wSXFESk5pNHhMK3l4YklDamVIVThjRTVnSzJjUnhjS2Z5TmVuUzFUMU9L?=
 =?utf-8?B?R2tTZmcxNmJqUUYxKzR2WnU2SFlHTjN2bXMranFsZVNVL3BWMWJTRUtOWit1?=
 =?utf-8?B?YlV2aGsyYWRFdlArWTQrYkFrZGdka2w4bng1bHlRRXZlMmJtY3NsZmFseEtO?=
 =?utf-8?B?cnNMYmZuMHU2eklZRk1HUFNDdmxreTlyVGp0NWFHNXRGemZmWDNwS3BOaUxO?=
 =?utf-8?B?UExPSlJlWVhpc1lZNmtkNGtvcTlad0kxb2dtdlQzWi93SngxczRSMHlRUVla?=
 =?utf-8?B?czlUSEVtZk92TXc2VUZiVGwrdW43anFVUUJ1VWxTdlJFSTdjMWlqTTFxa1pY?=
 =?utf-8?B?bFNYYVpCR0p6R3RWdWE4YkpWREJ2b2xVcHpidlNUWW9wV3psZWtieEJ5UWc5?=
 =?utf-8?B?Qk52WUliVnVtc3lxTU5xaUsxTmtpSVVzZkRremZEOWpISUF2L2w3ZFpGTnJv?=
 =?utf-8?B?RWh2cHdmNk1kYkhPeWZ4cUVYSkJDNHB3RUVRdC8rRlppVkl4RFh6UGtDNnNI?=
 =?utf-8?B?MEppU2tOdzh1V0JjaGtBQ29qQ28rV1I2dUs2dkZkQVEyaVZtaVNTbU12NDBn?=
 =?utf-8?B?WERSeVVvSlUvS3o4YmY3T0xNaC9GalBJM3FwRGdUcGh5WHJtTCthc3hzNE1S?=
 =?utf-8?B?eWcwTk1HNGRPOGFOTkVCTVRsUGxuREpsTjFRWUZEdjBBRW9nM1EzakNOWkpR?=
 =?utf-8?B?RC9YQ281cWpJSXNaZkt0TFVDNFhhVjJhY3huU1FRZEQ2aFBmRkhMUE9WK3NL?=
 =?utf-8?B?ZXhEeUV1QnZOWFFIYzk1K04wRGNuMER4b3dvc1FlOUVkaTdlSlAyUjZlQmx3?=
 =?utf-8?B?RUhyS3IrdTNwMFczV3pXQWpsN1hvVW92d2xXMUZJNjNJT3V0amJZVEtxaTVK?=
 =?utf-8?B?b3A1b3k3WTIwMytRS0hiY3VKSnVWaFRKMHFkdk5GZlI5QndyTXkxaEdwYVgx?=
 =?utf-8?B?dDFSMWR5dFpuNkJjOGlBWUlhdVZTQ09JWkIwUEVOQzJEOWt2enhwa2I0RE5G?=
 =?utf-8?B?TnVlYXZtVzV5RDVabXRFNFRCZXczUXBHOEJQVVlxaFdqZS8yZ1hHNnEwdmdI?=
 =?utf-8?B?N0pmQ3NQU211WWlCZ2kyT1RlNE5FZEVZK2lEQURINkhpQVUwd3ZuRU9oa2FK?=
 =?utf-8?B?czB3TDVXTkk1NnJaZGpRYWlwS1dyRTFWWnZEV0VOREpGTnFlSndlSjVVc1g4?=
 =?utf-8?B?UUxURFhsUkJWTlFsSFhuNlQzWUptU2ZXRTNtTzVQS0ZaclJmVy9OL3Z4RHR2?=
 =?utf-8?Q?EJo1jV?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EC6B79C4144E441A88BDBE431E802E0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10746
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8b973d7ca8e84d13b024461fd37e709a:solidrun,office365_emails,sent,inline:c2fe958e95e40757cc4669b5a2af7fd6
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80f44ee8-75b5-4ac6-73cf-08de407cfbff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|82310400026|376014|7416014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVdrc3k2Ynh0Z1VSazdKRkxHNEVsNUJEQ01ZS2xuWlFFdkhmSDlNTGxqOVQr?=
 =?utf-8?B?VEp5Slk0UmRUcGFDV0tEK2NpdERDdTZodWEvbHlNbHRyU1pVK2pvdTRQNE9H?=
 =?utf-8?B?OGdTcHovTkxmTkVKNHM0bUc3dHFZWDlJRkVrUXpkOWUzdGFiS1E4UnU0YjBD?=
 =?utf-8?B?RTU5NFRnMlhwUEVheTNFT0ovNlZsQzBCQjdZbmJJSHh3TU5OSGdpUVd1WC8w?=
 =?utf-8?B?RHNtTUlwMVk4UFN6VWFBR2tCc0tHSmJNaDVRa1JOblBkUGJyQkljU1hkU0No?=
 =?utf-8?B?NVgxdGZHVnlhRWhTR0Nqb2pNMkxGdzlhYm44cndOakhqZVZqZE9nanAxYUN6?=
 =?utf-8?B?a1hvMkVaekxLc3lUc0ZhbVBqWkR6U3cwdVZmTlJWU29ha0NWb0tqWkwvelNw?=
 =?utf-8?B?RXhOcURiR2daOWx0aU5mTjVuRW1IUFlHMUVnWlJFTTB0RUg0MERqaEh4UkZS?=
 =?utf-8?B?NEdqUStZcXNLRFNzWEEwNlBwMi82NVg0MFFWSSt5S1NTbHZWUDZ3aG9oY1Fx?=
 =?utf-8?B?dkZWdHVnVTlNNzIwbHlWaFJhbGZHeEswWElxTkRXOTAyS2R3cDFHclVqQjNE?=
 =?utf-8?B?Vkl4MXlGcytYRmc3N3FFSEg4RWJCWllxajNzVktVZlIzYmdJcjI3emFJd0M3?=
 =?utf-8?B?Kzh5QWs1M2Z2SUFiRTF1aUV0bHQySnpOaXltWUs0UHlLZFhla0tNaWR2a1Vo?=
 =?utf-8?B?Ky8wT2Z4NysxSkRtQVVsTFF5TWlHWXVBeHIrR0xBeTFaUmlneldHenB4T1Y3?=
 =?utf-8?B?VCtXNGlHcVVReTB5Q1NaVWRJZ0xFNlk3M0t0TDdsZkN2bHRXQ0tqbDN1QmFm?=
 =?utf-8?B?WDBrTXU3ZGZ6cHpTb0ducGlLYXZuQWJ3SXF0NHExQ2xnbGt2eG83QXA2VEZI?=
 =?utf-8?B?SU02d2Vrc21ZUXRQTFY0bzlqRWFRZTM1UlNQN1Z2SDFJQlRHUnpITUJoaVNO?=
 =?utf-8?B?WFJDeGlyZXBFSGdob3p0QkZtdk9OWFZJU0xmMTkydUdldkhMTk54NkF1OEFP?=
 =?utf-8?B?M3FlbHZBa09BT1AwYTd2S2lENWNRMzIwbXlXWEhqZkI0amc4VGRNWTdIbW9O?=
 =?utf-8?B?dkQ3NHVYR0h6ZjBLUTRCVjE5bW10akVKUlI1VllQODR2YmM3M3ROVzU3NzZD?=
 =?utf-8?B?aXEzRjZIcDVHTUxFcHRYMVhxZGtWVGRUZ0g5aWxoZjBJemM1aU9mWFNYbjh5?=
 =?utf-8?B?WmJ1TEhvZlpVdGFHNDlKeVhGWjArS2VEYmNDblIvSDVVVzV6cC8vZWRxdVM1?=
 =?utf-8?B?eWFVLzY2V1NENzNXY2hMZ3V6Q3ZId3daQ1JQZmRmTlVrb0VWUWN6UjZYQzRS?=
 =?utf-8?B?SDk3S3NlUWoyczNpNUJFenVNaDRaT3ZIOXZhNUYvbWt6R2wrY3ZBNVJpNTU5?=
 =?utf-8?B?WDhqZUpJRHQwT1lGbUVFVDUydnFNOGZ2MlRWQkZ6dTNYaDliZDE5OVY2eFVM?=
 =?utf-8?B?RjFreEc5R2hKcklTUG05Y01yanNFS3l6NjBNaDFOQ0VNZUFIS1RoR0ptMlk1?=
 =?utf-8?B?dnc3UUJtOWxyNVkrRkdEbm9MaUJsaTc1dVNoQUpjd1REVUU0SVNVdDNvdDJ3?=
 =?utf-8?B?WVpZZk16V1hzT1NjVnNidSsvc08wOEx6U3AwcTVLaUlwd0xjTkh3cTQwcnlk?=
 =?utf-8?B?akh6SlZhdDFienZsdWVuWmFMYitiYUpUb2RGK05iRjl4NlhoSGtQdGo4WThD?=
 =?utf-8?B?cXZwWnk2b254Slh1WFdUTVMxVWR6d09sOEVTYWxXWEFLVEkxOUVjVzFTUC9V?=
 =?utf-8?B?SUp6eFdrUlpmVEtqRkxJZVRWUEdLVWVDNHo3WHo5aUVaTkltalQwc0JPNi9u?=
 =?utf-8?B?MHFreW04RCtyZ0dXQUFFTWkzRzdzS1hpd1BRUkZXQitVTllLZmJRaURJa2pL?=
 =?utf-8?B?RUdIT3REd3pjNzh1RnA3M2ZwZU1yTUtXR1dGTW53RDhwQ1paRS9Xd1d0Y2J3?=
 =?utf-8?B?cWNWM01FRWVDR0NiSWF2K0k2NE5Obkl5UERUY04xKzg2Tlp6RGZDcldGQlAy?=
 =?utf-8?B?djhXYWRscHRNUUpsL2RPZ0FsQkdoTjArVFU3UFBaN2t1WDVuTGN4eUUzYzly?=
 =?utf-8?B?Z0pQOC92dEFWeDgrSjlGQnJXNDIyY2dST2trSVkyMXBjamduQWU2S3ZuME5y?=
 =?utf-8?Q?HgEU=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026)(376014)(7416014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 10:37:58.7712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b4861d-ab5a-429a-2f7f-08de407d0260
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7749

SGkgVWxmLA0KDQpBbSAxNy4xMi4yNSB1bSAxNDozOCBzY2hyaWViIFVsZiBIYW5zc29uOg0KPiBP
biBXZWQsIDEwIERlYyAyMDI1IGF0IDE4OjM5LCBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVu
LmNvbT4gd3JvdGU6DQoNCmN1dA0KDQo+PiAgLyoNCj4+ICAgKiBVc2luZyBzdWJzeXNfaW5pdGNh
bGwgaW5zdGVhZCBvZiBtb2R1bGVfaW5pdCBoZXJlIHRvIHRyeSB0byBlbnN1cmUgLSBmb3INCj4+
ICAgKiB0aGUgbm9uLW1vZHVsYXIgY2FzZSAtIHRoYXQgdGhlIHN1YnN5c3RlbSBpcyBpbml0aWFs
aXplZCB3aGVuIG11eCBjb25zdW1lcnMNCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L211
eC9jb25zdW1lci5oIGIvaW5jbHVkZS9saW51eC9tdXgvY29uc3VtZXIuaA0KPj4gaW5kZXggMmUy
NWM4MzhmODMxMi4uYTVkYTJlMzNhNDVjMCAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvbGludXgv
bXV4L2NvbnN1bWVyLmgNCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbXV4L2NvbnN1bWVyLmgNCj4+
IEBAIC02MCw1ICs2MCw5IEBAIHN0cnVjdCBtdXhfY29udHJvbCAqZGV2bV9tdXhfY29udHJvbF9n
ZXQoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICptdXhfbmFtZSk7DQo+PiAgc3RydWN0IG11eF9zdGF0ZSAq
ZGV2bV9tdXhfc3RhdGVfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICptdXhfbmFtZSk7DQo+PiArc3RydWN0
IG11eF9zdGF0ZSAqZGV2bV9tdXhfc3RhdGVfZ2V0X29wdGlvbmFsKHN0cnVjdCBkZXZpY2UgKmRl
diwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyICptdXhfbmFtZSk7DQo+PiArc3RydWN0IG11eF9zdGF0ZSAqZGV2bV9tdXhfc3RhdGVf
Z2V0X29wdGlvbmFsX3NlbGVjdGVkKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpt
dXhfbmFtZSk7DQo+IFNlZW1zIGxpa2Ugd2UgbmVlZCBzdHViLWZ1bmN0aW9ucyBvZiB0aGVzZSB0
b28uIE90aGVyd2lzZQ0KPiBzdWJzeXN0ZW1zL2RyaXZlcnMgbmVlZCB0byBoYXZlIGEgImRlcGVu
ZHMgb24gTVVMVElQTEVYRVIiIGluIHRoZWlyDQo+IEtjb25maWdzLg0KDQpDdXJyZW50bHkgdGhl
IGRyaXZlcnMgdGhhdCBjYW4gdXNlIGEgbXV4IHNlbGVjdCBNVUxUSVBMRVhFUiBpbiBLY29uZmln
Lg0KDQpUaGVyZSBhbHJlYWR5IGV4aXN0IGEgZmV3IG11eCBoZWxwZXJzIGJvdGggZm9yIG11eC1z
dGF0ZSBhbmQgZm9yIG11eC1jb250cm9sLA0KYW5kIHRoZXkgbWlnaHQgYWxsIG5lZWQgc3R1YnMu
DQoNCkknZCBwcmVmZXIgdGhlIHJlc3RydWN0dXJpbmcgb2Yga2NvbmZpZyBkZXBlbmRlbmNpZXMg
YmVpbmcgaW5kZXBlbmRlbnQgZnJvbQ0KYWRkaW5nIG11eC1zdGF0ZSBmdW5jdGlvbmFsaXR5IHRv
IHJlbmVzYXMgc2RoaSBkcml2ZXIuDQoNCnNpbmNlcmVseQ0KSm9zdWEgTWF5ZXINCg==


