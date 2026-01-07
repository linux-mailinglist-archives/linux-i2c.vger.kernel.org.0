Return-Path: <linux-i2c+bounces-14950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE2CFC0CA
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 06:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5FA303E003
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 05:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B2D1C695;
	Wed,  7 Jan 2026 05:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Uy7+3pbl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013072.outbound.protection.outlook.com [52.103.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD251A5B9D;
	Wed,  7 Jan 2026 05:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767763009; cv=fail; b=bQHKY+kGPoCwz6RogO5z5W83zgDETUT+V/kuPJnhg38MOqrXnKw0cmQsDgPNEJGkPja4ewS8V9MN/sYOFtGEoN4WZhcbY2Hytqv4d2MxTUqkhAMNv66tqVXytIMCP4AJppwA06NAQtUUyxVurrNsZwjlrxx21aGo+lemYKLMiKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767763009; c=relaxed/simple;
	bh=CpHv1CgN1U+ptGVgi9fdiZf9mYAHaqjMr/y/u3DBfVY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mGlLNNfl1XSjKSmgJ944N7Y9zIUUlmEmiYEv+pZIJ6bRWqDQyENxLkaBhz1AzAi7YprhqedHlDnmv1alrIlnwT//F90JhDvbgSHsA24UcQFoROJtqZWZH3XLcOMWvsMAXCE9zi/HhJR+JZDBw7LT2WMRz8GWLzZwJ9JEPu/y45Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Uy7+3pbl; arc=fail smtp.client-ip=52.103.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1aUjsi21cdGO6E/zIQz+rb9cdCXpr+3By4dCLsVKHulqaAiDXb7mbG96JILpqEVWxph2vHQp+hGHc6TdnHWz3IX3rbKLyHsvrYzZ81wHXvQ90jzVk/fn6bm4J2RSNl0NXeglb9JChTt15rusVO130t3cIeQ3IEuj+dn5CBiAWgT/LxdE8BkfVlxOcgQL3GXCFT1RHIdbi4EcgLj9EmPAgw/zXCyTTD0f7NGcPFQlyldTU+b0kmq2QZD/ue7LafPszAdI4PVK5zrX7HzzsvWplLr+CxkS9sdKjDmglWDT0vUMSmqXz7qvLeE3QtgH21Az5LL23E5bRlLMWNL2jANdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpHv1CgN1U+ptGVgi9fdiZf9mYAHaqjMr/y/u3DBfVY=;
 b=whkZhU3w0svVx3Bl6kE4DQPcNPBVC7pnqYuF0VCqPJLE09YJuzkicN40tRQAn8exnew+ja0z8Csm921DTmEkBAvX8Zd1zRpqFY9SHmBJSocK8UFhekNVyHulmPAi3xiYhc6CsLDpE6J90L/0VFjgHwurqljNvSYf+HtB0vnMKaX9VG9bd8cadditXV18Kl99S98RUF1U6rm43iAudov1olYTRGZknCJVvg0EPNjbHu0rKDvPgB2UQ7xJfSZ2X+TNTuWRkIbv7kJSk5p8CvJ4TzI10bXIUG1jLmkbjiwp6fKDi720TuwIUbH+8w8tG6PECH/HNEvrJARfAUqU+s/7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpHv1CgN1U+ptGVgi9fdiZf9mYAHaqjMr/y/u3DBfVY=;
 b=Uy7+3pblaQTIregMjM9kieagvaH39obXFXEVbKHhCeFCkbd8f+n3t3eajJ7wCdPQyosNiEnuifl4qQ+mKQLMAx78SO06HF/zKiP59lgt4CHh4tfhqjioAVVAyJUERO1+Wdqsdw1EcOTLkchnhvyXvCWw3y2TTDIeL58JIdSsmlznsyMbaOTeGLIla5DdrjlkBkM1gybHjE1cfjMiaApo9arff922wwFAS4CLisRe6lR0QzjM0nS5QqcS+GuZJ2n9QCWhOsxBYbNsMKFuvgX2uN+bpi2wBRF2sfopcVNHV9RwDnFe/aILqQAlceZ/L8b6Eu7PxYMli0Qe+Lzlei4r1g==
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com (2603:1096:820:142::5)
 by TYSPR03MB7649.apcprd03.prod.outlook.com (2603:1096:400:42a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 05:16:43 +0000
Received: from KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16]) by KL1PR03MB8800.apcprd03.prod.outlook.com
 ([fe80::95dd:dd8:3bbf:2c16%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 05:16:43 +0000
From: "WangzXD0325@outlook.com" <WangzXD0325@outlook.com>
To: Wolfram Sang <wsa@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: [BUG] hung task in i2c_transfer via i2c-dev ioctl (rt_mutex lock not
 released?)
Thread-Topic: [BUG] hung task in i2c_transfer via i2c-dev ioctl (rt_mutex lock
 not released?)
Thread-Index: AQHcf5S8sVrDQwhJLkS+Fgc5wRnuiw==
Date: Wed, 7 Jan 2026 05:16:43 +0000
Message-ID:
 <KL1PR03MB8800984941696A40C81FEE77A184A@KL1PR03MB8800.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB8800:EE_|TYSPR03MB7649:EE_
x-ms-office365-filtering-correlation-id: c17d1ec6-271e-464a-8421-08de4dabf23c
x-ms-exchange-slblob-mailprops:
 xgbIMsDSu2YQP4YTVSfAdmvv3RzbJgGlPHsq77PUAFij+TFt5Z9DkW923eC8srilhymfAf1gUc2ZhF7cSCwl+jAeWZO9zN5fnKcqkdKpeTnjQRy+DpKbBURiQjF+fhUOxwTEyILwpyF0bJq/dXwDjm+3W0y+Jadmd/toXdkoDDrs3gIvFZkmX7P1oobvd4SG0/AokrN61MqSUI88N7ytdksxRqVXwlHT4n0Ie1jw6nk7OUgHBwthT3dB4XPR35XyuokC78o/48HARI3o4dVQJhn4bwWpoMAsXWRKPotqnVp7AlFXqm3LS2KBfZ0/kwLe501mtUA2XaaZNRHW29UzrhUExbC92Z9Kv/V64mii1/RIbVYwLyyQyrBQm/nRloM1p2kQvk/7C1suVY/IiqkI0i1221J8+Oi2+/J/Y8wBt64faDADweuB8WZbS30jz2YZgv5CLUUSpTS3damA6pAVuUqILKGdLsQ41VwKlN58xOh9hcFI4ZZ8Qv8ooP+xRX0k6aSNaAGKRIx65bQvjDtclRnVYynbZd297OhKhQBjo2u3nDauL7Nm2jKbkCh9Unuldz247krybmN1D9tXx5KP2Lgo2LsVuSsZ8/LQENDolMQ/1HHV/1O86ANRunArD1f9Epj+LW9mgyhpYiU5JyVcttD9Kh5SLXt44lxZLnvmqU6TqXk0BDmvFrvvqIFYypVwZlyIYnxq9ube5YF4KlgHmO2YG5nIAl4acuIQYHbchnsw+w0y0cOte0cQO2/pMTnvuzudl+MFeqXB0wbxgNyX+MHYGH1EvAEF
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|31061999003|41001999006|8062599012|8060799015|19110799012|11091999009|39105399006|15080799012|12121999013|15030799006|440099028|3412199025|40105399003|26104999006|102099032|3430499032;
x-microsoft-antispam-message-info:
 =?gb2312?B?TURGRU5qb1BMS3lWajFiTUw1M0gvWFZ0TktqYTBVTFlacUtmTVZ1Qm50UDdQ?=
 =?gb2312?B?V2FrTnJLNWI1RGFJQUE1V3BXbGZ2UUpIYTdzRDVhZDJQWkd4Y2xjQjFhMGFO?=
 =?gb2312?B?MFN4M0w1UjlGZEpReks0V2RXcmR0a21CamtiYXVNdFRwcWdvbVlCK3hGRTNq?=
 =?gb2312?B?TnpTOFRubU9Cc2pDdTQwVTkrV21yZUw3OHJ0eExqR29uclVCcUJVRjF4dkVi?=
 =?gb2312?B?WkFTZ1pqTFBrZU96enJkT01EcWtNNkFZaFRzVWg3aW0xTTh1YitidTNNb0NZ?=
 =?gb2312?B?b25lMWkvQWw3L1BiQjlTYWR3UVgyWXhNVEpoekhGZmNWQkxkdEV1ZDcxM1lG?=
 =?gb2312?B?Z3A2amRTRVZ3MWo1ZzRhN0tqbHFNN2VGK0NRNjl2a2tmTW5GUzFxOWRuQ1Rl?=
 =?gb2312?B?T1MraExPU2xKdXN0TGQ3MUR1WFhqWHUzUmprYjhSamt4Z3R2bW1Hdy9XNmdU?=
 =?gb2312?B?L0RyL0owTTdreXdVMHFiTy92SlhYSEpQeFlXOFpjcDFqTGZKblFra0xBR1hw?=
 =?gb2312?B?dmJPbXE4c0U2d1RtUTc1NzFDWWFmdnhVRUNSRloxaUpXTnhsNmljKzk5U3A2?=
 =?gb2312?B?djk1OFNhb2FSRExHTTUxMis4SklvY1ZMZ1BnRG1tL21Md3g4UHdJM3JyNTV6?=
 =?gb2312?B?TUhTeTZoZGdGWkFFWnZ3dEMzTWVmNHRaMnQ0eitwU2pMbldhNDRhUTA1M25h?=
 =?gb2312?B?SFk2U0Z5RzBackJDdjFXQVpOVFVkbjVqZ0YxdUMwZGtMY3dTa0lpQlJqdjRz?=
 =?gb2312?B?bFA3WUJ0YnNKOGcrc1pjK241cFVCc3lscTFJMXVGV0NCU2lCVGM0ZVVrZkpw?=
 =?gb2312?B?N2pya1ZwTGUrWkFiZDRYMEhxNUR3WmJHY2xqOG9lcWgxSGZMUkRZVWNocjR3?=
 =?gb2312?B?aDFZc0VGcytVeU1EZ1NQYzdSejE2M21HNnlURzdlbW9mUnZqSktocmprcFRR?=
 =?gb2312?B?SUh2TW9LRFlmWGF4TGhwdTV5T3duWURNdHYvMm1UbWdRYnQyUlMyVUJmYy9X?=
 =?gb2312?B?bmR3K25qRWpqanlQdmhSOTMxNmZOd2M3dWNab0NHZ2FTUUtQTlRJMmd5eWZG?=
 =?gb2312?B?UTNLVXUxV3Q0MEJqRXA2N1kwcmVOVmlmLzhqNjY1anJER2E4ZHdUT0R1eDEz?=
 =?gb2312?B?YlNrU0ZqL2FyTjRQYjU0T3FJMGh0QThCTHlVbC91ZUhyR3djV0JCK1dxUzJk?=
 =?gb2312?B?dFM4WDcxYS9NV1F2dURYSU9Xd2hjTU9scWRGaWs1OEtJM083WkZYK3VlNVJ1?=
 =?gb2312?B?MnEwN2JlbmZzell4Rmw1MkxNTFFlQW5XMlZYdWZpdHZEa0FxTWxORTFIOUdo?=
 =?gb2312?B?Q1hyMm53eG0zaXNEeTdGZWlrWUZuOThjTTlEV3ZnWEF6S3VEM3UxQnRGSXZ2?=
 =?gb2312?B?V2NhS2VPVVpXVFRLYXpRYnVkMDhzOVJMQ1J1emVDU25hakFWQ3NFYWwxWit4?=
 =?gb2312?B?TjJqSlArWmR1VU1EenpsNWtaQlluUWxGaUJXMC9QRW1XNEw1N2FBMHVHQklE?=
 =?gb2312?B?Nzk2NGZyUDNlcVI0dWpjK0ZQakttTW5RMjZYNHVnWXIzOTdhSXhlVTVZOU9v?=
 =?gb2312?B?OFkySmxrMkl4YVpiZmozZldibFJsZ3RsbVZZZGpVRnhHcEpBNi95UlZ6Nmcw?=
 =?gb2312?B?Rjh4dXpPbGFXdmpKQmxOUFpkVlB5c1ZkK3JINCtkRjF1OHVsd1N0N09ubkJ0?=
 =?gb2312?B?Y0pMY2xnSmFnK3RDVGRYeTVNalF2dkxQUTJBNVdTSmdYbkwvQitVeURxMGxl?=
 =?gb2312?B?U0tnVytlV2wxV0lNSDFYVkZyZ1hibkxNZ0VlZVVhOVU3eHdlSDhTTVlTcCtL?=
 =?gb2312?B?RFdWR2lldXovWGtiVzVwZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?K0tBSlZGem5KYnJ4V2pLN0J2UmYwK1hsdFJPYitwUWdwU1djMUl1RFVpNUN1?=
 =?gb2312?B?TlU5VUE1VEIvRjZGVHNYVFlwaFpseUtjdEZPcHJ3N2R5c0x4MjQvOUNFanpt?=
 =?gb2312?B?ZnhPRWJzYzA5TzhKRFAxM0ZhamJEVXlXWWVZMWxLU3U2S0w1b0JBeTNmWFVm?=
 =?gb2312?B?UTgvYzgzMXU2NXdXcjU0U2lNSXZ2bUlzaFhXRVVWYWo2RTBtK1dDbWJia2Vl?=
 =?gb2312?B?V2pwaDFLUkI5WFNXclVUVE93Z1FEd09rWStPTVJXQ2FBa1JhSXgya0VkaHpL?=
 =?gb2312?B?Z0NaRUkxdy9zWUlWbmVrRE1senYrRWluRnAzMExXWW9KU2xuVmVvOE5KdSsv?=
 =?gb2312?B?Y05Ta05NT3NnOWtoaWx0NGxhUEYvYzRML0lxeitsTUZnd3RVZjU3bFBHSXpl?=
 =?gb2312?B?eWxlR3RkR05Gc3RzSGtqNzdnOWpUVVM0SXhkelFIT2xZOWVxbmo0NWgvMVZK?=
 =?gb2312?B?cWdZaDhha3lwd2ozYWowb3J5U0dQaGNERm9ISDd3VHBNTmtmc0JneXNqajFo?=
 =?gb2312?B?MXhpK3prRzM2cjRJYmNwWkRTYUNQVzB2TUg3azNsRWtmV204VHpFSlRpdkpL?=
 =?gb2312?B?WVF4R1AyK3g4QjlPRDE1L1laWHk3SDJTNm1pVkpta2ZLNWFlWHJjYlBsbThx?=
 =?gb2312?B?akUyUHZvMDI3SkphOVY2R1diZlZnRld4UnppL1RPQ01nUGY1TlVaSFpQMlgw?=
 =?gb2312?B?SzZEZzRhSlpCM1BwckNIK1JOZEVSM1NRcUtyNUg2ZTMvTGF0MUdiSVVKMzdU?=
 =?gb2312?B?K091ZVVwVFdGejl5Y2R2YWFsYmhVSTBmSW8zZmNDSHE0QzhyZ0M0RDdZbytn?=
 =?gb2312?B?T1BiRHduYnJSYlNpRnZNcVZuZytVVUlQY05YK04xZnRocXdUNi9NcGtOZlQr?=
 =?gb2312?B?ZUZFNEgxWXdqMysxd2pWYzZXYU5ES1lxaHhaRFFNTDk2U0JXOEtRZDhkWjll?=
 =?gb2312?B?akhXTXlPVklFNVB6cU90Zy96TjFpS1dyRHJNbVVVd3JQRmdIMmJUWmtWRmtu?=
 =?gb2312?B?Ri9wOFJ6RUlDNS9SUmQzbmZwdzlKQ0gxU2prejJuN0Y5SjBmR0lRUnhDYWN2?=
 =?gb2312?B?bitaMHRsU0M4eFd6YnFDU0trNG1GREl4NXhDd0JsaXRGclMrWExFVlFiSXVN?=
 =?gb2312?B?RzB5NU5WemEwd2prL0M5Mm1xYm1pMkk1dFZYdzl5cjM0dUVEajlSajVmelBq?=
 =?gb2312?B?aVdJMkJkWVZCWXBVRFhQVnUyQTBZQ1gzWTdrZFFmZnFoMktPL1c4QTd4NnNM?=
 =?gb2312?B?NFRPMzBnUzY3cmh5R1AxRmdPa0JuUmxmL2N0ZmlUb1lCUy9wZjFLK0pxdEdY?=
 =?gb2312?B?dU5xeG1zeURnRHM4VFRHNms3SzhvdXZkOGFrOGgzMXhITElZY2lDQUsrZG4w?=
 =?gb2312?B?K1VLdW5OSjBZK0l3dDk1cVYxUnlLdGthNnh5UGFMSlU1ZndJRTlGcFI1TWN2?=
 =?gb2312?B?Zk53Z0ZKcFRaUWJjNThnZm9sSHYvWStobWhWNG5xV0F2UlVWUjFiT3lyVEpF?=
 =?gb2312?B?a3E0VFVFVU9UVUQ4dDBMbndGQ3hsYk12MTdnOG1pS3RMUHZwTDFKNnpweUVj?=
 =?gb2312?B?Y3duTEFCNmZtc05pTnRsU09RTUdkV1AvR25kQXFsWVBRaUNxb0VLakcxZVBp?=
 =?gb2312?B?NWxPT09OSTZuUlFFQk9jREhMSm8wUnNVbXo0VTRqY0tPdzg3RkJQZ2dmU0xn?=
 =?gb2312?B?empiRkwxU2lFYVBsSjBuRWdGV1FacnNQQWt6cktHU0VUdUJZejkyZGtjUWlw?=
 =?gb2312?B?dWxnSGN6S21qZHdrY3NMQjRrTXY5ZWxoU0U0OTVBM3BOeE04QkJpVDE1RWpH?=
 =?gb2312?B?c2xleVF1Z2lUTzBvZU04VzJWTS80TjAzUGM5YjNJaWVCQ0JJWjFqT3dsSUFU?=
 =?gb2312?Q?eQ0RbCb6vVNzB?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB8800.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c17d1ec6-271e-464a-8421-08de4dabf23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 05:16:43.1794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7649

SGVsbG8sCgpJIGFtIHJlcG9ydGluZyBhIGh1bmcgdGFzayBpc3N1ZSBvYnNlcnZlZCBkdXJpbmcg
ZnV6eiB0ZXN0aW5nIGludm9sdmluZwppMmMtZGV2IGlvY3RsIGFuZCBpMmNfdHJhbnNmZXIuCgo9
PT0gU3VtbWFyeSA9PT0KCk11bHRpcGxlIHVzZXJzcGFjZSB0YXNrcyBiZWNvbWUgc3R1Y2sgaW4g
RCBzdGF0ZSBpbnNpZGUgaTJjX3RyYW5zZmVyKCksCndhaXRpbmcgb24gdGhlIEkyQyBidXMgcnRf
bXV0ZXguIFRoZSBodW5nIHRhc2sgd2F0Y2hkb2cgdHJpZ2dlcnMgYWZ0ZXIKfjE0MyBzZWNvbmRz
LgoKVGhlIGlzc3VlIGFwcGVhcnMgdG8gYmUgdHJpZ2dlcmVkIGJ5IHVuc3VwcG9ydGVkIG9yIG1h
bGZvcm1lZCBJMkMKdHJhbnNhY3Rpb25zIGlzc3VlZCB2aWEgaTJjLWRldiwgbGVhZGluZyB0byBh
IGJ1cyBsb2NrIHRoYXQgaXMgbm90CnJlbGVhc2VkLgoKPT09IEVudmlyb25tZW50ID09PQoKS2Vy
bmVsOiA2LjE4LjAgKGxvY2FsbHkgYnVpbHQpCkNvbmZpZzogUFJFRU1QVCAodm9sdW50YXJ5KQpB
cmNoOiB4ODZfNjQKSGFyZHdhcmU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgpCldv
cmtsb2FkOiBzeXotZXhlY3V0b3IgKGZ1enppbmcgdmlhIGkyYy1kZXYpCgo9PT0gT2JzZXJ2ZWQg
YmVoYXZpb3IgPT09CgpLZXJuZWwgcmVwZWF0ZWRseSByZXBvcnRzOgoKSU5GTzogdGFzayBzeXou
KiBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTQzIHNlY29uZHMKaTJjIGkyYy0wOiBVbnN1cHBvcnRl
ZCB0cmFuc2FjdGlvbiA3CmkyYyBpMmMtMDogVW5zdXBwb3J0ZWQgdHJhbnNhY3Rpb24gOAoKTXVs
dGlwbGUgc3l6IHByb2Nlc3NlcyBibG9jayBjb25jdXJyZW50bHkuCgo9PT0gQ2FsbCB0cmFjZSAo
aHVuZyB0YXNrcykgPT09CgpBbGwgYWZmZWN0ZWQgdGFza3MgYXJlIGJsb2NrZWQgaW4gaTJjX2xv
Y2tfYnVzKCk6CgpydF9tdXRleF9sb2NrX25lc3RlZAppMmNfbG9ja19idXMKaTJjX3RyYW5zZmVy
CmkyY2Rldl9pb2N0bF9yZHdyCmkyY2Rldl9pb2N0bApfX3g2NF9zeXNfaW9jdGwKCkxvY2tkZXAg
b3V0cHV0IHNob3dzIHRoZSBzYW1lIGFkYXB0ZXIgbG9jayBoZWxkOgoKaTJjX3JlZ2lzdGVyX2Fk
YXB0ZXIgKHJ0X211dGV4KQoKPT09IEFkZGl0aW9uYWwgc3RhY2sgKGFkYXB0ZXIgc2lkZSkgPT09
CgpPbmUgQ1BVIGlzIG9ic2VydmVkIGV4ZWN1dGluZyBpbnNpZGUgdGhlIGJpdC1iYW5naW5nIEky
QyBhbGdvcml0aG06CgpjeDg4MDBfYml0X2dldHNjbCBbY3g4OHh4XQpzY2xoaQppMmNfc3RvcAp0
cnlfYWRkcmVzcwpiaXRfeGZlcgpfX2kyY190cmFuc2ZlcgoKVGhpcyBzdWdnZXN0cyB0aGUgYWRh
cHRlciBvciBhbGdvcml0aG0gbWF5IGJlIHN0dWNrIHdoaWxlIGhvbGRpbmcgdGhlCmJ1cyBsb2Nr
LgoKPT09IFJlcHJvZHVjZXIgPT09CgpObyBzdGFuZGFsb25lIHJlcHJvZHVjZXIgaXMgY3VycmVu
dGx5IGF2YWlsYWJsZS4KVGhlIGlzc3VlIHdhcyBvYnNlcnZlZCBkdXJpbmcgc3l6a2FsbGVyLXN0
eWxlIGZ1enppbmcgdmlhIGkyYy1kZXYuCgo9PT0gRXhwZWN0ZWQgYmVoYXZpb3IgPT09CgpJbnZh
bGlkIG9yIHVuc3VwcG9ydGVkIEkyQyB0cmFuc2FjdGlvbnMgaXNzdWVkIHZpYSBpMmMtZGV2IHNo
b3VsZCBmYWlsCmdyYWNlZnVsbHkgYW5kIG11c3Qgbm90IGxlYXZlIHRoZSBJMkMgYnVzIGxvY2tl
ZCBpbmRlZmluaXRlbHkuCgo9PT0gTm90ZXMgPT09CgpUaGlzIG1heSBpbmRpY2F0ZToKCmEgbWlz
c2luZyB1bmxvY2sgaW4gYW4gZXJyb3IgcGF0aCwgb3IKCmxhY2sgb2YgdGltZW91dCAvIGFib3J0
IGhhbmRsaW5nIGluIGJpdC1iYW5naW5nIEkyQyBhbGdvcml0aG1zIG9yIHRoZQpjeDg4eHggYWRh
cHRlciBkcml2ZXIgd2hlbiBmYWNpbmcgbWFsZm9ybWVkIHRyYW5zYWN0aW9ucy4KCkkgY2FuIHBy
b3ZpZGUgYWRkaXRpb25hbCBsb2dzIG9yIGNvbmZpZ3VyYXRpb24gZGV0YWlscyBpZiBuZWVkZWQu
CgpUaGFua3MgZm9yIHlvdXIgdGltZS4KClJlcG9ydGVkLWJ5OgpaaGkgV2FuZwo=

