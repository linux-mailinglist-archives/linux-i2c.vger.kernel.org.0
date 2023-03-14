Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC256B8BF8
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 08:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjCNHdY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 03:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjCNHdX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 03:33:23 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6966985361;
        Tue, 14 Mar 2023 00:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678779202; x=1710315202;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cAmo1UF6QfQzG5634js2rNPbuOK/r+eu4wJnP1ArGI0=;
  b=GLtw5PA6V0ogs1CQi7j45cG4CGvi6sI8aO+X+bt4FGqK01xA4BecVRzR
   OLbiWkL2DDsKdHg7nmwlb2NU/t2nBke0qga+nclAeuBmt4PO81TMMNcLU
   o3rxKWcrx/uJAsaa4ZX+IskO4da9iZEUWoRPr7TwuzhCophh+4MozXxms
   Lt/mHWTFYZDWqUmX4DSYzQ6Q8inI5hyduPdo1oRY/vhBE+Bqq14jLDNPy
   cdXBT+aVno2Z6Ii+DunlZwZ5Ekj+sTxx5KKWXJgkDz1VmZH/VGxSc7Rui
   5ctzKLeBV58b6YmEa4OopgL8QBIRW+MrNjWAuXcnQj5F9nTYzDyXgAa2P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="325718227"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="325718227"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 00:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924819785"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="924819785"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP; 14 Mar 2023 00:33:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 00:33:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 00:33:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 00:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdchKpYKlEGsQr/rGSirtcWp7fXJI7xSl84oMQzMv4coqQxfMQ993BDVBqp1vhDY4HIWf1f2a6prHKzq/r2UyUbraLY5nO3CL64IgZvS15YIAIuqFnP9nh42HajhY5Yp5cgxIwYcEwnBgiKxlUq/g1sZNX1Ys0T3j0PPZyndS3FGPEnxIsJjvLNU0x8RndQGoGOMhxZOibon8ArgRnWc4HzueZYS65Mk7aoTBbrRhwJI7/yyAR1xN2zuv4/bxp/ThYmZbUyyk7YULaz0cUgh1D2M18rAbm0B7OTXaC11kNmMZEUm2u6V92PR4VzaFMayWgULaMHjvISD96ZviDNIaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RM8oRqXf/mktuA9hn45HBsEk91wya5FPVZ5tpje5Vpg=;
 b=QBTA/I8XC7AT+HxVoRw/+GV+7Mr2W8jFwucs4IvsyQ6XcCWSp+BHOYmlQmc+rXQVYl3z99njpqu67rKhDSkNF0M/JpVW7xYn6Jp7jUz3LpXPJbAoOyCW9FBEBOZHdAPq1Xe5Zm4yZu77mNb9rNKTg/88P4ZI4u9F1E5R3crAD+twGB+UkS88M5/wwfuy+cCjHP83VN2eszj4iBCo5rPsHQBoy/erDoTa9bcZHBxUCky+L54qPVYUxI8nok1cepuEihC+89um7OBgxf0mOWqMmph2O58eesp6UhLO8+s40+qGZuT64VNU56JCNubgYkYK5D5nzcKQXj8+htFm0jKDSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Tue, 14 Mar 2023 07:33:18 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 07:33:18 +0000
Date:   Tue, 14 Mar 2023 15:33:10 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
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
Subject: Re: [PATCH v5 1/5] usb: Add support for Intel LJCA device
Message-ID: <ZBAjNlv+NbC2Le0v@ye-NUC7i7DNHE>
References: <20230312190435.3568212-1-xiang.ye@intel.com>
 <20230312190435.3568212-2-xiang.ye@intel.com>
 <20230313162146.eag5z6micbpczbt2@intel.intel>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230313162146.eag5z6micbpczbt2@intel.intel>
X-ClientProxiedBy: SG2P153CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096::18) To
 DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|MW3PR11MB4697:EE_
