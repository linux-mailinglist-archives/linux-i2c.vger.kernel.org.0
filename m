Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8048C7A320D
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 20:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238988AbjIPS4r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Sep 2023 14:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239195AbjIPS4p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Sep 2023 14:56:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A61CE7;
        Sat, 16 Sep 2023 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694890600; x=1726426600;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IqopkPCuspStzQRzGMvs1IfE2m249q0xLRIRKCbvc0k=;
  b=lXDcPRL+/dIEUgnpcx5de4f0L1ENJXLJ+hF5R1YZaCVhoe+JPnDGpfsL
   MJeWdNwJg6wobWGqXWFs0NTs0A+aQ/iZZqIPFARrw4BX0GtEQG8Kq6ypN
   s/Rn08/qeCehJmxPSb3QyLkZm26taEQ0C4FGclX6goBcKCtKT7erSm6/p
   Os7L3K6wkkUkza12XkgqX1XnQhEBSvT9xV1cfIJlGAWt/CG3Udv7LlG92
   vGNuVxKjnz6GgUM+4oczhBekXcKtUs9ZdX5gFkbdspB0ap48lfi/2tjgI
   YjBPbKNIthUViqtpkzHWSJ5lToOYmb686xHoms6IZwyYqFNuf0uoDmV0H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="382176111"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="382176111"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="919020312"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="919020312"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Sep 2023 11:56:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 16 Sep 2023 11:56:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 16 Sep 2023 11:56:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sat, 16 Sep 2023 11:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/m/qyH3cIbagRJaqZtI5/HY/+rho/eLcd52UzXOpRi38aVI/mIIaoCqlVbvkb/f8yGxg0NT0BivWz/U3rsi1z0l1nFggAOgoD71KerB8/wcW3hhQ3yOHEBpFNZOv6KBy3OuPlyO0STItGKZOwublx8XUFkShiWdXH/rPrzLujDfBwapAR2X5H0c1Ui48F0EOXCbnsP+5Lrr3s9rYZYcSOcp65+rOcV2GH0pQscYBThSYmJuIYCxzG6eOblJZzEIdq/kNz9LTCAGEdB8tpzr7/I0ktonAxvTDoIpX5gi2gwtlXxWNX+HEwgf7r5zPetmVxR557dqW+/smKvsnzfSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqopkPCuspStzQRzGMvs1IfE2m249q0xLRIRKCbvc0k=;
 b=QyNxWrQQfa4v05wlOJRcFYR8B20DhGSUzvV0eURsJy4KyeUqUP+uASynyzX1VJEHbrN8WaK4AZHTSDrUn/duP2B88tVJqeUZuL9Z4JiB6z35LqFXd6uUockXldvpL5oGfjp/GvBlCULS+GlLSeEhGlZ7PiyWRtUBTxQ6Wn/FNCLuWYy2N7W6hEithlNI7apolSKbIl12GCWEd9Wl+p/4E8YjRYZo3zYRz6cRx1gK6L07fmvhzTjm9VOV3Ee9wZesQXa6g5FX3Zi/Jja7AufbCiYwah0t5maf5BJ4LgghKF7GS1Snd3xPWrhPsVcLaJRgZURWXQ06dDRtVZ+edljXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21; Sat, 16 Sep 2023 18:56:37 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6792.023; Sat, 16 Sep 2023
 18:56:37 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v17 3/4] spi: Add support for Intel LJCA USB SPI driver
Thread-Topic: [PATCH v17 3/4] spi: Add support for Intel LJCA USB SPI driver
Thread-Index: AQHZ5wor5/N5/IsKLEWimd3KHgQ0w7AdcDaAgABcT+A=
Date:   Sat, 16 Sep 2023 18:56:35 +0000
Message-ID: <DM6PR11MB4316CAEAA00DBD529CA7F6E98DF5A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694695530-31645-1-git-send-email-wentong.wu@intel.com>
 <1694695530-31645-4-git-send-email-wentong.wu@intel.com>
 <1d02f04c-fd02-38f7-a355-76e4975ce5da@redhat.com>
