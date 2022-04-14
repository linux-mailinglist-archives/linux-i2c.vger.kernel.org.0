Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E532500388
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Apr 2022 03:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbiDNBTo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Apr 2022 21:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbiDNBTo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Apr 2022 21:19:44 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510A44EF41
        for <linux-i2c@vger.kernel.org>; Wed, 13 Apr 2022 18:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbiWztU1VBmu29Xsfjy0B2D5dnSX3YsxtBByFOlVWa9i/x5NDhIvydbfEslJ7BBJI6eiX5EQO0x8Atx0RM8QcvCvUls0fmcUd+FZcCy4VFtUKA4qsb2VkQNW3qCUK304gBNkXwcrx9Rk8EHLU0/OAhK++4dh5va/LtctD/sSlWbIRVCq+CaxDVbiYtsqum+4cCedAUQxaIfeIsdALXODwD9b1XJWgiXR3qq3zHMGYbf4U8GvOGrJDo9+pPlQPmHcwvPvWZ2yE7JrZrgT03r/0I27ztpf8no/LKYwXLug3+nW6V4R7qukUzbCqG2lDwaw6a8fuIQhjlIe5hN/ndtCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olDh5WlG9e8eWorc8jvIPFMyGtbUjHKeY2gKQgA0HeE=;
 b=I3KYhCNW7EpXELZzO8OzNSd1HJklWFOXhANGagIqooSvZwjGoeab3jcjJvK0iZzhVM9WXvzvIthj3hKsgN1P1iqKaaYEv/c9eRnzp+UNVFL9RVQ0rGXJBspDrW12pAHJ9C0cXphERnjqX0Na3v00FDJeCwO3lSkPeE+EQNyzAmw3EehHcnwRUqbutDsV5e6WFcOc25dCSD8Pv5oDdDES0hMTRjimBPsNf/sNn+KGshngJBlJxfQ1yaZYT0A+/6asA8v+FXcteC2aK9yNUg1Jwkn1fQVW9Zokrl2EhQHqhQvxh/7hyxOcG783bEPQR/S4Z6TupfSZPCjd2c9hmA/0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olDh5WlG9e8eWorc8jvIPFMyGtbUjHKeY2gKQgA0HeE=;
 b=ebZvrUFfN1XTtYAW5rygxkKceCY4pGQR7OnprsymtE2ZsxTdWsdxyPXU4yTY37PZDCnom/O3JS6xkPXyGh0+PC0CGbxVEJ5OBRJg3ZH7WA75CXyxUA69x8eRNv5R44rREEFza+6ars+iqwDQgVWSebMPq/HEKQF1P3vGEJtTl54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 01:17:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f%4]) with mapi id 15.20.5144.029; Thu, 14 Apr 2022
 01:17:19 +0000
