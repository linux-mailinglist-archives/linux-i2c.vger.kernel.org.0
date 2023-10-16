Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D41C7CACE7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 17:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbjJPPFo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 11:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjJPPFn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 11:05:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE451B4;
        Mon, 16 Oct 2023 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697468740; x=1729004740;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ukKUWut59IN3BmoYR8GrHML1DrBmaakLCHv6nYqYSTo=;
  b=R0L5bTl07n+1SCPbGvxTaHtgHGBJNlx1K0kf5rpQn5MtFyhtLaUbPr+r
   LFLk8tKkuTHTMbFTOqmcF7k790MeL1+73IsF5k0t0wb/lZCyHxVdRlE/+
   BistykGf4urboeF00Q0Z9rQwADx+U+ftXf6C+QEvClZ9gOq3gC68cS+PR
   3SpGdlzOTGca9widaPV6tVdLCLPgq51jJM/mCzVEtT0g4uqSQLn4JZLyB
   8LX0qt0+vLbul/LVOgaa57WFHf2UkmkfN2FT4YSvrkXR767WzLQS1ig44
   SmtTK+i2EbNPyO7ExVfSUzuIRfmsyMbtGb63gycwZAhZHDvmlDIJqG37j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389409899"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="389409899"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 08:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="872143720"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="872143720"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 08:05:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:05:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:05:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:05:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:05:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDCVAirXyqBcjCWMq4LkPe5SM4sOh7aAx+fNqa+r2vwDNlY2YQ4Ea4fd2CJr6MY/DKJIO9kvt80eYMcGVtNyNrNX8hX11T8PtK9SIi8UjkuunSB9PYwb/naY233cExgYDwmCJD3M0uS1JWNuAHZ25nLZvNfw+vZv/UUC6IbKKnEVXGUbkQti+gI+jWkwElFspsZfLpfHeiJt5pGICaOBQkMYpG89PBIEwNo9r6Pk+G5b0HTdove8tBxCNCCN8FkfhbTZ7BHkfsoxdrPGdoq1mVaEyb3iX6RlU1sA1LuTKP/F1oh9FXkRxZONMocc8ic3h8d91jK70+ItyfSryXeExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L99e7Lw0SEikiplpGHUKcKtLFKje2U9Po5gHTRpHn/4=;
 b=CLfItsJEXv1C5T3lsa4fug7BNCjhX5nLP1bWq3H6d3PTJr+AlW8w7++C8VIzKhOpAYKBF9aymnY0EXU8WPzCmwk6C0Cz8iTwxDHq88heD4Zp/rSpMY4Bkp3oBjT6DzKlEW3yjooalzBFLP5xM65xisnWpM4ZYGqSJwC/Gnh0GaMq3nnGwTz5CfsU8BlUFTMYAx4xdiQLpM4Y2Fi7w5VoVK5RWeAjVkW/7xzBe9B6IRulyI4aEwqcMgFA7G7lXOWVFb4QpoWJAoBw7mlDVLPSNRyDkI9MoRxE5+T2BV8Re6Lp9V2bB/bsbPW7TsON9Wlx7KC/hv4jAaZ3lT6ZGELkPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 15:05:09 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6863.046; Mon, 16 Oct 2023
 15:05:09 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