In-Reply-To: <1d02f04c-fd02-38f7-a355-76e4975ce5da@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DM3PR11MB8714:EE_
x-ms-office365-filtering-correlation-id: 03aa02b0-20c5-4e41-1d6b-08dbb6e6a6ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x3pSUtXfzrp5iQg/dUZDGJCQGTOAZ7/UKIhbXOEVzEbhBucLfFtNBv3IygmnSFUtuzfE2+bj5QQYVOjP/ComYHnNiEGW/bHmWouRaHR5fi2CQzFvP1YMlCrqlFPmu7QLgIq77uCp+Q8R/IgHHBgL7ZDdB0NhzLhZOrrW+yGxRZf4VNKaLWjYu5hBE4vNlG7fT8VozR/Dhwu6valBoP2X/eWnYrILL1OBX5Xck8Nhk6YHGLRyzDRklCejYhye0ld82NFJ9+jUhddWk/bgS5i+3mB4k/kfjYtD8RzBXOXlfobL63OMGVdHWt4wybNzP73YnJvD30l+9i5YfvRB6SFgTP4tiSaJSYYHs89CBicvU6tpT/jWubxy+GDZnmAR+ydQJOyTtKRaLpG7hwE1W+9BIAYz3qZiojA7sxVbmxIOuGRq9ZXRlPYBT8WmjL8GOWtBmLsrKKqXVcd6kHwUcsF9hiHlH5+/ENKxJv2myUbjPVenR3274FH39TXOj1DlP05vOHffpDjkV9j7QzBReZbbbTZ1+kXXjug5qWoNOrfAhSezX8PAc3qH5B/mpsyShrsljnJej9Y9RZpLc3DCFXV7LJ4al9xCWJsXbXFfmuVftjy+hFnHq3KVhpL8r1m43T50
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199024)(186009)(1800799009)(5660300002)(41300700001)(8936002)(7416002)(66946007)(4326008)(76116006)(110136005)(66556008)(66476007)(64756008)(8676002)(52536014)(316002)(54906003)(66446008)(2906002)(122000001)(38100700002)(38070700005)(55016003)(86362001)(9686003)(53546011)(26005)(82960400001)(33656002)(478600001)(6506007)(7696005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWI0MmN4SHVVS1RHYlRPUHRFOTVTZWdwaEFZcHBTV3JnOHBob09OWXdhODBx?=
 =?utf-8?B?VW10VEsrQXB0aFgrZTJrQnJXa09YbS9KQjZRN25acUQ1SHFoeTVKRDk2NWhQ?=
 =?utf-8?B?SDZFdk1uZTg3K2taNHNkUnpaSlpBVUlncWxWcVBsNmw1d29GamU0TkRNTkhq?=
 =?utf-8?B?dnZydUNvU05hZENrVm5aZ0hvNHUveVRUQlJ5d0xBVlcwOEJrTEY5Y1RoeWM3?=
 =?utf-8?B?YmF6UFg5VDhIaG5wak1seWtEMzYyeGdYUkpMNXl1aFJSVExwNFJlZ0xhc2Iz?=
 =?utf-8?B?b2lFRkF3cTRSSjhiSlg0SUNMUSt3RTU2dWlONHVWUCtWQWRHRHRYalh5MVVw?=
 =?utf-8?B?WFp3ZW1nMTY4clhPYlcwODM2cHNENTE0RjNFcFJUMkdTOGh6d0h2d2JUSEJN?=
 =?utf-8?B?dy9tazVBWXhoekhqSDJHMHlKQjIrOVdGT3g3d2pPTjAvZkZjYlB5OUJjQ2l2?=
 =?utf-8?B?WWJtOWN4TWhFSHNHTzdZVGlSSnhsS04xUjU2U1NpNDJablZtTkxNMkdNOGFS?=
 =?utf-8?B?SG40bWZtYUgrdldRRkJhRG84N0lCMnBRSGh3YzNmSTVaTHErL2djZGlhSy9i?=
 =?utf-8?B?UWcxbk1YT1FkYmZydWdrVU10cmVXL1htNlRVaWVUS1A2YXFOZmVMaFhyUWdo?=
 =?utf-8?B?WG5XZis2NVRLZDB1WUZBWll0NG1GWlhZQ1RydnEveXQ0UHNwYW9acU5mdHhs?=
 =?utf-8?B?ZkNWcjR2SE1iM0JicnIzQzV6NG5TTzM1dmY3clBpM0hkY3RIZE8yRzd3azEw?=
 =?utf-8?B?SFpvdms4ZEV2UnBzN0ZoWVZUa3NtYUtTUlk5Q0tIR2tBVnNyRTBKSFJtR1Ez?=
 =?utf-8?B?WVgrcGtvaFV3OGZ1emVLUC8rMmJITjZHak1JeFRHZW9tQkY1YWlRUWZWWU1G?=
 =?utf-8?B?VUtmQ3EyVkNyRG1BbTJsMmE3YXpjTnh3VUV4SEJtK1AxLzF2MTZBR2ZkY3Rk?=
 =?utf-8?B?STFFSmplcXhPZGFyQkRJU0JDRjZqdUFFdjYyV1QwSndzaGVNUDV0bHpHdGFF?=
 =?utf-8?B?eDNwbUtTVkplT2l1RjhMVWVmakp1TUtYNUs1c0VSam0yMzhzVkVISkVSOGxX?=
 =?utf-8?B?MFdqT3VWTW1QYXdHUVlSbFJKVlU2VGYwaFFwUysvQnFOSWtkUHZScWphNnQ0?=
 =?utf-8?B?NklraVRuNmdRZktsYVBtZjJFVmdLVDltc0ErWVJ3emxDYm5LMDNqUXRXRGdm?=
 =?utf-8?B?RWlBR3RCZW5laTVyY3Y2MlpOcVQ5dXFkUnpEVDRvWERnNy9hYlQ5ODEwbFRs?=
 =?utf-8?B?QVpQc3hYdU01SWJtRFRXNGxINVRidDl6WlRwZENqUVRqK2I5ckpCTll1VzE0?=
 =?utf-8?B?VXpBL1pQN2NySS9BODNicUxGVVJYbllMUWoraHVDYUF6R3o1LzVFRlEwZzgv?=
 =?utf-8?B?dER0SkZkdy9zQ1pkdmVxYXNqZFpwTTRvUXRGKy92V05WcG9uM3JmTEE0VlJa?=
 =?utf-8?B?QmxNT2NSMktkVXpjSE40YlozUGxBK1ZKVXR2cENZNmZTd0kzandIelRnRGNY?=
 =?utf-8?B?RXRsSDM2cnJoajg3b3JOMmg1OGpBbUNJNkFnbkF3WmNlb3draHlkRS9YUWQx?=
 =?utf-8?B?dzdmLzdIQlM0NkhCTUpBSENrU2tCUU94eDBaU0JEZzIwNjNNcnVQczQ4eXdC?=
 =?utf-8?B?OVc4U2tvb21qZUZkNytTUkJ3eU9XY0s1elliTTZKTWxrWEJvS0FVMlhRbjVh?=
 =?utf-8?B?dGpVR3MvUHlxUnJVcG9pWDRKMWhvMzltaWJlSzdVMy9sZ0p3VWNnTG9JbGRv?=
 =?utf-8?B?ay85ekJHTmh2MjNPeWtIRU56MXMwQ3lvZFBIOHZSTmUxb0pFWHB2QWJtR24w?=
 =?utf-8?B?UllWSFZtVzZJaHJEd3NtWUdoL2VjeWp3SEFzNjB0eTdhMkhEY1hzWWJsVzNG?=
 =?utf-8?B?VHVBN241LzZRbTgxWXhLeEZKR09Fdk5sSHM1aU1xeDRQRmlhQ0hmVHlGVkhX?=
 =?utf-8?B?UjBOL2xVL2hVbDdULzArZGx6RHdXVVR3dWFVZXplSG5tUlFGa2lOMjZYNGYv?=
 =?utf-8?B?ZGwzQy95RFIrY3pPWmJVNzNPNUptbUQrNDZ3dXJGaUx6YkFpRnprOElaR1Yr?=
 =?utf-8?B?Y1FTczlJbzdZeWdveDlFMzZqM3pZTVZ1WTVWUFl5UXVYNFJMNTd3MlFvSlNr?=
 =?utf-8?Q?gHxAX3NyEiLLY4v5JO9SgI6b9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03aa02b0-20c5-4e41-1d6b-08dbb6e6a6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2023 18:56:35.8620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcKnyORUaugnkeKmhBI4P64Dp90MdPOetwk3EyknyHUbubY9oGViihvCSLkiWQLI49mLbRad35TTjmJqOXzh4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBIYW5zIGRlIEdvZWRlDQo+IA0KPiBIaSBXZW50b25nLA0KPiANCj4gT24gOS8xNC8y
MyAxNDo0NSwgV2VudG9uZyBXdSB3cm90ZToNCj4gPiBJbXBsZW1lbnRzIHRoZSBTUEkgZnVuY3Rp
b24gb2YgSW50ZWwgVVNCLUkyQy9HUElPL1NQSSBhZGFwdGVyIGRldmljZQ0KPiA+IG5hbWVkICJM
YSBKb2xsYSBDb3ZlIEFkYXB0ZXIiIChMSkNBKS4gSXQgY29tbXVuaWNhdGUgd2l0aCBMSkNBIFNQ
SQ0KPiA+IG1vZHVsZSB3aXRoIHNwZWNpZmljIHByb3RvY29sIHRocm91Z2ggaW50ZXJmYWNlcyBl
eHBvcnRlZCBieSBMSkNBIFVTQg0KPiA+IGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFdlbnRvbmcgV3UgPHdlbnRvbmcud3VAaW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBTYWth
cmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6
IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAbGludXguaW50ZWwuY29tPg0KPiA+IFRlc3RlZC1ieTog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9zcGkvS2NvbmZpZyAgICB8ICAxMSArKw0KPiA+ICBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgIHwg
ICAxICsNCj4gPiAgZHJpdmVycy9zcGkvc3BpLWxqY2EuYyB8IDI5Nw0KPiA+ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCAzMDkgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9z
cGkvc3BpLWxqY2EuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL0tjb25maWcg
Yi9kcml2ZXJzL3NwaS9LY29uZmlnIGluZGV4DQo+ID4gODk2MmIyNS4uYWQxODg2NCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL3NwaS9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9zcGkvS2Nv
bmZpZw0KPiA+IEBAIC01ODMsNiArNTgzLDE3IEBAIGNvbmZpZyBTUElfRlNMX0VTUEkNCj4gPiAg
CSAgRnJvbSBNUEM4NTM2LCA4NXh4IHBsYXRmb3JtIHVzZXMgdGhlIGNvbnRyb2xsZXIsIGFuZCBh
bGwgUDEweHgsDQo+ID4gIAkgIFAyMHh4LCBQMzB4eCxQNDB4eCwgUDUweHggdXNlcyB0aGlzIGNv
bnRyb2xsZXIuDQo+ID4NCj4gPiArY29uZmlnIFNQSV9MSkNBDQo+ID4gKwl0cmlzdGF0ZSAiSW50
ZWwgTGEgSm9sbGEgQ292ZSBBZGFwdGVyIFNQSSBzdXBwb3J0Ig0KPiA+ICsJZGVwZW5kcyBvbiBV
U0JfTEpDQQ0KPiA+ICsJZGVmYXVsdCBVU0JfTEpDQQ0KPiA+ICsJaGVscA0KPiA+ICsJICBTZWxl
Y3QgdGhpcyBvcHRpb24gdG8gZW5hYmxlIFNQSSBkcml2ZXIgZm9yIHRoZSBJbnRlbA0KPiA+ICsJ
ICBMYSBKb2xsYSBDb3ZlIEFkYXB0ZXIgKExKQ0EpIGJvYXJkLg0KPiA+ICsNCj4gPiArCSAgVGhp
cyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMgYSBtb2R1bGUuIElmIHNvLCB0aGUgbW9kdWxl
DQo+ID4gKwkgIHdpbGwgYmUgY2FsbGVkIHNwaS1samNhLg0KPiA+ICsNCj4gPiAgY29uZmlnIFNQ
SV9NRVNPTl9TUElDQw0KPiA+ICAJdHJpc3RhdGUgIkFtbG9naWMgTWVzb24gU1BJQ0MgY29udHJv
bGxlciINCj4gPiAgCWRlcGVuZHMgb24gQ09NTU9OX0NMSw0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NwaS9NYWtlZmlsZSBiL2RyaXZlcnMvc3BpL01ha2VmaWxlIGluZGV4DQo+ID4gMDgwYzJj
MS4uMDg0Nzk2MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NwaS9NYWtlZmlsZQ0KPiA+ICsr
KyBiL2RyaXZlcnMvc3BpL01ha2VmaWxlDQo+ID4gQEAgLTcwLDYgKzcwLDcgQEAgb2JqLSQoQ09O
RklHX1NQSV9JTlRFTF9QQ0kpCQkrPSBzcGktaW50ZWwtDQo+IHBjaS5vDQo+ID4gIG9iai0kKENP
TkZJR19TUElfSU5URUxfUExBVEZPUk0pCSs9IHNwaS1pbnRlbC1wbGF0Zm9ybS5vDQo+ID4gIG9i
ai0kKENPTkZJR19TUElfTEFOVElRX1NTQykJCSs9IHNwaS1sYW50aXEtc3NjLm8NCj4gPiAgb2Jq
LSQoQ09ORklHX1NQSV9KQ09SRSkJCQkrPSBzcGktamNvcmUubw0KPiA+ICtvYmotJChDT05GSUdf
U1BJX0xKQ0EpCQkJKz0gc3BpLWxqY2Eubw0KPiA+ICBvYmotJChDT05GSUdfU1BJX0xNNzBfTExQ
KQkJKz0gc3BpLWxtNzBsbHAubw0KPiA+ICBvYmotJChDT05GSUdfU1BJX0xQODg0MV9SVEMpCQkr
PSBzcGktbHA4ODQxLXJ0Yy5vDQo+ID4gIG9iai0kKENPTkZJR19TUElfTUVTT05fU1BJQ0MpCQkr
PSBzcGktbWVzb24tc3BpY2Mubw0KPiANCj4gSSBkb24ndCBrbm93IHdoYXQgeW91IGFyZSB1c2lu
ZyBhcyBhIGJhc2UgY29tbWl0IGZvciB0aGVzZSBwYXRjaGVzLCBidXQgdGhpcw0KPiBkb2VzIG5v
dCBhcHBseSBjbGVhbmx5IG9uIHRvcCBvZiB2Ni42LXJjMS4NCj4gDQo+IEZvciB0aGUgbmV4dCB2
ZXJzaW9uIG9mIHRoZXNlIHBhdGNoZXMgcGxlYXNlIHJlYmFzZXMgdGhpcyBvbiB0b3Agb2YgdjYu
Ni1yYzE7IG9yDQo+IG9uIExpbnVzJyBtYXN0ZXIgYnJhbmNoLg0KPiANCg0KVGhhbmtzLCB2MTcg
aXMgYmFzZWQgb24gNi41LXJjNCwgbm93IHYxOSBpcyBiYXNlZCBvbiBMaW51cycgbWFzdGVyIGJy
YW5jaC4NCg0KQlIsDQpXZW50b25nDQoNCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCg==
