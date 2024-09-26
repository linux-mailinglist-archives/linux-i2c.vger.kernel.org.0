Return-Path: <linux-i2c+bounces-7025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703F986FAC
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 11:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D91E5282572
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 09:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109ED18BC10;
	Thu, 26 Sep 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="OdsRwle+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2119.outbound.protection.outlook.com [40.107.243.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711F1537A5;
	Thu, 26 Sep 2024 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727341894; cv=fail; b=IWBAicEmE316nYqbjxtDHtwPmBsYz3on1k6jg7nQjO5c/ak4CRC2dGs8gEW+XwZ9etor+ZrS/qkmxK7/PKWUKE0o6NytsXa+58R9/kaP3OEaCe5NfLzDbPf/6wtz9+V0Fw50ViOg9I5cEG1qBZfllmFR6EuLc1Sdy3y5zv7Pq98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727341894; c=relaxed/simple;
	bh=nIoQBl18ReCLfAEnheopy4EziZrjxFfVFUzcrXGTCDA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZTeTKDKLUmprkVEweVX9F1TRm7v3F1Wv/aXM0iYLXu2PWF+aXeYVRibmI+VIQmkJsQr1lY+T5z4pckKcZqbm+CuHIjF7O3pdtdgGK7FCEaKbvkGCtfb6aASZukNBKB+dBBvDMxfky6YeJEESs1e166Zdl9tUhDcz6d9pu8YFGrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=OdsRwle+; arc=fail smtp.client-ip=40.107.243.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMoqrTAVAgD0vmHKjwuShoC4kzlY7WsP8PPAOJ0hMu1c75rahlx1f3Gjges/6pfY5/brkMhGd/iNR8+w4zSmuU4iHYDgxz7TKYBDmSNETmZ6Ia3ZaVH5w7T66loClVJoXsYHDCO/C8ntebdNK176rn21tKx06EiamRrV3n0ny883ny5rnRHL3D2BBBl9PQWnrhio8SQ9t1do9SwVIcXleRKv04A4MIX3z9OkQpvfHk2UvLay4C4H+PzjSH/3h+4LhOAVfAC0eqtAv8BZ3aga28qPGtZw616qN6fkxZPDNbs5caUJ0C82aq0XJfo0RGZY6JemB+cePStp7BHJZkX/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIoQBl18ReCLfAEnheopy4EziZrjxFfVFUzcrXGTCDA=;
 b=k8MYtfETyr1Sm/ajDLTZbUG/Mhd4Vt9plCsMnth5ereawQP791Haj8rRECiGNaN7gtJEqYINtHjgjILEbXdI/X+TKjdqqphprkpEiOE8T8mogT/8POcGBZlTbrlWUMaLR9E+KBXA0hUWDrUOftdTsty3tSQg4VuIMx8LUW8ZtRfI+45MqPxVbQMT8Ck3UNgNM1join7QOqP5XX2eePkmlPe3ERgsEyRQ143Xq1ICbjaNG0lo0iRzUxuPyE7IL1bJindYrWGnSvJIIDYGFN0/se4QXVtczeDIH12XtH3oDNUaSsIqHOE6xKXPuHD4+MA6tLmkMSoobazRHda7Ve7+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIoQBl18ReCLfAEnheopy4EziZrjxFfVFUzcrXGTCDA=;
 b=OdsRwle+UD6Tk1Aca2lJLA4eNvxUl6HtO5vXZLvwhwQvt9duEu2oAZ5unZ2ic46yiNTAxGglZ+c9OH6XXhs+jtYdgQzWNA5ZpAe0elG65JIIgWrE9fqYUa36bgW4nznMp1JY2Qg7T582vTiwFkGNvGG0WWxJFhx640NC39eGBYw=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by SJ0PR14MB5885.namprd14.prod.outlook.com (2603:10b6:a03:449::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 09:11:29 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 09:11:29 +0000
From: Michael Wu <Michael.Wu@kneron.us>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>, morgan chang <morgan.chang@kneron.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based on
 HW paramters
Thread-Topic: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Thread-Index: AQHbDyGZij9/nSd+SEOB2a6TVXZu/rJoVW+AgAFufJA=
Date: Thu, 26 Sep 2024 09:11:29 +0000
Message-ID:
 <IA1PR14MB6224A402109C057748A215798A6A2@IA1PR14MB6224.namprd14.prod.outlook.com>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
 <90f64539-3092-4d3b-bdf2-c6af51e32fdc@linux.intel.com>
In-Reply-To: <90f64539-3092-4d3b-bdf2-c6af51e32fdc@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|SJ0PR14MB5885:EE_
x-ms-office365-filtering-correlation-id: 674a8dba-6708-4454-b575-08dcde0b34cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?THdkZlJhb3dnbmxnUkdiNTlOdHJjck1DYitxT2RmWlpzSEs0bFhBYnN1MDJq?=
 =?utf-8?B?aXJBblVtd3YxN2YwY3YzamduclNuZGdKb0VTVVpGNzZ0YlFGOVZVWXFpa1pV?=
 =?utf-8?B?RVltQXhGdlFXNTlkeFJqVjVtSm1RTjdGK0ZvOXFFZmJsRDNycHFxUjlQZ1ZG?=
 =?utf-8?B?QmJibndIZlFSVU9SSkZMYzZ0eVk1TGZESEpsTSs1ZEpxTnNrL1NJNmorNHdF?=
 =?utf-8?B?QlhMN2M2MnQ4b01iTUVlc2VDT0NGZVR1ZUdjUTJwN0thTzNSUXkzSElrRmxs?=
 =?utf-8?B?TGYvb3lKTGZhMURhU1NLM0Jkc3BOT1BMY3dQSGJIcjdvM1lEU200dysxVUtu?=
 =?utf-8?B?cVhzbWFkZ3l4cUg4NERXNEk2YTlYNGFjR2FEem9abTAyWnk1RTQwa25DbkU3?=
 =?utf-8?B?dFpWclNqMWxacHFnOWY2YUVWZnRETHB5SmpjYkp6Wkw5NGF0VEhLUDFCSWIr?=
 =?utf-8?B?OWtkTE9GWjFYblk4QnZZem1xaWp0cFJybUZZZjF2TStsNlhrenU0OC9pUzBo?=
 =?utf-8?B?b3FyVGFqWnV2QVY3NlhKNXcwRGEwa3NOS05nTTRnV1FKWjlKcEE0WHpBWk9l?=
 =?utf-8?B?RjJFM01mZi9jUC9iZk5zc1ltby9PN2NzNGRHTlcySHYxdTdlR2h0NFFFVTNi?=
 =?utf-8?B?dVBRYmZ0NWVOL0F2MG9aaGFaQ3Q5RzJXdXlTdkZnZ2s0aFd4ZjB6SWZFWExi?=
 =?utf-8?B?TlNKL2RpZDFLS2hpSllPRnlmdkZzQXc2a2dSR0c2SHlNQzk4YlE1MExlSTc5?=
 =?utf-8?B?TktsZFcvNVU3K2s5QmN3dSt2VTMrQk9KdFFuZ2Q4U2NUdnhLZ3FiemVxcFk2?=
 =?utf-8?B?NjRtaTZmclBsTnpobXBFY3BqOUx2V1RzWkZaRXRUK2xSSDNvYkJielFIWWl1?=
 =?utf-8?B?L0xUOU5sVG5KblhJTDcyM0hIM3o3Ymk2UlptYU5ZNGEzUFN2Mzhud0l3QzN5?=
 =?utf-8?B?ZTJ0c0RYWkhocGdTaDFLSmJNNFNqWFJMc2RqUXVsNS9LMmhKc2RBV2F4bDJs?=
 =?utf-8?B?Z1pRaEJITUh2N1M0Z0x2ckNnaGxpZW5JRDJLWEJsZ0pSSjArMklkLzNaY0Ew?=
 =?utf-8?B?YTcvekFEMHNkTTJ2R3hJMzBNakNRU3BGVHFGTXRDamw0cm95TkRUUkNDSmQ1?=
 =?utf-8?B?ZEdacGtRZW1samhyamk4dG1rVklvNEwvUk1nOFJpclpHTUVvVGo1NE9NZjNt?=
 =?utf-8?B?cmx6VVp6WVFLSmZJOVYrNkNLVThrdkZwUXkyL3ljdXdwMk44Z1R0N1ZqQkRQ?=
 =?utf-8?B?UEhLN0IzOUo4QXFWTzM2anhPRHlGa01zVGFmcDRnNmFWN0RqelcxRVM0cWFw?=
 =?utf-8?B?eEIyek51ZUVDQzZCS2RQWUxuVTFDSHNJNlJ4d3AvcWpPZ1Z2eGlkdTBnRzJh?=
 =?utf-8?B?Tis4UmluSGxGOW5QWitCanRJMkZuNUJVVThXZFIrZHYzdDd0S1Vsc2l4Nlda?=
 =?utf-8?B?SFA0WW44WGNocWJRSGl6QzVsNDhlRnd0bkhkVENHMktWTmJ3OFhxWmpiVW00?=
 =?utf-8?B?cmREdnNyTHJMbnpzbktra0tCTkthd0tpMmZjRWtPenJxdnltV0p2THJpR1pR?=
 =?utf-8?B?L0dSVGdsMW80Q3YrZXNCYmNXUEx4ZTNNWVBzUHo2WjMzYzhkRTBwcVBLS1pt?=
 =?utf-8?B?TCtQMEV6VXA0cVZNdCtIa3UwQmMwOG1GTUkvL0ZHVkxBczRTdDFPbFdtenZw?=
 =?utf-8?B?MzdQZTQyS0R6c2ZKUGVMZERKaGlqQ0JWMHhsL2RCaWpONm0ybEJkZ1loRzV4?=
 =?utf-8?B?NHlEWGtGOU9ReUpBNVdTUndEeGM0enljbkVpaVJSRzExWERESm16TmxvZXJ0?=
 =?utf-8?Q?VI8Up4AI00KE0rJJ/uc75/NFK9rDsEiO9/gRo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wm9vcllYcC9VVTBaNlNqOFNCV1EwaVg0OXIrRURtbElRbWhvTzFjUGpQeGxo?=
 =?utf-8?B?S2xySU9jeFZ0QWtDdzBQVFdQbWpIdXQrWkFpMmk2b0Q4dTBXR1hFRWk3Z1VT?=
 =?utf-8?B?RTBXRS8vaHRpK1VIS2hISEIwSDR3ZnVHMko2dERLM0M1ZE9lMmhoTjVvazlu?=
 =?utf-8?B?VnVqWXRLWTRkMmx1VmFIc2JGNUJsMktCU2xQNVNHUTVXUTBtWUgzYUVrSXI2?=
 =?utf-8?B?RndJdG1HVzRvT2VuYUQrc2hENmFVV1RGZ2w2ZVpWYVJ4ZjcySXliN2tqYnEw?=
 =?utf-8?B?ZDdRQkZETVRjOXowNXZxdmM4YWNlMHN2ZkZCUjVoVk5waS9IcDh3bmI4MExF?=
 =?utf-8?B?UDkvd1piRFY0UFJ1bTJGbFBLckRJcDRoczRHQXk4d2Q1VnRnNXhXWSs3UjlS?=
 =?utf-8?B?YXZBdS9oeG41RXFTN2YxVFRQWTVQbjBpSWhvYVJBWUI1eXA1RmovZG1aNy9a?=
 =?utf-8?B?Sk1aVHc0Y01aeXZJODJXMWJDYjluWnp1TU5FY1Uwbm9Qc2dLVFFuNktWRDEr?=
 =?utf-8?B?aGM3dmRXVWV1ZE43SXVHQVhXT3BLZ0ZqZTBkMXMxaWk3WUdEWnUyYlQxdEh4?=
 =?utf-8?B?WEZnNFVtSkNrSWk5d1RDSTRCUzJVREprb013RE9FNWtNR1FtQ3k0ak55Q3lu?=
 =?utf-8?B?dEdqd2tTSndQWFV3SlY4VCsrK3ppSTJSeGVSb2xFNnFlbXRhajRkRTlQUzJ0?=
 =?utf-8?B?ajIvTjZVUTJoazBjbndWN3hUWVNBTkVrdnBSZ2pmdXhsdXRGWTQveE9yQktl?=
 =?utf-8?B?MjJaQmpEMDN5OWM5MEE1Z2VMS0F3Slc1KzNYb3piaUxsRFJPSE12bDFUaUE1?=
 =?utf-8?B?UEc1UVpIb1hTRnpreEF6VzNWaFZDVnpHdSt0bFFPblhjazVqTHhhUHdGOXlp?=
 =?utf-8?B?Y1NwSHlTTGRyMXp0emFtcVJMTzI2dFZjMkJFN0wxRWRDNElaWEZxK3dzUkox?=
 =?utf-8?B?eEtIQ29ENnBVMk5TVTFtN0dlaThBUTdJaXZVSjNmdGlJT1ZnMzVSRG1helM4?=
 =?utf-8?B?S1Q2RGdMNFI5V21zaHZFZWtZTFBPVEJ6L3ZxcWE1dHgxY05XS3RIMGthSDBn?=
 =?utf-8?B?Uy9zR0kzVE1KbXZTRW4yVlR1RjJsZ0s4aFhDemdxN2tMMnpLK051SkMyb0NL?=
 =?utf-8?B?RFVjRFQvMlNVbmFHeFR1RnNuRkQ5V1l0Y0RJeVY2VGowKy9wbWJmOXZVbkZT?=
 =?utf-8?B?dElwRFdrNE1mSEtsTnFzbURPU200QzhjMU5EeXdqcXo1QXFBRHJBc3dGTjMy?=
 =?utf-8?B?MjRIV0d1VjFyVWV5dFNaa2twM2Q4aEdaQ1dVVkY2M2FJSFdZby81WTJWdzM5?=
 =?utf-8?B?RG5kNDBQRGEvVVE5dFhvZy9FbVZIT1FreWhzWFlNWEhzYU9yd2xBNHFGR2RM?=
 =?utf-8?B?TzJMZnVjU3VvNW41V1c4WWRLTCtyUzlaUVpnZzFwVEhHL3BnREtDVWgvVXZR?=
 =?utf-8?B?d0gzYURTVFp5TnhjMmJUM0MwRHBYcWo0eUhUcVIzdDEvOHlZazZmb0pvK1Bx?=
 =?utf-8?B?cUE2M3ZNZ2E3aHV2aUhTUjY1OHZrNzNBM0JsQnJ6Qm80N2pwVWNiY1RSdEk0?=
 =?utf-8?B?a0RtTDBhM3lBRzR6NzNheXdQbTd6VlFhdDRDYit2bjJ6ZFJQbnBlTXBHbUhq?=
 =?utf-8?B?QkU1Wjdvdm9pdTB5Z0NnTHBnbXd4WGsxeDVWQ1FxNnc1cjZFWks2VTN1bm00?=
 =?utf-8?B?T3R0RVU4MU11WFRQSWIrU2VXMW1GZURSVHFLR2tZQUxjNXF2TVFmM3NGakdL?=
 =?utf-8?B?MDMycXZMbUlXdG5ZbVZtWXZkMFlsQjVPcDh3TnVMQU8vN0FVUTFFK1k0OGxp?=
 =?utf-8?B?RkZLbUhSQjg0RyswTFhFTjFaS09IQ3B5MHJEY1ZuNlNUUnNXY2Z1aEMxbUhU?=
 =?utf-8?B?L2F5aVV1akh6dDQvdC8yUUFNNURGRmtFSGJKbmI3R04yUTlvM1NOdnZpM1Zy?=
 =?utf-8?B?S2p3TFJ3RUsvZzl0UTk0UGFuSFhHU2tyVzFhZk1mVDBuM0YwdnQycDk2Nkc0?=
 =?utf-8?B?MyszaG9LQmpxYzdlaHhlRHI5MDJrU0xJYk1jcXNIV0NNZ2xNUU5LZFBldXFT?=
 =?utf-8?B?eTl2cDZ3dHJKc3NKS3FNT1RRNEJaUm54V0xQTXRESis3Rjd6c1l1dGNJOGRx?=
 =?utf-8?Q?VqNo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674a8dba-6708-4454-b575-08dcde0b34cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 09:11:29.1127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZxI9txm9HM3S0rwLGCzNws5v+ooKrAmiaJ0XKAme9LCXgSks3fsiVbIFHGrwTxgD8zn3kY1cVr4C7Ws5TKYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR14MB5885

PiBPbiA5LzI1LzI0IDExOjA0IEFNLCBNaWNoYWVsIFd1IHdyb3RlOg0KPiA+IEluIGNvbW1pdCAz
NWViYTE4NWZkMWEgKCJpMmM6IGRlc2lnbndhcmU6IENhbGN1bGF0ZSBTQ0wgdGltaW5nDQo+ID4g
cGFyYW1ldGVyIGZvciBIaWdoIFNwZWVkIE1vZGUiKSBoc19oY250IGFuZCBoc19oY250IGFyZSBj
b21wdXRlZCBiYXNlZA0KPiA+IG9uDQo+ID4gZml4ZWQgdEhJR0ggPSAxNjAgYW5kIHRMT1cgPSAz
MjAuIEhvd2V2ZXIsIHRoaXMgZml4ZWQgdmFsdWVzIG9ubHkgYXBwbGllcw0KPiA+IHRvIHRoZSBz
ZXQgb2YgY29uZGl0aW9ucyBvZiBJQ19DQVBfTE9BRElORyA9IDQwMHBGIGFuZA0KPiA+IElDX0ZS
RVFfT1BUSU1JWkFUSU9OID0gMS4gT3V0c2lkZSBvZiB0aGlzIGNvbmRpdGlvbnMgc2V0LCBpZiB0
aGlzIGZpeGVkDQo+ID4gdmFsdWVzIGFyZSBzdGlsbCB1c2VkLCB0aGUgY2FsY3VsYXRlZCBIQ05U
IGFuZCBMQ05UIHdpbGwgbWFrZSB0aGUgU0NMDQo+ID4gZnJlcXVlbmN5IHVuYWJsZWQgdG8gcmVh
Y2ggMy40IE1Iei4NCj4gPg0KPiA+IElmIGhzX2hjbnQgYW5kIGhzX2xjbnQgYXJlIGNhbGN1bGF0
ZWQgYmFzZWQgb24gZml4ZWQgdEhJR0ggPSAxNjAgYW5kDQo+ID4gdExPVyA9IDMyMCwgU0NMIGZy
ZXF1ZW5jeSBtYXkgbm90IHJlYWNoIDMuNCBNSHogd2hlbiBJQ19DQVBfTE9BRElORyBpcw0KPiA+
IG5vdA0KPiA+IDQwMHBGIG9yIElDX0ZSRVFfT1BUSU1JWkFUSU9OIGlzIG5vdCAxLg0KPiA+DQo+
ID4gU2VjdGlvbiAzLjE1LjQuNSBpbiBEZXNpZ25XYXJlIERXX2FwYl9pMmMgRGF0YWJvb2sgdjIu
MDMgc2F5cyB3aGVuDQo+ID4gSUNfQ0xLX0ZSRVFfT1BUSU1JWkFUSU9OID0gMCwNCj4gPg0KPiA+
ICAgICAgTUlOX1NDTF9ISUdIdGltZSA9IDYwIG5zIGZvciAzLjQgTWJwcywgYnVzIGxvYWRpbmcg
PSAxMDBwRg0KPiA+IAkJICAgICA9IDEyMCBucyBmb3IgMyw0IE1icHMsIGJ1cyBsb2FkaW5nID0g
NDAwcEYNCj4gPiAgICAgIE1JTl9TQ0xfTE9XdGltZSA9IDE2MCBucyBmb3IgMy40IE1icHMsIGJ1
cyBsb2FkaW5nID0gMTAwcEYNCj4gPiAJCSAgICA9IDMyMCBucyBmb3IgMy40IE1icHMsIGJ1cyBs
b2FkaW5nID0gNDAwcEYNCj4gPg0KPiA+IGFuZCBzZWN0aW9uIDMuMTUuNC42IHNheXMgd2hlbiBJ
Q19DTEtfRlJFUV9PUFRJTUlaQVRJT04gPSAxLA0KPiA+DQo+ID4gICAgICBNSU5fU0NMX0hJR0h0
aW1lID0gNjAgbnMgZm9yIDMuNCBNYnBzLCBidXMgbG9hZGluZyA9IDEwMHBGDQo+ID4gCQkgICAg
ID0gMTYwIG5zIGZvciAzLjQgTWJwcywgYnVzIGxvYWRpbmcgPSA0MDBwRg0KPiA+ICAgICAgTUlO
X1NDTF9MT1d0aW1lID0gMTIwIG5zIGZvciAzLjQgTWJwcywgYnVzIGxvYWRpbmcgPSAxMDBwRg0K
PiA+IAkJICAgID0gMzIwIG5zIGZvciAzLjQgTWJwcywgYnVzIGxvYWRpbmcgPSA0MDBwRg0KPiA+
DQo+ID4gSW4gb3JkZXIgdG8gY2FsY3VsYXRlIG1vcmUgYWNjdXJhdGUgaHNfaGNudCBhbmQgaHNf
bGNudCwgdHdvIGhhcmR3YXJlDQo+ID4gcGFyYW1ldGVycyBJQ19DQVBfTE9BRElORyBhbmQgSUNf
Q0xLX0ZSRVFfT1BUSU1JWkFUSU9OIG11c3QgYmUNCj4gPiBjb25zaWRlcmVkIHRvZ2V0aGVyLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXdSA8bWljaGFlbC53dUBrbmVyb24udXM+
DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9u
LmMgIHwgMTYgKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVz
aWdud2FyZS1jb3JlLmggICAgfCAgOCArKysrKysrDQo+ID4gICBkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWRlc2lnbndhcmUtbWFzdGVyLmMgIHwgMjQNCj4gKysrKysrKysrKysrKysrKysrKy0tDQo+
ID4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtcGxhdGRydi5jIHwgIDIgKysN
Cj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUt
Y29tbW9uLmMNCj4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMN
Cj4gPiBpbmRleCBlOGE2ODhkMDRhZWUuLmYwYTdkMGNlNmZkNiAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMNCj4gPiArKysgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMNCj4gPiBAQCAtMzMyLDYgKzMz
MiwyMiBAQCB2b2lkIGkyY19kd19hZGp1c3RfYnVzX3NwZWVkKHN0cnVjdCBkd19pMmNfZGV2DQo+
ICpkZXYpDQo+ID4gICB9DQo+ID4gICBFWFBPUlRfU1lNQk9MX0dQTChpMmNfZHdfYWRqdXN0X2J1
c19zcGVlZCk7DQo+ID4NCj4gPiArdm9pZCBpMmNfZHdfcGFyc2Vfb2Yoc3RydWN0IGR3X2kyY19k
ZXYgKmRldikNCj4gPiArew0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlyZXQgPSBkZXZp
Y2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5kZXYsICJidXMtbG9hZGluZyIsDQo+ID4gKwkJCQkg
ICAgICAgJmRldi0+YnVzX2xvYWRpbmcpOw0KPiANCj4gTGlrZSBBbmR5IHNhaWQgYmV0dGVyIG5h
bWUgd291bGQgYmUgYnVzX2NhcGFjaXRhbmNlX3BmLg0KSSdsbCByZW5hbWUgaXQgdG8gYnVzX2Nh
cF9wZiBkdWUgdG8gdGhlIGxpbWl0IG9mIG5vdCBleGNlZWQgODAgY2hhcmFjdGVycyBhIGxpbmUu
DQo+IA0KPiBBbHNvIGkyY19kd19wYXJzZV9vZigpIHNvdW5kcyB0b28gZ2VuZXJpYyBhbmQgbWF5
IGxlYWQgdG8gdGhpbmsgYWxsIGFuZA0KPiBvbmx5IGRldmljZSB0cmVlIHJlbGF0ZWQgcGFyYW1l
dGVycyBhcmUgcGFyc2VkIGhlcmUuDQo+IA0KPiA+ICsJaWYgKHJldCB8fCBkZXYtPmJ1c19sb2Fk
aW5nIDwgNDAwKQ0KPiA+ICsJCWRldi0+YnVzX2xvYWRpbmcgPSAxMDA7DQo+ID4gKwllbHNlDQo+
ID4gKwkJZGV2LT5idXNfbG9hZGluZyA9IDQwMDsNCj4gPiArDQo+IA0KPiBJIHRoaW5rIHRoZXNl
IGFyZSBtb3JlIHVuZGVyc3RhbmRhYmxlIGFuZCByb2J1c3QgaWYgbm8gcGFyYW1ldGVyDQo+IGFk
anVzdG1lbnRzIGFyZSBub3QgZG9uZSBoZXJlIGJ1dCB1c2VkIHN0cmFpZ2h0IGluIHRoZSBpZiBz
dGF0ZW1lbnRzIGluDQo+IHRoZSBpMmNfZHdfc2V0X3RpbWluZ3NfbWFzdGVyKCkuIExlc3MgaWYg
c3RhdGVtZW50cyB0aGF0IHdheSBhbmQgYWxsDQo+IGNoZWNrZWQgaW4gb25lIHBsYWNlLg0KDQpi
dXNfbG9hZGluZyBpcyBhIGhhcmR3YXJlIHBhcmFtZXRlciwgaW5kaWNhdGluZyB0aGUgY2FwYWNp
dGFuY2UgdmFsdWUuDQpMaXRlcmFsbHksIGl0IGhhcyBubyBkaXJlY3QgcmVsYXRpb25zaGlwIHdp
dGggdGltZSwgc28gSSBtYXkgY3JlYXRlIGEgbmV3DQpmdW5jdGlvbiB0byBwYXJzZSBpdCBhbmQg
b3RoZXIgaGFyZHdhcmUgcGFyYW1ldGVycy4gQmVjYXVzZSB0aGUgc2FtZQ0KcmVhc29uLCBpdCBp
cyBub3Qgc3VpdGFibGUgdG8gYmUgYWRqdXN0ZWQgaW4gaTJjX2R3X3NldF90aW1pbmdzX21hc3Rl
cigpLg0KTGlrZSBpMmNfcGFyc2VfdGltaW5nKCkgZGVjbGFyZWQgaW4gZHJpdmVycy9pMmMvaTJj
LWNvcmUtYmFzZS5jLA0KSSByZWNvbW1lbmQgY2hhbmdpbmcgaXRzIHZhbHVlIGFmdGVyIGRldmlj
ZV9wcm9wZXJ0eV9yZWFkX3UzMigpIGlmDQpuZWNlc3NhcnkuDQoNClRoYW5rcyAmIFJlZ2FyZHMs
DQpNaWNoYWVsDQo=

