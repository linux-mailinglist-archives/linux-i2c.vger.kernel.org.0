Return-Path: <linux-i2c+bounces-11409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3E5AD8A07
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5D9189E2CE
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C615D2D5C6F;
	Fri, 13 Jun 2025 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="h4k+d6V+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012037.outbound.protection.outlook.com [52.101.126.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80B2D5405;
	Fri, 13 Jun 2025 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812973; cv=fail; b=tWFrQ5XrNzbAu3LfWfwhNpbqRz2ICC3EjMDHvG1LvPZMg0YPe7a8WY0LIBZ2OL/NU8tFPWaOBfU2MbvfswJmy8ttj3/ApVC7YjsfwlWLjWXBOnW+xk51Bt98pt7Zpw5rP2YbgNRBO/rrtEohW8ZeF9LRn4Lftgp/DoDQ4pf69LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812973; c=relaxed/simple;
	bh=7Fw3wtJ73vv3Qgm/3GkbI4mQR4gPkrDSmIWryYYMxS8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QjOuv8ljCvEArZa8+MjPyjuupPNGIY5HUtDg5VSNils0EvYKLzjKKME/nEQnw4yC/WZHHuMLbZLEx2CFPZ6vaqLE/Rk6CgKrpEFOnQm+jVlPwbFHLgysD78zap/BWGjYbmPQqqZVWBqRJNdXQ7lKC02GXvtYx9WJqcynmRZkgZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=h4k+d6V+; arc=fail smtp.client-ip=52.101.126.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfyq41+PUvQ4foxrnDW7G+Cv7P/PVbKDXeNZL5fr3E+Bx97aodZPAA6mO18E1Bbh65Vzh2NHykkOVmryHpwgH88U/Vu9ShtkTTlowXUJZqKWKNVHx/6jCverMET/I6eXs/OU3pPTYTXW9GW6oaS/3aOdI6l6c09AC3Iw4vA06HmshYpR/tjvbpLNdw/4KAp4BCJlfViwi60f7mEyrLkiEoSoBNpOEx+tX6hcrePVB8gDux4c7TpOCUimy5D5SARkyX2vv8quBQqiYHPT42WU44Ji6evUDEz/pzHkxpLIdM3llvYOP3svS6HeOxgteLD9lfzJcSMmwjczWygNvD0F/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtMBj33Sx1oAMqINRFAH5h963S3E6ZA3nRC5DmVePTA=;
 b=FsFGmY9pbNqRuxE4U6YCDk+notS9//yy/OwbAMPa0myiENc2vPI0t0mn18I7LcJfTwIkcY9gFDnVdKLWwaip41t3tch5OaOe1WQJnCOvAcbou/h+5weH9SVOks0I8Y+MnLgQQt1DyY51ia3D4+Ll+/ZX/pmQd3/OgfbaHK6nFp4QVsGlCFs3an4uPbho5TKQKnxOG1CjGsKqvF4RQPDB/9/kVfCzNf9/K1+oHNMTCt7S4QoggmBZjIXps5vrlE2oK/dpW1MHhX5NvgiyHeLqwggar49z/E6kvJGvHSctykZOEU9QcWs1Ja3cfMyWmFYNo5HSqZRytuC8xgP2UfBAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtMBj33Sx1oAMqINRFAH5h963S3E6ZA3nRC5DmVePTA=;
 b=h4k+d6V+icWoKqoAxKGOM46onww5lRlZsN3AsXB5hvriUWSXqiLt4IVUM4gSbIzomV0rFfCuLF3VgoQYIOaAifj4bK2tZvd5qhgXDoyAbaLGrQico8iHXKqJ3CcsCpBu5RGdaZGjXQp15wiqlH1ZPO+FYe2guOPUZfX+8GWgY4JlzVCb7iwX/QEO9+nNf/gX1lUQLaScfFHJnI68PAXXUVG0gTDb+0M74E1N9oB8S5/wz0p6ZWe9Gtyd8AtEanNvk54sLkCYKNW2mqyBNsK1YNkqu0MbN9ExEYPQuJkeDsjo0z+T/MIFexkNqbgO2UghGN86SJeJ2rin7Z9StKVcew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB4802.apcprd06.prod.outlook.com (2603:1096:4:169::8) by
 TYSPR06MB7344.apcprd06.prod.outlook.com (2603:1096:405:9b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.29; Fri, 13 Jun 2025 11:09:26 +0000
Received: from SG2PR06MB4802.apcprd06.prod.outlook.com
 ([fe80::685f:929d:f06c:a349]) by SG2PR06MB4802.apcprd06.prod.outlook.com
 ([fe80::685f:929d:f06c:a349%3]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 11:09:26 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yuesong Li <liyuesong@vivo.com>
Subject: [PATCH v1] i2c: lpi2c: convert to use secs_to_jiffies()
Date: Fri, 13 Jun 2025 19:06:38 +0800
Message-Id: <20250613110649.3283336-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To SG2PR06MB4802.apcprd06.prod.outlook.com
 (2603:1096:4:169::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB4802:EE_|TYSPR06MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 6364c83f-8d0c-4558-b777-08ddaa6ac2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZAG5UpNG4jDEhZlYHg7IlulPsEV8PFsySc12eJdKEKed+yAEg711B8YOrq+/?=
 =?us-ascii?Q?vCfZLC+tdXnAea+OAuIBkUigRONdIaBVniXGa+NkwclnYWdvxPYM90e6Zv6h?=
 =?us-ascii?Q?P9uLvAPhQ7CSmZnIRQx5IBjX2N4vr9JYjPk4gydtUS82LIm8auwIMaooQlY0?=
 =?us-ascii?Q?OUrT99x/3e8imIAgCNyTIjAHJ/O9iuZ0vaDjG64837ZeiljpXzpFblgznGdh?=
 =?us-ascii?Q?/COyR9RLXgbDFMqCeHIsq5zSN7CE0GBZmzNaXEGnEBMA7m292dwotL0x+H5N?=
 =?us-ascii?Q?1/Uno35R3z+szmgNp+t0qzLqFds8peqv/LRdTNitwwA/cZPw0EevnA9db9k6?=
 =?us-ascii?Q?zV+cNCH0eliLv4W9wQKYQQtbNzfP2t6IskQgv2K4/qLiTNAW8p2gvA2svWJJ?=
 =?us-ascii?Q?Sv+ykmlH5r6U2YseDe/SP37PBa52mfM4U5T8UgnJzEgNkIdjAVAHA4LsBpkY?=
 =?us-ascii?Q?kggT6zGx5/y/NlI6bdDnk/HyuhzUXeQo2E5gYs9ca9jASXICF3J61T01F1P1?=
 =?us-ascii?Q?WSwm01tMjyDSWrwBfZwmLXnilX9lkap5aaz6BI5h1j2mvvjUHznzBJXXq35g?=
 =?us-ascii?Q?+rg8F/K40IQRDrxeSpn9t08HGVls4fRoBtE14VjD1lbH5U1U39J99GtmGZPL?=
 =?us-ascii?Q?j1jYESQsxJpx3HWfB0fJKAxAK3jV+gjEHST5nvcRM8uNTIhsemu9UpHuyyfe?=
 =?us-ascii?Q?yZsD0AjZKTBFrLatjPHY8lJ6L6wQ0k6O0ys0ZRYpy0VWP5nnIEzR1h4Jt+Xf?=
 =?us-ascii?Q?yHc4KigA6v/htpk//O6YHYTAWHkRArtKW9Ay/RIaon4psVp2cyjsijrSNHMc?=
 =?us-ascii?Q?szYYpUNhwvN3vmPDTl3WfopCx4SkaABSInTMJGlY+U8kh5nFX+ur7cxJxw1R?=
 =?us-ascii?Q?N8jQhICQioeg0sCEBWm9DNabqrDRw131JD8XfJiF6AAIbURC8KWwz4jARdup?=
 =?us-ascii?Q?0T/Z1TjHfHL/wwamsapnzA8R8T4CoQPD7eiFcdgdr/jDsdsKZVX6d54ItD46?=
 =?us-ascii?Q?UPRgN4Hft8mbPTmv0tEDo6ZFm3TM2HWcO/qMgK6C2Ga76FLJA+Co7F0ccl/Y?=
 =?us-ascii?Q?heWfirPTVHORVFujXgW7yRmoRfgSDBeRp5UWD8Qb66r9cVp3V3WfaEruLB1p?=
 =?us-ascii?Q?6F4jz6MIlGKW0xRP5Qac+INGm3iF8JSDyIlBPJukuAt9rszUUxF7ZNbS4e7/?=
 =?us-ascii?Q?n/hoKFpF7+FkJPugxLu9mnNcZDyK2T45/N8TtKZlJBvE9Rr7JwYC0h6D27eW?=
 =?us-ascii?Q?CPCsBd82NBTKB8rH2qEqp4nAx4ZLeBxkUCjfanEP1lTYoGvgq7afrnKUESEJ?=
 =?us-ascii?Q?N+sz3SMatlFzDjRbZqs4mXmgmd43aW50LDw7T49kbseNbgGYtFn6MFzrlP2/?=
 =?us-ascii?Q?SyY01dndTdhxraTIXXyRs0n7i3hDrlvzaESkzuYy2QzHjyKILcUJElmpeNhW?=
 =?us-ascii?Q?TVU0mzZhTHNTvsehUhVfaacsrrdVFvK0SA317kCM1baH6qYSLGqrH52hFTBV?=
 =?us-ascii?Q?O3DDC6P/5/tnNnI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB4802.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VzmykN5X/bhC2rBh00nOTaIIsqx/8pnjO3p2xBiD3lg/BrrqoWcXsywCObD5?=
 =?us-ascii?Q?hYO5Zh1a4Rs+QP/9sJLwezxM5tbZ1CKoRN4UkHai9Tuulsx361KqwWV8PEyt?=
 =?us-ascii?Q?D+sy7iCpKpILTHLSmsbN4zdQmSORjKMyeofVyU6ASvOcazJpw2ZPavt3qOXM?=
 =?us-ascii?Q?ZteKCZ2CqcY8gkYbd+WNGewamiBox/2vUcBTftHZTWVxTday1XKg98gLkKND?=
 =?us-ascii?Q?8h8KU02/EMbetEBo/7pa2BN4PP5J1NA1hJxpcdyQz47VhhIl8s3Udv1xoqTF?=
 =?us-ascii?Q?sXDxooGgjBN8MeTcFPbkKshmggBiVGt0J7A4dZLp8kkYOOZXvaZK4IaDvc7Z?=
 =?us-ascii?Q?LJgK6xnlIy0MfCoOmNiver1ZOV3RVp2D+mcKLLP4yuHCB0TOgGdY1CWnxz+2?=
 =?us-ascii?Q?s0ErVfDXcNdI+rpEx4iv7ZvGpjkw5iYQL4EruplIaDykY/Sh5+TDn+k2g5yr?=
 =?us-ascii?Q?7GoNBzfHX0GtCfrAScnq//V5Cn454vKdlb6FQ7BSVgvngUORT+o0jI7FXYf5?=
 =?us-ascii?Q?cpjSD2Pf5THsefwZQ2T3wuy3pCL8F1QnKfFJoDeJvMpaHAwRj3Fisb5aBPzx?=
 =?us-ascii?Q?4xs0/jB5He2xzZFoSUkRPhjXU8H+YQf8LE8CCIXZ+dlBi/Q7RCPm+eyKCzvv?=
 =?us-ascii?Q?r+Lvmn+8vt1GzGnJldb0o0V3I214SR7ZZB+6/8+MQjA01V7yvWJLus65REd/?=
 =?us-ascii?Q?jrPOh4fS2kbx1zIpaCOXMNJaXighfZifFtGq4pImvWCldtknyHCdUG/tlwna?=
 =?us-ascii?Q?sjmed2b9RlRjPomScuUcNqyS7PDTcCkjUA5cUcN5muVoX+n7k+cXJRCfZPQT?=
 =?us-ascii?Q?9aD5KjEr02KE8HmnU/QikRWC0PM31DVRLih3+US0S+duS4MxQiiF/lLQMvMH?=
 =?us-ascii?Q?iVagUBJj5miVRMbQ05ivIZjWlLP7Wxlc+zREmn0eiDUAgOWHC7FBHYyQcuOJ?=
 =?us-ascii?Q?oo6ruC5sBloqSN6umoMDCRLmrDGLHOswcIp6eB/IVi6Po6e+ExFwYEPRz3/U?=
 =?us-ascii?Q?7X11ZV6+Q7DrVpkvMoI5RhBOVoOzDUjZ2BYUCkWiG5Sw4cKoMb4AufjlsJ2M?=
 =?us-ascii?Q?uArlVNtAuZtp8dXymWzPgiF5498DJKXKJcHZZ1oxRSsfj82YpwNHm+Efx/Pc?=
 =?us-ascii?Q?QUaEfI34mudt3XQeYlC+K+P6MqB2xTzZ67cRCJNYnE0N8gx5XJbp3gRj2Ygf?=
 =?us-ascii?Q?GB7RJhcqG8WI3FajEkDr2BfQGFmUoLsqeZzBh3j900+tj4+7DAtI3lIguVpO?=
 =?us-ascii?Q?IRmK7QE8YbaX9WR81j3zveJExZSkHMkECjS+nIUTSv0kp76Ij24zt52Dy8bU?=
 =?us-ascii?Q?HjZCeYV5wRxnSzH2iDq0Z3nlY+KAn3mHb6YiumR3mu1tzalonhLz42050Lug?=
 =?us-ascii?Q?3EnAcY1V/MAWtVlw034JuLo4PawioBf4lxIPCgcs0eD/jZjLuqeRQHW7msdB?=
 =?us-ascii?Q?D/uKeKBg8BkXUTF+OujaWuQO9+GmWW2AkcJ0VoVO+zuYosxwPblZZASS2e+1?=
 =?us-ascii?Q?aIY+trU3zejytLiX2JT+TkeER82n90mkI8a/DVnFno8/7J9yMJXa7v73v2U1?=
 =?us-ascii?Q?t8vlGair+RNrwWCSWwcRR9yhSYeC7CChI546DcDb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6364c83f-8d0c-4558-b777-08ddaa6ac2aa
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB4802.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:09:26.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiI+rKyy9lxoM7ogv6hBLT3psF+PWw2t5DmURJxqcFUmeDUIYiOiFJhTCYfJ6Sg8HhTvaEQbV2oBN4xaRC3C/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7344

Since secs_to_jiffies()(commit:b35108a51cf7) has been introduced, we can
use it to avoid scaling the time to msec.

Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 342d47e67586..dfdfc23551ab 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -563,7 +563,7 @@ static int lpi2c_imx_dma_timeout_calculate(struct lpi2c_imx_struct *lpi2c_imx)
 	time += 1;
 
 	/* Double calculated time */
-	return msecs_to_jiffies(time * MSEC_PER_SEC);
+	return secs_to_jiffies(time);
 }
 
 static int lpi2c_imx_alloc_rx_cmd_buf(struct lpi2c_imx_struct *lpi2c_imx)
-- 
2.34.1


