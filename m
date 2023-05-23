Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406B870E223
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 18:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237781AbjEWQqk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 12:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237792AbjEWQqj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 12:46:39 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA550CD;
        Tue, 23 May 2023 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684860398; x=1716396398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nRKAoxxL+l8O4ITSghDOfp03FzHWj7OQdRxWm1PYCw=;
  b=FvcGak36lObiFGAOuqMIxiWX05bd633HO5ke7qpGQ7LdPTqP8Dvg/qtr
   u8UGqdx2i0wSNR75M1P0jh8ApKeuQ9JJRocbjfboy9EYPFYLwQ6TT23dl
   vzbuRI62rjkV/4ZoKV+yySfoWYCdSqlawfsjjXmow2VbCWzddeRStz6fq
   jvkPnjxbyDucnv1wiSW9EW9YOhKCWv2+PtKpw6PBsTdO3Rsdc7KHs8Na4
   IgUB6rwV+DnKrWx4IP85yBsCMYrJ5NHh/Dab8MO+L2FgNnkrp9gY/Tpls
   qJwwYWO7Jr3rRhKF1PXY+G6b8/NfMc56L+Oy325Rd00luAadK7nH5y4P6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="332915870"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="332915870"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 09:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816208738"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="816208738"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 23 May 2023 09:46:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 09:46:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 09:46:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 09:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlQ8rRFo+3uf+oKEz4rQ2shmQqTIlzj4jjUh60SKMYucffDSnovZI47LShQ7e3d+988abmM+k3rvVcFixyjIE2RoQA4XbWtEBQzSNmiK1E9uvn9hQiJq11adSQZ57M2rZmvt50ONhP52ojQkOssNKOoKfKJ5FVviXEAsWk+WCmajlphYLhKbPe4Kv5jYd18Em6c5eTD1vgHPlq/ii/9RxwbhWdpc1fGnxNRwCZ9mOqktOUuY3UghANCSKZ2UBfzawCvPx/bNAgV08DHF8jZBXPUiegbClPCzwbI96vd6+Of1ntaLDLMaX7Eaqfk0HTuyJanlcEl7rog8MScqttqupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2IoPiSPcarpqnDqXgk+Ztnp27jINgrxxWJ0oqA+YUI=;
 b=Sug5vv+0EMvzNeRtQcomR2pwQPlnyEgLmi67GYCb4/15inrZ5R1C4X/h4ihevA5d+5sW4ML8r7tAdlHP9c0Nn9SkQtfvSHc5epHZz92DfTEE5o5Zmg+bPLG0qJ/fkzsNfTr1DYTSR6JCUjBUc6matB5NOSd6McVBXV6lg5S7yZgV07O9ZfZZv9M2xkHJ0C+bLrRgs3Vhi/EYDRjIzwJvUvXSBfYU4GDgUzn3EH4mL4bfZldLj7sBtXjD8Gvcz8fK5bEJJR/hrXyqgy1LjY8Z1MEF2msP+I49lk0wrGOeJT7DQor5538CMyDY7lf/DQmyAryUV85h1MEUgI1UJmcARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3004.namprd11.prod.outlook.com (2603:10b6:5:67::17) by
 MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Tue, 23 May 2023 16:46:26 +0000
