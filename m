Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04171CAF1E
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 15:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbgEHNOn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 09:14:43 -0400
Received: from mail-eopbgr1400045.outbound.protection.outlook.com ([40.107.140.45]:55680
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729472AbgEHNOj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 May 2020 09:14:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVb2MKKXPYYo7FqVAiVzHZkSh5fZwHErHXJkspkfhUS/9glELnUuqmXyW3XGozpI3kquwMsZzBp7tqoMBI/JZwmXTCVdqb97YLV2zNYysai9tG52H7itVG0hp/PLg+3EenEF7nGLg/7duz1fHuE5pzRsOcEFALZJL+3BNZ/+v8RhdW3u8LhRy1XeKj9pLxiLn0BslAjGlJ5ZFRHZ8aXZe78WFmUoRw2HSUnr6br72l2LcmVCmArRBsX8yGp4KE9Mtn/E0EGZTi5s8GE8zT6M68oVWh3oGGPmPWxx5XmWPG1vfAMItwsOvYgPqaQuWGplGod07s1q04V5L7mfg/omjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2dwxOJUkf1o020K8LzSohk6GOxHUquEO1eCT4sFCwY=;
 b=HN1z7dJWOF+eV2MxCKStMVYg0MmrV+chzSexI2eSNYacKB6o6ZoslDBbOSjySWoWU59tTpnsZ576MGLZEv+1I+MtoyyaUSOTUtdhHN7vtCmy/0JdQn35ThRbvYK7JEs2jgMPuBAJUE1Rw6TY6CsoGp+Qa27+f92t5PS4qX24O4ar/+Pk3x+0NSESjYxksTymjt4Kf5J0Vp1fO7xoaXwnIFookNyE6U9/efHtXxyhsnrYcfEfCoAI0Z7fbFgXKVh8a2p5VATBtg+rHWyMRVgPUMX6Uo7A0khUC/zKt23Uu639nOMr6LurzfJOpbiAF3PF4lUBYpSWlH0UZcPGxbXyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2dwxOJUkf1o020K8LzSohk6GOxHUquEO1eCT4sFCwY=;
 b=mSSU252BUv4DF7vKz9FF6O5GHYzh1rlAiurPjdZGmfvWEaWu7vUD6QrMRLu1E5fhxLPaCtdkliD4a7nfct5KFJyJdx+lHN9WJpHeXklep/HJlxl2uOnezi3Z3XrltW6n+o/LnE9KZRyTF8NauJVGyOylN6RrsRh0R+jOMtOoEgY=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=sord.co.jp;
Received: from TYAPR01MB2224.jpnprd01.prod.outlook.com (52.133.178.16) by
 TYAPR01MB5039.jpnprd01.prod.outlook.com (20.179.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29; Fri, 8 May 2020 13:14:37 +0000
Received: from TYAPR01MB2224.jpnprd01.prod.outlook.com
 ([fe80::3925:b98a:c278:1605]) by TYAPR01MB2224.jpnprd01.prod.outlook.com
 ([fe80::3925:b98a:c278:1605%7]) with mapi id 15.20.2958.033; Fri, 8 May 2020
 13:14:37 +0000
Date:   Fri, 08 May 2020 22:14:36 +0900 (JST)
Message-Id: <20200508.221436.2027916415032712449.atsushi.nemoto@sord.co.jp>
To:     Thor Thayer <thor.thayer@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     tomonori.sakita@sord.co.jp
Subject: [PATCH 2/2] i2c: altera: cleanup spinlock
From:   Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::15) To TYAPR01MB2224.jpnprd01.prod.outlook.com
 (2603:1096:404:4::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (61.200.21.62) by TYAPR01CA0147.jpnprd01.prod.outlook.com (2603:1096:404:7e::15) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 13:14:36 +0000
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
X-Originating-IP: [61.200.21.62]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77fb712b-63d1-4c43-c74b-08d7f351c20b
X-MS-TrafficTypeDiagnostic: TYAPR01MB5039:|TYAPR01MB5039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <TYAPR01MB503939F1F65D14AD148E2EEDBBA20@TYAPR01MB5039.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VIvPaKXqxXFpy39ECjB49F9Trc/iSAZ822H6EcC3PBTm02+3WSECApOsccywq7aZFc9jpMHWd4s1EHfSgyWth56ghsX59c5eOXooLq0rm595m0JalqI+NrcyjQii+z3FrG1qbNx7mnoSUjOPdiu4LhKYrWnsaJPFy+9Ajlb/pWGyNO6m4YjOBiUzwMNpgz46U2tYaHTgOvE9i7mSPTcMj6A1tOrLDUt9AW2MNK+KTy7LW2eEMEGFuWVjtS7RolMCosj+fm0BvwLDKE/xoH5TWNak5mF6xe4DZFJoRCknVwlMxcBoc4rIHJl5KFDrs7rERntMl1XBwp3SfZF8KC0pxahdrfBPKERAOzdTcUYXaMmrFSZMyGJemAponRwvFJcBtg6OzB8hFfZOi9ReIQJ6A9Yv6D03++jD1vaRv5Xoh3HpXqrjnKBoGopDQ6MtPmo4LIFovgVqqNv+ylutkbIHPwiPblL4BV5HozyymHMcsADUduKo0yvSNlhlbi1widjklrbwpN16KXOJtjJ5QgyvSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB2224.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(376002)(346002)(136003)(33430700001)(508600001)(956004)(36756003)(6486002)(186003)(16526019)(44832011)(6496006)(4326008)(2906002)(316002)(103116003)(33440700001)(86362001)(66946007)(26005)(107886003)(2616005)(83290400001)(8936002)(66556008)(52116002)(83320400001)(83280400001)(66476007)(83310400001)(8676002)(5660300002)(83300400001)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: uoEDxcU2EI+U5HLJaW4xQoDngbTRA6TP7RRWClDNShyYvqiu5F2heABvikPyOdLLIVRKHXDSW2AQ4YtsqWMYu8hzXNEbFvDZaloZtU2gXDdZ32fYN2GJ+LtuWoMaB6o3Mcfp1gN6+kYujAmQn63DrymRd696RDT8Xnc276Q6++FDpUITd1IYsdiCoIVngqhOhbvCohZj5ywMblWSSCIZyNBgtN/y9Cgz/Um46I0QpNlCJk1UW9M0kM58KiluY+XM6vJnzFy7iZsbgjat2MFTfevLSc0QgV0w6EnLYrwsnSQ7prXJem96ysq2hYQnLUVY26yR/+L8L+IFAKlTqWv1U8VkGL738l6PYzfBsRl7+YA9HgR7m9gI4FUcNo5ITHmR0zwAdJSOll4n1P2Tq8XDajiaI1qo7TOGI6RYV8AkP9Pja98QezprAv+hk18jW3CdIy5psoa32BzPW1IRgrAQfUBxCANqwpWLq0Ro43WHk5w=
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fb712b-63d1-4c43-c74b-08d7f351c20b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 13:14:37.0886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JC+Dg0pTgl7jL440VeeocjwMWP1arGDlHDEzSCAo0CX1DLW8yNYzV3LrYrjzA7C+r1Khz6tiA1yRcgCMcLRpt8DAot+VgM+AvqXP42vHW0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5039
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Protect altr_i2c_int_enable() by the mutex and remove unneeded spinlock.

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
---
 drivers/i2c/busses/i2c-altera.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 16ddc26..997434f 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -69,7 +69,6 @@
  * @fifo_size: size of the FIFO passed in.
  * @isr_mask: cached copy of local ISR enables.
  * @isr_status: cached copy of local ISR status.
- * @lock: spinlock for IRQ synchronization.
  * @isr_mutex: mutex for IRQ thread.
  */
 struct altr_i2c_dev {
@@ -86,18 +85,14 @@ struct altr_i2c_dev {
 	u32 fifo_size;
 	u32 isr_mask;
 	u32 isr_status;
-	spinlock_t lock;	/* IRQ synchronization */
 	struct mutex isr_mutex;
 };
 
 static void
 altr_i2c_int_enable(struct altr_i2c_dev *idev, u32 mask, bool enable)
 {
-	unsigned long flags;
 	u32 int_en;
 
-	spin_lock_irqsave(&idev->lock, flags);
-
 	int_en = readl(idev->base + ALTR_I2C_ISER);
 	if (enable)
 		idev->isr_mask = int_en | mask;
@@ -105,8 +100,6 @@ altr_i2c_int_enable(struct altr_i2c_dev *idev, u32 mask, bool enable)
 		idev->isr_mask = int_en & ~mask;
 
 	writel(idev->isr_mask, idev->base + ALTR_I2C_ISER);
-
-	spin_unlock_irqrestore(&idev->lock, flags);
 }
 
 static void altr_i2c_int_clear(struct altr_i2c_dev *idev, u32 mask)
@@ -346,6 +339,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
 
 	time_left = wait_for_completion_timeout(&idev->msg_complete,
 						ALTR_I2C_XFER_TIMEOUT);
+	mutex_lock(&idev->isr_mutex);
 	altr_i2c_int_enable(idev, imask, false);
 
 	value = readl(idev->base + ALTR_I2C_STATUS) & ALTR_I2C_STAT_CORE;
@@ -358,6 +352,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
 	}
 
 	altr_i2c_core_disable(idev);
+	mutex_unlock(&idev->isr_mutex);
 
 	return idev->msg_err;
 }
@@ -415,7 +410,6 @@ static int altr_i2c_probe(struct platform_device *pdev)
 
 	idev->dev = &pdev->dev;
 	init_completion(&idev->msg_complete);
-	spin_lock_init(&idev->lock);
 	mutex_init(&idev->isr_mutex);
 
 	ret = device_property_read_u32(idev->dev, "fifo-size",
@@ -453,7 +447,9 @@ static int altr_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_lock(&idev->isr_mutex);
 	altr_i2c_init(idev);
+	mutex_unlock(&idev->isr_mutex);
 
 	i2c_set_adapdata(&idev->adapter, idev);
 	strlcpy(idev->adapter.name, pdev->name, sizeof(idev->adapter.name));
-- 
2.1.4

