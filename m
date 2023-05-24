Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06B2270FD95
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 20:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237000AbjEXSPP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 14:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236895AbjEXSPJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 14:15:09 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ADDD3;
        Wed, 24 May 2023 11:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684952107; x=1716488107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n4hqN+AXaXZ9XEHrLYNMyhfq1J7mBVLmsRw0RlWIj0A=;
  b=gaio7bqVYf+ep9D9yYzbhYb/IGSuJPWjsHsvJom+Yb5SWgFJg+EoRRAm
   E4HEZUYy8ZTJ7O6/z+goOXay0IHtgKopOiBRGbC/coVlvPhKgXyFNBfEP
   BUcWV53DHGM0ASOO4vSH571K+w1duon1oAlQ6ZA8oLNZKvWr/ZXJlogUk
   r5JchrJ1rqlzeAS1MoTuJP3l45iaOrcul7PbsUKXt5BL8jbTqzd/C+iEu
   lpynNJ+7K+cexyIPu9OS0/AevwvdglfzZm+HnQ+p2Th0cbaWrJUbR6AqY
   9nacwWu9OG7o8nwZBh7/qpiClkLio8pRq01dVZDl/uTA4CRCGZzGBw6rX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="419367177"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="419367177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 11:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="654902139"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="654902139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga003.jf.intel.com with ESMTP; 24 May 2023 11:15:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 11:15:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 11:15:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 11:15:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 11:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPYlRmH4CQscUQiVgqp8oZe6vDcQhrXCQb7cyEkGvPwixTCVjOHb1Wz+8FzX1aSM9LqJNBfD71mUK4IRegLfKW5nDHsHp6YVD8C60w/3Nfz1ZlwPkorR0fY5tSlLUBP2wIqJFA4nnmo5QGcttkJJgez6gV/it9IaUwaYeZN7Mtzv2ZAVD/dIbwFV2WkX8bT2ZhE36NtIbco/yeaVLDcJwbskH3WYgw22HO7iTuJbico8cZXIXcf8FyJHYRXtbACXcOWRxn7MvkmJ727a7BCWuB+GBQTInZmsL13ECdInKO8CTkzPBcEKfoyFrCmN7k857VZrbfH849EDSPJ/GuDqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z/GFDa5Dh1tyjVDOWHA0fWHNkamGRRwhtSDx6XToPU=;
 b=W/LH/fSYNnqgEpYXD8tCmxsyt3HMiFlWrGoW8aYjQjOKmusW1Cgh2BjhnlP8koZcghGJ32zWDGLYB1qLzqtVXROHXLElT+wl5PyxtueDTtCLqOONRcKlmnMy/uFouC63AnzX2Ta02dztxHgNZDUX3CrbRPQeBGRwwlaAobqYVS6CDIOiVcEWA573okqN4OIs0lsxXQYKadgbUMrM7zQM7p2dPMCjK9G0vSHgPCIn4GSdFLIRL1iNMBv3B76opqTkdQ9yGptqx3JmJC5wGLDybB+0ht28aGGPCzab0bO94VdacRbG4I7lxEXcfyRYjDeRdb/3FekBkxu4yRRpL5Ga9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3004.namprd11.prod.outlook.com (2603:10b6:5:67::17) by
 SN7PR11MB7113.namprd11.prod.outlook.com (2603:10b6:806:298::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 18:15:05 +0000
Received: from DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31]) by DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 18:15:04 +0000
Date:   Wed, 24 May 2023 11:14:59 -0700
From:   David Zheng <david.zheng@intel.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
Subject: [PATCH v3] i2c: designware: fix idx_write_cnt in read loop
Message-ID: <ZG5UI7cJvmLXvtLg@davidzhe-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::28) To DM6PR11MB3004.namprd11.prod.outlook.com
 (2603:10b6:5:67::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3004:EE_|SN7PR11MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a060eea-3cdf-40e2-19e3-08db5c82cc48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uy76Uqpz1F9++3f+vGwcz9uPZgXx3KWVSJISS7qMHE6WtqHF18D473mNkOGQfGUcf/sGYWoEadlEgOLwUQxQmgzbfZ3ec3gWvdzHJvXysurJuj89HNcSwp+iqslJC0JTLMdozOZQkyEmeBn1pQ71clucJTDJvTCYexxORd8QbWtOgPNfS4faxC94idt7SqKz6iNx7G+gKC8wDTft1OgyhJhQ7dK9rSHF5zG3moMMYdiYhDU4pqcKIDlBLB02WANL/RYNwBCmeXXbug/vHobI0WSdYMj6ktyMXfSrdcrpgAkKA+tAlUwvzLJ+lJtSsfi0LrRVnKQ3LuaKkJTnEM6QTP/81miq1F8Duwlc9XQ37XgxX9gtEMXBlgnW1jeaXirsk7PozNH/MyeCM7eq6/06YufYtAkmtR7rmcIPlHIqqH3KIvkL62T1ZAkpNUJP1lNzmQ1aViD45yPU441aboi0AU+dVQQuscj55JF+DsmBHP9hk+A5f1hRQQ34DeWSCPv4GPvYT1/VzrRRHnbk+kLmqHSVLasoGDLfoPtif+Q1AzV1sbeyltot0VIAHBGCpt4W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3004.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(5660300002)(8936002)(6666004)(8676002)(26005)(6512007)(9686003)(6506007)(83380400001)(44832011)(186003)(2906002)(86362001)(66476007)(66946007)(66556008)(82960400001)(33716001)(4326008)(316002)(38100700002)(478600001)(41300700001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JWlKIAehPMxWZ3+KkKwm+bWXRvggvPqfKHTkZSyy6VoZvZ5BZfRHWA2WrNFP?=
 =?us-ascii?Q?ETvZIKwJEOEPRRNBWlfyEO8rY3gXoJgvHpmtFh9uXOFLGFQMLzBMCdSyJH+W?=
 =?us-ascii?Q?gZ/22oag0cDSK6A6JsONRjLxNxHxBwq1GNcKCHRKoNV+7z0fETH6fwTqDaUe?=
 =?us-ascii?Q?kZCnWRQI5Js08eEl6hMIU64HXdUybYuCt3PzEpKtroMyHL9qy035Vw70g/9v?=
 =?us-ascii?Q?QERbCre6lP6rZPgtpZswxdTagewT5hnPpIsOUT7LurF4brPzyxACqLqrXSJq?=
 =?us-ascii?Q?ekJ8Dfocm4s3xZIepOk0+wrZ0PCyZYc9B2qsBTe7qszAPTZTKypwstEiUVec?=
 =?us-ascii?Q?998YSa7/fqiTS6w6axSVnCYKDI4V2JIhok1hey0cV6TFbwf67jeaMsQsXqqJ?=
 =?us-ascii?Q?M0wOuChSuKpIbaL7F2P+p1fppSW+eFBffDe2uzAbqH4Da0DkZYXXsaz1fuCh?=
 =?us-ascii?Q?EauZGxZc5jjVeilB3SADCHidd9WUrrP9CFVLRwqe58Soek3q4QYkwElW2/N2?=
 =?us-ascii?Q?MnNol6CR1QdWBMlTzQUF7MJN2DnGW94+wU2s832kYdJ1WengUnuEjfrYdarq?=
 =?us-ascii?Q?8Iw2e/3Pf1W+gdyD++2m8UfgepOjDyDpEiw1AOKxuzYxcZ39qlUGUICGjoAw?=
 =?us-ascii?Q?JNiTRPJc6k8Ib7YEVx5NoCc4fzhv9ohsRc7LLE0QhsP62w8a2liIkZwYnSJj?=
 =?us-ascii?Q?tpWvpUbCwSBxF9c5meyEdtPweFIq2u20JRdRtGXLe2/MmqpAY/lWdnY2MhwU?=
 =?us-ascii?Q?2HE7sD52+EaoKnx9Orm+jCJ/rOuKm97W/Cg7+FTkhQf9Z/E1JwtGbK6sU4py?=
 =?us-ascii?Q?rok+yp+EmiH3UoPKKuAHW9C0H22OB5G08eWSP/x3wJ0u7KXlMir6wv/9zxYX?=
 =?us-ascii?Q?Obls2BLaQEM5mpldGGGTPkIhN028cf/CMuRYxVi1PBU5gsbBNyunR4YF1fmu?=
 =?us-ascii?Q?CdL0o1tQHZyn15J6EPWbqmX4NFLay81dMt3kYg8kIPtlbm32MZmgQmtjchUs?=
 =?us-ascii?Q?TqAYyGCepkBGtU95u97x4Pnq8j3vS3Xt3ooXrIS60J6OZbc5b1f7DWgDcOe8?=
 =?us-ascii?Q?G3ZeRWvD9o4qBSxJ3++QcuWpIzJmPIvAxerAJJ9rZsWXSbgnqeK2ONkbsZHd?=
 =?us-ascii?Q?oAfxoAH8VmXHot9yOqp2A5Hfl+HSb236Eqr/gsjd2XU4L61BziUzDwPNKQvX?=
 =?us-ascii?Q?NYeYDlLMvzStqsgeO/H1o9CEdNkQWAaeCxYmF50bdSAub209GrXSMOTuQtl+?=
 =?us-ascii?Q?2w87HjeObw6poLZlFqk4/Wpx93iXS+0rawdIHXJr5K1mqDXuM3nExY/iNqmM?=
 =?us-ascii?Q?+pS6pfIFPctrxIThVLCsPZr+V1eDme9EB9+9IG7rrSE6yhj8f3eXx3NRmmeF?=
 =?us-ascii?Q?5/r3+PRdBwb5pEfMWVjFIy+DXF49KQDFS1Q4XZBht73aEd7QQzw5cfD3Q1hd?=
 =?us-ascii?Q?sbATzdihucdK3p0MNBqkGu11S0bLHAwuHL2v4KFH5irnYf2Q3SrulgM3lPmK?=
 =?us-ascii?Q?Fz6UjLFoTjvjmNE54dPiR2HlgYx6FjI07Zu09aCw0Dl+OtLgSbpEgtTeBEVn?=
 =?us-ascii?Q?p7bIsc6+O3aPl249t/CHlGzLOUmkD0v1K1faOwTiJnNPXHCd14F1huxaynQT?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a060eea-3cdf-40e2-19e3-08db5c82cc48
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 18:15:04.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYJyjwU/Q+G59HRLFV6yP+snHs8VWR+D7dyndQJDDy61zhGHLY5PKz3R/t31OMqzxydndl9pNtZF/CEJTRreYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7113
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

With IC_INTR_RX_FULL slave interrupt handler reads data in a loop until
RX FIFO is empty. When testing with the slave-eeprom, each transaction
has 2 bytes for address/index and 1 byte for value, the address byte
can be written as data byte due to dropping STOP condition.

In the test below, the master continuously writes to the slave, first 2
bytes are index, 3rd byte is value and follow by a STOP condition.

 i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D1-D1]
 i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D2-D2]
 i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D3-D3]

