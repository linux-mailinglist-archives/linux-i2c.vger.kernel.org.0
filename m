Return-Path: <linux-i2c+bounces-8489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53D9F0B8C
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 12:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B27C2831FE
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 11:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC461DE3BD;
	Fri, 13 Dec 2024 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="LxS621XP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2045.outbound.protection.outlook.com [40.107.241.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FC74A21;
	Fri, 13 Dec 2024 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090329; cv=fail; b=pOGd0ZsFv3vkf9Dh3mQ0OYjwoaAL8Advzkp9uGrIQKVse1T6I4LY1aQ0oGgq0RFtE7BXv7YIibEFighgkaRaXoRVytlsgkfTPg+JsqOqwe+3Fowx1DXq4RErgLv+kId0roLmRD4c2YUqfkJqngPnm5hU/Lgtow3gW+HB4O661so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090329; c=relaxed/simple;
	bh=T6byf1+D7+V001QLayTSLWslpItu5EtEOa7y8yDzagM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vcos6DjoInIQmAMoKucdKP3HT3PFo1Dzok9LsAD/f78pWcX7B9llbXJ3uRTRzzXZ6ICTPNcNQpadeGfYozg2isW4zPOyvT2mAc5vub9ZayjUwJ0HUYKFvIGzKiMRRjRE/TQ0BvOvAybdsoxDnZq66PTUJvhBRLd/LyDnoU7GNKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=LxS621XP; arc=fail smtp.client-ip=40.107.241.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFQBFL5sVNzFyFfCUOSf1RVXFGlm/jVY4IGotd4EW4fXao9GTlgGq8baecCPM5hB5M0fB//BCOodK5I60aZ9IJAO/2hZJGfWXv1o5l1ZnItH24L01wZvE4NOnvaD9zLwklPlahzJcIRCy9IddDRr0rqDe00WHIIQ7Q8HTrDrBTFx9ZCXs/l26LRypm0GCaw8316b3998m8XqFu3XF8LAupK844C0jOJVNeWvME6CpyzT/56g8MnecNqOHTw0ULEliqcg9kjq7TJrXdeC8zYLD+kwugtVZODSUmDKBeXB4FurSIYv6HwdvXLq+xThCRcuOOQjBmfcETX+tbagdN+Ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6byf1+D7+V001QLayTSLWslpItu5EtEOa7y8yDzagM=;
 b=q0W5DOnYOP+9dxEDr6wRoJNZYdlKT2yJN1XTfCpEbAo6HfaqUMicRhW4D8iCK3PuP2vVGnJZw8+TjRGJ6ShmOOK3wi+6TLxUiWU1YExN00vGozhmHBO0W2BGr4Icz4Yu9LfBn4puA+P0h9hKLV3qfnUF5E9509dYaeUa0+m4C6AHzz21KJW7Z5Chf3fXMsw2OgR/BGwKY5ZIFZQ8QiYiwt3AEkecljPtnjb/zfL00bOSwkvTTjI6RoP1Vyl1LOMu8h4EMjKS495KxtcNw70MiUoDMHtBD8NqmPnH+eHMHZaCA9HsmVfQnLG7l/KW+pM7DIkO15mB5PsinaaNmDaMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6byf1+D7+V001QLayTSLWslpItu5EtEOa7y8yDzagM=;
 b=LxS621XPqcnoTQDL5UEmVSuv/6HHWeNMMOoiT2u8PcY1Qw86F9m6azWsZD1zNfuopbgvKNfa4dkfFMsDiYDKcYBu1LE1ijdF3Lxk6pyq1sWhJ9SJf146d2baO5+LU6JG78XPAr4O9F5mzVAt1N8IrKEuaWe78VkBg9IP6y/txsWA1nBPpA9Q/7JIqqnaJyNcBtSDjhiOjeQWx6Ap10l9IEdzcBSF0CrS2M1MVRC21eM/GYXhINhwLqvJySiOdMYgBWd9lkqsN3/OQJZPAjpE8pGGNatk0hcvReRAVd/jqwp/gl/3noegeeR14dyIm3gxt45iLLHM0oQM4LjujyDyhA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS4PR10MB5717.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.7; Fri, 13 Dec
 2024 11:45:22 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 11:45:22 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "deller@gmx.de" <deller@gmx.de>, "paul.kocialkowski@bootlin.com"
	<paul.kocialkowski@bootlin.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"saravanak@google.com" <saravanak@google.com>, "derek.kiernan@amd.com"
	<derek.kiernan@amd.com>, "rfoss@kernel.org" <rfoss@kernel.org>,
	"mripard@kernel.org" <mripard@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "rafael@kernel.org"
	<rafael@kernel.org>, "contact@paulk.fr" <contact@paulk.fr>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "daniel.thompson@linaro.org"
	<daniel.thompson@linaro.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"herve.codina@bootlin.com" <herve.codina@bootlin.com>,
	"andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"dragan.cvetic@amd.com" <dragan.cvetic@amd.com>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "lee@kernel.org" <lee@kernel.org>, "jonas@kwiboo.se"
	<jonas@kwiboo.se>
