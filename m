Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 416BD6B3580
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 05:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjCJEUM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 23:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjCJETq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 23:19:46 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D251086B4;
        Thu,  9 Mar 2023 20:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678421710; x=1709957710;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=O4ozWwXkupKxtR2R0pQsJO602uWMCFoNmwajqSgQMR8=;
  b=fKELuMwtyNixv7P+Xd8Jq8lAzlz0dKrjUl5sxAtKqXr87ED6FThK9WFD
   yhyy9rPrUcOoXpmh1vKnotNjZYTS5yWnbgEa0B3wjmxYPoCd00Mw1M/No
   FNaOTb8ACEdIETa+6I0egVGsgg6eV0oa/y2DMMB3dpcVZ9LW/I8jJVq22
   6MGoni5svxy5w4b33rRkmrXsuK8JalGqA2NVcNDwWnj+HDXcsMQiOM01E
   +viwdCFNJt1+edZpfsLyYIOVcwZfCEpj3FZQzGokAAYWiDoX3HnojsnQX
   17V5VzsdD8cieBNedVha5F49d9PXhk+0r0JUziREMYbxUv3JdjQ6WZO9D
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="339003929"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="339003929"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 20:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="680073801"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="680073801"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 20:14:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 20:14:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 20:14:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 20:14:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLcDIj29cJJPnpdYvsx5ns1TpZZQsSqTN6533EcPrFqQz+/jId+nUhP5htZxq4dTfRAZPXpNzqTHL/nd9H9jfwpOVNnQ2e83doAg5S5HVu17OPVhBP4zKJqVwLPZDwlKkwVa+aMedOcH8wNXKNBZsZqvOxppxha5gXHBFv+yHYiVD4VhePA2OIGdV/h32zL/s/TIaxPUUpUBgtHc/YWvEMCIABwoaQRvZRdXL6xpRBGpeR7fBKsueZsDa5DHQ9PZGSssap6mHmSJI2Etop9njogg73kUeP643g0FcSRxWPPRTCRvv4MUAKtcQYemlD8+k0MBWMy4a8AeWeh7tkiA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4FcMQyOBjXw9pcvGNRlYst/W6XZ+IG13XlhU78kAWU=;
 b=gsPOiA+XW7SmKXwijWyGdE0TO4cwTEzT0busUP8hsmWuNGXLi/Ni3FzO2+188mPjn3ibP4C7WC7WQkwWjHu+M0kS0syhm5BFxJeoUenhPIZYca5MTurW0U4/CxWUU54WvegeGazBvRBhfBAfIg7QXYlRbXBJ/B0yKmXgaA4K6y6PGNamFotUcUSlBesDss2q2TioJQbi49ZPxhGKY3vikUqMkYYDJmWPVyHTvBfxI1G1rmTzm1WI012td/zstMeVvKOcGAhbmN6GTGKNWX6MBoyWMboKad+G4mWGIt7RNeWPGc9o9DwJLkh1Wa3z/qKWdUC8E57H+MnK8hkD3qbVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.31; Fri, 10 Mar
 2023 04:14:17 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 04:14:17 +0000
Date:   Fri, 10 Mar 2023 12:14:08 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Oliver Neukum <oneukum@suse.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        <linux-usb@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <srinivas.pandruvada@intel.com>,
        <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAqukC7XfSbIa9ov@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <097d1742-1aa8-fc0b-db11-3571ea49383d@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <097d1742-1aa8-fc0b-db11-3571ea49383d@suse.com>
