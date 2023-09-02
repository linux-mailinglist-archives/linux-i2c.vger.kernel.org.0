Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863AA7908E3
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Sep 2023 19:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjIBR3R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Sep 2023 13:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjIBR3Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Sep 2023 13:29:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D3DA4;
        Sat,  2 Sep 2023 10:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693675753; x=1725211753;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iVr6WOfkeZsRy7qq3BQ8YzEZtoKJn6C30qvjQcFqzcw=;
  b=PZP0uOISYE5rRwKWIv8L+JNXscUVGQZL159JU3uafeQradthNe3uXjta
   40eMXJ+6k/EmRyIBjkzgPZzqBcKk1ZdESfCFFbgOwSxPJ4RSIHTAgUU/X
   JJCplfsI/uRui/4agbfkEswq72sXNyLYM7wyf5kGNIPSYZ80UfPt8KXoX
   kQTGI6agIAA9RzUE8mJEW9/yOM3vWtFamRvCuFghEpgxUmpQCXKoVpAp/
   wXa9y98O0KUzdQ29riXuLT6qylxhInus5RCbFXdZK9Qq0467GH98Ea+8g
   IfLEsUciC1FxznxScpdvoe+SqT3Q+RJ+k4ZfDH013ieyJJR5Mkq1gRjGf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="376317564"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="376317564"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 10:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="743477140"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="743477140"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2023 10:29:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 2 Sep 2023 10:29:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 2 Sep 2023 10:29:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 2 Sep 2023 10:29:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 2 Sep 2023 10:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPc6TuayNP7bLS/4ZKqF338/lgJ3gbjsYSc7RGlLSq7UWwpyaz1ZPDDAw+yFJB/tHWkxW4rTYAqRMd2mlfSrXUDhhadnpZm6AVDxE5K8mPLCV8sEWTf4f/U+w8RL+4Jms2xF2kFiHZrUA4jUunbplosb6FhoGbv/cJ0q9bWpZtpovgko/9eDEKAvFT80bLKgDAKJhtZvhoq8NeHTVFDn6Sti9cnKWpbs6pALe1mxKpB0CaoYyteM3ZSpKqp79G96Ab3+KWbstpCGy8TTPqRRQG1sbJL8ASB0iufwFhqGsptNIZzOvl83HqkNC3Y0V3Ab61ouo4tLu+/0D43Ve5mI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVr6WOfkeZsRy7qq3BQ8YzEZtoKJn6C30qvjQcFqzcw=;
 b=iv2AV90uweI4pzsE1BifYvstYpRE1IsP43qbn4yVJc0bj1ED81pX15pzAB/5qvu0LhjrPxilbVZynkgUp/bD20V9yM/N0Sgdia1EPhmAA7AIFmY+2F97IYU9/ewv6Dvbc8E5XgcUWll5aMNesrcsIZyxT4JCsXB62kWaghAoxruXiFmUR8jvqUAHjy0VoMKNrKsMNnUC6f+hZWZ037vQqg1X+9QFaN5UxghTcklbKX5BuSLwlQM88smZmVDCoRPjJxe3rnWjutjeO7uu4AaboBweo7iEq1If5IzInCp6dH1EgYVQCaRyu3gxPthrNjCevR1PC7K0D8mNVhI5PptvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Sat, 2 Sep
 2023 17:29:10 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.028; Sat, 2 Sep 2023
 17:29:09 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Andi Shyti <andi.shyti@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v12 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Topic: [PATCH v12 4/4] gpio: update Intel LJCA USB GPIO driver
Thread-Index: AQHZ3JZwIqMhM72jI0KfaoTCd9FX8bAGFgsAgAGzqwA=
Date:   Sat, 2 Sep 2023 17:29:09 +0000
Message-ID: <DM6PR11MB431665283C408587AA793D748DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <1693546577-17824-5-git-send-email-wentong.wu@intel.com>
 <ZPIA2mMtNRakNqqd@ashyti-mobl2.lan>
