Return-Path: <linux-i2c+bounces-7747-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AB9BB07A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 11:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C58261C2214C
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 10:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765E71B218D;
	Mon,  4 Nov 2024 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M2J2CRCu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C251B0F26;
	Mon,  4 Nov 2024 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714464; cv=fail; b=lwgLlRFt4jWOkXCpBC4ffHSQpt9CtlkWrcKyJI21Ru7MUhDP6sPEFbGNBLrvd43GJVfm67ZlE5HBsigz2nusILF1rmHV23Ju6M0BwM0PQg8v2LaBBVX72V6jaK6S8H9033+/aaz3N6+tTcpTYggBFK2BIhQDFiJdni+rdp52ZN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714464; c=relaxed/simple;
	bh=U7GBfDvNoizSjWh01A042BOlkC0W56gsgmVgLj2y3ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JfwtvFSE0kCHLq9eX+AY/NPNMcb3UBsHbKXZqw8qWfVfcUyEW2bDk77Pkka8PFTCLSBZvu46Vqhp7MIOufvyspj10DgQbkUSOeyMf1s2lIAIBGQGiCfzMxwoEPABysVUtrYFBRvt1EEYSItdV7B2D4qdBGCf03YbRp3gCBiShrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M2J2CRCu; arc=fail smtp.client-ip=40.107.104.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdvdLq6QSpfO/S2EPipQg58izacjnrz2+Y/3MoogEYkq4pK5HkFijsWBmi8lRE1LZNIf4/GIfG69x4tcsEwh8qTRbgJzun5gtonRk16qXtag5s9Q4ndTR/kp2Yf0VuQAfp25ygyvQBrb0Ocmv/e3KuCSUmi17+R3UTB6hy3DF3jFHbYPw4SLP5p1InirNWcNvEaHEuL1vtGFRGwqUpcDpao9LJBRk1J911Oly2uTiHDS2VOGcN56n2Gp0waE5G5u/KXD7RhUc34rgctxVlnjsQstj9HdIquCi6UcVSW+hdKfdpQ0Q2WD+mzhfn0Q3vPGuPDToLgSt+SxcxgxUYe9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwZ6s2Kxruih+NW0LgLdVIf3bnoPNU9rRCt/vQ+acig=;
 b=Pvj8QTU2AIUq31m8rRjeujNvg24oTTg8SoWpXFl71jQqGQMHTsotTJTGmZSsvd4PlP4oEYgbbQSBqrjAqEsWNIJnMPN7kohsqHZqSAJOMd5PvalF2M9J/0A2wCy6vb/AEcieqRPdrfy20bHU0+GTXuUlpHQjJyT4Yz76kMvNsFY1DK/NDvk14ItTnKYkQkTCmCAeq+rSm/nNG4Lqfr+WTyilqvwsCyfedDDrgvzLtJtdIHG7+a6zO25XxGpnZbvFmXJdvBvLJZu98bJfMGisBs/kLsYqjo9E3icfdFE4HSPgz7XmKy4eVT8rgsaBc7vBwKJq3nlPpwbNaNanT+sEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwZ6s2Kxruih+NW0LgLdVIf3bnoPNU9rRCt/vQ+acig=;
 b=M2J2CRCuoU8Wx+qgxfMmws2rP70MRUCr+720XgMhUJ0wKUxOY+n7tFczOjuNhjcw8l6KbEbxnTc+LhevN3TWUiU0ZaJRWMEIIEPLGoT3DoI11SgG4NU/5Yktz0d9Tc4TiXgfgBfqO9OugfV1ko05Css1oCiYF/VGSm/Tq/Zz5scZes88xBfzy1iXL9Z1zOCouwTlzY8b97NOzzTE1G5XNfckoL2uG/U3bi2csO9C4FYOKblDUTpnzRvY0jYcOIKWM2XiJ2kIpfBIP7fqx8htR1zlQ9DzmSODQe+tgs0de6U/FpjgSBSPxBtXQ3g2Evd1Cm0FJs/+DkskeU4qSxhvTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 10:00:58 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 10:00:54 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>