Message-ID: <8735igtqe9.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] i2c: rcar: use flags instead of atomic_xfer
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 14 Apr 2022 01:17:19 +0000
X-ClientProxiedBy: TY2PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:404:a::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 916945fc-da13-457f-4c1f-08da1db48536
X-MS-TrafficTypeDiagnostic: OS3PR01MB6982:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB6982E97AA7025459B2CB4622D4EF9@OS3PR01MB6982.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 329IQfFZex3aG9a1N77qD9Sem1+5kcuoo/yOjE6NJOBElGP5oefHhQDAc3DhYHkQyCv7hc0DN7zkPFLaCHCqFaqcXcInPbfNBXIRcdnTmAQS+EWZmX4Dtc6NE+tbRsdO7Osz3ruMNa6cZ7kJBs75nv3LxvZEw8fkdfBjnaf0RS6SKeRagnEiQr0z3lpW0UOwylWCJy2pjpd5Q+QKdM+J/UK1CIWXUMmpMQTrCtg4YK74nfEB41uB18dZgxaKmAx5A8rPln8t0TeGieYP3q061CV8JMl5r4OgmGmLyc6E3leEeMz74uA8trKq494Z6goYhTUORJUv5qX4TQtLjVrBJ3zuY8EcAtTyyaDYHJwwRkGbd0RP6UD/U1UuDVOH2zE8x8mrRywDpWyTYACmAaSYurS3GIHwKBuVuhmcH+Rqz3U0TDuvvOyfW8Nw6LO3FsX/YSQryOoKpMQgLWrQmih3JOcidXpk+3mgT2uWHNKPwgO/ImGefwv3NtLYkThaRVumf/FJLwasIWQKKxuWhfFkbcl6WfslUkAqqbuFyZQQw5WNpNkTOoSW177sBddl7dRghOeE9EwXBVBwnON6Nt7+S3TofaLlyBI/GnSs5TJaf46UlHJIc17MRdko3bG3D3w5SPsV5je9ZNEOxh7Y+E2zUbovyxTT3SV8AUp3cAEauoW9PcYdtmc09QDzUODppE0XhBtTi/zoGDXq9ZYpgorWrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(36756003)(83380400001)(86362001)(8936002)(2906002)(186003)(110136005)(52116002)(5660300002)(6506007)(6486002)(508600001)(2616005)(38100700002)(38350700002)(26005)(66946007)(66556008)(66476007)(4326008)(8676002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lkqxsEuFHYgxQCoNc1k/UKQLlHSJKh46Cl4/rc/AE3HztklC6N2RJlKEHxpU?=
 =?us-ascii?Q?6d+CjTdVbjbWAcudUnwf6aqbJY1NbZjhZA56nI2g2FUYZDh7mUbqTsR7swBa?=
 =?us-ascii?Q?pxtJD1ZcaROik3QQ1Cwhd/3ZbNlI9xj+DmcOtRtj76P5nHkLvPm+j7U88DMV?=
 =?us-ascii?Q?wmiC/4sIhPKGCl0h3AM8eLWliyg4LtyybPlB9jR8rYDdgtXBhr5wgn7VTv9Q?=
 =?us-ascii?Q?kmwDQKJg1oMezqTSqQZHqwPOCd+tigfnKHHWjNHMnScWUwi/dWZ/5yEEY3oY?=
 =?us-ascii?Q?vcL20wzTlIm0l5qNu13o0LfyCMAZyGZUuw9D3dW1FfTyiRQ64Bmp6mKljDq3?=
 =?us-ascii?Q?WuN4bdps9YVOHvqbl4UOlb8mZ4PZOcmyG8uQeM5LuyrnSP1Lv2TRJkxuqurd?=
 =?us-ascii?Q?oE+/kCzPoCT1//1tRPyEwQyu83/wEklQ4IWTV3QglHoZYz86C0CnsZMOnxsw?=
 =?us-ascii?Q?vTmGHwIZ4gQHeFotdL1EP4LnE0Hd/kAWzRke3GdjxWWauiiNIR6uWj0dibf1?=
 =?us-ascii?Q?gzPcKN1YwRt4lw3Gv2si/OOd+PEgMxB4HLBW6rxJCGFYYE3ESzd5VeT6VOe9?=
 =?us-ascii?Q?zNsCTKxYwbv7awqI46Ht/4GnyIxqprkYLakY1bzSwJpobUHTcfPYHfG1nxWI?=
 =?us-ascii?Q?o8l2z4sTuxXs8zhMFfSEGlua6/xA/rJAuwrrmGqua6+W9N7rguEEg7QN5wns?=
 =?us-ascii?Q?yCZx5RkXngLFPDTy618+n37BLZR/iQq/GDRq3/Hy2WSyxx0xF8b1nzIJhRE9?=
 =?us-ascii?Q?R0iI+CpV0lR6cMs2ZdmlYt/gXlRvomfN/8WFuHYwBgON+XL0hdwhxdEBR1bN?=
 =?us-ascii?Q?SRal9bT9eVZfrMe4wf4Xn9qxv4xYc4ILn4H8IhfVQyWIcsKcHlmwzvRKwgmy?=
 =?us-ascii?Q?TGG/Lg3qkIyLS6M6WhZ766kpybdMuqJHNWO0melss04TnlZyt/oNm53UbbeI?=
 =?us-ascii?Q?vPAvy4H+EhP3B9ShPvVRyNl0LlyDFmMTCMsm8p+em5cRKX/KDLqKtfJNFseu?=
 =?us-ascii?Q?yRgnLj3IA7krm5anr7ZNS14Xht6EuzXSi0I4qDgYP432RPo2rCLFsZHu1Ek1?=
 =?us-ascii?Q?aWEJnpffkRbIsivEtQE8pj/Cq/ELP3CTg8oq5tqhlCCyK9QTIHqWz7jiO9+5?=
 =?us-ascii?Q?zJrExFasZWDaAqizz/0R6wCRC+sq5EShEX9mriJSCI178Fmc+uQrxSRE/Ubf?=
 =?us-ascii?Q?6Tsxqa0ekrhPKAmscYr4yZGdI7zWDk52qCnAU8UuBOR7nHXE/45ncPHs489f?=
 =?us-ascii?Q?dqZcfTq6O5D+D61S0xx3NdACqBjxbtoMpVS/I86cpdMC5JfxrZpT9jjKPcgt?=
 =?us-ascii?Q?uN3eDRbRSGe0CHF+Gndd/R+eevbglwStEDteI0p5pN7msvH3cMOU8S1Ae0eP?=
 =?us-ascii?Q?7MGSATl7Q78YO4ldZ9AauULvfOQ36tpFV4zSufXHPmUivLs+f8uA1VVlrGBx?=
 =?us-ascii?Q?HIeq2t4CXw8K+a2Df/FE7j2xqD7Y496C3DhOwNao0xr1sl904w9SWysEe7D9?=
 =?us-ascii?Q?2H+jaoLLEodJ7Du+ErAOwtrSMvH+zRpXKsKN8Lw4eXF1xU1jL80TeHCNN5DJ?=
 =?us-ascii?Q?N3dQNT7pSMkZWIWGxkVr7ELbxhwLL4U7GpYdqS4dFkF2eCXlv75ggnkmkreU?=
 =?us-ascii?Q?Rj+9sTedU3xwrz/cnd/4B7YdBUGNVuaJWNwLp2IKGKfJ0QttlHB9+6eEKI+3?=
 =?us-ascii?Q?tTVNNp+tOkSiiPRlbOFHqzEY4UrToNHa60CM3GL0ScAc7mNMK5rNT4jTU+Ru?=
 =?us-ascii?Q?S9aPHxVgXSZpDqYwijGtFE9BxUkvNtO8Mzp2PglPFlPsssWyuEwr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916945fc-da13-457f-4c1f-08da1db48536
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 01:17:19.3374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJch+T9eAvl5kvNmSipql1vH0Jx34dC9eC5GgnHRoenF70MEB36xRmrFcvThDEK3ik9V6zoov1JffvkVgaB8b5KCGyJg564Ng3nt3U4vsE+zV9qeDoXK6SVjaeZ07yoB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

i2c-rcar already has priv->flags.
This patch add new persistent flag ID_P_ATOMIC and use it
instead of atomic_xfer.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Wolfram:
It is not deeply tested.

 drivers/i2c/busses/i2c-rcar.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index b5f0929bcea5..9cff505c019e 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -106,11 +106,12 @@
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
 /* persistent flags */
+#define ID_P_ATOMIC		BIT(27)
 #define ID_P_HOST_NOTIFY	BIT(28)
 #define ID_P_REP_AFTER_RD	BIT(29)
 #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED		BIT(31)
-#define ID_P_MASK		GENMASK(31, 28)
+#define ID_P_MASK		GENMASK(31, 27)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -141,7 +142,6 @@ struct rcar_i2c_priv {
 	enum dma_data_direction dma_direction;
 
 	struct reset_control *rstc;
-	bool atomic_xfer;
 	int irq;
 
 	struct i2c_client *host_notify_client;
@@ -339,7 +339,7 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 		priv->flags |= ID_LAST_MSG;
 
 	rcar_i2c_write(priv, ICMAR, i2c_8bit_addr_from_msg(priv->msg));
-	if (!priv->atomic_xfer)
+	if (!(priv->flags & ID_P_ATOMIC))
 		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
 
 	/*
@@ -413,7 +413,7 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	int len;
 
 	/* Do various checks to see if DMA is feasible at all */
-	if (priv->atomic_xfer || IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
+	if ((priv->flags & ID_P_ATOMIC) || IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
 	    !(msg->flags & I2C_M_DMA_SAFE) || (read && priv->flags & ID_P_NO_RXDMA))
 		return false;
 
@@ -641,7 +641,7 @@ static irqreturn_t rcar_i2c_irq(int irq, struct rcar_i2c_priv *priv, u32 msr)
 	/* Nack */
 	if (msr & MNR) {
 		/* HW automatically sends STOP after received NACK */
-		if (!priv->atomic_xfer)
+		if (!(priv->flags & ID_P_ATOMIC))
 			rcar_i2c_write(priv, ICMIER, RCAR_IRQ_STOP);
 		priv->flags |= ID_NACK;
 		goto out;
@@ -663,7 +663,7 @@ static irqreturn_t rcar_i2c_irq(int irq, struct rcar_i2c_priv *priv, u32 msr)
 	if (priv->flags & ID_DONE) {
 		rcar_i2c_write(priv, ICMIER, 0);
 		rcar_i2c_write(priv, ICMSR, 0);
-		if (!priv->atomic_xfer)
+		if (!(priv->flags & ID_P_ATOMIC))
 			wake_up(&priv->wait);
 	}
 
@@ -681,7 +681,7 @@ static irqreturn_t rcar_i2c_gen2_irq(int irq, void *ptr)
 
 	/* Only handle interrupts that are currently enabled */
 	msr = rcar_i2c_read(priv, ICMSR);
-	if (!priv->atomic_xfer)
+	if (!(priv->flags & ID_P_ATOMIC))
 		msr &= rcar_i2c_read(priv, ICMIER);
 
 	return rcar_i2c_irq(irq, priv, msr);
@@ -694,7 +694,7 @@ static irqreturn_t rcar_i2c_gen3_irq(int irq, void *ptr)
 
 	/* Only handle interrupts that are currently enabled */
 	msr = rcar_i2c_read(priv, ICMSR);
-	if (!priv->atomic_xfer)
+	if (!(priv->flags & ID_P_ATOMIC))
 		msr &= rcar_i2c_read(priv, ICMIER);
 
 	/*
@@ -803,7 +803,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	int i, ret;
 	long time_left;
 
-	priv->atomic_xfer = false;
+	priv->flags &= ~ID_P_ATOMIC
 
 	pm_runtime_get_sync(dev);
 
@@ -869,7 +869,7 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 	bool time_left;
 	int ret;
 
-	priv->atomic_xfer = true;
+	priv->flags |= ID_P_ATOMIC;
 
 	pm_runtime_get_sync(dev);
 
-- 
2.25.1

