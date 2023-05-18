Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF5E708777
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 20:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjERSGW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 14:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjERSGV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 14:06:21 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADFBC2;
        Thu, 18 May 2023 11:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684433180; x=1715969180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j4HYRIZkhCVB/C6FbyfAWDEJPSWPXxVWRbh0/RcejVQ=;
  b=BobGJ+bXVdj+zE+ijocXZ2a6zloPHDBEgOEpMuhTHxteMpZPk8fV1TL6
   OwHXXvtupwatHNzRhraKpGSBXHnrU/kIE/ihLqaJqD/JGLM4mZx32ZztG
   k6FbyQvlYeg5GtW1rL+iDoBT4bTB/ni12hFtkdMvQOb23+4zUSpta/s9h
   wcWApQUyYkszS2do3B5Tht0Kwm3h2+9YstJw6JxS6BWQiYm4aFhef+Xh8
   upMl/tFy+HoqNCWSBah4h2pDGV3/5D1uizDUKZZwSF9z4JPpWgsVKws3C
   Rw+GaTWTICPf/LJtylPhNewie8bidro4bJkBcZMzKH3BrKXrFt0A7jL+/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355367051"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; 
   d="scan'208";a="355367051"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 11:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876520683"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; 
   d="scan'208";a="876520683"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 18 May 2023 11:06:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:06:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 11:06:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 11:06:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 11:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbk0a8pMKPLwZla0svEM8t8c9h8GiudqYPsobIwWeEE3nZ0x9j8qE/XjaKLv8o5QkLjefxgp/9JPIF7DLKoWJBP8YIDfD0EsCW69QhYYeGWE4/93txFyMoDiSmXqN6EIQ2+yNOfOr27am/IRW7s+RhN4768OkBYFXfVX7A1GL92l2zX2visaxcOK8vAHeCHUHIM1S8iJWbjE5Kla7LgRRoOVXxy/5cqd3vyRaT2z61jnfRueB1hS7JW6uJzYs4Jo7d96k/bygc5VFHugRl4KXiy4MTfoV/eaQDAs8QPClgXu3mfuLkyWjv1zDgNw3oYqH+pH1WZ5Xo83wqUbJsflfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUlPJckLTPSTW5jGYZz8Lstes6MhFBrlbsvjD5iG0ho=;
 b=CR/IOhRHR69rCv8F9GhuUjdrI/A9a4THJUStOWC5Sk51hjsQdmAvqNC95uO5+iF0E0WI8DrPKiqXsY7P3Izk37ZX1WxG68hmQu0P4gbJzRlpIJuUpZmSZarMJF8nP0crB4UzFY/afuzi4nZ+Ywx3Asr951vxYDKnZ9GEXoV+Sm58y2JfA/rAiweZvQNn3AlRRHa6WBAGGkAjfxM92y0CR+Hd4uGB2ApXyQGhIvWB+XljwAhosJw/jDit4DEJtyIkzwipdL+ayhoYfmtJKFS55yeDBysdPMRzF8UZLmyQC+oOYKLKVCEFCLua4XV3zKDRixr0mJqkUp4oXGaY0JGaBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3004.namprd11.prod.outlook.com (2603:10b6:5:67::17) by
 SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 18:06:16 +0000
