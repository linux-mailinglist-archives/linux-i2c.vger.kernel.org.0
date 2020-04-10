Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D794E1A3D98
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Apr 2020 03:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbgDJBGo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 21:06:44 -0400
Received: from mail-eopbgr1400082.outbound.protection.outlook.com ([40.107.140.82]:30528
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725970AbgDJBGo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Apr 2020 21:06:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jf4xiJ9crayewZNjou9IFkQvakyj3oVI/iW5PCtJEfnZqnBFlhVcrbEsFm4Z0wDoTde7zE0GgeSN1FVMXi0FtuLGFIEVb2CXhwKPB9IcmuOaePsxr2c9pVem8k7mjhCnzcI4rJYo/gqJZbQW3hbBvMVP6nXuptopoBOlma4IgbUXLT/160sqNBjRa7NWHhkNuEGpCLkwpbdbJUOUzM0/p+w/yPMwQZAB8a+LXLOMXcx1BHixTZg0qYB+6jb8xsHG06V9lezFm3b8m1l0x1BRwKJc8EUeNlfvFSUhH3ykitqJ6szLoaKq6Y364HpClkd/olXh5j9t2rOo1w4zYm9htQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd0HnyWUdwodp5rkCFKxBki4DVpO4uyvCSxcKL+4/gk=;
 b=iJRdwFUjSum9ZKTW0NIN9Ae01bEC9bvq+Hg072yRnQR1/jaV5hjjRpwflmBsCXmRbwOo+SjugVwfaQaJa8UDzK9klOXQig87LmhvmVwEdEsRoW3lhzUAFoEo8OKB0uhcPzuIE7fwYCzFEEnj99ejV4G87WIJsL3iB2oH0cCU5tTU1tkz0of91CKkAD0Ir/jBHE3xyRYZoYwBC0GeoQxg547uIR3lmXJs+QjmylM1e0ze4GgpDdk+tVmlwvD3uTpT/5JB2lJ9MMYYJoiVU7YFp4eWIrf18shpUpfYQ8nhj97hJwvHubtkQwCnsgLzc8JecI25bXdLA6rXD84N/09Mig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd0HnyWUdwodp5rkCFKxBki4DVpO4uyvCSxcKL+4/gk=;
 b=pEfBBijR1vgHQSgDL5RidGQGSNSl1e9tfV56N6rUDRx0B3K0Au3E/Q5/zLRiIAaX6IhQAo+Z8i4ql7C7l8pO7rUQtUJ8mNOX+g+j0TF929PvxYUfqUB5sTrHIKmLxkcRXJ6WxzW16LWeP3gWJRDtSqDYLkQjkHP01inmXBO4cMA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=atsushi.nemoto@sord.co.jp; 
Received: from OSBPR01MB2087.jpnprd01.prod.outlook.com (52.134.241.18) by
 OSBPR01MB1509.jpnprd01.prod.outlook.com (52.134.224.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Fri, 10 Apr 2020 01:06:41 +0000
Received: from OSBPR01MB2087.jpnprd01.prod.outlook.com
 ([fe80::71ff:5526:838:a89a]) by OSBPR01MB2087.jpnprd01.prod.outlook.com
 ([fe80::71ff:5526:838:a89a%7]) with mapi id 15.20.2900.015; Fri, 10 Apr 2020
 01:06:41 +0000
Date:   Fri, 10 Apr 2020 10:06:40 +0900 (JST)
Message-Id: <20200410.100640.1949609603287475131.atsushi.nemoto@sord.co.jp>
To:     Thor Thayer <thor.thayer@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     tomonori.sakita@sord.co.jp
Subject: [PATCH] i2c: altera: Fix race between xfer_msg and isr thread
From:   Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
X-Fingerprint: 6ACA 1623 39BD 9A94 9B1A  B746 CA77 FE94 2874 D52F
X-Pgp-Public-Key: http://wwwkeys.pgp.net:11371/pks/lookup?op=get&search=0x2874D52F
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To OSBPR01MB2087.jpnprd01.prod.outlook.com
 (2603:1096:603:22::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (61.200.21.62) by TYCPR01CA0031.jpnprd01.prod.outlook.com (2603:1096:405:1::19) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2900.15 via Frontend Transport; Fri, 10 Apr 2020 01:06:40 +0000
X-Fingerprint: 6ACA 1623 39BD 9A94 9B1A  B746 CA77 FE94 2874 D52F
X-Pgp-Public-Key: http://wwwkeys.pgp.net:11371/pks/lookup?op=get&search=0x2874D52F
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
X-Originating-IP: [61.200.21.62]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25f8a6fd-02df-4be6-028f-08d7dceb6d6b
X-MS-TrafficTypeDiagnostic: OSBPR01MB1509:|OSBPR01MB1509:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSBPR01MB15099496B5346F71D31839C5BBDE0@OSBPR01MB1509.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 0369E8196C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2087.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(346002)(366004)(376002)(39850400004)(136003)(4326008)(186003)(44832011)(81156014)(2906002)(956004)(107886003)(86362001)(8676002)(2616005)(6486002)(26005)(16526019)(8936002)(5660300002)(81166007)(66946007)(316002)(52116002)(103116003)(478600001)(66556008)(6496006)(66476007)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: sord.co.jp does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5N+kOi57vU5Bg9OcwHv7bMQ0gEzeCtM0AV2wJ8Z30quY+x4Q5uBM0eQaweS2nb9ziVsXWGT6wYLlzJlkXviMf833jW0LqyUepsEdYNSdGojn2zEZil2CcdHsvEkb4EqgVuGulFef3t0nnQQ0PdKL78qr9YC/y0nC+4SmfMkoRhT3WAUKBN2z/oK7J9Ehk0SLB9xi1COry/BABhkbUnkUOOgQdu0LnzlMnAxALxMfBrAp0Jtd0g7/AUYXLLTOw90LtFCt/UUmneZwoAu6Ifk+OeWAUJi7OfD0DAfN2GMjM6J8rwFa8xVQxBYJhpPxyZsMXfBpXI6FYcwYYpJST48dKxU0kAQlE4pCE/3Ti+6144CD4BeT2UqMpBvxUyoGUBwGsb5Qwad4TNsmYQZgyUlrEwvEhGWAuFu7TSnslrMubNUDqRdAKAaKwt7IwxVb+7O
X-MS-Exchange-AntiSpam-MessageData: c2ZmYX5HpmzhjdGsCHe8/7hXO248N0S/D70J19v9h60j+pF/XfMvl4FQ++wx1R7PpUDmP8ofdrK71R0BbBnx/qRPFddBZNk3PYBaXsOLXopXYcITuRSCfswPBXEpgmn0cfr6NOP/SV6pKQ7VQmI/3A==
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f8a6fd-02df-4be6-028f-08d7dceb6d6b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 01:06:40.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQEMUrh2QwlNfGstyZ5DN/rFXHb7Q7+z4Q0Gsqp8a21lSFuzjXRMUaayfdZbHh5gGcqvc90arq46w9I5gKpS5snOBRFfkrxLsvddZrvG+R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1509
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use a mutex to protect access to idev->msg_len, idev->buf, etc. which
are modified by both altr_i2c_xfer_msg() and altr_i2c_isr().

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
---
 drivers/i2c/busses/i2c-altera.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 20ef63820c77..3db7d77c5a1e 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -70,6 +70,7 @@
  * @isr_mask: cached copy of local ISR enables.
  * @isr_status: cached copy of local ISR status.
  * @lock: spinlock for IRQ synchronization.
+ * @mutex: mutex for IRQ thread.
  */
 struct altr_i2c_dev {
 	void __iomem *base;
@@ -86,6 +87,7 @@ struct altr_i2c_dev {
 	u32 isr_mask;
 	u32 isr_status;
 	spinlock_t lock;	/* IRQ synchronization */
+	struct mutex mutex;
 };
 
 static void
@@ -245,10 +247,11 @@ static irqreturn_t altr_i2c_isr(int irq, void *_dev)
 	struct altr_i2c_dev *idev = _dev;
 	u32 status = idev->isr_status;
 
+	mutex_lock(&idev->mutex);
 	if (!idev->msg) {
 		dev_warn(idev->dev, "unexpected interrupt\n");
 		altr_i2c_int_clear(idev, ALTR_I2C_ALL_IRQ);
-		return IRQ_HANDLED;
+		goto out;
 	}
 	read = (idev->msg->flags & I2C_M_RD) != 0;
 
@@ -301,6 +304,8 @@ static irqreturn_t altr_i2c_isr(int irq, void *_dev)
 		complete(&idev->msg_complete);
 		dev_dbg(idev->dev, "Message Complete\n");
 	}
+out:
+	mutex_unlock(&idev->mutex);
 
 	return IRQ_HANDLED;
 }
@@ -312,6 +317,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
 	u32 value;
 	u8 addr = i2c_8bit_addr_from_msg(msg);
 
+	mutex_lock(&idev->mutex);
 	idev->msg = msg;
 	idev->msg_len = msg->len;
 	idev->buf = msg->buf;
@@ -336,6 +342,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
 		altr_i2c_int_enable(idev, imask, true);
 		altr_i2c_fill_tx_fifo(idev);
 	}
+	mutex_unlock(&idev->mutex);
 
 	time_left = wait_for_completion_timeout(&idev->msg_complete,
 						ALTR_I2C_XFER_TIMEOUT);
@@ -410,6 +417,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
 	idev->dev = &pdev->dev;
 	init_completion(&idev->msg_complete);
 	spin_lock_init(&idev->lock);
+	mutex_init(&idev->mutex);
 
 	val = device_property_read_u32(idev->dev, "fifo-size",
 				       &idev->fifo_size);
-- 
2.11.0

