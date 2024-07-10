Return-Path: <linux-i2c+bounces-4817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8692CC60
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D111F2456B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502A7EF09;
	Wed, 10 Jul 2024 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="Mm8g3ad8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021129.outbound.protection.outlook.com [52.101.70.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6948B29CEC;
	Wed, 10 Jul 2024 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598501; cv=fail; b=WvZxqfeeDj7CRqt6268d2KssFtdwc60kZ6PqRfMKe3fBFGSr6l+3BYEDeJBLJ6i2S/NqSKNOBFPrlOsYRr8Gj5479KdRq1gwkVTqlcosgnRtGvmmk8Q8lgShAYmdvYX7y38UOzpAKsOWSmQ0MNxnmsuCQr5zAL3F1PmHPFXy0OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598501; c=relaxed/simple;
	bh=3um9Ab8e37PkFxIVNtvgKhLDUut5cY4OETERf0N/T30=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T7X8ceRZZWH+V1WF0P+pfpJnZkwmJvAADzdNfNi0ZEY9fINDrZ+DkOm9cG5EmmsIScf9IwJaQR/2sgmi/SxCmbStNBAxHXzgfLIC4Img3qW8vPpiwPEmI++4p4VRdpnbC+0zIXGSgCMW/PQrpGAXzn4zWnfBkpUppnhpRgMPW3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=Mm8g3ad8; arc=fail smtp.client-ip=52.101.70.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Igsz8QiW5kub8fCV29jPzq8sTWE+eo7O8KEPKzDsjxqxuOVLyTuWpsb+04usUsI2KhpaZuGlDawM4gVhsq+7zZr1DMfB7yUL2w/trTCHZuUetzQZHOrNY6F8H9PUKzugga+DuwBhn5PlTto8r7d4EOEZVGAF2SnsecHuM5adncwL0m5rywQNcPrPQEcBzfA/YQ8HU1HSb3llCg9rRy4N9gbevpWr9UMLKM/9S/UL1dAeGE3vqCXsi2bpgzBrIiPnTihVyqyIp/40bzy9YEJJnIj5YbddlVSLe0omlBeDl3cteKPj7g5TSYNGMKs4PKafxlTYrX6nSueR1EhGNRhclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2cK/Da3qj4d1MPgx7TmuAdaqvMYLeXIzqWq14sGuw0=;
 b=l+NwZXurCN1ceKttp71aox1tyjWmekuSpxSVmDg+PpP/ljT8ZHoOPVCfoKMAbtshVMm/IZT0aGgrf9TS2O4QeB0FjW3JKceSZkawf3oEcsNBSwVvQNoeuJGXcCDF80+ClSJ45IuSFSuEQuyU/am6rLnqu+0N7qsw4I3z7j0AaT2vCVHAPMwlnAJq+34sgsgOjjIxWsJJ37mJQ44wNR6Bb7imQfUHYc6ObSZjWuB7zW9T/VkHQZvbzFgdIhMa+i4vnx/13DW2m/x1d6Su7ewRDnngXBJXJhnAoXHTqURGo0ND/45YAp5UHvDGkYUy2tRtBBCfwwmRDz0Rdz6otxRAKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2cK/Da3qj4d1MPgx7TmuAdaqvMYLeXIzqWq14sGuw0=;
 b=Mm8g3ad8qpkAQk5XWYJypNcP5KAVJERhwnz6cYtfGQgSjfVXUaKeTG+S7bnu0iJUQwERXbPiPkcW0WRjvtz9eWJ/AmEotjxudIaY9dlY+Z0Ee7g5hr5e2aR5KQtOT/brsrrDrEMffQUbnIDYCS7K+QjSVLHqXu+0XTr/8oGuiPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DB5PR02MB10333.eurprd02.prod.outlook.com (2603:10a6:10:4a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 08:01:32 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%6]) with mapi id 15.20.7741.030; Wed, 10 Jul 2024
 08:01:32 +0000
