Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED60254766
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 16:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbgH0Otu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 10:49:50 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:53991
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728209AbgH0Ots (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 10:49:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vbc0WS3iWVu873KWW7F+1xZVRCw9jTpid+NWUqx/Z5ES+yctCFKjrrlQ98e7Xv2b4PAsvP3W9C/ZtrFWfJOk5MCihKBX4TfN6gnOH1RPSNu/FhZXFthZOZZvMSmwlhrA7NIJYLpRjL6/BqxHwIMocamREZdOMPmt8NuY7W9lt2SNKdEMq0hmeMt0LArF4iYSd8bo0y9WIEMfJ4Z6exak7Jy2pu7c7RIdR64R9LO4gY0z23mmHaZfLlHRWxUP2Jl5yRSbypGXtMWD0uhW1JJOn2SjzixrCBu4X00VAADKJRT3yYKO7O5B+Yli6sLiJr1I2lGKgTxQx26f6HI25Rp8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ed8Ow3JgE0Vj8yl18pmXMZML4lLtrWfllUAXno06gz4=;
 b=VxgT3I+l0mhRzN8Z38tZLpJl3PGdOG9dK0LXItCDb5CU8vJEnBKFOFB/BT+PoifC/suV2LsWRoBMKHtphOOqdstDpRvMHlk7EiEhIqzd1z4kYWJ27AwyhdMCJMU9Dblo3mwytLHp+qVlfDuxFaDxLGH9vix4ETjOajU0EgTZjGbkRhQ93TNKuPqQL2AyCWs9GuYCBpyWm/GHotKVL/mVkDGFIcbxSuUh/i575xCSh6mo/OdGD9xDkgJe8C8ryLrdXk92YOy65DbCRv96Hnfqgq42Sr/dTtVxv+bKbRIBwG7TT9uMhe5m4v5Hv8xUoWPSbfHMVLyjdxIofVwbGGzUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ed8Ow3JgE0Vj8yl18pmXMZML4lLtrWfllUAXno06gz4=;
 b=m6rvcUDsZZGTBj+VwFrOa2VcJUKrElksUYgx3BcST/rLcvj9w5OImMWeHzhtOdPjoeOpw9TFTBgbH6TCJHrqt8/h/0Q2YNOQphczDdnqqFuatLyZMoThJQhTOCzonSeAMItNpJPoFuVOfkU5+Ad9USYwPbe2osmElcnNvrXsdNs=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM8PR06MB6852.eurprd06.prod.outlook.com (2603:10a6:20b:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 14:49:34 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 14:49:34 +0000
From:   ext-jaakko.laine@vaisala.com
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>
Subject: [PATCH 2/3] i2c: xiic: Improve struct memory alignment
Date:   Thu, 27 Aug 2020 17:48:47 +0300
Message-Id: <20200827144848.12107-3-ext-jaakko.laine@vaisala.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
References: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (193.143.230.131) by HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:49:34 +0000
X-Mailer: git-send-email 2.19.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8bf1c3d-c8a5-4ccc-80b3-08d84a9869f5
X-MS-TrafficTypeDiagnostic: AM8PR06MB6852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR06MB685267FFE5A0D6A00E8EEE4CD4550@AM8PR06MB6852.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oy3W6GEIq5INEWi05Ri0bb1BK9AY8TBwPjLDxIPrRgOofRjruCj8AkhvDXOWtFzC0MDdCzQFhqsl+Ap+eEl4hFDqNxUkfkYJeINasHoC/OvBHHIULBtsqHHo1XAxqnK+XnqI5nzUMb/famJPJHU1pdhYyNh/gSvBX3BeUlNkJuFgbRk0dkE37g6m3SVHaM0CsuiX4KddTgmYPyIi+kGbmPfOF8F9mRWN54zCJWerdNHrQG8E4wdxjd3EZcI45VIP0KXsmIjy1hC6qrDOztofXeJBk3fTo8woHxTNR7oC6KBBU9YlRoCoLar3e56zji7Y/tWpnQPTjJgGqkYEcPrjvl7B0RMANqF26t3usDr4Xfwgw/Jk3pnmkPkLSiXnQvvf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39850400004)(396003)(6666004)(5660300002)(478600001)(1076003)(66556008)(66946007)(66476007)(8676002)(86362001)(83380400001)(4326008)(316002)(6916009)(8936002)(6486002)(2906002)(6506007)(9686003)(26005)(186003)(107886003)(16526019)(956004)(6512007)(36756003)(2616005)(52116002)(25903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +OBqFMClMbJfdCxWATnQ/FZ4vOYnJPgVswvfLXQoOO9kAaR/dFfDVyTR0Spy7d59TV44CYRRfEnIR9hZEH4lMG5Hdp47hL5QOfJxK2J7NKCmmuYBjnUEDRUnRpUHVkb1KzwjcP51A38FVRSaCb/ElbJQ5S0KgZAkK0E3SEDIsJ1IRvY63yTx8o6yhBpPRNawHtoltDLMtOBFrTn+641MpW0YNoD+XVoCkEDBpMMuNw+ObgPUBzKPVf5OfZeKNcxn+78AvscTEbQp9M2zW12fpjCkLJs68k43k8yNuFERmFYDbiD+ueqW4lP5fS+24572TAC4cmvMuL+J/RcF6kPhWSfBBHuSVOA9XdmB9rV6akUoftyzJcKChIAYmHKlDHik4LsiCULg72YIwgOctE9IJCGSPyIc7RoRB0Y5h72ABJtNW/IDzOK/yonfoy3TZgimrYdfYLEOMNBXRvssEFuHnagHoWieql0u6EkFNCemtoqyJ3OVr9iKXsmhQ8rAgstX/EmKLRbZV7TXBwWe98fXC9i1VuZMsCLr2FQ+84L5MdPzFL5BRJz/ck0oOcaR9b8YBlBpMuOxVFMNdGl9IVwttaw72nrmb2S8BZP+/ztR8ubQywDsoLwWZ783lMQZYt+lrHdWf02rjwSCldhO4o1FKQ==
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bf1c3d-c8a5-4ccc-80b3-08d84a9869f5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:49:34.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXT/+F/ajidHBoluSrHCk8YQKpS9f2zbcy2n+CQar8vgZ8Fm4lagbwlqnmwsI16WtNBEkk4hzPSanGdMZ+VZ/DL3t+meCytyizUI/ocqhH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6852
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jaakko Laine <ext-jaakko.laine@vaisala.com>

xiic_i2c struct alignment causes the struct to
take more space in memory than strictly required.
Move state -member to end of struct to get less
padding.

Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
Suggested-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 10380531d45c..1453d82bb664 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -54,11 +54,11 @@ enum xiic_endian {
  * @lock: Mutual exclusion
  * @tx_pos: Current pos in TX message
  * @nmsgs: Number of messages in tx_msg
- * @state: See STATE_
  * @rx_msg: Current RX message
  * @rx_pos: Position within current RX message
  * @endianness: big/little-endian byte order
  * @clk: Pointer to AXI4-lite input clock
+ * @state: See STATE_
  */
 struct xiic_i2c {
 	struct device *dev;
@@ -69,11 +69,11 @@ struct xiic_i2c {
 	struct mutex lock;
 	unsigned int tx_pos;
 	unsigned int nmsgs;
-	enum xilinx_i2c_state state;
 	struct i2c_msg *rx_msg;
 	int rx_pos;
 	enum xiic_endian endianness;
 	struct clk *clk;
+	enum xilinx_i2c_state state;
 };
 
 
-- 
2.19.1

