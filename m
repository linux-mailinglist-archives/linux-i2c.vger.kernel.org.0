Return-Path: <linux-i2c+bounces-7127-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF898B6FC
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 10:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64FC1C20D0F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3407119D8B7;
	Tue,  1 Oct 2024 08:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b="AsXKdEh4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2136.outbound.protection.outlook.com [40.107.223.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7416219D891;
	Tue,  1 Oct 2024 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771446; cv=fail; b=r3L2Kq7M2S94mnp8aJL8MHztaLvvq/Xm+TU3MCojfWMx4QIiUTJVdDmZ2KzMHXykoWC2WzSYwVooXUZO8Rv52MsA+mJHHIAJJbBrrWRMSjDOOprysnDE1ZOU2C2u622xGwPgyqlM3/DD0NC2vF+Ko53HaOSPpGFZ7rm3DSl6TVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771446; c=relaxed/simple;
	bh=vzLautisdS5o2TtFwnS5eNutf3A8L5ep1YNaJMlxaU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CvVJPVWJ1l40mNxTFhyeh/f2FfALy9RjfeKBU8K/5C2kXVz9SZOWIn6G2di3TH1ArJrF2WxWXAn1VgXCpTv6pQPmHelxWCu7gu1wwCjhVQvQBFh8vT/MLvXZp0NBIQdxDdI2F+5Txsk2NERvwYD84+DxDBjLvuwoE2CKwWfyzoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us; spf=pass smtp.mailfrom=kneron.us; dkim=pass (1024-bit key) header.d=kneron.us header.i=@kneron.us header.b=AsXKdEh4; arc=fail smtp.client-ip=40.107.223.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kneron.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kneron.us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TU/wRCmH+6CZD8MCb/4sWdoIcAURB4rhsv9PnevgzW5aIkwu09reg+Ywc5UkaircTa8lklEd7/LJgsVjFXGPquZStc5D5EaxAT4pcmXsMYBi02pe6c88Rx3miHUu+7NPQlKiZSvwjGdevqDtqXkOGsSOU6IenbW+JIxsDlRcS6LVqSt7pha2x0Wewsif13KMf1Hz27nar2vNiKPe0Sx1M+7yr3QKSZFl/d6DLkOkMTgo3q0QHlLxVZ8UYF92YBPWFd3nDfifii1cCrG/YTiylcqxtgL5CTl/ap8vg0IMzqQM1Ve/NCRpqJYci6aj0amKD0dOMNu84AcLLNaf7Ud18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iW+ELaHXtEztQF3I5Dr9Gm66Pty8fqG2LdZg4t2ylo=;
 b=ITEpNt/HUhCkFvtIiT7ed00sMdw0YqKquEaA8HlOAJno8efPt6YkkL6h8S4e4Qv+Hsgx6avwwtyytfAb8ty4YM1v9Coi66u3aKzDs+9Lw0QRxsyu3wjrE7OH7JX+yE2STVjqRoQKzSuQHboopKDslOaKHjoDxkOpYn02RmOelDbwlSSL1bXImrlndIdOcaXik9UWvUHMmvbS1ZA7ECt5RAl8Tppmk9JEZ1CwS65FfXH+HqkGYmauEV/6LVBaK8BcDAdALCdM0b5ulI0sVlWLm3+oo8Ssgq9FtfU/NDmizxInMYILssLt93JhQ08sNLeS2GGUz3QX0eTjpI0KUbjlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kneron.us; dmarc=pass action=none header.from=kneron.us;
 dkim=pass header.d=kneron.us; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kneron.us;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iW+ELaHXtEztQF3I5Dr9Gm66Pty8fqG2LdZg4t2ylo=;
 b=AsXKdEh40kVTV/xEibP5r15EuBmhe4GDU3Bgp25NEPXAxM/xBFBU1jE39eg0DnWJ9s79FmEMhgLxqV7AppB73g5+QqWuNLOqk91LP6vh5CBgWunbJ6dj+cZ38FoYQ18vzzysK9ffshWCZshi2LlXNa7NDMA2Lm32UdV+eC1YYWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kneron.us;