Received: from DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31]) by DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 18:06:16 +0000
Date:   Thu, 18 May 2023 11:06:11 -0700
From:   David Zheng <david.zheng@intel.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
Subject: [PATCH] i2c: designware: fix idx_write_cnt in read loop
Message-ID: <ZGZpEyITTuoBUEAM@davidzhe-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To DM6PR11MB3004.namprd11.prod.outlook.com
 (2603:10b6:5:67::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3004:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: b0182860-9d34-43a6-e5a5-08db57ca92ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Zii27UFcdO3XBmJh/6ZRGayIc5UFbVhhAFcbn+3cEO/RE82ngmwziAyFPcbltMCBEZ0j9JIa3K8RQdF0pxiqyDal307GgRGk2W+kzeXq/BTIqv59XtyNSgCZDmB+ZzCYOUP+6sha6UxQW4pfFt5EroB2/BxJU/MWhi8HuYr4LNhrNfkQF3hrbRJB6SoKdKe17CT+bYRuRMrXBcn6OXknxWl5Ofz2tOOSTUkLRwB/FicaGW9XnNpMZzIPlvakAjgPPIUUBQKT6vAsRqfp5iqEB+XTsZeT+TO5GCR7IOzIOXcU2AIIIrfKhxedENnErcECAUtPaQT9y9VCKXQIwVaxui0pJCRSFj0IiY9Lf44Um9BFBfMKELs6gAlNWYS0lYT07Them8jyeBnIm6oe05hDpUkw26X21EJkSYQ3X7iSKRM7qNmZreOEMkzyUaIPbjes7rr/CIRAC7x87jyPSeI0eOziGVEcSbtiWaP2dVl8bwqZOxz5Oh1j1739HyzGyUrvuMkBURXZIygrsT7zOJzNgSCYHyIY998llET0x8RkV0FOrbsB9P8RFle/vBNeal1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3004.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(33716001)(6666004)(4326008)(66476007)(478600001)(41300700001)(66556008)(66946007)(6486002)(316002)(86362001)(6506007)(83380400001)(6512007)(38100700002)(26005)(186003)(82960400001)(9686003)(8676002)(2906002)(44832011)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyTnRYBbjYRsJ/LIFdauzksXLI1EFFuTi8xgw+SS0eCnXOx4jyTJ6G5boiYu?=
 =?us-ascii?Q?sQuOv0KxmeFrpy1xmkdcoGsToAI+sbKCo+irD+Q7l2DkGLhnKgawyYg3xW0H?=
 =?us-ascii?Q?XD0KHmGiCiCThq1cSTiPmOwl2oZYOd4VSamPhBqwUTTbABVELPjxxSxsp8qd?=
 =?us-ascii?Q?8rdwfquxpAcXN3BohLP//i4O2n8LRUY4B29gY9H2nLWqqM0PyUW7JmNc1V/b?=
 =?us-ascii?Q?aaaSWweRaQ1n1KXhPJSxLrKqvQ27c1RtNUMQMxAwMXJ2gTK2CVdTWwVF5cmb?=
 =?us-ascii?Q?+EkYDoXxFJnZ6UR8W83pjLMGZOh2Jn+NWhjyry3F8sohdB2T8Q7DpijeLYZU?=
 =?us-ascii?Q?orOblJqemPpf+9nitqNSsyyGuWX4LFeOEqPzSzDT7tDe5UmogmK6akJe1Fz8?=
 =?us-ascii?Q?JJCQCUJaFcc33G/LMD2Xu+urNDD5HJyTEGrOaOJyEIxMElN+T2WZpfM2fVUW?=
 =?us-ascii?Q?LFUvjeHov+fvqHMyvVwJcUNV+/g/gJo+301bRYijCpPRyrhL+3NXtYB1doWV?=
 =?us-ascii?Q?JADKoRqFBWfQLBy8u++JwLICKFjxMevkHPS8tpL0z+Yhsh69+33g3IwESCOf?=
 =?us-ascii?Q?RvISLOcebsF9Wi4YkOfkWqGPoA8NkQ1lICldwMh5ewEpXKK1LNg1xnQODwC1?=
 =?us-ascii?Q?o2VDVmMVpo5/VLEJL0f08V78lTbmS6Y70lZ4jzGYHBbLgxk2Eu9BbbRk8HcR?=
 =?us-ascii?Q?CdqUahOoRlnyK0anBnitarzLDEE1gNEaO4LoQsCYq1GYc/p9BLiSJqz0UBpE?=
 =?us-ascii?Q?enHNb7SIopHGADAvbc69tPCBV7UkPmZy3jFHf6em3LekKkyD4J3PtFLkeRLO?=
 =?us-ascii?Q?euT7WMANNiuxtqffP1Lohzh3KOFKagjsw1UiLG28jcLOmzhrpiW/0tbH7E4d?=
 =?us-ascii?Q?FIJ53wDghZ9d0Jr63kyh2dq7kc+hY3fcAond/OliOnUtHqFFHVZVdErzFRmd?=
 =?us-ascii?Q?5E0LP7hd7lD6qY7zNcTYkU3BsxokDCrP6IEK40ix7aNrg0wordJBCNiw6qqL?=
 =?us-ascii?Q?W3+7U3FSwCCRdhqLjx2EeBAwK9j9BI9uN5QDqOUKJwdgt98zA1IP5JC30krW?=
 =?us-ascii?Q?pfWu5+MXyiFNNWuuZbpyHbCd3hJGfRHJC06jx6Lwz4nJ+msg/QF/h1ljHrW8?=
 =?us-ascii?Q?4JdxH3q44yNlMjPDpBxGZkfx3Dmgjd8F5AVNtiyY3HZusFAylH3AjQ7Q0Fpg?=
 =?us-ascii?Q?mxFrLgQKgpFjxhJIYQnOK8Y2ObDjSBZ5xfKsanGnlbu8xPpLpAAvdjGereSD?=
 =?us-ascii?Q?fDI7ybVbFgDFS8AGsozGJA5BdwPqWOTBuU7Z1B7pHRf2PBAEpYof171GstYP?=
 =?us-ascii?Q?ff0hP0f7dILgVfNwcR19KW4wRtF63inP9dR3VORg+sJ5Vmi2viyfHydLHz0+?=
 =?us-ascii?Q?RRobUipFyISLfJv201qzJUA5Lnefvne3834IT18lV8ML87k/reZs+2v1tFMq?=
 =?us-ascii?Q?ndbPf6bVOMFqsBTMOyQItv89PM5lUqEfAG5AFOH99z7G9JbYd+GaW3vzz9V6?=
 =?us-ascii?Q?4MVAYfVDAITp7FzrgsjbsdBtHhw5J5b1NNnG2pEH0m1ErfeYTsK770aXpW+m?=
 =?us-ascii?Q?qpt8XtW0Ir8gRgBnwwwtCXuR+d+BFOPTIqoaxOiu/zrqdOnIGg7tCAI/7e+F?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0182860-9d34-43a6-e5a5-08db57ca92ad
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 18:06:16.0677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVDl0MeYCm4DKbx3J+Rrid1x+K23e85IZRKx9NfZBDor9/QVCFvj9azAnWypAR9mgJmlV1XB13aTBx+18dDWFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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
 drivers/i2c/busses/i2c-designware-core.h  | 2 ++
 drivers/i2c/busses/i2c-designware-slave.c | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

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
index cec25054bb24..9549cbcf50aa 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -170,12 +170,14 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
 			dev->status |= STATUS_WRITE_IN_PROGRESS;
 			dev->status &= ~STATUS_READ_IN_PROGRESS;
-			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
-					&val);
 		}
 
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

