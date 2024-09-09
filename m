Return-Path: <linux-i2c+bounces-6387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D0971057
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 09:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A24E283144
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 07:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647FC1B0139;
	Mon,  9 Sep 2024 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="devpg4D7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2042.outbound.protection.outlook.com [40.107.117.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAE01B012A;
	Mon,  9 Sep 2024 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725868406; cv=fail; b=Tadr2nQ82+tm5Wn/EtNfNVUW4Y23N9v6a8Q1wB4jckh6zE31UqzhQzcXUvgTdGkvaK6u6jiTa+ssmi3Q4euv/+cDMasawEpwMzgKJDjqijLbGlhjijk+olTUzxVgZTCspRK5NBTbnX0wIzG+c213MRJshg5CJc6Yr37DQ0zHy1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725868406; c=relaxed/simple;
	bh=d/CSYKUGlRsD7JM51SFL+3socwGghDexDicxufOGZks=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=V3RMbEfEYjeEOoU/R3xq0siCMley0J0q0IkB6vcBUUtTEpWL0YkTFSSg425gYmX9ur/NOPsixI+YHcefcL7iMcVTF39MTXWaDE2bbUR6+MfUIXZcXdZv/TKBba9+3PCS5mVef61Odf1KbDoz3wciTBfS/4xBvNWPlfGAHzgGlZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=devpg4D7; arc=fail smtp.client-ip=40.107.117.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msh7+ezncache5L6BFB1ijzJ+7KLEe7DU/DzeNW9RII/grDvb9brtsFMtlqSm84XagBTzDDFjQMRJ4BoUrXC1b+Yi9v8s/03UZPkyWLIBc9DWIm8e+lmjYpYgZOHKHYtXRuNzUzsw23Dw0+wYvto5Gn2rJH5l4SU4KJQ49LvDMhdHzIfvHbH50g/hfL1Ebbd+P43oL8eGVvnAS1Vg/l5j4mOa4WgiFXAiyl4osi/WgzGn5xgJeqAnh1+xyWNn1xL5jy7A406lyhwsM/dkdjLIdH+bv2z7E7X+YxzMqAtgt5q4XLkbk9OFzH3ikCGrOgA1fH7quKEpIJRzVMZMeJMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgEZ1n457JwtWxaXkDVpEErtaF5nMevX7P/brRrrF4Y=;
 b=HHtYOrOOTLLxsvikCJwIieYK72fXXNVS2ZcMyqqZbq9HWG3iT3HCAnHE28EAWbfeTvrH+ec7+AEFmDbMGVXya2zynOceP9LlnPyHcFLXh592Qeb0IBMj0FE48kC2goTR9+odkj31+LfRtuaICnvXFkHo0XJiLhr6In63rZEO1MOjbmhWCPGoJWf4ale6qTqrzq6BMadQ6Ym6S3qFasw3gmuNXDhgR/9kRaWsYJV9wEpVwoicUPBe5bbwQd6uynXP/4sa78738qqL32gM9KZqD61apEiBJbvaYdNK+sMcdNM7PUWJs5kh/vqdPpHSWM0rrjxPAzk0e4URjBl3URrGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgEZ1n457JwtWxaXkDVpEErtaF5nMevX7P/brRrrF4Y=;
 b=devpg4D7cvGwM1okmKQTEzNuIwPs4JdAh0dOpA5XGcLx/7DxhYdGLZLp/8WX8vsFqCQwZ3XY0Po+PvxeDCypRGw/4JuzJr+tfVBxeXXmW7UqLy+GB4DJ8Mx/B4JbksuQPgugRZqvBfzkMhpU3WNsZqxsBYeLsqfkhBu+BTAHWDYSccGGRjnNHmIdpMn5/myby2lxqJIPkS2yc5PhJOnW+7Rb1GdYdXdIN9wzCswZNI/vKP7rt/0Fwx4axWky2Nvvsp7YT2BEVJ9qVJfV7oRcDaYkQUi+S6uXqvSdL5C/1AnCcT0rG+PXa6Ne5ChPCRqqA1vHB58Muuyh4Lf0L6ptuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by SEZPR06MB5624.apcprd06.prod.outlook.com (2603:1096:101:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 07:53:19 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 07:53:19 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: o.rempel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] i2c: imx: Convert comma to semicolon
