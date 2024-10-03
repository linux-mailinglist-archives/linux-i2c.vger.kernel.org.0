Return-Path: <linux-i2c+bounces-7203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A327A98EDD0
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 13:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB2F3B24237
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 11:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B14217B51C;
	Thu,  3 Oct 2024 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="GxNC82Hc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2118.outbound.protection.outlook.com [40.107.237.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63A170A15;
	Thu,  3 Oct 2024 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954165; cv=fail; b=f40rAfXhRHOW+Q6ds3tMEyvN6Hp0GiVcP5eO8kO9nzvos7PzvK+5Dnlo1E11/YZDGo9rnBQLvuDi0Omdg7ZdVx3YVqwreWVT0QuEFd8uY5fDzERLgMBeoNUWyaqiwHC9oGPvHxJOTptZvVUA6g9/26q1J9Yex+zeh4EybpWmyDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954165; c=relaxed/simple;
	bh=U+B+1q7ZDeKvodRNEcYQ7I7bojSjXDHdNavB9zboOmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aA7j6ssKWA7PLLt22R+adProvz2Q2twl8INH+KM1KSF0tn2XL/tKy5S91nBftD0kVrEm67Lf5x/5eWjnEQLgUhoZ4HalgpDoObLxnLZ8UgbObw1oTfLwR9pczO8y+jihD6b8oagEvXuyOSCy+92KChsrR9oRrty9+yZmS3Nq36w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=GxNC82Hc; arc=fail smtp.client-ip=40.107.237.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxhxH3t9NwmSjWnL/8fluwXHCrP1PYz8HY4QM9srlTOKACmsLDYQpqYQ6L+kory+hh+xWJKY60tWUpzIDN1bRAAEWrsXYX4bvaHlvrnLrPPgVUYmQkdZ2UjYsKWs785FjfWK3jCJHXeH19WxjiVa6xaJKW0xpiZlu5+WKhDiadK0GNRrCfBAtayi2P1UtkG4NfO8YASE/biGlTqbTOedyOMCQYBvatEkswTeiXZYUwk7nAk5HLtAzu3scJHq5wosJjq40xUi2pTO+YfN4bg+nfVamK+lvJtGb++TxGa3WhjMQtCNlpl1Mk9csjaJF/jJgoCUDa7LrLAFGFKFgFbjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDEe8WK7zt+LJRP5DnUfSE79XWyttZ5+iNLC5RxLMtQ=;
 b=y2f4X61qo/hNvyYI8rSfpX4aqeioEnuqOhfs3Q1fwHoLdIfNmTjlZplo9AWpnyuD5QnCUzXm/6lDCWA1uanhYrYSIzbsj0Vo+MSYi4wKC0+u0t8/eRIJbhmxcxHUuOyP30mR/XFoCbQaeiBdwLw0DqzECCWPaTeZ1HIk58Ptn5MvZLyFA1LdyQGY4pNFJ7bGwcsXjROGE9SsuOqmMTTbEh+uH+HWyjxRrZcYAOdewuBzIbNRQnf/88wRjF4LpwN5i91tGBkX29Ge1QlmpiCRlZGP7BN3G3VSamHCJJLMHBFw5TnBllBoBI/5J7LOv5T0B9xmzXKymomLAsHy2k1b1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDEe8WK7zt+LJRP5DnUfSE79XWyttZ5+iNLC5RxLMtQ=;
 b=GxNC82Hc8LE5C6Q7EcLAnaHmqfu6a+Upfv0WzCy/s9SahzpHKWqGKtlolPjSd+ojGA7R22m2XTD6Dyvq6edvdNCZRJtwZDSGl1CwQJNMe7lopc/opZWzD6jvnXqt9upHrPKuxdb9S+MBJB564pTCZK3VBZMC6atnGouFnRrMEEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by BL0PR14MB3714.namprd14.prod.outlook.com (2603:10b6:208:1ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 11:16:00 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 11:16:00 +0000
From: Michael Wu <michael.wu@kneron.us>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Morgan Chang <morgan.chang@kneron.us>,
	mvp.kutali@gmail.com,
	Michael Wu <michael.wu@kneron.us>
Subject: [PATCH v4 2/2] i2c: dwsignware: determine HS tHIGH and tLOW based on HW parameters
Date: Thu,  3 Oct 2024 19:15:24 +0800
Message-ID: <20241003111525.779410-3-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003111525.779410-1-michael.wu@kneron.us>
References: <20241003111525.779410-1-michael.wu@kneron.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::11) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|BL0PR14MB3714:EE_
X-MS-Office365-Filtering-Correlation-Id: 333027e3-9f60-419f-9f8d-08dce39cc2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|80162021|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXNTMDU2NkxGWVh4WGlidVJ0cVZhYXh6WWhQNlRNTTdzL1FWeUI0enRLMU5t?=
 =?utf-8?B?SFhaSnBYaWxKN29DNW54V2h2R0RlY1VLeGdqZ2RLSmR2T3pDT1FqeGFlc1lG?=
 =?utf-8?B?ZWNFMUxaempBdVJJYUl3cU5nZmFRSmtwcDVQbWJ4dnFnSGg5d0tYR1R5WGRm?=
 =?utf-8?B?UzJLQUYrbVpyZFJ2UFJGNFEvc3IrZDNSTWFiR25jcmRiMG9PQ205NTBROEd1?=
 =?utf-8?B?MnhCZVA2NFRKT3hMSmhVVkVFV3VDRTBjdmlnbGZzdDA0UU9wY2htd1Z3TzJN?=
 =?utf-8?B?RHo0akZKUTlPclFzZUtIaVRGREVxZTNCeUtqOUdPejNHV1N2OWNETjRDTVB5?=
 =?utf-8?B?MFpIZWYwK2hSQlBOTjBzbnRmQ01KNTlkNlViTVh0cTZvbzN2N1BIL3ZCdUs0?=
 =?utf-8?B?bTZFSHhTZTRGY1VqWDFoRDJtS0lVY0xEOFZRTTRLOUZoMTdNR2lTQ2RXc3Vm?=
 =?utf-8?B?dXAxRWVjUEFZSWFuQ2ZMTGxCdXpzMXhrNnljUkgyeDk4UGI0YnFyWVJZL3Uz?=
 =?utf-8?B?aFRva0VMVzRMS3pUdDJwcWgzMUd0ckxTSDN6ei9lZlg0YWxoSExpTENaWUZ4?=
 =?utf-8?B?WUorb1NmTWdXRFNkN3llTXpGQ0JhTzg2bmhKalE4NGhHenRNdGtlVitkYTA0?=
 =?utf-8?B?S3BRdlF2aGVIajR1dVNFVUlDUmNPVlRKRjU2TXpmUVI0c1lQcjlaSFU4Vll2?=
 =?utf-8?B?aTkvVWxVeUZiTTRsaFNBYXl4TkxmRTBFRnBkZHRNNitFWnREcWhSN0Y1QWcv?=
 =?utf-8?B?UjRyeXYrZDVNcWxSWXNBK0tLSEhseHZmUnU4UldGbURCcHhxbXBoZmZnc1RC?=
 =?utf-8?B?MWdoMTcydlM3UTBCa0IvWVUxR1ZMRDFwb2RCZkRNS3g0TzJBV2dPTEdKZy9K?=
 =?utf-8?B?T2pkNys5Y0JqckhiRUhhREtoc2l2TUp0anFVUnhOZWpHdXpuR2FKN2NVaVdJ?=
 =?utf-8?B?eDR2V3QyQ2JjNFk3czduOGZObFZ6US9XZGJaUTNMTnNlbUVxblR6WGtMTUM4?=
 =?utf-8?B?QTRIaFh0aGI5dzgxMDFuUnBPODEzSEFoNmMwZDh0bjJyd2tsRHFFQ2dTY1JX?=
 =?utf-8?B?TTBQZFJMZm9nait2RUgzZ1pHSm92WkJCNmpDVFRnaTl5MXlKNmlkRUw4dG9F?=
 =?utf-8?B?dVV2NmNQa2o0U29lK2g5RnR0c0E3bWtEcTV1UnZMdlJmeG1yNGkzUUgycEVo?=
 =?utf-8?B?Q2ZvOVNaTmtERkVGa2k2cW91VDRZdXo4NjZQelY2aHZSUVdPaGZpQ2RQWnBt?=
 =?utf-8?B?TURaWlF2Vm5CSGtGY05nQ0hjMitKVmhGb1IxQm9xVUYxYkRONWcySnVndzRE?=
 =?utf-8?B?Z0w2dkgyNkxESC9MT3pKY0srbVhGaEx5NGVGRElNYzNEVy91dGRrbU5LcUdm?=
 =?utf-8?B?SlpGdmpxUVJxUlJsbHJUZFZvNW10WVgwNE44MXlnTUQxSlpDb2dHUDFmTHRq?=
 =?utf-8?B?MEk5dkp4QzdRbktWaHlMM2VnenJZL1F6OWlUMlNFTU96eHk2UkVFcDFrQzk0?=
 =?utf-8?B?SVRJV0NmbVF4T0xRTTh3K3Bvd1dxKzlGTVFrKzhTdGZ0ejFaRUdDUFpMOUxu?=
 =?utf-8?B?QmVhOEE2MU1qRnlndld6cEhyMm11MHRwbERMbzU3SzZKaUh4cTRCWFVlaFpZ?=
 =?utf-8?B?TW1TNlFyaFFQYmQ4N0YrWjFFNXZpa1Z5ZWNnZm9pMFMxcTBod0lQMU44NFZx?=
 =?utf-8?B?TkljR3lWZlVWL0xUU002bmw0RHJJcE1VSWlyTFJzdDgrSVZxRmt1c1M1cWQ2?=
 =?utf-8?B?L0MxWkV5bkw3cVREZWVJYU0wZUxkaFBiRXB4MXpmM2RhN0hxZWlyNGpGSzJ5?=
 =?utf-8?B?MXY3ZjZXdEJpdjl4cGRGWVYrdnFvaTdkNDlvZHpyWnBaWE9XUFRjMmRBblkr?=
 =?utf-8?Q?SXsUxiTTP/juC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(80162021)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eURRbXBzY3dlYXJwaTlCK1NQQWxEZTl1Y0JmMWI3TjdwbHJlTFNEZ3BhMXFF?=
 =?utf-8?B?bVlWWk90NEx6NXRlVElVSkZBeWdxZnpYQkpnM2pndG80WXF1L0JmZnoyMkVr?=
 =?utf-8?B?QmxxRWlRZExqU0tqR0ZQZmw2TWFwNjBnVEdNOTBWbEFGZ2ZMaHVCN04zdGhi?=
 =?utf-8?B?S0R6NlR5cG5ZanBUUWUxZnZVS1ErcFJ5KzZiem91Z0hUbEx2dENSZGNrS1d6?=
 =?utf-8?B?alF5cnJQQUduRmVDNUZwNU9paW5RWWJhRzRIaVhZZ2p6Y0VCNDh0NDZvbmNK?=
 =?utf-8?B?VFZpa0ZHZmNFSmEyOW1ZSU1mTEtPanU1MElzZ2UrZURLanpqcSswTWJWSW53?=
 =?utf-8?B?MUsvazk5MUlINWlXNFFYd2FwNWsreGtacDJnbzQ4NkQ5TGxxZFFidlM5ODQ2?=
 =?utf-8?B?aElZMUdMTTEyZHlSNUhZcDNucnVwdFF4OUFPdGNEemg1aW40bGNRci9xVHk4?=
 =?utf-8?B?YlBQUjZNRjdoODhtRVFncUgydTVIdDJOZ0R3RHBtbUNScGVvQnJLN1lkanFW?=
 =?utf-8?B?QXBpY0FHNUd6a0tHUFhDT0JtWmdrNnJaWnJNUzMwd3JYMDFBVE5MWjJTUktJ?=
 =?utf-8?B?MDVTOXRlQUs3eGh1a0FqbldzM20zY1UrdkUrbGN5Nm1BaUlZSkMrTjM1VGV0?=
 =?utf-8?B?YUZjZ2hRb2p3NlpMOE9KRE5VSVNPRlBub29mckxhOGcydXZUdGo3cVoyMnRt?=
 =?utf-8?B?ZmdqNWFUYmVNRnJqVDF1M3NSS2U0RXlMQWJUTFF3a09IVVA1Y2xCcGh4VXdk?=
 =?utf-8?B?SzZxL0orRDdmeDNCRFZBUHg3U010NE9oZExQRUtRdkd1Q25MWllkcTU5Qy9p?=
 =?utf-8?B?N0tpbHQzNFovWVl4MzZGaDRIc015U2p6ZmI5aG11TCtrNC9XM2VQUWM4cThL?=
 =?utf-8?B?bW5KcVhVNzloK3NvVExHd3JrZ2dQOXViTWVPYnZ5aUoxWUdESlIwWmo2OWhF?=
 =?utf-8?B?aTVMdGtQZ085SHQrWlpSRnFHTlZpVnZPbWx3NUJ2Z0s0eEYrS0U5VTZ2MnFG?=
 =?utf-8?B?a0VJZXlERWRiOUdvR2NBYVhHdkxuSGlsTzZzbkQxbCszdnJnMHlUT0tJLzVH?=
 =?utf-8?B?TjVaemRsTFBiUHpDWlMrVm1JSXgzdWJhcEZuMklBWGhsNnhYelFwampreWdE?=
 =?utf-8?B?OHhYdnhDMFloMnpuVzhWV0lNR0FkUGR6S1JxZ2RVaVNGUSt4MVRIRkZPQlkr?=
 =?utf-8?B?TVBpRFNubUp2YTdZUVZzeEN6L0pKUHJnSHRNYkZhY1JyLyttYXVBSXptOFFk?=
 =?utf-8?B?S2hra3lyWWgyVXhwNGtZdVVNcm9OeWdSc0lkbklMTnNzYzllVnJMQWJqSHJQ?=
 =?utf-8?B?T2hGdGhvQmhBaDluYXYxN09WQTZWUVgxa0ROZ2dtMjZGWkVTenAwUysyZnZt?=
 =?utf-8?B?WDZ0TGdVRmZLSkduYlFYZWlFSzhZZjQrU041eTR1V2k4aG1RU3hBYWhnK0RG?=
 =?utf-8?B?aFRsRTBISERQSDZ5SE1OcVN4d2Z4enVwdHppQm5YUm1pUFJSWUd6bE9EclM5?=
 =?utf-8?B?RmkwZG14cmNnK1pyU1I5WjExNGsxd1pNc0hUcUUraTk5M1Q5UFpWd2NUdlI4?=
 =?utf-8?B?cTlWUndGQmVTT1Vnanpzdm9tb0xDRm9uVEVtbzJvTnhsY0laZ3pkMzR6RTBL?=
 =?utf-8?B?dy9zeDVHa25PS0NZS2xIUWdmMGVOSUk3M29RZ0J3QS9GblZqVE1GaVk5bmFQ?=
 =?utf-8?B?eW8xQU8rT0Y0QmlMdjY4amdGQVVwS3NLdExTa1loZHpjdUdFZVVwek5FaEUy?=
 =?utf-8?B?WHN0bXBEVElXc1RXMWVLdFFiTWYxUFRYLzBzWU44R0dNcEdjcnRhQllMeHZ0?=
 =?utf-8?B?djdOa3hhMExsdkJ6MERKRDgrU0hJUmZ0MEFnWHFpN284OXFhVlhIM0JCRTRM?=
 =?utf-8?B?OUsvd2R3L0Jyd2lBRThYZ3p4V1ROT29nQmZUR2ZzOG4wd2NpSkE1eXRGWWgw?=
 =?utf-8?B?d1ZkZnhuM1l2SjYzME1CMkFocHZVZm9nMDNiU0c2YkRrZUNvZ2QxRThDdkFP?=
 =?utf-8?B?aWlSSldnalJHZjcvYmlHM3p0UzJhT3RiNXNpSktXeWJNYWs0OWloek91YjVa?=
 =?utf-8?B?cGdZTXUrMXM1YkFKcHAxMUhHa1RGRktmOGIrd0lLQlVQZE5zdDZXNW56bmU4?=
 =?utf-8?Q?TBEX/G1QNXMMP4VPYLkDjvA6+?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: 333027e3-9f60-419f-9f8d-08dce39cc2ad
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:16:00.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9HRhaNhq1af7pNTu0jCDHVMBMK1EOa7SP7B6k23UIxTZUsgJDASKTHFvP1mOB9IlHpzxWKaDHxBzmonDQ+tpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR14MB3714

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
for High Speed Mode") the SCL high period count and low period count for
high speed mode are calculated based on fixed tHIGH = 160 and tLOW = 120.
However, the set of two fixed values is only applicable to the combination
of hardware parameters IC_CAP_LOADING is 400 and IC_CLK_FREQ_OPTIMIZATION
is true. Outside of this combination, the SCL frequency may not reach
3.4 MHz because the fixed tHIGH and tLOW are not small enough.

