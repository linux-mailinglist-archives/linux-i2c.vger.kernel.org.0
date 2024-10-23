Return-Path: <linux-i2c+bounces-7509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD029ABCFE
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2024 06:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EC741C22758
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Oct 2024 04:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543EA13AD05;
	Wed, 23 Oct 2024 04:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="jNTr7PE5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FC61FE9;
	Wed, 23 Oct 2024 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.247
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658488; cv=fail; b=dkIK263l83qjQcSCX5OtmJP/bJXFnylE5gvLS1jzueYhjQ4Q9OSLzP+Y2lJTIWCjt901Gt8oSee6ehXXwqjVNlMXQyrusStDTgu5Gxoq3DnJEyy2tV2uMXvzR4fhXObEetXIjGGNcFzissYZcyDmllRiWcQKFIZUHNf1XgFgZZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658488; c=relaxed/simple;
	bh=p/kOv1CFEp7+TS/u7+e/ymZRcReoiw9d3P/oXh7R7bU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C9rCftNHcYJzaV3wNoeBewJFWz3HO1FkpMqAP/WdIV3nHxIp6ZWPyDol8DxK/GBO03OGU3VBdL7ASsYDhMgL6f9/OC6g48CloUtaay+5m69M53HKRHxd0Nje70BObA1gLbXWV0w56TAopJfbUDz7KqUF/q8Tr2CqTFzZFdpaC1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=jNTr7PE5; arc=fail smtp.client-ip=68.232.159.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1729658486; x=1761194486;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p/kOv1CFEp7+TS/u7+e/ymZRcReoiw9d3P/oXh7R7bU=;
  b=jNTr7PE5hl4QcicV2mUDmtGb1CSaNUVyE2UIpfKEY2Lc0QL7S5YIb4Q/
   4Jxd4FCwzXcfasTAVWtbGu0fd4OYCCWAGZbWe3S5Se433kOGod749NDIW
   8s4p43tXdwi2WGHv0X5a9waFyYnl1bN8HkslJTCmuB4nzLKjGhiLbiP15
   hhO+S+LthiQ/srrQHBPJA9OGdUaJmvyq3sJJs3qCxqOLgopUrgujhzPOi
   wCemSsjVYlbA2YByPLp1mC3IwXhOgG0vJ3sQ2LgmObAnPMbsjzmHWolz0
   rFRhrRfWbM4fPr+p/CpEwUuuRlbaLW4GqQp54eNQP1p0TqFld2CRGwh/+
   w==;
X-CSE-ConnectionGUID: 6MFRKBSiSPKtMaeeoY4BDw==
X-CSE-MsgGUID: SKuHNIjNRRKeKiVsZo/mOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="134617650"
X-IronPort-AV: E=Sophos;i="6.11,225,1725289200"; 
   d="scan'208";a="134617650"
