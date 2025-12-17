Return-Path: <linux-i2c+bounces-14636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C3CCAA9F
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 08:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86BF33046BBB
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 07:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D511629BD9A;
	Thu, 18 Dec 2025 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nvent.com header.i=@nvent.com header.b="Xat16x0S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021102.outbound.protection.outlook.com [52.101.62.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CAF2BD033;
	Thu, 18 Dec 2025 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043150; cv=fail; b=PCMYHyCLLkANm0Px2Hd727iAaWnpKO6VqmAbDkFhS57umvu07oeY2gjB4Zhi91flF0mAzpIfup0ruZRwX7qxKTsMG6BJVpstqGgIaR8hgQ7FGeN07BRYvlA+ylrUWxclqMXGvSnaUFXiDk+i+WpSAx1QRIHlNcgTy+x02HfNzrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043150; c=relaxed/simple;
	bh=Svl7fcZMm4cBhwC4MmYZE+xYSm9suoJJZSUqR8ZMfIQ=;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type; b=QpMcryiG4MaTJs3eIxp7fp++yLXKJPMXt6U64kGAwRV3dmkDcdbgp+FoqujBtk9ElcdZlGUfkhQPG9p30c3jINEKjiGPmV1mX8YHN9j1X3vyX1UZVzd6Nui1KR/8XMJ42do7xIm7zg7VCPMLRlKKnKW1wtE4Du8OKR0BnMks/w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvent.com; spf=pass smtp.mailfrom=nvent.com; dkim=pass (1024-bit key) header.d=nvent.com header.i=@nvent.com header.b=Xat16x0S; arc=fail smtp.client-ip=52.101.62.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nvent.com
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvent.com;
Received: from SJ2PR18MB5660.namprd18.prod.outlook.com (2603:10b6:a03:563::20)
 by LV8PR18MB5937.namprd18.prod.outlook.com (2603:10b6:408:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 03:59:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOU4xcvptKQkorxa5Mjs/Rc/mSLNj21oiuKO9qExyBff+0tLlmf2zy95cY3vNajmf18/cMdw1JSlqI6Ei0oOE/fZoh/+eykGzwmTYsBz/egdt7LjkKKzCcsZRoveiuPCzjQms5oc2vQTLbTEBkOlhJ61vzYfzZiWRZaNI9ngeW15U/LiJ0IJdayr77AA3fyLx+jvsm29T2Tks+DMjwdVhvJoVoydf9hBea6HtT4pkGsPGAsQzrqUZVlacADBNeZgZ0+pOyk5sZ3OvHEt3lYojexT10THhMjCReCQAHOxGHqDn4xUHgK9cO5f7Laki6J3bw28sfspHQSQOuC6tI2RPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svl7fcZMm4cBhwC4MmYZE+xYSm9suoJJZSUqR8ZMfIQ=;
 b=u6LikPKvxh1JA8aCKM46NvOKwMtCi94s0Pw1+3jgDouqGh4KivaZHSm2HsOaRgSXVz+kF/RmLBThcXdDSEjHM7QNBOQrZbJc6GNDBdFMUrg43x4kvx1ILqn7DTLKn1j5Xvs7o7S4tKrjQZD90xwcCAzeq8T9iiO/M0d45TQvt/YTliDniA149BrPEmcT/UBpVAZQlJ2RJIIW5l+PhZU8sEVQcpsL+jtQZyGDcPz+LUQgWLLwLLuc+fUUeX1wpeypt5RW+aUkFtWGruyRWlEd7VDkU/1Qr+Ij2nPETi9uRFJb2uwHqwqvq8e5dHLksIJKPEHij/GzXf11GDo6MJX1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Svl7fcZMm4cBhwC4MmYZE+xYSm9suoJJZSUqR8ZMfIQ=;
 b=Xat16x0S1zwr19KKtF9n+GRKMMBd8QSWEBmgK8pF+QE17HB+xtRUX/tWfvZt1jqRG+U8mYeAyK7w6AN4oRq1a244lZlBEBuRBKLFdMjevYfnrRZn8QvCl4LQ4J0YVaVpbDdDXy9Tv+2e6jMos0w7XvnOfU1mfV6zKLHlcgKHXrE=
Received: from substrate-int.office.com (2603:10b6:a03:563::20) by
 SJ2PR18MB5660.namprd18.prod.outlook.com with HTTP via
 BN9PR03CA0684.NAMPRD03.PROD.OUTLOOK.COM; Wed, 17 Dec 2025 16:50:09 +0000
From: "Kishore, Bayyavarapu" <Bayyavarapu.Kishore@nvent.com>
Date: Wed, 17 Dec 2025 16:50:08 +0000
Subject: Recall: EEPROM: at24: Why is at24_io_limit capped at 128 B? Safe to
 allow 256 B on fast =?utf-8?b?ScKyQw==?= for M24M02DR?
Message-Id: <RWWNQ2Y70SU4.503SZEVKAV0R2@sa1pr18mb5901>
To: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 46fbe815-3cd6-07b0-ca6c-3d911d21dc68
request-id: 46fbe815-3cd6-07b0-ca6c-3d911d21dc68
X-MS-TrafficTypeDiagnostic:
	SJ2PR18MB5660:EE_MessageRecallEmail|LV8PR18MB5937:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V3UwMDhMUDA3MmQwVEhRVUdaVUpQQ0ZvdGVqeXhXYUtqZXRiN2xpTGZXQk5V?=
 =?utf-8?B?TW42OFF2ZEMwWTg1b3lvanRncHBPRW1FUUdzSmNjR2N1Sm03SmhqU0JXVnBw?=
 =?utf-8?B?ZFUvenlRN04wMkthZ2VRbWFPWHl6Q3JXb0FaWkpTRndoTW9ucTB0VGIrdFRZ?=
 =?utf-8?B?S2xsRmU5WTZrNUxrbW1Dc2NNR3ZZQWZmclE4WFNGU1hzR3pXVUZGbk94TUtF?=
 =?utf-8?B?clVhOUV2WXpUZTZRTlA1MGdiSEt2QWxrVUhsb3YxQk1NbEtqV2pScktvNWlB?=
 =?utf-8?B?bXVNUTJuS0lPb1FWU1k0dnlJN01WcFlGRHVQVnJ0T2dUUEZuNmFqRWNQcjdH?=
 =?utf-8?B?SlhXLzFJMmgzZ0p2Q3hVSTBFRUUrWnF6cjJ5Yld1QjMzZWFjRDJ1aTh5MVdi?=
 =?utf-8?B?cDJBZmQ3UjlwZEh6WE5MNG9SeHJ0YWpldEcyS3QzRjVyMkhBYzZhTEZqVjNQ?=
 =?utf-8?B?ZnFpRG0xRnREcVZYaHFIQ29wN1pSZ2hsZXlDRGlQQVRVaERFc2Rwd3cydElB?=
 =?utf-8?B?TFhzZnhsMVlEUmM3R2x6REVPVlozSTFHK2FVVkJyUnF4UUFzNnc0NGRXMFow?=
 =?utf-8?B?eU9NdHZYcmE4SW81Wi9ybGUrQUpyVVkwSFY3ZTNvVDJ2d09aN1VTQlkrbDdR?=
 =?utf-8?B?WGtNb1RkczhHMjFwVENFdUZIekh1YmJvcVowN0JWRmpDR2UrKzNpajFyMWM0?=
 =?utf-8?B?b1hGdmZaTmt5NmJkTXJWSGFEdzlwTUlGVEpaczZlZUl0ekhuN0NhWGJJMjR3?=
 =?utf-8?B?TUs3NEtVTTFHV0VkdWQ3MWVpL1ptOTRWbkdOZ2FrV0V2WlB1SXhDRVFhTmpS?=
 =?utf-8?B?c0QrN3pocDVEZDJaa0NwV1ptWnVSTzd1YzUwcjNuRi9MZGxzdUdaSHhvRkhX?=
 =?utf-8?B?WEtHN3hiSUJUQ2VadEkzZGJ1RzlWVkl0elFpZ1NDUVh3MkpaTXllWFRWMit2?=
 =?utf-8?B?Q2czYmN6R082UlhQZVhrL3lSWnlvYVRMd003KzRYNEhnR1RBRGZkU0x5a2xO?=
 =?utf-8?B?YTYvbnRnb0tTMUN3TE51UHF1b08rZUFkNmJFSi9ld25YU3ljTktpNGxMUWZi?=
 =?utf-8?B?ejFPL3N6NkE5YXc3R1kxT1U2NVkwbVpRWlQvRStsaEpZRnZnMHJXek1KTXVU?=
 =?utf-8?B?UW02SURXR3o4QTJUSjA2ZFE3NjlQUzBiRHJPdVZURzVvU3Erc2VEU3p2YmU4?=
 =?utf-8?B?djdBTm5FZzlxbHZYRlVKcWhvWkZ0VmVJb3I5dDdHK0FMbGNUVUhRTXdUK1lS?=
 =?utf-8?B?NW5qR3N0MHJ0UndoRUwrWEZmZlVMbjhqVXA5YW5GU1pyeVlNWHZ1dXp1QWwx?=
 =?utf-8?B?YjVRWHZ3dzZ6UnEyMzkydEhTSmxJOGxUdWRzakhMZ0xqck5QWVZoSHAwc2d1?=
 =?utf-8?B?VmZsOWdNYmsxbXp5ZEZCRytoZmo3WXkxcU5hTlVvVHlXVWt4Um5MVjI1VUlY?=
 =?utf-8?B?Mm9nRGY1Tm5ZZUtOMlp1cTNlelIySy9LMS8xdEd1aER1RjlzM2pKdGJRMzA3?=
 =?utf-8?B?QkZweHh6MVFnRWZNWllQMi9tVUJlU3EwSUVBNmxNZDlxM2hJSm5lU2xxMktr?=
 =?utf-8?B?QVltOE03NTJyYTM1RlVpUlNsOVpINXlsWFRBaXhuU1N4TkJmWjFDM2daUEpW?=
 =?utf-8?B?ZFFOdVl4QTdNSVZUZ21WbWY3VVU4eEVTQ1R1U0JZNHFxaHZvaGVYNElwYXdI?=
 =?utf-8?B?azhrYnFKVDJlNldNWDhNT2RRcUduSDNMN2krWnBNMXJNL3ZxOW5vV3I2NFpY?=
 =?utf-8?B?Z29pUFJOTThuT2xRZHRDYVRWZEJOcFF4ZG9uZXloZlJUb0c0bjRONTFkOUNv?=
 =?utf-8?B?eFdueStCNWNVblVVcFg3MDhJVDAzY3QxVHd6M0lPUERoYnNCK0Q2cFl3eGNi?=
 =?utf-8?B?VDUwek1BMkxlUng3UWRzcDZHTGxGdXpTM09rVlUyUkNTUFEzMWh2b2lzZ3d5?=
 =?utf-8?Q?5KXobtuBEdWzFxl7cZt6V3SX/4L6tHVu?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 /1cV1BI8JGLQqAW84qzwYiS44/r/wYGGkb4QayTi1DSNJL/NmkgcAKFmWLf6vOBNPBttDi8NwbeHu3q+/ZY0xHAUbFAqJWMcWXcXymFrJ6N94GLmv7lrW7kls3dEoTc1VQH94uxRXUF6GShcdu8Xrl893CmQt9yrm00af7CM7HF2dpPcua7a2bsduDvzH+HbpwhwZR1+RL3amXvTDT57JtOxQ79IyeSoKInNOvdTkx3KQ5rWOvieipC43mGx96+Ht9ZlI0QuWYjmnI1TWqzNMF0URTBJIHToyHtegZdwzV6xcokLvun6DM5MumFzNqU1S35uYd7OPEMrFfSXXFgb27sWzRSn1wiX0tm035hXERNk9zhpGBL5bjma06x4kUpWM+j6r5V304sS8QmZ5C+IgDu/uEZTwv8s2i/Qf8z+yuw=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-SJ2PR18MB5660
X-MS-Exchange-CrossTenant-Id: 383182c1-2cb8-4f06-be5c-5d1a58e2137d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 16:50:08.3142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id:
 4046e55a-2309-4b88-747a-08de3d8c570e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR18MB5660
X-MS-Office365-Filtering-Correlation-Id: 4046e55a-2309-4b88-747a-08de3d8c570e
X-OriginatorOrg: nvent.com

Bayyavarapu.Kishore@nvent.com would like to recall the message, "EEPROM: at24: Why is at24_io_limit capped at 128 B? Safe to allow 256 B on fast I²C for M24M02DR?".