In-Reply-To: <ZPIA2mMtNRakNqqd@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SA2PR11MB5211:EE_
x-ms-office365-filtering-correlation-id: 721e37a6-adf2-44d3-4d34-08dbabda1dd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: du7bJk3BNkMNPCTga10DHlSkpYaSzBEniyuujkS4It13UwePHp1ZVNkkv17tpTdp2HbHwZg/xzmfzVIy4QMYGjNAul7E1CXjuKD3BJclJ7ZPOdEQAC9H0VCgNw2FcLIQbYhsuxSN+Gmu2dL5i3IpXvuYqzvyM5J00iIL5dlQfYdBEGR2MfbD/KfOR721bhGywFwYu1HuSHRhIQ7qhonP9Rjm4NtSF2aQ3Go0EcoV3ah0ASrHriZzffMNd9r25s6GNqLt+4yiWonZOVxH8kzhDOO8joTxXLwcImvByenyleNnI0OdZwnlySN2yjBG8LiBrVjNr/UNieFMo3/V1lVzFoNrs1lUDNo3b5z42BLdYlOhEEmQhZIvY7elro3cW1SAwCKNIB5jmHj4eBQ1zFC08p8b3sMzLryk1GtreDG/ME5IdGod00iWPd31aq7iQifaDH4chE3JlcMC31DJ1duvLgj4BIw66EBljH79FTNLuGjD/lrOXtFB6T0yxogWIlozzl/qkFLyOzS5VIUUu+or+tBPxzJU3H5KPPPmOCGhPZmqCl+ux/oBE0pnabopR+VpLxIotVw7/+0wV96QDkeDbJaheFiowC/XrVi3F3lPtnT6f4BkoWojbOn3hulgKnO2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(82960400001)(33656002)(122000001)(38100700002)(38070700005)(7416002)(52536014)(41300700001)(5660300002)(86362001)(83380400001)(55016003)(66476007)(66446008)(64756008)(54906003)(66556008)(66946007)(76116006)(26005)(478600001)(71200400001)(2906002)(8936002)(316002)(6916009)(8676002)(4326008)(9686003)(6506007)(7696005)(15650500001)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fp4YlPYHRnfDqyl86FOtNyB8mzvWMrCSrvgfXCY+MPwj2aQvvelWQqYFCBhj?=
 =?us-ascii?Q?Gx1gxUvZ/fEnYOISwpTarY2q72CCF0MZ/HMzCdREOE+DqnTnCgRzeZon8xEK?=
 =?us-ascii?Q?EBrp/7Vy5eZd2yURJnmcb8mt44vNYSSfGL4xAuuq5crXgWLrSZGdT0q6FCIW?=
 =?us-ascii?Q?DO5IsobR6E6g5FXQNe0TYuuNqkX5/vP+etAziAIVAJcE4B5Ly6rz/HXLSdSR?=
 =?us-ascii?Q?+5uf/qZ1P+BKDHtpe5N1AnKAu1CeKSoKjZAa9gnrRZrYVFZ3u/FJkr7Wk7Km?=
 =?us-ascii?Q?r64E/K7TV6GM/HGkWQ1tp9GqPtjtdRZHQ+lWNxO46wsKTbQx2522Qe8H/Y7L?=
 =?us-ascii?Q?btOHkEMQ7L0lTFjeRz0Y/+igPuKyJaoPsAlS1OyvJUboQavZAm+cS6NwY4GA?=
 =?us-ascii?Q?S/oSAdhmQIxph7knjVyuUy/Nvy4eM/INduO5ajH/jIfbUv6FK0EiyNs84hCS?=
 =?us-ascii?Q?vCP2smLPQ1HoeXnRluANBiAu/5SN0CcpRbNG2zrYau0QkhtwSe9Js1zorOLl?=
 =?us-ascii?Q?9mr8DU67/GnOQ/r92ODOKyAF0rzM8RtxQ1Nsomu3b9EHkO5UP1FSuN+Jk9C3?=
 =?us-ascii?Q?pPlGsuTHjxpWEiniYYaaVsIJtJyU9h0TphUU7udnV8ufOGHrSDWbSeKasNQy?=
 =?us-ascii?Q?5lGBCoO9DvLnYi586gmLMdS0mvS3MTpLPqTOHPOSQzV6zUAHu/lgQHQHiD1N?=
 =?us-ascii?Q?vXtBdNXmuJjDi9KNVcGTd+62k5lP/lLC+agQ4zgooPcTu1cru+hy5wFNCury?=
 =?us-ascii?Q?ovcHUsSAYyt1DdsmvX63qxSEouQ2UYVNq7q1ZadhpYWxHfjVx861t5rlv7Cz?=
 =?us-ascii?Q?X+fOa6xS88DQsV8XxI3fXwpgPZbWK3ivHo6aQzGvSeES628lLN23o9onitu5?=
 =?us-ascii?Q?4AAuc+cJqHH8TywhTPzX9KfHCLysBi8fGlhz0b07PfVmtzjsp6xUx/AO8epU?=
 =?us-ascii?Q?uU7Yf53t4C1D7IBWYmiAkK8iQf6kFk7qjxmyTU+ikJ0SdxdcVrIHHq3/guy+?=
 =?us-ascii?Q?rBd6rS9VzzzyO72T/nIboUu7ZKRvf6NV0nNguDpnYSMpJ93ua5khSo0PwDnL?=
 =?us-ascii?Q?AJ1x+kVE/GkiDnzZHQDq5EgQzgxSWlvC2LQDzSj9pDDdxu3AF11V063T6gfY?=
 =?us-ascii?Q?eeQIPlM9LCjDGr6Uu4AtU3YdR5c/PjdY5B70ud4KQN3m4+yB+vfniBSZcrIV?=
 =?us-ascii?Q?ojzjRxSd2Yb1/0F/PSGPtmiByXNYwMLXgCk9pMXn0jCrP1kKXk3iTxqFdQAC?=
 =?us-ascii?Q?X7iuPPifDGi1j41y92V0OiI7mGb/fsT86Dd6Mh4HW6NJC8PIvVpkmRUK1lLK?=
 =?us-ascii?Q?IFksuK6pN4SnBe3MxF8o9y7VSs+NIvXMzVB/G2gHRa/yIad+NDbQltTKRZsO?=
 =?us-ascii?Q?TexKTNR/44XMV6LM3RF62eXfefSn/aTEH/dJ+V/OlPCNqLKm56JsoUg7cafp?=
 =?us-ascii?Q?BAiTVs34a3cYl0RIXVZBGQXfPDF0XMC175PAO8IHahab5RmJHGk9i6JxLUlO?=
 =?us-ascii?Q?skjlfEw8SFtBAlJ8NUEb+JuAt4tYhe8qMF7y7OWrGehNW2AlihxIyUEiFAgo?=
 =?us-ascii?Q?vhWlscoq3j9cxCGRmGV/BYnVgJYswMUwErWyiTSn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721e37a6-adf2-44d3-4d34-08dbabda1dd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2023 17:29:09.3994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfqJf1fIUcVV6emFvrB2zHdoELUS1V4TtFbDkHKOceKwG4RW5fnEjviVFJkJzNB2ZEDcMh/AjjCspJHzzkYoVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

Thanks for your review

> From: Andi Shyti <andi.shyti@linux.intel.com>
>=20
> Hi Wentong,
>=20
> On Fri, Sep 01, 2023 at 01:36:17PM +0800, Wentong Wu wrote:
> > This driver communicate with LJCA GPIO module with specific protocol
> > through interfaces exported by LJCA USB driver.
> > Update the driver according to LJCA USB driver's changes.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> I am not understanding this patch... Looks like a collection of random to
> relevant changes you did in gpio-ljca.c.

This patch is following the changes of usb-ljca, from platform_device to
auxiliary_device, and ljca_transfer API's change. And others are mainly
coding style's change.=20

>=20
> I'm not able to review this, can you please split it in minor changes?
>=20
> Meanwhile the previous patches should be able to work without this one, r=
ight?

I don't think it can work without usb-ljca

BR,
Wentong

>=20
> Andi