Subject: [PATCH 2/2] i2c: imx: add support for S32G2/S32G3 SoCs
Date: Mon,  4 Nov 2024 12:00:44 +0200
Message-ID: <20241104100044.3634076-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
References: <20241104100044.3634076-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::33) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e143f73-9541-434c-6ccf-08dcfcb791f8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTFQNThxMXpTN3Fka2hUUEZCZTRPbnNXRkpNQnhJbTdOQXU2QW1aSDB6czQr?=
 =?utf-8?B?MG9CZ05DYzVjNE10TFdtR01FV054cWc5LzZqUG0wYlZ3RFFCVmhZS0tDcFI4?=
 =?utf-8?B?ek9DMGgzK3lKOEVoR1hvWWVYZGxsbE9vdlpvR2hlYUZDa3RCYTNtdXo4VmNs?=
 =?utf-8?B?ZE95aUdsZitBYU9oeVFLV1NydVM0K3RQL3dkN3RlV0lydUNFVldyQ25qZXZh?=
 =?utf-8?B?enpWZzVYQjg5TThaZUE5K1FaZkVmVmV6M0syRHJQdWdwU2h1V0s5QlNkSktt?=
 =?utf-8?B?OHo4T1VQZjJWcHY0MXhoOXg1TVFRSkpVODY0bWJyMXVsUGlZQzVtaUhlWURB?=
 =?utf-8?B?Y0xyY2M5WkhXNVJuNmxuKzkxa3dKRGdTSlYxNlhobThxSUFGSlk2ZUhGWXR0?=
 =?utf-8?B?SExmZlBtc0daZVNQbnBLOTU0aXJ3UTlGMWhtZGtGRjd0VktYdFlaWnFyRjNF?=
 =?utf-8?B?LzBybmVITUpQMG9KMHBQMzRFcG42NGlaNExiSWxYdmUvVWxKL3hQRUdrUEZp?=
 =?utf-8?B?ck5qSmNqdjBPdXFNcmt5MXdtLzN1azhZOUpPVUxBQTNKOStQY1dPUFV6bis5?=
 =?utf-8?B?YlVpZk9hTFdheS9mbVdsMHRRTUVFa3gyS1JBQW55clVPNnp0clQrdDNJbE5s?=
 =?utf-8?B?MkhyUG1KWkpZdTRFRDZrbmFtYWlWSkxqUzJtRUJQSW8zOGtkSUFXTlkzaEhP?=
 =?utf-8?B?by9taWJqbktlY3VYWHBTTndKT2VGSk9BRytMYU95Y25jOXAxYVVzZG1xeW5X?=
 =?utf-8?B?SE13ckZiQnM0RUFrRWxyaUgxUnVjb2RKRHhBSDdTbEdvQWJLbXZxUkF6L2N0?=
 =?utf-8?B?VkhkcWM2TlZxWXR0a0ZpcS9jQ1ROcm9wZjEySHl1S2pLai8xK01tOEhWQ0Fs?=
 =?utf-8?B?UjZ2VlhObGNGV2gyeDhxUTdpYXk2VmdyUEZidzNiQXFaMW5YOEd3eTRXMWRN?=
 =?utf-8?B?UnQyM0h1Z2dGY3k1OVpQendEdC93T2FCQnBoQjZpUDB2OWlwWlhYMDJGN3M1?=
 =?utf-8?B?NGtWc0k3TWF0ZW05VVdnTmt4d2g4RktTdHFERVlVbjY0TGZBNHRlY0o3dVJr?=
 =?utf-8?B?UEJVN1V3YldDS1B3aytFT2VRbjRHeXNKRi8wYjRxbjY0VEdlbnE0SkJKZ3Yr?=
 =?utf-8?B?a21BekdweFFKV0xBZGFDcGQxZmRjRWlTMUVqZ21TYlUyVFNyYTBMT1RvNklm?=
 =?utf-8?B?TzNQbmVBN1RSa1VLOVpvdEVHUUtvc2xUTERzT0U3VFlkSTAyQUozUE1jMmh5?=
 =?utf-8?B?MmZmOUlGa0xEWVNvRHVQYWJobmRlRkVmUTdTUnlOMG1qeDNYVlZmOGdqVGFV?=
 =?utf-8?B?SThNTm9RdUJLaUNseUlpTlRCeUt6cWxyMUE0eis0T3F1cUFSK01XanhQMEhi?=
 =?utf-8?B?b0lsZVFkcHAwbk95djQ3ekZKTHNwU2JjWVhCR1MvTWFzOXJRTm5FUjBuUTNJ?=
 =?utf-8?B?MkJta3ZyN1Zha05IYVhHaHg3dUFNVVZMa2RsWGtrWW9lVGFveE9ScjJTTUE5?=
 =?utf-8?B?Y1p5NGxLdWFDcUMwU3JhbTh6d3V4S1NiWW1ockI0NERFMW5QZnRreEhnaE5I?=
 =?utf-8?B?VFZCb1BPN0VqUmJMZDNJYVlIMkZ1aEJ5NGVWTnJId3V5ckNJekliQ21EdVdQ?=
 =?utf-8?B?bHZSb0xBckN6VkRmZjQ0bjJIZlZmYXN2b01tRUZFL2MwV283Q0Y3NXFmRzJP?=
 =?utf-8?Q?i2iahLC/0LQ9joLOzO9e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTgweUJSOXN2NW9FNFR3cEZBbFYxUHdNM1E4MDErZS9GN0hSZk5rVFBwZ01k?=
 =?utf-8?B?OGR4ZWFHVk1EMkNha0xuYk4rakRxRWFBd3B1T2VFMW1RbHFERFFwdVRrUUhm?=
 =?utf-8?B?YmpRK3Y0SHJ2eXRHcktjVlA3WmlvdVRuc3VLVXRLRU5FVzZFaE0raXdaTFlv?=
 =?utf-8?B?R1ZtNTM2VlVzZjJtS3d6UGczMEljY1hJOWRpTWdKeVZMbGJmVk4yTlhjdUJD?=
 =?utf-8?B?OS9tYVJWNysva3JjMmFZZDRVWlFIMmhvWXBEc3VVR2tMWU5Jb0ttanBNa1hM?=
 =?utf-8?B?ckRLTlVDUGVETzVXOWFTSzA5YmlzQXlFZTY1UkZxL0VSc0paNGNEY1RZZy9N?=
 =?utf-8?B?TkYrSXhSemxOdU00RHBHRHRLU3BNWFhWUjQ5UVBnV29PVlEyVWw1Slo3UUs5?=
 =?utf-8?B?VUJINTU2Z0ZITVMxVm00WElXWGlLMUY4YUpUOXd2MlBzU0h0Q0lrSWh4YVhn?=
 =?utf-8?B?MVFVckx4VjNnNTJ4WXQ1enc3bEtPSXlzUVFRKzVrZzRWWFNYeFMwQVh5NHNi?=
 =?utf-8?B?SnU3NUFScmMvejgydmlxMGd6Nit3WkRCbjVHNm5yV1NuQklySFFiMFZxK3kr?=
 =?utf-8?B?UTk2Rlg1ZDg3MXpCVUlDeGFVbGlqR0lETkdmWms1b014TGVYR3lHc05WTWox?=
 =?utf-8?B?UnRMcHB5Q3I4cTNQNGtxbFZsWGhYQjNyV2s5S2pVa29Fc3NsVWp5OGdUcW8x?=
 =?utf-8?B?Z2ZOb2VPVUFONEticHVIOU4zcVZsSFJYSE1ac0ExYlRNS2RRUXJvSjRjM29r?=
 =?utf-8?B?YjVnMnVSclIzbWlXMUYwL01jNG9lTUVIcmUxcmVyb3oySWNRUE42a2VXWHZT?=
 =?utf-8?B?SnpMY0pYWEt1UWxaY1prSFZuUTdCVGxXeUlFZ1NwS1VIWk5PK3FuQmVaZEdw?=
 =?utf-8?B?ZUZrYjcxWTY1VXN2UWpYOUhiSlI1TUh3dS8xL2NEMXZ0VFNwS1lmRkpBaVlu?=
 =?utf-8?B?ODcxQmVFdHN6QS9FdlVhQjhjM1psamxidFJxb0NUNytHN1NZOC9uRWFjWHp1?=
 =?utf-8?B?VWFTUENKQTlMOGs2NHdUUDdDeEd3Zk92dWEzeEZFS1Q0WVh2dllOeGdLUjNT?=
 =?utf-8?B?N0M4MXZEaGVLWHRXWE1jdWxieElSbmlxWVh6WHFKNVdnakpMKzhGWHk1ZW1S?=
 =?utf-8?B?LzNzTXVQWGR1NjVVbjhkV1VVOGV5eERaMkJzN1dtY0dzMkxkNlFHK1dENE05?=
 =?utf-8?B?M05NTmo2YzdWaEMxVFFwVzlJaXhkQitmaGZ1SUxONWNwWnF4S1VTRXJZWTlx?=
 =?utf-8?B?cWdBSDZFMDRLSm1LaTNFc3BtUnA0bktqVmRoQjh5bnpoNEorcWhSVW0wN0Fh?=
 =?utf-8?B?VnpQNUFRYTJ1bnU4ekVZeHVheVlPWXRjS3pGTkhUcVQyVUQ1clRZTm1Iejdx?=
 =?utf-8?B?SkZvOXVoMkxPK2tYTXIyeFdiZ25sYld5TEVmdENRYUFJVjY1K2JndXZ6U0I3?=
 =?utf-8?B?aHNFRytBaVp6VG9xTnplMDU4V2ZGSis5dEhiRWNralVzRlV2QTYwL1BXNTkz?=
 =?utf-8?B?MUpOeEJZekkwNkFZN3ZPYTBsemtRbml6OEtEcHdETERySEtMTy9SSEpoUmhX?=
 =?utf-8?B?R0VUZy82ZVJsc3h2UzJBTU1QajlrTGxDSVhmQXJBbFBlM0M1LzRzMmNiM0dP?=
 =?utf-8?B?cHNOTHRNYzluZEEyU1lGZEZMOWhoU1BPUWJramFVcTNTWGdkVyt2RWx3ZXMx?=
 =?utf-8?B?UDVMK2xYT3FWTWYwaFZFb241akNIWTh2M0pUOWhpa0o3QjN5Z01vODRVS3Vn?=
 =?utf-8?B?SFNFOVhxU0lIZE1DdnNIeDV3NW9qTDBudm0rV1h5Vm5uRmlJeDFORWx1UmdZ?=
 =?utf-8?B?OFYvckR0KzIvWVRpaEJ2RE9xL2JwNTlvRWk4azlDaE56RlVMbmdQK2lxbWtF?=
 =?utf-8?B?UUNEbXZVSkw2YnpINWxFN28yeEhVNFE3azZOa1VHZzNLeUpuankwTTkwRWN0?=
 =?utf-8?B?VlYyUHl4TFl1a0xBRUxpaXEyWjE5c2x6SWZGMkNyK01Bd2hyRGJhV3MrZTI5?=
 =?utf-8?B?T3AxbVNxZ3pwL1hFREZ0TXJzQmFxNWkvRUJBaEdkcEdIanc2RGRQSGZXbGtx?=
 =?utf-8?B?ZG5PZC9YM3BJUTRLc0VWNnhzeVBVT2hSYlRRN0VTT1g3S2pCU0hVdm4vWnZR?=
 =?utf-8?B?SmxIOGQwOUVtNFVLNWQyRVdTcjY5QVFZMWFqWlozUVNBOFQ2MngxYlBkK2tH?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e143f73-9541-434c-6ccf-08dcfcb791f8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 10:00:54.0136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rl59JlPJcC7Ly8lTQVmzql1tTvL2nT7l0l2mJ6XTZo11nfHfqbe7UIouSQV6B/ainK+4FunYy+d4noOwwZjIx8kkgSM45XdlJR4lJ4n/jzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Some S32G2/S32G3 SoC I2C particularities exist
