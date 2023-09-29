Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C092E7B2AD1
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 05:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjI2Dyn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 23:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjI2Dyl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 23:54:41 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2108.outbound.protection.outlook.com [40.107.93.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB3519F;
        Thu, 28 Sep 2023 20:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5KUukAnnXENNdanthqOUyVy83dfKV6QbJ1ItUKbjDWAa8VYYHkNeTb4wmlH3PYk6gQ1BXJsZCnI5RovTex4XBqBUB2sxvj+m2KiTq6Au5MURB4HEt4MPVMVOpr7t4Tq/VIL0pok2Y+iSHPpnR6XvRWKD2uQKusLc5aOmiZycKuy/+L7uOpqrtoeNbaZdU89talRmqzoeNmQbwdtD7upw1MD14ALfIMwrnYbjneqZcWmfOoM58GOAXa16hnUlrkynKWpCTulR8VttGo7PgS9B8GXvLbfdv4J43tiqCcc8Wzf3xt4+q7iOKkLU5bQP9gSrn/r4Y1S8CjrBNJomNZTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rU8/bMAgq8i81Ggafv3/0NK9aRGGpx0egcyhB2D1sQw=;
 b=Lkq4BQT4iOqk62ByVnpML4Ib7xigX3yPhGZctOg62r9Zz+0f+H18XpxHrbaJIpOGVrPxSaxYEcVepjoS9lr4/CmfIhr8zOLAXqn8y/l+Nwz9ldXVw54baRJpe3W9nBIIhEMdgqh1i1Q1PeKpjD2lrzqDUKImccTwepJTTXxyrouKBMgr96hm1ZDm94+AUYzez5vl2O+VTws1n5wXjhVT4AkrhVbtEqmxMI014P12iUxuh8rhsjJheFZ3ebEeb7U5ID2R0DvsTZoP/c/MFEhjGv7DDrOsF6gG/ObDuyLwsXZOmXNVev/03pxtz9g8JzgE0yzZaA6cOdQ9HLbamzTYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rU8/bMAgq8i81Ggafv3/0NK9aRGGpx0egcyhB2D1sQw=;
 b=LqTeoi5TlftfD7CSnrxg46CyBqIQm9X+qSefqlD/M0pjI7+g8mNLanTe0WHa/xPAbRJB1/IJdxqlkcnljbwxj9GSOafYo+hXkG33MrY8QkaucrvpRLNVkkwFrRUJlXpHSk/Tn8m1D2/Ui/okB2ulLVexc2Zfdw0fqWa09Wz+qZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 DS0PR01MB8036.prod.exchangelabs.com (2603:10b6:8:14c::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Fri, 29 Sep 2023 03:54:36 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a%7]) with mapi id 15.20.6792.026; Fri, 29 Sep 2023
 03:54:36 +0000
