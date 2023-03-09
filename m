Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF6736B290C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 16:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbjCIPqg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 10:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjCIPqc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 10:46:32 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C50DE4DBA;
        Thu,  9 Mar 2023 07:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678376791; x=1709912791;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OyehjolKBqZmRmBZXz45L8vZ9ZHxlsY9+M+6/7ZP1P0=;
  b=c4PNg8NwMRoK7dRW8GuxNWZI8gRqaH4F2vYLQ28Ol4lOa4L+x23qeeGg
   8ziczMnw0e5MF6Ju+F5M6+nwk1THRQ3wikle+4qo8Mj4X3oZJwtjVB1SP
   DPlbbzh7vQ8O3+EZIPIy0Fs3r3d5ASwiJiKX2SvSdhtq1EzOeZovrUD+m
   C4I82TKa//B6Pmh4PPYnVV50Ia91GUCJ8yjwdw4SaYxgODexDMnn6PSa5
   vrWeuP7UU6l6dyYTx4K/1zFpER38znIr5EVi9hSpzRkp09DabVP5Ob4bo
   NgfzhoaDOTt3FRkrH4lIxPylfOFZZ+vE3WSqlBB7nRW6zTD4KRFDja3cG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316133766"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="316133766"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 07:46:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="741596832"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="741596832"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 09 Mar 2023 07:46:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 07:46:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 07:46:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 07:46:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HC7XyiOVjP97mhEbjRf1lKIzB6+WsDWN8H+hCtiaAufRIVXTNjbGWB2wSbuXBPxCsQ1SOm5yyFsbTgzjgo7vnDVRwtYMXpkTyALxi2+7lW4VWZnHPcikQZjZAhloFmjSMV7Fon1VdbH+zuDvwsj4WNaEmn+3/70gF6xWpbzzhjOwR5TdGUZE1fgwaHNLSPsN1kQax5f1JhOpj2Lmeafwt5mY7onzStDedl9/OFFNGO6i3HXy7f6tDSa/YW9aSn3ZBgPTrUk0nw3xS3MT/h5eCjIHy1eyMcdYxc1yWvoIKcTAeN3XfsHTahzhgyqC0+VdkipzUTviLjTDyBUtRAonOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu0XxmnAzdeLpw2IKeW1IKHl7gcpMGcSYLw1B3rPpcY=;
 b=gNg1kuMZfAznTQCKVvKA/IT1hAEbsNcVAoagDaUk8kd4GgdvJl+bnbSziCQsimqf9phG270Is/jyI7yYmKlNB2eZSy1jhdo+tIIXmJn+kMjbEhl5lJGrMsQLeFMJs9IgU2F1tpK992cqZ8+Hai3g/J/41cfqUt2/bhnR83bNy8a5ZVoUpbld50RxOCqQUrZ4h+CG7napouqvfAlX1/mdA4Rfw4169II2GnM0be+a/Hhm+UWDyePEdjzQdoi0Jsox4jYQxFuaP1V1cRr4jypS0+3vQHiHaKK3Nxg91HpvgzCnjWtWO9AwGnAs335RvkMxbxhqbrxjIL8PguN+9exhxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:46:07 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:46:07 +0000
