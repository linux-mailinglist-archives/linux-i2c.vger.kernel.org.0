Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67046C706A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 19:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjCWSo3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 14:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjCWSo1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 14:44:27 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B8FFF08;
        Thu, 23 Mar 2023 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679597066; x=1711133066;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8USGPqYqLAceTKRm5yIx/FvVwyWB76zyzgXWkX5VjRE=;
  b=QVG9UUn3oW/Sh7g6rJrT6pnbbTU3aOGKeMlZ1e23V6To1dRUHssr15/X
   V781Tm0N7cF658VDtesKmG8N0AlK1Uw1EddcVicwYwkGDrMu56iB6zxKH
   vqNeHHgqYuGGL+4lyTHrkAIvO4LG0sidhlA2/qNnr+T0NLpsAlkUp+2/B
   jhwFhVR6wxPp2Qn14ninp20RyRpodmf5MMamj8CtEujDTeRVPNWxHnF0h
   L5AjyLnFef2QQ1AS77Yv3CnOsc9aUoRBeIMr8hUyleDSgtFRC7/GP9Tdg
   Lmg7mtzLVEJfvL+KXai4FknIgBHwpoqlg6jt18cCuDcd6D/S7sKMAn5/2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367328659"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="367328659"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 11:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="751601839"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="751601839"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2023 11:44:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 11:44:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 11:44:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 11:44:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 11:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E90v8at+hbHkkcqCBPmQrOBYW6HjkfJInhRYPORDpDHIGevR63hm+8dP0abvn3BaIbU0pg6Yu2nQVTiLgAFs0c16/sMOMvbxFrkjc+w3eK8+4RCE8P84Z+mmYfikl+hVOJjA95WUvAngkr/nyl/iWPudjTHBrj+oo90EmksujRxp/n9qZtP2yi17/bgeTGF3Z0D+B46Qk4HFL0fQMo76dOi+cPkiXfx0do6VVIEeWrg8r1c1HT5zylxTIodaJ5ECRbubmdhkEhrpse1Efs2IV0PErFQsHPGsWXl75H/RC20JdomvsIxel8exfggd7HCh5VLv5bHEPsRL/IsQxqnN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nSaL7ZjJK8TXzpR+ZzcJsMXtrrhM8g0H99pzVtnaeQ=;
 b=MQC20pCOltdpR365LwAxH5XMo9GtQGF3CS//NBt6o4fj161i2FVslp2j/0zZ8k4siHgY3sCFnMP/Yy7Nn3eA3Pc8d+h4laChKgHLg0d836U01WpIkNjWfbv/pwL8EpiLBm2BdWXMnhSHW/oZ9WKQBH6mXVGjItWkIjO8oliqcdGz9sQ3SN7foB0XvuqM2meodu4wRNPuRJDAi7p812D/K1w4Z4PHDanfkH5VH+oEO6zxGERwHtmoKmJI94DFeFy13KvNFPKY6RZ2wTnTBWbIO+siJFU2q0hnm6HAJzUSOmA0GHucw1vPh1PqEzAHT+VuzrKORHh4WbcJ3D0g2SjVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DM8PR11MB5591.namprd11.prod.outlook.com (2603:10b6:8:38::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Thu, 23 Mar 2023 18:44:24 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 18:44:23 +0000
Date:   Fri, 24 Mar 2023 02:44:20 +0800
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
Subject: Re: [PATCH v6 1/6] usb: Add support for Intel LJCA device
Message-ID: <ZByeBLrNIX8cWO4u@ye-NUC7i7DNHE>
References: <20230323172113.1231050-1-xiang.ye@intel.com>
 <20230323172113.1231050-2-xiang.ye@intel.com>
 <ZByU4tbhkhnF4kMw@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZByU4tbhkhnF4kMw@kroah.com>
