Return-Path: <linux-i2c+bounces-4757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1146B92A6F0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 18:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D3B1C20DE8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2024 16:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08971459F6;
	Mon,  8 Jul 2024 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="AqBfEx14"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2114.outbound.protection.outlook.com [40.107.20.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF226AC1;
	Mon,  8 Jul 2024 16:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455198; cv=fail; b=EzHFn8KRsZHx3BywpwA2wEwaQMBe/+dlJbnRQZ4j9YFuNK9z18AWOI7LG/uFASUjqc5la3tSw/GPsPjGz3oh2n4Vli2heDsaHhsCC7a35OsC8LKfkc1rgjaVvEppAIyXdosa6G0tyevHcb7yBpM0AvGkvegC6byR6u5OKc+N/Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455198; c=relaxed/simple;
	bh=xUOzJhYgGi7tOD03S2/glWYlpwIkiosXRfldjdIrq0E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iBrUssVaRP254EA/u5lJxbje4Y+11du2NrzVhmmvRZNZAA0b6/ChVNQJiVkaCWtC/gSSpOCx+Zyz/GChn3fhaTHLKzABQqI/7lwKxYOlwrlNj/qCH5s6gtztCic+uM+icbhkgBj7EXdtZlZhFvfW4/Ie5ZHUWmJtCN5kOemP2HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=AqBfEx14; arc=fail smtp.client-ip=40.107.20.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLNZrW69qO/h0frXciJzqzLhbf+yUFu9ULG5LDoIeZNVjOx2/+nF+jQ63+cHxWLUmX+c5zAUfzSBZGY2yAe6bu5hlZ77lQE3NznWEMLU0o7z2nGpxv62tGTgB46m+AX6dMbJiGrSlUYJeRfLNcjGZQDPJsdZyaIlndyTk12dVFL2IOBHlgrWtY4FFdBsoUwRRAjnkc0bz2ORbqrPDjOq+OjEmB1L29ZINOZk9T38kcuM396Yi6ifgJeGv5h8J3unnWAIdg9u7NT2kSuywJ7d/8HU01P1xaFrw/gFvq8h76soGK/rl7EqnxxGH72WEvaNUblc4eq5q2FfOSiN/WouJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M5rTS0hwBjxoUhV0wrTMNvLyx5reO/n4ovPpVOxKL8=;
 b=FT3FCZKPZVnj3KM69y0ylE54LBGQdMP+uPpZVOZDoVF87XXrb7tb0gE27eIEZAa7I+RHzWFgA1austm9DJ4hoS831ZWOJIb7Uw6+5yXAs+2obqZpb52fKZjyRvTJdnRDeW6BV9AhgVdiA2/OIMOpy964YXFFaAVbmMB3RKbQFOr2zu5CoMuMOtMuUSxjBeVDSynaSz4bdwEMxa/DfHhIhbiMSHQSwP+vp24g8GFj1Td67HX6NGJh6KEaZeV0fD1hxYNfT1GA04K0ZckEOaTF95y8D164snlHeo8b9hdwO3fJ6zwbStu+eH49kOuEBH5dhR38BM+0tFMvMkCU2R9WQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8M5rTS0hwBjxoUhV0wrTMNvLyx5reO/n4ovPpVOxKL8=;
 b=AqBfEx14Hi4j0RGGhpynThyXA5r1ZsLFvQmxIGl3N0icrhhZl9Imr1x5F5YjQZOrCGrMzUATSn8nr/B9EhDYzKOGuzoKM9eIM0MAh9hinbj15t3ppP+ngLTXyetULKF2xw0Zp3QrpGtLB1M6pzhNzCyXODz7eR4HuhozTWO+D5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com (2603:10a6:10:321::10)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 16:13:11 +0000
Received: from DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181]) by DU0PR04MB9562.eurprd04.prod.outlook.com
 ([fe80::ad4d:8d53:1663:d181%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 16:13:11 +0000
From: Farouk Bouabid <farouk.bouabid@cherry.de>
Date: Mon, 08 Jul 2024 18:12:13 +0200
Subject: [PATCH v5 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-dev-mule-i2c-mux-v5-2-71446d3f0b8d@cherry.de>
References: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
In-Reply-To: <20240708-dev-mule-i2c-mux-v5-0-71446d3f0b8d@cherry.de>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.0
X-ClientProxiedBy: VE1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:118::46) To DU0PR04MB9562.eurprd04.prod.outlook.com
 (2603:10a6:10:321::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9562:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 41660f54-5014-41de-1e0b-08dc9f68dd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2ozd3JLV2dyazVwZXFseGgwUEJocjZ0WE1zenc5TVpaNlJLSFJIbkJYYmVC?=
 =?utf-8?B?TStJREw1ZElndmM3UkxHRC9qWEFPb3lDa1h5SFlYdmxsNHVHbTVkamlQSzkv?=
 =?utf-8?B?OVdiNTgzeWpHVENPNGhscHk3eXl5RitiQXBaNndlSWhxUC9zeHJhZFRYcXJI?=
 =?utf-8?B?V3BpKzhrOHA3eGlaMzZidDY2WHlCVzdnVklneFhjWDVFaGpkUGZ2Y01qVVhH?=
 =?utf-8?B?Znh2TFRGSkxDeW50cXZ6Y2V3VC9ETDFjTWFGOHNvNkJYcnhicWtmNEw4MXJk?=
 =?utf-8?B?aUZ4RjA5MlRnTEE3eWxEVllIVkwzaWh6eHpreEU3anh1K1VDa25ZYUdTYXZq?=
 =?utf-8?B?QmFvazd5ZC9YaGZnUVg5Q3NPTDFqUXZLMnRRdE5JenFkMWx2UUxwcEhhU3Mv?=
 =?utf-8?B?eGtpNElqMWw0b0o3Wll3azJIMGNsUVJaazZwcGRzMG44N3Awa0VpZlBwTkdu?=
 =?utf-8?B?QzFpdDVlelkzeUVDVFFBUGpWR3ZMRXpzWWNyenh6RVR0NEFFV09ZN0tBZVdT?=
 =?utf-8?B?Vk9kUm1nUU5OWUwwYnI2elhNRDA4ZDdPNWhUUG9Dd2g0MEhSZDdzZFFrMFJR?=
 =?utf-8?B?Z3JnejVUaFd4Nnc0QnIzbld0MUVacDFOT2V3OWJsWXgvQmxHWW5OdE13dWt4?=
 =?utf-8?B?cGtDTmJwU0hBNDhxNmxsRVBvQVltOW9QZUp0Q2ZwMm4wd3NTTnoyQUNPZldD?=
 =?utf-8?B?aDRVK3lGREhXR3lhRlppcnBjWUF5V2dEZlV3TVl6RzlxemVIazlkNVZmN1RM?=
 =?utf-8?B?NXRHck81RTNLVlFXK0NOd3NDVzNHbmxiOXRQdk0rbW1VZnR2N3g4TndhTGVo?=
 =?utf-8?B?WHpwcmg4MVpFTlYxZm9raGtkbzNPYW1lTXFZeTE3a2Q0K1NYYVBvVStlZ2R6?=
 =?utf-8?B?eW9aTzNaTXhjRE9hTm5xMUJSYmpSYmNzcktJZUMySmtlSzkrTWx3QytNL0pI?=
 =?utf-8?B?NTJhdFhyVUFqUldIMjVDcXgvbUNKaGNmRC95SkgvRFBmNVFSWXBPaHZFYVcz?=
 =?utf-8?B?b1gzWEp1cnhiWjA0UTBPOXI5eTNXMTFRb1d6YlpObmo0S0k5M0MyVFFkaEM0?=
 =?utf-8?B?ekR6c3JwYVJEcVNxUUdpYXhneWpjTDRjRldTRThUT2pqUHhRTXFnS09DaVhi?=
 =?utf-8?B?QS9PamIxanJGWXVLYjBZRHAzczNudmYxRkIyaVU0cEJxSVFTUVZydko3RGdU?=
 =?utf-8?B?VzlUblZEL1RrZFg2WU9MNlRMazEvTFpvT3lWSHJEOU5FcVFiRUVmVmpSS05Z?=
 =?utf-8?B?Qm05aFVzL1lQSTdiaDJUU3BHeWZXSTZoSlBVZFBEclpyRkhXVEROOVF4L09W?=
 =?utf-8?B?ek83QWN6MXB5SmJ0amphaG1laXIzcWlaWEtma0lsb3J3K1NNWU1FTXNWNzhN?=
 =?utf-8?B?OHltMzdMTXFONVMzcHJkM3JGdTg4a1dzK3VPZGtVSFRubE9IdU5xaVVaU09S?=
 =?utf-8?B?aGpaSWJYOVRGUnNJWkN0WGlUNkgxQXdvb1Axekx4UEthZFVHamV3akt0L2pk?=
 =?utf-8?B?VVE5TEFsY3h0SUVaajBDZ1VWa2lsbDhhMUNzaUVwaGhCREVyd1k4UU5idFhv?=
 =?utf-8?B?U2RJckJ2T0R3OUJSZjlISkg5d2k2M0lyelNzZGhkdFFJdElFbEx3ZmRyekUv?=
 =?utf-8?B?YTFZZjR2bk9IZkhFOS9tbll6VHB6NkJRREt1NENwNzYxeHRWWWVXUlM3amlq?=
 =?utf-8?B?YlJqd0w5ZjR5elVlN3V3cDIvemRmdWY2N3pITWxxZ0I5dnRST01zMHNXSU9R?=
 =?utf-8?B?S1pRS3ZJYTZsNzVVTTcvOUZpemxMN1UvamNlQWVsaFhSQXRXQmJDZWlKM2tD?=
 =?utf-8?B?cnlVQzFrZUFXTG04Q1JOQjJyUU5SV1VnSkIxQjg1MmROQ0xjY1dhNXh6Wmc3?=
 =?utf-8?B?aE9wTll1NkJ5cXlZdlRhbGN4clN6R25yUUoyclRQZERjLzVTNGJvdEo5VUlG?=
 =?utf-8?Q?0GflEk0eKxE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9562.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnovcEp4NmlkOFNlTmNNLzNaTDVmY3Iwdk12UlVLUjZYYkpSbGVxbFpIOU1p?=
 =?utf-8?B?dXJ2MzdxR1laVExsRmpiSTRKcTZUbnBSZjBSem1ubWZpUGhBUXJIQmE0S0ZP?=
 =?utf-8?B?cy9sQWZiV2V3Y0xSVmhNZDZ0UWNtMGhrZmVuTHhOdlBKTEdGclliVkUvaVVj?=
 =?utf-8?B?QngrclEzamt6dHBvUmJkTjVUUGhqSERreURnamNST0UwdkZacjczWjNCK2hE?=
 =?utf-8?B?eFljQVh6b00wYmhCZ0VjRGtnd1BPSEx6RHdEeXRRL0VFcXVsY3dvUmdyQXJW?=
 =?utf-8?B?MnJZUVRJOUd1VGM4ZGhxc1pZTDJLQTNWdHN3TTFaNyt5ek9GVDZFZXJjeC9m?=
 =?utf-8?B?c0tOQkU5Snl6ZXZRSlRWcXBZM0IrOXBhMXcxVDVnSTZ3OU5CWTRjKzkwMUxo?=
 =?utf-8?B?M1FwZmpwcUdwR3hzWERWOXQrRlVXamJqb1NxMDNLMTVyaitzV2RYN3kyR0F1?=
 =?utf-8?B?Smk3aksxYVFtdE15M1M3RU1JVXZrVXhrUnEyWm04RW4wb1BGMHVQL3NWVytu?=
 =?utf-8?B?b0lNQmNyZVJiRkk2R1RBSmJacm8wenZpT1NqQnZTK1F6RUk3NHZhQWRmalZo?=
 =?utf-8?B?Nlg5NUZoZ25NSFByUE9tc0UzT01NaWQxbG1Uc0dXcjN0V3hpUW9aQm9pVUI2?=
 =?utf-8?B?WXdJeTdlOXJVOFFRVkNVdE43ZnBFcUVKS1ZqOFJUd3plSWZ3VU1WUmxkdEt4?=
 =?utf-8?B?OHd5Q1RwbW9abUkyb2hJNEV2Q1VScU1rMklyZVo1RS9TNEpZSytwWWQzRE45?=
 =?utf-8?B?NE1sUUVNNUFQN0dxYjIzbWVLQWtSZjBVcFh4dFZhTlJGajd2dXNzVmx0d2tX?=
 =?utf-8?B?VDVXRlljK3V6bEpEVWRvc2hwZ09MYTJVeGk0TGlZYml3YXVwTzBWM3RNZXRp?=
 =?utf-8?B?b2tqMFpTellNMGN6Y082RVFBMVVRZU9tNmZsWWRqTVN0WjZ4YVBRK2J3V2tX?=
 =?utf-8?B?T2sxcXV4dmZ1NVBKa2c5eUs0cDFaQWFNQkRDU0dsZllzSnJ2dTRkUUtjRlhs?=
 =?utf-8?B?N0gzYnRBYkhVd2FlcWgrMnlQMGRZQVNmM29rRzdyd1haNHZaSElYRGUzUHN5?=
 =?utf-8?B?bFZXSStYaTJPQnpCTTZQUjExM2l5OHR3RFVBMTJGYkl5SDZOc0xNdUhvcDll?=
 =?utf-8?B?dGxuY29ObnV4Vk1DME9QNjJVTmdtNjFNSFo4SXE2VnFnMTdnNkVUZFVRNmRs?=
 =?utf-8?B?Z1VhbmlUTmtrLzQrOGRobEJkNkVPS0RTeGw1dFRORGsxK2VBSnI3YTc4ZE5Z?=
 =?utf-8?B?aFVnSE5kQ2NHK2dGU0kxSEljeGkxMExnbnRUVkFMRjM3VnlSUmdFaCtnY2ZV?=
 =?utf-8?B?YzREc1pmSE1LMU1BS0FDZjdYbHRmcW95dDZxVHRmaGt5N20wNlZ6a0JRYkxu?=
 =?utf-8?B?L1pJWWNCazR6R2ZBWWJxeW5TckdLUWxRRzB2OUpCREhoV2svMUdBK0h5cGpF?=
 =?utf-8?B?M3BQVlZGZllEQTRpMVN5YXY3RjBKRElFakE2c20rTUlmTzZCV2w2WElweWhp?=
 =?utf-8?B?cnFMcHJhRDFVN09PdVdpMjUxUzIyYUsrVXBQN081Qy9IcmVjZTBJaHRFTWFO?=
 =?utf-8?B?NFBYNTNjc2hZWUovbjk4MVFFY2tmWXlsZndnSzVoRjZCS1orVVlmTWVORWVl?=
 =?utf-8?B?NHRmTGVpN09uWGtrV01TcmtsUElhS3lCQXdzM0lPdUhMdk80cU9IRE5FZVZM?=
 =?utf-8?B?TEZuRVNoYkE2Wmc5WjFwRm1JSmlzbk5hbUhYbkxPSjJhaW0vNmN3d0YzeXFD?=
 =?utf-8?B?YlVMTmxMUnlmY3BRSWJzdWxodVNSZlRvTGRVR1Q5QlZHZGlGaGc1WVFaangz?=
 =?utf-8?B?a0psOWRvZm5GZGlVaC93NWlCZTViQ1diTUEyc2lCUTZUSFR2U3RmSlVNS3hL?=
 =?utf-8?B?eXpIYjlZUU1Eb3hxak1pMHRjekNVT1pVQW9LUHQ1RUNwVzRpNXZnOTZkZGhR?=
 =?utf-8?B?Tkk5bzVvWnYvbnEwazUwRWdyVWw0WmZkSVIwTVdMaVB4VE1Zd0hEOUR3UG5i?=
 =?utf-8?B?WUtrTE5WcVppc3RRd3hHTVpjVTlqeDNxWjcya3NtMDF6SzJlZ1hrTTFQZGxX?=
 =?utf-8?B?OTJsYk1lWTRxRlUyc3kyN09lZkJKWWVLOWdHbU5EQjNvSnFuQW1YZXdFa3N2?=
 =?utf-8?B?dkNDeVFBM3BvbE9TWFZlNi9BcGw0RnVXSXAyMEZUWloxUUdMTGZVckJhMWJk?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 41660f54-5014-41de-1e0b-08dc9f68dd04
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9562.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 16:13:11.3905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxKsTB7TSDzDMgmdMzDEzAowUI12z3EuGmq3MnpTtcnn5IK/uXEIVb/Iai6boUjmUC0mQUXlNu6p1f85p5Xvg80kmweChG5eoRLAgCfdM5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
among which an amc6821 and devices that are reachable through an I2C-mux.
The devices on the mux can be selected by writing the appropriate device
number to an I2C config register (amc6821 reg 0xff).

This driver is expected to be probed as a platform device with amc6821
as its parent i2c device.

Add support for the mule-i2c-mux platform driver. The amc6821 driver
support for the mux will be added in a later commit.

Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
---
 drivers/i2c/muxes/Kconfig        |  16 ++++
 drivers/i2c/muxes/Makefile       |   1 +
 drivers/i2c/muxes/i2c-mux-mule.c | 155 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index db1b9057612a..6d2f66810cdc 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -119,4 +119,20 @@ config I2C_MUX_MLXCPLD
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-mux-mlxcpld.
 
+config I2C_MUX_MULE
+	tristate "Theobroma Systems Mule I2C device multiplexer"
+	depends on OF && SENSORS_AMC6821
+	help
+	  Mule is an MCU that emulates a set of I2C devices, among which
+	  devices that are reachable through an I2C-mux. The devices on the mux
+	  can be selected by writing the appropriate device number to an I2C
+	  configuration register.
+
+	  If you say yes to this option, support will be included for a
+	  Theobroma Systems Mule I2C multiplexer. This driver provides access to
+	  I2C devices connected on this mux.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-mux-mule.
+
 endmenu
diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
index 6d9d865e8518..4b24f49515a7 100644
--- a/drivers/i2c/muxes/Makefile
+++ b/drivers/i2c/muxes/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
 obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
 obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
 obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
+obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
 obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
 obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
 obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
new file mode 100644
index 000000000000..062596869651
--- /dev/null
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Theobroma Systems Mule I2C device multiplexer
+ *
+ * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
+ */
+
+#include <linux/i2c-mux.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MUX_CONFIG_REG  0xff
+#define MUX_DEFAULT_DEV 0x0
+
+struct mule_i2c_reg_mux {
+	struct regmap *regmap;
+};
+
+static inline int __mux_select(struct regmap *regmap, u32 dev)
+{
+	return regmap_write(regmap, MUX_CONFIG_REG, dev);
+}
+
+static int mux_select(struct i2c_mux_core *muxc, u32 dev)
+{
+	struct mule_i2c_reg_mux *mux = muxc->priv;
+
+	return __mux_select(mux->regmap, dev);
+}
+
+static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
+{
+	return mux_select(muxc, MUX_DEFAULT_DEV);
+}
+
+static void mux_remove(void *data)
+{
+	struct i2c_mux_core *muxc = data;
+
+	i2c_mux_del_adapters(muxc);
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+}
+
+static int mule_i2c_mux_probe(struct platform_device *pdev)
+{
+	struct device *mux_dev = &pdev->dev;
+	struct mule_i2c_reg_mux *priv;
+	struct i2c_client *client;
+	struct i2c_mux_core *muxc;
+	struct device_node *dev;
+	unsigned int readback;
+	int ndev, ret;
+	bool old_fw;
+
+	/* Count devices on the mux */
+	ndev = of_get_child_count(mux_dev->of_node);
+	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
+
+	client = to_i2c_client(mux_dev->parent);
+
+	muxc = i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
+			     I2C_MUX_LOCKED, mux_select, mux_deselect);
+	if (!muxc)
+		return dev_err_probe(mux_dev, -ENOMEM,
+				     "Failed to allocate mux struct\n");
+
+	priv = i2c_mux_priv(muxc);
+
+	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
+				     "No parent i2c register map\n");
+
+	platform_set_drvdata(pdev, muxc);
+
+	/*
+	 * MUX_DEFAULT_DEV is guaranteed to exist on all old and new mule fw.
+	 * mule fw without mux support will accept write ops to the
+	 * config register, but readback returns 0xff (register not updated).
+	 */
+	ret = mux_select(muxc, MUX_DEFAULT_DEV);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to write config register\n");
+
+	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to read config register\n");
+
+	old_fw = (readback != MUX_DEFAULT_DEV);
+
+	ret = devm_add_action_or_reset(mux_dev, mux_remove, muxc);
+	if (ret)
+		return dev_err_probe(mux_dev, ret,
+				     "Failed to register mux remove\n");
+
+	/* Create device adapters */
+	for_each_child_of_node(mux_dev->of_node, dev) {
+		u32 reg;
+
+		ret = of_property_read_u32(dev, "reg", &reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "No reg property found for %s\n",
+					     of_node_full_name(dev));
+
+		if (old_fw && reg != 0) {
+			dev_warn(mux_dev,
+				 "Mux is not supported, please update Mule FW\n");
+			continue;
+		}
+
+		ret = mux_select(muxc, reg);
+		if (ret) {
+			dev_warn(mux_dev,
+				 "Device %d not supported, please update Mule FW\n", reg);
+			continue;
+		}
+
+		ret = i2c_mux_add_adapter(muxc, 0, reg);
+		if (ret)
+			return dev_err_probe(mux_dev, ret,
+					     "Failed to add i2c mux adapter %d\n", reg);
+	}
+
+	mux_deselect(muxc, MUX_DEFAULT_DEV);
+
+	return 0;
+}
+
+static const struct of_device_id mule_i2c_mux_of_match[] = {
+	{.compatible = "tsd,mule-i2c-mux",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
+
+static struct platform_driver mule_i2c_mux_driver = {
+	.driver		= {
+		.name	= "mule-i2c-mux",
+		.of_match_table = mule_i2c_mux_of_match,
+	},
+	.probe		= mule_i2c_mux_probe,
+};
+
+module_platform_driver(mule_i2c_mux_driver);
+
+MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
+MODULE_DESCRIPTION("I2C mux driver for Theobroma Systems Mule");
+MODULE_LICENSE("GPL");

-- 
2.34.1