Date: Mon,  9 Sep 2024 15:52:57 +0800
Message-Id: <20240909075257.34168-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|SEZPR06MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 8602d45a-5289-4c8e-b2ff-08dcd0a47843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?464xgK+lTeaNyZsA5rAXDrxg371sJBLaZyPgFYIU/UGI8Nfvv/tHeILYeWjS?=
 =?us-ascii?Q?jbY6M8xcK7PFEk/Auyzynl+bbb3Al1y9FaC1COAH6FzebsDLdk2j1vHilNEf?=
 =?us-ascii?Q?YARZUn6eYxUtPH8YWzKxM6r1Y+pVYCVtNKhkW/nktvI3+bVz2eulsxcgGyxx?=
 =?us-ascii?Q?O/+n2xvuvl7wucpv5U+pvdmGV5Sl4C34A+NoZ7jg3Q7Pr7KECM2dKARpWMTB?=
 =?us-ascii?Q?8CUshJVe7YIOlxgoYSZrX73ypspmI7/JGJgIq7eU6Km1/u2mh8brHYkPQRwk?=
 =?us-ascii?Q?kWO/g5dz1rTI0OtCqFetYcwhYLGtefnQ7aPXwCNbe+geXgOZL9t28BAO8TzA?=
 =?us-ascii?Q?abZKLvZmeXc+WJys15GaMYS81WuJAZM+UVt0rODbXUW/OpvoIxEHu8+eyADD?=
 =?us-ascii?Q?b4jU5ukanrl/IcYY9OoG9ZoB6Slz1Cx5eLmZJB6kP90BcQEtUL3boS+UykSF?=
 =?us-ascii?Q?NEsDwftO0TP8CEGMut38s8HLrougkZBK+GKTHrmhLAEBHQnMhdOm3d/XPP/+?=
 =?us-ascii?Q?P3RLPpc6wnntuhtFTuJTCxAYfJLVbZRatknaqZpDFtGXzr6/itcubxrmECOX?=
 =?us-ascii?Q?t37a9w8xi6qgzFAzo7zkTSkp8iR3XshZLl+A6JeltFegQXB/2U3KSmTlKKrS?=
 =?us-ascii?Q?WI5OrC6f62pfu6bP624SsEFLA2C35tQEfSivXgC+xeoC3SpZ35TxMN+XLz5p?=
 =?us-ascii?Q?hZZtFXvyt45vr7LKbTZea8SPJSOsYFvsuGxgylJV9EG62cmQDwPjcV6Ev+Gk?=
 =?us-ascii?Q?/5YYmEz0HU2soG/M8JS1WAbihn4tL7s6KuF4cQEEr8a+ebR2k/ZmSZL5E08R?=
 =?us-ascii?Q?AxN/sgSsma4VFrFgYfnm3OuOMBikIY/hNBsPGcKgh5HxE2LHOi7m2u45HM8t?=
 =?us-ascii?Q?ec21I3Qg2C/WAYmDsN/m3BlzaaI1MZAqFx4UhHOdSLiznUR8CUVcvY4/JIv6?=
 =?us-ascii?Q?VQ0CaYcGBgXtjgdoE+ygMN9lcSHyOZSm1vtwBmyinVssxxz2p+KGT9xEXOXI?=
 =?us-ascii?Q?OSNdvPk3nRILSK6+DTGeY+eClpHpQCuoAdjFPjc8cQHTqH0Qp2DYYZYr0aze?=
 =?us-ascii?Q?HFVPqtZ7mHC+dIkLmHGr6aW9drV6EScfjrMXC/82sj34pj+E4A+kbXKmQwXg?=
 =?us-ascii?Q?eUnhLDXJaURxRJfJtrP9xV5aByYdgcfBaPnSwuXc339M6kJfFETDFJ9HmyuQ?=
 =?us-ascii?Q?+abfuCtkP4fI6QmhzOy5rOt4ervolbVMY4WQ+MUVkvCD+3rCQHOwPUkVBbis?=
 =?us-ascii?Q?FMjSS4F4o2UPe1Cubf4YjASaG9uqG+BHiSFYoWNNskbJFEDz5Z3uRU+WLZSU?=
 =?us-ascii?Q?KxfpOAStRwXX1Y4pcBLPWhy3cGCd0rkzLIK5eBZpnoHlyFBcWJ3glFLSpG8J?=
 =?us-ascii?Q?G8kU2UNWyOTGq7/Ey1RQdmTiY/F92ZiMJfyVRm/IsJSUNVn5CQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+GGrJ10uy8I9bUqRddu7f1izS+31ttuufdbSkmsg9f/LhQXa3Et51BLDdLPk?=
 =?us-ascii?Q?zImKFo6ykAueFb2WWNlQaMkfSfYIscof5upMFtsuOZANcinw41rOwVziVnvO?=
 =?us-ascii?Q?yBCXFpBvFwXlVngTZ5uf76iIjpSB21NFmaEHskeB4JfjstH0ycZHz77/y0xU?=
 =?us-ascii?Q?unyHncj9Kfc6RV4UR9upjS3aGueIEZjwI2WKq6JmvT7e+KIOixdEyn7WgmYg?=
 =?us-ascii?Q?DVxVQbSe2R36CBZqsTj/3jYpYf77YN02mu7JMGosq67zsRvCbYesniVBNn54?=
 =?us-ascii?Q?Nl0kxc2CqxOlEAqxBai8VXyf/JSnQIqH1d/Yv93iNbe6BUDqMafKUXV1Mk8e?=
 =?us-ascii?Q?cMb9l5cKDrC5CfHY4lP1cnbyLawRpU4tPZJoV5Fmyn9RrATDJgUR763Gnz6b?=
 =?us-ascii?Q?zsP/Io+e8PsLRGBYUfKPvnmTmZSjV5YitmcXQIp1amr/6jy5AKZ+NhA5uA/2?=
 =?us-ascii?Q?o/ln4WwMoDmGMWB4I7dB5r/qdNcZuDNxZXkwFjZRgvml2JIObTMMDOPNKTam?=
 =?us-ascii?Q?MYtHiyLH7uF7TjJQWCOPQrzUUW7r5YQ/rLWdAL8RZwyPIA2xbOgdFTzYyJi8?=
 =?us-ascii?Q?+Dn7hUEhpCwFHSOIG/ya542vz/RMF7DnZKDtYjW0x8N+T3b1WLKlYe1LJJs4?=
 =?us-ascii?Q?VcBxAgFMwbB4Sbyod6J0AmeEOidEdjR6oaTIrc1GkCNsCnAGkW/RSEgiyht+?=
 =?us-ascii?Q?XUmv+u3xNJaS3Wa76KDxGoKwAfG7/O2DKQh+btxTbNhxljnLEPeeU1gruGy2?=
 =?us-ascii?Q?3UMbWVKtnPmGO+9LNLFIw9z6IkxA22FiIsIPX5MI2UbIIL4rl7sjRz0K+x2T?=
 =?us-ascii?Q?tJnPgPrJQ957P7S1qkfRSvVUyZC13M3546455wAqbHrZnPTvKXLv+Y+lxQAt?=
 =?us-ascii?Q?Kd2I9Bkoym57bsa2qk2n7kolNbus7qdPe3M8wDGmUkhncB4H+lGhC3m+gkw7?=
 =?us-ascii?Q?CVi8p6cyJ4N+KsSfzuDok3B9o3IAJs0QU6ifxmQrFgaXRZWJRyXl2CRrHRMw?=
 =?us-ascii?Q?C4bDcaPA5GxAmPibo6xE4lUVXBU6ul/42gUf/NgqgO2jWJ1aKnU8psnUzepI?=
 =?us-ascii?Q?ie30e3h8adps8UOxdtUACmhqFzyV6Z0NVZzS0nRepA+sfDI0C1v8wfmLfvw5?=
 =?us-ascii?Q?v8xFQGpMG08EWyZDnPeBu2cA9+tlyERLIX3L8VnIm2jfi4o038p8BU7wG11s?=
 =?us-ascii?Q?sZUt2+F9UeoisTQVTfgSlZfIemXeahb8wtDB4wEGr8b1D3utnsHP79pwa/A8?=
 =?us-ascii?Q?gTsu/ZfdgzmMtMYLFPpjfToR62+wowH/zZJLq/6CEkRKsxHf2b8eK6CfE/Kp?=
 =?us-ascii?Q?AP46B7snJB6z8XB9Lvh9afTotfZ9g4K7Ui0SF9/GuK6zJIl7ISJUYvIgrdO2?=
 =?us-ascii?Q?f17LZSmcVwhx0uJsEV62UD4TbVqFumBOQG8ai7Otldw5nIDKwfcqQohyL+8O?=
 =?us-ascii?Q?eNTUQlz/PkOQEqAEUHy38kOanlCa2a4Y3rGOm5KVdeFdABAiQnTCworNypfr?=
 =?us-ascii?Q?xE/0fQG0Wx+OAr7JOZKFIpfhcv03aQt6BuNQyeqD9BvW/sx/tQEh1HS0/Eth?=
 =?us-ascii?Q?KQ07BJgbMXTAdQdnP3MRQKEH/keP/Bt8LR2HdPfm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8602d45a-5289-4c8e-b2ff-08dcd0a47843
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 07:53:19.3478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qoeiLngD/wbXbjDsjMW2bjuUnno8srwH61hhi3CLi5+pWpu/586XLcIljoct4IwpZwxFSIRd332iyI0W0TFvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5624

To ensure code clarity and prevent potential errors, it's advisable
to employ the ';' as a statement separator, except when ',' are
intentionally used for specific purposes.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index d68b575e5d18..98539313cbc9 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -687,7 +687,7 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
 		i2c_imx_bus_busy(i2c_imx, 0, atomic);
 
 	/* Disable I2C controller */
-	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
+	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
 }
 
-- 
2.17.1