Subject: Re: [PATCH v4 5/8] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Thread-Topic: [PATCH v4 5/8] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Thread-Index: AQHbTMm5v8muX1xehkGdTtxZMBefBbLkCqwAgAAEuoA=
Date: Fri, 13 Dec 2024 11:45:22 +0000
Message-ID: <db925f92287825ba702194e867e25c4e3f40b78a.camel@siemens.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
	 <20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com>
	 <ad1b0f8a662d748580bef83b6f7d8d24d80bd46c.camel@siemens.com>
	 <20241213122826.1c01a284@booty>
In-Reply-To: <20241213122826.1c01a284@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS4PR10MB5717:EE_
x-ms-office365-filtering-correlation-id: 2bea780e-1f57-4a8c-5ee8-08dd1b6ba094
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tm1FQ2wxbnkzMllBSzRheFRWVUVsZEVuSW4xVXNtcTcwZVlDZmplRFIxNjNi?=
 =?utf-8?B?eDZDa01TUkpONlRFVFlzQ3MzcVRDbU5ZWGFOUVFZSlR6K2tKem1Pa2RUYnpm?=
 =?utf-8?B?cGtTVUNXVnlzekQ2b3BCeVYrWFpESkFIaGJZWDVTZk5GZzd4dGRtWXRHQjJY?=
 =?utf-8?B?ZjlFc3MvV3cydUE3eHhkb1hrM2lOU1dOTUFTRHNqK0MrWEt4UE1oa3BtTlI2?=
 =?utf-8?B?M2I3MFZFMGdsTlJXNGo5QmExYlljZjJvVy85QjJhdjRzV2NrNFhVL0d2WE1D?=
 =?utf-8?B?V2FjcXVCUzh1TmtCeHBvZ2xoZTdmcm8rcldvbkF4ZUlQbm45WDBvU214MzNF?=
 =?utf-8?B?bzBTUHNCalAwKzNUYjd6OWc0ODRiUnk5UVovREZUVGNSRGdZSnVYbklNRjAx?=
 =?utf-8?B?blNMbGpmUmVMRGloT0lNZEM2U1llblpYN1g0WE5aajF1RnpKTGZXRzhKMWQ3?=
 =?utf-8?B?Q1Q2dWdyY0FBT2p1RDl5blU5Yy9Bb2lRZGViN1crbTA3WjBMRG4rYXhVZ2pw?=
 =?utf-8?B?bWRaV05HRUNmZW1QcGdvZFdaOURRNVBIVjlDTTdIRnEvQ1ZUUFEra291VVE1?=
 =?utf-8?B?eDB1S2RYZ2tFZHBudFFHUHVjWUpVTzdRbXRzaHRKUmV2SXVPVi9ZcDJtbUdY?=
 =?utf-8?B?dTl0Y0I3bkFHMmFYTFV3N25Gclh6dllsUVFCb3NSV1BjeTdjaVdCVmhkWk1u?=
 =?utf-8?B?UFd1aW80Z2NWdlN1d3VPWmoydEV2YjRNOXFsWCtDNFlxNldnazdMdU5sWXd6?=
 =?utf-8?B?b3FMWHB0K0JnN1E5V3JYL1VFaEtSVVJFSWdITmpMRDZwNmtVc2t6RElKc0dW?=
 =?utf-8?B?MUg0cW1mS1JWMEJZN2p0N2F0M1lDcCtCVVJVWEJRcXFCeVhQVzAyeEdjV0h2?=
 =?utf-8?B?SVRtNzRKWWFDVmRYdzlSRVFtY281emQ5SE5IZVlJeFJsc1JYNEN3SmIzbHRn?=
 =?utf-8?B?ZCtKS0pSQWtibTVyckM2eFdIYzBYM05ZVENrK21xVUdVdVdaeWVSL29PeGtm?=
 =?utf-8?B?SC8yVDJVbGlzZlZzQ0JrY2haZzNKMnc0QWcyWGgxMHd6MWZyK0VLUTBSNWhE?=
 =?utf-8?B?bERTZ21vTW9JVWcxVjV2enMraS80amtMeDZ3aExCNW05SmF3S3hLanZWWFd5?=
 =?utf-8?B?VGdxaFBBZ0xOTHREUklVbXdpK29Eb0IyTm43NXpab1FiMDZZbEtxNmI0WTd6?=
 =?utf-8?B?S0tyd3NEREpkdnIrSDVhTjlZaFA5cnh0UDB1eWJCYlk0dWxNSGZnVllvTEVv?=
 =?utf-8?B?QW9Gblg2ZmFZWm5yMnZwTnFkbEVNa2JoY3hjZi9PQiszV3BIaTNMVUVUcHFx?=
 =?utf-8?B?VE1TN2xFYlkyanBjZkhreVlFTUN2d2Y1QW5sR3V1dWpVcHp0aDRYSzNLVTNT?=
 =?utf-8?B?by9GZEJPeEhZaFNpcXpRTHpDZDQzc3ljcURGbjhMWGVCdlNzeDVPeHJhcER1?=
 =?utf-8?B?aFlaWlliU0pOeW9SUkNVS1lzNkg1T2tJOWZuOW92RGltQnY1enZxT2pWWkJu?=
 =?utf-8?B?NzA3bU1kWVFubm1RV1lWalVZaUxqVkRsSlNEdlpWOHRDWStxUkloTi9UeHhK?=
 =?utf-8?B?eHA0UUNuazc1b0F5YkNoVEhheXBFVkJvYnhuTEdmTnl0T2llMFMzYWdieldU?=
 =?utf-8?B?YktoYW5TQU5iSzM5MGhqOXpucEMwZ0RybWI3M1JMOXpSRWpETEVZNFZocS9h?=
 =?utf-8?B?LzFnekZoU3djbjRVa28vTm0zNUhYUkZ0RTlVaDV5NEV2akVETHN2S2tpeUNZ?=
 =?utf-8?B?WHUxVnRDaGFzUll5bmxXRVYvSjlQWVlldlZMOFVCT1Q5N2tXZUdSMjBCZmk2?=
 =?utf-8?Q?0A94vvpXl5cFYHe1rGJ4GnYJ4zzm3a5a0gXmU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QllnQjJTb2VqZmh1RXRoaFE4amI3dnkzWUNBcXhBZ3FOWjlXenFjQzJTd2Q2?=
 =?utf-8?B?SlFyUW5hd0VBU2JjZllmRnNpWHJKQTF6MmEzYzlyRzduVjBBSWNxMmlhM0da?=
 =?utf-8?B?a2dkWWpTYU03Q2Z3bVg4N3pWd0tEZndLdmRncXVHTm5iRXNaN3VJN3h3V094?=
 =?utf-8?B?d3lsd1IvTDR2d2xnUitwOWlaaEpxWVQrZU4weDNxUFNwaysrVmFxcFhKaWNR?=
 =?utf-8?B?ZWFBN0FyU0hvUFNiZThJbTF3SldiTVZDK1ZBREhwc25UNUE4dklycE5CVkgx?=
 =?utf-8?B?MURVU0Z6RmRkOFFrdzBjYVl5RklIbHcwNHM4eTluQzZGYklteEdnVCs4SERI?=
 =?utf-8?B?R08xK1BDb0M2eGQrT29ZREdmTzA2SE1HRXBpRU9tNVhyUUhucGsxTG91Yk9B?=
 =?utf-8?B?eGh1bU9KMzMzZ0FuY0czenZUNUI4cmg3S1REeFpaNmllZnEvVTdMKytkNDdU?=
 =?utf-8?B?S2JBSWNnTndRaXV4OGNtb3QvT3M1S3R5SFFDVDZLY3ZNSWF5RDd4Wkh2ZTA2?=
 =?utf-8?B?bTRvZmhjeGczaTBUZHhFTmRqLzBkbUZZQTQrUFNBNUQ0a0h5dVYwQWhMQ2xC?=
 =?utf-8?B?cXdmODA2MHBmNU8vZEFBWk0wb0d4dHZ2SFFaNnFqeFlrT1gxTHR6RjBBWnpv?=
 =?utf-8?B?OEMyT2pRN0JxSGFXTzBWajZ0MGpSc2xVL1c3cmxDNEhVQzJaSnFyWVp0TVV2?=
 =?utf-8?B?OWNtcUJ4QytlMzFyQUtmZjBoRlpCekVqVnpDYnRSeTJkVWsyT2pkNjhvd24x?=
 =?utf-8?B?ckp1azFTQ0oyZUVwNUhReHlZcEpVSmNnTk1GUFIwd1FlbDBLMVQ3dWFTVDgw?=
 =?utf-8?B?bFd1SlhOdXVHcnIzdE40Q0hTWXZvUkNGL21kd0s4WFkra3REMXlkd2l2Ulpa?=
 =?utf-8?B?N0VxSnRXWk53S3dkemhGQUVGdm5jb09xT2ZBZCsxUXpMdWdVMmQ2aktiV1Ux?=
 =?utf-8?B?b1llQllQc0x2dGltV2xGdE54Q3diY3lsc1QzQXRvVDlDWmN0c0J6dENKMkJa?=
 =?utf-8?B?cnhKeEdpcXpwR1lYS2dpODErYlVhSGNleXdlWHVtSTFLVWFTcktJd1ZPTXVw?=
 =?utf-8?B?eGxsNmYrc0QvOUEvM0dDZTBEZkdPWS9QNWtNTjkyVlNUMjVIL2RRNFY5WnYz?=
 =?utf-8?B?UHBKL21GSWlDUzVVZTU1QXAvR3NOc2o5bk40cy9nZ1VuY3p4c21JWlZ1TnhN?=
 =?utf-8?B?cHFjYjZZRm1sRTBhck15N1VmdFpid210UEViWS9FSU9aSWRmQ1ZKK0tSRW9G?=
 =?utf-8?B?QUh1aml1R29PczRYRjREZENmT1pkc210YW9WVXIxTkROZmdmVXpacXpqYWdY?=
 =?utf-8?B?TGwycnBORkRDYTB6TFBETEFEOXR0SkkrWU1vZDBlV1hnMmdUcTdmS2dIckND?=
 =?utf-8?B?RE8zSTNaZzhocE1GVnE4cWpCU1RMK0UySXdIZE4yRHNjMmVzUjZGd25IQTB4?=
 =?utf-8?B?aTVDZ2JQYTNSNjRsbm8yRmNxUlBXUkVsdHFYUlAxM0owRkJtQ1ZBYVE0ako5?=
 =?utf-8?B?WHlCV2I2VFV0ODY4RkN5b1IveHI0WkZCZnZmZDA5Wk0wVkJ6Nm1tQ09pZ0dx?=
 =?utf-8?B?WGtqaUFNWG5vcldDdFJZcEhuN2NMTkxMdHVkeml3Z3p1VE1pSmQyMmk1ZExQ?=
 =?utf-8?B?V1gxYkRMNE4vQmxJMWkyODh0akZtOHh3WUw5RzhmeGJ0N0xVWVEzQnEzUXpU?=
 =?utf-8?B?OWtIOThibVhaUkxweng3SnFCYTRiSnhXZ2RoSEMreWlDMng2bnNLTFVIMzQ5?=
 =?utf-8?B?UElabFhaZmFLeWo5cVplN2xzSWZxb1dlT3R2STFrMTJkTXVpczhwT0lLNVJr?=
 =?utf-8?B?bEpRQ09TZ2VzOSsrSndJTXZ6WFdUR2ZpTFZMcjRCOTlCbitrVHVZbERWVlEz?=
 =?utf-8?B?akxPLzVST1JqcEI0WlZSL0Y3eG1XWEhlRXVoRzNxTCs0T0ExSXF4ZE10VFJk?=
 =?utf-8?B?SlZXNWpXemF1Zi8rRzVKTmpIaTBhcUdiZlZjbk9qbG9Xa3V4T0NNWG5ZSFZr?=
 =?utf-8?B?TnprR0dtb0lGU01hdm92dEYyTEM2MHAxamwrOWIxVUpheTRvRThVWWZ4UEQv?=
 =?utf-8?B?elQ0TGlSNnBlaU1ROGZubzZPYXR0K0ttbVpsZStoSkNoUkJZbU80ZEI5S3pp?=
 =?utf-8?B?ZHYwb05LUHhXNWNZUmorVTF6TzVidTVMUklVNlRmOCtUeTg5bHFzVWpzVTVE?=
 =?utf-8?Q?Ieu8df4Ilk/jBr/3m0RieHA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <701151E1F030004BB8BB2BE4BAB68E0F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bea780e-1f57-4a8c-5ee8-08dd1b6ba094
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 11:45:22.5432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Puq5vG9D8y137Jp4YEDLSy/vcbF9KXkZHWuKLgtQLMrU+rX33HI05YbRWDx+k4BJJeFLZHQgkNUvXs5UfIIvNpw5DATasxx3eVJ9K2G/Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5717

