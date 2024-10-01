Return-Path: <linux-i2c+bounces-7152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951998BFFA
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 16:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 911FCB25CFD
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 14:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EF21C6F74;
	Tue,  1 Oct 2024 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="vIK6dcsK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE331BFDF7;
	Tue,  1 Oct 2024 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727793019; cv=fail; b=ZRjhg07oEp0sw2O3F0jMmJ0rJrPVvO5uiw6ceCbwtZJeyxT3tQbwDVVHJsod+WLE685QGH+fub43VikzUQJJoVokiBazeT9y7sDCohml1rlSoAW83gbPaB8KqpwO1b6Oghu6GF5g9vMcrBTTxNTG2yHa8PsRF3f5QoNL0g6d4rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727793019; c=relaxed/simple;
	bh=vHjVdm1iOTRzH2+JpZjKZZXiUFxphqYZdoWBhqxu3o8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hnzBP2e4D39QwnUeo9P+ZShyhf1oc5WFwiUiwyrsha/NODK3n4E9qJXPvBkSunnR9MXWEbd8AMwnOeV0JUBEFLsmHVnCjM4dQfToaWhQ5ysfZm+efZKaj8gzhNEQrNYD7FqQiA+c+0auxco4szfp9w5LxdtEGFfynPwM2YnqfRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=vIK6dcsK; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491DXL5P032148;
	Tue, 1 Oct 2024 10:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vHjVd
	m1iOTRzH2+JpZjKZZXiUFxphqYZdoWBhqxu3o8=; b=vIK6dcsKen9syU3Vc7ZEh
	fsGGOIpXtMcmcahOdoS5rSul9jGNAy6Ay4Lhzli24NoWEQOXsJHDfhNvW9YqEK/L
	yrNAVDGaQQnRPhHvhWnJ909erGT+srJedZCBQldMlVCZwagQj5AAD29TjWnI/vO4
	LWGO3EM+KqKZxT2QDRZbzV4wHSPDsrb/5g3rxw1aDBjf7tprwzAQRWtSkpa5DtR0
	pUH1bmXd5X7DYTM3cdDCy6OV1cxzh0BYU+ZXwMzi75gCRwWpBnrGDSwBFcUuoF00
	3Oyb5ZGATt9488IXEc144IB16Oncx+4VHfgXsAg/EPPlyfIQ5ksMZniB/J3+SVma
	w==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 41xbn4dgyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 10:29:44 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCoEKs2pFKMpjmM6lfEdq1oA0EvZdSLiq3S5UbVwXhIdcG0NBWNnc/m+wpvnKMe2axA4i73zhCDkA4gm5rPKmE5QqeCTVxqbQhS43Gn2DZjmSNZmvbY4K6dxTMgNF16mZmcTQWZjjQAbWFrHQpQ1aoZ89dnAoG48u5XphyOAltuN+xHCXspS5+kz0TbIM2vOfJIEnWU2OYrv63BtXLC/LVs1t/uy8eoWcy09cVrWS8XStl0eKiYAiMCUzH795AOSajyXoyl96PZHJqA2+3UUgUKXft2N/ADD+5/MNFk1FvcTKokxjY0UpqayFdA8ZpKaSonRWFZXvLbYQStxJFR/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHjVdm1iOTRzH2+JpZjKZZXiUFxphqYZdoWBhqxu3o8=;
 b=rxMNuDyqK1UU3QXp33SMXxUFScuc4xfHeXtI10eDZBDIPZKNDjDEb2NRILSHDiqNtxHtqY2cUjdHEbrYnoNfM5l2Rk1JlCPuDC1PqVgbEkLtlN5WPWttJzYTs77VZyN6v3+X0F0vLmL2AQmXai7S9r9GAaWDQPF4kGBno0FYzas7jQJhiGLCGKr1L0GFkuW/mYwvQD/TBdTldMhCgdvrfUnOoCTOtgMFFYVrrIVBkNvXbYgWoAm/9DaeWs+ZDXaG7D7A7so7s0TJW61o99ipBmCaVUzz3pGAqX/i0nmAE3YPWgmJifB6rb+/DLOHBYdd9Nv6fzY5ZDSV6rOejmXjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14)
 by CH2PR03MB5304.namprd03.prod.outlook.com (2603:10b6:610:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 14:29:41 +0000
Received: from CH2PR03MB5285.namprd03.prod.outlook.com
 ([fe80::a7b3:6227:4270:bab1]) by CH2PR03MB5285.namprd03.prod.outlook.com
 ([fe80::a7b3:6227:4270:bab1%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 14:29:41 +0000
From: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Greg Malysa <greg.malysa@timesys.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Agarwal, Utsav"
	<Utsav.Agarwal@analog.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas
 Gleixner <tglx@linutronix.de>,
        Andi Shyti <andi.shyti@kernel.org>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson
	<olof@lixom.net>, "soc@kernel.org" <soc@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>,
        Linux Factory <adsp-linux@analog.com>,
        Nathan
 Barrett-Morrison <nathan.morrison@timesys.com>
Subject: RE: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
Thread-Topic: [PATCH 09/21] gpio: add driver for ADI ADSP-SC5xx platform
Thread-Index: AQHbBUBw3iDb2LSPBUWIRQaQCARkRrJx9NqAgAAdDLA=
Date: Tue, 1 Oct 2024 14:29:41 +0000
Message-ID:
 <CH2PR03MB5285363BCF71D480471AB49F82772@CH2PR03MB5285.namprd03.prod.outlook.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-9-458fa57c8ccf@analog.com>
 <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
In-Reply-To:
 <CACRpkdZb6AhxB7XEtOsxV5_oa=c1h2+ZApLFsTS_MQs-cjLmsg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR03MB5285:EE_|CH2PR03MB5304:EE_
x-ms-office365-filtering-correlation-id: 194a2005-b46d-462f-00ce-08dce2257cb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?anNqTnlXWDRkMmlHQUlPSGNzcFRWRnZPQjlQanVza3FQS2FGQjFZQmpxWTFF?=
 =?utf-8?B?RkdOakZ1Y3ZzK1dEVk9iamJYVGZMVjNwdHFZRVFFRWthWmZUS291dkJlUGU4?=
 =?utf-8?B?NVRDUEpuc2RjRmh4dThwM281L211UXc1SmN5Z1ZtNk4ralBZck1OQ2pqWWU3?=
 =?utf-8?B?bDJEUzVPWFNQK0t6TVkzbG5DTE1pcTBSQ01oUHVCa05YaHZXSmRPVkV6Qmxo?=
 =?utf-8?B?TTdYdm5OcmFwQ0VIOS9LQytrNGl3SUxib25vZUJuTFBsVDdPMnk3T1JZQ3Ez?=
 =?utf-8?B?c2xUbGREbStQaW8wYytCcWRRb3RuRWQ3RjdlcmVWbWY1eWV1R2svaEtSTWhC?=
 =?utf-8?B?OUd4TFNucnYyRUUrQlRvbHViNXpoaTlYcU1HR3ROUURRdWkwQytUbzN3N1hE?=
 =?utf-8?B?L2crRTZwcytqQ05FNFRFOEJoZHd0THZmQlI0U3hyQ29QOHFIejg5T1pIT3dS?=
 =?utf-8?B?aDFGNlJacmFnRUpiVFd6WmErSk1GeDQxWklMYjdONlRldE0xTHhFTjZ2ay8r?=
 =?utf-8?B?ZjBoY01ZZTZ4QTNQeVcxcVpZRGU3NlNiYUlpR053T3hhUGM5UEpFNVA0R3Zy?=
 =?utf-8?B?VjNOcmtLb2RxVmQ4cEwvbi9BUzNzbXpOUDVxQVo2TnQ5dTFlK0Q5MDhHQUJq?=
 =?utf-8?B?aDlveTFKSHBOUEx3WXBqRjVkSW9LVkM2bnVmU1BoM2VXQkRnSE9BUmNhT3lT?=
 =?utf-8?B?UWI2amJiWXZHcWdGdDVDQkxnOXRvMS9YUHY2Ny8wTUZQYlBvY3R3U2g0ekt0?=
 =?utf-8?B?NE92emY0YmJBdDlmNE9JemdpY05OOUs0SWdUVWtOSUtqS0xVVTRsdEc5cHFj?=
 =?utf-8?B?ZHdBVWhBRUlwc1R1cEdxV29EcUNpbGR0SnYrQlhSYVJoOW02dkJHdU1LQmI4?=
 =?utf-8?B?VGdBamc0cTRLNzE2bGE1REdFOXMzSWVVVmZJYW5QZEQwR09rK1pKajloeVVQ?=
 =?utf-8?B?UGdBcGNQa2ZPZmdlSDZLNDdHMStzOVBaTFVJbkw1SWhHRUJEbHF0LzFmNEkx?=
 =?utf-8?B?a2VFL3hIQzJEVXE5Q04wekZxelE4ZXFicXZ1MmFTL0dpMHM1d1cvOUdpc0Rv?=
 =?utf-8?B?SEowdEU5a2tMclZVQi9TaERPa3crdjFnQVlKRzRtUmhCMEYxbTRtRTBVWWlK?=
 =?utf-8?B?TG1BT29CMGpuVkMyTnQrbzh0Y0V6dmk5cFgwZHdzNXdsbElYZmY0RWhFZjdo?=
 =?utf-8?B?ZEIydWxNM1o2UnZFRWRFNnZCOVNGUnpXak5TdnpqRDhJL0RrVHFTYkFpUlhK?=
 =?utf-8?B?VUJGQWk2VW1wMyt2L1JZc3RjVEhkN0t0NHFjQUpra20ydUVNRXRGY0tyL09s?=
 =?utf-8?B?RCs1b0FXUU13Z3M5bEh4c3lHNXZ2cE1jQXVEUnk2RWpkTTJXVjN4YVlzTlFV?=
 =?utf-8?B?bFZIYitLRG5zVGxMQlFibTFzZlp2eDFxOHRXQ20yblY4VENyVWc5eXYzR09J?=
 =?utf-8?B?RDJJNnNZVUZ1Y0RaeE9GWVRDNzQxNjN1Q0lDSGdMU1dpVERGNS9YYXUyaHNz?=
 =?utf-8?B?MFVjcWdaU0c4QkhJZk1yVlEwZWEvWTRxYkRhWCtqVjEzSWxjbStUSk5pRWQr?=
 =?utf-8?B?Rkp3c1lNZWlZTzhnUUVwR3VMWVN0N21BNmdoRUdCZllUSU5PMDBKcCs5K2FC?=
 =?utf-8?B?eVVGNGRzdkNnZmJudG1KM1g4NFBlbXEzQm85VHJPb3ZBdWViay94YzdaTEJm?=
 =?utf-8?B?REszaVhvdVZwMWF0QldPb0F4RTF0dkxHclNTeGVZSE1uZDRvem81ZHljaWYz?=
 =?utf-8?B?L0FhU3RrSzZQdTloVjhoYkFkNTVMZzF5YjZ1WnJxU2V2SSsxbnRRN2lPeXhj?=
 =?utf-8?B?b2Y4bkZNSUlIeFY4L2EvbE9oTTM3WS9qQWJDZVZDSDlWQTdzQnUvb3ZmK1B2?=
 =?utf-8?B?dFFnSW5PQmN5RHljVGNBcVRHNGloOWVvenhsMVIrOXdBK2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR03MB5285.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aG0xY0VvalR4NnVyVm9IZWR3a1piR0p0bTVqSFBoN0ZwSjlpY1g5cDR5eXIw?=
 =?utf-8?B?enVDT1hab2drOGpGeG9aTklsYU85SXk1QVhuSEg0OC9wUk9YQ0VyeG5uSW9P?=
 =?utf-8?B?V2ttYVhTMnI0cGZXYWxYZkc2a2JnakhrNFJQVGtMUXNuREJ4NHlRdno1M0k1?=
 =?utf-8?B?RW5yM3djdmtJM1lEVzJOajlncm4wdjZMVk1HaE5lV1Q3bU1XN3d0dHFodXVq?=
 =?utf-8?B?MWZDWER3cXF3SkNBNHpqNXZ2WFphZlZ5eUF6S0tXaDRvN3BXek5QTTFJaTQ3?=
 =?utf-8?B?MW9vZ0VJS1pad2Iwb3JXUzVxTlQyaXQ5cUJmU1VrMnQzWnR4a1VRU20yTU1r?=
 =?utf-8?B?R3B6YlZmRlUzck40eXhsdVRDcmpDZEQ2QkxZQmZ5eCs3RUJ5WDMyWUw1c0Vz?=
 =?utf-8?B?UlVFbDVqQUcxQVdpMGd1UE1iUzlHNjhmMmt2N2JSOVppNHhnbGNBWEp3ZVVZ?=
 =?utf-8?B?cHlsSVBUNDV4L0t6S0FUUlZML3dXczRpc0FuZFJtenBmK2hNN1FMSEVUM2la?=
 =?utf-8?B?TWdYZGo5VWI4dkhzQlJHdkV5UnBwaVc2c0lyWm1NL2cxM3FVK1dMWEU4MFBk?=
 =?utf-8?B?d3pEaUZ3Y0ZGbS9kNkRiaUs4cy9PSnhxSTBpT1dCVmtNM1EyWldLS0JQTGlV?=
 =?utf-8?B?OHJldTBiNXlpYmkzZ2c0Y3p6b3hiYWQxU3ZTWDE0VFhkNEM0aUxQSStmN0pj?=
 =?utf-8?B?b2FpYWxBNDdXMTdKY1EzK3hYeWpsQ09DVkswRnZIL0k1bmxBbGZDRmRMUjdR?=
 =?utf-8?B?Zy9mN3NZSjl2dWJQQThrUFlJT3RaajFFTFU2SjRHVG1LVFVqeCtwd0xtRExU?=
 =?utf-8?B?cjY0LzJOaDRHWkNMN2RzMHFXbjNGVUNPUWtFaUNWNVVuS3FwYXJsY3ZvdXJ0?=
 =?utf-8?B?MzZvUlZvTXNWcTcrODJzUXZ0cTNCQUROUDduT3E1WDlKaUszTThxUHF1Y2NW?=
 =?utf-8?B?YVhpV3MrcXprK1Byd1RzVEZVUXF1Y09RSm9Ib2tXekE3blo1d2NsRGQra1VF?=
 =?utf-8?B?ZHlVemVXWFFlaDdPU0pvWlF2ZDBrZCtpNXpYS0pWdzRxbC9zSjd1MHZubHBl?=
 =?utf-8?B?M0IraG9Ja01qWm1YUFZzWDlNY2lMY3VTcmt1ZW9WU0hNOTVtSDlHMGVWckM2?=
 =?utf-8?B?ZWl6V3BoL1F5SDFLTWh2VE5ielBTekVGVVNBSm5SZTloN2pyK1RsS1pjRjdz?=
 =?utf-8?B?TytCYlNXdG1LK2MvLzQ2UmQ5OXFSdjRGN2dENkp5Z2JzMWFsenZtWnNtcFhn?=
 =?utf-8?B?T0FZSkVFbWFTOXJqaGRRQ0liYzVjSUIrczhPWWJoS0Fab3VTNWZiNGVQOWNo?=
 =?utf-8?B?OXZPc09welV1ZTE5Vzk5ZDFzQTlpZnpRQ04raXBQaHM5V1I0bjltVCtoVENU?=
 =?utf-8?B?WXVoSCtRQk80WjFMQkpCa0JrK1ZiVHJyNEVnUnQveUJjYlQrQ3dnUFJFUW5F?=
 =?utf-8?B?cC9VM2Exb1h1b2FKQm40VVNMLy9BKy94d2wxZExkaytCSXNlbzZ0V0IvRXRt?=
 =?utf-8?B?Z0dqcks5cXNJM1VMOFZ2UVJVSkFHV0NDRWFrK1JQOVR5cG5XVU5JQ3cwdGN0?=
 =?utf-8?B?OGZYazlVc2MxYnRoS3pRSW9ONDdOMzlBU2Z1ZmpWbWVTRGFISDBEVUpHcGRm?=
 =?utf-8?B?N3hMMkx0QW8xbE1VSkg3YS9GS0p6MXF6ZWs1ZHpKMXY0WlMvMWFPTU5mSHNa?=
 =?utf-8?B?d2xkSlBtVHRxbmd5bXVjNHBPbG05WUJ0cGxyZ1ZxeFBDRk5VOHdGaDUzMXd5?=
 =?utf-8?B?TWhidGhtUTBJWUxqQjRsSzc1UUtrYnRSN20vVEJ1YWVGRFkwa05JampQaDJQ?=
 =?utf-8?B?YmluOWRVUHN5YzNkS2RoRmxRVlNnMTdvVThDb09nOEZZYjJLZzdUMEVhNG9O?=
 =?utf-8?B?RlBKVjFiSGR5ZER1Qi80eWJaU3dtbERYQXkrWFJ4bkVMbzZvNjJrNHpTbGlt?=
 =?utf-8?B?QVptYjdndmdjQnk3ZCs5eW4xdnEzQnVBVUxodjRmbVFuNTJBRWYvTFkrWk8r?=
 =?utf-8?B?SHljRmpkQ05oZ0RLNVZQQ3A2Q2twVERlTHhrcTd6WTVUenZJM2t6eU10cHhY?=
 =?utf-8?B?MG9iR0ZMTmVWMFVWTFJ4ckE5Nmg5ZUVpOEw1bkZLd0JZS0Fwcld0ZUs2SE9y?=
 =?utf-8?B?ekJmamFuSk1mRDhwd1Flb0l3OXl2NkNJdk1Eb3Z1N3NCQWs5R09lVXZpZ1g2?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5285.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194a2005-b46d-462f-00ce-08dce2257cb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 14:29:41.3326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lk61KgNtErgaZLsSRohDrni9lCMwiJBL8CNy4TCkg0cyj1qxHFXIrMVsQhMpY9kmSP5V3Heq44npVlb7IBBVmKajpgjLq0P8KNWjNPtzzW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5304
X-Proofpoint-ORIG-GUID: yXh_ruZSuuuiAQU-G_bS1GqsQYg0SB3W
X-Proofpoint-GUID: yXh_ruZSuuuiAQU-G_bS1GqsQYg0SB3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010093

VGhhbmtzIGZvciBmZWVkYmFjayBMaW51cywgd2lsbCBhZGRyZXNzIHRoYXQgaW4gbmV4dCBwYXRj
aCB2ZXJzaW9uDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBPY3Rv
YmVyIDEsIDIwMjQgMTo0NSBQTQ0KPiBUbzogQXJ0YW1vbm92cywgQXJ0dXJzIDxBcnR1cnMuQXJ0
YW1vbm92c0BhbmFsb2cuY29tPg0KPiBDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmlu
YXNAYXJtLmNvbT47IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Ow0KPiBHcmVnIE1hbHlz
YSA8Z3JlZy5tYWx5c2FAdGltZXN5cy5jb20+OyBQaGlsaXBwIFphYmVsDQo+IDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBL
b3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRA
a2VybmVsLm9yZz47IEFnYXJ3YWwsIFV0c2F2DQo+IDxVdHNhdi5BZ2Fyd2FsQGFuYWxvZy5jb20+
OyBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+Ow0KPiBTdGVwaGVu
IEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2
LnBsPjsNCj4gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBBbmRpIFNoeXRp
IDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+OyBHcmVnDQo+IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPjsgSmlyaSBTbGFieSA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+Ow0K
PiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPjsgT2xvZiBKb2hhbnNzb24gPG9sb2ZAbGl4
b20ubmV0PjsNCj4gc29jQGtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1ncGlvQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHNlcmlh
bEB2Z2VyLmtlcm5lbC5vcmc7IExpbnV4IEZhY3RvcnkgPGFkc3AtbGludXhAYW5hbG9nLmNvbT47
IE5hdGhhbiBCYXJyZXR0LQ0KPiBNb3JyaXNvbiA8bmF0aGFuLm1vcnJpc29uQHRpbWVzeXMuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA5LzIxXSBncGlvOiBhZGQgZHJpdmVyIGZvciBBREkg
QURTUC1TQzV4eCBwbGF0Zm9ybQ0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gSGkgQXJ0dXJzLA0K
PiANCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gVGh1LCBTZXAgMTIsIDIwMjQg
YXQgODoyMOKAr1BNIEFydHVycyBBcnRhbW9ub3ZzIHZpYSBCNCBSZWxheQ0KPiA8ZGV2bnVsbCth
cnR1cnMuYXJ0YW1vbm92cy5hbmFsb2cuY29tQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gPiBG
cm9tOiBBcnR1cnMgQXJ0YW1vbm92cyA8YXJ0dXJzLmFydGFtb25vdnNAYW5hbG9nLmNvbT4NCj4g
Pg0KPiA+IEFkZCBBRFNQLVNDNXh4IEdQSU8gZHJpdmVyLg0KPiA+IC0gU3VwcG9ydCBhbGwgR1BJ
TyBwb3J0cw0KPiA+IC0gRWFjaCBncGlvIHN1cHBvcnQgc2VwZXJhdGUgUElOVCBpbnRlcnJ1cHQg
Y29udHJvbGxlcg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQXJ0dXJzIEFydGFtb25vdnMgPEFy
dHVycy5BcnRhbW9ub3ZzQGFuYWxvZy5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBOYXRoYW4g
QmFycmV0dC1Nb3JyaXNvbiA8bmF0aGFuLm1vcnJpc29uQHRpbWVzeXMuY29tPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IE5hdGhhbiBCYXJyZXR0LU1vcnJpc29uIDxuYXRoYW4ubW9ycmlzb25AdGltZXN5
cy5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBHcmVnIE1hbHlzYSA8Z3JlZy5tYWx5c2FAdGlt
ZXN5cy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3JlZyBNYWx5c2EgPGdyZWcubWFseXNhQHRp
bWVzeXMuY29tPg0KPiANCj4gKC4uLikNCj4gDQo+ID4gK2NvbmZpZyBHUElPX0FESV9BRFNQX1BP
UlQNCj4gPiArICAgICAgIGJvb2wgIkFESSBBRFNQIFBPUlQgR1BJTyBkcml2ZXIiDQo+ID4gKyAg
ICAgICBkZXBlbmRzIG9uIE9GX0dQSU8NCj4gPiArICAgICAgIHNlbGVjdCBHUElPX0dFTkVSSUMN
Cj4gDQo+IElmIHlvdSBzZWxlY3QgdGhpcyB0aGVuIHlvdSBuZWVkIHRvIHVzZSBpdCBpbiB0aGUg
aWRpb21hdGljIHdheS4NCj4gDQo+ICsjaW5jbHVkZSA8bGludXgvc29jL2FkaS9hZHNwLWdwaW8t
cG9ydC5oPg0KPiANCj4gRHJvcCB0aGlzLCBqdXN0IGJyaW5nIHRoZSBjb250ZW50cyBpbnRvIHRo
aXMgZmlsZSBhbGwgcmVnaXN0ZXIgZGVmaW5lcw0KPiBldGMuDQo+IA0KPiArI2luY2x1ZGUgImdw
aW9saWIuaCINCj4gDQo+IE5vIHdheSwgZG8gdGhpczoNCj4gI2luY2x1ZGUgPGxpbnV4L2dwaW8v
ZHJpdmVyLmg+DQo+IA0KPiA+ICtzdGF0aWMgaW50IGFkc3BfZ3Bpb19kaXJlY3Rpb25faW5wdXQo
c3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9mZnNldCkNCj4gPiArew0KPiA+
ICsgICAgICAgc3RydWN0IGFkc3BfZ3Bpb19wb3J0ICpwb3J0ID0gdG9fYWRzcF9ncGlvX3BvcnQo
Y2hpcCk7DQo+ID4gKw0KPiA+ICsgICAgICAgX19hZHNwX2dwaW9fd3JpdGV3KHBvcnQsIEJJVChv
ZmZzZXQpLCBBRFNQX1BPUlRfUkVHX0RJUl9DTEVBUik7DQo+IA0KPiBBaCB0aGVzZSBfX2Fkc3Bf
Z3Bpb193cml0ZXcvcmVhZHcgdGhpbmdzIGFyZSB0b28gaWRpb21hdGljLiBKdXN0DQo+IHVzZSB0
aGUgYmFzZSBhbmQgY29tbW9uIHdyaXRldygpIHBsZWFzZS4NCj4gDQo+ID4gKyAgICAgICBfX2Fk
c3BfZ3Bpb193cml0ZXcocG9ydCwgQklUKG9mZnNldCksIEFEU1BfUE9SVF9SRUdfSU5FTl9TRVQp
Ow0KPiANCj4gSW50ZXJydXB0IGVuYWJsZSBpbiB0aGUgZGlyZWN0aW9uIGZ1bmN0aW9uPyBObyB0
aGFua3MsIHBva2UgdGhlDQo+IGludGVycnVwdCByZWdpc3RlcnMgaW4geW91ciBpcnFjaGlwIGlm
IHlvdSBtYWtlIG9uZSAoeW91IGN1cnJlbnRseQ0KPiBkbyBub3QpIGluIHRoaXMgY2FzZSBJJ2Qg
c2F5IGp1c3QgZGlzYWJsZSBhbGwgaW50ZXJydXB0cyBpbiBwcm9iZSgpDQo+IHVzaW5nIHNvbWV0
aGluZyBsaWtlIHdyaXRldyhiYXNlICsgQURTUF9QT1JUX1JFR19JTkVOX1NFVCwgMHhmZmZmKQ0K
PiBhbmQgYmUgZG9uZSB3aXRoIGl0Lg0KPiANCj4gPiArc3RhdGljIGludCBhZHNwX2dwaW9fZ2V0
X3ZhbHVlKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ID4g
K3sNCj4gPiArICAgICAgIHN0cnVjdCBhZHNwX2dwaW9fcG9ydCAqcG9ydCA9IHRvX2Fkc3BfZ3Bp
b19wb3J0KGNoaXApOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAhIShfX2Fkc3BfZ3Bpb19y
ZWFkdyhwb3J0LCBBRFNQX1BPUlRfUkVHX0RBVEEpICYgQklUKG9mZnNldCkpOw0KPiA+ICt9DQo+
IA0KPiBUaGlzIGJlY29tZXMgYSByZWltcGxlbWVuYXRpb24gb2YgZ2VuZXJpYyBHUElPLg0KPiAN
Cj4gPiArc3RhdGljIGludCBhZHNwX2dwaW9fdG9faXJxKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAs
IHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVjdCBhZHNwX2dw
aW9fcG9ydCAqcG9ydCA9IHRvX2Fkc3BfZ3Bpb19wb3J0KGNoaXApOw0KPiA+ICsgICAgICAgaXJx
X2h3X251bWJlcl90IGlycSA9IG9mZnNldCArIHBvcnQtPmlycV9vZmZzZXQ7DQo+ID4gKyAgICAg
ICBpbnQgbWFwID0gaXJxX2ZpbmRfbWFwcGluZyhwb3J0LT5pcnFfZG9tYWluLCBpcnEpOw0KPiA+
ICsNCj4gPiArICAgICAgIGlmIChtYXApDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBtYXA7
DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIGlycV9jcmVhdGVfbWFwcGluZyhwb3J0LT5pcnFf
ZG9tYWluLCBpcnEpOw0KPiA+ICt9DQo+IA0KPiBUaGlzIGlycWRvbWFpbiBpbiB0aGUgInBvcnQi
IGxvb2tzIHdlaXJkLg0KPiANCj4gSW1wbGVtZW50IHRoZSBpcnFjaGlwIGluIHRoZSBHUElPIGRy
aXZlciBpbnN0ZWFkLg0KPiANCj4gSWYgdGhlIGRvbWFpbiAqaGFzKiB0byBiZSBleHRlcm5hbCB0
byB0aGUgR1BJTyBkcml2ZXIgdGhlbg0KPiB5b3UgbmVlZCB0byB1c2UgaGllcmFyY2hpY2FsIGly
cWRvbWFpbnMuDQo+IA0KPiA+ICtzdGF0aWMgaW50IGFkc3BfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsgICAgICAgc3RydWN0IGFkc3BfZ3Bpb19wb3J0ICpncGlv
Ow0KPiA+ICsgICAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgICBncGlvID0gZGV2bV9r
emFsbG9jKGRldiwgc2l6ZW9mKCpncGlvKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICBpZiAo
IWdwaW8pDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiAr
ICAgICAgIGdwaW8tPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7DQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKGdwaW8tPnJlZ3MpKQ0KPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gUFRSX0VSUihncGlvLT5yZWdzKTsNCj4gDQo+IFNvIHlvdSBoYXZlIGdwaW8t
PnJlZ3Mgd2hpY2ggaXMgdGhlIGJhc2UuDQo+IA0KPiA+ICsgICAgICAgZ3Bpby0+ZGV2ID0gZGV2
Ow0KPiA+ICsNCj4gPiArICAgICAgIHJldCA9IGFkc3BfYXR0YWNoX3BpbnRfdG9fZ3BpbyhncGlv
KTsNCj4gPiArICAgICAgIGlmICAocmV0KQ0KPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyX3By
b2JlKGdwaW8tPmRldiwgcmV0LCAiZXJyb3IgYXR0YWNoaW5nIGludGVydXB0IHRvIGdwaW8NCj4g
cGluXG4iKTsNCj4gPiArDQo+ID4gKyAgICAgICBzcGluX2xvY2tfaW5pdCgmZ3Bpby0+bG9jayk7
DQo+ID4gKw0KPiA+ICsgICAgICAgZ3Bpby0+Z3Bpby5sYWJlbCA9ICJhZHNwLWdwaW8iOw0KPiA+
ICsgICAgICAgZ3Bpby0+Z3Bpby5kaXJlY3Rpb25faW5wdXQgPSBhZHNwX2dwaW9fZGlyZWN0aW9u
X2lucHV0Ow0KPiA+ICsgICAgICAgZ3Bpby0+Z3Bpby5kaXJlY3Rpb25fb3V0cHV0ID0gYWRzcF9n
cGlvX2RpcmVjdGlvbl9vdXRwdXQ7DQo+ID4gKyAgICAgICBncGlvLT5ncGlvLmdldCA9IGFkc3Bf
Z3Bpb19nZXRfdmFsdWU7DQo+ID4gKyAgICAgICBncGlvLT5ncGlvLnNldCA9IGFkc3BfZ3Bpb19z
ZXRfdmFsdWU7DQo+ID4gKyAgICAgICBncGlvLT5ncGlvLnRvX2lycSA9IGFkc3BfZ3Bpb190b19p
cnE7DQo+ID4gKyAgICAgICBncGlvLT5ncGlvLnJlcXVlc3QgPSBncGlvY2hpcF9nZW5lcmljX3Jl
cXVlc3Q7DQo+ID4gKyAgICAgICBncGlvLT5ncGlvLmZyZWUgPSBncGlvY2hpcF9nZW5lcmljX2Zy
ZWU7DQo+ID4gKyAgICAgICBncGlvLT5ncGlvLm5ncGlvID0gQURTUF9QT1JUX05HUElPOw0KPiA+
ICsgICAgICAgZ3Bpby0+Z3Bpby5wYXJlbnQgPSBkZXY7DQo+ID4gKyAgICAgICBncGlvLT5ncGlv
LmJhc2UgPSAtMTsNCj4gPiArICAgICAgIHJldHVybiBkZXZtX2dwaW9jaGlwX2FkZF9kYXRhKGRl
diwgJmdwaW8tPmdwaW8sIGdwaW8pOw0KPiANCj4gTG9vayBpbiBlLmcuIGRyaXZlcnMvZ3Bpby9n
cGlvLWZ0Z3BpbzAxMC5jIGZvciBhbiBleGFtcGxlIG9mDQo+IGhvdyB0byB1c2UgZ2VuZXJpYyBH
UElPICh3aXRoIGFuIGlycWNoaXAhKS4gSXQgd2lsbCBiZSBzb21ldGhpbmcgbGlrZToNCj4gDQo+
ICAgICAgICAgcmV0ID0gYmdwaW9faW5pdCgmZy0+Z2MsIGRldiwgMiwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIGdwaW8tPnJlZ3MgKyBBRFNQX1BPUlRfUkVHX0RBVEEsDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBncGlvLT5yZWdzICsgQURTUF9QT1JUX1JFR19EQVRBX1NFVCwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW8tPnJlZ3MgKyBBRFNQX1BPUlRfUkVHX0RBVEFf
Q0xFQVIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvLT5yZWdzICsgQURTUF9QT1JU
X1JFR19ESVJfU0VULA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpby0+cmVncyArIEFE
U1BfUE9SVF9SRUdfRElSX0NMRUFSLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgMCk7DQo+
ICAgICAgICAgaWYgKHJldCkgew0KPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJ1bmFi
bGUgdG8gaW5pdCBnZW5lcmljIEdQSU9cbiIpOw0KPiAgICAgICAgICAgICAgICAgZ290byBkaXNf
Y2xrOw0KPiAgICAgICAgIH0NCj4gICAgICAgICBnLT5nYy5sYWJlbCA9IGRldl9uYW1lKGRldik7
DQo+ICAgICAgICAgZy0+Z2MuYmFzZSA9IC0xOw0KPiAgICAgICAgIGctPmdjLnBhcmVudCA9IGRl
djsNCj4gICAgICAgICBnLT5nYy5vd25lciA9IFRISVNfTU9EVUxFOw0KPiAgICAgICAgIC8qIG5n
cGlvIGlzIHNldCBieSBiZ3Bpb19pbml0KCkgKi8NCj4gDQo+IFlvdSBjYW4gYXVnbWVudCB0aGUg
Z2VuZXJpYyBkcml2ZXIgaW5zdGFuY2Ugd2l0aCBhbiBleHRyYSBjb25maWcgZnVuY3Rpb24NCj4g
dG8gc2V0IHRoZSBzcGVjaWFsIG9wZW4gZHJhaW4gYml0cy4NCj4gDQo+IFlvdXJzLA0KPiBMaW51
cyBXYWxsZWlqDQo=