Message-ID: <c4b7f1ad-6daf-0728-016f-f57ec01e0da1@axentia.se>
Date: Wed, 10 Jul 2024 10:01:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: gpio: Add 'settle-time-us'
 property
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-2-bastien.curutchet@bootlin.com>
Content-Language: sv-SE
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240617120818.81237-2-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0000FA8E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:4:0:c) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DB5PR02MB10333:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4b2685-9c29-46ff-b352-08dca0b682bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXdaTVRSeURFTmVXNUtXV1gvMnpsRVNKWW5VeHdKbnNuNitVNUZnZHE5Tkc2?=
 =?utf-8?B?L0o1bjEwcjlJbnN3WWZNVzg5VVlFQVB0eXkrcG9SL3E4NjVUYUJoQ08zSGcz?=
 =?utf-8?B?ME1xRDU5c05GMlBGYjIra0JYemtZOTBUS2NGRkVMRWVWb3N2V0VxOTNYRFNW?=
 =?utf-8?B?ckpySVJ2SXYzcHJqMnF2ODIrWURzSnc4UGdhT0N5TVdPVVFkbzVFd0VreWJh?=
 =?utf-8?B?cUhVa3MvdGRkNm1IZ3RQYWppM2hWdmxMQ1UrY09sMERrd2p4RjFJbFBpT1BW?=
 =?utf-8?B?UFgxUk5BaDk4eU1nTjZCeWlmeEpJTllFbVpqcjFtU1A5YmphbUVoZFRJbGZB?=
 =?utf-8?B?WnBYcngrNmVyeUl6SjY2cm9uSkJxanV2SHpaaE1qd1NQeExEL0lYbFo5QXVh?=
 =?utf-8?B?RDZESS9tQ2h1c1JjOGp5emcwcmhLY0FLV1c5MGRLTHUyeFN5VVdOb1N4WGZm?=
 =?utf-8?B?NXU1QmJWdFhLaUVSeEZ6MG1TWVNVYWI4NTFXbTRxYnIzWGdZbVZaVjRIWS9B?=
 =?utf-8?B?d3V6U3Y1WWNyM2tyYTBNcm1Uek5LcXFWWDFIZHZIT2t3ZHJTNjA3S25CVEF0?=
 =?utf-8?B?N0hyckJFclJJRzJ0UXRUcEhTdXhQbTJDQXQvWHFJQ1NZdG9MTjNaNjRSdzlL?=
 =?utf-8?B?NVdjR0EzU2lTOVlUSWhjSVl6SnFUamlmc1pQem1NelBtdU4wcEJ0SUdEQ2FS?=
 =?utf-8?B?eWVYSzEyTDU4TUZPeEVuY1dSTGhkYTg2NW9EaUI2YUp1aG9ybTdEa2JZZ3dr?=
 =?utf-8?B?MmRkdlhYY1drelh0ZjJvOGg1bVNEQ0NPVlRZbG1JeHowYmFGUE1hWTgwY2Jt?=
 =?utf-8?B?MFBtMjBDQ2V3QlViNmpxRHhjSmRjaEtzYkFKRENPRG5JazJ0cHV0ZVlUU2tH?=
 =?utf-8?B?VVdVbTJsckt6eEFDWElZcU44ZkJUc3RzcThBUHBKQXRTNzg4NHc5QUU2ZDFF?=
 =?utf-8?B?aDljdWNIWm9nVURWMEFCcmJwMmxTdlpZWEhSOCsxYTVvTUl2aldlY1QwYjQx?=
 =?utf-8?B?NHdrc21SenlQelowVm1xdHpVYnAvR2svZWxLRzEyT0V1cW9LNDRrTmFEVHVQ?=
 =?utf-8?B?VFJNRTlRVytpdXgxcEtxU1FCbHFMcVdNczc2RmZETjBqTTlXeTZjbDZoSmxz?=
 =?utf-8?B?ZmRxTnh0NUNyb0ZnWEdvMHM1UmZNQndsLzE3c1hKcEc2YnNyK1BxdGh5NEp0?=
 =?utf-8?B?TlNlTmxqc09kRTBJOFkzeHBzOVM1dDBvdG9Icm53eEhYbzdpKzdFMkswU09Y?=
 =?utf-8?B?RlBSQkl0Wm1iOE1IQmZkSEhPYWxtS2VteVNmLzVsbGhtUlk5bW41RS9BOXVV?=
 =?utf-8?B?QUlvN0VqMEZ0eGNsQy9NVU8yZzY1UHNMQlJHRHdNaDBxSWNNQXgzVXRGZ3hK?=
 =?utf-8?B?b3cyYmZ2aVBwRnZXK1BaSjRFUUdjWFdOM1h0eTlzYVUxWjNVcVkvVmlndFVJ?=
 =?utf-8?B?cGZhUTM2SkhCR2xjNHBqYXNlN3JyTHI5eEM1dkdCQ1VmcW9ISEZaWFJDQUdH?=
 =?utf-8?B?ZTVwc0FRVWtTUnZybHYreFVlMCs0NHBYSlkzb2d4dkJPSStWS1dURTI5ZmV0?=
 =?utf-8?B?eUlHK21vYXQ3dVo5Ym85ZWxlU3RxbGFjalErRjZzSGM1d0xsblZNclBhUzhN?=
 =?utf-8?B?NldsUk9rTktmbGFWcFc5MTl2NWEyd2tPNUZ1Y215NHo5ZE1teWJJN3l6Y0cr?=
 =?utf-8?B?dU9kRGJZNFV2azc2QndQVWU4SElhNGhRQmttMTJUcW5MTUUxRjg0UWxmay9N?=
 =?utf-8?B?Z0c2UFVLZWJPOFFoQ2krTWM1RE12alAvRXg2MWt0Z2VmT3l0R2loanF1cUhB?=
 =?utf-8?B?OGE2YTZpTDNOY0Z5V0JuQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHVEY241NGZaTjVMQjkyV25IeHpsdGtFdlFxb09vb2ZGbG9XZXdlYTd1SG9I?=
 =?utf-8?B?elovWk1Ya1VTN2pyVzRCSkpNQlpqTWlQY0dEQ2hLZGR3ZVRKR1NDZFEzMHlt?=
 =?utf-8?B?YjVqWlhEaUp5VzZtTmhkNHdPV09KbDhzM2VQcmtwTERodGF0bnZ6ak11dmQz?=
 =?utf-8?B?dkNsSzVOZVRlMWs2VE9id3VBZXRQdnFBNWhZdTRsMFFNbThyQzB0NDhEOEVl?=
 =?utf-8?B?WFZjeUNhb1pITlFMOHpNUVYxM2hZcXhWaDRWcGRiL0FPc1JxRkdZYjhpUGFa?=
 =?utf-8?B?M0Mxd3FjUUNFT041YmtydVJFdzZrQk9UOG51N3FOdGVQdXdvVUJSK3BmeSs3?=
 =?utf-8?B?WGpyT3dtOW9rekhsSUZOMElzbTVucm9kVmptcS9Qc0R1UklXYUpkYU43NW9X?=
 =?utf-8?B?d3JmSE5rUUUrdHlrQmJOWW94RWhZUTJEd2tSUnFRRG9haEVaOVB3QXRwM3hB?=
 =?utf-8?B?aVd4Ynpuc1lDN0EvaVdNV0Zyc1l2YzhOVjQ5cTFRVWFIWHo1bUZhZkt2RnEz?=
 =?utf-8?B?TEFoV1I1ZWxwQWdrRUZ6QWhNSXhhQm53MkxVL2ZJNnFrUWhGeHhWK2RENVFp?=
 =?utf-8?B?N3EwMUw2S1lOenVwTEdXTlVacWhGSzBKSXFxRHRpa05rNHBMR0ZWd0NoNDFY?=
 =?utf-8?B?U3p0ZFVha2t4WUViOHNIOC9CbkRoMWJnSWwvbm50Q09kQkZTQkJFUmVzOFlk?=
 =?utf-8?B?QVFOMGMyRWdBTVJCdGt4OVRHM0grNC9EK1hocXRvRUNuamVDYVhyRE9Cbjh4?=
 =?utf-8?B?OVhOM3NTbFYwazlORTAwMytBVjRxekhHSVFRclJEMGZRN0V4TVB6K1B5UFhI?=
 =?utf-8?B?dWErNWdxNnYzMlozSTBMeGxMbkZzU1NkV2lGVmJzdURoK3oxUVFhWlJhdWNa?=
 =?utf-8?B?NjZVNTRyUFZMSHZmTlBIQ0JkWHRPa1BFc2l4cHJNV0pVaUovU25RSHhhNG5H?=
 =?utf-8?B?L0wrVlI5Z2VTdEdwS2FtR21nbmhGSzBHakFZUmp5d3ptRDhpL3pKZkVld2RU?=
 =?utf-8?B?Z2JRMU5qcldDblBZU05QQStmUVNGN3M0NEt1UUZsVHJYaDYzbnZNK3NGRTJm?=
 =?utf-8?B?cVp1THB4b1V1NWNuM014SGkrS2NQV3E4K2lCSjZIUUt3MXFSQ2E1SGVHT0RV?=
 =?utf-8?B?Y0hQOWpQQld0WTlxWEJtM0J5dy8yQmdFdmJyVm1WUXRKZG5lNWlsRkl0Yldn?=
 =?utf-8?B?Q3JqZDRRYkc5cWZDd2xSSEJRdkdkeW5XWG4rQXNWdHA5NmkwTlB1K3BWQ3RG?=
 =?utf-8?B?Rk5ObE13Uk5nVytTY2lmMHJKSS9YcFd1Ty8vejg4a09IM2tta1dPVlBEQ1JK?=
 =?utf-8?B?VjYweHlHZHFxb3JqYWhoZktQQk9ZU1c3VEYrVHN3SE8zUGpXYkVjdWFEUm9a?=
 =?utf-8?B?VktaUW5sK05ld1o0M1djL081eU1kWUk2M3ZIQiswNmZhNDFlZnFGKzk2NUhU?=
 =?utf-8?B?Ny9ISjA5M2dlZHFLa3owZ3NabkpkL1U4R0VpdXZLaXozRzNUcU9aclI5bCtS?=
 =?utf-8?B?UTRvSXhVN2VLdEQ3ZXI3VmN5OWNXZHcvWEdyQVNHQk5xbjRBNzljVTdEcFdK?=
 =?utf-8?B?Y01ybEhCS2JRVUQydzhMZ2d3T0tmK1JKUFVWN2RRbXRVNEZBUEJNdDVGbDVk?=
 =?utf-8?B?Y2g4elBsdG1jUi9tT0VlK0ZkQ21WMDY3b2FVelkrTzREWEdCcER0L2FnS1RL?=
 =?utf-8?B?cVUzbEJJSmhUaG4zUHU5bWRDRzFUVzNzdUFIaXNGYVRGcHhueFBLckx3WEJ4?=
 =?utf-8?B?SmdERnBWWHRwTmVzYTNsdEM1eVBLVVNrcGtYUmpXRVgxRzR2dWRVbHdnQW12?=
 =?utf-8?B?Q21CQ2FZZUVLMlIxZitwOWZkTHN1NUNUOFE0c3l6Qjk4WHVRL0E3blJtaXpT?=
 =?utf-8?B?ckRtY0NqT2NMcjd4SFNkd2p3b21DRjI2VVl0bmQzQzhabDZkdERRNmFwOWx2?=
 =?utf-8?B?cHhCcnJ6WVpCSWpSVzY1bEpNa1g5WTJVY01URE4vNmk3RDJJejg0TDNSZFVY?=
 =?utf-8?B?eVNLYzhXbk1VTlJJMW9XbWhVTWJPRGdNdEsxalMxVzczemlPTnhoRjUyQUhS?=
 =?utf-8?B?Vm5SRDdsR0lNa1lHMTFXTFJwazBjUlFSVzM2WC84VlUxRVFFVGRPd0xuaHpy?=
 =?utf-8?Q?sQZrPMGepwsgJEnpFEKI3iuGV?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4b2685-9c29-46ff-b352-08dca0b682bc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 08:01:32.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7cpI467saiBgtgN5KnxaWSPkXodl04EBfEuNhUw0ZvZCAOhRCQbUEz9e8bmBmH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10333

2024-06-17 at 14:08, Bastien Curutchet wrote:
> I2C MUXes described by the i2c-gpio-mux sometimes need a significant
> amount of time to switch from a bus to another. When a new bus is
> selected, the first I2C transfer can fail if it occurs too early. There
> is no way to describe this transition delay that has to be waited before
> starting the first I2C transfer.
> 
> Add a 'settle-time-us' property that indicates the delay to be
> respected before doing the first i2c transfer.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

