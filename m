Return-Path: <linux-i2c+bounces-6973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D14985508
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43B881F23FA6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 08:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0809F15B966;
	Wed, 25 Sep 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="oofn1Riu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2138.outbound.protection.outlook.com [40.107.236.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4CA15B14B;
	Wed, 25 Sep 2024 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251494; cv=fail; b=PWvFtJ4BILU/ghFwgrjdrSrOxPw0nVR/ncLdk8xfCj+tesxLZtEnMImLyaKUQDJpP8eznQ34AzSx5JJ0R7njkgBW5yjbwCYlSfDmhOXKXx7aCSSy0ZlcEpZ5JwCwQphQtT9PkiHPwgnG16EjlvpcFN7ar7ArXF6G7E8ozMGFA+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251494; c=relaxed/simple;
	bh=Bdmh94dCmwo+Z9nMlceDEXr0VC4dZWl4ETJ1arrYhrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kuazPj+0lz+QrE9KNPie087IFf5RsVu4smr8LyO/EUWvpWhChecjX0rRwkusJvDeOyqO/pmsyh31lUG64s5DlFZSLSbEDIw0fCG9Tyb1PKNokC/uLI7wQPy0PvZgLCFet1gT4PpxELu6Gp4lUAq/zTx8vixYfPNKLrq7nIGUuuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=oofn1Riu; arc=fail smtp.client-ip=40.107.236.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3gDnbPOXCB56ktszk51zHurxEo+derbHSKn64XM3r4MOVa8/3XB0LX7ciA7OESiWgFEN9c0DcJ+zX/Syo2cUIGyU7mI7TUbcxc/DpalMG3iBVmK1AjO1kQgTQ2LQprtt1CA5jbdyycBj5QThqG35HiK3BLMOtc9Abx6M4kNuFVu9J3jTpNGLWO/YvoLVCCNYBiVQIeVhywIOcHcIT6NWq9JTcfXOJLTckw1lnAYoIyEK7Dxa8cn6pIYdDK0/HZ2JqRfaZygku6s+01b86jIcsV4ksCpRSE/S6Z4N41hPAMw5XUoQf6a9h1qTVJ9SnOy+lKdp5UNSOgLtWJhX21oiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H+OYyAJaPfOtFGaJxrpAUavM07J62O9A+BDRo/OqTc=;
 b=fatzFBfa66VBY/xLE4e4Pxyj/zWNMwpbxurW5Dlman5BK3GcOY/xSGcmqf2jfoeQNlXX8rBgoD9+uvRPWDJrbK0357tXGYwmOKeuLJcBn/dOP5OHOVjL/kC+Ox9e0QgaVfp3nTSzHgrgnYg705D+FCvzatX84yX0JW/Tu8Q0O20jkB7jYpGqLPe0BGbRwknXF3A76/sY+N9P12RBIPgN0trqwZNCRySxQVxU2o1rE4PoxY+M90N8GTa5FmpDBQC/65TJn3jfzO8bLMDumCPG4TVXQ2CqMwnjlU2ZhmAtbbXyOIRd+s7PuFvQt+X1cdq8F1eTr2w0f+jTzPnF45P4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H+OYyAJaPfOtFGaJxrpAUavM07J62O9A+BDRo/OqTc=;
 b=oofn1RiuVuEdnsIGN8aWrNI6bB+ajDmjoj7evJqrOO04Eq1q2hfjRdlElNLO3UsQyECKphRRTlN2L/yOsFx+TeDDjsL0JfEtUWdbayHZLlT6LRyHgP5O9yDMGRVXf36TzyKuOLlE61aIHAHycIKS3lPv3o8ohHD8KgWPajwUri0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by PH8PR14MB7109.namprd14.prod.outlook.com (2603:10b6:510:254::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 08:04:51 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 08:04:51 +0000
From: Michael Wu <michael.wu@kneron.us>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Morgan Chang <morgan.chang@kneron.us>,
	linux-kernel@vger.kernel.org,
	Michael Wu <michael.wu@kneron.us>
Subject: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based on HW paramters
Date: Wed, 25 Sep 2024 16:04:30 +0800
Message-ID: <20240925080432.186408-2-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925080432.186408-1-michael.wu@kneron.us>
References: <20240925080432.186408-1-michael.wu@kneron.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|PH8PR14MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed1f176-e934-41ca-e7ec-08dcdd38bb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|80162021|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXl5MDAycDhkRmwwSE1ReXNKR3FicVRmc1BzMUxhcHRiLzZwSmZxMjhjcHZJ?=
 =?utf-8?B?MDg1UzVSUUNjVmM1OCtQRWpKa2ZjaTF0SllEY1dGU0hsanhWbmhGTnVtcWtT?=
 =?utf-8?B?U1ZlbTdDT3duL0ZTUERJcFcvZkpNcHdVcmh4cFlQdWNxL2VCZDR1c2pnZzVU?=
 =?utf-8?B?b2dWNC9KNk81bmtGRUZGZTFrUForZ3NuNU44cmFHRVF0UVV0UTdYYlpNV2cz?=
 =?utf-8?B?Y2k5ejNrVHNleVBwNkxJbllFTXZ5Nk95cHptVHNlOEltdEFnaG9FMVBDeS84?=
 =?utf-8?B?ekZza3kwMkRKR3RuYWhqL0JPb3JTM3praUt6QURIeUhhUzQzVVBkbENPV29R?=
 =?utf-8?B?TlNFR1dUQy9UZm5HYzBoS3FhMnRZcDRqYUlpb2xrT1JseEZXMDZoNU12bmVv?=
 =?utf-8?B?S1FkS3hVVzZLcU9qMDJwejJZUnlTUEJzeWlRUU51dGhxSS8xOGZZSDFNcGlw?=
 =?utf-8?B?ZEdEWkRaTnhvUm1iczNJekVhQ2lta2FQRHpHdStFRDVqUjd3ZkI1V2trVi96?=
 =?utf-8?B?ZDg2QUhSTGZWdm1CRHBEa1J0R2lxeVgyOWI0Z0VHa2pDeSsySVEvaXRzd3o2?=
 =?utf-8?B?TC9aL1BobitaQUxjOEtJenhGaVd6OXZUSTZ6NkFQWHV3cVdiWTNKZ1BSZzVB?=
 =?utf-8?B?Q3lrNytXUFBLV3YzSzhWdVVZSXViSHdtaFlmVytrQVg4UW9KYk9DOGR6Nkly?=
 =?utf-8?B?RklWaTc1TnhPK29iNXJLcEdYamNDbXNSckZFNXNGbmJmdzNVVWVVOE0vMTgv?=
 =?utf-8?B?cXRTOWVjTThWTHIwelRIVmRQem40QkZNVnRFNTFubjZYb0JCRnJzZ2g0WXJX?=
 =?utf-8?B?S01MR2lrdnpXUTRYRldBM0RGbzYvcGd3YmNscXh5NkV6NnR1NXg2NHdhdE9w?=
 =?utf-8?B?WWxGLzZmTk9Jdml3ZkRSb1E3M0h1UzlEdTZtbU9jeVdtQzNBZEFLM3RzajZq?=
 =?utf-8?B?ZTlQb1lNWkpJTk9YNXQ2YkFNaHVTQmpxcmdZNUNKWHpCY0JDNm5HazNoT093?=
 =?utf-8?B?WGhjaUJidjhmaHJ5MmYrVkVLSG5QVFV6RkZyZm5LQ0dPU003UC9NUG1sRGlY?=
 =?utf-8?B?MWEwUEIxdTBGSWJ0NXBQM2lSZ1dVemhKRlV6UFJKTVcwSDRHWlRBTmliaXA5?=
 =?utf-8?B?VFM3YklLQm5OQkRZVVQycjlFZzV6aEJRYVpmbW51WUZqdEZTVjRqRitNZlEw?=
 =?utf-8?B?eFdPY09WRzdSdkFrcS9kSmNMNENQeG83UTZ2bUZWbjk4M0JzbCsvZDdaTXdR?=
 =?utf-8?B?UXBubEh1b0VDNVBSbHBZZTl2RHprcTdGWVZkcVhiMUY5UDBuR0RVaHBnUHFQ?=
 =?utf-8?B?ZHVXMUNHaFJDM3ZiRE9uRGhzOHBEWHh2cVNyUVhBeGp5YXkwSDdJZ2FsSGhM?=
 =?utf-8?B?cjdYUVJYQy9CK3ZlZzBsV1JYSlBpTmpFT3d1UDdKRDQxdyt6RjRyeTVSQzBV?=
 =?utf-8?B?R0dLMENOV2E0YWhDSkljenZ1RFloRXprbmV3cno4U0tmNG1WM0RwaWt4TFBT?=
 =?utf-8?B?R2xjQU1URTI0dW5LRC8wL2UvSHljQTFnM2RzVTdGMHhGcWRtVkc3bFdSc1dm?=
 =?utf-8?B?ZFN3N3NXZVAwOGtjTXI4Wm9mVXNwMDNrM1FuMkNweDUyY1hJVWtrSkFiS29D?=
 =?utf-8?B?NkFBVDV1RDkzSU4vVmJFWERXd2RLMzhyNStOb0hvOHNNbmt6VWdZWlF1Rjky?=
 =?utf-8?B?ZXRkUGtHekxtTFJuVXk1SlowdU5HMFVyemU4UHdIb0p2TGdOZUl3U2NPK3BX?=
 =?utf-8?B?cXhodjNPanZESDc5UTBucCt6Q0xhcVBPM0pDNjZ3NE1xUUFlWWtkVDZoTzZ6?=
 =?utf-8?B?Z2thZHFOcHhBS0wxTy9xbDlqN25ZVVQ0MmF1d3MzY3NWbkdyOXNjVkhDWFlF?=
 =?utf-8?B?eDVJU3I4ZjNuZkdCU3hlemhTNmU4VlNjKzBtSlY5Q2lKdFhmbFp5emNUTWxK?=
 =?utf-8?Q?rLCDgnJw0YU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(80162021)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZERiTGtyUHQ5ZWZFNDdJc1pkcng1M3ZQUTJsTWJsKzhpNHVnc1l5eC80UFpQ?=
 =?utf-8?B?NmE5VHZtYmtyZ1ZpbTZuejhGU0ZBRmpEeG4xU25WWGNnZTVhaGh5b2FEeWRa?=
 =?utf-8?B?eVRjcmQ1TmR4K2oyVUxzWFJMMGVHQURHQkRyUkUrcHl4LzBDalhnVUJyTjJJ?=
 =?utf-8?B?ZVVJMnZPM1FRMzI2OTU1SFlhK3hZZXUyTlJoaGFETTlzcjNpQU9TNlpYMkQr?=
 =?utf-8?B?UUFXZHJOYmJMRXF1WVdaMzczMTl0cE83eXZhSk9sR3NHN0FtYnc0WHgyUnRR?=
 =?utf-8?B?YVJpZzNMT3pRLzNVdzRrbi9EVENjbXNWSmFCa3FyY3dOM0dxT0pVVGtMYVYx?=
 =?utf-8?B?NFB4dzdvNFNpeVUvbVQ3S2FBS1k3QzVTZXdzdUd4Nlo2S2VYUFlSYXlXdkUw?=
 =?utf-8?B?aEVKcmJ3ZVVsUC8vRHNBSTlkMklCTDd6VEhvSUh2QmYxY1lUNy9ScGpHS2Yy?=
 =?utf-8?B?MTN2d0JiOTlkT002R0RHSkdiMDM2TWF4VjFkUHBMVVhnNzhaNFJ5cW9NOEU2?=
 =?utf-8?B?MVcvQUxWZit0SzdXV0pNMlRiRmpVZGgyL0RhZXprWkY3RFRubXBCNndQYUx3?=
 =?utf-8?B?bm5Nc0VaWHhSRHM0Z3N6WDM0UUxBalRoaWM1Lzk2aUYwaUs5T0VNdWNkOUp3?=
 =?utf-8?B?TmJmTVBjUit0M3lFMDRuQXdHWVo3Tkg4emVFZ1NCMUxOT0tpMkRPNzRYamhz?=
 =?utf-8?B?MmdRMG4zeHQzd3QyeGlnNlhiR0VYWE13MUVLTjBUSmpEdzUyN213L2VyVzhD?=
 =?utf-8?B?MGNFeDNpbFY5NlNtQUxCN084WmpoSlgrMFp5WU1aSEh1d0dvSE1vSDFIVnB3?=
 =?utf-8?B?aDJIS2ZycjY3RVZvMWI4RFBjay9xQ3BRZ29JN1pUUWNYWVY5ckZYWHowMldt?=
 =?utf-8?B?VTZkdVYxYzY3RGRJcHVHS005SnZXTG9YL2FURHJGUTdway85S0d6QzlCelRI?=
 =?utf-8?B?SC94MGFRdUFLOWxGcElacU9yWVBGbEJvNk9FYnMxZWV4U1h3WmZwd29iZ0F5?=
 =?utf-8?B?WjROcmpJV2lyWjZKTUVaeHJ3NnNkYkVLdFJ4MVRwLzV5VHp3MXJTS0hCRGRt?=
 =?utf-8?B?RnhDTmNEMmZKdnF2dmtZMit1YzFkZEZ1VnZWUWYvVnI5RW9hcE5lMkhLTFRH?=
 =?utf-8?B?YTU0a09yQk85Z3V0dWV3YUlHa1QrNW9PU1NkRXZ4R3M3bFRjRGRjYzBZMXI2?=
 =?utf-8?B?MEQvUy80Ni9kWG5Nb3lpYy9MQm5TVGxQdk5yOVpudVBwcUtvRHR3MVBqNkJJ?=
 =?utf-8?B?VG1PekZXZHpha2E5Vk1WeTR0KzBHUno4MzZUZ2dIc0YrYVhRallmNnVCNGlK?=
 =?utf-8?B?ODJUQXdaT2ticUNhS203NUJCSkIvNVI5c0JwQStPTEFPd2NhcVJUT09TTDNK?=
 =?utf-8?B?N2pIYkZDU0wzbzYwUnVQcFhQVmFyZFFiamZyYkZMZVZMbTU0eERnRWt0Z3pi?=
 =?utf-8?B?dnE3cFAxNW5lU2M0Q0hRdkNTQ1Q1WFFBUWJ1Y3doazRJRnR4eDFtOTNBdUhK?=
 =?utf-8?B?c3dDamJDMDEwM21sWlJtRFlWM1c5c0FRZ1YySitIU3Zld0pyUHhDbnZYV2xF?=
 =?utf-8?B?Y1lGYi9qRUw4b3RvalJOT2xJZGE4UzNwMHcwZUY0RFNjbHZMMGsvZ09Rb09T?=
 =?utf-8?B?blJJb2wxUU9CZkRiWHdyRkllT0JNUmdxQnBHRDM4UzkyU1Q0TDhhR1pQSm9y?=
 =?utf-8?B?Y0RyK1dFSk9pM0kwazFGK0lhcU1DYVdpTWg4M3R5WnpzRFJoWStVZTVCNHox?=
 =?utf-8?B?MmdVeVBuSFpOQzQxUU85YnFzamJSOUlMdEhlOE5rUTVndGhibkI0OXh5cWpn?=
 =?utf-8?B?blRpdk9saVFWSWZ1Y3pGYitKUTdlaHFid0VMS3V6YjBldXMwWjdWdjRRcDlC?=
 =?utf-8?B?K0FVMEg0QTJXTDV3bkNhSGlVK3dlQVMxeldydzhyajl5UDQvSW1pcytBRzJY?=
 =?utf-8?B?cHNIUWhQMkJmbzVvMWFVVm5ucXNrdDhQb1lkM1FNWHJXTDRkSXdPVGprdXlY?=
 =?utf-8?B?RHUwdXEzMHdLVlFVY2NwcVBVUXdtUTBnOHNjd1hIYjFBZnlPRmRscFRGWkc2?=
 =?utf-8?B?VW9Rcy9DRHRGdnFGN0hxQmZZVkF3OVVQVWl2aGR5d0ZDbGpyU3hETVBCdnJo?=
 =?utf-8?Q?9VGtv5Xw7Y5ctue8/jYxImzo6?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed1f176-e934-41ca-e7ec-08dcdd38bb43
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 08:04:51.3839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDwGdZwP2/Ci+8QNKJE1r1CyOhQjv4+2gfE/1z3+ReZ7C+M9x5T6yprRvAUD97m/IGSHdHeezOtd1klKyj1jxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR14MB7109

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing
parameter for High Speed Mode") hs_hcnt and hs_hcnt are computed based on
fixed tHIGH = 160 and tLOW = 320. However, this fixed values only applies
to the set of conditions of IC_CAP_LOADING = 400pF and
IC_FREQ_OPTIMIZATION = 1. Outside of this conditions set, if this fixed
values are still used, the calculated HCNT and LCNT will make the SCL
frequency unabled to reach 3.4 MHz.

If hs_hcnt and hs_lcnt are calculated based on fixed tHIGH = 160 and
tLOW = 320, SCL frequency may not reach 3.4 MHz when IC_CAP_LOADING is not
400pF or IC_FREQ_OPTIMIZATION is not 1.

Section 3.15.4.5 in DesignWare DW_apb_i2c Databook v2.03 says when
IC_CLK_FREQ_OPTIMIZATION = 0,

    MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
		     = 120 ns for 3,4 Mbps, bus loading = 400pF
    MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
		    = 320 ns for 3.4 Mbps, bus loading = 400pF

and section 3.15.4.6 says when IC_CLK_FREQ_OPTIMIZATION = 1,

    MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
		     = 160 ns for 3.4 Mbps, bus loading = 400pF
    MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
		    = 320 ns for 3.4 Mbps, bus loading = 400pF

In order to calculate more accurate hs_hcnt and hs_lcnt, two hardware
parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
considered together.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 drivers/i2c/busses/i2c-designware-common.c  | 16 ++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |  8 +++++++
 drivers/i2c/busses/i2c-designware-master.c  | 24 +++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-platdrv.c |  2 ++
 4 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..f0a7d0ce6fd6 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -332,6 +332,22 @@ void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
 
+void i2c_dw_parse_of(struct dw_i2c_dev *dev)
+{
+	int ret;
+
+	ret = device_property_read_u32(dev->dev, "bus-loading",
+				       &dev->bus_loading);
+	if (ret || dev->bus_loading < 400)
+		dev->bus_loading = 100;
+	else
+		dev->bus_loading = 400;
+
+	dev->clk_freq_optimized =
+		device_property_read_bool(dev->dev, "clk-freq-optimized");
+
+}
+
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
 	/*
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index e9606c00b8d1..064ba3426499 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -242,6 +242,11 @@ struct reset_control;
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
  * @rinfo: I²C GPIO recovery information
+ * @bus_loading: for high speed mode, the bus loading affects the high and low
+ *	pulse width of SCL
+ * @clk_freq_optimized: indicate whether the system clock frequency is reduced
+ *	by reducing the internal latency required to generate the high period
+ *	and low period of the SCL line
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -300,6 +305,8 @@ struct dw_i2c_dev {
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
 	struct i2c_bus_recovery_info rinfo;
+	u32			bus_loading;
+	bool			clk_freq_optimized;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
@@ -329,6 +336,7 @@ struct i2c_dw_semaphore_callbacks {
 };
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
+void i2c_dw_parse_of(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7e56002809a..7b187f68394e 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -140,16 +140,36 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 			dev->hs_hcnt = 0;
 			dev->hs_lcnt = 0;
 		} else if (!dev->hs_hcnt || !dev->hs_lcnt) {
+			u32 t_high, t_low;
+
+			if (dev->clk_freq_optimized) {
+				if (dev->bus_loading == 400) {
+					t_high = 160;
+					t_low = 320;
+				} else {
+					t_high = 60;
+					t_low = 120;
+				}
+			} else {
+				if (dev->bus_loading == 400) {
+					t_high = 120;
+					t_low = 320;
+				} else {
+					t_high = 60;
+					t_low = 160;
+				}
+			}
+
 			ic_clk = i2c_dw_clk_rate(dev);
 			dev->hs_hcnt =
 				i2c_dw_scl_hcnt(ic_clk,
-						160,	/* tHIGH = 160 ns */
+						t_high,
 						sda_falling_time,
 						0,	/* DW default */
 						0);	/* No offset */
 			dev->hs_lcnt =
 				i2c_dw_scl_lcnt(ic_clk,
-						320,	/* tLOW = 320 ns */
+						t_low,
 						scl_falling_time,
 						0);	/* No offset */
 		}
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index df3dc1e8093e..9fdcf1068a70 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -307,6 +307,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	reset_control_deassert(dev->rst);
 
+	i2c_dw_parse_of(dev);
+
 	t = &dev->timings;
 	i2c_parse_fw_timings(&pdev->dev, t, false);
 
-- 
2.43.0


