Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36886A531E
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 07:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjB1Glf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 01:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjB1Gle (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 01:41:34 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C5C22002;
        Mon, 27 Feb 2023 22:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677566493; x=1709102493;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=b08UPA4IuvrNn3I+Yve3A/yRmijSbKGhLROsw0d/Kas=;
  b=lNMxN6YaoEczAMOwK+H96wLIOI6PfR3nKmWxaUNRmOoiVfzcH1cqefdZ
   +8asr0Nn+jIzRhRiiKtGN3sybuTx5wqzFVJVnYV5KXL5P4kKYC/rLmCeu
   6ccJBQIoSF1/8LztZdAz8Ex+lcYCgTKvFNtNq/2nbtDLK2AtUFdHXpiWq
   QN3FyED1oWa7ezXLfyIOZ0c5Zmr3Io5kVt6yFi3qrdK9sKT5uYNC+VQtv
   eehyrWxLmE2M2K0ABNByeyT6rJw3JWi2cu87VRdr6MuTxAkveg5JEOprR
   nUaSnm9h/kOd0VhN3+flDjq8BVy1cQBeiUlulZNQ+2INDKfekNMmJdSQT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313736783"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="313736783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 22:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="667334031"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="667334031"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 27 Feb 2023 22:41:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 22:41:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Feb 2023 22:41:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 22:41:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kobyMpRvnxPWm2s/5dLKEQxaRCG15tN0yhqaiDNTCHcjWBFn0fJoy25RxtrzbHRoarShGeqfiv6UwZjol/50ASLtI22Ox4qJF+n8iTK1OCG41qfYZMqNSull3HrZcMiAa5ptHRusMk8kptmYo5FsiiHmCtx4G/NOae3bANL3bNO675DL06fdCezs+OsXbdha9F1Xuw76tqobjQQEQjYhy/x3Vg4K9s1CiDGTX0mJvugAv0ew3X5KhIh2iV8l03r1Ri7ON7zQyt76GCuyO+kC9/lzI4iJnpksznGNK+jaKT9sw3N1pLfc8ofJwVTPg6mUFYLjHn28einAgYIz4BKxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5PUkn4BRnqovqHNHP/5+Tv1+YmrR9L2mhyzsqMLMQE=;
 b=QjYKg9rjBLbQ2+9g+nJ1zMUXwYWoFQgJy9g6gi6KOEdGfON4IuiOdtwAamfrQNkhIYR/enP4TqX5d8pUuUu6KEHbPaJKksewloeMPVMIcqPMFhmEDNFddo+jP25MRpe+8ch62HSUHy8X4kYepq06sdooi/yErD6mKQQySIEmeWb5/nL4WIu03pMEQU8tVg6NoePs/2bNYlrggyrWIM3/C3dx2CWplHzzhSVl0HjKFGTQJWOkTAp5SA/w6JdHYuxQaXE4J9E2lqKFu4/YH9BtUil50encQ9kqESC7uZFmkyiq36sQiOFYJriJmdj1b0FnLg2ewseyXSrSf2vmMeK6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.27; Tue, 28 Feb 2023 06:41:24 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6134.029; Tue, 28 Feb 2023
 06:41:23 +0000
Date:   Tue, 28 Feb 2023 14:41:14 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Wu, Wentong" <Wentong.Wu@intel.com>,
        "Zhang, Lixu" <Lixu.Zhang@intel.com>
Subject: Re: [PATCH v2 4/5] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <Y/2iCn6M/+HWsjZD@ye-NUC7i7DNHE>
References: <20230225140118.2037220-1-xiang.ye@intel.com>
 <20230225140118.2037220-5-xiang.ye@intel.com>
 <Y/zm/Uk/d6VRxLBx@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y/zm/Uk/d6VRxLBx@sirena.org.uk>
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5b8b0c-0018-4e38-3ff9-08db1956cf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+0KcC62JhnaOM22BoNuaeraOasUwskbQFz2GQ4TmZso8E/VSwJPGFLvZ/himMugcVFfr7W89iOahDboP1vt7IxKX8hehQmDVMlbWCaMZsF3SKvtQGqW1NhIgeha+mCODKMDYwBCWN3AGXDGmU3Ci6azlWbQOalqqgfGD2WUqqtpnMfTB5q5VblMMORA9Fkvm3Ik+F3mERHMHPNuaQDGbyqL0i7RDd1Zu4J5xvkTFntWgDyBdWKlEI/NnVP9AE4in/IfQmo9rkXx3R10pirINi8aIQQAV4dpd/csDvDD4Nsl00W1LNQqzbQl8NYqBYZXZlpokp4fN25Zefa8Ne2g3LoF9MEayFDHcqQMEHCwfyhEOF4C8MYI4hRx0iKpQLdq4IRo6lqj4XoovV4xNFDmM1wpKjeaFfo3aZEUr8AhoaGwzb/3QNTYYE0G80zgnJSM8v0IwViD963Qo66qKASQG3vr6g1XavD44R9nZ3XF4ojvE4HGEsDa9U25AaQdKNP+fkCrKpCRe8AgmA7jmSoO/XVR+01eiiYyT5akRmw5auxx27WktCFnwZ4XKrAXgfIPKbeZKgF+vTFAb2BfdtU8M4TFIJ0+Tj5DtBBfwZYV3GeyvGLL5l245Y8Z/+aXFGZTDO3BIUgvxzVL9RFLtlwudw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199018)(54906003)(478600001)(86362001)(9686003)(33716001)(316002)(4326008)(26005)(186003)(6486002)(6666004)(6506007)(38100700002)(8676002)(66556008)(8936002)(5660300002)(41300700001)(2906002)(66476007)(7416002)(6916009)(6512007)(82960400001)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvKnwpm2U1Gn/k6YtkR0Le+w9+AWF1IyzO2rAy+/ZhDfKilNLLdbK9oILgWp?=
 =?us-ascii?Q?utCVJpEWA7Jp4JFHTxIIuDJ6UMqGdAwrhw4gZY0isvioHGJPSR57nC0V0WPM?=
 =?us-ascii?Q?JeKbaUCzCk7/3zef9v9bd1qQHHjtFrvVbBPH84bo9EvC0wEnLQHwEG0MIVYQ?=
 =?us-ascii?Q?AXSoSWaLv2JJCQgUFG2VbPZqX4Y3OhtTJGF+WHte9ay8gIr/QGN/unJGFQch?=
 =?us-ascii?Q?rWONQiu+XqnAikvB3QedNj0oSxIzW1TaXxd82fCn3TGFgch+CkSP/War7F4u?=
 =?us-ascii?Q?de27Meg2mqPOUll9qSREa7dmOOVRKsUdaVQdD2kFsdWak5tKMJtoGU8WTcwN?=
 =?us-ascii?Q?xM3kZoEfpsaPbe7fDkN9JZtMhmFr8XFX8wSKzJFxKPFRmdnbLjW6BrE7UfFP?=
 =?us-ascii?Q?9m6mhqOZOuurYRCmEoz4kfC6QNnT4KQz+JFeQuGo8fceazaYVe54qd4O0Lls?=
 =?us-ascii?Q?PXAdg/vx9NwDQirTWs5hh8rllZsk6lpeJUNRjh9MC3TYPvJrhFSQd+qch7ub?=
 =?us-ascii?Q?eOjC19vVGk+HuBBIH/NMUr23aiFXPPtYwF47gieOVE4wv4xKR5zyxZ2ZQzB6?=
 =?us-ascii?Q?78wVktlthzhRIzDcSbp+ijRD9MDPxmEIzFM4IV26ms016BmJC/OkRSdo55eb?=
 =?us-ascii?Q?6+N23BqM9tAG/89702i2W8puhMwopWi+tZOvervLjiiINEb9LICAf1nWqOxU?=
 =?us-ascii?Q?xPoxcVdlWtaqzt7lb+7ZAjwrDqH7XD91py6pxKCG+/Sc3sPv2WCK7Q9US8KZ?=
 =?us-ascii?Q?gEM6dhMMmfeUqyzbPQBgoUREDx1cWqWszC7Pq0UmR08614HJOhjNEgQgXsMl?=
 =?us-ascii?Q?3e0vwb2e36MVQgseqt6Gp/wUh8KBOrF6RGUUPtNcJOoStdxvj2mtgMoZr+Eb?=
 =?us-ascii?Q?QH3t59/fSngcU+mctvjYMVgL775aQHNxfvKT88ZkrQ3WfLrppOhHrbg8koP0?=
 =?us-ascii?Q?ds/lp0UqFI9v0nkW4OKj0o6PQs9Hr7dBXiQ6EdZ9HmXUk0V0zY7zwXdjoBtD?=
 =?us-ascii?Q?daPhtkrHnzaxWX7M6TEhPNA+aBSABrFfHDS53bd42kwuE2jOld6YCNvdacCX?=
 =?us-ascii?Q?LA80wAKGxjXHnms8FcjGEgI/HaIMnGhwqcZcoeiiH73ZRRVtv7GJbNeCu4z6?=
 =?us-ascii?Q?eIvIiAKQ5FVoihuXQmYIWGBcPulO3qA5iyhU1yzuNMFLez8v6XbQ7s6xqbzF?=
 =?us-ascii?Q?cZVNtd/WArV+di8nff+iKnn2oBVNGmryxnGm9Cqu6f4pyFoqrIPFxhfoLlgx?=
 =?us-ascii?Q?3NqbwlVQBvHP80NnPWXAk16J6CnqHXJAgqzdkDckmGBZq5arS6hOsy/tWkwI?=
 =?us-ascii?Q?WcWPgCpDBJ4TXVpDSoQBuPgJSwA1IyKhPBXkJC/aCqrH7KI4HygR8lFD4IeU?=
 =?us-ascii?Q?g5kApssRssQbZqu1+YjH4TZ+1mfuI8BCd6ui/Z/jdChNOpdg5Vlcg81r0Qnv?=
 =?us-ascii?Q?tw9KXzMzCSR6/UMFLNqksq/rTlTZokl8x28yMWkhnIq+ok11n0YMSmSHdBY0?=
 =?us-ascii?Q?i6vC3eJQpVJzI0Os74u72an6wPEFxCln6wU0buHcVRf4f4gzQkU+XAY70+Yl?=
 =?us-ascii?Q?tBEGGiSm72FxG7zV0LbTqlFzhK7agcRPvkAoxpjB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5b8b0c-0018-4e38-3ff9-08db1956cf05
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 06:41:23.6197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbEje9jIdKpQuk6KAXc1tcTVTapvJUTRMUAquYuHB5WXaes5dA2ohoc+nkrkmrcatqlib/L48Wx4++Sp+Ke84g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark,

