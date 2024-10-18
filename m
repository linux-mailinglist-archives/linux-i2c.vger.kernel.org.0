Return-Path: <linux-i2c+bounces-7474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022A9A3ACA
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 12:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E07D21F290D2
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 10:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181142010F8;
	Fri, 18 Oct 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="ODXLg/EP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17381201021;
	Fri, 18 Oct 2024 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245831; cv=fail; b=J891GzGC+8hHmCKPc3pe3ruuPduwWovGvOVR6zDQAqXgct0tAMnSz0TJ3qyvg9/h/a7HCtYYJenyAN9KOg9l/cc/YRXhCJeDPPrnbmo6vm/tTflImKy7nJYDJ8LbM9FijhVT7zZ+f2E7iOz/nqmqCagKI/Fq4I+Td3fXMnniyNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245831; c=relaxed/simple;
	bh=TmnMzh5c92yUSze13ZCLbShm5qzaX6KO8OFnYi1pCiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XrMu+ZYsFdC//L1fcPHUXI34KYNckBGIpwuOt3xzAfWHP3NHSfw+NmKXWb4DQqYB23jyUrpNe8vw2h/MM+rALDhWemRaIgdMOidMhu78jHrcwVg59IDX8zSV8AT2sjCrixX9dsc0yg2vdVH/f1tniTvSDBLVjF1EXMKe2uPOkhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=ODXLg/EP; arc=fail smtp.client-ip=40.107.105.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6JIGUmMU2mZ4jiSNyV7wTfJZ9cewFQOnn5gKZMWcb8cA8RE9wW9QZkB/3iaAWsSPOi7vuoBKx3qrDlaQRULMm52FQzydsHnvJS9HTXVkdE4KGPop7nOzeXb9duz2L6jdQ5rMvIREvAvcVhUwOHpBX0IP2191HNVpFvUFaf/Ooj+KWHq0iZlfp9/CUB8JeoUasSRWvo6b4LM9/EEsnJO+CmhN0DccKb0dRKOI9c8goTLLEAWvp/nujRcNK5FF+PsyH3bKl4c0YrUeOo+W90yhWaFtyuj1z731JYOS2/5FvBavIcexCxyxeG1UE0ovyWB3u4Yey3r9n3k6PNTgwjYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjQMURV4gQr9pJT+tqUBIwCq/AgQXF2fe5c2d0d+RMA=;
 b=RmBm1XRb4+ppZpBZ8rcUmuRVWbF1eLauEzNRiaVNXiT2yYerKRVVnRKPE0bgDgD2Rm9G0aMkLCupCxG0OkJFO3kjmcuusFEdDRntV/sdeV8teTu4/ZpiatAriOgJ5uLP5Ge8hFlB0i/NddZ8YwDchWtKcccaxx4u7fkhbYqE6S5PfFcEBjHxpLs20v8iaF2eAROnCU9q2w9+yWQS14ZhEjxtWECopco+naD6qgt6ZMnlpNjnoETtk7RsvcPppoz2ZGGuXYz6DvyGtJEz1MElQNVblRa68/UBtdP4MjsWIpAeKxG10WDilDNqiuu+1XAXdnT75+tzrQfiJ5eNU0HPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjQMURV4gQr9pJT+tqUBIwCq/AgQXF2fe5c2d0d+RMA=;
 b=ODXLg/EPEyz+JF3BwU1t80iCOLDY0q3AZo9kR39x/jK5El1w23Cne0NHXF3DdB/9eTyin6d/yrbxeRCGDWtufgmfbigKdVjpJScLopHDsj5SuqCoCvC766leFby91DF7kVDEFZE4spQMunY34f9Tv/CiW7mWviROVC8B/0zxsSGDYvx8V7n+OWPMKi/y1nt74sSwwbpTgAjmJPeT18dLymA26v4z0r5D5BT4KMCwCi3BOd62OaTzglVbn9ntS/0EoPX9KQWW90uNWTY+QnwNq2MgMj3ClBFMLm/HD4rcbm96ilD2+R5rlfbx0MC4xsNpxaIpNpYoXXd2pLDphQIM1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 AM9PR07MB7139.eurprd07.prod.outlook.com (2603:10a6:20b:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 10:03:46 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 10:03:46 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andi.shyti@kernel.org,
	peda@axentia.se,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add timeout reset property
Date: Fri, 18 Oct 2024 12:03:37 +0200
Message-Id: <20241018100338.19420-2-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018100338.19420-1-wojciech.siudy@nokia.com>
References: <20241018100338.19420-1-wojciech.siudy@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::13) To DB6PR07MB3509.eurprd07.prod.outlook.com
 (2603:10a6:6:21::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR07MB3509:EE_|AM9PR07MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 006aea6c-8a39-4b8f-c9fa-08dcef5c27b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y1Xs3Y2IOZDFXbMVscJKOWY+/SsiPLS3MMcckjILeTo4XolYymv8JrLmRvLd?=
 =?us-ascii?Q?7HTFxSwR1MY2JWv5VXhczCtISBZqogfAtGDOCfzifOPN/IhbMfWMFL6kCXeP?=
 =?us-ascii?Q?6eAFv1ovbBpuMvJHOqWbVvr1bgzqdqoD5af6XmXGoNB5vbD1JTh/rI2FgfvH?=
 =?us-ascii?Q?bAxbg7qerJZyCzoPl2iBJHL9NnniXQLYnl3d/89WgCZcBtW1N/sjCGVNRDmo?=
 =?us-ascii?Q?r568ak5NHG/5Rjas63TQqqQmaEbXRQkg1rk/65YhtnCip3cVKGbTh5lW5RXn?=
 =?us-ascii?Q?I/V1Q9jQwntFNjoRNDEqcghCaUmjNYPdXShXldgWBp5c4A3AhAPcn8+94uqM?=
 =?us-ascii?Q?tuq/ubf73nA39YXgpzSpx+MynFuGZnTAP/2GudNxfTBeld4+Mf5EwpMGBeT2?=
 =?us-ascii?Q?yWTxYWgKR7EY14IAZt/OmiwT3OEAszw40XDEIjZdBJS8eeG6SEghR0enLiYS?=
 =?us-ascii?Q?m9ewVPaKWdbxx1SnBStGKWAcJyjFEvUrPN9FnnYtRj+5z6bq/tGGwtaHCGzX?=
 =?us-ascii?Q?o8G0RYB3cFJ9PHiR9AJees8nwkh6Sy3tptzObZfVvG+RhTo6r0chXQVeza1z?=
 =?us-ascii?Q?YGzpB9GBiwc2AAZs4AGHMI9bg+OpZDBjxZUtt5xpj5kXRXlV0WLjjlaW7r3f?=
 =?us-ascii?Q?H9+tZEEn9jl0adyc8wTdC+ETQ3Sdhv91oGOoxeBCvNG4uauhrG/4p3PbFM+D?=
 =?us-ascii?Q?AinCTqP70MWe2DV08FmUBOmnuopqf9z61564vgm4CE8DR/2i++UbJ5OPgkr/?=
 =?us-ascii?Q?EFnv0LnOM3kNVtYZ3zAe4gItrd2zYaBH/qaPUfQnkur2peNlzbgVIUBQoOdz?=
 =?us-ascii?Q?y86iD8HScqdeqhlX8LtokL/gwm2Ot0Qbi0TB6Ge3xqxSYylMwOQyV0KWVvI+?=
 =?us-ascii?Q?gG7bUEX8Tkb6+scsNHg7ZkoM3St5kyfTyMLCwnEiU4upa3bUKVS8t/3aA+HC?=
 =?us-ascii?Q?K5Xa4eL8CruR0QNp3i2mYjgmIlbIu9qTERIu1cvUlHykocqd/UniUPYwoN0e?=
 =?us-ascii?Q?afkCzEuAHwB55rcItCE1nBRYl6RQq4fSdnQ6BTn6A8643TwMrYwHsRFGrCPY?=
 =?us-ascii?Q?+2XFKMtI2HX1DHh8U3Ow+O6qgD4vTWTQbMEnKoXRGFlp36P6BAEkKN0uOWsm?=
 =?us-ascii?Q?DAF5AFwB1n3vYkEHsx21WXYhd0lUUpFc+w5XXoG8CovLCmPFqvzIIzFqD2E+?=
 =?us-ascii?Q?/eeBN0qAw4LULvS+qLs6q1pHFVwCY3qcjTROXupSRC7/cZTqgayr1BFRXXGV?=
 =?us-ascii?Q?DOM2sGutxHB2Dh5H3mGWKhRxcMz5T8UytMvRnv1WClC3Pff+kisqFBSW2+kB?=
 =?us-ascii?Q?uF4mnsj25DOwIjtMzjbN3Isv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wPndYcLVl3PR40Aba46mKLur3w3yJlKVfpD3cW83uVke7+9CcB4KRCGpn6O4?=
 =?us-ascii?Q?ry6goiC16MxNZMwXtSWCI1pRTueNAm4XfXyLaeUhnxCgkyJdspuDhCkUQLSZ?=
 =?us-ascii?Q?fCkuazH7+cW1aFaF/N6dUuFvbvvU3rZD7/OK0OcugL077FfxMPtKoR9EJ1z/?=
 =?us-ascii?Q?jM9kfunAXKm2UIqXIVF7V6bUr5oxEs1/+gvp4FK/aqOK+Ki8lSsVT5ZXgfyh?=
 =?us-ascii?Q?xXXLdq4gs/ohAMilV38MLv1SoFzjmxCkamxAuWYe8qKJPmTcki79s15v5KlV?=
 =?us-ascii?Q?44PAs9Ukyb+46D3sf42HLyS946/X1KmvgbkK0DLfeNBdZmbJGcy/639nidmm?=
 =?us-ascii?Q?yiZV9FtdrpW+m1cgOxlsXVmOJD7l2Y8duQmo6dQnpmm6rAokWmch1+u+IJZw?=
 =?us-ascii?Q?F6EuFr/SSTomvb/6HdQ+jinUnxSt5gExc2Fx2RhtAjjJI4Q/WUJ/sK8dUCa8?=
 =?us-ascii?Q?IiZsreFh0yzSMWUXvzLyS8I5wMBbZ0wr0sROcS8oE86qa29lBK14tkzHbm4C?=
 =?us-ascii?Q?Ddk+Dfqp5qXUpnTi/EzOINCbYpfi2OQZ5tE1r1c5IOatkG+HHEiQbwhAQ00X?=
 =?us-ascii?Q?Vxh5acsXiTkDjPJuCgo8xLyYc/k48qRg2dhCMuWgXscDvqIrwf3A063JMIUR?=
 =?us-ascii?Q?MJ5fvMyXcfOnefCNJeFE1o5sYN8fZU4XW8s8SBWQ/4rvbNCtKm7/ghMfhTzS?=
 =?us-ascii?Q?GcvSHnkUv45FqNf5NaKrmO5HSIzH/hJKB9L/I2DkK0gDOp5wELrUFT3JNY8a?=
 =?us-ascii?Q?RHSTIAINCpAWsYjvX7NouRppF7TF+7pSYOKW4VKDoQW2iCZo4p1zP4ov+fcY?=
 =?us-ascii?Q?Ji0I6pHFXHfYCMWm4+0Sp8WFLT0Ogemf9i2HzrW8VXQbe3V7oO0yocWJnug0?=
 =?us-ascii?Q?fdjx9G9syinTBPpQIaX6bqYAtVMjHRIpr7Mo9BylLE15RPovMSYZ1DlAtUU/?=
 =?us-ascii?Q?/eOcwC4aQ4VpAsH3Hzu4Fc0E33xaPfnlZD5KRAMXX4DgbuQVT9ZqPMcqwbem?=
 =?us-ascii?Q?/TsXOBViwjPhGl4Zn1pix5bkmtDKhwOH+N7nTIX6/41Xklgfah7eEf4DRSk2?=
 =?us-ascii?Q?E7sSwa6EspGlrCv74GJGqobmSMoTHuXxuapC70gBr2EqIpd1x35K/F31tWUa?=
 =?us-ascii?Q?cGFz3Wga6dvMEBtUTJEuEl1eIoGfSwimjykiH6ozaPpput79JtAsZ2p6beoj?=
 =?us-ascii?Q?w8lTRcEnQPxFGryC/HAkjIIAzpumq2gqNrKlmOfdqNLwUe0gAZmmwMCLCW1w?=
 =?us-ascii?Q?KA/ctWXF+AG9sgebNYNZFFxXdTyq7JT4W3KHy8xFUxBBzH35sV7xFhYtR726?=
 =?us-ascii?Q?dvtKsDRA+Ur56zQjOTvm2213gudyNdK+X5VNnEJkzI2ykn4NSyTa6d9SQOpk?=
 =?us-ascii?Q?ulFYWot7ce8e+9wpYQdevN3BCS1MCcpNMRXNBQeLCB/eSGCPmqY2V30Znmv3?=
 =?us-ascii?Q?+6mgrL7Hp1LLEg1uTsdyz6UR5EiFXZkwj2Tsi9G886xS7hq1b+UAaEwCdD3u?=
 =?us-ascii?Q?6VhEny43enLCJRQxacJRtHy+/b3TQNA26MNxP8y8EP5tGP2ZEq5Sssq8K4DY?=
 =?us-ascii?Q?kW195t2i7V7aV8oPi8RwfRlD9xZo1bTQ1LAG2256EmbWZr8zI60bz+nG4OL6?=
 =?us-ascii?Q?n0ZiDV4IFGlLU3G7LAjCfCk1MiDMtQ2E+j0aX8npUtcTzPcVh4sdbkyfmO29?=
 =?us-ascii?Q?DtLqBQ=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006aea6c-8a39-4b8f-c9fa-08dcef5c27b7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 10:03:46.3068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQa/mNbZH4+mPpalAGijuw/V5pHMufmSPy6SstFkx1smGY8h1aqx9os0KLZBfkZsJ6kvOVi2hjSdE4z8pcDEJ6bOWXkdXhK/wf4A639GXlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7139

For cases when the mux shares reset line with other chips we cannot
use it always when channel selection or deselection times out, because
it could break them without proper init/probe. The property is
necessary, because reset lines are board-specific.

Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>

---
Changelog:
v5:
  * Declare dependency of a new property
---
 .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9aa0585200c9..37882a5a8c87 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -63,6 +63,11 @@ properties:
       necessary for example, if there are several multiplexers on the bus and
       the devices behind them use same I2C addresses.
 
+  i2c-mux-timeout-reset:
+    type: boolean
+    description: Sends reset pulse if channel selection or deselection times
+      out. Do not use if other chips share the same reset line.
+
   idle-state:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
@@ -88,6 +93,9 @@ properties:
       register activates a channel to detect a stuck high fault. On fault the
       channel is isolated from the upstream bus.
 
+dependencies:
+  i2c-mux-timeout-reset: [ reset-gpios ]
+
 required:
   - compatible
   - reg
@@ -146,6 +154,9 @@ examples:
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
+            reset-gpios = <&gpio1 27 1>;
+            i2c-mux-idle-disconnect;
+            i2c-mux-timeout-reset;
             #interrupt-cells = <2>;
 
             i2c@2 {
-- 
2.34.1


