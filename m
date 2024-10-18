Return-Path: <linux-i2c+bounces-7475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3312D9A3ACD
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 12:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4352AB23A2B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 10:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55384201254;
	Fri, 18 Oct 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="XXL8QSdq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E32010FD;
	Fri, 18 Oct 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245834; cv=fail; b=MmZNc2YPEz08RpFUFIPlAw18+gXeD8kb2rH5tTfYzOYdiM1ZpF/KJQoewV3LZej+8LP8mazFGFgZOFwrYBMF/SfU96uU6NdefISd3fGvLyDKDt3jTTy3PSFBebTRVm0pT4G7bDvVqrLeQSFOuEdhqxSA8Q0NdaRZbOSwcIm39yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245834; c=relaxed/simple;
	bh=LNhmIES5S0z8k2yTMe5Po9x384W4HWq8sNnc9AzDlbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BYxgtNRR5S30xtTzrrZYkuMHnDQWwYUtf+c+w7YbsewOkM1oNcCz9K/ZTPuCuRTLk1I+7mO6Btf3FDvc1wdQPCnAjs58Qrzt7Dl+GJgg0d0OeLf+3l8jvB65rspiJr68ENW+JX98OUd9fa31JxOK7N934OV4f5KlAOrgQ4cnhx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=XXL8QSdq; arc=fail smtp.client-ip=40.107.105.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhlIdSG5ucik1Blx5SOvPAns3HjRDgpVwOQ7s56jTyPZAbzYT/ZYhUZBBTyR1eRgbtGiK/lPfYxX48mhyzrPFJOa4Im2TAnnDgNcHgUGNiEK4bYL2csRyWYmd7eS22nZXhgXOmI5E/iLrMvOa2mWHwSR8VD0/csNvmUrs0EeXj5SWqJLPN9sbzlI50QcFp50cbVjPx1iHUw3rDqMjVfzNrSwfTGKKDb0NoboBo9dNgXuqY9FZgn4AI4ihhwdx6R3Zygvd7ar10lhrsDgkCWBQd1iMOpU6ZR+X3ylQCIWYqKDG7/gTOhX1UljfjVd3xZAF0ygz6v3Mph5loW0UYe7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ/L/Xxv0zbLlh7qcdUzzIiIcMeTlJFTkJm4WqaPxYA=;
 b=E8PSZWd6xGL7G6ucfQuojgESv6pU32Pa6VQJMoWxQZ5KLB0n1OK+6wFtgaBW0Q0PY9vATsc0zKcLac88od9/lk05CbX48rTBLTakMTP4ACM24dboU/SnZg1XOw4uW9OKWvCs/G3Y8nU/u8f+RqpLRKhMLyudkEE6JBNochwcF3L6COn00+VKZmgdhDVZJocYtWg1Vg9lc2DA+xnw6zo53dgGDHSMn4lNBW3ZjjoRTLX8PvcfbZ0oJ4H3DzE2wukEKoOBq02vxflarX71gyX2VQNX91TYSdGYWq+2RKdFxU9hrVvmxhiZAgeZwUTc7aAER8ayxmbvoyHumyk4yRGKjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ/L/Xxv0zbLlh7qcdUzzIiIcMeTlJFTkJm4WqaPxYA=;
 b=XXL8QSdqMOi3v2wS+lm38VXuOzaysXe+MGJpwS2WFQr+ruCteWmuFfHEy/p3BWtvtHSjdfzw4ojCztjbughSGTJr85RRD7pJ+tUiv1bxOzlEoc3IRInfp9iPLtRsxOeGPHmQr3V+Mq6L/DyTKboZMJtDrlXnjVnVOZAUa4CuiQzasTmjeYvd+c8PLGddGEnw+mj4tK/34TfopJJXgRjOf8dbebtIB/IhnqR4Ww0CaWV6pomh/p6u0wK9dyy53rsD5Ytmhjace/UIuWUZ1NYZZOOPcc7LEgTiiK2illXV0RUX1v/x1Z6c50BsjcF65q9IvCTqhnnWeVAXHaZns1tqWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com (2603:10a6:6:21::16) by
 AM9PR07MB7139.eurprd07.prod.outlook.com (2603:10a6:20b:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 10:03:48 +0000
Received: from DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b]) by DB6PR07MB3509.eurprd07.prod.outlook.com
 ([fe80::5484:a966:1322:f78b%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 10:03:48 +0000
From: Wojciech Siudy <wojciech.siudy@nokia.com>
To: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andi.shyti@kernel.org,
	peda@axentia.se,
	Wojciech Siudy <wojciech.siudy@nokia.com>
Subject: [PATCH v5 2/2] pca954x: Reset if channel select fails
Date: Fri, 18 Oct 2024 12:03:38 +0200
Message-Id: <20241018100338.19420-3-wojciech.siudy@nokia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018100338.19420-1-wojciech.siudy@nokia.com>
References: <20241018100338.19420-1-wojciech.siudy@nokia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::10) To DB6PR07MB3509.eurprd07.prod.outlook.com
 (2603:10a6:6:21::16)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR07MB3509:EE_|AM9PR07MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 38690609-c82a-457d-3105-08dcef5c2915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dnEQBE8OQG+ZUl0FNaU4A8m4buKH22Nm7dOkUIZnEMVu/qu6/jLDPjwJXH+x?=
 =?us-ascii?Q?dpnlAQrEFfRsDqO9jrCjGfjyyDRpB6jN9rXRnjy3ghwd2rD0oi2cQsmWr6Ny?=
 =?us-ascii?Q?pxFMZuFUrUxkUxj7YTqW+3uyd38SOCZOAGi3uuLzDJimAwnzpAKCDoKbSqs/?=
 =?us-ascii?Q?bXWTK0OSxqi1ZkrkfPVBeliBiW2/OyZf8rpeIuxSPsODr3FAjS01oQnEAFd9?=
 =?us-ascii?Q?5jL9gtCkjeTgY1du8BtwDQ3J1XvWkQAufufTgzLd8oXX9UvNGyLbCshemfIY?=
 =?us-ascii?Q?ruwC2rQE3b2v6oU8TEtT5QcGKP3fMAaSPin8SwgThBjFx6F3Qkyj8fdv4GkW?=
 =?us-ascii?Q?4gsW+CLKk+R17D4Rii8A4HxnInu3kuK8zmm6CgAJvo9PoYZWA+i3yae7eMIL?=
 =?us-ascii?Q?c6EnCp9wcKSj1j1dGRHaMjCpEA7z0kopVUmL2Yexpg+RiXt2u3KcDurM9LXt?=
 =?us-ascii?Q?2V3Vb6Ic4CsrZNyp7g7gvS9tSX0mOynBvYwZljG2erXAA50WpjHtOu1JtxOX?=
 =?us-ascii?Q?TAprbZv3+qhCUmWea39N37BUyAP5UIpkjXJnfNvufz7Jc2tSIsaB+sg1L/sV?=
 =?us-ascii?Q?X7EyFeTIXodYLdtGQiqzUjlqnWmKi79kIlLla/3uHtbL88gQ9npraIsM8inv?=
 =?us-ascii?Q?3sHKB0tfps6X7GaaBROsWDPjgZkGmtpjDVR2Qy7r+tidVTMWpyF4luJ2UxJO?=
 =?us-ascii?Q?bLgu9+C3Vd7Pze8ZI64D/qYl1CrErYC/slHYCPGD6TF/wVZzkwGv+sOBSlt7?=
 =?us-ascii?Q?+k0IojFqNgDOp0nD37eio/BR22C2+yCReqdeAPYBThNgsla9TyUW6JaPjhqV?=
 =?us-ascii?Q?wdY/cZrxWmfGz4bQb5BmcPEddOa8A4bb14OwzocQaHB12ErgAJtR2JgNpSLy?=
 =?us-ascii?Q?bre9IHnWp4Na3X4k0HYF73jhdophUsOOPi6q+FIInG9Qfo1CabKnUlmcrqZR?=
 =?us-ascii?Q?dNY4LVwh0kdLBP9dfhpitutg4D/LX+UEBFBuB4qFnMSGjLXz71Mg49Edfoxd?=
 =?us-ascii?Q?zgnlEfqzj6saY/0pr28NHYHen47eObk7NhRG8zpMaWde+X0FWZaHFZFCy5HY?=
 =?us-ascii?Q?lSkBIM/yRMmdodLYLhdS0rTcyxRNvRU48F1WIAJjkbksNnrQuaTX11+K0ij/?=
 =?us-ascii?Q?/oDOVvlmWEkr9x+oA/pLJ+QbIMVftvckCJcCPjxWZZjFhhKKLR94sdAIXHjV?=
 =?us-ascii?Q?Zi76h7/ZHvlRedLqi20V2/NMgO7QbpHM7+5Hb/OvjuqCgauGONk9MuuATwYY?=
 =?us-ascii?Q?9wDrFzjXutlpN/YvrrtwnWAVOKkHjOfEJfYKOqAfTWmA99FggDP9m2UpVEij?=
 =?us-ascii?Q?ij1pQm0xBr5/lmW6WP8YCZbM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR07MB3509.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qly92Jo6USSip/nipXp5lmsd1wogtiz3cbT6rkjIu7cwyK4hZ8yqLlumBcC9?=
 =?us-ascii?Q?AFYMjMGHOXCMxQEVXzON2mUCA88kubMWXNGRGVLp5af9/8OdGd/5O3+PK4cy?=
 =?us-ascii?Q?UtKwwl5RCVoJ8CKCRA8NtQhO0uUQEyjbaa2xUOyehdVQFGnmPuhEhBkPO7oi?=
 =?us-ascii?Q?Ph6B/Nc995VH6PkrZozfgWFTb//yho7MkQ6GznQjzrITQt7bksW5KK34LNVx?=
 =?us-ascii?Q?w4RewlrMj7WRA9BgnG3agKwscuiPw15POE8QrWQu9mRlChsmLcFhP8cGsrxK?=
 =?us-ascii?Q?WeHElsuxpiltJntxww34LRapnHw+OoSqWx7M0BPyZrviRoPImH4WweHMmuDq?=
 =?us-ascii?Q?osQY+0EKROU8KAUyva0MxN5I/83Zk5ZSlCThjtAcw+kfxdsXf4eNy5CPWdhF?=
 =?us-ascii?Q?4NZPqcZ1XuW+zLiWJ70dVBTLUVMZUF7gLqqGlJmkCkgsLb/rmNNSnLN9oaoj?=
 =?us-ascii?Q?zjfGQ/81jIcwBybpSNp8M7zaIgFbs98kVarh24zOpGDAcOgTG05uIWWC0yBK?=
 =?us-ascii?Q?v4rK1daOQPe30F14hyYHkcFMLm2txJmkYXtL5Gh5rKhXI9lcBw9nBcXLMrTC?=
 =?us-ascii?Q?bhbwQRFO+pFlPoR0A9Otw5LNmHmeLf+aREbY7EycCQoiWqIeO3XwGMJz/nND?=
 =?us-ascii?Q?FZNfdUYbXVEq6x4mdu65VmCJWAv6A3cAIwd/dRkG+srAZnXYE2IO+yPyv1O2?=
 =?us-ascii?Q?J8qlsb4l+vLfAjOi1zbd6BpIdW6oQXJf+2nS2E9anKa1RvqQn6wlWu1HvZjy?=
 =?us-ascii?Q?UVIwD9mzGyJXE3Rt/Pmy8RhrEdCBfD2TG/jULDFrO4XlzmwfEaOmhbxEGAub?=
 =?us-ascii?Q?pz+DZ7yCBuGWOwkdtrkqfSYH+4Aidqfkko5OSJvFNTtmFG6Ypqt56xKqAIke?=
 =?us-ascii?Q?A095Ir04yMgpI2Xs/WtIAyKFtVguGA9gH9xqMtmWvCp9tRFN0DSe80maxNkj?=
 =?us-ascii?Q?tanAz81skGuju/oqdW43MCQclesLYY4aGvEk5wRURA/ThljqOEgLVHV1YRlC?=
 =?us-ascii?Q?x7pa/F/GAMaaSwRKPEkPTafGx4VN5p+LiJ7oBqYZ4AIo/su7imc4L+AhCFGR?=
 =?us-ascii?Q?G1msQWh9sPF5Uh8Lam4p0jPzRCy3VjT3ea0mF82c0wUy3iJbslh+Kfc6Fhh7?=
 =?us-ascii?Q?7xL7r1FEUMvyuoZEC+aQ+KyLZPBi8WRwG/Sa034PJKpPLrkZg37JJZnrTYbW?=
 =?us-ascii?Q?297vhyFUTZqhh8S+C7Pftyqd2o80ZNaSTaJjthoDcKWbCNoPQmIuF/8KFELg?=
 =?us-ascii?Q?BmXS1L5P5LMm1W7vVHor0P4ifpIl/DPNevv/Te7BYG5hFTF5C5mrPcRfoXju?=
 =?us-ascii?Q?ALEphVUa9i1wm5QNgS60apY9UYolbpdC0Jfv4b0Oc9iRb5dV6xLO74x4PXZS?=
 =?us-ascii?Q?JdwLUJm3PJpQGhuMg7/fNIXf8bzOi9obWY88ZZoFywZ5ZgUTGsjSW33qNsQP?=
 =?us-ascii?Q?JLHEWl0PZ2CkJ3D/ISKR9MsINYJ5lhVGgn/eSXBSln1pzM/UcmGvLZnFRNtZ?=
 =?us-ascii?Q?w3BvaY8IFop04vJTycTObVQlEHAcr07FpIR3baU90z+RlHrLBlO7RnhTYja+?=
 =?us-ascii?Q?SXOx4oTh3TjcGL4sYQCunNUOJ+ffv4T0fkMoRo/rObfBmjvivSWt7n1ZwSHl?=
 =?us-ascii?Q?FAReqx1zgKE9lYY2BEr7IBqrlgVr0XlOcvr+zfcgjhbhAmoMuff2KbXiIR2Q?=
 =?us-ascii?Q?YS+/5g=3D=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38690609-c82a-457d-3105-08dcef5c2915
X-MS-Exchange-CrossTenant-AuthSource: DB6PR07MB3509.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 10:03:48.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ued5fu8YH/ND+PTrJh34s1SsLqceR5SNDICJJj0wI3vZwCocOacPaHL8HPRz+zxru5oVRTOpswQPqdaaneiWf05YLa0RFqAbaPBnHc44MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7139

If the channel selection or deselection times out, it indicates
a failure in the mux's I2C subsystem. Without sending a reset pulse,
a power-on-reset of the entire device would be required to restore
communication.

The datasheet specifies a minimum hold time of 4 ns for the reset
pulse, but due to the path's capacitance and themux having its own
clock, it is recommended to extend this to approximately 1 us.

This option can be enabled using the i2c-mux-timeout-reset property
in the device tree and should only be used if the reset line is not
shared with other devices.

Signed-off-by: Wojciech Siudy <wojciech.siudy@nokia.com>
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
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 51 ++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 6f84018258c4..316048b0011d 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -110,6 +110,7 @@ struct pca954x {
 	u8 last_chan;		/* last register value */
 	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
 	s32 idle_state;
+	u8 timeout_reset;
 
 	struct i2c_client *client;
 
@@ -316,6 +317,30 @@ static u8 pca954x_regval(struct pca954x *data, u8 chan)
 		return 1 << chan;
 }
 
+static void pca954x_reset_deassert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_deassert(data->reset_cont);
+	else
+		gpiod_set_value_cansleep(data->reset_gpio, 0);
+}
+
+static void pca954x_reset_assert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_assert(data->reset_cont);
+	else
+		gpiod_set_value_cansleep(data->reset_gpio, 1);
+}
+
+static void pca954x_reset_mux(struct pca954x *data)
+{
+	dev_warn(&data->client->dev, "resetting the device\n");
+	pca954x_reset_assert(data);
+	udelay(1);
+	pca954x_reset_deassert(data);
+}
+
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
@@ -329,6 +354,9 @@ static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 		ret = pca954x_reg_write(muxc->parent, client, regval);
 		data->last_chan = ret < 0 ? 0 : regval;
 	}