CC:     Hans de Goede <hdegoede@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v20 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ+nqZYOWB2QQzm0agSGlxpBPNmbBEZGUAgAAEnYCAAByScIABf/iAgAImwQCAAPlcAIACx//wgAAk8gCAAHc9cA==
Date:   Mon, 16 Oct 2023 15:05:09 +0000
Message-ID: <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
In-Reply-To: <ZSzogNhlX9njvOIU@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CH3PR11MB8702:EE_
x-ms-office365-filtering-correlation-id: 87ccc3ab-c830-45c2-d32b-08dbce594a3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRrCRw0IQw1Ua963bRFJFysMOP6ITd88HZW4FYtaH3zE0VMPhnXgbsQahKKnPCi2+HTZSPBGhjHfgolDSGCEwxr1rUKGDtoGUz30Miqo3o4LvCFursRnGt1xA412WRKDATYJ6x5lGh1NqtbvZ8XS3gcswcHhkn3vMtooOkDs2N6An0J7CXz0ZKt/knnSrHCwsjDKzyEtoI7g1nvfRwSyT1ubvHc5SiIhNyHNbIZhUYotYzrg025TF6omcuYxghDHWckCEDnpwPgOAfo0M+7cUB7SYvzDtQMlROgJvzx9/kCUZsfsgI6Q+GVs6aWEVFm9xQ3jSrlfp546XfSMc/NUY1BR4Vo3w+AmgOpjzc9S2Yd6MnCHWQqvX7CCPvu+c3u1T9rW7fuhiA7gmQ1mrnnAAj8yGWbGmFY0S6ItYSUhZ/nS6CdBnzEpbvuOKQJ2oGPRNxiEDqWZbGFrDkQ+nlUBEUJjrrbnIUk9idgFY9zHXbNd+Qu1xBS8mpim4RSJGaoHnopHW4iPNHDTQr1XnVpouRPFzvXbmFF16Jo8SguhlYqyoWmQEViu/xB1WOfVwi9PEOgvWEKiYoqUlOeLz4+2mQ+pKOfv7X000uG+wiGJI+JB8fnX52SliMEV9JJPEZRg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66899024)(55016003)(82960400001)(122000001)(38070700005)(38100700002)(83380400001)(9686003)(26005)(71200400001)(7696005)(6506007)(316002)(76116006)(66946007)(66476007)(6636002)(478600001)(66556008)(64756008)(66446008)(53546011)(54906003)(2906002)(41300700001)(86362001)(7416002)(8676002)(5660300002)(8936002)(4326008)(52536014)(33656002)(6862004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZcyLCdNxqYmPyJQUhIa8+K4WLFS9R5agEnkdQaWCKisbdeWn781oBClTMl2t?=
 =?us-ascii?Q?M0SOP/N4K/KdLYrLchpjVIptyjfZo+qp09O679oHUpfq0WaBxVSuzuBX9bBz?=
 =?us-ascii?Q?pGjKrexrbW/tAzc5oezlyutT/VS4pJS1RxN/PLH13Xnq0PQYXYYMWHpAg+xU?=
 =?us-ascii?Q?Pmn+vM2p+AZ5Vnfb/XQ4G4nLILdkRANeGheZA8Yyr7RgkokpHcEQ3qGFVsg0?=
 =?us-ascii?Q?c1Q2Vq4cHF8CCgK1PRlqgkV8rRHlYpjnJNAqa8NDi6sKUIxBEr+BNUSBdtGU?=
 =?us-ascii?Q?kzhK692Ot1EYPqN9uj43456ovI2JK9j3qf8+REY95rWspgrLJ3s7mgld2rVR?=
 =?us-ascii?Q?vnmQL54ApUqF538E1EI20i2R6bzJ8qPc3NypG84G8wKIhuSPAs2/P2f5uo8k?=
 =?us-ascii?Q?OqjiXWGc1o9MYbckjRmRiyWe7RvvJqqu6Blo4R8schaX+VCYfMAM0Zd0Uz7E?=
 =?us-ascii?Q?srazghTMcK4fSSLnRzOkcfe+b4V+GWdQv/pKkr18gAeWhaATmiu9CZ20/1H+?=
 =?us-ascii?Q?70LDag/FuvDr3+u9TMd3QUTaLeUrFwgPJrIqKqdvs061GD41dL0OQDyalzeb?=
 =?us-ascii?Q?uDN5V3ZFHJqaZ7NfKxJJb6d9lxqqjmKXVVY5lbSmLSnNQiDtJiYE5WBCDGi2?=
 =?us-ascii?Q?ft9zHxmhR3I7Ab54rbzQqnJfzlytNrttRWfB0zLZhWd0iisySuSg/BG9scSr?=
 =?us-ascii?Q?fgTusit8P9reLSzNBBO9fIxXM5XfKl8tea+3KjjQ5AdU3Mn7q4xlDa+Klqmn?=
 =?us-ascii?Q?sme/VKLY8bmmQcNOiEtUUz58jlrqWqWG0dTcqOI0N1+ZoV0vm+lBzEgSE3u8?=
 =?us-ascii?Q?goFuMrV3Y5D8Frr+mRb2Qo/9YlECsylGtpn2dz1kOqOoImG8t6SOUiyaCfjC?=
 =?us-ascii?Q?NzMd6/ph67pA5gWH8QFkOQKnBWXCH4XSfTsCf7F9Rz7ddr4vOz2fCKOiUWkt?=
 =?us-ascii?Q?Ay/osdgnK23ELcIOF6tlFas0ldHm7G4zWdbVrEjZFgdAkU/sUuioGG3kjzDG?=
 =?us-ascii?Q?4HfXoqDU10knHXtGzIJMaaphGK7DclEQ96SVMkhpqnsr4WH81Si4tR3KQTi8?=
 =?us-ascii?Q?pZreQ/J5oWeCrahplKdPLNpJUz3k41PsYtYDEm2kktNqaErTVXc02T3BjBCu?=
 =?us-ascii?Q?MLIMbDtNylfqgZOVEM2IHsJPu+UQlzSKLv/I+c7MZrBCsh4EIHcHeuC5gCyS?=
 =?us-ascii?Q?R4j8HTQ0XjgymnobNzuVZgEwiAoQw9v7fwlKDL8k7Ujp/McrCm8Se0tbVD/U?=
 =?us-ascii?Q?INuCYiGmEoydxiwQmTAiluSEXWda+tW9NGGzuykw12Fj9RElqDkeNX+Zd0lt?=
 =?us-ascii?Q?s7DeMs9f9j5EH3/CyFGNwm/+R3bOCLSBue4nPSfh9lByOZvcT8D7M5uX5tyI?=
 =?us-ascii?Q?e/qFONqMN62AKC/5g5OtRBrEIjeoqslCvrnFniEpeDr2oE0vDc9wX93BxIRN?=
 =?us-ascii?Q?YukhK/E8Ol2LOmSUdVJNy7vRygdLkr1rxghP4U/5bWE/IZYjqphs3Q8Oa2El?=
 =?us-ascii?Q?5r4AGS3DrYtiimLJte6mPpllAsVRqRMiCiejOouKCCJQsfVX0OWSTCWuIoAY?=
 =?us-ascii?Q?sb2yrG9aNu/VeVsKOACxjyAPfY9d9YJZG7Q731Ur?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ccc3ab-c830-45c2-d32b-08dbce594a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 15:05:09.6000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojsVHtlK9qEjx8yq9E0NIOYKTO20ZD4oDqMWPNK0z7G/iJBvJtZM4ugChEkFPPj/jEkPGV4MygDwtbajL9fQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> From: Shevchenko, Andriy
> On Mon, Oct 16, 2023 at 08:52:28AM +0300, Wu, Wentong wrote:
> > > On 10/13/23 22:05, Shevchenko, Andriy wrote:
> > > > On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:
>=20
> <snip>
>=20
> > > >> Ah ok, I see. So the code:
> > > >>
> > > >> 1. First tries to find the matching child acpi_device for the
> > > >> auxdev by ADR
> > > >>
> > > >> 2. If 1. fails then falls back to HID + UID matching
> > > >>
> > > >> And there are DSDTs which use either:
> > > >>
> > > >> 1. Only use _ADR to identify which child device is which, like the=
 example
> > > >>    DSDT snippet from the commit msg.
> > > >>
> > > >> 2. Only use _HID + _UID like the 2 example DSDT snippets from me
> > > >> email
> > > >>
> > > >> But there never is a case where both _ADR and _HID are used at
> > > >> the same time (which would be an ACPI spec violation as Andy said)=
.
> > > >>
> > > >> So AFAICT there is no issue here since  _ADR and _HID are never
> > > >> user at the same time and the commit message correctly describes
> > > >> scenario 1. from above, so the commit message is fine too.
> > > >>
> > > >> So I believe that we can continue with this patch series in its
> > > >> current v20 form, which has already been staged for going into
> > > >> -next by Greg.
> > > >>
> > > >> Andy can you confirm that moving ahead with the current version
> > > >> is ok ?
> > > >
> > > > Yes as we have a few weeks to fix corner cases.
> > > >
> > > > What I'm worrying is that opening door for _ADR that seems never
> > > > used is kinda an overkill here (resolving non-existing problem).
> > >
> > > I assume that there actually some DSDTs using the _ADR approach and
> > > that this support is not there just for fun.
> >
> > right, it's not for fun, we use _ADR here is to reduce the maintain
> > effort because currently it defines _HID for every new platform and
> > the drivers have to be updated accordingly, while _ADR doesn't have tha=
t
> problem.
>=20
> But this does not confirm if you have such devices. Moreover, My question
> about _CID per function stays the same. Why firmware is not using it?

Yes, both _ADR and _CID can stop growing list in the driver. And for _ADR, =
it also
only require one ID per function. I don't know why BIOS team doesn't select=
 _CID,
but I have suggested use _ADR internally, and , to make things moving forwa=
rd,
the driver adds support for _ADR here first.=20

But you're right, _CID is another solution as well, we will discuss it with=
 firmware
team more.

> In that case you need only one ID per function in the driver (it might re=
quire some
> IDs in the _HID, I don't remember that part of the spec by heart, i.e.  i=
f _CID can be
> only provided with existing _HID or not).
>=20
> > > Wentong, can you confirm that the _ADR using codepaths are actually
> > > used on some hardware / with some DSDTs out there ?
> >
> > what I can share is that we will see.
> >
> > > > Looking at the design of the
> > > > driver I'm not sure why ACPI HIDs are collected somewhere else
> > > > than in the respective drivers.
> >
> > AFAIK, auxiliary bus doesn't support parsing fwnodes currently.
> > Probably we can support it for auxiliary bus in another patch.
>=20
> This is good idea!
>=20
>=20
> > > > And looking at the ID lists themselves I am not sure why the
> > > > firmware of the respective hardware platforms are not using
> > > _CID.
> >
> > I think firmware can select _CID as well, but the shipped hw doesn't
> > use _CID, the driver has to make sure the shipped hw working as well.
> > And switching to _CID for the shipped hw is not easy, and it has to cha=
nge
> windows driver as well.
>=20
> I understand, but at least you may stop growing list in the driver.
Yes,=20

> And actually using separate IDs for multifunctional device seems not idea=
l
> solution to me.
Agree, I will consider _CID more, but currently to avoid this and also supp=
ort
shipped hardware, _ADR is at least a choice.

BR,
Wentong

> > > This is a USB device which has 4 functions:
>=20
> Yes, I understand this part, but thank you for elaboration about auxbus, =
which
> seems lack of needed support. And I would really like to see someone adds=
 it
> there.
>=20
> > > 1. GPIO controller
> > > 2. I2C controller 1
> > > 3. I2C controller 2
> > > 4. SPI controller
> > >
> > > The driver for the main USB interface uses the new auxbus to create
> > > 4 child devices. The _ADR or if that fails _HID + _UID matching is
> > > done to find the correct acpi_device child of the acpi_device which
> > > is the ACPI-companion of the main USB device.
> > >
> > > After looking up the correct acpi_device child this is then set as
> > > the fwnode / ACPI-companion of the auxbus device created for that fun=
ction.
> > >
> > > Having the correct fwnode is important because other parts of the
> > > DSDT reference this fwnode to specify GPIO / I2C / SPI resources and
> > > if the fwnode of the aux-device is not set correctly then the
> > > resources for other devices referencing it (typically a camera
> > > sensor) can not be found.
> > >
> > > As for why the driver for the auxbus devices / children do not use
> > > HID matching, AFAIK the auxbus has no support for using ACPI (or DT)
> > > matching for aux-devices and these drivers need to be
> > > auxiliary_driver's and bind to the auxbus device and not to a
> > > platform_device instantiated for the acpi_device since they need the =
auxbus
> device to access the USB device.
> >
> > Yes, total agree. Thanks
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