If IC_CAP_LOADING is 400, it means the bus capacitance is 400pF;
Otherwise, 100 pF. If IC_CLK_FREQ_OPTIMIZATION is true, it means that the
hardware reduces its internal clock frequency by reducing the internal
latency required to generate the high period and low period of the SCL line.

Section 3.15.4.5 in DesignWare DW_apb_i2b Databook v2.03 says that when
IC_CLK_FREQ_OPTIMIZATION = 0,

    MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
		     = 120 ns for 3.4 Mbps, bus loading = 400pF
    MIN_SCL_LOWtime = 160 ns for 3.4 Mbps, bus loading = 100pF
		    = 320 ns for 3.4 Mbps, bus loading = 400pF

and section 3.15.4.6 says that when IC_CLK_FREQ_OPTIMIZATION = 1,

    MIN_SCL_HIGHtime = 60 ns for 3.4 Mbps, bus loading = 100pF
		     = 160 ns for 3.4 Mbps, bus loading = 400pF
    MIN_SCL_LOWtime = 120 ns for 3.4 Mbps, bus loading = 100pF
		    = 320 ns for 3.4 Mbps, bus loading = 400pF

In order to calculate more accurate SCL high period count and low period
count for high speed mode, two hardware parameters IC_CAP_LOADING and
IC_CLK_FREQ_OPTIMIZATION must be considered together. Since there're no
registers controlliing these these two hardware parameters, users can
declare them in the device tree so that the driver can obtain them.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 drivers/i2c/busses/i2c-designware-common.c |  5 +++++
 drivers/i2c/busses/i2c-designware-core.h   |  6 ++++++
 drivers/i2c/busses/i2c-designware-master.c | 23 ++++++++++++++++++++--
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 080204182bb5..ff3d83269ee7 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -380,6 +380,11 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 
 	i2c_parse_fw_timings(device, t, false);
 
