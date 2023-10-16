Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7D37C9F39
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Oct 2023 07:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjJPFwn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 01:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjJPFwm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 01:52:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CBED6;
        Sun, 15 Oct 2023 22:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697435560; x=1728971560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1vUxTMk6cdZr7PvlAkJwfdsnH8+VWSQBpB+vaJ8laaA=;
  b=n0f/R4N7LgxPRwAiAvCG9QNJl6SMpybXWlrgxFwIjYuqJ1oZY2Cz9J53
   4znIgekl3QVqD4zqkXz/vnsonXipJWL83SyWlEJKXnMapqVm4J5F1gBoG
   J8I9UmNO1m/kmLIW72z5itSpFR2CgGZUq4C5ICfWx8MK1VfFfW+IiLlTM
   ZVmQBn5oDwTvam7V8xtoxrT3NeMSMzYizr0H2jMrqzaFFWCyRbGmglzzZ
   akvIFRH2CU0cGQhp6HDgy4AfN2E5qxVvmOuW0UGBGrH+fY8RaDVnu0qKB
   orNewjGcv3kdlEEp1zZ7RHsPQON4+vQbvc00e0N6yWzljfWdqZm0JjXpv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364810242"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="364810242"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 22:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825879557"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825879557"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Oct 2023 22:52:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 22:52:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 15 Oct 2023 22:52:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 15 Oct 2023 22:52:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 15 Oct 2023 22:52:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VELSxCqU+CfT5zcGmZ4YHaFjfebCGJoPqNkdoa0kwP5DHQ2ZVizVealdySA40F5xPb6SPnrbbZN+Vp1P6qqlRu9HNvyXszn14JX1MwxRylYqI3Flpy/CY2fRZ2Qgsfu5to91X9Y98gA8op1Za9PiU4ua7tae7gWh/yWq9fUxH3IMf8hRWqLbwt8Gb0LccQf+zg+rJkPiqaOFxRUW/34Nk7B1//3jTSMZQ42jhjwnEOc46zra31M60FWGUyAN3eMBuIdLBXP55zaPtVC7gQSHLgF71goNou8SkDJKfCTBBmkHAKNj0rgz8NBlRD7UBWMWorEm/zPQoZE5TBh/wP2anQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vUxTMk6cdZr7PvlAkJwfdsnH8+VWSQBpB+vaJ8laaA=;
 b=awZZHL8X/Jv9WaZQ2hZbth3Kdblom7aLOg7ehnLtC7EfxYEvs/UyBF391G0lRDrcCi4kVCs8z2MHvmhVPepCgMJmFQYPVehaxJaXqDZU30nHE/juyjsszqFHRFesVimCmIHZjl9FkbkrJQC90IM94TPMeykoOOxcAt/xDIA7YyksQX/om8KzTK9te+MS7EE/YbO8s4E3VZ2WgEwrt6I0H2F1xqBn7P9Br/Ni/CFSmyeB2DLnwkq3JEGDaMJ7JjPZ5SF9ORdQrNAZTttKsFmkaHFGEupJTWC5vSqUonD3tMaqdca04z4UqTaTkHtIYRVMuMsPneN0KKCmASlQbbCeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 05:52:29 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6863.046; Mon, 16 Oct 2023
 05:52:28 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
