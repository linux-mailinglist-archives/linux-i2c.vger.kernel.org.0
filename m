Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1EEC25476B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 16:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgH0Oto (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 10:49:44 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:53991
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728061AbgH0Ote (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 10:49:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeAZoA7kxVNbFU/2FSrMXiXmVtOBsYlYJr7fyAMidOUyf9lJMZdgjcWKz/KO/MzZ1ja21zYHWtz3K2weTSZJEQRYgQVheVmNKbRmG1udsp4ggjqXdFIBS3Eej/o8afNAemaJtSydqKwKgcR3KzmfsTAnWtkbikJ9Nttj3V/YO9jPT0vWKr6VyJoC6jU7HSBS+yClJoRuI9hNmFjANdyQiSeEOIZA3DoKWnX904Gt87CYw6X5Dn6fyn8yoaT+IzNl5yW0Yq36ui7VRzm+VB7JwuQBpAvD9hK3LjbMizbUUuzrJV9NoDA1QFNkqKsUlm33puwJkkqni8fXFqLzBH1fRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g4BYR14TxRsdOTeMRrL6guFoumHdi/cxUqImYLtczM=;
 b=KpjDsfinIsYtwWHbPwu3c+/429k957YjJx+QyhBd5dTGGMLhi+xPH93vU57Igur+DGrYjD3m9g2K/FRvcuohenraE2pSC/QqbGisRPv1BXQivPYzGuFbM+4nZ5qzV5U2LExWLdXEK9pUdZMBxwGKmtvqJLknlQ7dJgQINgsKQrL+Fsw01auLteKQmuYgO33PPdNlZyr84RVkOo8RG1y4HzoswrQznkJO6RrC1JegLFDTUkUEyC1u+e8w7XpzF74V9fwiezElTUIXSEtNRfv7hlLOVx21vfJAvq2pYqP6QBJqKcEf6e6AuMbR4ruo9tccOH64OPQ7a5VpRJwLXgkUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g4BYR14TxRsdOTeMRrL6guFoumHdi/cxUqImYLtczM=;
 b=NMcW9YGchAjlsHkoHOLBansvnAcRBjANvVOMhWOfexQw6gvnSwEOGbsG+021p+3kOdNhVRlqdVNNmypT3V716npR64yKSNZDM5QVnr6jxm1qfMCd/AryOFA+Zhp59oEpMWiUyC5CvuG0bqsRI2xP3DfHxbc1uKm8WbofEHlHn70=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM8PR06MB6852.eurprd06.prod.outlook.com (2603:10a6:20b:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 14:49:30 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 14:49:30 +0000
From:   ext-jaakko.laine@vaisala.com
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>
Subject: [PATCH 0/3] i2c: xiic: Support forcing single-master in DT
Date:   Thu, 27 Aug 2020 17:48:45 +0300
Message-Id: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
X-Mailer: git-send-email 2.19.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (193.143.230.131) by HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:49:29 +0000
X-Mailer: git-send-email 2.19.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01341df0-f2f5-49b0-0598-08d84a98676a
X-MS-TrafficTypeDiagnostic: AM8PR06MB6852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR06MB6852E54F545BA98F0CF106BED4550@AM8PR06MB6852.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2TitT9N9ms8Vxzu+RxIKcT9eRkgMYhYFbODUOWDZL7cNGUCBb8fH3S1RkAvX3sJNDPi9YnsQn/hF/1XxxP+E7+rpFGinJiMcsIZMRiLYlo8k0wIZWkUMhhLhklad5FwmUk5Tgvia0vCrCNy9p9FDt9tgZl9vunRrd2EkznaDu7JB8evZzmZYQ1NUtnuP8G8YFdKnM7wTHLVzL4UKrr/BH8a19UPgrXdt9U/5/QHzpmg8UPxW6xKxFf2f+ougq1zxFX1cdUFMxnRTj3W5H3zSpof5w7WVaYGJe9f6kSrAx7pcz+mUhUWJKcGzYCK1XD6Q/Tz0PeJZNBPajaltyBIaIzwbSHp0TffpD05S39tHdYrD+WZovQ9ejD1IP4oE+88D8fCnGMXu+oKHaKGgAMmIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39850400004)(396003)(6666004)(5660300002)(4744005)(478600001)(966005)(1076003)(66556008)(66946007)(66476007)(8676002)(86362001)(83380400001)(4326008)(316002)(6916009)(8936002)(6486002)(2906002)(6506007)(9686003)(26005)(186003)(107886003)(16526019)(956004)(6512007)(36756003)(2616005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: /G5GluXAoTGPm5Zu3UMF7e+3bYg/xaIE7HMYL8rkn8DBOkTERmtqUyK3FY1bApZZllEvImtUl1oR51k1b4oBcVYRJN9TPjzRcDcnSYArG+Lc6+ODAlXUlN437D19n/0J1gi8S5ApXPpRUu7dSOeW93zoECHZJtTUQ44SclGI1rfTheHCTjSgc07ZpREQ75ZOgXh0VXgQTzS9j7X6uAjWT3XhWqVonewu5/LrJKy59Me+9bhX7a8Avn9K5i0TfX8XURHkbxkquMlsFS7Zlt1M++r0f6U60RW4y7YXtqlol8xwwa0URmUN2oyVjSuI1MphEz3pVPXoS8lTRp8ZIYTlSpLYjCw7P8SxSQefo+P6pIuLmyz7QDRgARoLVco8aqLt0GUDX8fIo1I5Q/BsZUuOgISkHNfTAvjLqhUli0tQmUQ3pQuSc1sWOS7PKTyn+Ex1HEvk9uJH5rq+Js6RrRPy5bJToikhCaUoRcIKG16UxcmVYjH97x5Hv2Jkj85GswP5Ma09hzDiCq38LYdWIdDRX8h421RHjPydrPod0RURa8PRBSzQp5Ur7rioqUwchyg6SaD6qPHKjr+zkiPyd9OGbBmLnhvEnI891v27HjKIqdOf9TuktiCR8cFgMGrTesIJicH7im08S+LrvILOk0X9Fg==
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01341df0-f2f5-49b0-0598-08d84a98676a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:49:30.6389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sa4wNwrc9pVBljvAqTjeOJs9a2ZMAwyX6dUFT+TsABAowVb7JEIGDu1Muwyl+T5RaWJ6nFh3DWZs0/URLsTDYzW7jypJ/LlL1OuMyOnTXQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6852
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jaakko Laine <ext-jaakko.laine@vaisala.com>

This patch series allows xiic driver to take advantage of
single-master -tag in device tree to improve reliability.

Changes from V2 review based on comments:
- Improved xiic_i2c struct memory alignment
- Simplify bus is busy checking code in single-master mode

Link to V2 review
https://www.spinics.net/lists/arm-kernel/msg831068.html

Jaakko Laine (3):
  i2c: xiic: Change code alignment to 1 space only
  i2c: xiic: Improve struct memory alignment
  i2c: xiic: Support forcing single-master in DT

 drivers/i2c/busses/i2c-xiic.c | 62 +++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 24 deletions(-)

-- 
2.19.1