Received: from IA1PR14MB6224.namprd14.prod.outlook.com (2603:10b6:208:42b::6)
 by SA3PR14MB6462.namprd14.prod.outlook.com (2603:10b6:806:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 08:30:42 +0000
Received: from IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94]) by IA1PR14MB6224.namprd14.prod.outlook.com
 ([fe80::c527:653c:698d:3d94%3]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 08:30:42 +0000
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
Subject: [PATCH v3 2/2] i2c: dwsignware: determine HS tHIGH and tLOW based on HW parameters
Date: Tue,  1 Oct 2024 16:29:34 +0800
Message-ID: <20241001082937.680372-3-michael.wu@kneron.us>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001082937.680372-1-michael.wu@kneron.us>
References: <20241001082937.680372-1-michael.wu@kneron.us>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::18) To IA1PR14MB6224.namprd14.prod.outlook.com
 (2603:10b6:208:42b::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR14MB6224:EE_|SA3PR14MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: e3651cc5-f981-4ba3-e82f-08dce1f35671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|80162021|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjZNWjhMZFNZV281Ni9SMWpWVCs5dGVPSWM2bERKUjBEYVp4WmwwT3dYYkNV?=
 =?utf-8?B?cjhuaTJJcGVVdzhPYXNYY2l1Vkx0emhORHU0akZlMXhLTWJhRkdzc1ZPcEt5?=
 =?utf-8?B?V0dsZ21aUm5sMGR3bkxTMEoybG9ETUIveTB3QUVCdG9QcldITVFmYUdYM3NY?=
 =?utf-8?B?ZUc5cmhJbzlENDhhTXhwK3hvQ0J5ckRvcjRXZ0taUW9BZzIwUXQzZTI5NzFT?=
 =?utf-8?B?QlF0ZjVJc0VrR1c5dm5sNnFqS3Y1Sjlncys0M3RHNnlURjJQTFdpQzZRenor?=
 =?utf-8?B?NlZpb3hkUGQxYThGMGpxeEd6TVREdVgrWTdwUVFIdHJIUzBNa0gwTmk2Rk83?=
 =?utf-8?B?ZXVISmtvK0JhSkk2WXdxQmFWcXdRdWdLUVB3MG4rTGhiRXE1Qzd5N2REQ1l4?=
 =?utf-8?B?VVpudE52dk9rck5aYTkzWHFudmZ2RUVBL2liZEI1SHdKRDlvZTVVd2dXRXY3?=
 =?utf-8?B?OTJLU1ZDUlMxdi80N3hsSFVid3Njc2NCYnpmMGU5dnZtbFNZN1VJbU9sdTEr?=
 =?utf-8?B?NXNhcDc1MXlxbmZ0YzBZL2NHUDBEYSs3Y1MxbjhHZDB4Nk9CRFZEVGdUbFdI?=
 =?utf-8?B?SWU5MHhOUHd1T3FrL3pJVlJaeWFNM2lFRlUwS2ZTUzl5M2ZLT0VxMnpGQ1Ns?=
 =?utf-8?B?RjJpMmNsMnROcUdvL1VET3dpWW85R280bEZEYm9KSS90Wk9Kb25meWw4cUp1?=
 =?utf-8?B?S2hKWkc2VmtFaVp2M0ZvR2ljWk5ZZUFYRFY4SWQ4TkhEYnJvdksxZDh3N1pO?=
 =?utf-8?B?eVZMZUJYY1liNnYxOTlXMTdqeGhFRGdRVUt3MCtYZEY1VFFxcTArWm1jUGFK?=
 =?utf-8?B?YThOcG5FTEZzRzRpMTk1RENiSWFybExaaWFSOHZDWDZJVW1Ec0xCbVJVR1FD?=
 =?utf-8?B?blh5T04wVy9DVU51ZGVnZWdjYUVXNzBGenpyTEZ3U2FSNnp5T2lzSGhtU0Ez?=
 =?utf-8?B?ZCtvdUlMQ1ZEMm9MeU5CeEVZcXdJQ0Q4MDZWLy9rV1dKYTl3QnUxU2VIQXdI?=
 =?utf-8?B?S1gwSmRmN093L0JXZklXUll0b3BsYTZtMW9SaERBTmZ0a3ZSaUlaOXV1ak9j?=
 =?utf-8?B?UE9LUHJGc2pDZTY5dzlCem9UY1JJWjUzak9kTS9kUm5tdHVCckJmVG9Ja1BS?=
 =?utf-8?B?MnZwdFdrL1FNb3I0Zmgwa056TVhwVkVYakVMM0ZCM242dzQvbmcreTVaMk9G?=
 =?utf-8?B?Q1o4cDB1U2dScXZTVE52M1VESWR1VlRQUWEvbjFhdVlmZC9Ob1pQaFhZcHNK?=
 =?utf-8?B?UksyaWplWDZFRUduckpmUVFnVEVDMHVpYzZuMm4rdzIwR3A3NjNKSm5EZDVB?=
 =?utf-8?B?U2xlQ0RjRk5CdnFHeTgwczAzSDNhRXJwN3hCaUJXTDFWMzRSMXFvMjUxSUs2?=
 =?utf-8?B?eXV4NUxWVC9YakswZjNYTXI0cElWNVJLSTlwdWFVb3JaRlhLczB2UElNV2FU?=
 =?utf-8?B?eWtyN3dGTE42WGRTbWNhYTY5alJHMjIzZ3J2d3lrMUtnZkpOVlJ3ZkNtZk1Y?=
 =?utf-8?B?am9DMXprd1dZQVh2ait5SEVvdDRaeUc2Z1ZDc3YxOE1YNWY1L21WenNhcEhX?=
 =?utf-8?B?S0RmWHRqSkhZYjlXbjIyWTdNTHZXY2hEOWErS1VUVUZmbDZhdjZwa3ZGQk9l?=
 =?utf-8?B?ODd1SEh0UkxnZnA2UlFZRS8wS2dQVnJOcmNKdmFrQWthdHF2N04zdkJoMWhz?=
 =?utf-8?B?SzBxY05zaTJjR2VBajdjMDFsdFJKTEFTak84b0JmT1FKUGZKbXRtS3Y1MFVE?=
 =?utf-8?B?d0pzMytnM2FCYmVNTGZROERYRS9yY1BHcnJnZlM3NmtuUWZTN1VYZVFEYmlG?=
 =?utf-8?B?cDZVcVlweklFc2pZUGxrQzFaeEpFY2dxckFoMFRyYTdjaWlMTHdVZlNPYTQ4?=
 =?utf-8?B?N0FZRzRxaGw0a1dNOGZ5WHZPbnkzMGlCVTc2R2xDQ05XTUt3UkhYNU90MzQr?=
 =?utf-8?Q?KnSn/yPv0JYtUKrDVLypNoVXRQpuwQqQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR14MB6224.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(80162021)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXpKUDZzSEtHWFV6TlZnTmhBVm4xMmpMT3ErU3VQUVhCdEtRdXYxT3BFYlNt?=
 =?utf-8?B?WktnaURsYzJ2NjFRQ2VhNWhyeDN2a1dQVFgyc3ByWGRkM2h0bXFoMVd4bkcw?=
 =?utf-8?B?WEIzNndwdDhRZjZmcDlyazFXY3pXQWJMeWtpVU5DWW9lWjlpNjByNmNrdDB6?=
 =?utf-8?B?SjUvSUJFTUwxZzJWTFBnR2x4Z1F3L295TUtNWUdLZ2piQlFCWjZaMjU2ekdm?=
 =?utf-8?B?OU1IN2ZBL3NhYkhQUDFEamJHSUpRbDJVZzRZMU0wV213VHhYbG84anZnYXZp?=
 =?utf-8?B?d3FYQjZFUDBES0FIbU5mN2psb0FZM0RpalhGYXhSeVloM1JXRlFHV3NHTUZr?=
 =?utf-8?B?N2huK2g5Sy9JVFJFa3hPNVZoaXc3ZzFiSWoxSlliQXZUeHo5MG1ubzV5YTVC?=
 =?utf-8?B?V003U21zc0NjZ3d0TkhoOUYwditZUStBdVBIbTNRMnM4MjJIVkQrR2hMa1RZ?=
 =?utf-8?B?SU9vekhxTWhsVVhUWVVUSnlqUzlCTGZNQTZ3bkF3NDB4ZUFsbVhoUWJhaEhZ?=
 =?utf-8?B?Rjg0Yk45VmhmeUYrRXJPN0pCTXd2elZFcXA5eDd5ZzdkUnRBVzFKcEIxQUV0?=
 =?utf-8?B?SjVKcUluZzJrdG91dTlqR2o2dit5dEFpWE9WZHZicnFVbHdxY2hzODVBU1Z5?=
 =?utf-8?B?R1FjRWZDemFJYmo0VnMrbmcxeHY0ajFnUGNNMktEZjJyOVdCQUJ5clRjUGR1?=
 =?utf-8?B?ckJqcGNnb0k4TUxLbEo2RUpXUmtRN2pzTHlSaGYxeTFSYVBYb1BaWVBkMkJD?=
 =?utf-8?B?Y2pBZ0dpK3ZlWEpVcnl5V1cvbFJ2Y2VUWVdJbmpXOFJFVlptRkI3OHpyT04v?=
 =?utf-8?B?MkZObGpDT0JiT1I0ZHR5L1ovaE1vMXJoazdqRFFRK3ExUVEybU00dGdmN3Uv?=
 =?utf-8?B?YnNsOWFHMkJsTVRubkF6aytlL05VdWUzQjJXK0NmcDNjY3RoNmYzN3dMcXd5?=
 =?utf-8?B?a0dSTGxXOVhNZVo0RmxaUnhNSkpRQVQ0UStVQUdHN3RiOTgwUENSRzlDYkl0?=
 =?utf-8?B?c1NIenJVbXBHK3hLTEg0eUJJNDhsRUZTd0VjS2pHRGF4SDU2WTdkSmM1UWc5?=
 =?utf-8?B?VUZua0tNQUQwMkphVkIrMHlxVERZZ0lZS29IRzlqWEQzcG5yK09Cd3RyRUxM?=
 =?utf-8?B?b3kzRVFxc3ptWitQaDhPM0Q2WnliS1BlbENib3Voc3dPeVB6VWNVWFlxbnN6?=
 =?utf-8?B?Yk1vZThheUZIc1gycFJZbTdnYkMxQ29TWFU3a1lGRkJFaHAybEpKTHpqbUtH?=
 =?utf-8?B?TUNDWTY4cHgzRmN5UDR1Nk0xTmdRWGljd0t1OVJlbWxLT1VqMnVqWmx0NmRp?=
 =?utf-8?B?QjVWSEt3TldLam5JaGtMTEkrMmMyZFhoTVdITGdNRlJqZDdwS0VDNllZeUt6?=
 =?utf-8?B?MUtiZnhCQ1pSUUorSG81eTloRk9pWW5SeTVZZC94R3YySXdCWFM0NnlBT0g5?=
 =?utf-8?B?c21uYlVFSnIrakYzUjVjc2t0QlJoL0pObjU4WmVETXoxWVZUd0hCNENpd24w?=
 =?utf-8?B?dGdkZFhzV2hQTm9vazJsTlZwY3F1TFNTRkhaWk1DNG12NEhVRitnUjBNUmsw?=
 =?utf-8?B?YjE4VnJMM2ZESFNMeGt3YkVBbnFScGxMYllsU2E2OWtVcnRPbjZ4S1ZVanAx?=
 =?utf-8?B?SnRZd1BQQVM3T2c5NUwrdmFhd0g2a0hJcm9ZRFkxTHNudmlLeU9LN2dCRENZ?=
 =?utf-8?B?dGJ0NWt2amNkTFpyZ2lLcWp4bDRQNFNhc1VYVWcvRkplVFN2a2lNWm5iWC9k?=
 =?utf-8?B?bUZyRUNvRGpOZXY5RTE0NWlvdmM3SWtXTCt4cnhBbk8yNWlJTExTQVhrUWdV?=
 =?utf-8?B?UGlSOHZlK1FId1llTFcrOWJjSU5qKy9vMnl6MU9yc3R6TTB4RWpQUWlwWDY0?=
 =?utf-8?B?b1d5SXppN2YyK0Q0bHhPN0VsMTdSU0luMWZZUVFjRjZNWk9PTTJZWmErV1o3?=
 =?utf-8?B?NnVEV29WeTNSbU1kdFZpZUJZYTVoOTIrM3dnRmJ6TUxvVGVnN1BrU21PdnN1?=
 =?utf-8?B?M052eVJBZGtuOEp6c0llY3hydDJHQlFyMkkvQUJrMHhaSkFTRHhwU3NobzhE?=
 =?utf-8?B?bkZMMjFoS0wvaE44MXhEejRBNENYTEdVRUlxT3dobkdwWGdvZklrNGk1aHNQ?=
 =?utf-8?Q?NqxH/fNnvByZyD8w5gg/Q9R17?=
X-OriginatorOrg: kneron.us
X-MS-Exchange-CrossTenant-Network-Message-Id: e3651cc5-f981-4ba3-e82f-08dce1f35671
X-MS-Exchange-CrossTenant-AuthSource: IA1PR14MB6224.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:30:42.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f92b0f4b-650a-4d8a-bae3-0e64697d65f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ns7wg3OVzMJLUdnykfTlwfCbf/o1g7FParkyAoZhfhwrvbXlHqB+24S2SpEp/elGhoE+cSMAFtTKFBuyJ+XMEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR14MB6462

In commit 35eba185fd1a ("i2c: designware: Calculate SCL timing parameter
for High Speed Mode") hs_hcnt and hs_lcnt are calculated based on fixed
tHIGH = 160 and tLOW = 120. However, the set of these fixed values only
applies to the combination of hardware parameters IC_CAP_LOADING = 400pF
and IC_CLK_FREQ_OPTIMIZATION = 1. Outside of this combination, if these
fixed tHIGH = 160 and tLOW = 120 are still used, the calculated hs_hcnt
and hs_lcnt may not be small enough, making it impossible for the SCL
frequency to reach 3.4 MHz.

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

In order to calculate more accurate hs_hcnt amd hs_lcnt, two hardware
parameters IC_CAP_LOADING and IC_CLK_FREQ_OPTIMIZATION must be
considered together.

Signed-off-by: Michael Wu <michael.wu@kneron.us>
---
 drivers/i2c/busses/i2c-designware-common.c |  5 +++++
 drivers/i2c/busses/i2c-designware-core.h   |  5 +++++
 drivers/i2c/busses/i2c-designware-master.c | 23 ++++++++++++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 080204182bb5..9599be1de775 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -380,6 +380,11 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 
 	i2c_parse_fw_timings(device, t, false);
 
+	if (device_property_read_u32(device, "snps,bus-capacitance-pf", &dev->bus_capacitance_pf))
+		dev->bus_capacitance_pf = 100;
+
+	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
+
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (is_of_node(fwnode))
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 1ac2afd03a0a..44c97bf15843 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -240,6 +240,9 @@ struct reset_control;
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
  * @rinfo: I²C GPIO recovery information
+ * @bus_capacitance_pf: bus capacitance in picofarads
+ * @clk_freq_optimized: indicate whether hardware input clock frequency is
+ *	reduced by reducing the internal latency
  *
  * HCNT and LCNT parameters can be used if the platform knows more accurate
  * values than the one computed based only on the input clock frequency.
@@ -297,6 +300,8 @@ struct dw_i2c_dev {
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
 	struct i2c_bus_recovery_info rinfo;
+	u32			bus_capacitance_pf;
+	bool			clk_freq_optimized;
 };
 
 #define ACCESS_INTR_MASK			BIT(0)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e46f1b22c360..3dbc94db94a4 100644
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
+			 * If dev->bus_capacitance_pf is greater than or equals
+			 * to 400, t_high and t_low are assumed to be
+			 * appropriate values for 400pF, otherwise 100pF.
+			 */
+			if (dev->bus_capacitance_pf >= 400) {
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


