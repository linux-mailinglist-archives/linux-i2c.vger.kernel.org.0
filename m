Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B176B2C32
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 18:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCIRmx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 12:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjCIRmw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 12:42:52 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3DCFAF8D;
        Thu,  9 Mar 2023 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678383769; x=1709919769;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YqSnWlYAftv8yg/erbsaKjE5P6f/WPqjAaqP5XR3wXw=;
  b=ZoqnZnpFWi3mjdUFWnuJpuqFHQAXAD87kCuUQcI0HvsVzN+1J16btKhk
   Lh+B0+bcBFTMn2WxLmX5c06YjHdbB5xt+RKeJ3OezCOgCqsGb1lVw0q4q
   bX1p1KgWwZgKMG1sAoLfP9jzpxRh0FCwaVOauZJ67XOU81ev6l0TpJU+0
   6Zy8C/we5pM6T9LwrzMlopP4XQ/qDwYBn8x5sj0RLZR+7ke2MRhQo5zqi
   PZjHXDMEeyg8RUPKKbA9xXCRN9zeIIsy1lAcwR6+ztizRo17GzpvDOWyG
   XGnKhKTAY1tnNj4tZUpg8i2/7Ej8xknNGWGJ3gn8Eieym/zdekqj3yL5z
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="399106888"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="399106888"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 09:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="820692856"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="820692856"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 09:42:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 09:42:47 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 09:42:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 09:42:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 09:42:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9SLViLo8LGfQTJIAdA9h7rRhO67TpR8Nc4wkBxf4lR96pUaEKAh49e8/fCdb1hZbybue2uR/cGwPevKdQgJI4WAuwnJusi01bq1RnArvEJ2o9CmkxNpUgON6a2j+/O2TtazIiNA5RJIrA43vppu4LAXsfMUvoTlA7WZvsjF4RoKmRMdhgo3ohgdi+0yKQudeZ3/npOL4x+GgN6EnEzXE+1eAFkYoAmY3QTWZ77eVR9htD6/iNMzGy+2+kjI576TZDAs5eENNxEvtIbgKSNPQjjGFQ/7t5wwAVOfZ9Un6DuY4/byzDu0h4TvjHU48jQuB9nq7KuyvGsT56MZvLGXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swp2s+amLNIC/2I7MbQMzLvNvcQyfy5xGmKYm8AEItA=;
 b=eoacJlkRZ81t+XypdrYqvlerg7lmzwxA8JoQCO7/NFfoODkjZ567ze/S7VVN6oJWMUKP3Z486SWcnPyC45TFlqfe8drnPTZRd3rPq/o4n0JwFcFl+i4C6PzSkU1sRZU7ZCjebZERw8ITh6nFCxq22XXvikcqQXxox2F8uCsCz1NyK97jipIvk1wWd/+2uD0QcNcukfk+iiaQ7A08/eEKuB4JbuhncW9/wRlEdeqjYELae5t+8fuPmTUNadeH90fItBFpYvcZNlLakKzrKYbD8c+Zpreg1zlXTVmHR6eOb7j5fzqurMCHqK/YEshzhQq9qmtlIBbMTq4xyfXmTz+ULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 SA3PR11MB7461.namprd11.prod.outlook.com (2603:10b6:806:319::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 17:42:46 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 17:42:45 +0000
Date:   Fri, 10 Mar 2023 01:42:36 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, "Wolfram Sang" <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <brgl@bgdev.pl>, <linux-usb@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <srinivas.pandruvada@intel.com>, <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAoajF6iqfLRO1+w@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <ZAmQOIh/71rY4Pa4@kroah.com>
 <ZAmngB84ty1flD9K@ye-NUC7i7DNHE>
 <ZAmpse14Evvrfa/f@kroah.com>
 <ZAmvocpy68qurCvt@intel.intel>
 <ZAn/L8Dg/Ehx9bMo@ye-NUC7i7DNHE>
 <ZAoCNR/iAv3IOJ6D@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZAoCNR/iAv3IOJ6D@kroah.com>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|SA3PR11MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c09fc6-fd20-4881-f075-08db20c5b0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eydIgf3aQXHuEmFtY6YmWD4uXxv7YhBDbUn6PnjUjOx9qLViW3BtGUtuT5kylWa1PflEefQxWEcellkiJI4oesVevJ2DZmatrgXCHd2WKupmk2v45Ib1d4ezVrawsEDZDp/t4edRBF2H+JrxTNmhzo4wpmlq9+YH1WOvWFvXTsVWguoKLVfw0dnvAP0McFFn4Mv0pujZc+y7qSSdzX6S8/izRJElUQYk3VANGky3FRkD+nuvV5l3Tt3Im8+/vRf2q2eTXzqHdpuQ7Btkc5B1q7HANGMHkO93KH9PuUERWS+jCM+2ACrVHRawG+1BYJGC5GyRJ54heH3f+NBgXSQ2BTO/EwjmNlyydoEeuwdcFjp9XlfqD3n89UwrlZKGP6o/DmQjFM6ElPXMfZPc5SMTLOnqRC3oR4WO/Q2nQ40Omz/YcNIgbdSw2ztgVXTmx/yjv/Hnz1vluBTYG8Ocgazo5KKmKFZfmfPGyps0xsVT0ALc+wOsj6uURsV132iBTqn4tXPpl0T3O2BqHsncRPmuAHi7RcIbOqt9JM+QZjQ7cv//7CIeKxEFq+3zcz22g40F3e0VJy/nsLWiQ1xn9lOEe/Ee840QBEzxzzskeuYgOJIZ4ANSGRw+VQ4OXPJCv7N6jsUC7ARQQF41vcUP3IwOcJdFJEQ7kjudzZCeSOU2thQDZotQuJRb3Xprv3+txSVcF8s+y+2x9DgpwD6JMRO6Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199018)(54906003)(5660300002)(7416002)(6486002)(478600001)(316002)(2906002)(66556008)(66476007)(66946007)(8936002)(8676002)(6916009)(966005)(4326008)(41300700001)(82960400001)(6512007)(186003)(38100700002)(26005)(6506007)(86362001)(9686003)(6666004)(33716001)(83380400001)(55004002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aXcOD9++T1/mGdemfdnfYNP8OIi9opL6t/Xy8qtJSdLUcAADC88L+V/So4xi?=
 =?us-ascii?Q?Vz37h/QyOg+HddFb7moGCmArD6FZWse1jPgvdEja4lJC/2apOqbCsgIUHE9m?=
 =?us-ascii?Q?5umBDKoVGcIrXQageWhG8mWgJHqy+feqzM+wEj/ZZcW/GXKSZ9sEfPVzR8Sl?=
 =?us-ascii?Q?keLu4BAUmGaNPESU2G3nM1jXw3KyHE1OjWMp3B7noldtoDMTC3+hZ1gWTZk3?=
 =?us-ascii?Q?rtLWGfQ18KoM2Ve1ttx+zRC1/doYT88l7JmIXev8XCF2QxcRiMzmm6lp65g+?=
 =?us-ascii?Q?qTpB/XW1EPerUwkDiYygb+3ID3tNWk3wft/eI81tI/x9GrExKEBjZG8AlIhJ?=
 =?us-ascii?Q?jIOPeXL0I64xvsPwdkqjw3eqmDTh1GL+jjOsOTADbsVYwHq/YR3i+UzPvayh?=
 =?us-ascii?Q?D7MWYU0fEzY0aOhy3uBszc/9/DJKOBNzVMO1OrMWvDkmUMkVzEAsVHFheMzo?=
 =?us-ascii?Q?AFd3EVe63YB4ULqWfVsL5ZE+l+HT9cSq+JrBw5NTAqpVHVpXiLevIZ85xUV8?=
 =?us-ascii?Q?4titrrkxClKe0YWzPdXbcqThbVKwpS0KKk7LkkL4QjqWBgMIlIrQ84P5oq5E?=
 =?us-ascii?Q?jLpxRAIeC7NyK4jY3GIkG3Od9D5sZpyklfOJTWoTH526esMaFWiaHMdkzvJE?=
 =?us-ascii?Q?xUy6Z8YYZLSCxL4eBfMvsF6A+ayYXCFWAnNgP/fv78O5TLs89KpwPI5dDX+9?=
 =?us-ascii?Q?AbzhEAYI/rOCgBusB6szDz17B79QNZ1IFaMVJaLA9VhAOkWZ8KKCpxcTQiFB?=
 =?us-ascii?Q?x0hRmI1NFPbNnPSK9hEg0Fdr0wIEMNb+yARVZfz7+uYfsfrKzwhMsovTDSqW?=
 =?us-ascii?Q?zJwvCzM9G0uupYvM9zEA1wR54NCo108DI5w3skqB5i8BXMrfNxAOh3MRySiK?=
 =?us-ascii?Q?f9xJWyicTJD1/o/IURLEj1cYgabMYnOyfjMqCVzGm0hnCWoBJGH8zs9scXGE?=
 =?us-ascii?Q?CNWKTO7qt3L575hON9Ky9+iSrka6UFdgJlHAAMUcfNPLzliTlIDbSrFsiuoI?=
 =?us-ascii?Q?wu6qTF4mMHPg5kPxwjHkm3Pk7zeh6PD20LbEIP7uMpYIie9UT4WBVGfN1WGO?=
 =?us-ascii?Q?LHhuj1IMBhlVxots78sFUODX4CZ07Yd17/WtbYTr89WRCmF/zKcEiGGaHni0?=
 =?us-ascii?Q?38VroGfp3m7Sca2TXMQ3bHzf0CutT8Oy6gofZl014IiEJp0zuKqxV4C7MxYx?=
 =?us-ascii?Q?BcaNapmI5vScO/OowYHasv6IfIMcMAPEEd6oQopgrAzdSYqaSchO36orUDQJ?=
 =?us-ascii?Q?YwjjEaZVgtvA8rxS0bV6uS9X3PFnNOjMp46Z/q3mN2Qa2U5tNsp3Pp38HZqU?=
 =?us-ascii?Q?kL6zXyEZHFu0ernw4GyR/yyBjJTRk7g3bmBW8tP0qguVXYNtddKwcLwFjBSO?=
 =?us-ascii?Q?vuRxuhfkvyRTCG1vO8UCy+eGoWdU2PiRzOy2lxGhSVzPMC/TQT8vVy8dKkeL?=
 =?us-ascii?Q?b4eLxBz3XwAFNp1HbZj2lcHiOxrTHTB6ZmiJ98gudMWXcRsO2cvoEPfCQhov?=
 =?us-ascii?Q?Rq9hcDh/reVLIAU7vil8qRCJ5Vea/XsXgoqUza5ffN1ZcT1TfbgVI8jZnX9b?=
 =?us-ascii?Q?fV+6gub3x/y0YPt/7BAjuKC6v+Uv1683M/LwbS+y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c09fc6-fd20-4881-f075-08db20c5b0f4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 17:42:45.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KketjV/46VBIJ+7nrIkAeBt3nlDbwV0WYLNxX4XjkGfM2Y0xKgfmzg8RJMiNrwbg91/jtnQuX2fCfUPNn3SgwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7461
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 04:58:45PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 09, 2023 at 11:45:51PM +0800, Ye, Xiang wrote:
> > On Thu, Mar 09, 2023 at 11:06:25AM +0100, Andi Shyti wrote:
> > > On Thu, Mar 09, 2023 at 10:41:05AM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Mar 09, 2023 at 05:31:44PM +0800, Ye, Xiang wrote:
> > > > > On Thu, Mar 09, 2023 at 08:52:24AM +0100, Greg Kroah-Hartman wrote:
> > > > > > On Thu, Mar 09, 2023 at 03:10:56PM +0800, Ye Xiang wrote:
> > > > > > > +static int ljca_mng_get_version(struct ljca_stub *stub, char *buf)
> > > > > > > +{
> > > > > > > +	struct fw_version version = {};
> > > > > > > +	unsigned int len = sizeof(version);
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	ret = ljca_stub_write(stub, LJCA_MNG_GET_VERSION, NULL, 0, &version, &len, true,
> > > > > > > +			      LJCA_USB_WRITE_ACK_TIMEOUT_MS);
> > > > > > > +	if (ret)
> > > > > > > +		return ret;
> > > > > > > +
> > > > > > > +	if (len != sizeof(version)) {
> > > > > > > +		dev_err(&stub->intf->dev, "get version failed, len:%d\n", len);
> > > > > > > +		return -EINVAL;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	return sysfs_emit(buf, "%d.%d.%d.%d\n", version.major, version.minor,
> > > > > > > +			  le16_to_cpu(version.patch), le16_to_cpu(version.build));
> > > > > > > +}
> > > > > > 
> > > > > > You have sysfs files, yet no Documentation/ABI/ entries?  That's not
> > > > > > allowed, you know this :(
> > > > > The Documentation/ABI/ entries is added for the sysfs on patch 5 of this series.
> > > > > https://patchwork.kernel.org/project/linux-usb/patch/20230309071100.2856899-6-xiang.ye@intel.com/
> > > > 
> > > > Ah, missed that, sorry.
> > > > 
> > > > > > 
> > > > > > > +static ssize_t cmd_store(struct device *dev, struct device_attribute *attr, const char *buf,
> > > > > > > +			 size_t count)
> > > > > > > +{
> > > > > > > +	struct usb_interface *intf = to_usb_interface(dev);
> > > > > > > +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> > > > > > > +	struct ljca_stub *mng_stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
> > > > > > > +	struct ljca_stub *diag_stub = ljca_stub_find(ljca_dev, LJCA_DIAG_STUB);
> > > > > > > +
> > > > > > > +	if (sysfs_streq(buf, "dfu"))
> > > > > > > +		ljca_mng_set_dfu_mode(mng_stub);
> > > > > > > +	else if (sysfs_streq(buf, "debug"))
> > > > > > > +		ljca_diag_set_trace_level(diag_stub, 3);
> > > > > > 
> > > > > > Sorry, but no, you can't do this in a sysfs file.
> > > > > Do you mean that we can't use sysfs to send "debug" command to device?
> > > > 
> > > > That is correct, use the kernel-wide debugging facilities that we have
> > > > for this NEVER create your own custom interface just for one tiny
> > > > driver, that is not allowed.
> > > > 
> > > > > Could you provide some detail or hints?
> > > > 
> > > > dev_dbg().
> > But, this command is sent to SET LJCA Firmware logging level.
> 
> What command?
ljca_diag_set_trace_level send LJCA_DIAG_SET_TRACE_LEVEL command to LJCA
FW to set FW log level.
> 
> This isn't documented at all, sorry, I don't understand what you are
> trying to do here.
Sorry for the doc missing. will try to add more details on comments and
Documentation/ABI/ entries.

> 
> > > I'm not sure this is the same thing, though, as it's not a drvier
> > > to user debug message.
> > > 
> > > Ye, can you please explain better what this command does? You are
> > > sending a LJCA_DIAG_SET_TRACE_LEVEL command to the device with a
> > > parameter "3" which has a meaining only for you :)
> > Sure, the LJCA_DIAG_SET_TRACE_LEVEL command is used to set LJCA FW
> > logging level. 3 means debug level for FW. It is used for LJCA FW
> > debugging: when FW got some issue, we can send debug level to FW
> > to make FW print degging log for analysis.
> 
> And where is that printed?  In the kernel log?  Somewhere else?  What
> does the firmware have to do with any of this?
The firmware log was printed through UART port of LJCA device to another
computer just for debugging purposes. After sending LJCA_DIAG_SET_TRACE_LEVEL
command to LJCA device, it will print logging according to the log level sent
before.

--
Thanks
Ye Xiang
