Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381197363C2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 08:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjFTGrT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 02:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjFTGrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 02:47:18 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5A3B1;
        Mon, 19 Jun 2023 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687243636; x=1718779636;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bAR/6XagtGwH32RluErIF02TfdtYnyJAsM2r2CWiVD0=;
  b=KRDG+/jXLkJ5c05RnaFMWzdaGSmMtGdKq1gUM1H6N7oQivcn1JsB+4Dk
   TycInV31kEIcKuuvtl/Dh7q0bB+nhPYCDpR79EpdNFBxfaeHiKIgXuQi3
   aOOK/NKESjct9ykwAuFwLpoPbO1yHKxIamK49CigENBLjKaC1iLK6mFq/
   XhKGYOEJhWQDpXlc9VPBNh5vl1YRCHa0FB2o4QSD73lWjtNhqVBXNhd0Z
   jKmoiZT3MF2aF0RpBOw6iwKdU3V87Bj60IP8yjmLZQFOBojodlHmF3I+t
   zNWhR8/ZNLqlH9DLYUPZZRcfOdy4H8vU1oNvuER8kURpY6GMOZUSBPDEU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423447593"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="423447593"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 23:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="826856444"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="826856444"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2023 23:47:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 23:47:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 23:47:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 19 Jun 2023 23:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYENat+Q+/V4KtadBvHwpFDnd6M9yrcpIqf19MQwKZIZ7zaOcT1lVCK7Q05Wf7y/wPmBtPSnsNnpAPPsWpVplcfWAHTFde/epWFbEoOwBFCqrkE0NUyKShNpo0ZysG6K5cagqa7eLmMW9uAFu65CS8XiUc4v2eJEQDwWkIZ2skF7pwE5yqHw7TP/lNvhuyqsQYGXZjjSYlf3VP4J6ve9RH2whKM4501bWrdEX/gSMgifeFE1IZQlu4ukzWrSC//dV8H/txB2Ph3jGXhNYA9HqYVjzobvMQvc27GjxQzJmBI+oEkAl3CKmcWeWGEnNNGtHjMxotDcGLR/23nD80PIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muxNkFSsfaGVu8Sz8e2mpVtk3IWtGOffkGT8WlAYsj0=;
 b=aJdMqczre4DLvnVOv0aCR8ABGM9mn/PHv23/0yaA05gQVzN8dbnYJrWgIYvYgKSGWoaOkUleK+RJecuh6MbavnSGo2Zn+4DoOQnfni0D5R63mNuVnzHzHx5BW5QSGBmxuGKJ+I+fuBrmtV6uK0ryll5yort69VsLezgcUhyqUz1aJtrGJSrz0SueVrA/fydlHTcLhrU6hxTPIQKDJNTyWymCftdw97E0KPbH3ftoIrmRTuAGXBewHXtHznCfMijHrjEGIae60E4Mo+3dmRbWjtsX4Lj3uNUtZJ/TK2ebT0GieP374yJcxCzeH7VXDsTV7pivNfJhKJY+lVaeOsQnmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 06:47:11 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:47:11 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Mark Brown <broonie@kernel.org>, "Ye, Xiang" <xiang.ye@intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
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
        "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: RE: [PATCH v8 6/6] spi: Add support for Intel LJCA USB SPI driver
Thread-Topic: [PATCH v8 6/6] spi: Add support for Intel LJCA USB SPI driver
Thread-Index: AQHZhDKg97ejfzr1I0O8sOr9dAI1ka9WCSqAgD1x13A=
Date:   Tue, 20 Jun 2023 06:47:11 +0000
Message-ID: <DM6PR11MB4316E9530309ACCEF55AD0D18D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-7-xiang.ye@intel.com>
 <ZF2+C0CqaBff2hl+@finisterre.sirena.org.uk>
