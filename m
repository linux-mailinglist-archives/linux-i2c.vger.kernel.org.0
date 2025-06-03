Return-Path: <linux-i2c+bounces-11201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD30ACC6EE
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 14:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6BE3172813
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 12:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902CB1DDE9;
	Tue,  3 Jun 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="A8kLr2cJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012028.outbound.protection.outlook.com [52.101.71.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2600411CAF;
	Tue,  3 Jun 2025 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748954852; cv=fail; b=oCQ/fIA6I04/0QmiuIeGJ33V/veXc1RMqVpd9cWMLiLC5aoIFkkqal0CnPor6rPHYMdSru3mucu0GoJwi7pho7s1gUPcd9HKPngSfPdK/vf/5NKTEVvQg6S3b97BO9lpw9dLsbunqNxhDPSPqPoKOOOP/u9g513v2FML0+3lPRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748954852; c=relaxed/simple;
	bh=VVzHdSoWBjLzTAug6qlQIa9jhEmT0+pZgv/5ETFVPww=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kxiQacKgEquKEF0F0KkgQhdwalronybSzpr863PgQVhemH08WBkB2pmj1gT8u+jeEFEsfJlfQBMS/LkuldNIn+9d/QJd/GwPflkjmKQIGrVMILIV/VTbOXP91mAdoUE6VGwNK/dnITJ5uoG7wJtyXWtzGsWhYqpxGW3u0qONeUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=A8kLr2cJ; arc=fail smtp.client-ip=52.101.71.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EERHB1LXr6dyFTZT2o8magZJ3bxmq0Arb8Rfn6hCv8Wr/txESum64X0jqHxCO2Jaebi7V8PjbEVWGeGwS1ZoizglIvfCSSEQKxT7xbi53XAGLwjJeJ6nidAWhy2pMxUoTTOJzCbJpnyz4ymRiTUllDq63mx2cynlTmAZCkfg7p91Z7K8sM9pJizRe6R0W04afaUQqn1JIBQh6dY7UNByqBuh6V+o6bYV6y20Nb7s5ZogxbPsMM3dLtSuTTVIqkyjrTluzMy7prislBovFmgdw8ooD+fsqVtRRJeffkKJ7xCR5jjld9H+eJFU0v59IoNaPVbsQy3DwPpOLv579b2AlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DI+GH9EHg/bJQmwm+CI+t21umN2AwnOZyRTlXOToPmY=;
 b=eV7Uw1kQSIcdPs4wLlOC4ecyDqwIPjw6zIobbgIDW0Ymnu4CecdUa+8uClrZZcclUGPyMdQ9oAXVnncPVrDdEZBQw5nx/Fi4elOQAxIZ71CvhN/efH8wdPodgCovb2h/Tbew9q4sbf18mgjy3WJ/ERmsC9gouBhw0VKhv6erb0uRaGgloPEfjbCdkNg9z1r/BAVU1DuIO68qVcPPuuR3jihX9vntjfGuWsK3vRtkyf3eMqRlr2bQCblXeUbyPZ5Ql77BhSBOQ50e1b6xJQion7qHnq/0jGa1C1OuTPuO7Y5PLpHfwMhe4TpaTfuKr3Dbh2TDtw8tfhF1cu31drMPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DI+GH9EHg/bJQmwm+CI+t21umN2AwnOZyRTlXOToPmY=;
 b=A8kLr2cJeNhDc5q5+1ps16P6OgG33aZP5DFriKqTUo3Qto5m4aPpcZQI7GfyCb647jaZrGMmnas4tFbfUitrC9I4xPdHYBVI49VXY6I8kTuUMpY+fS9S+SU/4XIsLS7VXBCxdP5KkIoRwamGb6sxbDis4hXmJ/ALmnBBj6jlJwmbxfyAdlXxPbTqhGBr3nrjxUfx8S6oEApGrOhb0MCA2Op8ezEtKBdZ/AmvF5Ee8PEjEOYKGvkZJ4k+MFwYaEMZ22i8UgEph32JUMOX88q2lKQQNmyzsoq5LGGhULO4rGTm3OqqUqrJ1R6xCXKQZEtIrTxoaotpkAAg1GDLPLw+Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23) by AS8PR07MB7510.eurprd07.prod.outlook.com
 (2603:10a6:20b:2ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 12:47:26 +0000
Received: from AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa]) by AM0PR0702MB3794.eurprd07.prod.outlook.com
 ([fe80::aea5:bbb4:c75:9faa%2]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 12:47:25 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	peda@axentia.se
Cc: andi.shyti@kernel.org,
	mariusz.madej@nokia.com,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v6 RESEND 0/2] i2c: muxes: pca954x: Reset if (de)select fails