X-ClientProxiedBy: SG2PR04CA0180.apcprd04.prod.outlook.com
 (2603:1096:4:14::18) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|PH7PR11MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e97ad1-ef48-4456-abaf-08db211de9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3l6pz03SG6VwmlNWBcrNgoQ4xOkEF39fzh0C1H2VvMTtJrfD6t+vYvfAWIi8ube+/ce7Vfj4KVLxq+loBRofJA31e5bSaAPPfk9vunwYZIhrlHZxdZ4DUuPMgucRy98eDbiiNhXCa5ZVPd7u12U0doT68OfAwVG2lGEDByMhTkIvyThVK12l//jHgcR1senTpax07yUMeOwm2QJtNJunlgGMVvWkhkv1/qLBpNHVokX77552f9xGTvW3GfNHMGJA6yzH5gnMcIerVqxinfFlXMJ7jhlcq0g7d4AMU8dv8xIB7EQypEDysNRKF1lSsQatEjkIruJ59glW25yf/Tu40FJ81cBJQT72d4FIlxJsgScPyVP3ptuRN6ccqDNd6RYcSAyFrofOtbS+KJzjwgPk1dia1MNfCNTFlgiGSHb6dB+NXViXbYmYnxFTvVO9vxtXSLxnSx2h/O6sv62gna7YZik/9Mwim0o7FGf5WpN5aDqB63oBfeLXL/sWGZ1Npd5skIZ6mojHADWfeCcx2zz0QhA5QgIZA0J7d58OOiNJR0m7i4UXBIB5t58sOnbcwXXWDMUMs47nSggtVkINojnH3PVY33nX7fr3PbhzdHFQfX7KlbnnSWdyF5HLDnDmcYAK8zydsxlwRUWY277P2Lks8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199018)(54906003)(316002)(6506007)(26005)(9686003)(38100700002)(86362001)(82960400001)(6512007)(53546011)(186003)(83380400001)(6666004)(33716001)(5660300002)(7416002)(478600001)(6486002)(41300700001)(8936002)(8676002)(4326008)(66556008)(2906002)(6916009)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qbA/izeqHk09h5Ii8eI3jETwDH0LVQEwhYwuDSUUXfkANGdDMNCBe4Wwsp7n?=
 =?us-ascii?Q?e61nh4xwB18WG+PxHjvd7l3Y/lzksSpqvgfc4teg/WK8ce8cGjqhbjLmODRW?=
 =?us-ascii?Q?xwgD7gYoKX3jEevH8EekfP7wqIlzK/LCLlzvTbeuAstZQl8BYkAD0lCBxr1c?=
 =?us-ascii?Q?5L/YXMNwW2GD5De5Unme+bBfkdUEc8NttRNOy8UBwp/hzWLI9GsoYy2OuF1a?=
 =?us-ascii?Q?VOYa8wwynofwC4FFJW0gQBQc+ni17M0fYJGHRjrB55Ydsxjwr8IcMoc0ASQi?=
 =?us-ascii?Q?3SX2ZJ1J6Z3w76Jvrgh0NF066Hxr8Gi+OWa+qxD6KMUPPtuRZvuSxahW3aNP?=
 =?us-ascii?Q?WfA1srrt2v/F1Ju5l+UHYsnNcGl6pYr2tdYrcaVNZfVO4VeLWk9UL81HzICI?=
 =?us-ascii?Q?Ol9+YLEWXtqdFLyPy+ahO9cGEyDhT3SxT+pM5bfRfFIux4CNxCyDVJuixeQK?=
 =?us-ascii?Q?bSlTcctVTxaSjJe/Nbd6773GOc0s4t1mFqLmkgn+DKV36dqbvym39dQ+tiNY?=
 =?us-ascii?Q?F2+iL4ae4xi0xQ5Vg4DWO2512EJMLALeGlW+R5FsT6d8MCklIThMh+5/QHDn?=
 =?us-ascii?Q?mneYMbtbNZQ5zZ6aseWVIu1zKgYK/JBFMEn0jNdWG1BS92BaubmibqEz/WbI?=
 =?us-ascii?Q?YyW1lUTiaYytFllBt13RxIjZ+Mq1ojRZWrzkVzrNselZ73+F8IdmXWrO+okV?=
 =?us-ascii?Q?DPooPkOEEEsMwSkv9jGHtbzt7IneVTZeHasEEjb1jmZaxRe9JbpsQRXCPbX7?=
 =?us-ascii?Q?OxSQaSFYYMzbN9dbao2QEAv6G1rpdZci9pcJEug1Mhw9kSgNISSi0QdyUx/O?=
 =?us-ascii?Q?fJUYsn818R0ViTwgP/MCX+pPposg1LzLvNo29ApaBLFqMMvWsNpCNcn33WcX?=
 =?us-ascii?Q?kOTHXjqo7M0eZTEv8Zt9MfYmGW4wvrVVxYl4++OAtKwO4kh29OwVocDqPw5E?=
 =?us-ascii?Q?d3Jo0Dxh3YWRNQ8CYhBFtBob9wLV+FNAcjj69jnLhlTyDEGUWf6JRUxt/210?=
 =?us-ascii?Q?4cb1MmbrGnN89QbnbLVH5a9fEKb5UN6HLPoZ8ScyFqCVuomyRvB3M1IhzZGo?=
 =?us-ascii?Q?A9xs4b4/JW1VxsEBp/Ml1Q16UVwhf/feTEH3UvIYzpZAnwKzxe+9oRY7bK5A?=
 =?us-ascii?Q?/0iWy9MX/IUAQ9wU3RqiXFdjaU4bMqgUmSnW8YRb0KRSFiTAnxMKrk91CvQ0?=
 =?us-ascii?Q?NdVM6x57m4SuPI9QsrneCPvqLLX9JcFVm6QJhrEMgaJTYabWbfxpCP3JCm1h?=
 =?us-ascii?Q?G2qqq0Bw/OBTF/k/qUqC4p/+JKu3qo3b4WZAF3qIsQc1WFYb3nAt3Dvk4RGK?=
 =?us-ascii?Q?+36PpoGTo3ZdIjAxs7mDe3ckvc868OC8Yvz5jte70ifEiBs+/MCcYwEMFDu8?=
 =?us-ascii?Q?pgnLVergEEclEatqR07y6bTgXvzisttkMu0TxuhJBF6hh1QOY9tIK9B/exgj?=
 =?us-ascii?Q?BN+qXd70g75R48aZFGqtJLiaKabD0avxFUjbmXZLfuBaNZyFU0g+0qIrbzsb?=
 =?us-ascii?Q?SfjijeDWWY+yms3AVcnvfE0ppKmgvppYwiM1UntmKMX4ykyv1pwnYdy0rDxJ?=
 =?us-ascii?Q?CM+/eYssO//Q13SNL9wKMePPzN4b3lFMXwtfq+PJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e97ad1-ef48-4456-abaf-08db211de9e3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 04:14:17.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ITnBcEBIedzf+4TUtiqfkLOPOxz9MMLIQXqGh9HRlTpmOPFZPdibR6VKgADXLYVyjsdcCGeTYTulybS4lx9aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Oliver,

