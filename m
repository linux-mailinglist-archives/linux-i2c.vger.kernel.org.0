Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4045189566
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 04:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfHLClD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Aug 2019 22:41:03 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com ([40.107.8.94]:21250
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726466AbfHLClD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 11 Aug 2019 22:41:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=He8iyeHJgISbAUSTCE2TmTkh4VZTPvUkPyzSeYBdE7ODoy6TgXLZNg8G6CV1Rvy4opEx1j4Tbp3nlvdnRy87euEZy3hIJz3y2jEW/Z65e29iDnjHlwN3S4ydSRsvSFVMKPCpExlFilIKYnu+dKPl6PBy9hagBP33aEFod4tqHEEn6Yc57OVsL1unc8FECnrDGWuGGyMaBqboAWGMFbuPfXAs1q+QTmswX7cX1paGoU5UiE/bl8Qgi7hXl+pAGsL6lApCZvhv9cvFmp+wtsLoiJC1gEIrNMlAtBeimm7NvQ3A7hwKuzLJ9gCoGte8n9ng1XNinzRNQ0yMTyimRZ4k5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG8EFWlWugkSo31bNL/fK3nfwnqK6VekWgP/McMmh1I=;
 b=ItsEkDwNsNSfRmK89PAX9PT/VUhLsDJtcvuz797ohF85SXfq5JYxOsx5xYVCw4s+cWcLH4HLL5SJ4acOb7LTTrRHWMMTtDsSU996qxtIZzjEVrN9pOHPs855KxI6joTviPx72IELvlVjCEbWmvuhed6Zgmyk1spgGyThoLSVN9NOeQcMGxHJFZgcQiNGtfRJeSR9YCdtgO5Xo5JpBzt3hFLFgwb8xNK6+Ek3tss45ZZZr9dQk7DfdDR1QAeZMEDj+NGF+Lj7TnTpZvOdNJOWmAXXR1uV/P2fFj6askXSlw6pEcb+UCF55JaWAzysxdT7gFEC10sxEJGkAGL/+G5cBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.2.8) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=nokia-sbell.com; dmarc=temperror action=none
 header.from=nokia-sbell.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG8EFWlWugkSo31bNL/fK3nfwnqK6VekWgP/McMmh1I=;
 b=xe5r/ItvNNtAeLB4qayPOOFQihZO0c9R3ZQj/I9vBc03Z1EMMIM6S9cqF0XyPcd8FHy+6sKSXfkDUNBpGwlAUea6vjOh/bBXdCBvWckeBYfBFRINslZFhkrQ4qCrwnQOlLG+Y4YhkpQ3wGnQqbqCX9onmeB2oYdqPfKpoBKiIHU=