such as different <clock divider, register value> pairs.
Those are addressed by adding specific S32G2 and S32G3
compatible strings.

Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/i2c/busses/Kconfig   |  7 ++++---
 drivers/i2c/busses/i2c-imx.c | 37 +++++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6b3ba7e5723a..45ea214e4b0e 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -741,13 +741,14 @@ config I2C_IMG
 
 config I2C_IMX
 	tristate "IMX I2C interface"
-	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_LAYERSCAPE || ARCH_S32 || COLDFIRE \
+		|| COMPILE_TEST
 	select I2C_SLAVE
 	help
 	  Say Y here if you want to use the IIC bus controller on
-	  the Freescale i.MX/MXC, Layerscape or ColdFire processors.
+	  the Freescale i.MX/MXC/S32G, Layerscape or ColdFire processors.
 
-	  This driver can also be built as a module.  If so, the module
+	  This driver can also be built as a module. If so, the module
 	  will be called i2c-imx.
 
 config I2C_IMX_LPI2C
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 98539313cbc9..3509c37c89ab 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -17,7 +17,7 @@
  *	Copyright (C) 2008 Darius Augulis <darius.augulis at teltonika.lt>
  *
  *	Copyright 2013 Freescale Semiconductor, Inc.
- *	Copyright 2020 NXP
+ *	Copyright 2020, 2024 NXP
  *
  */
 
