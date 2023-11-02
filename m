Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F20E7DEB68
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Nov 2023 04:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348424AbjKBDaw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Nov 2023 23:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348397AbjKBDar (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Nov 2023 23:30:47 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615B6127;
        Wed,  1 Nov 2023 20:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niVWRkwbkCjOy74kUOujyO0LtTMeSvKQDEQS7XVcs4xNdjPLuOd/DKjunK558nG5D6iw29JQ+CFLwhfwdnUvNPh4wbjAVBjHVRerppFhdGn28WqNtFdFez/7kJYVreM5oB+/En8SLa3mRh8wg/NzG+LT0ZJgsq5Faz7iQVlGc0qp3uNIlDKtywdnkYynhfTQw2Pgjx3NvzoOWoVDoxnDa5rbhVH/0fUMKGvDPWVqvcNv74hps8QbEWYtFUX41HOOg04hn9m5BPw/0XeXyUBk23QqTEKrkusRjBW4RFiI5PQgOyiJw1CwBwlUWD1AVuKOzD6kAC9YZZQSGyzJwohrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67T2bNTr6OqNAORRS+HdUqCRVLjtgF+4F7i6hyhuihM=;
 b=Z0Cg082HbKmLv0isGBms35+Loh2GEDM2cjqGMvEkn3cjoZsRcY5YHklpjvayu7QeNpmZ5lpAORukURidd+Kly3ssK0Hn3mfni5k8waVQ/ljdm+UhBmZ79b12t0OZaRjqXJoFKt/Lmk+ZOsA7KML7AgNbOVu/9dW58T4l+bfS9QabDpmRtCwpy6os2CS9UFTt0R0PuPeTxIUuVE68pPEAUNT2IB4732X/yXzIjVHgkKk5NMrsm0e/lPSwlF/NyOFAp+35sGd0+56C6dtxwLquwnKeoF1sN2VF45Gq8LnBbGjqxK+jysRIIVrWZLb7S0VwOb35fXgrICgy8CJa+iV6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67T2bNTr6OqNAORRS+HdUqCRVLjtgF+4F7i6hyhuihM=;
 b=PGDu3ONGvAnxSXuWrFjW7XvkuJG4oYFbvlmKd7O6yB+FywOhlf7C5UtAbp3GGXtQ3LjMsqvC7y7EWOAfzJZH987T8YgCi6EYqn4Q0lx+tw+csWST1h26sAkixnD23TgpvDfAYfd0q0uBK+9zeRoPps21+NNYeccJb7iJuCnOrxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 SA3PR01MB7967.prod.exchangelabs.com (2603:10b6:806:31e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26; Thu, 2 Nov 2023 03:30:36 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::428d:f5bf:7ca0:b59f]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::428d:f5bf:7ca0:b59f%5]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 03:30:36 +0000