From:   Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, tamnguyenchi@os.amperecomputing.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
Subject: [PATCH v1] i2c: designware: Disable TX_EMPTY irq while waiting for block length byte
Date:   Fri, 29 Sep 2023 10:53:56 +0700
Message-Id: <20230929035356.6435-1-tamnguyenchi@os.amperecomputing.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To SA1PR01MB8131.prod.exchangelabs.com
 (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|DS0PR01MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b224911-83d6-46f2-b27e-08dbc09fc0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6BQ1Vs1KuFJoY9o1yR1m8Afy3Xg/ixwfJbr0dVa4M4Z1IDk4kPSvsI5XRvjttQqiRCRkY/zrRVAbAHzME0j2BwTTnegYawcDYcdF8Kxw334RpBj4tgx3CTpVjS9cDprhDP8UV7r4ksMKuZuCWq5upsod7izLcrfsnad9KnftTB0kKf+Wc4a0o8TBiFdmZE7Nx/eeYXjKMcPnHG+py38lXNEmbbt9Oe/Ma8P6O9Hrzh6qcsX6BxKr+KLjeHmJ3hjDqEb3t493kd/rSBzmqiT3thfOmrNwjNDefh3tSz8xvsxf0HyNJkhPt4nARWX2YMfSCWqUEuXIeJIRIUQtNoj5I22W3pxj7RS9Rhd2IdhbrxfRU/VreV830g6dMzReQVyVxXyyOfeuTAqQU/4osfl8dfnilYYdMC7JxaR8WUC34jXnfEnKYcnzucYGsnkV3jVVh5Q4hVOz4CeE59dKtOuIKQGmZ5iOmjShImxfZZWBmUvMsJZ4Hp1sRX5rhGv/8U7Ur0XdAePwUlvA5XK0GZY4IArAvFvsrDcM9fdWzAC55yeCHi/p6KvpIrs42FAYy8NGHljTJMVo2K+jYR2iilgVmzqQ9vODPD62ikZQE4Gs0AxsMgQzh9DJHAE0OeoOptm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(376002)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(6486002)(66556008)(52116002)(6666004)(6506007)(1076003)(66476007)(66946007)(6512007)(316002)(8936002)(86362001)(41300700001)(83380400001)(26005)(8676002)(4326008)(478600001)(5660300002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T6F36GUHSu1MWrJmVFtlWFZhl3n5jxWsZKMRul6rqJQCMqvVZ6Je+iopCyOP?=
 =?us-ascii?Q?eEhBvNqHdOaU61fP9efIoDly042CMppMUlmqYTz/An2wC40wO8Kxd4xVsdJ2?=
 =?us-ascii?Q?+vduNUxEsXNyBLhDq7e+cSIxowRq4nMnb8Ixh45n1j4OTwY4Vjc5BbcSIV50?=
 =?us-ascii?Q?U/Mo6Jbuesh84AzO3+pLvMX0GiM4ziyqnCPwq5QmqXSlsp3pMFrww+q7aHsi?=
 =?us-ascii?Q?r9HpWgoDi3GmQH5zYaYuCAXfZgWn68lMYQXauC608sNYRSMJ3nC8/nvgpGQB?=
 =?us-ascii?Q?+qWAeoRh7YF8JVWTDMUZU9WBVkaiCTmP9kn9PFRmFzj9HrA9OOM+Ri0BUOXo?=
 =?us-ascii?Q?MGZDMzfUYq8T+5P60oS1Wt5CKvvs2t/tzNvZXRjoRMUIUZcnTmOumqMJhnw7?=
 =?us-ascii?Q?y4tiJWRwIxF/zh4Ix1NdRXm0OFtbzEL5UPcTAAFRiCCLBmH9+5bIw+0n3Vno?=
 =?us-ascii?Q?7dbt+CiRNu8w29ZECOmzE0WLzqRgBbe02WVw8iAvolqPvtX5wXhfCvCqirMR?=
 =?us-ascii?Q?ZI37Y6t8SCM8Y3f/XacZt+wXjMaDljdCQ7og/suyhvhzgLnIMustK9Zc7OS3?=
 =?us-ascii?Q?+ueSLX4vyJW2fOBSQ+4jkWzOpLXTKcNMduNsCPmTFF16BUoeoETcWRZxf3WY?=
 =?us-ascii?Q?KmIdRS9Yqh95L8ONJq5W8jbaQ1ceUf/KCp/uWuM/RLTOEd7lmwh0KeK05VaC?=
 =?us-ascii?Q?ZQEvp4yWiRT9KfOy6g1kXGNLkGMh000TDQPdJqAmx0D2xqJ9YW4Tm2Oa/xIs?=
 =?us-ascii?Q?pOTwAEJBIQUrJlf9tqROY+DTnLHjdaerot2gB5Xy0X2t1bcCKhItvbeaHnH9?=
 =?us-ascii?Q?2xo/M+tc9PYPJe8OuyjH3mkipJh+Tx8xIZIDc72gHg7Dvq1QpI4jIxoi7siw?=
 =?us-ascii?Q?TVxFrEv/dj6Y/3lXCgkknlbMH5e5iQOtOyI3Q+wJi3ksY1vTyP6GxENhqQtv?=
 =?us-ascii?Q?UnJnDC0aApNJkNEyVT8PY3Mc2j6ziGgg3Ty9LC5gJ5dQDtq9G8sabmV+9itc?=
 =?us-ascii?Q?0zwvromyMobLzoBrDem6maBwa/iDgD+iiTzbi4f8hem1eqY0euk+DhE6Pqaq?=
 =?us-ascii?Q?kL75N3WhlEI+qTg40DZD7zZiTZ5iaugq+8VCwgzTDHp25hqi1bAWRLgPzlzH?=
 =?us-ascii?Q?iaK9Esaeo745x/QFvmRIsQVKK04uh7ncfmPfu/jP7n7DiQexJjRcQPYVYxXX?=
 =?us-ascii?Q?yx3j9kyuGSXqgxIm5aAa2v5z2CMB15T2qfaAmXDlEWWXp/3381D2kb53DYDR?=
 =?us-ascii?Q?wk+atBYhhI+1b9MBTtFHl5xQnxea996ryiUmw8l6c0034edpKxYrOLKudwuW?=
 =?us-ascii?Q?YeAD/Oq3oRhv6bMyb9sa4YZv/nLGlUnM/o5PxHL8WzBn2s3Jh/iMpwmnhuRK?=
 =?us-ascii?Q?XDbMzRWQrbt6ILRJCoLYoPTpxmZArsdiH5QFYuDEtB04sP3YK+oVG6hJ7ts6?=
 =?us-ascii?Q?pdt6DbEl1dgTp0t3YB8Ap6BqnCcSYEZKUTC7QM05t4XUJSNp4AzxJxz5cFTc?=
 =?us-ascii?Q?VzVqFwKjfTqBMCUsTPd1DL3crt/q9LdJK2hUWAMRLsPAUhqCB1/avXCdJ9Il?=
 =?us-ascii?Q?VpsTZsAnaTYBkHzw7YjmRI5MHIwbSH8HZkgEQYVff7WS+6imbTUamTMKPVbY?=
 =?us-ascii?Q?zKbCpo7hzmW6oxejTxOwychSn3wUu7Sz5bZLA5C3IVUl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b224911-83d6-46f2-b27e-08dbc09fc0ed
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 03:54:17.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpKEanMqGlpYWwPbJeSmfh2EjG4X9BRKGWuD7+atgmasCVCWNwra3kHgWXlwMDzpAASJPjIxzkQFgv5/wps7HPBqvDeraXJgRLJQeK71NkmK/0qHWynGW+6hhkFM5zAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR01MB8036
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

During SMBus block data read process, we have seen high interrupt rate
because of TX_EMPTY irq status while waiting for block length byte (the
first data byte after the address phase). The interrupt handler does not
do anything because the internal state is kept as STATUS_WRITE_IN_PROGRESS.
Hence, we should disable TX_EMPTY irq until I2C DW receives first data
byte from I2C device, then re-enable it.

It takes 0.789 ms for host to receive data length from slave.
Without the patch, i2c_dw_isr is called 99 times by TX_EMPTY interrupt.
And it is none after applying the patch.

Cc: stable@vger.kernel.org
Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 55ea91a63382..2152b1f9b27c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -462,6 +462,13 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 		if (buf_len > 0 || flags & I2C_M_RECV_LEN) {
 			/* more bytes to be written */
 			dev->status |= STATUS_WRITE_IN_PROGRESS;
+			/*
+			 * In I2C_FUNC_SMBUS_BLOCK_DATA case, there is no data
+			 * to send before receiving data length from slave.
+			 * Disable TX_EMPTY while waiting for data length byte
+			 */
+			if (flags & I2C_M_RECV_LEN)
+				intr_mask &= ~DW_IC_INTR_TX_EMPTY;
 			break;
 		} else
 			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
@@ -485,6 +492,7 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 {
 	struct i2c_msg *msgs = dev->msgs;
 	u32 flags = msgs[dev->msg_read_idx].flags;
+	u32 intr_mask;
 
 	/*
 	 * Adjust the buffer length and mask the flag
@@ -495,6 +503,11 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	msgs[dev->msg_read_idx].len = len;
 	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 
+	/* Re-enable TX_EMPTY interrupt. */
+	regmap_read(dev->map, DW_IC_INTR_MASK, &intr_mask);
+	intr_mask |= DW_IC_INTR_TX_EMPTY;
+	regmap_write(dev->map, DW_IC_INTR_MASK, intr_mask);
+
 	return len;
 }
 
-- 
2.25.1