@@ -84,6 +84,7 @@
 
 #define IMX_I2C_REGSHIFT	2
 #define VF610_I2C_REGSHIFT	0
+#define S32G_I2C_REGSHIFT	0
 
 /* Bits of IMX I2C registers */
 #define I2SR_RXAK	0x01
@@ -165,10 +166,35 @@ static struct imx_i2c_clk_pair vf610_i2c_clk_div[] = {
 	{ 3840, 0x3F }, { 4096, 0x7B }, { 5120, 0x7D }, { 6144, 0x7E },
 };
 
+/* S32G2/S32G3 clock divider, register value pairs */
+static struct imx_i2c_clk_pair s32g2_i2c_clk_div[] = {
+	{ 34,    0x00 }, { 36,    0x01 }, { 38,    0x02 }, { 40,    0x03 },
+	{ 42,    0x04 }, { 44,    0x05 }, { 46,    0x06 }, { 48,    0x09 },
+	{ 52,    0x0A }, { 54,    0x07 }, { 56,    0x0B }, { 60,    0x0C },
+	{ 64,    0x0D }, { 68,    0x40 }, { 72,    0x0E }, { 76,    0x42 },
+	{ 80,    0x12 }, { 84,    0x0F }, { 88,    0x13 }, { 96,    0x14 },
+	{ 104,   0x15 }, { 108,   0x47 }, { 112,   0x19 }, { 120,   0x16 },
+	{ 128,   0x1A }, { 136,   0x80 }, { 144,   0x17 }, { 152,   0x82 },
+	{ 160,   0x1C }, { 168,   0x84 }, { 176,   0x1D }, { 192,   0x21 },
+	{ 208,   0x1E }, { 216,   0x87 }, { 224,   0x22 }, { 240,   0x56 },
+	{ 256,   0x1F }, { 288,   0x24 }, { 320,   0x25 }, { 336,   0x8F },
+	{ 352,   0x93 }, { 356,   0x5D }, { 358,   0x98 }, { 384,   0x26 },
+	{ 416,   0x56 }, { 448,   0x2A }, { 480,   0x27 }, { 512,   0x2B },
+	{ 576,   0x2C }, { 640,   0x2D }, { 704,   0x9D }, { 768,   0x2E },
+	{ 832,   0x9D }, { 896,   0x32 }, { 960,   0x2F }, { 1024,  0x33 },
+	{ 1152,  0x34 }, { 1280,  0x35 }, { 1536,  0x36 }, { 1792,  0x3A },
+	{ 1920,  0x37 }, { 2048,  0x3B }, { 2304,  0x74 }, { 2560,  0x3D },
+	{ 3072,  0x3E }, { 3584,  0x7A }, { 3840,  0x3F }, { 4096,  0x7B },
+	{ 4608,  0x7C }, { 5120,  0x7D }, { 6144,  0x7E }, { 7168,  0xBA },
+	{ 7680,  0x7F }, { 8192,  0xBB }, { 9216,  0xBC }, { 10240, 0xBD },
+	{ 12288, 0xBE }, { 15360, 0xBF },
+};
+
 enum imx_i2c_type {
 	IMX1_I2C,
 	IMX21_I2C,
 	VF610_I2C,
+	S32G_I2C,
 };
 
 struct imx_i2c_hwdata {
@@ -258,7 +284,15 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
 	.ndivs			= ARRAY_SIZE(vf610_i2c_clk_div),
 	.i2sr_clr_opcode	= I2SR_CLR_OPCODE_W1C,
 	.i2cr_ien_opcode	= I2CR_IEN_OPCODE_0,
+};
 
+static const struct imx_i2c_hwdata s32g2_i2c_hwdata = {
+	.devtype		= S32G_I2C,
+	.regshift		= S32G_I2C_REGSHIFT,
+	.clk_div		= s32g2_i2c_clk_div,
+	.ndivs			= ARRAY_SIZE(s32g2_i2c_clk_div),
+	.i2sr_clr_opcode	= I2SR_CLR_OPCODE_W1C,
+	.i2cr_ien_opcode	= I2CR_IEN_OPCODE_0,
 };
 
 static const struct platform_device_id imx_i2c_devtype[] = {
@@ -288,6 +322,7 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx8mp-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,imx8mq-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,vf610-i2c", .data = &vf610_i2c_hwdata, },
+	{ .compatible = "nxp,s32g2-i2c", .data = &s32g2_i2c_hwdata, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
-- 
2.45.2