From:   Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, tamnguyenchi@os.amperecomputing.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
Subject: [PATCH v2] i2c: designware: Disable TX_EMPTY irq while waiting for block length byte
Date:   Thu,  2 Nov 2023 10:30:08 +0700
Message-Id: <20231102033009.4555-1-tamnguyenchi@os.amperecomputing.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To SA1PR01MB8131.prod.exchangelabs.com
 (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|SA3PR01MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e2459c-f22f-4b33-a80b-08dbdb5413b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vrKqSybqyEHXz4dl49ddjLs6R0PdHkQewe9oLccD0dRexVd294gk6e5pVL3MQQSK10SdtESfzV5AjBSHFY7dR+qRqb/3apXphammCqUDUFI6Ii7P1cq902aM1nFoubZa6VpTWDU+xJA4r/01DnWC4D0ioKf+hwh4EytiRXbDgI+ClE6sjCcsBj+CTsNmDVGsl//9dT3Ck/u1til8vQgyJ6qHcp1Z7BhU+uJCDwfQOJ1olM1iPHqUu2QIDHq7lKXc5hkOQ4RRyKBGpJH0TPojbdiXjQebDQRIRscEGzO8xwxz0iSLvxXJVh6qixRg1xFT72186DI3hh84fy6YSoT35vpoCqzUVp2VAK9OgGvdaN8HaTeNrTLrh9RsHZ7VJ1AKktXaXTmFr803lXeryEp8UKESbWJgdvD7dPLe+82D1ZLUbqhfpsuQ3s6a6iY7XdvS03oknhvzs8n7XDdEjiT5odRoLNVNr2cD9MmpvpWLnqHtMz84fiqNirS8WzmSad5b8fTEUNUHfk4BMtOjIXJ4r963n9HLKz5CqYsFCQ0yaa79AmX74LoFjKKNtN2p3kq/2K+7G/CoNOKQyhLWVK520Rynkvny6sehvX4JR3D1LdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39850400004)(366004)(396003)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(38350700005)(478600001)(5660300002)(52116002)(2906002)(66476007)(316002)(26005)(38100700002)(86362001)(83380400001)(1076003)(966005)(6506007)(66556008)(2616005)(6666004)(41300700001)(8936002)(66946007)(4326008)(8676002)(6512007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rrsDFFgkqSS2jIRJZ7CKLNNAAUBfqkKNUHqU+GHRURuPuN63PmymmHr3enY/?=
 =?us-ascii?Q?yh5WDfUJBqe2UOhBCaa3IFIc0uyraEpzXjj2JRxmyW7QjSvzHlmBpbIZ3YSy?=
 =?us-ascii?Q?1utbWJQ1IpqWUGc8il4uooYN6K/gopuI8C5roSt5zNoAFcfas1cI0unFpyBh?=
 =?us-ascii?Q?Mqi7DuPSX6uhqhfrXLb5ROWZU4o5uyivYCtf7CKM6Z88peDDnUiUA8o91hP+?=
 =?us-ascii?Q?i93DffYhtnHsB91jHOQN16LEZU0Z2Zsoi4mCHVuySaQoxwIZ0z6DHvD0JBbo?=
 =?us-ascii?Q?4uP7KxqzwLvAfpco/3icDtD9KHY2ssOHhtA3UlqlYwR2U7N11iW2HJBfgmPL?=
 =?us-ascii?Q?RvaGpqyWj4ZTSOnUx8XZMor24C3fVEgI+Nmz2bizYRhuk8hacFWHZCDmdEyl?=
 =?us-ascii?Q?q9Pu6bfm4dEA50lvp6kVS6jwpAdy132un9vYq9I8XzG6LdQo2tzCcRiehUjo?=
 =?us-ascii?Q?qF3YqzPgIMu1vyXfXkIrfvjnaRoOi5N7iwdETuzDLd/8o+UIBUt/yKpZGCMd?=
 =?us-ascii?Q?T6fBJeqgqs7VZy/mxz8F08ZYUvDog6d+6GNJX8PmxJymXk4Xn2ufGmYfg9CB?=
 =?us-ascii?Q?4KSGhrfGwb0eeJUVBkHUjf6h8Ud4MTA/eouq++GzkugnPZCrM0HjywJAetHr?=
 =?us-ascii?Q?DXU6y/5ytYD8jioUMzeljEYo2EXCVoHzfOdMva/m3S7pmB1+hc2+O0L5bOCW?=
 =?us-ascii?Q?QgMYs67+SOXMALL8IablT1D5KvPORSWDtcA7EJT2hEERTaC3rALkYvpZIRkL?=
 =?us-ascii?Q?Sgcwcmlm6dgX9c6Qiwx2aQys7UkTS3S0rPK3GSNvRaPci8Mpo1x9V43DkDYS?=
 =?us-ascii?Q?XGg+qS5ccaAEyq2KaWA4PuyAbaS6ytunhkVE0IFMkyYEW6koTss/88w6O5HV?=
 =?us-ascii?Q?MIXlp5Lmtr/9xMHQ92tdG2u4RB+L4fCxHwxna0s6tLFcaifnbtNuZ2/uQKBx?=
 =?us-ascii?Q?PnJLDdBgNL8HcZEBu3ZVYTQaudOj3/x3LDmAwraTl35gjEFoGRwTO/Af+wbr?=
 =?us-ascii?Q?CpEPXSh3uWQVm2Z0ZelSw39YqbI3a5bG3OY/w0jB11wslLXNpEnUcszOrRH3?=
 =?us-ascii?Q?HhH8/nT4Wbtoj+W0vCXPAPycSgM/9Bzu+eBepacFnSPbNzjY4nHjWRVM3Lsr?=
 =?us-ascii?Q?B9wUxDAokajdtUxAaoOVruqJLyOCV3I20A9FoRv5hVofq9AwQ2akptB1UM0q?=
 =?us-ascii?Q?BcwVVXJzo/MepvHydeSebD83rvUOlWV6diPuPLPtblalfW+QdSKvc1TU9Jhq?=
 =?us-ascii?Q?Dy91+VoMjbv62UBpSGkPgCG1MJFtdDnLj79g3IWa9yYVSW8c/O9HScbEEMOx?=
 =?us-ascii?Q?7L12cKMxzrqNMIDDapUy3QxV6XGj9tAZMhVG3n/QlDoAhPAfhkn502ZNhIKE?=
 =?us-ascii?Q?lFt7MQnO5MhpCv4l2Ml2OJAjPWaw7/Mku6BsBH55cypQBxirY/rS19Nc5Y58?=
 =?us-ascii?Q?cY2rBop+phLbdYo9+2nOYsgWV2f2qfqpY/MWTG2KuYBOORerxp3o4xVDsc7N?=
 =?us-ascii?Q?4VKeWnFvwjNOp5Sgpj2bXiSofVmDxgfr/hP5uTqjMmBKGWAdM3WzN+7+kMIg?=
 =?us-ascii?Q?/M9k/y6Ug6iDkDqgai746rTeLuPHtCmyTcmQJgkf6YqdvUk4yGkeveVSNGJ3?=
 =?us-ascii?Q?FV64Zl7QTULW2WOb+5OoY8Q=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e2459c-f22f-4b33-a80b-08dbdb5413b5
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 03:30:36.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYpcjw/AQCeAQyaLKKc7cRY4lk79InuKRXNCDQIDoknJkJrx4+ag2jGvphuztop+yEMCxPQxOQNtQQDuBwpi512sU6cd+MXB1eAtejWpgELXe7cdng9z5shikpH3KM+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7967
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

During SMBus block data read process, we have seen high interrupt rate
because of TX_EMPTY irq status while waiting for block length byte (the
first data byte after the address phase). The interrupt handler does not
do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
Hence, we should disable TX_EMPTY IRQ until I2C DesignWare receives
first data byte from I2C device, then re-enable it to resume SMBus
transaction.

It takes 0.789 ms for host to receive data length from slave.
Without the patch, i2c_dw_isr() is called 99 times by TX_EMPTY interrupt.
And it is none after applying the patch.

Cc: stable@vger.kernel.org
Co-developed-by: Chuong Tran <chuong@os.amperecomputing.com>
Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
---
v2:
	+ Reduce the indentations level
	+ Use regmap_update_bits for bitfield update
	+ Rewrite comment statement                     [Serge]
	+ Update commit message
	+ Add Co-developed-by tag for co-authors        [Andy]

v1:
  https://lore.kernel.org/lkml/avd7jhwexehgbvi6euzdwvf5zvqqgjx4ozo6uxu2qpmlarvva3@sgkce3rvovwk/T/
---
 drivers/i2c/busses/i2c-designware-master.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 55ea91a63382..ae76620ef35e 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -456,10 +456,16 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 
 		/*
 		 * Because we don't know the buffer length in the
-		 * I2C_FUNC_SMBUS_BLOCK_DATA case, we can't stop
-		 * the transaction here.
+		 * I2C_FUNC_SMBUS_BLOCK_DATA case, we can't stop the
+		 * transaction here. Also disable the TX_EMPTY IRQ
+		 * while waiting for the data length byte to avoid the
+		 * bogus interrupts flood.
 		 */
-		if (buf_len > 0 || flags & I2C_M_RECV_LEN) {
+		if (flags & I2C_M_RECV_LEN) {
+			dev->status |= STATUS_WRITE_IN_PROGRESS;
+			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
+			break;
+		} else if (buf_len > 0) {
 			/* more bytes to be written */
 			dev->status |= STATUS_WRITE_IN_PROGRESS;
 			break;
@@ -495,6 +501,13 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	msgs[dev->msg_read_idx].len = len;
 	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 
+	/*
+	 * Received buffer length, re-enable TX_EMPTY interrupt
+	 * to resume the SMBUS transaction.
+	 */
+	regmap_update_bits(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_TX_EMPTY,
+			   DW_IC_INTR_TX_EMPTY);
+
 	return len;
 }
 
-- 
2.25.1

