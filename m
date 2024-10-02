Return-Path: <linux-i2c+bounces-7173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A597598D056
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02E86B23190
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 09:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4F01CBE9E;
	Wed,  2 Oct 2024 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="qYk9Tt/Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2106.outbound.protection.outlook.com [40.107.94.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7F984A52;
	Wed,  2 Oct 2024 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861813; cv=fail; b=gzYtuXcvLJiRLvrf+BhqnnYEMWP37FO9eIP0N32f/Jy+98oBS4dpEjk4QpCx5G7f+1o/JGW+JgBTnhvUrROaJHKQbqoqueVWxrrF5baH3N98Z9xBflOQnT7Icgd5mWUudrakdLKNpgVSCfpraTfengT78K3l1j4hPDIbM+hCFp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861813; c=relaxed/simple;
	bh=mdFftbd1aiYjOXq31tQaC8CvxUXY+g7rZWnclgfIqII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dRHcU0kXeIaVGoUMkzS70dHJCO0oJ6tlIF20qaH/lBqCucV5bjwQJvJ4+Sz+RrRP3bX8DcQaEmoeegcrKO5jP4WGsWckTu9K1sSxXGIRwm1MtBGf/rX1tlcS0M8aVn/EGfrAzHHSZzja0OpB7gOBckJGvwCZQ5DDAT62rh83GlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=qYk9Tt/Z; arc=fail smtp.client-ip=40.107.94.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xf9HKpwBMWshyBX5Ggr4ZZG4TL9115PUEzZCUE2LKcm17Y2XEKph75IrpgrbU3PKLKON2t4Msm3NSPI0iLeVKKZMs8CU82hK20txBVCyzAqs0a+MT/ywKVm/qv79YObfmwQW+0eq8ryTXh6ozzb0xpxVPLgsBcWy50rQG99oR9sNOm+bvxo9OYdm/Fbqg3YeuUXbaKMCPI3d0AY2VfVjObJmc7jwMcvva04kegIAaapciqRAZXjOSJimiHz3tCAbDp12Z60nyozj/KMpO88vkAtu7unOhLwnhhDhCMLSzHdsswWwL2o8C4oFDrsQR2VqqcUJvBQ5hmYaLxgkhbEmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdFftbd1aiYjOXq31tQaC8CvxUXY+g7rZWnclgfIqII=;
 b=PgpBai0dqNSN4yuxOyYHgOYZYyo6ufG2bYDHF2L+GFW6fwPK6hxYxQPn7XwsvT3WWMQBEVQ4hkJNmGLoOzoaFD0ixtFNElQSe96tNVYa9xI0iFCdkUo5j1GMeDO9pJ0kUdGe8GtAyGlxJ7TESK1M39jJD/SJVkSvIt+aAzuftlis2+55MSjGMpmqdQZgjHuGXPqMW8bMkm4DiH8xKH2jIKnsEGaSYIwm6fihZUDhKcoVMvr7m7Wc1xUe64Zmm8pU/7OaeY79Vm387W7pHMfD+xRwpwnw8CDoP7aQSk79PtpMADC0fLoDmVrGeDGE6UlmGCd6j49SpUY30oyGPvwqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdFftbd1aiYjOXq31tQaC8CvxUXY+g7rZWnclgfIqII=;
 b=qYk9Tt/Zd7TSZ36AngQ5xrzTfYlbq0gwJTR0s9Hql/z1mjlSk0cLewqKU/BAJertw3cmFx8rt3npH+e8NDKLPFkCF4cJwjgLU9viN0ikCqgnrO7jkqRGw77tj/11Fz3Zkkj7NzHWXfEbBqLUxJWUEVFVOJTzFnQzOFYIIA3dA5I=
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by CH2PR14MB3722.namprd14.prod.outlook.com (2603:10b6:610:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 09:36:50 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 09:36:50 +0000
From: Michael Wu <Michael.Wu@kneron.us>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, morgan chang
	<morgan.chang@kneron.us>, "mvp.kutali@gmail.com" <mvp.kutali@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare bus
 capacitance and clk freq optimized
Thread-Topic: [PATCH v3 1/2] dt-bindings: i2c: snps,designware-i2c: declare
 bus capacitance and clk freq optimized
Thread-Index: AQHbE9wxXfKM7AAKiEqktckGg1ftXLJy+1cAgAAiTyA=
Date: Wed, 2 Oct 2024 09:36:50 +0000
Message-ID:
 <IA1PR14MB62245E8EDD2B4FDCED0711818A702@IA1PR14MB6224.namprd14.prod.outlook.com>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-2-michael.wu@kneron.us>
 <cmm7l2kxu2wl55rmcoi3q43ieejnivi5rvjdy6j3wvj6qahse7@ocgi7nyju4je>
In-Reply-To: <cmm7l2kxu2wl55rmcoi3q43ieejnivi5rvjdy6j3wvj6qahse7@ocgi7nyju4je>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR14MB6224:EE_|CH2PR14MB3722:EE_
x-ms-office365-filtering-correlation-id: 5d7ded94-fae9-441e-9820-08dce2c5bde8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|80162021|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y1lSVHdiNFB0Wkl5bWpDMnMyT3Jpbk13amgvOE5vYTI4L29jL2s0aHdHYW43?=
 =?utf-8?B?TjVEYmlTSnkzenpoald0M09NMkpzM1pPNFZqVzc4YWFIY3pseWJqKzllcmdn?=
 =?utf-8?B?QzZDTEt6bUlvV0dvOE9zL3Q5Ujc3cktydFpNY21YRk5YNjdDSmFGelVPeTJy?=
 =?utf-8?B?bk95K1o0NGVLeHdWYXNxMDI5WDBtSGJWcmZld21LdEtaWG5xM1lzL0REbkJK?=
 =?utf-8?B?NXdJNVdLbkhsYngrSUN4SjJ5NGE0dGRXREFzaWVDaVU5TmhWTHQvUnNablpt?=
 =?utf-8?B?eTFTZWt1STZ5TjlxZ3RZRTl0VDRhcVBtaDRDOHVqYUF1ZVNEVTZUSndDNWQ3?=
 =?utf-8?B?YkF0MHgvVFNhdkFSZVZZajNjdnNiT2cyUndxMlVUL1F0ZVlPQ2ltTjNnanU5?=
 =?utf-8?B?cjkraG4vYzFUeGliRCtHb0tiYytUYjRSME5hYmh5U3JLYStEYkdibjlFazRY?=
 =?utf-8?B?MDNkcklUL0RJeDZwYTVVVXhYYk1xQVkvUTluNFk0VmRkWnRQSXoyVGhPZjMv?=
 =?utf-8?B?MGRCaXUzUmo2SzJreFRwaGVzTmJZTEhBTzlaUXJYKzErYXBYeG43UEpwcm5M?=
 =?utf-8?B?UEd0VmVJMnpDREdnQzhmRk1TYXpZclJ1QkxoQzQ2TklhSGZ3UTRCRDIycVF4?=
 =?utf-8?B?a0l2bHc1VWY1M211NDlYN0ttMlNXdEd4a3M0Q3FVYmdmajI1amJvajVDNG9B?=
 =?utf-8?B?TWZTa2tWRWw3TnY0ZWMwY2taU08wakQzTVlWRUpJdEFiODVMN3Ywd2dMemwx?=
 =?utf-8?B?ZzlFRE5lWVJPYThiaEsxb1luK2RLSUZwbVdIOGJNMzF6azVMVm12TEhsdnBy?=
 =?utf-8?B?SE5xNHcrS1NtaiszYmllcmJuV0EzSkdERWNCWXg3OURnZGpjaG8rZWNqNzg1?=
 =?utf-8?B?UTM1QW5CZlZQNmtnOTJwWXBzZFNDRWlZMzI1OVZ4NGhRU0tEazZ3MGREaG84?=
 =?utf-8?B?a1VBc0RvSHdCV2lGYTVxN1p3UitUTEwzcXhLL1BqQ2M4d2ZxQ29zODAzUmIw?=
 =?utf-8?B?UUVONHcvVnlZMkMzWGhpUkFPOXdOT2Q2QVVDQkRPemNkV29iNTIwQXVJd2lJ?=
 =?utf-8?B?RUpjeTNPOEFmZFVrcW14cjFWdTd3aFpyRkxFZGlKcFNXL05SOUlmMXcrTkxr?=
 =?utf-8?B?Q3lqOVFZRG9aaDBrTmhVYXVRaDdueUJLNkVib2UrZ2pPVHJEV2ZML3ZmSnB0?=
 =?utf-8?B?OXc1QVV0NlpmaWs0RUh0NWE0bUxGd3FmL09GZHNoZnpJYllRWDZnNGEwSTdM?=
 =?utf-8?B?WFFSWXlubkdiZVFlRGJmbnBpZG1HNDVmZlRyYmxUVHVzRDJWeFFEcEl2dGZz?=
 =?utf-8?B?UEpqdlVzUU1sUnFwMG1Sc0kwbHgrVFhhZnc0L1NkRW9GMzFHdFBHb283ampO?=
 =?utf-8?B?akhvbHZtbGYwMy93d0diMHZDNzZDUWJZRFhGWlRoZCs5SWZmN1RCc1MzNDJl?=
 =?utf-8?B?ajFDeUJBSDVWN0dUV0tMdnZ5U1Fyby9GY0lraENOVHRqbE92OFV1alpnK3dO?=
 =?utf-8?B?WGdZMkppcWtXcDFDT0hnMlcvWVQ4VGh5U3haN09zTHRBSDBicVVWZWVxUXVj?=
 =?utf-8?B?Z1FqZkFvbWRNRktid3RiMGZ2c2pRN2x5WEY0NERFSFlTa205anR1eSttODBR?=
 =?utf-8?B?M25CT0V3WitnbTVuaG82T0preFpoQytPbC9ORlpRNXlEK1RuSk1CelZhQVJG?=
 =?utf-8?B?VFZmdEdnOE1oU1p5UWYycnVWTGxyMlBkZWxkWUdDK1YrYmRHclNuNlBlRXBP?=
 =?utf-8?B?U1NITHl1ZmlzVmhZeFRiS3dKZnNlSVp4aldqZE8vbW1Qc2hodWdCbUNOd0t0?=
 =?utf-8?Q?s2vQotrcvG72WUel/z3Y8szhqXT6k7F2/btKc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(80162021)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVhaRGhEZkd5T0NsSzRTL3RwMjZHVGJ3bHBPT1QzN3Z3N1dkbldKd051cnRq?=
 =?utf-8?B?M2R2d1pMUDl3UmJoVytOMHhBMWFVT3pkTGFUY1VianQrd1dKZ1ZGL2ptcVph?=
 =?utf-8?B?NUFqcUo4cFI2NHJoaThPNnkwTEtQYmFJNFd3U2t5b01DQ3NyNU4vei9oaTBk?=
 =?utf-8?B?ajJZeUFzUVVibTZESjd3U2RTR0IyWm01a3lBRnk4aVZhUmpoQUZybk1reHpj?=
 =?utf-8?B?ZzYrcXgzNDBETE9neS80SmJNWVNzRnpUQlNZWVpyUCtrZFZHQlFBdTBFV1Fw?=
 =?utf-8?B?OFNjS3Eyb0FxQzBHakZvSi9mVmJobmZFditMUnYvcVg3WTJDMmsyVnp3cWxp?=
 =?utf-8?B?TVQvVkd6V0hCZ1FIYVRWQUp4V21kTGY5K0RpS3B2VDhydkpnSXQ0NG16MEZm?=
 =?utf-8?B?Y1F6ZS9LdWlmNXFjcUFmNVNhMDBKdGRqeUlJUHJEbkJrajZOT1hvcDNwT25V?=
 =?utf-8?B?NlZtL1MvUVowUWZWRWttOVBLUEVYZlJnWFBYWjIzZ1hmNE5pUUpQdXp2Z3RF?=
 =?utf-8?B?WmUrR0gwYVZIMFlVQ3FBS3BGdS8xWTd3dTcvWk9CWEZ0ZFdESmFYV1dMSldR?=
 =?utf-8?B?djVJL2xoNzdtWFJ4T25yd0E1elU5WjZLUUZHZ2pNaGhKZU8zSGRtOE9wcExo?=
 =?utf-8?B?cWhwVE1Wd0pyMkRVelBkdTB1eVBQSjVienBkY0VFTTRTUG1RUmVLZXFzaWRC?=
 =?utf-8?B?UnNVb0s3SEFRMU80UVIvVDByTmVFSHVkcEhyMnhJNzBpMnFuMUxvVlRkUkx5?=
 =?utf-8?B?VEFaT2luZ0NMUXJSeFEyMDdIZTZ1a3BrUXhyOE9VUnJKT3hWUmQyQlV4YVo5?=
 =?utf-8?B?bFhRUzJ2WEVjWkh4dnQvS1hSMlkzTUJzNE1DTStjOHJSamZpa1lWdHNUTGxj?=
 =?utf-8?B?Uk1xTkZoUEpkMTBLUGZXY3B3NUF1OG81S3JWNkNmTTErS2lrS1VjbWlJY0ZG?=
 =?utf-8?B?Tkl2VXNWNzliOTNsdHJVbndWbGNqUTBMdlE0dDRlNHpSYTJDQjY1elNkcG1t?=
 =?utf-8?B?OWdIZDQ5N1BMMHdMRmgxS1plV2QveGlyandlZnd6dWlJMkx2WFBGQlR5T0d0?=
 =?utf-8?B?NXBQZEFmaXBuTGhuVnNuTzVpaGtMZnVBMGIzVCtYRU1OZmdSMm1wMndqN0VQ?=
 =?utf-8?B?ZWJHVkZjMG54enV0bU8zbzhlMXFwWkJxbWI4bGhoSURhZTdhTWZ1bU9ocWdE?=
 =?utf-8?B?Sytocndab3IxQTBkVnQydCs4Sm9pN1J4c0FrY3B3YWVOWWpqTjNFcFNrRHNW?=
 =?utf-8?B?dU1RMmdBSWxza2dyZ1lEdFExbDVwb3ZIdDZxRmdJeFBPTCszTjJRUVdtcjlG?=
 =?utf-8?B?eEtVcndERXhaUGJtdXRXYVJpZlNzTHFmRmloQzM0dmIzaUJBeDZTMng4YjQ4?=
 =?utf-8?B?OGVOS2EvWE9qakhtZ2t4U3FmZ1JtenFpZzkrbmt3cFdOT3Nlb2hRMDlWUUR5?=
 =?utf-8?B?ZEhyNVhzTEVYeEhwalR0ZVdxNHNiZzZPa2FXaTJ3QlJ6WDhvQ0orTDBTYWNm?=
 =?utf-8?B?RTdEN2N1Q2VnL0Q2cUJPKzg3YlBlbXNJbExycVJ1cXk1OG9tODJqUzZHWjdl?=
 =?utf-8?B?UmdRSVVVbUtES3hPbXIzSDRIcWhtUWNpSWlxNWRvM1lieXl4Z1NTMXNhWVJl?=
 =?utf-8?B?TDFHb0NwN1hubW80andIcy9RSlAwVWorQzZjRk5UMUptS2lFcmduY2pobFZS?=
 =?utf-8?B?NkRud3c1V3Q5UU9JR080MUQ2cVk4WUxubWxYRXViM1RLSXZ3aWNZeXBQTFY0?=
 =?utf-8?B?Q0N2STdYNlh6cFAxZmc2K3BnekU3UEFBTTFZSFFSZUxCeXFxdWN3d0R1WlVE?=
 =?utf-8?B?Mjc2RFp3OFhSUE1RWEJzL0xkbFNqaXhVWWc4TmQwNTZicmc1VWV0TVNaMHFM?=
 =?utf-8?B?S3c3LzhTRU5neU91QUVaazJZVnpFZXFxdmRFUXBHYmRRUlBONHdqZFNrcjZa?=
 =?utf-8?B?dlJCQ1BhZmM1M1l6anF4QXVYdktJdEtnMGE1Z3U5VDVYdld5SUZIeTlqWmty?=
 =?utf-8?B?dzVJNHNOWExDYXRiM3NsNVZxK1Vka29ScitjMm9lYzJIUkYvUXFEeDl4L2NG?=
 =?utf-8?B?MEtieko4SW1PUWxiQVNrbG1zTjdEZ2xMbFNQYXV0Tzhqb002TUMzQlEwZFh2?=
 =?utf-8?Q?gbwE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7ded94-fae9-441e-9820-08dce2c5bde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 09:36:50.2051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFSkiP3VwkRAvaQHzABmFXXasUBt+CTT2Wb6ZXHHWCGuPG16FrkpWGqrMlIUNY13cRCdfjlzKUAt0UTde3kofQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR14MB3722

PiBPbiBUdWUsIE9jdCAwMSwgMjAyNCBhdCAwNDoyOTozM1BNICswODAwLCBNaWNoYWVsIFd1IHdy
b3RlOg0KPiA+IFNpbmNlIHRoZXJlIGFyZSBubyByZWdpc3RlcnMgY29udHJvbGxpbmcgdGhlIGhh
cmR3YXJlIHBhcmFtZXRlcnMNCj4gPiBJQ19DQVBfTE9BRElORyBhbmQgSUNfQ0xLX0ZSRVFfT1BU
SU1JWkFUSU9OLCB0aGVpciB2YWx1ZXMgY2FuIG9ubHkgYmUNCj4gPiBkZWNsYXJlZCBpbiB0aGUg
ZGV2aWNlIHRyZWUuDQo+ID4NCj4gPiBzbnBzLGJ1cy1jYXBhY2l0YW5jZS1wZiBpbmRpY2F0ZXMg
dGhlIGJ1cyBjYXBhY2l0YW5jZSBpbiBwaWNvZmFyYWRzIChwRikuDQo+ID4gSXQgYWZmZWN0cyB0
aGUgaGlnaCBhbmQgbG93IHB1bHNlIHdpZHRoIG9mIFNDTCBsaW5lIGluIGhpZ2ggc3BlZWQgbW9k
ZS4NCj4gPiBUaGUgbGVnYWwgdmFsdWVzIGZvciB0aGlzIHByb3BlcnR5IGFyZSAxMDAgYW5kIDQw
MCBvbmx5LCBhbmQgZGVmYXVsdA0KPiA+IHZhbHVlIGlzIDEwMC4gVGhpcyBwcm9wZXJ0eSBjb3Jy
ZXNwb25kcyB0byBJQ19DQVBfTE9BRElORy4NCj4gPg0KPiA+IHNucHMsY2xrLWZyZXEtb3B0aW1p
emVkIGluZGljYXRlcyB3aGV0aGVyIHRoZSBoYXJkd2FyZSBpbnB1dCBjbG9jaw0KPiA+IGZyZXF1
ZW5jeSBpcyByZWR1Y2VkIGJ5IHJlZHVjaW5nIHRoZSBpbnRlcm5hbCBsYXRlbmN5LiBUaGlzIHBy
b3BlcnR5DQo+ID4gY29ycmVzcG9uZHMgdG8gSUNfQ0xLX0ZSRVFfT1BUSU1JWkFUSU9OLg0KPiA+
DQo+ID4gVGhlIGRyaXZlciBjYW4gY2FsY3VsYXRlIGhzX2hjbnQgYW5kIGhzX2xjbnQgYXBwcm9w
cmlhdGUgZm9yIHRoZSBoYXJkd2FyZQ0KPiA+IGJhc2VkIG9uIHRoZXNlIHR3byBwcm9wZXJ0aWVz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXdSA8bWljaGFlbC53dUBrbmVyb24u
dXM+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9pMmMvc25wcyxkZXNpZ253YXJlLWkyYy55
YW1sICAgICB8IDI0DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3NucHMsZGVzaWdud2FyZS1pMmMueWFtbA0KPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvc25wcyxkZXNpZ253YXJlLWkyYy55
YW1sDQo+ID4gaW5kZXggNjAwMzVhNzg3ZTVjLi5jMzczZjNhY2QzNGIgMTAwNjQ0DQo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9zbnBzLGRlc2lnbndhcmUt
aTJjLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L3NucHMsZGVzaWdud2FyZS1pMmMueWFtbA0KLi4uDQo+ID4gKyAgICAgIFRoaXMgcHJvcGVydHkg
aW5kaWNhdGVzIHRoZSBidXMgY2FwYWNpdGFuY2UgaW4gcGljb2ZhcmFkcyAocEYpLg0KPiA+ICsg
ICAgICBUaGlzIHZhbHVlIGlzIHVzZWQgdG8gY29tcHV0ZSB0aGUgdEhJR0ggYW5kIHRMT1cgcGVy
aW9kcyBmb3IgaGlnaA0KPiBzcGVlZA0KPiA+ICsgICAgICBtb2RlLg0KPiA+ICsgICAgZGVmYXVs
dDogMTAwDQo+IA0KPiBJIGFza2VkIGZvciBzb21lIGNvbnN0cmFpbnRzIGhlcmUuIG1pbi9tYXhp
bXVtLiBJIHRoaW5rIHlvdSBuZXZlcg0KPiByZXBsaWVkIHRvIHRoaXMuDQo+IA0KDQpJbiBJMkMg
RGVzaWduV2FyZSBEYXRhYm9vayB2Mi4wM2EgdGhlIG1hbmRhdG9yeSBvcHRpb24gaXMgcHJvdmlk
ZWQgdG8NCnNlbGVjdCB3aGV0aGVyIHRoZSBidXMgY2FwYWNpdGFuY2UgaXMgNDAwcEYgb3IgMTAw
cEYuIEl0IHByZXNlbnRzIHRoZQ0KZGVzY3JpcHRpb24gbGlrZSB0aGF0Og0KDQogIERlc2NyaXB0
aW9uOg0KICAgIEZvciBoaWdoIHNwZWVkIG1vZGUsIHRoZSBidXMgbG9hZGluZyAocEYpIGFmZmVj
dHMgdGhlIGhpZ2ggYW5kIGxvdw0KICAgIHB1bHNlIHdpZHRoIG9mIFNDTC4NCiAgVmFsdWVzOiAx
MDAsIDQwMA0KICBEZWZhdWx0IFZhbHVlOiAxMDANCiAgUGFyYW1ldGVyIE5hbWU6IElDX0NBUF9M
T0FESU5HDQoNClRoZXJlIGlzIG5vIGZ1cnRoZXIgaW5mb3JtYXRpb24gZGVzY3JpYmluZyB0aGlz
IG9wdGlvbiBleGNlcHQgdG8gdGhlDQpkZWNsYXJhdGlvbiBvZiBsZWdhbCB2YWx1ZXMg4oCL4oCL
YWJvdmUsIGxldCBhbG9uZSBtaW5pbXVtIGFuZCBtYXhpbXVtIGxpbWl0cy4NCkFzIGEgdXNlciBJ
IGRvbid0IHRoaW5rIEkgaGF2ZSB0aGUgcmlnaHQgdG8gZGVmaW5lIGEgdmFsdWUgcmFuZ2UgZm9y
IHRoZQ0KdmVuZG9yLg0KDQpGcm9tIHRoZSBpbmZvcm1hdGlvbiBwcm92aWRlZCBpbiB0aGUgZGF0
YSBzaGVldCwgSSBwcmVmZXIgdG8gbGlzdCB0aGUNCmxlZ2FsIHZhbHVlcyBsaWtlIHRoZSBmb2xs
b3dpbmc6DQoNCiAgZW51bTogWzEwMCwgNDAwXQ0KICBkZWZhdWx0OiAxMDANCg0K4oCL4oCLaW5z
dGVhZCBvZiBkZWNsYXJpbmcgaXRzIHJhbmdlLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KSW4gcGF0
Y2hlcyB2MiBJIHVzZWQgaWYgKGRldi0+YnVzX2NhcGFjaXRhbmNlX3BmID09IDQwMCkgey4uLiB9
IGVsc2Ugey4uLn0NCmFuZCBvdGhlciBzdGF0ZW1lbnRzIGluIHRoZSBkcml2ZXIgY29kZSB0byBp
bmRpY2F0ZSB0aGF0IHRoZSBjYXBhY2l0YW5jZQ0KY2FuIG9ubHkgYmUgNDAwcGYgb3Igbm90LiBN
YXliZSB0aGlzIGlzIGEgbWV0YXBob3IuIEknbSBzb3JyeSB0aGF0IEkNCndhc24ndCBtb3JlIGV4
cGxpY2l0IGFib3V0IHRoZSBjb25zdHJhaW50cy4NCg0KPiA+ICsNCj4gPiArICBzbnBzLGNsay1m
cmVxLW9wdGltaXplZDoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiA+DQo+ID4gKyAgICAgIFRoaXMg
cHJvcGVydHkgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIGhhcmR3YXJlIGlucHV0IGNsb2NrIGZyZXF1
ZW5jeQ0KPiBpcw0KPiA+ICsgICAgICByZWR1Y2VkIGJ5IHJlZHVjaW5nIHRoZSBpbnRlcm5hbCBs
YXRlbmN5LiBUaGlzIHZhbHVlIGlzIHVzZWQgdG8NCj4gY29tcHV0ZQ0KPiA+ICsgICAgICB0aGUg
dEhJR0ggYW5kIHRMT1cgcGVyaW9kcyBmb3IgaGlnaCBzcGVlZCBtb2RlLg0KPiA+ICsgICAgdHlw
ZTogYm9vbGVhbg0KPiA+ICsNCj4gPiAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+
DQo+ID4gIHJlcXVpcmVkOg0KPiA+IEBAIC0xNDYsNCArMTYxLDEzIEBAIGV4YW1wbGVzOg0KPiA+
ICAgICAgICBpbnRlcnJ1cHRzID0gPDg+Ow0KPiA+ICAgICAgICBjbG9ja3MgPSA8JmFoYl9jbGs+
Ow0KPiA+ICAgICAgfTsNCj4gPiArICAtIHwNCj4gPiArICAgIGkyY0BjNTAwMDAwMCB7DQo+ID4g
KyAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkZXNpZ253YXJlLWkyYyI7DQo+IA0KPiBFeHRlbmQg
RVhJU1RJTkcgZXhhbXBsZS4gTm90IGFkZCBuZXcgZXhhbXBsZS4NCg0KU2hvdWxkIEkgaW5zZXJ0
IHRoZXNlIHR3byBwcm9wZXJ0aWVzIGludG8gb25lIG9yIGFsbCBleGlzdGluZyBleGFtcGxlcz8N
Cg0KVGhhbmtzICYgUmVnYXJkcw0KTWljaGFlbA0KDQo=