Thanks for your review.
On Thu, Mar 09, 2023 at 01:53:28PM +0100, Oliver Neukum wrote:
> 
> 
> On 09.03.23 08:10, Ye Xiang wrote:
> 
> > +static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
> > +			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)
> 
> Why do you make ibuf_len a pointer?
Because ibuf_len is also used as output of this function here.
It stores the actual length of ibuf receive from LJCA device.
> 
> > +{
> > +	struct ljca_dev *dev = usb_get_intfdata(stub->intf);
> > +	u8 flags = LJCA_CMPL_FLAG;
> > +	struct ljca_msg *header;
> > +	unsigned int msg_len = sizeof(*header) + obuf_len;
> > +	int actual;
> > +	int ret;
> > +
> > +	if (msg_len > LJCA_MAX_PACKET_SIZE)
> > +		return -EINVAL;
> > +
> > +	if (wait_ack)
> > +		flags |= LJCA_ACK_FLAG;
> > +
> > +	header = kmalloc(msg_len, GFP_KERNEL);
> > +	if (!header)
> > +		return -ENOMEM;
> > +
> > +	header->type = stub->type;
> > +	header->cmd = cmd;
> > +	header->flags = flags;
> > +	header->len = obuf_len;
> > +
> > +	if (obuf)
> > +		memcpy(header->data, obuf, obuf_len);
> > +
> > +	dev_dbg(&dev->intf->dev, "send: type:%d cmd:%d flags:%d len:%d\n", header->type,
> > +		header->cmd, header->flags, header->len);
> > +
> > +	usb_autopm_get_interface(dev->intf);
> > +	if (!dev->started) {
> 
> Memory leak in error case. You must free header.
Good catch. Thanks. Will address it.
> 
> > +		ret = -ENODEV;
> > +		goto error_put;
> > +	}
> > +
> > +	mutex_lock(&dev->mutex);
> > +	stub->cur_cmd = cmd;
> > +	stub->ipacket.ibuf = ibuf;
> > +	stub->ipacket.ibuf_len = ibuf_len;
> > +	stub->acked = false;
> > +	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, dev->out_ep), header, msg_len,
> > +			   &actual, LJCA_USB_WRITE_TIMEOUT_MS);
> > +	kfree(header);
> > +	if (ret) {
> > +		dev_err(&dev->intf->dev, "bridge write failed ret:%d\n", ret);
> > +		goto error_unlock;
> > +	}
> > +
> > +	if (actual != msg_len) {
> > +		dev_err(&dev->intf->dev, "bridge write length mismatch (%d vs %d)\n", msg_len,
> > +			actual);
> > +		ret = -EINVAL;
> > +		goto error_unlock;
> > +	}
> > +
> > +	if (wait_ack) {
> > +		ret = wait_event_timeout(dev->ack_wq, stub->acked, msecs_to_jiffies(timeout));
> > +		if (!ret) {
> > +			dev_err(&dev->intf->dev, "acked wait timeout\n");
> > +			ret = -ETIMEDOUT;
> 
> If that triggers, you may have a pending URB.
> You must kill it.
which URB? I guess what you mean is dev->in_urb?
But the in_urb should always be up to waiting for message from firmware,
even through this timeout happen.

> 
> > +			goto error_unlock;
> > +		}
> > +	}
> > +
> > +	stub->ipacket.ibuf = NULL;
> > +	stub->ipacket.ibuf_len = NULL;
> > +	ret = 0;
> > +error_unlock:
> > +	mutex_unlock(&dev->mutex);
> > +error_put:
> > +	usb_autopm_put_interface(dev->intf);
> > +	return ret;
> > +}
> 
> 
> > +static int ljca_i2c_stub_init(struct ljca_dev *dev, struct ljca_i2c_descriptor *desc)
> > +{
> > +	struct ljca_i2c_info *i2c_info;
> > +	struct ljca_stub *stub;
> > +	int ret;
> > +	int i;
> > +
> > +	stub = ljca_stub_alloc(dev, LJCA_I2C_STUB, size_mul(desc->num, sizeof(*i2c_info)));
> > +	if (IS_ERR(stub))
> > +		return PTR_ERR(stub);
> > +
> > +	i2c_info = ljca_priv(stub);
> > +
> > +	for (i = 0; i < desc->num; i++) {
> > +		struct mfd_cell cell = {};
> > +
> > +		i2c_info[i].ljca = &stub->ljca;
> > +		i2c_info[i].id = desc->info[i].id;
> > +		i2c_info[i].capacity = desc->info[i].capacity;
> > +		i2c_info[i].intr_pin = desc->info[i].intr_pin;
> > +
> > +		cell.name = "ljca-i2c";
> > +		cell.platform_data = &i2c_info[i];
> > +		cell.pdata_size = sizeof(i2c_info[i]);
> > +
> > +		if (i < ARRAY_SIZE(ljca_acpi_match_i2cs))
> > +			cell.acpi_match = &ljca_acpi_match_i2cs[i];
> > +
> > +		ret = ljca_add_mfd_cell(dev, &cell);
> > +		if (ret)
> > +			return ret;
> 
> What happens to stub in the error case?
ljca_add_mfd_cell only failed when krealloc_array failing. When
ljca_add_mfd_cell fails, the related stub just be left alone here.

Maybe I should free the stub here when fails? what is your advice?
> 
> > +	}
> > +
> > +	return 0;
> > +}
> 
> 
> > +
> > +static void ljca_disconnect(struct usb_interface *intf)
> > +{
> > +	struct ljca_dev *dev = usb_get_intfdata(intf);
> > +
> > +	ljca_stop(dev);
> 
> What prevents restarting the device here?
Why need to restart the device here?
The ljca_disconnect function should be called when the LJCA device is
unplugged.
> 
> > +	mfd_remove_devices(&intf->dev);
> > +	ljca_stub_cleanup(dev);
> > +	ljca_delete(dev);
> > +}
> > +
> > +static int ljca_suspend(struct usb_interface *intf, pm_message_t message)
> > +{
> > +	struct ljca_dev *dev = usb_get_intfdata(intf);
> > +
> > +	ljca_stop(dev);
> > +	return 0;
> > +}
> > +
> > +static int ljca_resume(struct usb_interface *intf)
> > +{
> > +	struct ljca_dev *dev = usb_get_intfdata(intf);
> > +
> > +	return ljca_start(dev);
> 
> So here you report errors, but at the same time you set "started"
> even if errors occur.
Thanks, Got it. Will address it on next version.

--
Thanks
Ye Xiang