Received: from DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31]) by DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 16:46:25 +0000
Date:   Tue, 23 May 2023 09:46:21 -0700
From:   David Zheng <david.zheng@intel.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
Subject: [PATCH v1] i2c: designware: fix idx_write_cnt in read loop
Message-ID: <ZGzt3dGW0dxa5fqc@davidzhe-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::39) To DM6PR11MB3004.namprd11.prod.outlook.com
 (2603:10b6:5:67::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3004:EE_|MW5PR11MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: e48f8c31-757e-42ce-f0f0-08db5bad3f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pT1z2ozgn6g01pRmiv0j/JnvOR8vwgTvgI4VDjfecVlauYT7ynhEvBdYEdT2qrwLarSi6ds27iR2oCxY5dVQ0u2Yy1y68or/yCQ8KHm7C7ukeVVo314UCOjdYQpDdu41LHKamyf0QnOGfTA+ve5itw6xyms+Qx/4RQ6j075VyH/feTahE8F34qeHqjAUM1w2wqzV4ajFkZRxfNFRsvRprDxqr6CnKO1adBFj3Z08mvvapm8CxXcj6/oQJa8HI/VlS/go9xWKzQipCbcel3k+NMCJZNnBoVDKWYAbZjqD8xY1ZJeAtqBvjpSBp1HB23Iw28un6qYhfnoKBtJtOKZhkCDNNAaG0px6bwg/WexCrTCwJ93iWgj44sV10bg25vpVnYXCaIgC+hku1kz1fO8I3NKBXVNIQvuNLjwfD2ZTZ3/0jIx7TolU0XhbIxtLFv2rJ5eSvHhBD0ZIGE3oJp60XXZsAFGwu1fNf7NYjqmpUq6TYMt7ieVa4IEWL5sLq1W5d3LP1el1YNT8rfPamA3eVeGtX0Ku/kr2Jkth2z63d+fvasl0NfCy2emyiXxwpE6JiFfg4yr047/EQK5hdth56Rl294EWeH1uQh0GtF5Kh2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3004.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(33716001)(38100700002)(8676002)(6506007)(44832011)(26005)(83380400001)(186003)(6512007)(5660300002)(9686003)(8936002)(316002)(4326008)(86362001)(41300700001)(6486002)(82960400001)(6666004)(66476007)(66556008)(66946007)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qBrZ/yCKt5len7hEjsjA16JgWUCukyqunhiEHFApRJt1Ueie97HFACICZ4td?=
 =?us-ascii?Q?CXgovCzG675WY1dCXbkdFAvQnbSmSFjQnkb8HERbnAYJCOsBopaB3MJgafuI?=
 =?us-ascii?Q?LzObFpixRpdkTtSg4Wi5znhfg37h6Aj+VGFlz2FcM5MHMGHXKY3mrvMScQuU?=
 =?us-ascii?Q?Vp/RMMefQk7OyefjIROIm2BvNfgqDtxuKucMWT1GThRn0q6pK9kP8fDv6cV1?=
 =?us-ascii?Q?Rdrf8P64heAg3f5JdI75WwnRWNmdwcEkn/VAy0z4+BCT7tu/3UmS33RIq9bh?=
 =?us-ascii?Q?XNUK74+AdGiwnzj4bIcfbm5nW0keLcUlhov03LYF+oCsg9Z31SFLJoEvY1fE?=
 =?us-ascii?Q?sRBK9m+SOFivIu2/BHocKgcVA3uSfWpFRNhDUEe9Jx+XBXy5YcTOYs4uzYGS?=
 =?us-ascii?Q?zskiylQiNo8vEuoerK3NJCRFGvgkL5khOCmByyHybyjaEqO9ZyycgMCFK8o3?=
 =?us-ascii?Q?L2eor46aunDx3rhYX1dV9vWchWYyYX1DvUrTdh4WKaoBCqmvg9sQml2Onaiz?=
 =?us-ascii?Q?N9ERlZA6cFU5/8SfUqhV/UAqbt6DGv95VNANZR/5iEN2tZTx0NRICEqBO0X8?=
 =?us-ascii?Q?SNRlePZh99VUHiTwE78JI6/jT4blKG7+S3PiixwaVAiTCjdcKWDpb3lCN88G?=
 =?us-ascii?Q?UEQaqs00yo6pip32x5FxT2rU/Y4i5efilF9QoJECZ2Jd6C61FIqisSlRuKTq?=
 =?us-ascii?Q?5V4aBjKfT9hFYgswqJez+2yAGCep+zuRkc1jDBO/6GAzEmZabhqv9FPnuInS?=
 =?us-ascii?Q?PUgbD7zsicQs5CAXM75ykLTs0eS9CgoEnB3hQtclut0HZ2OxxEMrV3w1gXA7?=
 =?us-ascii?Q?ao5OZhGXaJve00enlx7lld0ZoIfDCsgRghWRKQQQAwOHNegg/U1PiZbbKMvm?=
 =?us-ascii?Q?1bA87RnTv+kNOVjHNZRuiF4KdlsDrppATdBAAbJ544va9AyEQdgMOTTi2eLN?=
 =?us-ascii?Q?PLplNK5s2eIBYTlwanT2t3BHNqybOQ8rHZANrgyI1PPNUvBHrgeyGLzu7c8f?=
 =?us-ascii?Q?45R5ZKqK1b+493zGhezCEq/M+rokc9jC412vojXYfUkSCZI/n/wxyMjJjJUB?=
 =?us-ascii?Q?F1419wwybWtIsGkBYZBJvELDntSUcKjUZsv/+I4nNlpTGxqJXv1Kz/81KJY9?=
 =?us-ascii?Q?5AZAe/0KaxuztFtj+Ko4QYF6qDs+zzQ80ndOfVwXLYr5KcOqMrAVdqGZo9fe?=
 =?us-ascii?Q?urWoHJRLGpTjIbgm+hG06/UkXX/e36IWRlUbae5967Zna8W4pHV/RhntcEyr?=
 =?us-ascii?Q?n7fdO1vwExIA0OiK0igEx8fi9Z6vgCISVIaQZ2Am9+fzEuqxmW3CCP0SsEYP?=
 =?us-ascii?Q?rOeD/gMtMYEZI+zilWtsxDxDONDIW7zbFtGqwebf46zE7PylYf9HZwqaG4Zj?=
 =?us-ascii?Q?LzjlzVFq3qzCPN5I9Z3SNk1LYdyy0MNJYy2JMU9iNjfYm6zvCm7bRjB80JMn?=
 =?us-ascii?Q?xGRdRl07y9OE7cnmaCcSOR7I16Xabsk17pA30DBjdhptUZlEG/sTHXOMBU4l?=
 =?us-ascii?Q?R7VKyw1AbPQST93cHk6jEXgB5deMgMNZaBvYPH4l87O9yqGrVoeS6t/1BdM4?=
 =?us-ascii?Q?VWabLv9pv05DIubaCZBbeasrgB/hF84a7xCNEXpfmRx7H79pGkJixT5YbicS?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e48f8c31-757e-42ce-f0f0-08db5bad3f4b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 16:46:25.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASlgDaQJWk4pCWp3uBqFIotzUq9TncneawKB3l3djm8qA2azgLx7UhYhtcewuxywVQQ2bSjXt9QAYxXVTL9EVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/i2c/busses/i2c-designware-core.h  | 2 ++
 drivers/i2c/busses/i2c-designware-slave.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index c5d87aae39c6..8b85147bd518 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -123,6 +123,8 @@
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH	(BIT(2) | BIT(3))
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
 
+#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
+
 /*
  * Sofware status flags
  */
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

