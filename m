Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7464C6B8B8E
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 07:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjCNGy2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 02:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjCNGy1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 02:54:27 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31DC76B0;
        Mon, 13 Mar 2023 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678776865; x=1710312865;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1GURu0C0md4UWdBFzImyQTTEHogOy+2PkP9tDLvZrgU=;
  b=gDRM4AiN9hxUBMqneXo+Wl9WOYjY9Gbdrtp38wlcZO2pEPMkFkKPpp+e
   J7pU/R4ocrbzYnRYFNLYTjgQ9aP5Fc4GCXFcEL0kPg+AF2SimVkutbh0m
   dKW8YSYGj1r+ecHm80XCF/svYkMYoLRKzN/1pewShFlG7B0ITEG2UW1+W
   CszCiCpV38yS1mq1h4woGE9SMGqvf5CZSatR+IjoaIlfWX6DleswZa7ZM
   LIdVDLXkjRetJ6BbUEtn2mIizs8L9gNiGGSy7y/4TTxJBzvZ3s/w9D8RP
   eEp8xA2wc3LoHeEF/fTD/28QUUtpP2N6iZDqz440MWooQVLxuVwbqkhIM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337371966"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="337371966"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 23:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="822250343"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="822250343"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2023 23:54:24 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 23:54:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 23:54:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 23:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnqbTfc3vdPSRfhNDXW8D7O2w3p6P2ANh/jmQ2K7jdYeyIbbYYCTqesIS65mecd1rDmQMnX8fBqYQA+v4hSmpgdOeVidtAKYzpyqL+hnGTzXxE26kaL+q8+Ba7tWkhAgEew+7uTEb7QJvO1MAYoXPEv0ggbW7H51fQJ2doSAd9Y+wN/EWV+YA8fYmcQBKG13Yk/G6fe7sJetiL2hyDNzW2oecon9ArupnT20bIMaKNssPOawJZvf/z2KXz9bNAVvgot05lMxgO6HTsCa5VuaI4LMJNfCeI/bpDlGzFBFdk94YzRrcVBp1Q6kwix/Hj3HGJzxpn60SDFaXcr+iUle1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbQijuGBMSN5IVhlmT78TLbmDwglXnnBq2h7QQYJhls=;
 b=XrO44sCq6kwCVyVGPTeOci0OWJO7UWFv4Lev3xGWUtWEsz/9FGwF7nmFTVQ+qFI4mXmWOkZbLvxjiDFnh360GrMDuXP02SAOJnu0WDLaL+jZtAFeS9rVQBjue7JnvuDDjjpQULDQzaoSELG8yHcW6xOR3+elVLg8JGAjOTyraicFF2SZv98SyNAy32b19+9NXCyIrX3br3gjr1yjOnZk/UvYBj60rkW+N0lmDSLvrWpfeRF1S4blQ5U+miCBAiVv9AGkrDEUHAclUJqeS32pHuQDlt4Gj8cnTUCtdDUlpthm3fIrgg5W86oEtAwbk3pmcqrO15zP3lhwx24MiccJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Tue, 14 Mar 2023 06:54:22 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 06:54:20 +0000