Thread-Index: AQHZ+nqZYOWB2QQzm0agSGlxpBPNmbBEZGUAgAAEnYCAAByScIABf/iAgAImwQCAAPlcAIACx//w
Date:   Mon, 16 Oct 2023 05:52:28 +0000
Message-ID: <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
In-Reply-To: <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CY8PR11MB6915:EE_
x-ms-office365-filtering-correlation-id: 24e6f38f-3509-4867-b3da-08dbce0c14bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Bwx/rHExur7JfrFzwTEvUgWbPiIdCNklVnFeSFBWc3QUoESiAX/EkrdU81DOPe3xv202qQy11H1rpfYH6V0Rv1uDpZHbVSSumAZjkyBs7KQ17QWOZxN8o+z1GaMMqcqH+k+XChSNOU7N+U25g+zV+ZRIxxIbURxE/5lEBDsBqG5NXK57MNp2GL6lwfilzaYEksoDN1G+x6kqnRsSLK0a6wqzRIqDry1W4Q0ZIFHg4T/pA2gRh5KGzzW9IzWcTkinK47Rs58Sx1HVrqCqMnf7mb+KQ+XjEog8Bo1zn3fxe6f0nc6rw4JBDXvyma+afvWPBniUFFgf+mOsAAmD8+R+mOyzY5WI2O2DHVg0C7C90sPkjNmQ3Z7TOY8iccAg9eEIKvQOalw+Y3/ZTrNtUF04mgE3Y30hazjeqeut3DAJKLSUHTvCalgvQFpkT8H6W/+D5iacpEJlTWrW8hBA9efljdSKfTral+A9vyz9OI0RstjgYt2YwLY3t1Ob77F7140B1+fBMIH+Yfl+c1jchVdF92BNj155lmHvx557n/3d+9+vwbpVOZ/28AYjeRekGMxhmruNBOu4DYIU18xxTUijNztG7/uPbW+hdfl1qKJ5wOh9brRkBSjknxVinQA6zvB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(5660300002)(7416002)(316002)(110136005)(6636002)(41300700001)(478600001)(71200400001)(83380400001)(8936002)(8676002)(4326008)(2906002)(52536014)(53546011)(9686003)(7696005)(38070700005)(122000001)(38100700002)(66556008)(66476007)(76116006)(66446008)(66946007)(54906003)(64756008)(6506007)(82960400001)(33656002)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXlpRGc0b3FxS1ZrRm13eitZb0hlWmhWaXUxTnZWY0gvcjhRQ1dqMG1QdGJL?=
 =?utf-8?B?MmQxWTQ5T2JYWXp5djVRWnRyZlhucDh2Z3I3V3dnVEVPTWtSU0hlb3hZL0Qr?=
 =?utf-8?B?ZHUxZlNDZWJ3aE9mWmZjK01YUVk3dUd1YW93MEg3VFQ3TWhQRHl4Y0srZUpH?=
 =?utf-8?B?SWtLUU52cVN2SlIvOElSK1NSeGZmb2JETHd3YVZpNjk0U2RuM09rUmNONFU5?=
 =?utf-8?B?QTRGRlZSb2pSRDV6SFArTDVydFhodGFrRHE0bFFFSXhmTmRQdUdTdWZ6bUlG?=
 =?utf-8?B?eE5wZUo3UWpOSGRsS0JOOGFIYUJoVXNXS1lsdXEyVWM5MThjc2w0cU1WUy91?=
 =?utf-8?B?QTFIMWVCOXRTSldRZ1AwcTVDN0NjL2Yxb1VVQkRTR1BXYUl0cDBsQUlHcmFR?=
 =?utf-8?B?YjcwcEZKTFMyeEtoUVFEenBGOTRFTng2QS9mUWpITHhBNGhLYThUWXZMQmV0?=
 =?utf-8?B?Y1EwSHM5ekhTZjl2dDF0T1k4aUI1cFA5dFNCREdvSEdvTnYrd3RKMW16WWtY?=
 =?utf-8?B?WFl0bHRnWDRsMllkS25tb0VFUlBZcWFMSFl4OXRoMk1VZVpYY1RjekhlbGU3?=
 =?utf-8?B?TmxqblFDOWhWWUhSOEpBeFY3MVpVbGRSY1lBZW9qaFBPRmNRRlFYWW5uYzhT?=
 =?utf-8?B?K3V0YlhFWFBuaVlEaEpSaU5uZWZKaWs5YXFjVFFlSUJDZXlSN01kODJIUlJL?=
 =?utf-8?B?OGVhcGRyd3ZzYmxhSU9ybEpYYkNDOUNpcDlDOGR0RUo3cUdXM2JuYnl1MTlB?=
 =?utf-8?B?N0RkQ2NvS2J6VHlvZ0wyOW5UeWprUy83ZXExSzlDbk16bU5INEhPS1dHUTdQ?=
 =?utf-8?B?N2VRb2lnL1l0RVlnSWRFMW1zT1VnMTBrZ2FOOVIyZndDV090VzFyaWJlbENJ?=
 =?utf-8?B?MS9KZDQzQXJqMlU3YmM0RERVcVNRQzlxTXJXR1lYZGpUc0kvdzVncGUwR25n?=
 =?utf-8?B?NDlNZlpsL284bm5HQjBPWFh0NThhTmQ4ajJyeDl6dnlDQnJ0cVNuRWx4WFI2?=
 =?utf-8?B?SGxoZXF0Q3NWOGVpWjBQNnR5ZU5oZlAwMFRqOFdwZWMyU2U5NTVxK0xHS3NM?=
 =?utf-8?B?MWVqd1FrWTRRaWYwSTF5c1ljZEJETDZXa2ROWlFjaUt4VXZ4UW1KNTZxaUFE?=
 =?utf-8?B?YStzdEgvbE1kZUI0WnpxY2prMVdqUG1mK1RYTDRQWlhxa2FIa3kxMEZWdjF4?=
 =?utf-8?B?amRSL1lJdzhxQ0pVR2ZFeVJKaUN3YTFDSDc0N09WU2wrZnlnaFVkellaUUtG?=
 =?utf-8?B?S3lDVFdBR1FnTGRNL3N6TzFMZFNGWXpjWFYvbEE2UGRYaGtHdDhBNHZuaDVs?=
 =?utf-8?B?eDZhRUxHSjl4Rk04NFNxM2dIamxKNFIyWm5rdjBWMDZoaUQ0b3VjZnlSL3JK?=
 =?utf-8?B?NUI4SHd0VGhFQWx2cjlaV1RUcTZscGdDM2ZEYmllWnhZMjRqK01hMXM0M083?=
 =?utf-8?B?aGJnVytZYklZQjZPZC9wV0NjV3lKejdVNlRBM05qNlU0U29tc2I3c2VUVW4x?=
 =?utf-8?B?UzE1Vmt4RzI4VmFaUkFENE9VSTE5SFRqaHBxeUEwbFJJNGhaMC9zZGt6Nk8w?=
 =?utf-8?B?ODI0UkZsK2RFR1ZaQ3NJQ3k2d1BvMmJxd3k4SVBBaGpiRk1YL1htcFZualBm?=
 =?utf-8?B?MXhWU3pnVWRnKzYveWpTRkt3YUFVMEhvR1E1Nyt3UVVyclVEaGxJeFhpUEI1?=
 =?utf-8?B?MjdPZFNxR0hBdENERGRiaEVOOUszR3FjU2RJY3BNOXZSQ1NMeWIyTE9NOE5p?=
 =?utf-8?B?bWh3OTBKeGU0Y2ZLVkRVSzZUdTlRL2tkcUY1Wk04M0h2TzNMSFhTemFKVkxy?=
 =?utf-8?B?ZFY3Yzc1OXdXNkZmMGErMm9UQXVha0FoNWQ5ZVZiNWNYYnJHV3lkYWNpaGVh?=
 =?utf-8?B?czZTSVlkeXJSY3YwSlZJSHI0RHhGQ3I1SWlNRWxVS2NJa0RraUtoSS9SU29X?=
 =?utf-8?B?SGRTOCtTMzNpMlBvOG42OWRkcjcyZ3Ywb3dZRk52N2wzeHdhdVZ4WWpNMDQ4?=
 =?utf-8?B?R28zb091VTd1ZGtDRDA0UVFxRHpVOGdVVTlrSGJpQklVN1VaalpZUGJ5VTZO?=
 =?utf-8?B?c1JsaS9mRUQ5RFFqcm9sU0dUcVNyZXM2dzcwb0djMTdqeDVxdm9kb2dMMEtJ?=
 =?utf-8?Q?+aYcPkvh5nWFPoD/Zp2l5d9rx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e6f38f-3509-4867-b3da-08dbce0c14bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 05:52:28.5342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1XJ2rfvdP1C9/R1VbGIoosD6cEhpIxMe9fj1OWHzRYi3onKWbq8k4mruFovo99al0pW9xSrXYqJ409rwIdPzsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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

PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZT4NCj4gDQo+IEhpIEFuZHksDQo+IA0KPiBP
biAxMC8xMy8yMyAyMjowNSwgU2hldmNoZW5rbywgQW5kcml5IHdyb3RlOg0KPiA+IE9uIFRodSwg
T2N0IDEyLCAyMDIzIGF0IDAxOjE0OjIzUE0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+
IA0KPiA8c25pcD4NCj4gDQo+ID4+IEFoIG9rLCBJIHNlZS4gU28gdGhlIGNvZGU6DQo+ID4+DQo+
ID4+IDEuIEZpcnN0IHRyaWVzIHRvIGZpbmQgdGhlIG1hdGNoaW5nIGNoaWxkIGFjcGlfZGV2aWNl
IGZvciB0aGUgYXV4ZGV2DQo+ID4+IGJ5IEFEUg0KPiA+Pg0KPiA+PiAyLiBJZiAxLiBmYWlscyB0
aGVuIGZhbGxzIGJhY2sgdG8gSElEICsgVUlEIG1hdGNoaW5nDQo+ID4+DQo+ID4+IEFuZCB0aGVy
ZSBhcmUgRFNEVHMgd2hpY2ggdXNlIGVpdGhlcjoNCj4gPj4NCj4gPj4gMS4gT25seSB1c2UgX0FE
UiB0byBpZGVudGlmeSB3aGljaCBjaGlsZCBkZXZpY2UgaXMgd2hpY2gsIGxpa2UgdGhlIGV4YW1w
bGUNCj4gPj4gICAgRFNEVCBzbmlwcGV0IGZyb20gdGhlIGNvbW1pdCBtc2cuDQo+ID4+DQo+ID4+
IDIuIE9ubHkgdXNlIF9ISUQgKyBfVUlEIGxpa2UgdGhlIDIgZXhhbXBsZSBEU0RUIHNuaXBwZXRz
IGZyb20gbWUNCj4gPj4gZW1haWwNCj4gPj4NCj4gPj4gQnV0IHRoZXJlIG5ldmVyIGlzIGEgY2Fz
ZSB3aGVyZSBib3RoIF9BRFIgYW5kIF9ISUQgYXJlIHVzZWQgYXQgdGhlDQo+ID4+IHNhbWUgdGlt
ZSAod2hpY2ggd291bGQgYmUgYW4gQUNQSSBzcGVjIHZpb2xhdGlvbiBhcyBBbmR5IHNhaWQpLg0K
PiA+Pg0KPiA+PiBTbyBBRkFJQ1QgdGhlcmUgaXMgbm8gaXNzdWUgaGVyZSBzaW5jZSAgX0FEUiBh
bmQgX0hJRCBhcmUgbmV2ZXIgdXNlcg0KPiA+PiBhdCB0aGUgc2FtZSB0aW1lIGFuZCB0aGUgY29t
bWl0IG1lc3NhZ2UgY29ycmVjdGx5IGRlc2NyaWJlcyBzY2VuYXJpbw0KPiA+PiAxLiBmcm9tIGFi
b3ZlLCBzbyB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgZmluZSB0b28uDQo+ID4+DQo+ID4+IFNvIEkg
YmVsaWV2ZSB0aGF0IHdlIGNhbiBjb250aW51ZSB3aXRoIHRoaXMgcGF0Y2ggc2VyaWVzIGluIGl0
cw0KPiA+PiBjdXJyZW50IHYyMCBmb3JtLCB3aGljaCBoYXMgYWxyZWFkeSBiZWVuIHN0YWdlZCBm
b3IgZ29pbmcgaW50byAtbmV4dA0KPiA+PiBieSBHcmVnLg0KPiA+Pg0KPiA+PiBBbmR5IGNhbiB5
b3UgY29uZmlybSB0aGF0IG1vdmluZyBhaGVhZCB3aXRoIHRoZSBjdXJyZW50IHZlcnNpb24gaXMg
b2sNCj4gPj4gPw0KPiA+DQo+ID4gWWVzIGFzIHdlIGhhdmUgYSBmZXcgd2Vla3MgdG8gZml4IGNv
cm5lciBjYXNlcy4NCj4gPg0KPiA+IFdoYXQgSSdtIHdvcnJ5aW5nIGlzIHRoYXQgb3BlbmluZyBk
b29yIGZvciBfQURSIHRoYXQgc2VlbXMgbmV2ZXIgdXNlZA0KPiA+IGlzIGtpbmRhIGFuIG92ZXJr
aWxsIGhlcmUgKHJlc29sdmluZyBub24tZXhpc3RpbmcgcHJvYmxlbSkuDQo+IA0KPiBJIGFzc3Vt
ZSB0aGF0IHRoZXJlIGFjdHVhbGx5IHNvbWUgRFNEVHMgdXNpbmcgdGhlIF9BRFIgYXBwcm9hY2gg
YW5kIHRoYXQgdGhpcw0KPiBzdXBwb3J0IGlzIG5vdCB0aGVyZSBqdXN0IGZvciBmdW4uDQoNCnJp
Z2h0LCBpdCdzIG5vdCBmb3IgZnVuLCB3ZSB1c2UgX0FEUiBoZXJlIGlzIHRvIHJlZHVjZSB0aGUg
bWFpbnRhaW4gZWZmb3J0IGJlY2F1c2UNCmN1cnJlbnRseSBpdCBkZWZpbmVzIF9ISUQgZm9yIGV2
ZXJ5IG5ldyBwbGF0Zm9ybSBhbmQgdGhlIGRyaXZlcnMgaGF2ZSB0byBiZSB1cGRhdGVkDQphY2Nv
cmRpbmdseSwgd2hpbGUgX0FEUiBkb2Vzbid0IGhhdmUgdGhhdCBwcm9ibGVtLg0KDQo+IFdlbnRv
bmcsIGNhbiB5b3UgY29uZmlybSB0aGF0IHRoZSBfQURSIHVzaW5nIGNvZGVwYXRocyBhcmUgYWN0
dWFsbHkgdXNlZCBvbg0KPiBzb21lIGhhcmR3YXJlIC8gd2l0aCBzb21lIERTRFRzIG91dCB0aGVy
ZSA/DQoNCndoYXQgSSBjYW4gc2hhcmUgaXMgdGhhdCB3ZSB3aWxsIHNlZS4NCg0KPiA+IExvb2tp
bmcgYXQgdGhlIGRlc2lnbiBvZiB0aGUNCj4gPiBkcml2ZXIgSSdtIG5vdCBzdXJlIHdoeSBBQ1BJ
IEhJRHMgYXJlIGNvbGxlY3RlZCBzb21ld2hlcmUgZWxzZSB0aGFuIGluDQo+ID4gdGhlIHJlc3Bl
Y3RpdmUgZHJpdmVycy4NCg0KQUZBSUssIGF1eGlsaWFyeSBidXMgZG9lc24ndCBzdXBwb3J0IHBh
cnNpbmcgZndub2RlcyBjdXJyZW50bHkuIFByb2JhYmx5IHdlIGNhbiANCnN1cHBvcnQgaXQgZm9y
IGF1eGlsaWFyeSBidXMgaW4gYW5vdGhlciBwYXRjaC4gDQoNCj4gPiBBbmQgbG9va2luZyBhdCB0
aGUgSUQgbGlzdHMgdGhlbXNlbHZlcyBJIGFtDQo+ID4gbm90IHN1cmUgd2h5IHRoZSBmaXJtd2Fy
ZSBvZiB0aGUgcmVzcGVjdGl2ZSBoYXJkd2FyZSBwbGF0Zm9ybXMgYXJlIG5vdCB1c2luZw0KPiBf
Q0lELg0KDQpJIHRoaW5rIGZpcm13YXJlIGNhbiBzZWxlY3QgX0NJRCBhcyB3ZWxsLCBidXQgdGhl
IHNoaXBwZWQgaHcgZG9lc24ndCB1c2UgX0NJRCwNCnRoZSBkcml2ZXIgaGFzIHRvIG1ha2Ugc3Vy
ZSB0aGUgc2hpcHBlZCBodyB3b3JraW5nIGFzIHdlbGwuIEFuZCBzd2l0Y2hpbmcgdG8gX0NJRA0K
Zm9yIHRoZSBzaGlwcGVkIGh3IGlzIG5vdCBlYXN5LCBhbmQgaXQgaGFzIHRvIGNoYW5nZSB3aW5k
b3dzIGRyaXZlciBhcyB3ZWxsLg0KDQo+IA0KPiBUaGlzIGlzIGEgVVNCIGRldmljZSB3aGljaCBo
YXMgNCBmdW5jdGlvbnM6DQo+IA0KPiAxLiBHUElPIGNvbnRyb2xsZXINCj4gMi4gSTJDIGNvbnRy
b2xsZXIgMQ0KPiAzLiBJMkMgY29udHJvbGxlciAyDQo+IDQuIFNQSSBjb250cm9sbGVyDQo+IA0K
PiBUaGUgZHJpdmVyIGZvciB0aGUgbWFpbiBVU0IgaW50ZXJmYWNlIHVzZXMgdGhlIG5ldyBhdXhi
dXMgdG8gY3JlYXRlIDQgY2hpbGQNCj4gZGV2aWNlcy4gVGhlIF9BRFIgb3IgaWYgdGhhdCBmYWls
cyBfSElEICsgX1VJRCBtYXRjaGluZyBpcyBkb25lIHRvIGZpbmQgdGhlDQo+IGNvcnJlY3QgYWNw
aV9kZXZpY2UgY2hpbGQgb2YgdGhlIGFjcGlfZGV2aWNlIHdoaWNoIGlzIHRoZSBBQ1BJLWNvbXBh
bmlvbiBvZiB0aGUNCj4gbWFpbiBVU0IgZGV2aWNlLg0KPiANCj4gQWZ0ZXIgbG9va2luZyB1cCB0
aGUgY29ycmVjdCBhY3BpX2RldmljZSBjaGlsZCB0aGlzIGlzIHRoZW4gc2V0IGFzIHRoZSBmd25v
ZGUgLw0KPiBBQ1BJLWNvbXBhbmlvbiBvZiB0aGUgYXV4YnVzIGRldmljZSBjcmVhdGVkIGZvciB0
aGF0IGZ1bmN0aW9uLg0KPiANCj4gSGF2aW5nIHRoZSBjb3JyZWN0IGZ3bm9kZSBpcyBpbXBvcnRh
bnQgYmVjYXVzZSBvdGhlciBwYXJ0cyBvZiB0aGUgRFNEVA0KPiByZWZlcmVuY2UgdGhpcyBmd25v
ZGUgdG8gc3BlY2lmeSBHUElPIC8gSTJDIC8gU1BJIHJlc291cmNlcyBhbmQgaWYgdGhlIGZ3bm9k
ZSBvZg0KPiB0aGUgYXV4LWRldmljZSBpcyBub3Qgc2V0IGNvcnJlY3RseSB0aGVuIHRoZSByZXNv
dXJjZXMgZm9yIG90aGVyIGRldmljZXMNCj4gcmVmZXJlbmNpbmcgaXQgKHR5cGljYWxseSBhIGNh
bWVyYQ0KPiBzZW5zb3IpIGNhbiBub3QgYmUgZm91bmQuDQo+IA0KPiBBcyBmb3Igd2h5IHRoZSBk
cml2ZXIgZm9yIHRoZSBhdXhidXMgZGV2aWNlcyAvIGNoaWxkcmVuIGRvIG5vdCB1c2UgSElEIG1h
dGNoaW5nLA0KPiBBRkFJSyB0aGUgYXV4YnVzIGhhcyBubyBzdXBwb3J0IGZvciB1c2luZyBBQ1BJ
IChvciBEVCkgbWF0Y2hpbmcgZm9yIGF1eC1kZXZpY2VzDQo+IGFuZCB0aGVzZSBkcml2ZXJzIG5l
ZWQgdG8gYmUgYXV4aWxpYXJ5X2RyaXZlcidzIGFuZCBiaW5kIHRvIHRoZSBhdXhidXMgZGV2aWNl
IGFuZA0KPiBub3QgdG8gYSBwbGF0Zm9ybV9kZXZpY2UgaW5zdGFudGlhdGVkIGZvciB0aGUgYWNw
aV9kZXZpY2Ugc2luY2UgdGhleSBuZWVkIHRoZQ0KPiBhdXhidXMgZGV2aWNlIHRvIGFjY2VzcyB0
aGUgVVNCIGRldmljZS4NCg0KWWVzLCB0b3RhbCBhZ3JlZS4gVGhhbmtzDQoNClRoYW5rcw0KV2Vu
dG9uZw0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCj4gDQoNCg==
