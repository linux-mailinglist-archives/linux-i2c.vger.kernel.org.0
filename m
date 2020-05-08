Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49BF1CAEF6
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 15:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbgEHNMy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 09:12:54 -0400
Received: from mail-eopbgr1400055.outbound.protection.outlook.com ([40.107.140.55]:16256
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729675AbgEHNMv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 8 May 2020 09:12:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSAVfmnkYpr95zzbk60gtaF9jTA568jxi991Gajxvff+TSCc3kkzcr2OMhcn2FLM5VpQ5kzI+rMRnkkyyWQf9HKjZ1otlv5se/zh0rqYoWeD11olDB3QH+u5nPwPwGCvP6rZcUfCYtJ4mH9PmgIzWatEIItVxvL3ECXRaiQw9pyIXiE3WGdIOGMLo6uSl2+wG5WKofAhYDNXHHXCaTV79Iz2pIghF13c5vk02D/oubDUjTsQQ9A84F4BAhr5yW0EMU6G4EgbjRiIFEy0AKEVali7CwWUv3LwcXFYUpiY5NLk4zSzi9Mf6tWILnNJiHcSrpNB756G/qFv+5x4L1sf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAbgBUPow1qAbpzIqK3BPz5VmsFK7EAtD7GVG5kl++c=;
 b=YQEDXbRuD2MBmU0BGQuHlqMMzEZXf0Z1DhEJL8VwJcmqiHa8YlZvLfiQLWmKg74dEhtnu+0o1661sFHeI5enXvAh+6FAhIHR3kvYqKWyDlx8futMOdpIEnaAH21M9SctEVgS6pJczH5e+HjFVXEJikcL9xYyeqIskqcful+RgCd50/+o1x6fynALKe/xqvBZDPONjF+KfxA6gIJFmFT7Rmj7ML6jrNP3QC7F0WUFt12JS6fANQ/t/HI6+xK6MMgDW6lf5t2vYZHOukt2YGw1jdsiK5CS0qtageOuurlQ60E7Cs0fVJJ7MYIWd9EUPXfkCZhmZWI5mMoFFUh5VPUwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sord.co.jp; dmarc=pass action=none header.from=sord.co.jp;
 dkim=pass header.d=sord.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sordcorp.onmicrosoft.com; s=selector2-sordcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAbgBUPow1qAbpzIqK3BPz5VmsFK7EAtD7GVG5kl++c=;
 b=UbZUjwjloeWkdlT3r70o/z9kDwPf6CpoYyLM/VFUZUFztbaSakEyUkq/CC5gtpjOlK5gB/Olb7Ua+qy8eDhwNOfMXQsA0y1XRiqqph09T8ObWfBM5ZwAhZKXffomJVrzbhRbZ+O8uF9EPCFFexhVXDhC2ZnWseuU2R8GywxeeTI=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=sord.co.jp;
Received: from TYAPR01MB2224.jpnprd01.prod.outlook.com (52.133.178.16) by
 TYAPR01MB5039.jpnprd01.prod.outlook.com (20.179.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29; Fri, 8 May 2020 13:12:49 +0000
Received: from TYAPR01MB2224.jpnprd01.prod.outlook.com
 ([fe80::3925:b98a:c278:1605]) by TYAPR01MB2224.jpnprd01.prod.outlook.com
 ([fe80::3925:b98a:c278:1605%7]) with mapi id 15.20.2958.033; Fri, 8 May 2020
 13:12:49 +0000
Date:   Fri, 08 May 2020 22:12:48 +0900 (JST)
Message-Id: <20200508.221248.1850264063769224908.atsushi.nemoto@sord.co.jp>
To:     Thor Thayer <thor.thayer@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     tomonori.sakita@sord.co.jp
Subject: [PATCH 1/2] i2c: altera: Fix race between xfer_msg and isr thread
From:   Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::26) To TYAPR01MB2224.jpnprd01.prod.outlook.com
 (2603:1096:404:4::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (61.200.21.62) by TYAPR01CA0158.jpnprd01.prod.outlook.com (2603:1096:404:7e::26) with Microsoft SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.20.2979.28 via Frontend Transport; Fri, 8 May 2020 13:12:49 +0000
X-Mailer: Mew version 6.7 on Emacs 24.5 / Mule 6.0 (HANACHIRUSATO)
X-Originating-IP: [61.200.21.62]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a9fd3e9-69ba-4b73-6b53-08d7f35181dd
X-MS-TrafficTypeDiagnostic: TYAPR01MB5039:|TYAPR01MB5039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <TYAPR01MB503962C7A0CC47AD645C87AEBBA20@TYAPR01MB5039.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HXXmSv5t2+1MX7qT+fPAwLGNjdbm4WQEvIalsDNLuSUwYp2HeurDKSGLjPvzhKct3Zawnb0qTod1K63BHsfviHx9IwSwW5f064eNJ3m6Sf5F58eEtEXMUQDs0ZfQALnGz8KgGtnM8XbFHTApqQrIVYfEALgoP0GPwzKLxhSwTrQBwSKO0orSDBwU4Ls7X05882odpxKF6JDNgGTLF47CVi7dIqBS61VAso6rtnTkBPDnr9Pys5jVubGSJS4bSwh/65fdMwqMgeifiG6rPF4WmIpDBmALBLNj/f4AUM1ZFHtkW4+N43Ub4jRNbpJWTBzWs6Ql8NjWZKYfMYBos4HsI1IdzcvMFKWCeIN/UJ75iNARSNfmUzph3M+dGQk5kV2/hkEe2Lm8OCyrReNwRBkmq5PRuMvmOnDUUKeWxUQRXW1bQN47ppN1QOL+B26INKTw6gtl+9cvKjV/WxgwiKPUoVAlSRS909gdCyuc8Smh9oFV3nCjCZfU3yLJ6r/pkUJxg5Dnn+bocilj0fZU4nV4qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB2224.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(366004)(376002)(346002)(136003)(33430700001)(508600001)(956004)(36756003)(6486002)(186003)(16526019)(44832011)(6496006)(4326008)(2906002)(316002)(103116003)(33440700001)(86362001)(66946007)(26005)(107886003)(2616005)(83290400001)(8936002)(66556008)(52116002)(83320400001)(83280400001)(66476007)(83310400001)(8676002)(5660300002)(83300400001)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: oYBH5hEq906C01YIcjvG+pAZYctAM+We2eL6ptbv2vZlR+nO0kQl8aAChjFJUDIujeQKXaC6KzH2KpyDFGi4kD18gF+ORJ7xc7EveWyIm7JjFo9GxGbit/x3bkTrgF7phAGRTd9U4qgWhGyQJkP40VpIstxsjX+FPrKHrtwOy1Ppl3ju6MkYMwLKO797I4MDeEqWPCjfD41GLx35+RU0CGlbXoEDty8t50TItzksnf1p94NfI6dWgh1qug+4aicDpIYtdjq6nXt9lgXzrMQpsuwv4YDfhVZysCa1YYw+rxHZ0NrEtrYSAIZlrgveLRgjFUDZ5feV7SfoFzYPGHUs8cbgK/nO+7CCvIb6Z9moN9NSbjN4dyfm/iZMCX7o+xRrwzzrGm63lyizMvAbu9mVSLilhZthj4ZwpTE9EHidu4hwIZrcCA6pzF8W0/W0vtotDkvmXtYPh45XcQ2kWXdt03FamSfitAkLmmeQ/il36hI=
X-OriginatorOrg: sord.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9fd3e9-69ba-4b73-6b53-08d7f35181dd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 13:12:49.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cf867293-59a2-46d0-8328-dfdea9397b80
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFh+mukWv8nQW5I0NRcJzBsH32DmXt7Tt+E8aConq0XIbruouc+Fw5Pb7dhYy0ctM6szbWclScAiM6sS5CN7Jrukv/sdIha+0Qk/wBUFw3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5039
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use a mutex to protect access to idev->msg_len, idev->buf, etc. which
are modified by both altr_i2c_xfer_msg() and altr_i2c_isr().

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Acked-by: Thor Thayer <thor.thayer@linux.intel.com>
---
Changes in v2:
  Rename mutex to isr_mutex.
  Add follow-up patch to cleanup spinlock.

 drivers/i2c/busses/i2c-altera.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index f5c00f9..16ddc26 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -70,6 +70,7 @@
  * @isr_mask: cached copy of local ISR enables.
  * @isr_status: cached copy of local ISR status.
  * @lock: spinlock for IRQ synchronization.
+ * @isr_mutex: mutex for IRQ thread.
  */
 struct altr_i2c_dev {
 	void __iomem *base;
@@ -86,6 +87,7 @@ struct altr_i2c_dev {
 	u32 isr_mask;
 	u32 isr_status;
 	spinlock_t lock;	/* IRQ synchronization */
+	struct mutex isr_mutex;
 };
 
 static void
@@ -245,10 +247,11 @@ static irqreturn_t altr_i2c_isr(int irq, void *_dev)
 	struct altr_i2c_dev *idev = _dev;
 	u32 status = idev->isr_status;
 
+	mutex_lock(&idev->isr_mutex);
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
+	mutex_unlock(&idev->isr_mutex);
 
 	return IRQ_HANDLED;
 }
@@ -312,6 +317,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
 	u32 value;
 	u8 addr = i2c_8bit_addr_from_msg(msg);
 
+	mutex_lock(&idev->isr_mutex);
 	idev->msg = msg;
 	idev->msg_len = msg->len;
 	idev->buf = msg->buf;
@@ -336,6 +342,7 @@ static int altr_i2c_xfer_msg(struct altr_i2c_dev *idev, struct i2c_msg *msg)
 		altr_i2c_int_enable(idev, imask, true);
 		altr_i2c_fill_tx_fifo(idev);
 	}
+	mutex_unlock(&idev->isr_mutex);
 
 	time_left = wait_for_completion_timeout(&idev->msg_complete,
 						ALTR_I2C_XFER_TIMEOUT);
@@ -409,6 +416,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
 	idev->dev = &pdev->dev;
 	init_completion(&idev->msg_complete);
 	spin_lock_init(&idev->lock);
+	mutex_init(&idev->isr_mutex);
 
 	ret = device_property_read_u32(idev->dev, "fifo-size",
 				       &idev->fifo_size);
-- 
2.1.4