X-ClientProxiedBy: SG2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096::20) To
 DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DM8PR11MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: c1adc6a3-9787-4dc9-1b90-08db2bce9f10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pz7dM0rjpO5j8KKub4ZYFgLwXzLkiJQdAkk5ZC/tPj9lJsQ+0OX80RwSHQG6ComZrZh8gLjCSbUuDBaJj4z2WC4nuVTop2z+bYow2xyFfiqXTvyumToCX+7+UXgoODrewB+VBmEdRlowHFtds0K4jAgKdDTeRZI2j8JiuYtrzWZMXySPAuQsE9iU4Mgd6JwU5ondPrDyJpJtBmKN0lRI3pHjSFx/aOIADKnYQK9+zjhS5wdjHaqjoBjQ6aC1MeoFUvyse5smxCbIJChBikkty9+uoWpu+Pkp6FAz+sVMfOmF/w5VzkIZ/Xa5YeMe0c4JIPN6na/K+dvqwkOtvpD3M43esMvv9QiNH9k+K6YsmpSKSESt+iWYJ3tkdTHP9GPozgu3hDK3S8h5g1WHpucZrh4VOf3SR4bDpVs+ePi397SAooPeeSc6gqCxY3+9edVvlWrDBe/bHeEXRqHen3+vvRRsF7+itPY0g7FJfaeR4NL+upLC0qmm/v4SY5jV5qztZi8L3vaHnDVKjSOJx6IEhk87ySHVpmE2ejljDxIO1jIwStTq5IwJFy5Tblh4sBgJUEO2CiNHv5STZTC3z8C6gcJ3OQ841OeZLtuAPLOozRWemKNP4mwZ6SNoB51JSrhXK35sBFhdXFrDZLdu6WvUqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199018)(8936002)(66946007)(66476007)(66556008)(41300700001)(4326008)(6916009)(8676002)(86362001)(38100700002)(6512007)(6506007)(9686003)(26005)(83380400001)(186003)(33716001)(316002)(478600001)(6486002)(54906003)(5660300002)(82960400001)(2906002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dNY93k/dWlNJ677rj7NcecpT4eLqMTmFssYStQB+GKUyuV6yVCkIgH0Mqs7V?=
 =?us-ascii?Q?7yfvIJxbTx7JL2ZyHf5m84u5hNiS03ewvJXFBHPBeSGGaaA7H8cjfjjiiREM?=
 =?us-ascii?Q?Jpl65ULUlToAUtZI+STkmyH7XyrFYirXbFTsTdBFkd/6JDZ0K9PrHiKBazmR?=
 =?us-ascii?Q?ACg9+pUtDlGfcC96Xz0sVLXvpD1JKRcwOq364LmtWLe59JE/50HTfuTmQbLu?=
 =?us-ascii?Q?j9LFVT49ae0QGBSTXzEUl/MCSuRFxCQLozPxoCGrl/ebRhfHSvZFFa4rmKor?=
 =?us-ascii?Q?i4zVIKHy3qoT8s0yCT/eGUBkh/Qvodf7YtreA2S3XeFUW+OnJNoF7RiJMSj7?=
 =?us-ascii?Q?jWcAxVSlVqL1EcReWWZ4YVHapC77s1ndyuwRbsWn8bVCXxPAqVdetunkNrLL?=
 =?us-ascii?Q?U6FgjOv0eMDC3SSLeANBm34j+QQY4RKKEnQxTPhSmvHZeUTcWjF9C5393JA7?=
 =?us-ascii?Q?dkiDJJxDRNHh42e/e5kTDpnIYWxTtXLzyfz9ND9DT/kphh1m6t4vG1j9UXYN?=
 =?us-ascii?Q?7NgRVwiRcOimu+TtsRQKJrWBtu8xJE9+YTEB82wT2PpEm4Wjcb8tRxM9VNlE?=
 =?us-ascii?Q?H0+IQ6aL/mOMlwJ3TW9rKxC5MBMjveR2HAbJDwC/VLtRlAbQuX+N8gy6bhPy?=
 =?us-ascii?Q?Y2bE6TVbZrGqg+I5ihhivLeiQ5OOF6CpSm2t1EG1Zz5zqI4jqyMiM0u/RMWK?=
 =?us-ascii?Q?Nxxiaoo3FK9omIGJ49AbBvY8uONb9q8jrTgBdqHMXc/V/VRyzUfU87q2QOZ7?=
 =?us-ascii?Q?N7PH9cZIsmgsMAj47SPuK+cJwSSpSu0BCGWY0B61rqE1rTy8D8bKbzjZUX/k?=
 =?us-ascii?Q?x09IOPBgFf4RXkmJhJws9EvUScnLoCiW4hD36n9Q3GTTui3CnppjfEj9N/tm?=
 =?us-ascii?Q?egpv7be7xZ6wKqkUE22F/xYaPqxc3p2MK1iqnzBld5w8lNjatTvQTkyv467w?=
 =?us-ascii?Q?/Ho0J+VMV9uzmGdav9wkpfku2sG3ht+cQ/goiqoF/9rM3Cw2k2w2EWG8aW5H?=
 =?us-ascii?Q?oJWFHjaRwWA1qBWqWtgbyaoQhkemoZ0cP1JqfydMYQGG6GNSzOuVBS8I0R81?=
 =?us-ascii?Q?dMdMBQOC7vWUOXWn1BAnovKo+yfvqIoq/2C+z7fzfR+XShR9BdpoZn8r0GdD?=
 =?us-ascii?Q?Sy4DoY+MSoyn2e9e/oQN07VtB5GKZhzWAEXSG3eoQVFpdwq811Ms1NUiWtan?=
 =?us-ascii?Q?/FSvvwgZ1IaGZQPCf8nAY9PcPQCVlQmgo+g5FngJrP+1qeDEW5Bd9B34RCEH?=
 =?us-ascii?Q?Sss29oz7huGvIJRZoZP2qjfJN5MsHWXktYe8ww3bNnKvuBRfrqFlx2GkXy0/?=
 =?us-ascii?Q?sgIYy+8M1RkghiApR5bvOUyHH9NBFpeu+jP5rduXVzOOk6IyiQTFoT5OlgLA?=
 =?us-ascii?Q?Rou6WgIZybZryoBZc0UF5fmqehFq0nHRmfUMqdo+o28RQnr0314Fj8cC9ZAG?=
 =?us-ascii?Q?V14RzBu5p2WWg+OwqiS+aO1zPOXhtiq+8vBqZdmN6BeWkmkujkCLvfY76UM0?=
 =?us-ascii?Q?C7HJQEEyj47xpEYCbUxMNMgRsFTubZ7IuJyh1dp8EwcyTr3UfItSnv00ca+F?=
 =?us-ascii?Q?61RE34QYr7XPMHrJC71e8IMXAVxm+BD+YyxpnkZk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1adc6a3-9787-4dc9-1b90-08db2bce9f10
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 18:44:23.8072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMXamm3s8fPNk5oD/lchWQHwnnKDGugvGAYbrGR3YTpZ3pIZxfBsT+jF6+YR2IXVKsy8LTUhEMCGJI5tIsnWXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5591
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,

Thanks for your review.
On Thu, Mar 23, 2023 at 07:05:22PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 24, 2023 at 01:21:08AM +0800, Ye Xiang wrote:
> > +config USB_LJCA
> > +	tristate "Intel La Jolla Cove Adapter support"
> > +	select AUXILIARY_BUS
> > +	depends on USB
> > +	help
> > +	  This adds support for Intel La Jolla Cove USB-I2C/SPI/GPIO
> > +	  Master Adapter (LJCA). Additional drivers such as I2C_LJCA,
> > +	  GPIO_LJCA and SPI_LJCA must be enabled in order to use the
> > +	  functionality of the device.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called ljca.
> 
> That's a very generic name for a USB driver, why not "usb_ljca"?
Thanks for the suggestion. Will adopt it on next version.
> 
> > +struct ljca_dev {
> > +	struct usb_device *udev;
> 
> You didn't remove this like you said you would :(
Sorry. I just stopped using it, but I forgot to delete it in struct ljca_dev.
The udev field is unused in this driver now. I will definitely delete
it on next version.

--
Thanks
Ye Xiang

