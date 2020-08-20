Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD9124B97E
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 13:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730964AbgHTLsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 07:48:02 -0400
Received: from mail-eopbgr150081.outbound.protection.outlook.com ([40.107.15.81]:58113
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729386AbgHTKDp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Aug 2020 06:03:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZfVxkG9xwRfA9PV5/Mi1e2SfIFeGR4rhBHzW42hd0eYk2NCzp373idvU009hOIrZfZ0uWSKqMhmUftWK4tdivsPbfFwL+EpUXoU2flqPjURsVMlYBMi/Hpxe7GOL1VEcJP7amibpYLD5dnGeGVj8oRzBXLgaNK/R3YwlngJpGc/P7cPWKIbEDb0ZiVoW0nZW0oqsqjkrwmE5XzzUEOfERZu5EgIInv3npRHd+LqVvw8tiQhQqk1vo9E3R3y+bhE4G/nw6fTVsHWI7FQzjEqToq+LjizG66oLf9nsSLSI306R9M9sLiT38cEJ37rjBV5wFl5XClQvDMCxgk6Svdt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/0q26oLnbprif/ZDSXwT2N9jAw4Fv5IlYR8HNONmDs=;
 b=FqRAyKt5zTuyT9czDBCVx9NvkVAhlHtZpbACQqB1FQtukUVled7mKO5OkbGgu1ztvt5Hv3sLFpa+Jf3dlmDcahRjOLaK5fFgTyfcpMe+EB709Pm/AqzUOJxTmqtquBnKqyxMs05KbSQAkmc6dGuIucfIPhY3zVfvpChFdTuww3l8C/uc4nbI2XJ02M2jcOdPuHdEwPKPxF1y/jF9KBn7Cd0f8d7TN40PHJEJxvvehjvewmdn+AwM9rkyQMyYvxJHUI2AzXh+69Cc5nK4d8LvtS/tJEHuBTThe9Wj7teRBeH6pfP+MQISBeKjmpF2h0WR0G91MuBBdK4i9AYp1zcsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/0q26oLnbprif/ZDSXwT2N9jAw4Fv5IlYR8HNONmDs=;
 b=N6t3RcC/iJKqcTWFElIU/l68ZqtxvwTi+z108ygApbUGPXwnuJzZgIfiyGpuP15QA5dtVdRiLr8gWWkvsPFPAlUYOOSph2lD74Ss2OCiw4imRUA+nhTm7eGANsPWsThk/iPnS2TP6VE3egoU2UoFgReIJdrlJxbxaWih1LFa5/I=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM0PR0602MB3554.eurprd06.prod.outlook.com (2603:10a6:208:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 10:03:42 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 10:03:42 +0000
From:   Jaakko Laine <ext-jaakko.laine@vaisala.com>
To:     wsa@the-dreams.de
Cc:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>
Subject: [PATCH v2 0/2] i2c: xiic: Support forcing single-master in DT
Date:   Thu, 20 Aug 2020 13:02:39 +0300
Message-Id: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
X-Mailer: git-send-email 2.19.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0202CA0037.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::23) To AM0PR06MB5185.eurprd06.prod.outlook.com
 (2603:10a6:208:107::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (193.143.230.131) by HE1PR0202CA0037.eurprd02.prod.outlook.com (2603:10a6:3:e4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Thu, 20 Aug 2020 10:03:41 +0000
X-Mailer: git-send-email 2.19.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fcc2546-3674-49a1-ac66-08d844f0510e
X-MS-TrafficTypeDiagnostic: AM0PR0602MB3554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0602MB3554F615C388959D2F7D42F9D45A0@AM0PR0602MB3554.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZgICJvl1qF3iANBo2bMd0hAUPJTb8Fe6DKFS2VKMCmvPbBNsLcp0S3yS9yQIeIKEA1Aza1pt/dV97mW81tVcHF1NLYsRSENHtRf9XdZGJl/nsSKMHZKELNgQlWtSJAfaOsH3p56dsvD3L+YmIrT1WsgDzAZfcEEauMUG+uZq6+H8sCtF41zOsG9zb1XBmX0RDcyBIJqHOPKij6gFoo/w803ONv4tDxx94Lsby3dRFFPGXajuTZ0ss2kMKD+3mSA1HzQ4hfahKtAoCYj/Vj+B7YoEOxYlnrO7QBNZ8BTdFjJJmPHrEuhj+d18Nn4pt8LizUBQo1KUqpF3a8GopZ/XNrgb5w7xjXtHqwkhMOcAwsOyNLLKlex/qAfwn+x6eJusk6uCQ3Bi5SAJyAykjBzYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(366004)(376002)(66556008)(8676002)(66946007)(66476007)(107886003)(1076003)(2616005)(956004)(186003)(6506007)(16526019)(6512007)(6486002)(86362001)(5660300002)(2906002)(52116002)(316002)(8936002)(26005)(478600001)(966005)(83380400001)(4326008)(6916009)(4744005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: m+5v+55iWp3Mp7SD808RER/PD2RrYz40BDxKigkQePU7frgqHXH5PbwfE6jtQe47pjUfFxnd+GUaPIUXjSzqZ9P7M4G8HvX2Yi2xwq6fivpJnTkQaRQlsb3dlfp89F+KqGoYvYGIMZUz4waS+BniRSzPswHnm8m3vvzy8flB2O5IzjFgudmVWrHp9KU3a3fnrSC2b7/Gg9UzQWFxdQtCF/ZnAM+ZyzbmlvjRxCM1+TvSL48k88R203q+aw1rMVr63OjkahMCezu8F1veD6MGC6QzovxmXXONGiXtMIVnasM779GPdFk+Y7PpPYC8SGTQIxAXLo4PaLu1o8tLj3lIUJIdPYep2ag97wyjHaruC2YKumWeqFuhuOgzebcV0Im9bEvNsU/+DwyDLLq1idRECiZfL8haQTyrDK2/z0R0KU65yKjomdFVq102hgsTTpFd7vdSUseO9NN3HDJxLXqHG75GVpcXvL2lqMWGUdQbCOf7fJT9L6dikV4GxOsy5uUA9HL0WKBjmmkkwo1zb0u+0eEM/D9TsFKSFKNHw5IvCwPPnqGcTlkxEiQFwm05EaBQ8boKQ6f1lYJEGCkjFRlEzOK/naW03B2XNy2RukRBtI/ga1vOmavmc4PQvjCGPJv4Mu/G+TcAw6xJ+QjBSh8jVg==
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcc2546-3674-49a1-ac66-08d844f0510e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 10:03:41.8999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FQJo3J2aY01pz8MuBlUou2uyxO5Hnje9GTfokxRI9lAdSeKDpnh+xqtSTTukPfjst2JndWvpU0RFxjNQ0sThp0z6dg/mlt3yTsjaOVHlRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0602MB3554
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series allows xiic driver to take advantage of
single-master -tag in device tree to improve reliability.

Changes from first review include an alignment change to
code, which should remove need for future alignment changes
and changing to use the new single-master -tag instead of
pre-existing multi-master tag. This helps preserve
backwards compatibility with devices without single-master
or multi-master defined in DT.

Link to v1 review:
https://lore.kernel.org/linux-i2c/20200218135627.24739-1-ext-jaakko.laine@vaisala.com/

Jaakko Laine (2):
  i2c: xiic: Change code alignment to 1 space only
  i2c: xiic: Support forcing single-master in DT

 drivers/i2c/busses/i2c-xiic.c | 74 ++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 31 deletions(-)

-- 
2.19.1