Thanks for the review.
On Tue, Feb 28, 2023 at 01:23:09AM +0800, Mark Brown wrote:
> On Sat, Feb 25, 2023 at 10:01:17PM +0800, Ye Xiang wrote:
> 
> > +struct spi_xfer_packet {
> > +	u8 indicator;
> > +	s8 len;
> > +	u8 data[];
> > +} __packed;
> 
> > +static int ljca_spi_read_write(struct ljca_spi_dev *ljca_spi, const u8 *w_data, u8 *r_data, int len,
> > +			       int id, int complete, int cmd)
> > +{
> > +	struct spi_xfer_packet *w_packet = (struct spi_xfer_packet *)ljca_spi->obuf;
> > +	struct spi_xfer_packet *r_packet = (struct spi_xfer_packet *)ljca_spi->ibuf;
> > +	unsigned int ibuf_len = LJCA_SPI_BUF_SIZE;
> > +	int ret;
> > +
> > +	w_packet->indicator = FIELD_PREP(LJCA_SPI_XFER_INDICATOR_ID, id) |
> > +			      FIELD_PREP(LJCA_SPI_XFER_INDICATOR_CMPL, complete) |
> > +			      FIELD_PREP(LJCA_SPI_XFER_INDICATOR_INDEX,
> > +					 ljca_spi->spi_info->id);
> > +
> > +	if (cmd == LJCA_SPI_READ) {
> > +		w_packet->len = sizeof(u16);
> > +		*(u16 *)&w_packet->data[0] = len;
> 
> Are there no endianness considerations here?
Yes, it should be little endian. Will address this.
> 
> > +static int ljca_spi_transfer(struct ljca_spi_dev *ljca_spi, const u8 *tx_data,
> > +			     u8 *rx_data, u16 len)
> > +{
> 
> This function has one caller with barely anything in it - perhaps just
> inline it?
Agree. Will make this function inline.

--
Thanks
Ye Xiang