+	if (ret == -ETIMEDOUT && (data->reset_cont || data->reset_gpio) &&
+	    data->timeout_reset)
+		pca954x_reset_mux(data);
 
 	return ret;
 }
@@ -338,6 +366,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
 	s32 idle_state;
+	int ret = 0;
 
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
@@ -347,13 +376,16 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	if (idle_state == MUX_IDLE_DISCONNECT) {
 		/* Deselect active channel */
 		data->last_chan = 0;
-		return pca954x_reg_write(muxc->parent, client,
-					 data->last_chan);
+		ret = pca954x_reg_write(muxc->parent, client, data->last_chan);
+		if (ret == -ETIMEDOUT &&
+		    (data->reset_cont || data->reset_gpio) &&
+		    data->timeout_reset)
+			pca954x_reset_mux(data);
 	}
 
 	/* otherwise leave as-is */
 
-	return 0;
+	return ret;
 }
 
 static ssize_t idle_state_show(struct device *dev,
@@ -543,14 +575,6 @@ static int pca954x_get_reset(struct device *dev, struct pca954x *data)
 	return 0;
 }
 
-static void pca954x_reset_deassert(struct pca954x *data)
-{
-	if (data->reset_cont)
-		reset_control_deassert(data->reset_cont);
-	else
-		gpiod_set_value_cansleep(data->reset_gpio, 0);
-}
-
 /*
  * I2C init/probing/exit functions
  */
@@ -625,6 +649,11 @@ static int pca954x_probe(struct i2c_client *client)
 			data->idle_state = MUX_IDLE_DISCONNECT;
 	}
 
+	if (device_property_read_bool(dev, "i2c-mux-timeout-reset"))
+		data->timeout_reset = 1;
+	else
+		data->timeout_reset = 0;
+
 	/*
 	 * Write the mux register at addr to verify
 	 * that the mux is in fact present. This also
-- 
2.34.1