Date:   Thu, 9 Mar 2023 23:45:51 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAn/L8Dg/Ehx9bMo@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <ZAmQOIh/71rY4Pa4@kroah.com>
 <ZAmngB84ty1flD9K@ye-NUC7i7DNHE>
 <ZAmpse14Evvrfa/f@kroah.com>
 <ZAmvocpy68qurCvt@intel.intel>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZAmvocpy68qurCvt@intel.intel>
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|CY5PR11MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b01447a-636a-4e9a-cc8e-08db20b565c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4UFm7aXt+/OLerNEaxbPsDvGz5LPUXYfn49zTLQQPMe0uKrhQL7bDwETuS2tWBnJftGwWnTjwRBswyRTDOZTYlOs/I13bbzDbRUHrpoO5W7HZnM0EFvPLINJvWvrmYWCUuZjRa9OfBv+8ma1vCMQqPpJmno/ZO2bpsITALj8uWQ+haH4z3SV9AAMoLMD2Y6sUvMxeJ3mtKGWoEZHiiqjnzqDEm6rA5jn0+cChA9++JP/U2Xpxvh5jngOLfGb9sX+yu7PzkqjVujD8plTkxlRjmTp1bW4YwBm8mwA8zaJtKMXpZeumr66wkD48ltDlSv8jkQXumiP7iXGC2fhgd7gxlq0fCLCHwfAXge57PjS6nHrYxPmgir6P0Y/mTGfc85NHV1gO2b18mm+boUWxsSEWWFybNGDH1ylT8FpghYaAUmMLBtfyaCT3hn9bbnaspWYK4pVB/LVIwVm1itgDFWcGkj0D1fj/+ecSe+9PkGEBme8hiJuwsB9IuvetaHiZyXVkTm5PsuP5Uu+47zudpHTctQhsIs4bZm/qCe9ag4gZvT6kqBTIsqjkACy/GThJ0NSNMk1vYyV1trr3a3O00lxNSkQm5wobJl3IN2z/96TpYDqYExMP75dcjjXNUV8gDTZ7Gt2bDwc6CxirApgDEV6zqmpQTIwql6IHc5L0s47tt1opq3l8nlBjKODhFTe+Jg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199018)(316002)(54906003)(110136005)(478600001)(966005)(6486002)(7416002)(8936002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(2906002)(41300700001)(82960400001)(86362001)(38100700002)(186003)(9686003)(33716001)(6666004)(6512007)(6506007)(26005)(83380400001)(55004002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HWGpaPfng1XnvTVQJ4lbpcdF17fLKtIgQTHbf45T5gw9tS/m1HUXvBmcPwyn?=
 =?us-ascii?Q?N1ZgbLOqVcDnD4DY6TsbkmEYKiLBCR3ijhvnhtRXbJ3QdFYdbq6C45LhMOeh?=
 =?us-ascii?Q?bRAgFRF1cdcLadCr6mDM4KzPAopQZu1RRHi/EfKy7UFHUsuS9bL34FZMHJni?=
 =?us-ascii?Q?1gXdsNHfon7VD4+Ykx6u9eWswEcekSGxd6m81cgvt0tnYSkQ+60khl/Kqoth?=
 =?us-ascii?Q?Uu9Tc1EEScoHKABalblZzKwRgJ4eTo+nCVZegqZyRx4iH3rJyh2GllN6/2rY?=
 =?us-ascii?Q?2bQ5jpf2zBbi03vVvheGB3IY0LZPSpZLxPYIk5c5NWfYQhXM6we5647eBRJh?=
 =?us-ascii?Q?B0BTjq1K28P2TQOxFraSt9cjuJLIkaHYXm2A0RX+mbGwYhxq/LYLzJoXn5Xw?=
 =?us-ascii?Q?RZx6T/B1j2ORAJSFtrmw6f4gdljX7YpBx82/otJvGQkdLAkYJWssfohAnbV7?=
 =?us-ascii?Q?vKciBJGRoBHlCa5lgdvV5PsHo47zhZLJhmAxsjxmF24TUyQ1o/23jAfSlwdA?=
 =?us-ascii?Q?qRPiBErDNvhHSN8IObeD1iCTwzWuqYEcINa5zYv+SWPNodGtMBqsxVtsLZQY?=
 =?us-ascii?Q?/oERH/pYFVfozakakqmFntQW0Ozagw5J377RXRv+1c94GfO7yWWHkEaWFBo+?=
 =?us-ascii?Q?S75DYw621hHQTyg7UwePsE7uTHhciPbeg1iqRjnzPANQmOdP4EpQAnnevSX8?=
 =?us-ascii?Q?Kfvv10uwwaGBa/diIjek6DDL1ZbLK+BehdktRBeF8aa+uVQpOCaSo2ZwL+aU?=
 =?us-ascii?Q?Y1Xb9z46hEU5RgyamWAxFhyt+t9rUmmFvgCvJq4Osib7xhFUeExnUAQjSQWD?=
 =?us-ascii?Q?ER6+172+8GptPRL3N4tbz41NEhQZdFEWqFst/VBozrrLwWBSOv5mScUm/YZS?=
 =?us-ascii?Q?qEolJM5c22BIErYF8AQqb//SDqqplngJ7NP/ouCPk0j22fHAECkRxwz0XwLc?=
 =?us-ascii?Q?boaXONlcCZVzutrGgVRF132w9f1MauWzAVDZY9Z8De/2HgvVcf5Q2HJ5T1D2?=
 =?us-ascii?Q?zM5YWp6iq8KK1lUFvn1gKyec29L+3tPYXFpDe3xQYHv2DunPi7S2yLTGdeE1?=
 =?us-ascii?Q?pC5bEXxy0jgrC2gHcx7r3sDgn/b+KZSbreuKSaUnkxBNdBUxoXHPjQBFl5j9?=
 =?us-ascii?Q?JRmgGGxoQHYQ0jPTj0vc2gMGPvS9g66c1m06EK2pG6RTjQFXsVeUedHRa0MS?=
 =?us-ascii?Q?nC+gHJ0Gem1Yv40c/A7OEp2pLMDgno30P7T5+WXg7/Oyuui3RUUFQPcL45sr?=
 =?us-ascii?Q?HfIt/Ipevs2EduI/DsmIB+jaxhAEHscb+pWC7Ah1j7jhMmVCBfvX0/2f2BNn?=
 =?us-ascii?Q?qoAwv64YALCqVY8Tsct9HdXJQ7wy3ekJxqNQfGDDA2u9XmOvFtbX8PimbJy6?=
 =?us-ascii?Q?6wLlBLqKQLXLZd0qSqCC2qQRe5v3fiMi+vaiDKCGZTAWPkR8t9xISv5wx3zw?=
 =?us-ascii?Q?3KHtb9IE6D02Ljo8vg489FrsT4uNRYedAg2XwlykfjIUWakEF3ZKoxqR3jIf?=
 =?us-ascii?Q?0Z0uqCbdqeY7JRF3H49X1QAfV5eMT7k8i7Sf7tFz5I8QIU2lFv5T1zcPb+6I?=
 =?us-ascii?Q?xPiTu6ffVCbkGJlrgrk6mYFwL32O8EdYj0y4VhwJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b01447a-636a-4e9a-cc8e-08db20b565c0
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:46:07.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CizcRvCa2cdGYaC+Eg+4TC2cJBNL5RsdNkaJnXC2N1VoNtCF9l4AwMfcu54gb+q5hB5XS9li7tILLTA6ndUW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 11:06:25AM +0100, Andi Shyti wrote:
> On Thu, Mar 09, 2023 at 10:41:05AM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Mar 09, 2023 at 05:31:44PM +0800, Ye, Xiang wrote:
> > > On Thu, Mar 09, 2023 at 08:52:24AM +0100, Greg Kroah-Hartman wrote:
> > > > On Thu, Mar 09, 2023 at 03:10:56PM +0800, Ye Xiang wrote:
> > > > > +static int ljca_mng_get_version(struct ljca_stub *stub, char *buf)
> > > > > +{
> > > > > +	struct fw_version version = {};
> > > > > +	unsigned int len = sizeof(version);
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = ljca_stub_write(stub, LJCA_MNG_GET_VERSION, NULL, 0, &version, &len, true,
> > > > > +			      LJCA_USB_WRITE_ACK_TIMEOUT_MS);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	if (len != sizeof(version)) {
> > > > > +		dev_err(&stub->intf->dev, "get version failed, len:%d\n", len);
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +
> > > > > +	return sysfs_emit(buf, "%d.%d.%d.%d\n", version.major, version.minor,
> > > > > +			  le16_to_cpu(version.patch), le16_to_cpu(version.build));
> > > > > +}
> > > > 
> > > > You have sysfs files, yet no Documentation/ABI/ entries?  That's not
> > > > allowed, you know this :(
> > > The Documentation/ABI/ entries is added for the sysfs on patch 5 of this series.
> > > https://patchwork.kernel.org/project/linux-usb/patch/20230309071100.2856899-6-xiang.ye@intel.com/
> > 
> > Ah, missed that, sorry.
> > 
> > > > 
> > > > > +static ssize_t cmd_store(struct device *dev, struct device_attribute *attr, const char *buf,
> > > > > +			 size_t count)
> > > > > +{
> > > > > +	struct usb_interface *intf = to_usb_interface(dev);
> > > > > +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> > > > > +	struct ljca_stub *mng_stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
> > > > > +	struct ljca_stub *diag_stub = ljca_stub_find(ljca_dev, LJCA_DIAG_STUB);
> > > > > +
> > > > > +	if (sysfs_streq(buf, "dfu"))
> > > > > +		ljca_mng_set_dfu_mode(mng_stub);
> > > > > +	else if (sysfs_streq(buf, "debug"))
> > > > > +		ljca_diag_set_trace_level(diag_stub, 3);
> > > > 
> > > > Sorry, but no, you can't do this in a sysfs file.
> > > Do you mean that we can't use sysfs to send "debug" command to device?
> > 
> > That is correct, use the kernel-wide debugging facilities that we have
> > for this NEVER create your own custom interface just for one tiny
> > driver, that is not allowed.
> > 
> > > Could you provide some detail or hints?
> > 
> > dev_dbg().
But, this command is sent to SET LJCA Firmware logging level.
> 
> I'm not sure this is the same thing, though, as it's not a drvier
> to user debug message.
> 
> Ye, can you please explain better what this command does? You are
> sending a LJCA_DIAG_SET_TRACE_LEVEL command to the device with a
> parameter "3" which has a meaining only for you :)
Sure, the LJCA_DIAG_SET_TRACE_LEVEL command is used to set LJCA FW
logging level. 3 means debug level for FW. It is used for LJCA FW
debugging: when FW got some issue, we can send debug level to FW
to make FW print degging log for analysis.
> 
> What is ugly here is the parsing of "dfu" and "debug", I would
> just make different boolean files, something like:
> 
>  echo 1 > ljca_dfu
>  echo 0 > ljca_dfu
> 
> and
> 
>  echo N > ljca_trace_level
> 
> with a proper documentation of the trace levels.
> 
> The show counterparast can provide a feedback on how the
> interfaces are set rather than providing some help message, which
> is not what sysfs files are meant for.
> 
> Would this work?
Thanks. It should works, and I will try it.


--
Thanks
Ye Xiang