+	if (device_property_read_u32(device, "snps,bus-capacitance-pf", &dev->bus_capacitance_pF))
+		dev->bus_capacitance_pF = 100;
+
+	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
+
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (is_of_node(fwnode))
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 1ac2afd03a0a..d09e6ffb793d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -240,6 +240,10 @@ struct reset_control;
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
  * @rinfo: I²C GPIO recovery information
+ * @bus_capacitance_pF: bus capacitance in picofarads
+ * @clk_freq_optimized: if this value is true, it means the hardware reduces
+ *	its internal clock frequency by reducing the internal latency required
+ *	to generate the high period and low period of SCL line.
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -297,6 +301,8 @@ struct dw_i2c_dev {
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
 	struct i2c_bus_recovery_info rinfo;
+	u32			bus_capacitance_pF;
+	bool			clk_freq_optimized;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e46f1b22c360..b56f33297d5d 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -154,12 +154,31 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 			dev->hs_hcnt = 0;
 			dev->hs_lcnt = 0;
 		} else if (!dev->hs_hcnt || !dev->hs_lcnt) {
+			u32 t_high, t_low;
+
+			/*
+			 * The legal values stated in the databook for bus
+			 * capacitance are only 100pF and 400pF.
+			 * If dev->bus_capacitance_pF is greater than or equals
+			 * to 400, t_high and t_low are assumed to be
+			 * appropriate values for 400pF, otherwise 100pF.
+			 */
+			if (dev->bus_capacitance_pF >= 400) {
+				/* assume bus capacitance is 400pF */
+				t_high = dev->clk_freq_optimized ? 160 : 120;
+				t_low = 320;
+			} else {
+				/* assume bus capacitance is 100pF */
+				t_high = 60;
+				t_low = dev->clk_freq_optimized ? 120 : 160;
+			}
+
 			ic_clk = i2c_dw_clk_rate(dev);
 			dev->hs_hcnt =
 				i2c_dw_scl_hcnt(dev,
 						DW_IC_HS_SCL_HCNT,
 						ic_clk,
-						160,	/* tHIGH = 160 ns */
+						t_high,
 						sda_falling_time,
 						0,	/* DW default */
 						0);	/* No offset */
@@ -167,7 +186,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 				i2c_dw_scl_lcnt(dev,
 						DW_IC_HS_SCL_LCNT,
 						ic_clk,
-						320,	/* tLOW = 320 ns */
+						t_low,
 						scl_falling_time,
 						0);	/* No offset */
 		}
-- 
2.43.0


