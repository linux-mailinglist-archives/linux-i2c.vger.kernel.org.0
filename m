Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD85C6B398E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 10:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjCJJDo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 04:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbjCJJDF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 04:03:05 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE10518A98;
        Fri, 10 Mar 2023 00:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678438774; x=1709974774;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=d/oi3XyOKtPZjsYXqpTAq59DUZlmQCxPAfpvtSEh3VE=;
  b=HmrejY3T2uEnA9hTAKHcLMDALewZRmwzJcAvkDfG87aPm6kqpHBXeD48
   i1xk6lJ+TT7hUo9senRXC+9/s+1+KilkqGBXN1simXqLmVcq6ijERIXWU
   Bfq3tnb2jxNEcujsKC+Vx8kHr21B8bSq9MHdF9HeULubiS4UQFO8cSxfZ
   b9vX9A5vTEsgroMt0VbjUu6kPpx+dBOq0QfL4RRXgnqm0V+Ra6cMP8GoQ
   2IXu180y/nRatOON+A6eKGQtV/GtNKuC4UC8o/+SfnlUakexDXiNeDYhA
   qiKKhfEA9Hfae0JEFYdV9UwADA+018CGXaak2+fIMYYFMGNeKn1f065bD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="338237570"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="338237570"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 00:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677733157"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="677733157"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 00:59:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 00:59:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 00:59:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 00:59:32 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 00:59:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq8DQ+kl//32cA0ssCaonebpdrKeYfKYY6pFIOkEqBeKMKb9UtYA+tsfwALBAGOvpxroFURg96LKKnCn7pcdthNnlexVtebxNxM2c2S5QatDXMYupJORMTYKJknQrX41FpJ8PkLCEEGrB2Bs3PqQJijKsbL3wzBuXYC7Cjw2tcWQR177IrUc91Xov+pGotZZQchQtOQEgYMuhjgQRCC+VbYYNBvMJXncQ9Liy8Pfs/fmofdHqkfFQZCmuPb64LxcKKHMgS+S4Tyk3gTsZEYhbWzRdoFEXAOtwXBH6e0n1J16v83gjTwxutL5j6cE2glV6v5DQ0B/K/DV2kNq8uohWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAChJFX5mGv18vYBKoR3pipkuQUlQCw/ybqmaGG7g3M=;
 b=k2QHrEHgpaMLmO/gaw3fVM5uvIOQp9m0fCpw1uFOAiZC/1Yj4nQ1ROPllE7jLwxBQvN5qtJZLR+VNP4nSCcoMZoxYisPU7hS35qk9/oqVVmHD3JwjkQjdv1tTYuxU++tohJ2fbBoS+3ioccpHyAQ2IHkZoUIH42jzG5DkbSNBkyV8t4loi1+H0xRA/+6OWYbtIhYlcmsSt2MWXso7svxJKFeRXTDLVQTRR08pvTtctUaVSSwZwGojSwS9+zBeNdpW0T2IpKXoVlJanHTo1kOI5agn60sy7qkS9ybMTGq6J2BTRAQigfxs3HncZxqBL8US3O0XrfX2GNVwNc8uWZ9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.16; Fri, 10 Mar 2023 08:59:26 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 08:59:25 +0000