Date:   Tue, 14 Mar 2023 14:54:13 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
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
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZBAaFbfcWK15e6nn@ye-NUC7i7DNHE>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <ZA7JMimTCkp3qc8U@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZA7JMimTCkp3qc8U@kroah.com>
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DS0PR11MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 899e4eba-61db-4d6b-ac01-08db2458efcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6wULYE1wi9PdZEZJ4sY+Z8r527OY5/D9wcoM5iJo4MfF80gpsAFuCtGrVuRDoqi671cJocD00FDoW9QMTyK1VdLFbPinYfcuaEs6M1WsrodKN80hR/IqdpfkVlYmd68uJNU/0QIgGtqXT1T+1ZAU/CGYsULOYxjK1SVsuHlpGgodbRrSigAwVm65ojLVPlFS8Hk77ZhUCL1d8SvvY2gXz0iD9rvBIXwh1F6hRZ3McNDb447HbhcWdaJwOP8CpzCfLk4fzXuTLR5PGzyiJBkKE+j6gs/YPVKxmn6jv38fzn9QX2LCCXbPeF2kiChpfOIU8zptXm1wTMF3k9p0ssiH5YGXAP8kYCunQbcgsib1qdR1zLAUNvFNJ28dmbpq21NSH3zBrgzr+0r0uZwaL1CShieiSgWMhA60tK/+pV+lIGNM6DTzbaJEwfZ3pqWQelcgitxhu7J82qxatG2BIvsZw9L26y3L4Z66yaL4AM/24y7+CDNWvadnir7l8o4ngkq5YcJvTNYmHKreqXDoNbYzLSycSaZLqxl5NrNx4E6q0KV/Lrt5GyRMH2U/ZZ3BXNEEXJ7/FYs55fKW8WqiEd5Uy3sosLThVX9C2pjauW6XhdwdgKpai9S4rXX9jndxT10tZ1oyAgk54E7657qmSXPmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199018)(2906002)(33716001)(6486002)(82960400001)(83380400001)(9686003)(6666004)(7416002)(26005)(6512007)(6916009)(30864003)(5660300002)(8936002)(4326008)(6506007)(186003)(8676002)(86362001)(41300700001)(66556008)(66946007)(66476007)(38100700002)(316002)(54906003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4J4RwhffKGH5a1Hd7C5STi+F71I8N2x0DpqXtKRHfaY9Si8ODAOfxsQyy2Gq?=
 =?us-ascii?Q?XwZJzp31J9lc1wtaBawzxoshuxQVTnzepE/w7WpJ73Ll48xvjPkiyJLu1O2G?=
 =?us-ascii?Q?Qko7PxmOcSidTS6TcblWL0k5IGZRDY8yXmOZe7t5UpDQlqKCtjEqw3qwbBLu?=
 =?us-ascii?Q?m/J/nmIcKD8M+ODY31WweXLDgTxgqPoHOxLOBdMS/2If1tHSSJoF1/JwYFvr?=
 =?us-ascii?Q?upc1lBzsDCeG9oiODoWPJ9z9XoXKdPyHEwU+W0taAg6qeXC2AJDdypFrX7zG?=
 =?us-ascii?Q?jYiPqG1dSTHSh/giGn2RVeTR8xPhk5BYOTgcdPuroxyVlYc+ZtFzhXpRPpRi?=
 =?us-ascii?Q?8uvo1OO9CRj8N4305dyHBW4NfKQKGbdLPLmEGokvJflqHT5OZkIpWd2uLP2A?=
 =?us-ascii?Q?SPLDX0wEnk9lLH/d5gRCV3hpVv9WQQx2W+p/QA1HI4tvL5QUIn0qcWzQmTf7?=
 =?us-ascii?Q?ovQu4zqk7w3SxphEk78usFZ7DSAWEGpgyG1VavFbKD/NA5OFQiD/QA9oR5fX?=
 =?us-ascii?Q?RzIlHxkAUp9NHXznG9dvSbUYx+LFfpMc/imv0AeBqbeCyeXTA+BbvrydhMFu?=
 =?us-ascii?Q?bvz6IQ3KzfNhHd9hmS9glZSWZ9jzfmxE5npxjA590wSOkJ1DUs8ib8IoD1so?=
 =?us-ascii?Q?KmLMq8P1lLQ4SEBD/coLy2+uu+iXfXyISYNNjhqU95w5UjNBBWoqaQ2P0DzZ?=
 =?us-ascii?Q?zqzYqsxfjmpEIS4IAh8+J9UxOmWsl15U59RYSFuvJZ2N0eqnAREbOgKkJZCF?=
 =?us-ascii?Q?2M8UrPp9V0vOZ8WbrZ6d4WPCGhRyYdGXxEjk4/wh/dm/M57E0omtqt6RpN3W?=
 =?us-ascii?Q?y5eVNr8w7l+QSfW8b1UazLcStAs/Oc9SWwMNGSZdzl/7oNDdRfpKDs2h9LBM?=
 =?us-ascii?Q?3wb1D03Yx5ZRJJ+BaNPqJjbj5xw0BTksYuL7SJGRl0Y1r8jstA7D5KA/GQBY?=
 =?us-ascii?Q?A/2rKxIuR65vpA4aFSefffOWz9h4pUfm3jdPtC2ydW1zbNS5MQzzKpjZAyMv?=
 =?us-ascii?Q?Jn34IjUkCB5QZzrxVeyvFqeOimhMQSmGaTTiRjKHnP/EOplCmj1wcVkJenUL?=
 =?us-ascii?Q?HZDAMln1cxPnlVZOfwLZVrJYGDuh6SNzfejKNCOK7M6lflVNCMoXlEmpmtE4?=
 =?us-ascii?Q?s4opofoVLrbBAWQ4BrMOppuW8jJZp9PjxyDlJbjMmEbbIuDpsx/AvlXorjha?=
 =?us-ascii?Q?LbokKfE6+TX9aPkJrM5GrpJYyisGhOFq48c2G/stSXEkmy++wJak8hfAGbXh?=
 =?us-ascii?Q?iM/TuSPonjL/6gGg0/PaEnb39gdIxU22aWzjAIjWgoMMCanuKCyRoSD71pZf?=
 =?us-ascii?Q?fFShZMj5L2SZg1HUMRXpkSlJTzzkMLgvdqf6PIq08evoCSGMCDPKpfvOFL45?=
 =?us-ascii?Q?5gPcEaX5g3CsPPW/62MRb0mN3ctdC7Lm/Xrf/Z6sb6/uy5M/MA0TxhC3Jc3K?=
 =?us-ascii?Q?uFdqhDAYBuYfHiOK6+WTiBzmxC0/2kHOd9AbbMvjt6SelFI6p3XySw6iShSz?=
 =?us-ascii?Q?W3NfDevJfwtYRccyKDyXBU344ZAyKwQJu8x6OzeoSqQcb5u5c95I3KkEg6WR?=
 =?us-ascii?Q?phWjyNpLtjKpWKu7S7lSb7mjbfDybasgViEbn0Aa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 899e4eba-61db-4d6b-ac01-08db2458efcc
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:54:20.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0J+0KNkuTJI3q7Y+0f/WdzXpo8C9lF3tB9RD8k1exDcrEsYLtKapcVw/yJjcArOyuKBiUj/viaGvxoTiyuAYNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
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

Hi Greq,

Thanks for the review.
On Mon, Mar 13, 2023 at 07:56:50AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Mar 13, 2023 at 03:04:31AM +0800, Ye Xiang wrote:
> > This patch implements the USB part of Intel USB-I2C/GPIO/SPI adapter
> > device named "La Jolla Cove Adapter" (LJCA).
> > 
> > The communication between the various LJCA module drivers and the
> > hardware will be muxed/demuxed by this driver. The sub-module of
> > LJCA can use ljca_transfer() to issue a transfer between host
> > and hardware.
> 
> So you have 2 different things happening in this driver.  One is the USB
> interaction and control and stuff, and one is the creation of an api
> that is to be used by other parts of the kernel.
> 
> Can you split this up into 2 different commits, one for the api, and one
> for the USB stuff?  I think you will find that the API is going to need
> a bunch of work, as it's not "normal" for what the kernel is expecting
> to have.
Thanks. I will split this into to commits on v6.
> 
> Some other review comments below:
> 
> > +struct ljca_event_cb_entry {
> > +	ljca_event_cb_t notify;
> > +	void *context;
> 
> Why a void *?
We use `void *` here because we don't know the data type of context on
this driver.
The `context` here is the first parameter of `notify` callback. And the
`notify` callback is registered by sub-modules. So it represents the
execution context of whom registered this callback and the type of it is
determined by who registered the callback.
> 
> > +};
> > +
> > +struct ljca_dev {
> > +	struct usb_device *udev;
> > +	struct usb_interface *intf;
> 
> If you have the interface, you can get the usb device.  Why store both?
okay, I can just store intf here. When udev are needed when submitting a urb,
`interface_to_usbdev` can be used to get the udev.
> 
> > +	u8 in_ep; /* the address of the bulk in endpoint */
> > +	u8 out_ep; /* the address of the bulk out endpoint */
> > +
> > +	/* the urb/buffer for read */
> > +	struct urb *in_urb;
> > +	unsigned char *ibuf;
> > +	size_t ibuf_len;
> > +
> > +	bool started;
> 
> You can't just use a boolean as a "flag" without any locking, that is
> not going to work, sorry.
ok, I will use a mutex to protect it.
> 
> > +	struct list_head stubs_list;
> > +
> > +	/* to wait for an ongoing write ack */
> > +	wait_queue_head_t ack_wq;
> > +
> > +	struct mfd_cell *cells;
> > +	int cell_count;
> > +	/* mutex to protect package transfer with LJCA device */
> > +	struct mutex mutex;
> 
> Why is this not protecting "started" as well as the other fields in this
> structure?
Ok, will use it to protect "started", and other fields if needed.
> 
> > +};
> > +
> > +struct ljca {
> > +	u8 type;
> > +	struct ljca_dev *dev;
> > +};
> > +
> > +struct ljca_stub_packet {
> > +	unsigned int *ibuf_len;
> > +	u8 *ibuf;
> > +};
> > +
> > +struct ljca_stub {
> > +	struct list_head list;
> > +	struct usb_interface *intf;
> > +	struct ljca_stub_packet ipacket;
> > +	u8 type;
> > +
> > +	/* for identify ack */
> > +	bool acked;
> > +	int cur_cmd;
> > +
> > +	struct ljca_event_cb_entry event_entry;
> > +	/* lock to protect event_entry */
> > +	spinlock_t event_cb_lock;
> > +
> > +	struct ljca ljca;
> > +	unsigned long priv[];
> 
> What is "priv" for?  Why is it unsigned long and not a real type?
The priv type is different for each stub. So it can be several types
and we use unsigned long type instead.

> 
> > +};
> > +
> > +static inline void *ljca_priv(struct ljca_stub *stub)
> > +{
> > +	return stub->priv;
> 
> Why is this a void *?
return void here can save one type casting when using
`priv = ljca_priv(stub);`

> 
> 
> > +}
> > +
> > +static bool ljca_validate(struct ljca_msg *header, u32 data_len)
> > +{
> > +	return header->len + sizeof(*header) == data_len;
> > +}
> > +
> > +static struct ljca_stub *ljca_stub_alloc(struct ljca_dev *dev, u8 type, int priv_size)
> > +{
> > +	struct ljca_stub *stub;
> > +
> > +	stub = kzalloc(struct_size(stub, priv, priv_size), GFP_KERNEL);
> > +	if (!stub)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	stub->type = type;
> > +	stub->intf = dev->intf;
> > +	stub->ljca.dev = dev;
> 
> You are saving a reference to a reference counted device, yet never
> grabbing the reference?  That is ripe for disaster.
ok, will use usb_get_intf to increment reference count.
> 
> > +	stub->ljca.type = stub->type;
> > +	spin_lock_init(&stub->event_cb_lock);
> > +	list_add_tail(&stub->list, &dev->stubs_list);
> 
> Where is the reference counting on this new structure that you just
> created?  Who controls the lifespan of it?
We didn't use reference counting for this `struct ljca_stub`
structure. The stubs will be destroyed in ljca_stub_cleanup. So The life span
of stubs is from create to ljca_disconnect->ljca_stub_cleanup.
> 
> > +	return stub;
> > +}
> > +
> > +static struct ljca_stub *ljca_stub_find(struct ljca_dev *dev, u8 type)
> > +{
> > +	struct ljca_stub *stub;
> > +
> > +	list_for_each_entry(stub, &dev->stubs_list, list) {
> > +		if (stub->type == type)
> > +			return stub;
> > +	}
> > +
> > +	dev_err(&dev->intf->dev, "USB stub not found, type:%d\n", type);
> > +
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +
> > +static void ljca_stub_notify(struct ljca_stub *stub, u8 cmd, const void *evt_data, int len)
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&stub->event_cb_lock, flags);
> > +	if (stub->event_entry.notify && stub->event_entry.context)
> > +		stub->event_entry.notify(stub->event_entry.context, cmd, evt_data, len);
> > +	spin_unlock_irqrestore(&stub->event_cb_lock, flags);
> > +}
> > +
> > +static int ljca_parse(struct ljca_dev *dev, struct ljca_msg *header)
> > +{
> > +	struct ljca_stub *stub;
> > +
> > +	stub = ljca_stub_find(dev, header->type);
> > +	if (IS_ERR(stub))
> > +		return PTR_ERR(stub);
> > +
> > +	if (!(header->flags & LJCA_ACK_FLAG)) {
> > +		ljca_stub_notify(stub, header->cmd, header->data, header->len);
> > +		return 0;
> > +	}
> > +
> > +	if (stub->cur_cmd != header->cmd) {
> > +		dev_err(&dev->intf->dev, "header and stub current command mismatch (%x vs %x)\n",
> > +			header->cmd, stub->cur_cmd);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (stub->ipacket.ibuf && stub->ipacket.ibuf_len) {
> > +		unsigned int newlen;
> > +
> > +		newlen = min_t(unsigned int, header->len, *stub->ipacket.ibuf_len);
> > +
> > +		*stub->ipacket.ibuf_len = newlen;
> > +		memcpy(stub->ipacket.ibuf, header->data, newlen);
> > +	}
> > +
> > +	stub->acked = true;
> > +	wake_up(&dev->ack_wq);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
> 
> Why is obuf a void *?  It's a real structure (or u8 stream), make it so.
obuf and ibuf here is the transfer payload of LJCA. It has several types
for different packages (such as gpio package, i2c package andspi package).
If change the type to u8, we need to add a type casting from real package
type to u8 everywhere when calling ljca_transfer.
> 
> > +			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)
> 
> Same for ibuf.
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
> > +		kfree(header);
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
> > +
> > +	return ret;
> > +}
> > +
> > +static int ljca_transfer_internal(struct ljca *ljca, u8 cmd, const void *obuf,
> > +				  unsigned int obuf_len, void *ibuf, unsigned int *ibuf_len,
> > +				  bool wait_ack)
> > +{
> > +	struct ljca_stub *stub;
> > +
> > +	stub = ljca_stub_find(ljca->dev, ljca->type);
> > +	if (IS_ERR(stub))
> > +		return PTR_ERR(stub);
> > +
> > +	return ljca_stub_write(stub, cmd, obuf, obuf_len, ibuf, ibuf_len, wait_ack,
> > +			       LJCA_USB_WRITE_ACK_TIMEOUT_MS);
> > +}
> > +
> > +int ljca_transfer(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len, void *ibuf,
> > +		  unsigned int *ibuf_len)
> > +{
> > +	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, ibuf, ibuf_len, true);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
> > +
> > +int ljca_transfer_noack(struct ljca *ljca, u8 cmd, const void *obuf, unsigned int obuf_len)
> > +{
> > +	return ljca_transfer_internal(ljca, cmd, obuf, obuf_len, NULL, NULL, false);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
> > +
> > +int ljca_register_event_cb(struct ljca *ljca, ljca_event_cb_t event_cb, void *context)
> 
> What are these magic events you are registering?  What do they do and
> why would anyone need them?
It provides a path for sub-devices to listening events from LJCA
device. For gpio-ljca, it uses this API to implement gpio interrupt.

> 
> You have global functions here that other drivers are using, yet no
> documentation about them at all for any way to review that the api
> really is doing what you are wanting it to do.
Kernel-doc format comments are in ljca.h in this patch. It has some
introduction about these for exported API.
> 
> So again, please split this up into at least 2 changes, and document
> this new api you are creating, so that we have a chance to review it
> properly.  Otherwise it's almost impossible to do so.
Got it. Will spit this into 2 commit on next version.
> 
--
Thanks
Ye Xiang
