Return-Path: <linux-i2c+bounces-4733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED4929459
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 17:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B53282240
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 15:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD02136658;
	Sat,  6 Jul 2024 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b="PS8ZoSdw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023101.outbound.protection.outlook.com [52.101.67.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E311386BF;
	Sat,  6 Jul 2024 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720278491; cv=fail; b=WPsDd2Nn+vZ8MzWl9OSHzt57xYKYwR+e9EtkAUSa4IFJwAQ7cwbMgm/fYdp7NpoJsOcw05tggUZfTBp2Nvpt7D9VE9tyPqVSbiz1azbsT6TPi8vHqePEBH55h20i7yMf7zZmBuJQ9isWavM61jKjM948GqON1QE1QAWjeMkj/IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720278491; c=relaxed/simple;
	bh=5sZMzLDQXVhm+nrLMgC/9IwyCfsOFg7o6zvtB+Yv5v8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZFUY2/fDeL79YGUQvmsFQP/Ktt3uwyY6yHocgYFhjG7hntrekHKohMo69TE99tHljRdJ4F199d2QssiPdgUFvYRyRYaJAqP4JiOn/RPxpCr+J4RpBsfZuTSCwflsV1mU+Wlgx7CWb8AKhGpqZBcg1ySJCdvucaNp5w8jt4aBXxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu; spf=pass smtp.mailfrom=sch.bme.hu; dkim=pass (1024-bit key) header.d=sch.bme.hu header.i=@sch.bme.hu header.b=PS8ZoSdw; arc=fail smtp.client-ip=52.101.67.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sch.bme.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sch.bme.hu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiGc4ln7B5ukBxotZtg+cImeEx5fte6mR8pU+Tm1ABvoe+WY5HcQCGA6j4tWZDQDGvzpdBMwxKIh9uIN1JyLq1dFH8DS8IGFhF8WsgzYYpQrvmxKQ2dk9aIrsh9wabkd8Z9jR4gRDExIz54ehMusXoT5m7H7Sma+CPdSy75Zhjd+bQJqXlkLWg63Z4WQCM8g7AkgHva3rq71ZXO9NICuHztdWdy48j9fh4lv91VmK4zC2+ZfX1xP5M03Lp501qX65eQfev7lbQfOJFwcidnO+Ifj8bXmDgejlRrvkaaTr0YWl1bpvgZBHRkxDzE3zpqGDqyvbp07rROXLPnhM0f2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtVkPqCrloqWVPJYnh4auKdX0FwZwbRduhYgfyYA/Hw=;
 b=Zxxf+Lex7fyhbSrvrQ7F11m8qHlL/+GHu2uKbZddziBNvq2pvI3QbpUt5f5yZJpziFs56QP152KitHpQtM6WGTG7axsJo4lOq18UiHcOTxljtntGjqKAQcmEWSWUTl2ON2Hri7ZHlLo0eU2FRFoH1fsX1K8yupvecjpFHNHaDzhmJ2Zq2Ng1AQOHmWletRYaredi/lcPgCm+kQ6bkhrKT1e28Ob4F+QEsN5AnnOizrjuTjReWCtlPw5C2DTBm0V/YQPVN/24RRnJzgpP5Be2PS3KtzmkwT9uOAtONuI58HwD/JQqCu0DKJgGoqVIK6Bs47TzE6v91kNWyblWAAhwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sch.bme.hu; dmarc=pass action=none header.from=sch.bme.hu;
 dkim=pass header.d=sch.bme.hu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sch.bme.hu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtVkPqCrloqWVPJYnh4auKdX0FwZwbRduhYgfyYA/Hw=;
 b=PS8ZoSdwMTN17eG4xGpgJXHM2zCMDlWLOKURo55PD9Rb7xx/2y27+UJSyvi/jsCwEIbN8nPwxxMLC8ldwUm8o6NdyAnYHV6kz58TKTRsJ5/wEfE4B6n193z3VI7WAxYLh/FFS61x06b+EfTS3HITIbwD685IiLmsWXsL0tDIntA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sch.bme.hu;
Received: from AM6PR0402MB3416.eurprd04.prod.outlook.com (2603:10a6:209:6::21)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Sat, 6 Jul
 2024 15:08:03 +0000
Received: from AM6PR0402MB3416.eurprd04.prod.outlook.com
 ([fe80::4fe0:b908:2878:6d88]) by AM6PR0402MB3416.eurprd04.prod.outlook.com
 ([fe80::4fe0:b908:2878:6d88%6]) with mapi id 15.20.7719.029; Sat, 6 Jul 2024
 15:08:03 +0000
Message-ID: <188d9071-01f5-4e81-9427-5b8397864211@sch.bme.hu>
Date: Sat, 6 Jul 2024 17:07:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/60] i2c: cp2615: reword according to newest
 specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>