In-Reply-To: <ZF2+C0CqaBff2hl+@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DS7PR11MB7887:EE_
x-ms-office365-filtering-correlation-id: 13f02b5b-04fe-4a6b-915c-08db715a2cae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nVxzuT0EXcX8mc3sXDmbkokaF5oG2MveDgpjjD9jv11bRrpEfWpJRVOtgXsiOZM2y+h++uverhLyqldVbq0nFe5JdbjHjcsgMqg6tIVBiWFj0Efk8sVRJ76K/xQPjjfhkd2sVjAvHoEliGJOlJx/okTy+JVN0fsYq0a/Ofv0TZ1uo+O6LcnE2uSwdS/rO5oCKdq519m+7teyx+alTX2Gxze90YbeAHJQgWxgQEoN3OwVSfyQW+up02X9h/8fvDyM5SRkYmTHG8NKkG7NmSGG+j/hedTvcCi3tK9ktVhwQlMZgK8zFhFRMODoBX4NrOeBh5R4g3KVK9Uux3HKan0KBGlNX0YIjoxTqHxDzgWvDFX1xCV6rwoWTGBAzUDsPtaoGylFrQPfHS0ub3s0t0OhEMpMpdDjcvDQnJQe4iwMC+H6YAS3PtC/cKSixTPo6c5rROceK3JHgt2uDSmXOXNmfUohEGkr8oFkAO04tJz7kL5tEwikNKfwgz1j0ups97E2LA9o42bFjwnlk5uvrW+kFtJESuTQNrbrgvoMjtgDlf7KiTPnu5r20oX2NniqALCBeQjE7gUfkAfY+OYqsy17iOpNOjPbI9JgQbc23aAwHy3+QgjCNxbRtQ5dH+A5QWeQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(186003)(9686003)(6506007)(26005)(7696005)(71200400001)(478600001)(83380400001)(54906003)(110136005)(82960400001)(122000001)(66476007)(4326008)(6636002)(64756008)(66556008)(66946007)(76116006)(66446008)(38100700002)(316002)(55016003)(41300700001)(7416002)(8676002)(8936002)(33656002)(52536014)(5660300002)(38070700005)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EjwoCM1oMaOliPs6b9l45GGCneE5jHAO/ZOKgDcdGwqMPr0M5PicGdMntDPM?=
 =?us-ascii?Q?ULV3t3dCMkBeZbHFbqwKfX67y37wLS3OH/vptAJa0sU5Nl2MJzGk24Nzbnns?=
 =?us-ascii?Q?WyLhyGj8zKzd6QnYF1T8hq6seLR+kqbkpcJjl1QEEbfHZhCCj8rHOF6osmJj?=
 =?us-ascii?Q?ZqUwEU8E33gqvG7Urqzk9Jrq3Ed+zJfLgBtbYmAGrYOGXNipiGiL9lDUSY7X?=
 =?us-ascii?Q?ASObO7OjfrgK6HxHS+9OPBXWtlarVkZIX7CYYV5StLVugDzdoZymRnxDEyIo?=
 =?us-ascii?Q?luXyk7DgF4gJCT7EXGZ+sVheEXikglfP7eX8Oy+EDDEZ77sWtQTFBj69EqTW?=
 =?us-ascii?Q?VkUb0OLoaji+FlBi+gr7pdn6KXCYsD5x3rdAZfA4yLmcKXf/Wr2MbdWdhp1X?=
 =?us-ascii?Q?NIEw3cel9rabsAxQsRacjzaibgN4pqGACfq854+tY1lLo+FYwzinDg2g7lCH?=
 =?us-ascii?Q?QIXb0Y8eUfJSrUmWkyF6qD7YDj9e+Tmyox3rJVjJxAH++Dxi5W/acubCRflD?=
 =?us-ascii?Q?bnSZ+vIoK2ma+Ce9z+i7wmbAwuwPRvBPr2gFJOtfr2SCsJKYaC2NwGXsj94z?=
 =?us-ascii?Q?51BX0Ogf3C8Sen1HIwLxAbHTv47LDo45KFN5bCo20djUvIMDAwgsjcbc4MHN?=
 =?us-ascii?Q?+PgISZxjdAWJCogTGy/pu2UKrbpYPoA87Fze3meyDeChZK3or2Ss6e4llEvz?=
 =?us-ascii?Q?vE5rF68PmmqVHFqiYYv5aTHd+HU/6ECEIAr+dc82wRDiYIsNFHZ06Zk96CfY?=
 =?us-ascii?Q?HHdS15dTb88g7NV7/leGkA4g95opfLArUY3NUfqK40aRXK4Vmt5B6YBDfp9O?=
 =?us-ascii?Q?CQ1QXKUD4751EJfER4gDep/vjv6UGZ5932ohq/fBOqIOVkiNaQjCQXZwOd75?=
 =?us-ascii?Q?2jEerSQmYCv0DstCsGnvOsHvSaNxYizpalqyY4CTdlgYd3yvmSoQ+Eo6YMSg?=
 =?us-ascii?Q?mQSsfxbQgUSjqOoMrSBZn/W5AnAHFUFb0KwKWgckpC/60V9MjTj5pXpJ9yXa?=
 =?us-ascii?Q?hcNNjZspF8HfIfiuAEMV7Y8enYa/CBYITWBIca0qePi2WZ67OTUxaYMrDRIl?=
 =?us-ascii?Q?6djU/wXII5LNa50xv4elae28V/QDspTjEDPysaq4XbJxooTpqHmLYjfE8rCY?=
 =?us-ascii?Q?rCscEqKGGpBdjH9mVjH/QhrlKrTEw7uX9OIHUMFCh4dZgXarxvPYsIL1I8cU?=
 =?us-ascii?Q?nv+hiw6PB27dLT8DufFOAvqj698+aRsWiY4a5juJ8EKJPB0sI/eaVJqR51ow?=
 =?us-ascii?Q?Vchvrg612gsuYO6egFmcEAV4/yV8/BF4oT685otv0F+BWmFfZl9tYLp5y0Ge?=
 =?us-ascii?Q?V44gRAy8uEtJPBiuImesErEy9TX/7DWbwmgCHqD73vDQBkb4yblvdfyACfnV?=
 =?us-ascii?Q?w9Wi6KRZ03D5GFeJnU6gsqJAi5As2h55tuO8b2CxGxlT+8gK+i1kLG4c0Ou4?=
 =?us-ascii?Q?fzzDdMxDLu6AtpImDOtf/ow622CLK4HnybelpYrnXjyxyxAFlzqlEawOiMm+?=
 =?us-ascii?Q?FHTFynA3zN7wHjs+6KO/aisXlOMJhyeHumAjiI/EDTqjIRH4zn96Y8U934fm?=
 =?us-ascii?Q?Y6M5RHTJyeAzz+JoyRKspD3NrOXaZFG638LDxGPS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f02b5b-04fe-4a6b-915c-08db715a2cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 06:47:11.3639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5X0adbBe6LeZEmxvmC8uipShB2U0c4beCYa7elVtGw8xE69ch5i+jbYgwzhB8DCHSvR1phLYr7TCNL35k9aQ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Brown,

Thanks for your review

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, May 12, 2023 12:18 PM
>=20
> On Fri, May 12, 2023 at 01:58:44AM +0800, Ye Xiang wrote:
>=20
> > +++ b/drivers/spi/spi-ljca.c
> > @@ -0,0 +1,290 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Intel La Jolla Cove Adapter USB-SPI driver
>=20
> Please make the entire comment a C++ one so things look more intentional.
>=20

I see lots of drivers are commenting like current one.=20
But sorry, you mean the entire comment start with /* and end with */ ? Than=
ks

BR,
Wentong

> > +struct spi_init_packet {
> > +	u8 index;
> > +	u8 speed;
> > +	u8 mode;
> > +} __packed;
> > +
> > +struct spi_xfer_packet {
>=20
> These should be namespaced, especially since they look likely to collide =
with
> other things.  Otherwise this looks fine.

Ack, these two structs will be like below in next version, thanks
struct ljca_spi_init_packet {
	u8 index;
	u8 index;
	u8 mode;
} __packed;

struct ljca_spi_xfer_packet {
	u8 indicator;
	s8 len;
	u8 data[];
} __packed;