Date: Tue,  3 Jun 2025 14:47:19 +0200
Message-Id: <20250603124721.449739-1-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::12) To AM0PR0702MB3794.eurprd07.prod.outlook.com
 (2603:10a6:208:19::23)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3794:EE_|AS8PR07MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bc2ea4-fe2f-432d-3910-08dda29cca70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?scc/wXzwHrxbcQfRJ0VKaBeKfPQiRGYUhmtiyk1DG0mZl189T6mKIQA5M7ay?=
 =?us-ascii?Q?ANyv1248h8WhHZPe4Q3p1etbAlbAlaWJ/la2hbKe9vBly4rPjmhISG1XM/dI?=
 =?us-ascii?Q?kszgfy3+ykkv2trnmsr5MBoDon0siMQ6D2nn1oMxgQZ3tRJuoaPKQ1Jtk0kX?=
 =?us-ascii?Q?aq7Twl7c8Br9kSKFyIECcgt0BNIEv/fCZs0esPEGwjiPF6HM0vWz3rWA2Peu?=
 =?us-ascii?Q?9pTTgD57SG8uNkCD4zKD1AUjSYlc5gw7Jx0t7lcVkLvYcb7fHqJ1dp6hHTsp?=
 =?us-ascii?Q?SvlDyYTApxDcXEcfWL5SL9RELu1Jd//Vk7h7tZbgohRA1jGH8tfekUir3igB?=
 =?us-ascii?Q?8PU8fQBUUwq41w8I1q6UMueYiU9g4eWEflv0MYG+PpI2BvinHjQKjYOMRM9f?=
 =?us-ascii?Q?Tc7jWlwNvMEKN37PO1ne9+/AlsNZop8sc1Ni2Fq1pJG6jFkOQIQjiJf1Z2kc?=
 =?us-ascii?Q?Z1cc5LYUTZHgwiFVNbrcuLs2Cl4/fbooQr3zSdAlKakMOGAidvbfKe7Es4kk?=
 =?us-ascii?Q?l2riXRycK74jf0u0OQwxrsPjn022hulwgTiySLbDbpHb9sVy+vtZ2yQLzX/T?=
 =?us-ascii?Q?MeCirzZkrWsa/v8P98xHAhSyHsPb11/RFk5okW+neWvUjpF6ImBBTNC0EWL+?=
 =?us-ascii?Q?mmN379J3t4+Vp1bSMymSIrau7y+nDqfXJdfHnwNturkgZYibzBA2w7CWwb9o?=
 =?us-ascii?Q?VIoLNVUvkMYjfZT1/ju99OCaR5des4ajxcPovCNYD7Smm/7PLqgMF/wfdDaK?=
 =?us-ascii?Q?Fs0M3GNmWBrhRjkk2mchoAaBsAjKWCWxxPT+pFGDJz7ruh5wn0RvnJgBXZw3?=
 =?us-ascii?Q?QdW+ICo5PA0rdILWxTUMcEzF82hOMSEMMnNEpHcFwtXlznxIP+CT48ykr8zJ?=
 =?us-ascii?Q?Hi7o8eurr1dPR0nwqDgxYW75AUP++nayaKUHc1+IpMJTpaJkW1dkP8olNkSK?=
 =?us-ascii?Q?vDkF8Pc1+9/MpdyEIPtNVZJ7Ty3pwHoISydEorIcqEYbOlZw3+zVLJki5dlE?=
 =?us-ascii?Q?08gvfP7aU6ENVxRNhAvOgW+PTOYozJD7uN794Unbina6z3NMvyt/4bGNjDyn?=
 =?us-ascii?Q?PpvpmDy13mLOA6Ji2KdsgWcDXx7UWZ09zRVSKdHj+GGZ4ueYP29Uz7STl8iX?=
 =?us-ascii?Q?/Zl8I9LY0v/Ve5V62WBbcQB9GkW9ULlBu9+jaI9W+0BeyXJ004fhyMp/mwCd?=
 =?us-ascii?Q?p34KarV6s/JVzZMBVLm4elj8QkUwWxABxnhU4mE1GqAcCFXlM6PfsqrK/8/8?=
 =?us-ascii?Q?PEkh0VJvLbr6v0at10/tEjeaxZOgHUCA++nUHDbJIjFFYz5bKIxeV7VxVd1b?=
 =?us-ascii?Q?ONQi7tjGo0dbmgauoDqDTfWdfLGJ85HmPNXnDdnW1Sq5WDplsIXIoTc6VmaL?=
 =?us-ascii?Q?HG356kXVS025I0QfluZSXBI3wuOjeX6iyY3ol/4MH4+NIqrO6xkyLnENRJg+?=
 =?us-ascii?Q?zb+8yZ5hnlU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3794.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kPzaW4bWf6bo1Y68EtmT0+7n0t8JhSrXmjUUWErSJqPpWVL5BxYjqb1+nDeO?=
 =?us-ascii?Q?bJNk3MLMs7HSC/eo03MO5KfjaL5Qrtu1XIqgqrICfw2s6JW4SNtGnmOB7LI0?=
 =?us-ascii?Q?JDX5+DcTdtRFE61YtkwZMT4KZkh+nub1K52s7ECEpvFJNffM0psDkHs18LSu?=
 =?us-ascii?Q?M5H9Ztl7xzlGd/GLni3PpF8TR2P5iyukEVZB/I7gs7BbpniKlSbgdFLldGkT?=
 =?us-ascii?Q?fp9MV5V40+hObj8vvbw2/apRVIMU1JR/osxqKQ50XmdRrK39w5DeGN2lgpW2?=
 =?us-ascii?Q?YwUISu7Fdn2zb7G6kjIOHpQG3Rz/wGQ8EUNloIegSmL1r8JRi274+1bqJYOo?=
 =?us-ascii?Q?BBVibB7CACwNErPWsO8kltNm3m5N90p5BDYW2zBfudHY7EyeCAU4XZCH8sAp?=
 =?us-ascii?Q?nmPiuNbPx5ROZq+/8AldyeEzdVy64hgdWJ8NPsX/TO3i5FxaXVWn/nQHo8NP?=
 =?us-ascii?Q?H2zvsQqWPQm2NQ+u6xGZptFwZ+2hmiNL6u+mwnhuTaT8x+af8me9WZBTjPbQ?=
 =?us-ascii?Q?E6Ns81RcZAudtHyufgySNCSl7oZZAlk+Dm9ak49bntQ2Ube9EegiDVvNtzvs?=
 =?us-ascii?Q?PKsGtHrad7JEr+CZLEgrILsjtawoxq4fQGbNxMRf57yCgV2xao2m2SUVCo7p?=
 =?us-ascii?Q?hSR2gPlZlfJFW9RuQNsspFqDauDMvRNEzrtQiftmHHmVXnYS+8QeN6U4PhZ/?=
 =?us-ascii?Q?FF/hzS0vFt6tKcPQ0yGSGLeuOUwGWqJR59zUHF4MqSebaQDxWaDDVU/5IByE?=
 =?us-ascii?Q?iNc48Y2s3BKHQ9vEAsSqqFanBu7b+KZFPqad1sYx3XaI5wtPWWBZ5HMolOtG?=
 =?us-ascii?Q?eEOzc/KyEtSMUludck26SLUZ9LFqzsaoJuWkExZRWiwgRf/B5JeMLoL8VtuV?=
 =?us-ascii?Q?qB2xmfzxIJlCvTL3ft6Pn0grX//0MFTBJaP4dOI2DPSk5JIvPz5hectvpv6j?=
 =?us-ascii?Q?PPN0i89liZvSh7INXf3P1Zvo8XW/tE4UXJNkh8vw3Em+gnvJbkHY0yUAgPt6?=
 =?us-ascii?Q?FrlO7bcKgUcwoX9qT05O2oD0qmfiAI2FXMxGqzrjFXEu58y4gEMAQNZJ498w?=
 =?us-ascii?Q?EhEpHwiw2OnyLEfqplI0tL1jfD9WTIs6oG/lYQ5JtrF5QcCFcUShPVcZND0T?=
 =?us-ascii?Q?UJWVxnSaj6J2y8Wx+keB9131i0vPMmmqNhOAYij40o+ZJKL4r6Px9sQZi8EC?=
 =?us-ascii?Q?7BOg57A97/DSRego17Vc5f47zVTJis4yf/Rk1mInZIAT8+lwdi1tRJaBl1iH?=
 =?us-ascii?Q?89xnB9sdPDkmZEgLihtD7Qj2TRKH6IzdBhMxnZQS9QfljGtlBgGS//nvP/7V?=
 =?us-ascii?Q?BZ2uxaljqr9508+5nijw42KEYePsVwWUL3Sxm/vNGmrvBrmY1ZBFaemm0LWE?=
 =?us-ascii?Q?fGlzHxJQAIF5IlL1rcwpnZ2yUdtbUqVzay4XjFn+6q142TWrRlotX67+EM0d?=
 =?us-ascii?Q?VbabWDthm8bVNeNmVQL85ibK0QocGKsIIru33WC/OwQ+9Itl/hHyBgLouZry?=
 =?us-ascii?Q?Mj9SlPYyi9R42YegKRlqIOuZH3TfIKxVsd5/P9xLOiGsOn3Cdwo2NKZFrvS3?=
 =?us-ascii?Q?O2kUnO+yqO3whuOXr/4fRgMIJJawR061pc7tDtVcfF8+dKMBA6sxzWFdtEJV?=
 =?us-ascii?Q?aA=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bc2ea4-fe2f-432d-3910-08dda29cca70
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3794.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:47:25.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKx97J1/TfRszhLzHH9pSpWEtn8cWrPpc2+ypBWZYWhyeRw+f2Gv3bzIrfLIjOqw5gKRHeBtY4IiwXLoyYxFj+WJhp7Q2SeAs5CyZSj6/Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7510