In-Reply-To: <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0297.eurprd07.prod.outlook.com
 (2603:10a6:800:130::25) To AM6PR0402MB3416.eurprd04.prod.outlook.com
 (2603:10a6:209:6::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3416:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 783de498-3d4d-47d8-58df-08dc9dcd6eb8
X-LD-Processed: 79f0ae63-ef51-49f5-9f51-78a3346e1507,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|41320700013|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVhjN3gxdVlSanlqTXQ1aDMwUU80UmRFUEhOd1lTY2lSRTJVUlN0cGlNZlhv?=
 =?utf-8?B?ODNMdnBHbVVkZk14TDY0TTFXZ2hucWdlemZWdWN4Nkt5eW9VVTJHM0ZBQzZM?=
 =?utf-8?B?VTMwd3dmSkJqWEoraDBhUGh6TWJSUXJiYjlyeVFnNnNZaXpjWG1jSG5GS2hM?=
 =?utf-8?B?TVg0bzhxa2xTV0Uwb1cxRVBqVXl1K1FNY3dmYkRtejJEWGcwbVhlaVRKVzJ6?=
 =?utf-8?B?cVdNR0p0RVREekh5NS84aWt1bUpjT3FjZkNPbHJMbzZwbUNrK2NUOU56cjFy?=
 =?utf-8?B?OG1seWFIenlYcGhIY05FQ3p1MTdBckhjZ2szTzB1S3hEd0c0NVBINEFGclAw?=
 =?utf-8?B?R2VHdjYvUmIwR1RudlRBblp2WGJsdThaQWFzVittbFc1bGV6OTNRZjFrYWJv?=
 =?utf-8?B?a1BnQzVmN1NPV2tETDdzTUtHRnZZMnRuakRJN2hNNFl1SVpYY216TnorRWxl?=
 =?utf-8?B?eEw3OW5yb3FOSXpCckFZcUF2YkFKallmTWZaYklDVjk3SGlwMXB5b1padzIw?=
 =?utf-8?B?U1JwSjBUbnZYV1NOdnAxNmtwTzJJWHpFMURGa3lnMGtiVi90MGVDUTNpWnlD?=
 =?utf-8?B?aFRpUUtrR2RERTNiellvZUlVM2k4aVE1aTJQR3lteXlKeFNhVElwT1hZVFN2?=
 =?utf-8?B?eUsvRG1Nb3hGWlpaYmoybWlYQWQyeU5RWWVsRTI5MzZibnVWUWdGR2thVGxp?=
 =?utf-8?B?VFEwTXNKTkVZeVRqbEQ3cUlybzdiTDhVN05UU3J0ZFMyVm1tNkdicUdaVzNK?=
 =?utf-8?B?NEdBbmpPa1RQdWMrUzlma3l2blJjN3FGY3BuQWRvMHNDcFNkNW1jNzhjQ01Z?=
 =?utf-8?B?T09GVERQMnFMZTh2blloQzRpQk1ub3pDU1MwREdPRnNUVi85STUwTFF1RGNM?=
 =?utf-8?B?RlVhYVFJbmxxUkszOVhOZUt1VS9aUkRvZUcrb2lNYXoxTEQ0RXBsQUxSdDJo?=
 =?utf-8?B?RC9NcXJYWTV3RTVnSkJ3eWF0Si82SEpnVmJ0VU5IUWVJd1luTFpGciszUWZS?=
 =?utf-8?B?UGQ0YzAzWTBteWdBWWMrTVZpNzN3WWV0elFkbWZjaFdjWUFNNE05MkorKzNi?=
 =?utf-8?B?YmFtUGUxL1NlN2QvMThvQzRYVWpENlA0SHhQQkRMbnUrVmJZZWs5R0tSb0R0?=
 =?utf-8?B?NDQrTnFCdVRzUFhTcmdReUFJMUFJMUlNZzI3am5ydElocWJYZUcyOHROT3Fz?=
 =?utf-8?B?NE1DR09vVTF6L1EzaVNIMElobEZlTSt4R284SHpoTVg5SkZLSm5CRHJwRTlD?=
 =?utf-8?B?VWdpNmt4ekl2bkxWcTI5WFNhUTlpbW5QMUtzMFJpc09uZ2c5ZEJlK29lbE5T?=
 =?utf-8?B?dGY5bE5nS2dYL3ZwQUpUWlNnVllCbU4vVU9zZE5QYklQZlNwcFN2eWRCNnhP?=
 =?utf-8?B?M0xXYVdHVE1MV1dHMngxS2tQa1A2anBDREtwRDlJaERsLy9nYkNXKzczRmhy?=
 =?utf-8?B?WjBWbFJMNEpnMk5WV3NIdCtGU0ZxTmhxaVJmcklHN1ZmQ3h6cWVyVEVmcFc2?=
 =?utf-8?B?ODhDRW1rc1VKZUltQXRMNkU3a01lYzU1QUhqM3ZuMU5XSVYycElCQXhCcTNP?=
 =?utf-8?B?aE5heWxBbW10Wk5obU5HLzdIR2VwU2tUOHpWb25jV1hCSHFIZFBKL3pYNStt?=
 =?utf-8?B?elJTaXoySmhjcHJNaEdHeStTUzd3SUFqVTNOaUd3MlVjUVhxY2l1NFpMSk1T?=
 =?utf-8?B?SzU2VVRTaFR3dGxoc2hEenNoMnpKTXBkcjMyNWdlSGVINkdvenR3dnVvbTZM?=
 =?utf-8?B?d3BmK3lreUJjdU81TWlxNlZqc2tjdkJXV1B6aVR6S3NtK0ttVThmUlYva2hY?=
 =?utf-8?B?eWo5NUZsMk1wTDRtdXVnZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3416.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(41320700013)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGVndktDRUEwazFCS1VGc3BlbmF6ZFVZbG8zSnhwWXpJOHpta1NUb1BXOTFj?=
 =?utf-8?B?RnpwMkREbmd5bkE4VGxoTlU1bjBuZ3hpdDJaR05melV0VWZJWGd6ZWJXbzlE?=
 =?utf-8?B?cFVyaEdwdHZ5MzZhMWgyQ3cwQThuQy9weTg1ZXRqNjVJM3JBeU0wVkJvZEkv?=
 =?utf-8?B?ZWppdGRkbDZ3VFNQZHZSYnJ6bTgreDgxOUtHSU9EbmVrWUVFdzc2WEQ5OTZ6?=
 =?utf-8?B?WnFneVpyaHhwMlZVTjNwWmNOUUdWQUdPcUhiQkl3Yklxam0rdzVybHFFdnRs?=
 =?utf-8?B?NlhmOVZEb0xNMjdDT2xWYVBhcVo0SjhQeVp1UGdWNCtINzNmVGRvOUZVREh3?=
 =?utf-8?B?c3FDN1pQL2ZjVkhQaUNjeWh4dGxDOU5lMkttamJYOXJwYWlONUN0OWI1bVI4?=
 =?utf-8?B?UFlxMDNxQytzcGZpMjlIZUFhc3ZqNzZadkpqdFRPRjJKRXFrK2gzT1hGZDBS?=
 =?utf-8?B?MXpoZ0pmeFJTM3YvZGUzZ0hDRXB4MkpFRFUzUCttd05jQktFWWRjc3RWcVlV?=
 =?utf-8?B?MTVoaWtWTU43LzZXWkFqUmpuTGhKejBmSzhrTnJ6OXFKbStVRXdqMmpManZk?=
 =?utf-8?B?UXZaT2ZMdEdJMzg5dEhqREJKWTBvcnNDZThxbzJyaVF3YlpwSXB2Sm53VHB2?=
 =?utf-8?B?UGJKUFlyOUdobWluMERpbDU5bTcwN2huMEJGZ0o4TzVGUUQ4YzVYR29odWhp?=
 =?utf-8?B?ZWlxUHRlK0wxNkN2NGRSZmhXNHUrb25JaTErVkpWb3JXSGgrVE8vOXpsWUdY?=
 =?utf-8?B?bUFJRGlMb3pEbVdWd0hzWlhJNjFXd3JTMGtmMkVTV3hyQjdxeG1ieU5nNEZI?=
 =?utf-8?B?Q21EZlhDRzJMeEFpRld6azlYQmh3VmhhSkhUVk42d080eFBSenJvVjZPTU9P?=
 =?utf-8?B?Y1dNL0hkd1RLU1hJa2pkTGdWSExGVlZLZkFjMXZMeGd0dWZwL3l0djZBOFFQ?=
 =?utf-8?B?YnJlQ0JkTzcxZ0MydHF4c3Q4SEdHaGVvRGp2dmFwODhhWjBxc1FrRG41TmJT?=
 =?utf-8?B?QkFBbGkyYXl6Y0JXWU1uVlUwVVh4NlhlUnhJVHBzLzlIZGUwUWJjUUVnUTlB?=
 =?utf-8?B?eWY4YVFFQUZNajk4M2JMaU5UOFNWZTRHTmRHQWJ4dVVYRktqb0dzbWtkVmdy?=
 =?utf-8?B?WGF5Z2tROEJ0cit3NThBODl5ZXVvNXRKUXhqMDRpSnU3dUNhbGFMRGFiOS90?=
 =?utf-8?B?NFZKU1QvQXdLbEdtN1VxY0tzMlltODZoN0xmempJSmhsWklIb01ybFhHMnc0?=
 =?utf-8?B?MHlFOTI4UWt1VDF5ak85dGcxcGN1S1VaYnlkeDFNbmNPbGVLV0dwSlJSNUxD?=
 =?utf-8?B?Z0l1cGZsc3FUZVRMcFc3cFRscmRZWGtmbDUycld2elhONjdycDVRRTZLV2Ja?=
 =?utf-8?B?WXRZb2d1MmNId2lud0djbnpxaTE2ZkI1WTlCUEliVGxGZ0tXRGZpeDZJSnN3?=
 =?utf-8?B?K1EwZUYrOTZCTVc4QnQzYWpRNERCb2JYVUhSTlpPWFgyVVJSWE0yYWhqOStX?=
 =?utf-8?B?TmVrbWNCOHdLZC96b2tpTWFsVkg1c0owN2t3aDlaNHp2VGltSWxENTF6MEhx?=
 =?utf-8?B?eWVudGlOOHk0eHc5SHp0TFI4RDFIS1FnTUhCRHhZWmF2UnllTnVnc0l0UXRR?=
 =?utf-8?B?MG55NzROQ3NxQ0l1V3EwMmtyL0UzYy9ZQUh0dFBsaVRSUitLUGhjOUR1RVJG?=
 =?utf-8?B?Z3Jtc0FXYVpwR3lEeHZZU0VYSktpN0t5WENTcERRRlZkaVN2SVVJdEt2SlZV?=
 =?utf-8?B?dENPSjV2aEhodHdKOFVHayt0T1ZkM1ViUmM3d2dWOFFuV1ZGMGxBVDgxOS9z?=
 =?utf-8?B?aXczLzZtdld5WmIzK29ScXd4bGtXUjNNNjNaR0xlNXNpck5qSnFIQmpDMTZ4?=
 =?utf-8?B?dXlESnVOSExuMDljSjRndEZwS0tsSEVoTUNLMDlqeTB1Rzk0bmFOUDIyckg1?=
 =?utf-8?B?SUVibmR6dnJ2M0FYOTFuRXhHZGhHL29CclR1c204N3lLUjgweTJTVDFuK0t1?=
 =?utf-8?B?ZllJK0kydkZXZUY4N016SW5YZytHNXN5YW1jdm0vczRNNFVsbnBBbnVzSWdh?=
 =?utf-8?B?aU9zSXBHQ3B6Tyt1Wmh4aFkzRCtpK3QxaUtRRCs4MTZHN0ovd0tjRHFSeUU5?=
 =?utf-8?Q?HYEXEkTfpcGjaAz5FsYKiEZNV?=
X-OriginatorOrg: sch.bme.hu
X-MS-Exchange-CrossTenant-Network-Message-Id: 783de498-3d4d-47d8-58df-08dc9dcd6eb8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3416.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2024 15:08:03.5235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 79f0ae63-ef51-49f5-9f51-78a3346e1507
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtEW0NEEXKR1k/+2XG9XHC3ccpGnkQiaPRL1FdAn0UvAkxDRUluj8q1HZV0iOoaTCsVza4KILUWTxO3tA2YsJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207

Hi!

On 2024. 07. 06. 13:20, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-cp2615.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
> index cf3747d87034..315a37155401 100644
> --- a/drivers/i2c/busses/i2c-cp2615.c
> +++ b/drivers/i2c/busses/i2c-cp2615.c
> @@ -60,7 +60,7 @@ enum cp2615_i2c_status {
>   	CP2615_CFG_LOCKED = -6,
>   	/* read_len or write_len out of range */
>   	CP2615_INVALID_PARAM = -4,
> -	/* I2C slave did not ACK in time */
> +	/* I2C target did not ACK in time */
>   	CP2615_TIMEOUT,
>   	/* I2C bus busy */
>   	CP2615_BUS_BUSY,

The diff is cut short, but here would be the comment for the next enum 
element, CP2615_BUS_ERROR, which reads:
 > /* I2C bus error (ie. device NAK'd the request) */
If you're going for consistency, you might want to edit that as well.

> @@ -211,7 +211,7 @@ static int cp2615_check_iop(struct usb_interface *usbif)
>   }
>   
>   static int
> -cp2615_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +cp2615_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>   {
>   	struct usb_interface *usbif = adap->algo_data;
>   	int i = 0, ret = 0;
> @@ -250,8 +250,8 @@ cp2615_i2c_func(struct i2c_adapter *adap)
>   }
>   
>   static const struct i2c_algorithm cp2615_i2c_algo = {
> -	.master_xfer	= cp2615_i2c_master_xfer,
> -	.functionality	= cp2615_i2c_func,
> +	.xfer = cp2615_i2c_xfer,
> +	.functionality = cp2615_i2c_func,
>   };
>   
>   /*

I don't understand the need for the whitespace changes.

Anyways, these are just minor things I could live with.

Reviewed-by: Bence Csókás <bence98@sch.bme.hu>

Bence