Received: from DB6PR07CA0177.eurprd07.prod.outlook.com (2603:10a6:6:43::31) by
 AM6PR07MB3877.eurprd07.prod.outlook.com (2603:10a6:209:39::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.15; Mon, 12 Aug 2019 02:40:56 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by DB6PR07CA0177.outlook.office365.com
 (2603:10a6:6:43::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.14 via Frontend
 Transport; Mon, 12 Aug 2019 02:40:56 +0000
Authentication-Results: spf=temperror (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia-sbell.com; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=temperror action=none
 header.from=nokia-sbell.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-sbell.com: DNS Timeout)
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 12 Aug 2019 02:40:54 +0000
Received: from hzling02.china.nsn-net.net (hzling02.china.nsn-net.net [10.159.215.126])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id x7C2enOP027369;
        Mon, 12 Aug 2019 02:40:49 GMT
Received: by hzling02.china.nsn-net.net (Postfix, from userid 62007714)
        id 1D26547E7; Mon, 12 Aug 2019 10:40:48 +0800 (CST)
From:   lingyxu <lingyan.xu@nokia-sbell.com>
To:     Jean Delvare <jdelvare@suse.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Wladislav Wiebe <wladislav.wiebe@nokia.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Lingyan Xu <lingyan.xu@nokia-sbell.com>
Subject: [PATCH] i801_smbus: clear SMBALERT status bit and disable SMBALERT interrupt
Date:   Mon, 12 Aug 2019 10:40:34 +0800
Message-ID: <1565577634-18264-1-git-send-email-lingyan.xu@nokia-sbell.com>
X-Mailer: git-send-email 2.6.2
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:131.228.2.8;IPV:CAL;SCL:-1;CTRY:FI;EFV:NLI;SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(199004)(189003)(8676002)(478600001)(26826003)(50226002)(5660300002)(70586007)(70206006)(86362001)(4326008)(2906002)(76130400001)(81156014)(81166006)(52956003)(186003)(107886003)(26005)(6266002)(53936002)(51416003)(103686004)(305945005)(126002)(486006)(966005)(476003)(63350400001)(63370400001)(2616005)(50466002)(336012)(42186006)(6666004)(6306002)(356004)(36756003)(47776003)(48376002)(8936002)(54906003)(6916009)(316002)(16586007)(43062003)(562404015);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR07MB3877;H:fihe3nok0734.emea.nsn-net.net;FPR:;SPF:TempError;LANG:en;PTR:InfoDomainNonexistent;A:0;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 291d501a-56fa-4880-38be-08d71ece7f79
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:AM6PR07MB3877;
X-MS-TrafficTypeDiagnostic: AM6PR07MB3877:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <AM6PR07MB387742DA3DE66A49F536E9E7D7D30@AM6PR07MB3877.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 012792EC17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0EzX+QUFteV6fDa9VZ7KKl4o6HuEAJOWj7cd7tBumoL4D+5vZTELOx+8Q/pNCxiabzqwJ2DuxFxeIl6YSFkhFLuVETzJtfp0xWDVTVmD4egb47c3skaKKKAuNPHWFOIeJWN5w40aw4ToWZpOjm5aEaZsN+3JOqxSLbHlMvFSnVCiTXzSDZbpVWzEQNDr6umPDnbWtQY7ovRHcFGq02Cv3o/9cyqpGr6TpgrYkz5+9+Iy7Xq26W/RRPQh3BLryxkosxcck8K9dTt4N3Qlfn/01MoeGtYagOdfHjwBXXugpanYll/qO9hMMh0pJsWH8NR0NKzlup2wLpQSTkYIyD8hZyalvhP8heyopGdRIjf8u0cQUAI1IW6PpnoGLB+RmAi8nmKgHxEna8AWMuXMiVps7juS844e9J53a3E656RrqCM=
X-OriginatorOrg: nokia-sbell.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2019 02:40:54.5270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291d501a-56fa-4880-38be-08d71ece7f79
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB3877
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Lingyan Xu <lingyan.xu@nokia-sbell.com>

In current i801 driver, SMBALERT interrupt is allowed
(Slave Command Register bit2 is 0).
But these is no handler for SMBALERT interrupt in i801_isr,
if there is SMBALERT interrupt asserted and deasserted,
i801 will have an irq flood for the related status bit is setted.

So SMBALERT interrupt handler is needed, and also, SMBALERT interrupt
will be generated from time to time if slave chip have some fault.
So disable SMBALERT interrupt is also needed.

About the solution,
please see http://www.farnell.com/datasheets/1581967.pdf
Page632 P640 for more.

Signed-off-by: Lingyan Xu <lingyan.xu@nokia-sbell.com>
---
 drivers/i2c/busses/i2c-i801.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index f295693..033bafe 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -661,9 +661,11 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	 * Clear irq sources and report transaction result.
 	 * ->status must be cleared before the next transaction is started.
 	 */
+
+	outb_p(status, SMBHSTSTS(priv));
+
 	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS;
 	if (status) {
-		outb_p(status, SMBHSTSTS(priv));
 		priv->status = status;
 		wake_up(&priv->waitq);
 	}
@@ -1810,6 +1812,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	/* Default timeout in interrupt mode: 200 ms */
 	priv->adapter.timeout = HZ / 5;
 
+	/* Disable SMBALERT interrupt */
+	outb_p(inb_p(SMBSLVCMD(priv)) | BIT(2), SMBSLVCMD(priv));
+
 	if (dev->irq == IRQ_NOTCONNECTED)
 		priv->features &= ~FEATURE_IRQ;
 
-- 
1.7.1