Upon receiving STOP condition slave eeprom would reset `idx_write_cnt` so
next 2 bytes can be treated as buffer index for upcoming transaction.
Supposedly the slave eeprom buffer would be written as

 EEPROM[0x00D1] = 0xD1
 EEPROM[0x00D2] = 0xD2
 EEPROM[0x00D3] = 0xD3

When CPU load is high the slave irq handler may not read fast enough,
the interrupt status can be seen as 0x204 with both DW_IC_INTR_STOP_DET
(0x200) and DW_IC_INTR_RX_FULL (0x4) bits. The slave device may see
the transactions below.

 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1794 : INTR_STAT=0x204
 0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x1790 : INTR_STAT=0x200
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
 0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4

After `D1` is received, read loop continues to read `00` which is the
first bype of next index. Since STOP condition is ignored by the loop,
eeprom buffer index increased to `D2` and `00` is written as value.

So the slave eeprom buffer becomes

 EEPROM[0x00D1] = 0xD1
 EEPROM[0x00D2] = 0x00
 EEPROM[0x00D3] = 0xD3

The fix is to use `FIRST_DATA_BYTE` (bit 11) in `IC_DATA_CMD` to split
the transactions. The first index byte in this case would have bit 11
set. Check this indication to inject I2C_SLAVE_WRITE_REQUESTED event
which will reset `idx_write_cnt` in slave eeprom.

Signed-off-by: David Zheng <david.zheng@intel.com>
---
Changes in v2:
 - Send I2C_SLAVE_WRITE_REQUESTED for HW does not have FIRST_DATA_BYTE
Changes in v3:
 - Move DW_IC_DATA_CMD_FIRST_DATA_BYTE next to DW_IC_DATA_CMD_DAT define
---
 drivers/i2c/busses/i2c-designware-core.h  | 1 +
 drivers/i2c/busses/i2c-designware-slave.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index c5d87aae39c6..bf23bfb51aea 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -40,6 +40,7 @@
 #define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
 
 #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
+#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
 
 /*
  * Registers offset
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index cec25054bb24..2e079cf20bb5 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -176,6 +176,10 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 
 		do {
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+			if (tmp & DW_IC_DATA_CMD_FIRST_DATA_BYTE)
+				i2c_slave_event(dev->slave,
+						I2C_SLAVE_WRITE_REQUESTED,
+						&val);
 			val = tmp;
 			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
 					&val);
-- 
2.40.1