Received: from mail-japaneastazlp17010000.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 13:40:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9jIFf+XuNojujx+gFQMwdFsE346s+kydu9MD0UmB0/RCMKOJBbS6JUc5zfkFB/I5elBiy5dC+WAAKEDwHuwEFTOlZO+bPkwvKMS/SPPT/UfBDs2rdR2c/eMPVqi7rRc9E29Ffsirk26srqvuKC401Qc4UsW4kU40c1Drcw8+XlA3A3P8CiKSt6lL6yE1P49934cQnqsfK5746zdW2WhBCqEJrRJX1hJe4wFHjw7rCpUK0gX8PrE+ENgJ+S/HxQiqCeK44CSEzBTZZ5UwgHSkirO3j6+D0w7lq2k8R6HBe7LHSJj8+UFcUNJndHim5phBNPCCqBdm19s136ClIsljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4XJM6hFQECB/DjFH7ME3ap0TmZvQriOobqJb9wFx9w=;
 b=Z7JyM3FKuJb2Y/YDDmZofkuiQwPhyV0mFu36fZaJ6ff+mjh/7Mh87J6oHYgDHlhdgzTdIZiZnrW/uxl3YPUGYrrdRbbE1jg0cDXZW+GqsNLLwtubsxedyAh14N6Xy+7zVtyE3CiMHSd7XqKG0hrbXUzUBwWjHOT0xYjZ1QcrfBx5Es3E0qwDwxiaSK54EtksDKaEU5mYHyD29KG5BsfuEBEVLD1q3gOJh80ryv729YdDRtLuP/d/uWue8nvKPM5VX6VX1N87HgnCMfZekMCDUoAnCQygzsw7+juPRL9WrVhc09TJtAmn4h+P+JCzbALbquvHjdzwgO8gsvi2TQ12vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com (2603:1096:604:12c::9)
 by OS3PR01MB8524.jpnprd01.prod.outlook.com (2603:1096:604:19e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 04:40:07 +0000
Received: from OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe]) by OS3PR01MB6903.jpnprd01.prod.outlook.com
 ([fe80::df96:5745:d1b5:cafe%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 04:40:06 +0000
From: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
To: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
CC: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller on
 Fujitsu MONAKA
Thread-Topic: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Fujitsu MONAKA
Thread-Index:
 AQHbIQE+jLx5nBqtt06FYSQ4k1MgtLKMdDKAgARb1sCAABOggIABGCBAgADKboCAAQBgsA==
Date: Wed, 23 Oct 2024 04:40:06 +0000
Message-ID:
 <OS3PR01MB69031E111FDC5B5D302E61A9D44D2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
 <ZxJXj3holsMIdnC2@smile.fi.intel.com>
 <OS3PR01MB6903FEFE0404D809D62D4628D4432@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <ZxYQDSCpo8n4g3jM@smile.fi.intel.com>
 <OS3PR01MB6903405361060650429FAC2AD44C2@OS3PR01MB6903.jpnprd01.prod.outlook.com>
 <Zxek2SsrFg-XnHWP@smile.fi.intel.com>
In-Reply-To: <Zxek2SsrFg-XnHWP@smile.fi.intel.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=60bdbc06-9a19-4bbf-8d5c-f5fe87cd9e68;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-10-23T04:35:54Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6903:EE_|OS3PR01MB8524:EE_
x-ms-office365-filtering-correlation-id: b20306db-ca75-4a6a-731a-08dcf31cc494
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?Q09ONEJuQVJzQ3p4Ky9yaG9rRlVReDFqMXhlcytId2t1Rmh4UDFuNlFC?=
 =?iso-2022-jp?B?YUlGVURIV0V5dFlLd0lXNlI5RXRSZ08vRG8xWHVzYnZ4TitSVnF3eHlq?=
 =?iso-2022-jp?B?UUNhQUNXcDMzYWVLdjhvQi8yc21oRWEvVDNNTWZha2o1cWFlMGNkaFZx?=
 =?iso-2022-jp?B?dEZYRU02ekFpeVZlRFlRTisyYmtVTWJiMURLS0VlbCtlSm9KdWtlVlp5?=
 =?iso-2022-jp?B?ckdXUnRhOGpsYjM1bE5oNGp6cHBFTnlERmFPcUFOS1ZzT0FzczZFV2pF?=
 =?iso-2022-jp?B?RGxqSk5la2Ywamwwek1SOVg0dU9vRE5vMWN2VmJTSkFtTmVMd0NPZ2Zw?=
 =?iso-2022-jp?B?cG1xcUF4M25mOVo0YU9velFvR1pPemdJMXZHZDR6Z1lQWVpiL0lqOXE2?=
 =?iso-2022-jp?B?MUs1eFIvLytLS0w1aG0vOW9LaHBQUThsdEF1Y2I1QTV2cnhmVzh0ZUpJ?=
 =?iso-2022-jp?B?RlFBMTg1czFsSmRZSzBSa3kxTG82Q3JLL0pvU0FObzFwcXZ5Q2hab1Rr?=
 =?iso-2022-jp?B?OE9kVFRDdmg4bUFkdVd3UzdqK0RRVDVUS3BQdS9BbG5xVGxMSEJpdEdH?=
 =?iso-2022-jp?B?QUt5cFd2MjdsN2F4QzZNYzB6OFBDc1ZFYk9BdkF2RVQ1cElSWXJEUWdo?=
 =?iso-2022-jp?B?RW9HaUhGZ2N0VUR5TXpmdE1uZ3RIdk43YTJaRFVNckdtOEpYUFRkZHYv?=
 =?iso-2022-jp?B?QnNOdk9XYXVpOTMrMG83eEJoN1VRTncrUytCRXZHd3JFQWhUMkl2L1Ro?=
 =?iso-2022-jp?B?aDNpeG91QVVzbEo4bmw1cFhFTDZxcVJuT2Vld3RzY0lIUnpUMG9mRitr?=
 =?iso-2022-jp?B?SFVCTzllL3ROWm43NjU2WVE1VlNoazRrT1dxT2JTdUFRNGVpcHR4SnBK?=
 =?iso-2022-jp?B?bmxLaFE4L081akljUWZ0RU1kOXdRV0trd2tRTUFPUHJGeUdYSVlOYngv?=
 =?iso-2022-jp?B?WkZmd2dMcjR5UVBZSHNObmZ3V0V3M2NwS3JkL01SaDFWd2dsZkJGZUVm?=
 =?iso-2022-jp?B?d0k3dE5haDBlemJOTXRNdStmOHlRUnJCcnEwaDAwMHlFQno4TU5vVTRE?=
 =?iso-2022-jp?B?b0tVLy81MllSdEF4aVJDQlZ4RXhrVkY1Q3NJVGhyUXRIc1ZOeWd3WG5T?=
 =?iso-2022-jp?B?SUc5WEVOaEdzRlVabWQ3dHhiNG85SmpSamlCdGZ6RUwwZVFiOWpCaDhs?=
 =?iso-2022-jp?B?MXNjRUFEek5OWEowT1hXK1hrWDVmRkxEdjlpSDV5eHUrajlEanc3VXBI?=
 =?iso-2022-jp?B?NlVPaWthUmFjTFY2VUFicldqYnVta0c4cG9xRTRMS3hBNWxJZXFsZmt4?=
 =?iso-2022-jp?B?MGs4eGFSNCtaMDZRYWlpOGtjbnN5bDE2UDRJOStSZ3RDRFlRM2I4VVIv?=
 =?iso-2022-jp?B?YUc3T2hmQnhPLzZZRDJpeHZiZUcrN0NEa2NNUnVadjFlMXdYSU5NSHUx?=
 =?iso-2022-jp?B?RGQ1UUVEMDlva3NWTElCMjdBVzdaYTFJcnVnS05UZk04QU1IT1RpQzNz?=
 =?iso-2022-jp?B?VW1LU2lLZERLNDBIaHl0Q2liMUVJWnpmQmVDc2Fra0txVHBXYzdrNUNi?=
 =?iso-2022-jp?B?ZzdZS1BpdStyNkpMWExaZVY2TEJvbXhaSnhlU21MYzBJOVpVNG1YTElh?=
 =?iso-2022-jp?B?VnB5Rm9pTXVYajhudUVkRDRQNUNra05NQkNUUkNVdUgvUXRSR2MydVZO?=
 =?iso-2022-jp?B?TU91eTkzdFpYT3gwaFlxRlB0clZnYTVBVk5FTzRkZSt5VXM0ZGl4WnFW?=
 =?iso-2022-jp?B?NVBHcmlhUEtnWGU3NnFZcHlTclE0WTdJdWJyWTdiWk1wS0lSaEh4RVln?=
 =?iso-2022-jp?B?ekhjTExCTGpacExjc09XcUFLbG1jRzJzV2lUN2Z2bEpKTVlzb20vV3pB?=
 =?iso-2022-jp?B?QkFWei9lUFN0WTYxUld3SzJBUU5RTGNtMUdNSXpmRHJGaDMrd0FEWHpE?=
 =?iso-2022-jp?B?TkZyOWc5YzhGMDFQbTVSaUdEYnNQVnBiRzEwZnJCQmJva3BNaUhBdyta?=
 =?iso-2022-jp?B?RTkvRTJRcUtPQnpTVlVUTFg0SFIwaTFScVIyNnV5YmlRRjc0eis0QkMx?=
 =?iso-2022-jp?B?emc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6903.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?dUdoZU9IaURFSWpBak84RnI5ZEltZ3ZIQ1A4ZW51RUVFZktaK05PNXFI?=
 =?iso-2022-jp?B?L2J5bVNWYm54Zncva3ZjRURjK3U5ZDhpeUhiVm5vZVR3YmQvNlFqdnVD?=
 =?iso-2022-jp?B?R3RkZG5VQVc3djVZcXRCa1pXNFlpQzl5M2dXK0hYSjdpMS9iOGdBaW16?=
 =?iso-2022-jp?B?UDREVDZma1RSTkJ1QWpady9xNnJpcm1nVkFCa1J2ZFU2cWxuMkVVZWJo?=
 =?iso-2022-jp?B?UUdqNFBqZHlYbmRiR1E5MWU4QkE2b1huM0tFbTNEVXgvelNDSFBlNUs0?=
 =?iso-2022-jp?B?aFBvUzM3dkpaVlVnTG1KNXh1RGRYVG9waDl1REFUMVZOSmw1QVB0RmY1?=
 =?iso-2022-jp?B?QlY3OFdZak9zVXQ1ZjZSTStzVjFFSmxpYTNQeE9DaDdZL0g5UFZzd2Y3?=
 =?iso-2022-jp?B?QnN6SjFHOWtiUUd2MGJrNi8rTEN5SE4rU3hMc0xSeWV6VkhFN0hGSm9L?=
 =?iso-2022-jp?B?VVBNaFFnem0vb0Z4ZHlaby9sZTcwbUpuY3d4QXM5cW5RRHRvamx4ei91?=
 =?iso-2022-jp?B?NU16Sy9kNHVBdXJIWnA5ZFkyN1NqVmh2R2UwQktaMGNicjVtZ25HRkVs?=
 =?iso-2022-jp?B?b0d2Nm9LQzNraFZ2QlBNcWJwZmlIMDR2YThPZGhDNnBkdWJ4S3ZSK3FN?=
 =?iso-2022-jp?B?VDBiai9RdnhVZVJSMWxqUm05WXl1R2doRldySm5kWkdYdnZBOUVTRklF?=
 =?iso-2022-jp?B?QWljclZVbGkzYzlJNUJlcnFVTGF1ZEptQU42NnVCdVEwWUFuV2ZCWEFR?=
 =?iso-2022-jp?B?eFNnRVpaWUt1bW15WWhjVmpLRmNrcXNpWERMaHRCUTY4bmtRblNvZ2J4?=
 =?iso-2022-jp?B?blRJem0ycVFGWmM5ZVNIR3pyRlkrRlhxckVBNCtSbjZ1d0dCVk5JUWFD?=
 =?iso-2022-jp?B?V1B0MTdTM2RsRm9Lc3VtSythSTcvTlNwWk1iTXYyTmRSSU9aVlhOcW9S?=
 =?iso-2022-jp?B?bjd6V2x3amxDM0VYeE5BSXNhL1BKeTRlbDZFNTBqQUhmM3JOWGR5ZzM0?=
 =?iso-2022-jp?B?VUtWZVJDYUVhRnhXTXVDN0d1U0lvSzhReHgzUDhQMjFKdXFlVDBscnNt?=
 =?iso-2022-jp?B?ay9WKy9VN0w4Vm1hM2czNzBVdHJGazRnSmxvb1RlTzNRWnNrUzlIcGM2?=
 =?iso-2022-jp?B?NTNvV2cvclovaVdlVSttTkdORWh2R1lEUWExeTZtK0pQUytTQUNoc3FW?=
 =?iso-2022-jp?B?NkxWTjNQK2pPY2ttSFhZNzlDQmd4S0VYc0VZT0V1ekpTWWRqOHUyM2lB?=
 =?iso-2022-jp?B?L3RwTklqK0dDaTIyK1IweW9QMzR3emFnKytWUFBoWlhrdnh5RWxaQ3pu?=
 =?iso-2022-jp?B?d2N2Tmx6NzVQNHlPamtYWnZiZkR4dlUxZmhEVXp6WE1lTDFzbVRUaC9t?=
 =?iso-2022-jp?B?d0JuYkpyWmtJZnF6WU52ajZ6M2VuR1NoZllCa0p1c1hSMkFVdnlOVG5N?=
 =?iso-2022-jp?B?V1VOZ0RJNCt3SklmcDdLM3I3QW1yTGNraVZNTXpaenlDUFZ6dHpIU2Zs?=
 =?iso-2022-jp?B?WFBmYysvTWJHRDMxNFhoMTQ2eGFMNHhKZzJyandmb0JkKzVmMy9mOEcr?=
 =?iso-2022-jp?B?cmFVOEVVSVZoM1NUa1VuSXZWUHN5SVlsa0N4b005L0k1ZDR6eS81cVlh?=
 =?iso-2022-jp?B?TFZ5WGZ4SzNSOHZoQXhxejRqSVE1blRuQjZHa2dXYWw2b0hmWENTQWE3?=
 =?iso-2022-jp?B?TTRHanRpRldSbzA5dFlhWjFVRTA2SFVkWDg5K3hBWlpHNENsR1BXY05I?=
 =?iso-2022-jp?B?dU9Jc0dtbm9pZDZ2emdpSElVeW9kQTFnNzZmT21UYTFxSUlPbVRzV2Np?=
 =?iso-2022-jp?B?T0RsajlrcVZaZGpVKzNnOCtmb3U3UHE2U1RxaDZ4OC9WUm5zRkx1TmxO?=
 =?iso-2022-jp?B?Q2RSNkVZNlZLOFh6YTFYaEZuZUxNUkJtTVA1L1pZQ1pXbjBYS0lia0pO?=
 =?iso-2022-jp?B?V0h2elJPQ0hWT2R2V3VQMGgyNFFMSnZteUh2MlhPNW9GZjdUY1JBRzhJ?=
 =?iso-2022-jp?B?UE95RjhFdDJGU2pleUtNMVdOVVFHT1VUUTBreTFJN2F5UmE1aGM4Z25U?=
 =?iso-2022-jp?B?VWZaaWVvaTVmUWJ2K0dOQ3BJN21iQWxHd00zaWtlTVZqVk10L2RHQnp3?=
 =?iso-2022-jp?B?SS9iRU4rczJDWm5QUGlyTGYvamRuZVFyVVVRZENUM0FvZzZMdzB3NXgw?=
 =?iso-2022-jp?B?ZER4a0JsZ3pqSDU1SVAwSkx0bmxxalk0T0IrT0xKMTNsSUxQT0haaElL?=
 =?iso-2022-jp?B?NExZOGljM0hUWVlNUDgyY3l3YU5XbGhjNzJlQ1I4RWlpVFd3ZTRKSGl5?=
 =?iso-2022-jp?B?RS9TbW53TDAvWWZQN0NNS3I3aEpSOFo2YUE9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y3Q+uutt13uNCV5QN+R69uM80sjRl1OVKuHSeX+CH7fIqqN9SZTNE78X7UnRuvGkNu2jekrCCiHoVqLR/6H4yyKHzrKYL0I1L5DOP+qNCD7hl8uJb3hDsdgfFL+0cDNaU7Rik5psf//TotyIIbqDf53e6WhtNgtt6RwvzEqb1A7MOrsuKE5BKmIo3kpVltrg4bBPgDRsFj/HVE6VJyhHJMeu/Fe4UneUannIwPLolwNpurJmzDhsABFACIVV7YLVsJ53fW8w8umzk+/sFR82ttePLZ5lO+L/4xFQ+n1QCiyIsNR0u7FLMKlOxAEPSFhEtwLAjy7WRZ8QNfYlQHccTu515oNCv8sKsfYsXm5iwjMfOvrqCxnBcxpWj4kuvkjLFPjgO4vuU2h8ti9FxbMWoQwOrptBpoRbwS01noDoCmaOgaCBtrqYJYmTjQ/p2r3DAIoD6/egd/nmofT5lVpyd2+HMhbJuE8x3VlsIHgb94Qr83hy/7gBY9zDW6ZR5b/V1/cQ4+TLTZbpH8lOXcU2Di3zeQpUdaF5Hl0gje/EJ8BkpkH2uiRPmUvHY8MUOgsPHKfnuQkRrdYLEDWybmT/HHk1QAz9AcH11BuEthPAc1vwY01V6PuGgToe8cVMEYcK
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6903.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20306db-ca75-4a6a-731a-08dcf31cc494
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 04:40:06.2412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVgpcu3DdXMcACkXwBZeNU0cPiyf5Ka+quj9uYC88eceqaGGVYIWwM1kCH81ZiTv/oJFEP01kI/R/Uxk9dq+vHGP0bKEdnFfckG/6x93vk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8524

Thanks for the comment.

> On Tue, Oct 22, 2024 at 01:14:18AM +0000, Yoshihiro Furudera (Fujitsu) wr=
ote:
> > > On Mon, Oct 21, 2024 at 07:22:55AM +0000, Yoshihiro Furudera (Fujitsu=
)
> wrote:
> > > > > On Fri, Oct 18, 2024 at 01:58:26AM +0000, Yoshihiro Furudera wrot=
e:
>=20
> ...
>=20
> > >      Device (SMB0)
> > >      {
> > >          ...
> > >      }
>=20
> > > Hmm... Why Device object is called SMB0, are you sure it's the correc=
t one?
> >
> > We considered the string to be the most concise representation of
> > SMBus HC#0, given the general constraint that object names should
> > ideally be four characters or less. We understood that, unlike HID,
> > SMBus object names are vendor-specific.
>=20
> But this all about UART! How is it related to SMBus?

We created the SMB0 object according to the following specifications:
=20
ACPI Specification
13.2. Accessing the SMBus from ASL Code
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/13_ACPI_System_Mgmt_Bus_Inter=
face_Spec/accessing-the-smbus-from-asl-code.html
=20
IPMI Specification
Example 4: SSIF Interface(P574)
https://www.intel.co.jp/content/www/jp/ja/products/docs/servers/ipmi/ipmi-s=
econd-gen-interface-spec-v2-rev1-1.html
=20
Therefore, SMB0 does not deviate from the SMBus related specifications.

> --
> With Best Regards,
> Andy Shevchenko
>=20

Best Regards,
Yoshihiro Furudera