SGkgTHVjYSENCg0KT24gRnJpLCAyMDI0LTEyLTEzIGF0IDEyOjI4ICswMTAwLCBMdWNhIENlcmVz
b2xpIHdyb3RlOg0KPiA+ID4gSG93ZXZlciBmb3IgaG90cGx1ZyBjb25uZWN0b3JzIGRlc2NyaWJl
ZCB2aWEgZGV2aWNlIHRyZWUgb3ZlcmxheXMgdGhlcmUgaXMNCj4gPiA+IGFkZGl0aW9uYWwgbGV2
ZWwgb2YgaW5kaXJlY3Rpb24sIHdoaWNoIGlzIG5lZWRlZCB0byBkZWNvdXBsZSB0aGUgb3Zlcmxh
eQ0KPiA+ID4gYW5kIHRoZSBiYXNlIHRyZWU6DQo+ID4gPiANCj4gPiA+IMKgwqAgLS0tIGJhc2Ug
ZGV2aWNlIHRyZWUgLS0tDQo+ID4gPiANCj4gPiA+IMKgwqAgaTJjMTogaTJjQGFiY2QwMDAwIHsg
Y29tcGF0aWJsZSA9ICJ4eXosaTJjLWN0cmwiOyAuLi4gfTsNCj4gPiA+IMKgwqAgaTJjNTogaTJj
QGNhZmUwMDAwIHsgY29tcGF0aWJsZSA9ICJ4eXosaTJjLWN0cmwiOyAuLi4gfTsNCj4gPiA+IA0K
PiA+ID4gwqDCoCBjb25uZWN0b3Igew0KPiA+ID4gwqDCoMKgwqDCoMKgIGkyYy1jdHJsIHsNCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkyYy1wYXJlbnQgPSA8JmkyYzE+Ow0KPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiA+IMKgwqDCoMKgwqDCoCB9Ow0KPiA+
ID4gDQo+ID4gPiDCoMKgwqDCoMKgwqAgaTJjLXNlbnNvcnMgew0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaTJjLXBhcmVudCA9IDwmaTJjNT47DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICNzaXpl
LWNlbGxzID0gPDA+Ow0KPiA+ID4gwqDCoMKgwqDCoMKgIH07DQo+ID4gPiDCoMKgIH07DQo+ID4g
PiANCj4gPiA+IMKgwqAgLS0tIGRldmljZSB0cmVlIG92ZXJsYXkgLS0tDQo+ID4gPiANCj4gPiA+
IMKgwqAgLi4uDQo+ID4gPiDCoMKgIC8vIFRoaXMgbm9kZSB3aWxsIG92ZXJsYXkgb24gdGhlIGky
Yy1jdHJsIG5vZGUgb2YgdGhlIGJhc2UgdHJlZcKgIA0KPiA+IA0KPiA+IFdoeSBkb24ndCB5b3Ug
b3ZlcmxheSBpdCByaWdodCBvdmVyICZpMmMxPw0KPiA+IEl0IHNob3VsZCBoYXZlIHdvcmtlZCBz
aW5jZSBjb21taXQgZWE3NTEzYmJjMDQxDQo+ID4gKCJpMmMvb2Y6IEFkZCBPRl9SRUNPTkZJRyBu
b3RpZmllciBoYW5kbGVyIikuDQo+ID4gRG9lc24ndCBpdCB3b3JrIGZvciB5b3VyIHVzZS1jYXNl
Pw0KPiANCj4gT25lIHJlYXNvbiBpcyBkZWNvdXBsaW5nIHRoZSBiYXNlIGJvYXJkIGFuZCBhZGRv
bi4gQSBkaWZmZXJlbnQgYmFzZQ0KPiBib2FyZCBtYXkgd2lyZSB0aGUgc2FtZSBjb25uZWN0b3Ig
cGlucyB0byAnaTJjNCcgaW5zdGVhZCBvZiAnaTJjMScuIFdlDQo+IHdhbnQgYSBzaW5nbGUgb3Zl
cmxheSB0byBkZXNjcmliZSB0aGUgYWRkb24sIGluZGVwZW5kZW50bHkgb2YgdGhlIGJhc2UNCj4g
Ym9hcmQsIHNvIGl0IGhhcyB0byBtZW50aW9uIG9ubHkgY29ubmVjdG9yIHBpbnMsIG5vdCBiYXNl
IGJvYXJkDQo+IGhhcmR3YXJlLg0KPiANCj4gQW5vdGhlciByZWFzb24gaXMgdGhhdCB1c2luZyBw
aGFuZGxlcyB0byBsYWJlbHMgaW4gdGhlIGJhc2UgdHJlZSBpbiB0aGUNCj4gb3ZlcmxheSAoc3Vj
aCBhcyAmaTJjMSkgd291bGQgbmVlZCBwcm9wZXJ0aWVzIGFkZGVkIGJ5IHRoZSBfX3N5bWJvbHNf
Xw0KPiBub2RlLCBhbmQgb3ZlcmxheXMgYWRkaW5nIHByb3BlcnRpZXMgdG8gbm9kZXMgaW4gdGhl
IGxpdmUgdHJlZSBhcmUgbm90DQo+IHdlbGNvbWUuIFRoaXMgaXMgYm90aCBmb3IgYSBjb25jZXB0
dWFsIHJlYXNvbiAoYWRkaW5nIGFuIG92ZXJsYXkgPT0NCj4gYWRkaW5nIGhhcmR3YXJlIGFuZCBu
b3QgX2NoYW5naW5nXyBoYXJkd2FyZSwgc28gYWRkaW5nIG5vZGVzIHNob3VsZCBiZQ0KPiBlbm91
Z2gpIGFuZCBhbiBpbXBsZW1lbnRhdGlvbiBvbmUgKHByb3BlcnRpZXMgYWRkZWQgdG8gbm9kZXMg
aW4gdGhlDQo+IGxpdmUgdHJlZSBiZWNvbWUgZGVhZHByb3BzIGFuZCB0aHVzIGxlYWsgbWVtb3J5
Lg0KPiANCj4gVGhpcyB0b3BpYyB3YXMgZGlzY3Vzc2VkIGF0IHRoZSBsYXRlc3QgTGludXggUGx1
bWJlcnMgQ29uZmVyZW5jZSBsYXN0DQo+IFNlcHRlbWJlci4gU2xpZGVzIGFuZCB2aWRlbyBvZiB0
aGUgZGlzY3Vzc2lvbiBhcmUgYXZhaWxhYmxlIGhlcmU6DQo+IGh0dHBzOi8vbHBjLmV2ZW50cy9l
dmVudC8xOC9jb250cmlidXRpb25zLzE2OTYvDQo+IA0KPiBNb3JlIGluZm8gYXJlIGluIHRoZSBj
b3ZlciBsZXR0ZXIuIERpc2N1c3Npb24gbGVhZGluZyB0byB0aGlzDQo+IGltcGxlbWVudGF0aW9u
IHN0YXJ0ZWQgYWZ0ZXIgdjI6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDUx
MDE2MzYyNS5HQTMzNjk4Ny1yb2JoQGtlcm5lbC5vcmcvDQoNCkkgc2VlISBUaGFuayB5b3UgZm9y
IHRoZSBleHBsYW5hdGlvbiBhbmQgZm9yIHRoZSByZWZlcmVuY2VzIQ0KDQotLSANCkFsZXhhbmRl
ciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