The pca954x mux might not respond under certain circumstances, like
device behind it holding SDA after recovery loop or some internal issue
in mux itself. Those situations are indicated by ETIMEDOUT returned
from I2C transaction attempting selecting or deselecting the channel.
According to device documentation the reset pulse restores I2C
subsystem of the mux and deselects the channel.

Since the mux switches using transistor switches, the failure of line
behind mux that is currently connected prevents sending commands to mux
itself, so external reset signal is required. 

The following series of patches removes legacy gpio-based reset calls,
because reset controller framework already uses reset-gpios property
and resets the device when channel selection or deselection fails.

Even through the current transaction will fail anyway, the next will
be possible to perform without resetting the whole system.

---
Changelog:
v2:
  * Removed mail header from the commit log
  * Decreased reset pulse hold time from 10 to 1 ms
v3:
  * Make this functionality enabled by appropriate property in
    devicetree
v4:
  * Fix missing condition check from devicetree
v5:
  * Declare dependency of a new property
v6:
  * Don't add any new properties, use reset controller only
---

Wojciech Siudy (2):
  i2c: muxes: pca954x: Use reset controller only
  i2c: muxes: pca954x: Reset if (de)select fails

 drivers/i2c/muxes/i2c-mux-pca954x.c | 49 ++++++++++++++++-------------
 1 file changed, 27 insertions(+), 22 deletions(-)

-- 
2.34.1