Date:   Fri, 10 Mar 2023 16:59:17 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Oliver Neukum <oneukum@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        "Matthias Kaehlcke" <mka@chromium.org>, Lee Jones <lee@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
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
Subject: Re: [PATCH v4 2/5] gpio: Add support for Intel LJCA USB GPIO driver
Message-ID: <ZArxZZfnlqj6RsGC@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-3-xiang.ye@intel.com>
 <2865f3d0-428b-0df1-fc50-f6af3cb9dac3@suse.com>
 <ZAqyhXt9nNIE9Ej7@ye-NUC7i7DNHE>
 <ZArYCD0r6n0sJ7LI@kroah.com>
 <ZArem5MwWrgOY2nJ@ye-NUC7i7DNHE>
 <ZArh5iMkdj0L9AXZ@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZArh5iMkdj0L9AXZ@kroah.com>
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DM5PR11MB1418.namprd11.prod.outlook.com
 (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|DS0PR11MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 3324deab-42a9-434c-c873-08db2145bf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38UEnU5VDrx+iW63XUNlt3mQ9jEU+u8qhfvUW7Gm1B+1XJSUZmwSzwIGdPn5GJyJQgzOWmxxnCj0xzoxqj/SjgqExctmahpEEuE2mkBjW5d8xPTulm0ppPkHXiuF0ywc8NYlSiQ8hW1GMwbHw9TBGIAEMC91IQeGdX1BWLbduPDg/+VYechxq2eKjtFx+nJ3K6frFHayxBVfapAfKmLXdRFnbelyWiKnVETZW6lZhKdkFs2IC0eEGhBpTZIqOzOr9QX2p1uuAxWD90/JY7BjWRAwI+sQ2/+UDcXFRafiuSqHr8R6F+wxJH0p/tBW2DDU6NUFlrX8I16gZFLlfnTtWTrT5rJyAmPLraLmOsH7VuNdqUUe04SB4Euc0uc471401EXF2jj5HN3U48AqoZS0LcA5/C48vj3sFzkStqCPHxhP3MouWgF+r9RIlYP/JARkOdfHHQhn/GfOW5Ynv4JFKMrrBbIHjflmmKp/NnIYp+wpTDSVAqerTuLs1xn+PT0b4Y/WKJWLka7fA6K36WBDzAID/Cfrs8ezJIR/lyeKZ2teKdfxRyGgngGCzTadHcI3UG0cu1BDnBft1JyPSELadA8hv/pHa6lt+mrON7a9KBmiTldpFG+xjx3iKHMiuWxAvELrWOiccJI8CiA40H4q5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(2906002)(6486002)(9686003)(38100700002)(53546011)(186003)(6666004)(26005)(6512007)(6506007)(83380400001)(86362001)(41300700001)(66946007)(66556008)(66476007)(33716001)(4326008)(8676002)(478600001)(54906003)(7416002)(6916009)(316002)(82960400001)(8936002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k4ZTMl/0GekHQUcIEjCbhBXQNWExK74YXzzFVZ38SgrtbNDY00k7Uiiua2a5?=
 =?us-ascii?Q?I+obK1/tgB/xrUXySvsMK5wPcGiRvc+p8SYlveQqERUlwViiy1rtB284TeGa?=
 =?us-ascii?Q?jmgr0rlXdeK22Z3D4QAqxaFqEimLRRndsCnQfZkbyHVSEp1JP/MFh7p0ND5p?=
 =?us-ascii?Q?jf3bKoi+tMmJOnJQO3lbz+pbJl70+UuZm+SHLYpgcoKNkVuagDmYtqAflGxi?=
 =?us-ascii?Q?wtnobAXE82iBKwA5n57HV32KAf7kFBQLBoTtUadZES2OvFwwjN53Lg80a2Ls?=
 =?us-ascii?Q?89gC6xmB1dNUBsv2BqNrfeC8ASFYY4xj82W+oiB8UApVYQYZABnkRw/eisH1?=
 =?us-ascii?Q?pcW+YG4CDTbuQusyi8oVxNUoKRzv1YTkZeJiJxXvqFpj78FS5ElgJ67QnaNL?=
 =?us-ascii?Q?KvJwBKzHMQX3QV7GQSCt26GlrenCQxbPOMIs/OMnwJugNnCzX2PUEVxTOpnj?=
 =?us-ascii?Q?m6N9vdFWQsn+E3z+trGhOXak/mY74YHAjjbyGpFbr3iPC0726eK3lLVQjPWD?=
 =?us-ascii?Q?Wwd/BT4QWJ3xNFHUcRaY0h10CIDijLSOY0lYv9BPN202O7UqyoLmUlkvYw9c?=
 =?us-ascii?Q?iVx+Is0W2XgAL6L+3f9eY3qdA0qVveEzva4fNNlE0JUltB+LslzpaRaWzY+5?=
 =?us-ascii?Q?u+o137+5iBgNmej3GNijefZrCtIebfIdebv/SZuVMHllaK5Enm2HeRpHTRik?=
 =?us-ascii?Q?pmRmPoxla33obl+HplTsaRVdO1pf3ZAsL02Cn9rRe21SL0DD3bEPA0tGwmjc?=
 =?us-ascii?Q?nG6T139mPMH0tD338ug/1y4jtw2aQ//VK9sA0DH8oohjhBP6yIylU5RRmWt0?=
 =?us-ascii?Q?u8cSfkvFTHp6mvyZkk2N1y2FeI7hqqUKcJLuwT68+lwqYkly7GJPbLBNaVvI?=
 =?us-ascii?Q?n0kSzrOr8HaYHuL0FdRpATzzVPU/g9xCUpIKbs+DEIIS+xJ9NdckdL8VAZX7?=
 =?us-ascii?Q?bqVctbGx+NnXkxh16lIqsN5hWAVM6Vsy4ivNBCCeV7zHdLeSDW7vkWaOHeFz?=
 =?us-ascii?Q?E4MCldrZBeMBZJFSnD5f0NNJfKgh/5xL42GEZqic7uqWCrq+l9I3GLqC7KAc?=
 =?us-ascii?Q?BTCkkuZZYYHVguE9kcMa7zvAGT81dsSwp1X1cfxX/eTmG2cEdEg86qVxAs2M?=
 =?us-ascii?Q?n96TwiJguRoL9UfzjH8Uo+yE3QwHf7kAopteAEgtX8nvRFwS4XB3BWizhuAx?=
 =?us-ascii?Q?zxbsoEEeM5r/ORbVJCs9+Y5Cdq6l4vlECTrQOHzPkl5+kOP4w8+O+uDITPSX?=
 =?us-ascii?Q?gk28TVfs5tv/6i6L2orvJZTeM7XzbyYSAsgN+2gASE4ljIsu5lrkLYO48V1A?=
 =?us-ascii?Q?62BfgzQraEKgYw2iP36dJTx/AQaGtv9Kts7F+0haxeyB1lsX8YHzM1/JizzU?=
 =?us-ascii?Q?CowSZ65QUQJgDS+3mwcsZDWwUFpjsDQw0i6p8SCwBmQF1ILQJlOmzvojLPjV?=
 =?us-ascii?Q?kGzb2lKIzVwU9g/KYNrp+5+LUtAOho85lr5j6oMCiA3iBz2kNr+SsDqkJnpt?=
 =?us-ascii?Q?X4HcZi7HW4ENVZpmPNuwTxwmBLm30pYupCl3FJgFr8iTdbJmxGSSMQWyNJaN?=
 =?us-ascii?Q?V9BJ92Ifvn3s4Z0red0g+aHDeQGLO0bK3lgpMRQE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3324deab-42a9-434c-c873-08db2145bf99
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:59:25.6543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXTxBeS3CilxQqhKnMnSlBNQXNCb93PN1/YpV85zKAJf6uAr5c2UxISx3Ho2t730IeaFG2+IovO/LvnLcR68dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
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

On Fri, Mar 10, 2023 at 08:53:10AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 10, 2023 at 03:39:07PM +0800, Ye, Xiang wrote:
> > On Fri, Mar 10, 2023 at 08:11:04AM +0100, Greg Kroah-Hartman wrote:
> > > On Fri, Mar 10, 2023 at 01:01:11PM +0800, Ye, Xiang wrote:
> > > > On Thu, Mar 09, 2023 at 02:40:10PM +0100, Oliver Neukum wrote:
> > > > > 
> > > > > 
> > > > > On 09.03.23 08:10, Ye Xiang wrote:
> > > > > 
> > > > > > +#define LJCA_GPIO_BUF_SIZE 60
> > > > > > +struct ljca_gpio_dev {
> > > > > > +	struct platform_device *pdev;
> > > > > > +	struct gpio_chip gc;
> > > > > > +	struct ljca_gpio_info *gpio_info;
> > > > > > +	DECLARE_BITMAP(unmasked_irqs, LJCA_MAX_GPIO_NUM);
> > > > > > +	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
> > > > > > +	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
> > > > > > +	u8 *connect_mode;
> > > > > > +	/* mutex to protect irq bus */
> > > > > > +	struct mutex irq_lock;
> > > > > > +	struct work_struct work;
> > > > > > +	/* lock to protect package transfer to Hardware */
> > > > > > +	struct mutex trans_lock;
> > > > > > +
> > > > > > +	u8 obuf[LJCA_GPIO_BUF_SIZE];
> > > > > > +	u8 ibuf[LJCA_GPIO_BUF_SIZE];
> > > > > 
> > > > > And here we have a violation of DMA coherency rules.
> > > > > Basically you cannot embed buffers into other data structures
> > > > > if they can be subject to DMA.
> > > > But obuf and ibuf does not used to do DMA transfer here.
> > > > It is actually copied from or to ljca buffer to do URB transfer.
> > > 
> > > urb transfers _ARE_ DMA transfers.
> > > 
> > > > Should it still need to follow the DMA coherency rules?
> > > 
> > > Yes, all buffers for USB urbs are required to follow those rules.
> > But these two buffers are not used to do USB urb transfer directly.
> > For the "u8 obuf[LJCA_GPIO_BUF_SIZE]",  it will be copied to ljca buffer
> > ("header->data" as below code [1] showed) first. Then the "header" is used
> > to do the actual urb transfer.
> > 
> > And the "header" is allocated by using kmalloc. It should has met the DMA
> > coherency rules.
> > 
> > [1] """
> > struct ljca_msg *header;
> > ...
> > header = kmalloc(msg_len, GFP_KERNEL);
> > if (!header)
> > 	return -ENOMEM;
> 
> Ok, that's good, but why have 2 buffers for this then?
"u8 obuf[LJCA_GPIO_BUF_SIZE]" is used as a out buffer of LJCA GPIO
package.
"u8 ibuf[LJCA_GPIO_BUF_SIZE]" is used as a in buffer of LJCA GPIO
package.

Both obuf and ibuf here are not used to do URB transfer directly.

This obuf and ibuf somtimes are using at the same time when calling
ljca_transfer. So we need these two buffers.

--
Thanks
Ye Xiang