X-MS-Office365-Filtering-Correlation-Id: 9509212d-0001-45d0-b4ee-08db245e6128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zI8jcTncAoj2uLWLej9zEbv9D8AIvZqaMtvZ6RYCUPeCntQqlKPL/O63FcQGMCg1hIYTzFKLDy0D2mXzEjbygcremdkbWPnZJiDMX6b4oaYNIsTHGYn4OuCKC9d9etXLXsI4v1YODrSdZkCrsRv0/kSQle9mzGcvLzYhDVKxg2xDTFaXiqbgZK6j0spC/wj9/qSykY9UWw4N3ZxCvK85dkQehsEdXzKwPrH/i5pRriLWm46iI8zZXdsgrGglTMhAZ9k7bvb/F7ub08uOwtoFS+AZWJfEBLyX1gJ9nvM4VTfcCFkBfIXJNZSoSBebRpM7cGoZvJkY+XCmb6vvPfBkRK46dSWgJs0XD9UkQUlfQxbm7FeV4KZGhulblhrmqOBndMMaJ7GJmfwwaunVSwQ4Bkw7gPI7pMmJKBkPgPhRK6co5Q0Ghjr/AKO/6qeTz/2dEEVivbZW7q98TPe3juJXOxT+h3DnqdeadZ2ja8BJOqQqUZCXlGt8LD6Xc3tj9AfQErD2tIlEajIpeDoiC0XBY7fdYTkl0Fn+lPYnsCK53+hFfyImvhgc2qN59pNmEapbM5td9zlbNhiwNvtl5+nBYF1AftqRHwIZvAHB1u1DQyvsuBjdBeeyu0bC/SYPmSIQiqp5/mdI9U7iAQ4OwF1BjY5w3AgDczezKZaDpWaVVXoWf4A59mZqH144wJUdBtjI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199018)(6666004)(54906003)(316002)(38100700002)(86362001)(82960400001)(186003)(6512007)(6506007)(26005)(9686003)(33716001)(7416002)(5660300002)(6486002)(478600001)(41300700001)(8936002)(2906002)(66946007)(66556008)(66476007)(8676002)(6916009)(4326008)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZziNnyjBfRlqT3kXYB+j+vRnM1CBS6ZzSnP9AR0+tWQYE43s8PXuZ9fvVWhN?=
 =?us-ascii?Q?vXnIPkOkoabVFFqJpySLSGukaQ6opBzuSXWi04s8X1LPRVGTioI5RTy53w1Q?=
 =?us-ascii?Q?bYgGkNiYqUN6KcJpX1U0vxMfRzCL7LVTl71t1qSpg9/jcQOILhsWbZ/Ni5vZ?=
 =?us-ascii?Q?dblzuLdhkCMpOsZDVyAiE0P4ZmogPWagHnBnaBhsSwntdRCoZf/dZyHLh6G2?=
 =?us-ascii?Q?q7kR3UWUZrkOI/O3IfyfGesx+H2NzExFQX8MRuq5v9hdNxD3mcNjERoqli7x?=
 =?us-ascii?Q?glVaybYUhEo08t1rz3Bu9nsFVMm+eS4Q761ay0m8cwOrWSaNPZZjXP8bEOkm?=
 =?us-ascii?Q?6atx7l0xz5RdgZwdzQeWaR7NSY2FlolRfbSlaKw3TR62ShDsVrYCpJa/V+r0?=
 =?us-ascii?Q?zG513HaqLpFrElw8Edtr3bvz2gJ4uVAnK32lUEAn7BoYXCzmtirURhJyW3i/?=
 =?us-ascii?Q?gNr76YaIfl3BywgKyFeSqrgrcibB94dGi8jwI1v4Nz0TPKHMV/Zum5+2B9zL?=
 =?us-ascii?Q?f3T/WSHqTAUzKAfwwj5sKGTd7F3SFtQJXVxp+6WS0iCRnNam63j422zw7bFj?=
 =?us-ascii?Q?keBPqRcXfiJ5Eqblz+5DVq9tp+pWVKaKF1hwCjpNAkNLh6qSVc441GO1tTr3?=
 =?us-ascii?Q?/EHzhUbrc8mqv8AFUx7PvSDgxSoPXbc9p6+mf+U5H+Dd6P7pZy4qF4SAvFIR?=
 =?us-ascii?Q?2ewWG61y/5+BHCrYoEI1Q8yWabuILn1FfArZ7jdVQdJpd68/aTMFc9E3GD1B?=
 =?us-ascii?Q?bBEojVey8Cqu10BrfL/Emd7k9hWe3HrBDjLYRZH/uQEIlhXNuzzaJSqKKNeZ?=
 =?us-ascii?Q?5816RXfGNHZt3JpVEDUdlF/eG8KE0FgwXmJT5mlamPwxwxcqaMwQ+Yz9sgXR?=
 =?us-ascii?Q?s0l0U/YECN7F62HIosUqoudlyIlSP1kQJTPYfs8gPADk/bT765+Zo50LaMxe?=
 =?us-ascii?Q?KJgSlC6lW2pwyfx7ItVm39MXcvMmyUNZfKap7Zb997ata2L5CPAeqIE2xXoC?=
 =?us-ascii?Q?XN7l6knkWj7yFaBINHmj9rVeHtrkrcdyrWRhGqE0EL6nvrzPXNQ0a+q1HfnE?=
 =?us-ascii?Q?Nqy9Yx+T6MTw1TF4XvQkA598aIbDmp7I/iN0zV02uiCU5bxVXHTFB1veGV9S?=
 =?us-ascii?Q?vgJd48X2LyvbFtEco9YJrVOdx/m+K3T3i0+M/D6sb32tp9waeJ+1EE91RlV5?=
 =?us-ascii?Q?4F5S6QL64PWk6rAUDeOdwDBnhuFz/djDzygvsfA2DNXaA/Iemtwq1RNLJI1w?=
 =?us-ascii?Q?+0nmaHIWweEOv9szebMprjtRkGOuFlhf9WhLiCeJF17acyxYJetskdts60eH?=
 =?us-ascii?Q?aRs+59XKiR838Ca+n1WwAElDeobqY3CnIOlrIxzRhOAizbgm8/dQkC4M1RmE?=
 =?us-ascii?Q?zepfB83Y0a7XUcYOBdSBW53GHcOeS0Sz8OD5RVizwhzl7krFu5C327Kpra3V?=
 =?us-ascii?Q?qnYTVRurSdVqUPLo8YOmoCMSMfpbWkkev5Qh7NBEjeMrk5jsmJm1RXRH1MEW?=
 =?us-ascii?Q?sGkkW3E+g/oZgpWagmujGjT91JJwnjsvWTxxRmHQ2IMY6n6c3Bdg2/3uEyOt?=
 =?us-ascii?Q?Q5p6X3AgpVZ+XBiRAg//k34bB+dCAPMHzOQH3P38?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509212d-0001-45d0-b4ee-08db245e6128
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 07:33:18.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXa3O73yDUFhkWpgv2IVIYSx5+IOchDo/zvy3hl40zNCuT/dakTo6JFTOIeiMygaAKaQJo8CjdLE7I9p5IM+3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thanks for the review.
On Mon, Mar 13, 2023 at 05:21:46PM +0100, Andi Shyti wrote:
> Hi Ye,
> 
> On top of what Greg has already said, few things from my side
> through the lines.
> 
> [...]
> 
> > +static int ljca_mng_link(struct ljca_dev *dev, struct ljca_stub *stub)
> > +{
> > +	int ret;
> > +
> > +	ret = ljca_mng_reset_handshake(stub);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* try to enum all the stubs */
> > +	ljca_mng_enum_gpio(stub);
> > +	ljca_mng_enum_i2c(stub);
> > +	ljca_mng_enum_spi(stub);
> 
> We are ignoring here the return value. So either make the
> whole function call chain to be void or please check the return
> values here.
Ok, got it.
> 
> [...]
> 
> > +static ssize_t ljca_enable_dfu_store(struct device *dev, struct device_attribute *attr,
> > +				     const char *buf, size_t count)
> > +{
> > +	struct usb_interface *intf = to_usb_interface(dev);
> > +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> > +	struct ljca_stub *mng_stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
> > +	bool enable;
> > +	int ret;
> > +
> > +	ret = kstrtobool(buf, &enable);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (enable) {
> > +		ret = ljca_mng_set_dfu_mode(mng_stub);
> > +		if (ret)
> > +			return ret;
> > +	}
> 
> What is the DFU mode?
> Is it an operational mode?
> Do we enter and exit from it?
> Does the device leave this mode on its own?
> What if I write twice in a raw enable?
> Can I check if I am in DFU mode or not?
> 
> Would you mind adding some comments here?
DFU mode is used for updating LJCA device Firmware.
We have a Documentation/ABI/testing/sysfs-bus-usb-devices-ljca in patch
5 of this patch series. It has information about the entry. Maybe it
should be go after this patch (patch 2/5).
> 
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_WO(ljca_enable_dfu);
> > +
> > +static ssize_t ljca_trace_level_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t count)
> > +{
> > +	struct usb_interface *intf = to_usb_interface(dev);
> > +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> > +	struct ljca_stub *diag_stub = ljca_stub_find(ljca_dev, LJCA_DIAG_STUB);
> > +	u8 level;
> > +	int ret;
> > +
> > +	if (kstrtou8(buf, 0, &level))
> > +		return -EINVAL;
> > +
> > +	ret = ljca_diag_set_trace_level(diag_stub, level);
> > +	if (ret)
> > +		return ret;
> 
> do we need any range check for the levels? What happens if I do:
> 
> echo "I am too cool" > /sys/.../ljca_trace_level
> 
> As there were questions here, would you mind adding some comments
> so that the next reader won't make the same questions?
We have a patch (patch 5 of this series) adding some Documentation/ABI/
entries to specify the correct value for each entry.

> 
> > +
> > +	return count;
> > +}
> > +static DEVICE_ATTR_WO(ljca_trace_level);
> 
> [...]
> 
> > +static int ljca_probe(struct usb_interface *intf, const struct usb_device_id *id)
> > +{
> > +	struct ljca_dev *dev;
> > +	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
> > +	int ret;
> > +
> > +	/* allocate memory for our device state and initialize it */
> > +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> 
> devm_kzalloc()
Got it. Thanks.

--
Thanks
Ye Xiang
