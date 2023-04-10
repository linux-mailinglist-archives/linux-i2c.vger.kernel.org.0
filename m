Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972E36DC507
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Apr 2023 11:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjDJJWr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Apr 2023 05:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjDJJWq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Apr 2023 05:22:46 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590D83A85;
        Mon, 10 Apr 2023 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681118565; x=1712654565;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vixb6IPmiIMsYkwf0NoabEj/JLj68xiEa0sfF8yIvb0=;
  b=aoBAXSRXqDKWK2ke2CXWw4rdFVhOOexEbVKLoHBqHk9iRa2B0FcISQ5n
   iQdo9ax8Z42EsB05yVWVzFWIND47SoNikG8Gj+RimAXHYAjHH+x1stQ1y
   QuCRb2czqtCR6OHfJDMO4HdPkcVrN4HbZv8bDF9zuqAgtqHU1uAmTJ8Gi
   xGZ8DOXIA8MrBN/jrbQnbP2vw6pX4JJG/vr0Q/qjgIzm8hdUr3HdJN7lL
   Bae/Bm3cJZ+uRLbSkwnC9Ps6WwlFo60rMoVTBNnKh9QcJd03ve3BjXXX/
   0B9g6jnswwLNvtQXN5aKwoRcTw4tDNFy+dy0r+7tlE2Qt6EECAjCDMJrp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="327414176"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="327414176"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 02:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="934289970"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="934289970"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 10 Apr 2023 02:22:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 02:22:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 02:22:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 02:22:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO2vjVwdFBjV53jxDXDGo6GYENUDU1oXi8H77LiwpJLAjkrA9Kuo83ose4mSS/zSZ4+jYfW3sYTDU1Yg4D8kGuHr68Gilu+HIBPHKAQ7dzE8aWGj6zR15h/i2QnvXsFIB5eisIDmVF0yqmZH8cG2j5I4QPnLUalYjASK6nvjH/tU8+lbsuL4hIXk2Kr53faVPDZjNSngPHzVrF9vF6E8Y8Yg+Flx4qFTkQJ1g2jWlOZSmp/paF8v/0Ni9CpwSVBe1qCL3gFWOY+ZzILU0Ga72fpYWwDv7pPHj7pru0iup/5K2zZFkxb+UXGSPDcus3Vp7PYxLlpMYpTZAJdfELpsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Caa5G72Rs9z+8lRTegtBzTFxTOjgQVU8s/eEIohIrGk=;
 b=IJN0v3ylndCcOSu3e8RY752s0jqLUCdeHdhCm4uOnDxsSA0zKv8taI8GcLXkY6k4QIZWdHgtdaqpmDuxoYxjq7IDf5LiUT+KEqXQUYlwSrEgZSw5dkfMc/q1H6D54tzChbPlLXbBTPOIXDnwGM/7woQQJEo7WRGHKlVTCXlBzsPoGB121r7e/Ee0ejYEJm7sYxBa3R3bkAM9sXvenzKD9aGfG5cZiaqg6k3zgKOigaCfJeDJA+PN4KIK1gHtpOaLdki33MkrWUja0YN7eaCQ3+IJWTGrArfounlutiFJkPHLxaKbHQedxtz2ov2tS98ryE9W4Gsg1p2j7UqagLdMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 09:22:41 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::3d44:4cb0:ccca:2afd]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::3d44:4cb0:ccca:2afd%7]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 09:22:40 +0000
Date:   Mon, 10 Apr 2023 17:22:40 +0800
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
Subject: Re: [PATCH v6 5/6] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZDPVYEHSI3ud27rN@ye-NUC7i7DNHE>
References: <20230323172113.1231050-1-xiang.ye@intel.com>
 <20230323172113.1231050-6-xiang.ye@intel.com>
 <20230326153846.zo77mbgti2injnxl@intel.intel>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230326153846.zo77mbgti2injnxl@intel.intel>
