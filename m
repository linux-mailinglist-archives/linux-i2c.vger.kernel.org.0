Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1AD170D383
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 08:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbjEWGBw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 02:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbjEWGBt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 02:01:49 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8CC10C;
        Mon, 22 May 2023 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684821707; x=1716357707;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=O7l6nJy89dKsFjQzbXBLt94JHioQXIiYO9qIptdjoiM=;
  b=jxMPjjk6myanjP1n/EEm+8nX/yf5D5Q4hKKJNfuKboQWEKuECgk4JnD/
   2e7ADOvcp9AvvrcYPxRrs3IeLidHx2ViJ2tjy7Lsougu56MyuINfrlMk9
   GuAb9fNMVGSO5bCAbBW70iN5NGTkfpGlCu6M7j+iWxPtlpIH4NHXQUOJn
   2wD5CxQO3C7py2foQaf9oQnj7Hyt83hMRpYiqvaxq3Ds1xrnYkvWbeJBR
   Igmlhvo58j47/JmHJu8fatAeI4k3VxIgP0df3BnyokPNtnlld/VL0w3bw
   FZye7H+H6FT3yWbDaw7bxqgOGKPvet4m64QGblUiUu5Zt9dWt8YcaXzpl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337729165"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="337729165"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 23:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="768852422"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="768852422"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 22 May 2023 23:01:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 23:01:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 23:01:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 23:01:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 23:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJVBTrvPfEmzB5az3Ax1OfuHOxbNbpcYSlajkSZZzaNw6ed4CGNVXin8uBL8MNfY19BGH4OXfdx0lpL/TFScvJtngIexwKD0t7RhBqgZshYBzKShZB47LMUmGMl4ExQGa0ugVbLE2n2bYsmB168nR56XuVwNA/MUX5XKfQtAe8szG1oHBTRS4un1MJquNN6Ma33ZwNe7WNgVy6hJnu7oFQVzQO3bbgSsXfmbQT4ink8ewXJ2yjEP+wS6bweSsU005dMUXiI1jTQl1sRAqFVrtiCTeFETLgbIsiaPOVKhBPvvfyW1hsndUsP6PctHFCgjDrFMdjTtnrzchl8shdOBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK9KrNet92TEU0WcJt0vP/wDFGFK1vK6114yij4aiTc=;
 b=KxS7U+NWzItMjG+tdiSi70VofxHXE8cbrA7RVLo6z2GQp3r1Oyt43YcOZPSk38IJ4lKYG9SGV6XUhpuWxScW9ZNbRJt3zSB37+D0r1RflNDWrd+uK8ajsy4Lu79Zmi3HFvIxwKRKJpm+bRWP6SsDDzMOIOh1wAHuKHhZXf5uJ7nJc2L7UoFojYD788IBWh1iYh5Hjt1/Z4/NpYGj11IaG/vWhavN8shlyQeeHGXl89a0CpdoCdKbPF1+xw22ZVAfuKfuvELMwUCLTFpfeVnc9imOJim9rcMA7VeP5C975AUkO+PaH4O2yxlQUdkMb5fTzvab0Y6uloj63K+BzwHXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3004.namprd11.prod.outlook.com (2603:10b6:5:67::17) by
 MW4PR11MB6787.namprd11.prod.outlook.com (2603:10b6:303:209::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Tue, 23 May 2023 06:01:38 +0000
Received: from DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31]) by DM6PR11MB3004.namprd11.prod.outlook.com
 ([fe80::fa75:e407:ae4e:6f31%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 06:01:37 +0000
Date:   Mon, 22 May 2023 23:01:32 -0700
From:   David Zheng <david.zheng@intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
Subject: Re: [PATCH] i2c: designware: fix idx_write_cnt in read loop
Message-ID: <ZGxWvEaKm4isRiZg@davidzhe-DESK>
References: <ZGZpEyITTuoBUEAM@davidzhe-DESK>
 <a4d3252d-158d-a7b3-2988-22df39dba24f@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a4d3252d-158d-a7b3-2988-22df39dba24f@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:a03:60::18) To DM6PR11MB3004.namprd11.prod.outlook.com
 (2603:10b6:5:67::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3004:EE_|MW4PR11MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 358b6f3d-a141-41dc-3939-08db5b532b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +LNouRagfUu1YGMA/BE3Q/fmPS4aKSBQ7pzfqqKqL29+65DZOuUg9NoT62kGzAwLzX0Cf2iIFfzOW2TQPSLcgOgDe22E0VuHHsdV1Ead6nKiVYiN7/2wghChLpir3igL/GQDR8F2bqWMJihK0+xybhD/njcJr7JnUYuTEl+dOax6sSogx3yXY9TZjcUekN13AD0Dzi/4kvkEQrd3uYXvQjb5V3BfQwnhTqBhcy9H1mplc1BtSZthHmTUQZxo+eGGQoyK9oZjm5yqOpoV7Pc5ewCSW3Zh5akUlF57yf+K9oEq3rlAOZUA1439P5zKrX1dbibcN2NZbkp1oeEHDcaje+oJ+qXLNvX1TT0DyaO4PfA2l9BiN3J/DA+KDssZXo/qi68dozZPbsVqMw8MMNqzJ+mQ3uUhq3q4tB8cY0Ado4X7YiSeQMsFYh5oGdN2uDKEe5DJbyt8LSHcr3s0IIjaGKugUrE+RDO6OP5whx6JNCdslaO7I98HzOg0KY+im0ze4ya1rZiQD9JOb8d57a68iKhAtlmzhNP3oiak9Uh+wV0JgPjy27/+d02vxpCwAll9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3004.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(8676002)(8936002)(44832011)(5660300002)(83380400001)(9686003)(186003)(6512007)(6506007)(33716001)(26005)(86362001)(53546011)(82960400001)(38100700002)(66946007)(6666004)(41300700001)(478600001)(66476007)(4326008)(6486002)(66556008)(316002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v7TVgjfhg6B+J0pmStLbPNc+Q9bvxM5cgVBdjN3XFoFt2mF1gXvuCmn5mEzT?=
 =?us-ascii?Q?XuMzdEvizfaIZev0rx9I9GGeHMrxDAId7NPYTBAKeiZqwXT3CS2Y49XA94az?=
 =?us-ascii?Q?pyUj085E2dAOfuduuE91MQaJE3tQdw2rD9nRAODw770N3cfvPdBB/nrOfmOU?=
 =?us-ascii?Q?PdstgqSkobp3iw/ZVGf4IIRCNsYoLY8m+Z1uq005wnGYZG8LA1mxbHtb1LCM?=
 =?us-ascii?Q?LQd0jVWsOGwFSC/wDLuDSMs0WKPbgObtBRfvOoBfQx8B1t+M7Cm3VRVpcudm?=
 =?us-ascii?Q?DsGZfahJThK6P41tC4P+OGw8k5iBKh+Ue/f2VzUcln+6zIJoO+rah6Ouq2Og?=
 =?us-ascii?Q?xb6u2wbvO3IvQscigf5m8Cgknvk3XbcifBwJBUSmzES7d0SLRm1xFWU9hGfG?=
 =?us-ascii?Q?pCOQQskbpb8dl4cBmi0R1/y0Oz0xBnJeRPPhr5ciG/Y28u3/e2TGAn1MPIQO?=
 =?us-ascii?Q?OAJXEKULHznO8OvOz1RE1W1dq4tLz9TKmnXVVAlaeqILHatzbL1vr79W0PMj?=
 =?us-ascii?Q?T6gdeAxS8WS2+HumvEigSvRhpHuH4CIJu87Akc2PoNuhwh3AbzyrOKheka1A?=
 =?us-ascii?Q?RlBY0lNkAgZzDhdU2X8VYmW+72bphkAYMgnmX4gpob1hQHVZt1K5zbRwNAkU?=
 =?us-ascii?Q?2kpvyztAq1hNZOESrCJqlw5olRqrN1v5fWZTM9tB5W9fVWZhMStsp18KT3Fw?=
 =?us-ascii?Q?lBYXx/SAaup5B+jqDtGEpWczsRGbSUrlIE1acmV1iULb2HADyz1J7YlzYqYw?=
 =?us-ascii?Q?Lkb1Lk/uyPVCf3dk7IdVYrXCEkgFp0Ort58pKONLevrSKPY8RLetZkd83kZT?=
 =?us-ascii?Q?L6TfAKMeeXmBpfqHCSDqDKisY30O8IW1EAcGdnGk0h2tHI1V7ms8KhdeUXKn?=
 =?us-ascii?Q?BU8G+k+M7lYx/mibnm9I/0k+3DYUW3YYDL8sZQDnS3AJrL8VoF2HcdbrBjpO?=
 =?us-ascii?Q?1rGcCx6FicYcAo2Pv3lM103ZNPjzild9dI+9gBaz3BbYhD+SASeZQvzUYhP6?=
 =?us-ascii?Q?0Y8o7EFu4m5QgMmoMvml/3v1h3ubFGBHILjP/4kT/A0Ajv07oSww5xcMrPm3?=
 =?us-ascii?Q?fGj3P62Afa51SzFByF5AvT1oDS2KEJAnVSBQicEC3QIA/wLZTsA0kkavKm8c?=
 =?us-ascii?Q?LuTKkkChxrBfVnqUAeCKXaMGnM81C+ZjCnp+DBK3M6JrcxmHZlgc6YznDx7q?=
 =?us-ascii?Q?quCATiFgsmyPXvDKRYQWfMa5CyzH/fOmc3qyBkzuf08rJkw3VegLtyPu4hSE?=
 =?us-ascii?Q?fiehV+QdmcI8xabgBabb+ZP3pxX5EWTk2sKyDbxFER7a4HuDV7ug7Vb8zZSP?=
 =?us-ascii?Q?oFXSZvFuqh6L8f3nkhDZJpJVpji+RBUu9h0xFqJL7qT6LAMr7yJ5c6VfUIGi?=
 =?us-ascii?Q?nDGYqlXQYAPh1GZMnMgwYD/A8hUyNgFmVT0zmdvuMM/pjuZ3oTABCK+z10Tp?=
 =?us-ascii?Q?UTeWXIRkwVxdBR6Woy5DYKA44kgokJvvM0FUccuxi7uaPldfCMSoJA+D+xg9?=
 =?us-ascii?Q?xEKnpilS7CsgZhyLqJdHqADwxD0mSr8W0qiw/+7wosX135mT2QQ5nRTqSBX5?=
 =?us-ascii?Q?0A2FsWGSK0Oeq9M/P7S25snUOglJniDLxp33ZvUeoE/IxiEAf5g3DItnTw6g?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358b6f3d-a141-41dc-3939-08db5b532b31
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:01:37.0327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzPF3zy7KcO2IH69tQ7cPQzQYvzHSKH+htiA5UcwqkQaunwFPbOETajI8X5flcxCWgrSI2cMn5dwTPtFEv3gTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Mon, May 22, 2023 at 05:58:26PM +0300, Jarkko Nikula wrote:
> Hi
> 
> On 5/18/23 21:06, David Zheng wrote:
> > With IC_INTR_RX_FULL slave interrupt handler reads data in a loop until
> > RX FIFO is empty. When testing with the slave-eeprom, each transaction
> > has 2 bytes for address/index and 1 byte for value, the address byte
> > can be written as data byte due to dropping STOP condition.
> > 
> > In the test below, the master continuously writes to the slave, first 2
> > bytes are index, 3rd byte is value and follow by a STOP condition.
> > 
> >   i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D1-D1]
> >   i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D2-D2]
> >   i2c_write: i2c-3 #0 a=04b f=0000 l=3 [00-D3-D3]
> > 
> > Upon receiving STOP condition slave eeprom would reset `idx_write_cnt` so
> > next 2 bytes can be treated as buffer index for upcoming transaction.
> > Supposedly the slave eeprom buffer would be written as
> > 
> >   EEPROM[0x00D1] = 0xD1
> >   EEPROM[0x00D2] = 0xD2
> >   EEPROM[0x00D3] = 0xD3
> > 
> > When CPU load is high the slave irq handler may not read fast enough,
> > the interrupt status can be seen as 0x204 with both DW_IC_INTR_STOP_DET
> > (0x200) and DW_IC_INTR_RX_FULL (0x4) bits. The slave device may see
> > the transactions below.
> > 
> >   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> >   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> >   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> >   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1794 : INTR_STAT=0x204
> >   0x1 STATUS SLAVE_ACTIVITY=0x0 : RAW_INTR_STAT=0x1790 : INTR_STAT=0x200
> >   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> >   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> >   0x1 STATUS SLAVE_ACTIVITY=0x1 : RAW_INTR_STAT=0x1594 : INTR_STAT=0x4
> > 
> > After `D1` is received, read loop continues to read `00` which is the
> > first bype of next index. Since STOP condition is ignored by the loop,
> > eeprom buffer index increased to `D2` and `00` is written as value.
> > 
> > So the slave eeprom buffer becomes
> > 
> >   EEPROM[0x00D1] = 0xD1
> >   EEPROM[0x00D2] = 0x00
> >   EEPROM[0x00D3] = 0xD3
> > 
> > The fix is to use `FIRST_DATA_BYTE` (bit 11) in `IC_DATA_CMD` to split
> > the transactions. The first index byte in this case would have bit 11
> > set. Check this indication to inject I2C_SLAVE_WRITE_REQUESTED event
> > which will reset `idx_write_cnt` in slave eeprom.
> > 
> > Signed-off-by: David Zheng <david.zheng@intel.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-core.h  | 2 ++
> >   drivers/i2c/busses/i2c-designware-slave.c | 6 ++++--
> >   2 files changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> > index c5d87aae39c6..8b85147bd518 100644
> > --- a/drivers/i2c/busses/i2c-designware-core.h
> > +++ b/drivers/i2c/busses/i2c-designware-core.h
> > @@ -123,6 +123,8 @@
> >   #define DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH	(BIT(2) | BIT(3))
> >   #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
> > +#define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
> > +
> >   /*
> >    * Sofware status flags
> >    */
> > diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> > index cec25054bb24..9549cbcf50aa 100644
> > --- a/drivers/i2c/busses/i2c-designware-slave.c
> > +++ b/drivers/i2c/busses/i2c-designware-slave.c
> > @@ -170,12 +170,14 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
> >   		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
> >   			dev->status |= STATUS_WRITE_IN_PROGRESS;
> >   			dev->status &= ~STATUS_READ_IN_PROGRESS;
> > -			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
> > -					&val);
> >   		}
> >   		do {
> >   			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
> > +			if (tmp & DW_IC_DATA_CMD_FIRST_DATA_BYTE)
> > +				i2c_slave_event(dev->slave,
> > +						I2C_SLAVE_WRITE_REQUESTED,
> > +						&val);
> >   			val = tmp;
> >   			i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
> >   					&val);
> I fear this might cause regression on some use case on HW that doesn't have
> the FIRST_DATA_BYTE bit in IC_DATA_CMD. That is available on newer Synopsys
> I2C IPs only. For example my test HW doesn't have it.
> 
> This means the I2C_SLAVE_WRITE_REQUESTED is never delivered on these HWs
> that don't implement the FIRST_DATA_BYTE.
> 
> My quick tests using i2c-slave-eeprom didn't show regression but I'm sure
> there is a case that will regress because of that.

I2C_SLAVE_WRITE_REQUESTED can be sent in the if block. Restoring the
removed lines should cover the use case for HW does not have FIRST_DATA_BYTE.

There is no harm to send it again in read loop for FIRST_DATA_BYTE.
Will resubmit the patch with the change.

Thanks
David