X-ClientProxiedBy: SG2PR06CA0191.apcprd06.prod.outlook.com (2603:1096:4:1::23)
 To DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: ec62e962-233f-4501-b2ac-08db39a52144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJxiiXk8iOTuQjbBTtrWcfxqx0y8KBO23Vf1rBxq4RDHBUIQtGoEsrc0krsB6c5ptK2vEUiUCKphUoullsQcyyPwW6HE7Bncg/wgtnWrYfVHufEeXLBkfQZX9A0AwUue8a6SCCig3M2QGtYaJYHGz9DT/oXcvTWd0H9zm3kUcxIdFJgNfGZIlvw9Hn2SewQCBIMh+4mOE6FkGEZDd0ntfWmLBALsi3ECV3yw126rp2FhqRrBOFJWHz+uHUbvNB+fsoc+uWZiqXaQXLXlYLlTHtNXlNaPhbiegfAUW1+aO4zO2jL1WWXuSNuOJd7h+KyPawHSqvqmCW/23IlINPn8Zd+rz67cf7phRe/GrFIoeYZOpXTsFz4n21oKnntLa7C+EF+vpne/5cNaNol2QcCc5YPtU4sKsGkyGCzaS96SYL6aA1MTg8J1zf6nLIF8N3Ja/QAMNPsfYvg8ab/zm1jbVv3URneRTBzq3LmgqbwdE8wuaLz0DNNvIbMcQmfMQKz2cKHBAl3I6p4/R2HhQI53Ke1/Xv3fb+tADi9cbmX8nwGknMl2JMOmV0okI4Awa5NigoV5yZ2446I31COZil5iP3Asv25fFD7C3h5+WMHWXxWNr5pLK4w0/KE+B0P5zerM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(8936002)(7416002)(6486002)(5660300002)(86362001)(66556008)(66476007)(66946007)(8676002)(6916009)(4326008)(33716001)(478600001)(38100700002)(316002)(82960400001)(54906003)(2906002)(6512007)(6506007)(9686003)(26005)(186003)(41300700001)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0VJLG1G3595V0EskCzH/UCajt3cSR/M6Gc3axV/ScdnJDJijt+Sfg7OBKX6?=
 =?us-ascii?Q?yvcW1DMxNPJEVSX7M97auvH8xZ60qFub+DiSU39FAEjts7lh/VHgme8WzT9s?=
 =?us-ascii?Q?5pOMctyTEAWNfGIqSvAq9F7iHeXteoeo+uDKEhB25lQK5tXdFuj+yLeBUcIW?=
 =?us-ascii?Q?NwHj67Yi8OPEkrQ99ls5RbHQoRpLkGbtcVYdKh5o1hSvBnyUfxq5bbvV3bcl?=
 =?us-ascii?Q?zwj10elW+pQVCJ6JqqtaKjOsiiVHQYHTfC8TsZJFiDd5A2gIRJnBe1yf/Y7e?=
 =?us-ascii?Q?Vp2JhzZ96rQjEH1+cVFVKPm9m111F/tkfCV2uOWoGaUSXhFn/rSrcvczh/Dv?=
 =?us-ascii?Q?359yYeecWilwx9IhiLzULUGxdkU3lu+HQV9jE1Y8q7T1XUNg4DX9vXrDE1eN?=
 =?us-ascii?Q?LWqz7f/eWC1LrnIo+ASdhbw8e4KJkgRVjLJjUZ2+2Ma/RKulD89eY0FJRX5R?=
 =?us-ascii?Q?YLVajyaizTUB6MtMZUx3Wh5kaOgw8xFOypWy6Kri5mIRtPt/fH5gM3jjFjq8?=
 =?us-ascii?Q?8HdZ++K2pRfezGcg5uQi3kChFArIRz7fIKdJhN++WwvVSrxhzgIDYvBXwL7R?=
 =?us-ascii?Q?4Oz/xEi8iZM/Yya16z2wvQ3pH2yS2qrnU8F5aYyS5gkibRUvnaIiaT+60Vp8?=
 =?us-ascii?Q?Qx1VYHeVFfM23HZDsuk0VEq3+JRQdP1FBBRpEBJDC2SI2QvOMPjOga8oOSVB?=
 =?us-ascii?Q?NERaRKZSr9XhGcLVWlu1Kdz+cmxcC9w6ptkNVdUecW9omZOYOO+0WSj4+S7j?=
 =?us-ascii?Q?EHUYX3uNlp3F3YbzzFH5g7YTuhJeOlrZ+BO4aHiIqxYSk9cBN+Cl4UVndiCc?=
 =?us-ascii?Q?JcZ7GtsOYiK633a6Gvfsg3B3Y9zZCsWMADKsGYaLHm0l9UDydRvg0waitQKX?=
 =?us-ascii?Q?gzZIQqBXb6dH2antarNbyEe0l6jDxopAUo+fx2Q+l+W9fuYaHcbC8X4l3XNE?=
 =?us-ascii?Q?H08S9689PRVyJkmNulsqwnkKLwYictfPPtybg0Np34gl5wWqoS2/enKUYBo8?=
 =?us-ascii?Q?i5NLvdBOHE8au9Qap0eXeHZRFuMoBlqYnaR3La8+T7oydNV5YxLQz2aFelJP?=
 =?us-ascii?Q?ygz9ZRaMGYae8lga5cHASC/oJbCyNuJAdJd9lHQvsVJT/hsuFQjP+Q+kVRfh?=
 =?us-ascii?Q?ymi1zGeiw+XB/DkZE1IqXIpe+1hjJQSLh9Qec+Pn7vm5VlWiyc/Ce1qKgzfy?=
 =?us-ascii?Q?Th0nH5fR7zV4JwzlwLYxHHMhqfe9JtgrBANy1QMNloAh84d85S2jg5yEMiam?=
 =?us-ascii?Q?7hH78U+pyzivUi24IzQbkX3nwLsXAx9wbvPNc4+V+aHroFx8+orwCgyNh7pS?=
 =?us-ascii?Q?bW6nMRcbVJl8qZUQe28F1RFBB8k1ecxahRMADuRBhEeuPP9Jla7T0xR9xCcb?=
 =?us-ascii?Q?MzzG6M1gi0WlV4tHx6Q02KOUzpgIVGpjx1x+LDNqDZWY8+ANib1IWYeqtQSq?=
 =?us-ascii?Q?IaO9+VrpFQJMsWUXqoN5Tl47iOc3lDb2Y0mLLutwWK/+0a6l8f707YesAfCq?=
 =?us-ascii?Q?b1xYMvwDgcOk+lpCAEDJdDrFU6fxt2HLZvODQ4NuNvy+POCujsj7IF7w+c85?=
 =?us-ascii?Q?wjgkQ6ZdmKMMcBBdb9n0cWfUrT5K3VVjSy0vxrNj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec62e962-233f-4501-b2ac-08db39a52144
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 09:22:40.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7PFw4erLojNh1VX17aAk7qinjgOtuf4bN8KsL5Yi/qJiJzX3FgEadh4UkYAwqhmzz8ioZtmia2ZLIGRYUpLJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thanks for the review.
On Sun, Mar 26, 2023 at 05:38:46PM +0200, Andi Shyti wrote:
> Hi Ye,
> 
> looks good, just a few questions:
> 
> On Fri, Mar 24, 2023 at 01:21:12AM +0800, Ye Xiang wrote:
> > This patch implements the I2C function of Intel USB-I2C/GPIO/SPI adapter
> 
> also here, please keep using the imperative form.
Got it.
> 
> > device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> > I2c module with specific protocol through interfaces exported by LJCA USB
> > driver.
...
> > +static u8 ljca_i2c_format_slave_addr(u8 slave_addr, u8 type)
> > +{
> > +	return (slave_addr << 1) | (type == LJCA_I2C_READ_XFER_TYPE) ?
> > +		       LJCA_I2C_SLAVE_TRANSFER_READ :
> > +		       LJCA_I2C_SLAVE_TRANSFER_WRITE;
> > +}
> 
> How about:
> 
> 	return (slave_addr << 1) | !!type;
> 
> BTW, am I reading correctly that the address here is composed as:
> 
>    7     6     5     5     3     2     1    0
>  ADDR7 ADDR6 ADDR5 ADDR4 ADDR3 ADDR2 ADDR1 R/W
> 
> [...]
>
You are correct. Will adopt this solution on next version. 
> > +static u32 ljca_i2c_func(struct i2c_adapter *adap)
> > +{
> > +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> 
> how is the smbus supported here?
The i2c-sub module of LJCA device is SMBUS compatible.
It's supported by LJCA device hardware itself.

Thanks
Ye Xiang


