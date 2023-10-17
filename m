Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006467CB78D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Oct 2023 02:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbjJQAqY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Oct 2023 20:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233549AbjJQAqX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Oct 2023 20:46:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFCD92;
        Mon, 16 Oct 2023 17:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697503581; x=1729039581;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3mmV4uChs6CrY50KZ6de0InyfCYJRqhWHCVLchiFSmY=;
  b=Dr+pCR/PgASQhCvAywvfZHTnGZGL+Qbdr2ZJTkPG1cxQ3TT2FXC04xf0
   pCztX6SZluw5jpXHx2ocAP8402kddv0Q9nUy7OMIS3hzU1DMVCbFXiGHz
   zQ2d1jKG/d1/1SzFRmk/qy67SaBgMZ0XOoEpSupZASzkuXQKyEV3prGDZ
   Z8yHBJcj8mHdAYLNtIOzl0IIggdXz4whugcijTDF+yFe+D57hmHlwIQBn
   zdguPSLaBoNHjMnB7iIQW+im1skmQu+5Ie+LHnxU0FebAeNNsJ5GHEE6f
   xSw5aHAMKN7lnPUDk1PwU1Q9ROPOm3kswKoI3Daxkco8LYu7J99/NvD26
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376040610"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="376040610"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929558336"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="929558336"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 17:46:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 17:46:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 17:46:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 17:46:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 17:46:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O14hSWIx1cGx1S2+gMuvMAy/FVlkKIoFb0reTd29Z9KylzfgTbvGkvUUSs5D4fio8u3PNrw3UMiQw5YMrBYK8f8TOsJmzzMg7y24u/lLe5a+MihFEjyRGSJTuTUPGC4+W4MW+gCqISJEUoDoPePUscW+QND1qbyWYQVFjvd4toAwdP9qR28M95FGjg5SMZ/kLlz5+60bVNa3bgMF9TIaKmmpXHfTOvwa738Hcf1BdFq/ofs2Mb2jxhp6r21lzkMFzo7DacTzW7tGG350wJhxGhyr599PZcIrvrKu2KZHlAw/St+xsUPTez0HoNIhLdAvyBId3Nnt2qLUYwYp4DD8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mmV4uChs6CrY50KZ6de0InyfCYJRqhWHCVLchiFSmY=;
 b=MupmpZdssMPpgTE20KqMKsy7ndU6OsGQpJAC7KpyDNftjvtHxtS44LE12ts6uXavyKoGLH9Bsyg6MpYf21trCusUFo8AB79zC0Kb8VUQjxO6Ex+bhJEjyyg1JAdTEVV8mcMydjut1S4yreKwKY9oGWReY90yxdxYllLpjEAp+BI4XaHKtwnnqkRSC4OaT6ZCIodHThSiroExxcah6TVqpFH7quchfBA0WGBTVpsibTg/tuUq+WqYXORTIiY79xJKB9YZSahCtxp0BixCWiSQrfx2GKNCMrIdYbCKtt++oXMzmeuOxXc5H91wg/AW2eFLl9PWq26Chv6f8nvUnVjmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Tue, 17 Oct
 2023 00:46:17 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6863.046; Tue, 17 Oct 2023
 00:46:17 +0000
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
Thread-Index: AQHZ+nqZYOWB2QQzm0agSGlxpBPNmbBEZGUAgAAEnYCAAByScIABf/iAgAImwQCAAPlcAIACx//wgAAk8gCAAHc9cIAACXCAgAAFf1CAAAdtAIAAFOiAgAB6mmA=
Date:   Tue, 17 Oct 2023 00:46:17 +0000
Message-ID: <DM6PR11MB43166B4FFB86D12A36F23B398DD6A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
 <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
 <DM6PR11MB43169A9ADDA7681DB7D9347C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZSzogNhlX9njvOIU@smile.fi.intel.com>
 <DM6PR11MB4316382324D15985A70E531C8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <2023101653-shiftless-scorebook-19e3@gregkh>
 <DM6PR11MB4316711C71937AE3C0516C7B8DD7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZS1fSPhfREVlELLD@smile.fi.intel.com>
 <5747b78e-1956-8249-8f5e-85426b3efd01@redhat.com>
In-Reply-To: <5747b78e-1956-8249-8f5e-85426b3efd01@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SN7PR11MB7975:EE_
x-ms-office365-filtering-correlation-id: c79b0372-e061-4eb4-a845-08dbceaa78ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Afjj4IL8o8MwWGuUKNHb3AbIPJ4wnFWyPQICMdxyWFFWzuOg1c0LWeplFjQDVoC9ey/oBnyhLMBF8LrTJwsO/czag3dBiCI/Xfhmnvfkzwn0AYt5EptPlC80/fBcgDpx+ndXKtCYpV20/DNyc3JDsOsj+sbIEPrTuEXim2E/1l2DzZm8XcAddeXoWhD7/lReGXQFIKcdHY1FKoBfj08//DHn9/bXoth1mbXgu8qpJgUSg8rM2N4q3mX34vHZ+UpSLRhhqd1AuivdFjSjC/Thz57ShTEsRYPF0eIQGRuhEuejomJgyHOZPRQ+UqHFfAKgaUaVI98MsBjlaUGyRtYrOQ/obSnLeOF/YQOj/n12SyUi2tmiyX9txYuh19tZMnVqf9a9xtVyT9V1Aw4N2cJ0FDS25mn7oK7PkgkACiAqgJIPs9vbsULILZ3SXSWOuy7Ey2h5c4T/G2zYvcO7+rVZG1NlWzbt9UGVH4NtJzfqSmnSo1qJKTrhelDOV6G0RVINirb2QC/qUmgxQaf44aSbwT0N8ZWJ/evXAnnyBSwZ4OSVVHPiRr/GtVLTA7hE3Ti3wJKLqshgQT4/FiYXnSlRh/iP/OVUGlJYKT+Nt5YUlC9cTP0KdSilAirunW+Iwc7s
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(26005)(45080400002)(64756008)(66946007)(71200400001)(38100700002)(316002)(38070700005)(76116006)(66446008)(66556008)(54906003)(6636002)(41300700001)(53546011)(110136005)(66476007)(83380400001)(5660300002)(8936002)(4326008)(8676002)(7696005)(9686003)(478600001)(52536014)(6506007)(7416002)(2906002)(82960400001)(55016003)(122000001)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUtFTkxnWHdvS09lYXlucTUvZi9sQ0x5ancxYVJQTlhpMkxnYjlZVVdIeDF4?=
 =?utf-8?B?cVhVdURSKzBESTMyNnBZOGZDOW9IcXUvVTFtREtYakpzUVhqNFZHb1o1Z1Nq?=
 =?utf-8?B?T3dFNkl3ckVFVUorS0RPUnFGVFZqOTM0bzJiNHVWYk1DY1ppZitsNGI2SlBB?=
 =?utf-8?B?RjA3Zi9Rbk0vZFpBajYrOXhEODFocElBOE9ySm5DZmdCS3cxWHJKQkVlSmkv?=
 =?utf-8?B?ZlpzUmVmbHFXUFhDTXNaWXlNaU04d09JRzg3MkpjbVVxVXBNWnIwQThLUVlZ?=
 =?utf-8?B?VG40TWVYa012dEd0MXpzeXA0bi92aHVGOG5qU0VTZlgyUEI4ZUJXOGlOcnVG?=
 =?utf-8?B?ZjJqcWFPUVFTbzRTYWI5UVhHNXV1a2lkdlByLzdnNi9uWkJWcG0wSHc0VVhv?=
 =?utf-8?B?UkVOTGk4ZzBzSG5vTzFERGJOYm1VQnkycFZQclBMU2R0TUg2blZxcEJuZnkx?=
 =?utf-8?B?ZmxXLzNvN1htZTk5Wkw2WWtOSVpNMmpoQTM4ZE1YNWt6RkxFTVFEbzJHVGht?=
 =?utf-8?B?Y0JQZHFac0RSK1lqVVJJT1VPWTM5WkVLSGhrVU05SkJLTW53VURxWHgwWmFi?=
 =?utf-8?B?K1lZYlQvOTZ5ZFVITUkvSVNDUHYzYjhsZjRJNGhhcG9vOUVJbUxZS1pQdmNW?=
 =?utf-8?B?N25kK3JxV2RiUDVweE0rUGJtME5aNkt6QlBhREF0NXhHUS9PdE9ncm9KTjhZ?=
 =?utf-8?B?anFxSElWWlROOWh6NGt0dWNKVUpleGlHeVl6NWczNllVbXNCNmUxV094QUFY?=
 =?utf-8?B?TjcrNHhjR2RCOXk0d0Nqb1JuMlMvRFkvdDh3S0txMEVvNmcrVVdNaTNFVXRl?=
 =?utf-8?B?amZqVjZhaTg2TGFGUmlsbEppSzQ3UkJqYzdweGxVVnBaL21BWVVaVkkvRXBO?=
 =?utf-8?B?d3QrQjExSWVlWnBGSmN4RDZYd1c5WGFUM2NzR21oQlUxbjFxQjlKQUdXd0NC?=
 =?utf-8?B?OGtMVktuL1psWFRHMS9XR2dnUE1ybzk1c1VoU1pRUm5KU29aUU93bjZZL3Mx?=
 =?utf-8?B?d1hlYXlKeUZuZXp0NWh4M0VhR2JNZUoxUGdpQVhFbUErZnlUSG1YeHRKcytu?=
 =?utf-8?B?cHdSZTRYSFNOT2JzdEU0MTJ5T2laY01XZkFsWit0RW1wZkhISE52R3YrODIx?=
 =?utf-8?B?Mjk2aXpTdWxDTFZ4c0hJeU02eVFUSjBmVmM1ME9xcURLY3pxNEdZZllGWXUw?=
 =?utf-8?B?WFVkQTNCTUNxZm5qZFV2VmYzY21rV1l2MlZ1TlBFUzVqdFJHMERXdk51WSsr?=
 =?utf-8?B?VUdHbTZzVDJsZEVPSVVxbDBxZ3NIc05LNFBxd0g4WTJsRXVHc2JrRUo4eW13?=
 =?utf-8?B?WWxJSE9DR2ZyODF2UC83NEM2YTdmZVV1QW15U0ZhS25IbUlTQmpIOUJPbHpV?=
 =?utf-8?B?OXZhT21UTTd6Sm5pN1kvK1Q4UmFzeW5oZFEyZUpmUkxpbVFsZWVmVUN4R0kw?=
 =?utf-8?B?VGhYV2N3d05WRmhaeC90M0p1ZWM2K05MQXk1VGxGUTRGVmJkSFBja0xLQzEx?=
 =?utf-8?B?UCtIK0dLU1lDYmtLY0Z6U1J3SW5XNlIrRWVxWnJoNldaK2p3ck1IV3pXdU1C?=
 =?utf-8?B?SjJkaXBtMkxLQ2RFZEJ5OGJzVFFjVFdMZ01WUFVnR3dpVnoyZUNuN0dIWDF4?=
 =?utf-8?B?MUIrRVUrSHB0Z005QUNLME9RalQ1UlhlRUJVT2dPdUpBZkZTZUVPSStoeEw2?=
 =?utf-8?B?aFo3cFN1czk3VWJhY21JSzhnRU9RZ0NNMy9TWCtKZW5wZGxsNlJvaGRiWm5P?=
 =?utf-8?B?alVzc2Q3YXhGeEFhVmJZQk5VVEx6MlE3dExMTkhOVWR4NmdnTFFhbDJkTHFa?=
 =?utf-8?B?R1Y5cGtwenZORnRoWnpoZ0VZWjFBNERjVlBGV1RHbWRaNHpRSStwaUVSczBq?=
 =?utf-8?B?R1EzSzJVZ01lZ0lJTEtjSTV0RU9VcXAwVWlHb0hPWkpTbXdPSjM3QXc2b2dJ?=
 =?utf-8?B?ZGhFU2VrZWhhc2RRUW1ZZ01IS1laZmVxU0c1TVg2UGdMVzFGQzNrUUt2NE9W?=
 =?utf-8?B?NDVWcWkvWVduaVN6ZFRWY1lwL0dKYkVxSEtveFVPUmZ0bjB6cHIrd01ySitD?=
 =?utf-8?B?aHdYaE9hbVV3MmpHWU9KUFIwNXV0dGxJeXhJY2FCaHZsdk5FQ2FEc3Zvd2VJ?=
 =?utf-8?Q?jXPsMqqW3MaTgG85nvAHHbp1W?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79b0372-e061-4eb4-a845-08dbceaa78ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 00:46:17.1568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGVQIV+m75VS2qNtx4RqsVm43Iy0qB3jFOVvOHNJEKbrT/4VDXey633JDmugeyOHz5HWgxsOgWJ4RjWCraHx+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZT4NCj4gT24gMTAvMTYvMjMgMTg6MDUsIFNo
ZXZjaGVua28sIEFuZHJpeSB3cm90ZToNCj4gPiBPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCAwNjo0
NDoyMVBNICswMzAwLCBXdSwgV2VudG9uZyB3cm90ZToNCj4gPj4+IEZyb206IGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnDQo+ID4+PiBPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCAwMzowNTowOVBN
ICswMDAwLCBXdSwgV2VudG9uZyB3cm90ZToNCj4gPj4+Pj4gRnJvbTogU2hldmNoZW5rbywgQW5k
cml5DQo+ID4+Pj4+IE9uIE1vbiwgT2N0IDE2LCAyMDIzIGF0IDA4OjUyOjI4QU0gKzAzMDAsIFd1
LCBXZW50b25nIHdyb3RlOg0KPiA+DQo+ID4gLi4uDQo+ID4NCj4gPj4+Pj4gQnV0IHRoaXMgZG9l
cyBub3QgY29uZmlybSBpZiB5b3UgaGF2ZSBzdWNoIGRldmljZXMuIE1vcmVvdmVyLCBNeQ0KPiA+
Pj4+PiBxdWVzdGlvbiBhYm91dCBfQ0lEIHBlciBmdW5jdGlvbiBzdGF5cyB0aGUgc2FtZS4gV2h5
IGZpcm13YXJlIGlzDQo+ID4+Pj4+IG5vdCB1c2luZw0KPiA+Pj4gaXQ/DQo+ID4+Pj4NCj4gPj4+
PiBZZXMsIGJvdGggX0FEUiBhbmQgX0NJRCBjYW4gc3RvcCBncm93aW5nIGxpc3QgaW4gdGhlIGRy
aXZlci4gQW5kDQo+ID4+Pj4gZm9yIF9BRFIsIGl0IGFsc28gb25seSByZXF1aXJlIG9uZSBJRCBw
ZXIgZnVuY3Rpb24uIEkgZG9uJ3Qga25vdw0KPiA+Pj4+IHdoeSBCSU9TIHRlYW0gZG9lc24ndCBz
ZWxlY3QgX0NJRCwgYnV0IEkgaGF2ZSBzdWdnZXN0ZWQgdXNlIF9BRFINCj4gPj4+PiBpbnRlcm5h
bGx5LCBhbmQgLCB0byBtYWtlIHRoaW5ncyBtb3ZpbmcgZm9yd2FyZCwgdGhlIGRyaXZlciBhZGRz
DQo+ID4+Pj4gc3VwcG9ydCBmb3IgX0FEUiBoZXJlDQo+ID4+PiBmaXJzdC4NCj4gPj4+Pg0KPiA+
Pj4+IEJ1dCB5b3UncmUgcmlnaHQsIF9DSUQgaXMgYW5vdGhlciBzb2x1dGlvbiBhcyB3ZWxsLCB3
ZSB3aWxsIGRpc2N1c3MNCj4gPj4+PiBpdCB3aXRoIGZpcm13YXJlIHRlYW0gbW9yZS4NCj4gPj4+
DQo+ID4+PiBTaG91bGQgSSByZXZlcnQgdGhpcyBzZXJpZXMgbm93IHVudGlsIHRoaXMgZ2V0cyBz
b3J0ZWQgb3V0Pw0KPiA+Pg0KPiA+PiBDdXJyZW50IF9BRFIgc3VwcG9ydCBpcyBhIHNvbHV0aW9u
LCBJIGRvbid0IHRoaW5rIF9DSUQgaXMgYmV0dGVyIHRoYW4NCj4gPj4gX0FEUiB0byBib3RoIHN0
b3AgZ3Jvd2luZyBsaXN0IGluIGRyaXZlciBhbmQgc3VwcG9ydCB0aGUgc2hpcHBlZCBoYXJkd2Fy
ZSBhdA0KPiB0aGUgc2FtZSB0aW1lLg0KPiA+Pg0KPiA+PiBBbmR5LCB3aGF0J3MgeW91ciBpZGVh
Pw0KPiA+DQo+ID4gSW4gbXkgb3BpbmlvbiBpZiBfQ0lEIGNhbiBiZSBtYWRlLCBpdCdzIGJldHRl
ciB0aGFuIF9BRFIuIEFzIHVzaW5nDQo+ID4gX0FEUiBsaWtlIHlvdSBkbyBpcyBhIGJpdCBvZiBn
cmV5IGFyZWEgaW4gdGhlIEFDUEkgc3BlY2lmaWNhdGlvbi4NCj4gPiBJLm8udy4gY2FuIHlvdSBn
ZXQgYSBjb25maXJtYXRpb24sIGxldCdzIHNheSwgZnJvbSBNaWNyb3NvZnQsIHRoYXQNCj4gPiB0
aGV5IHdpbGwgZ28geW91ciB3YXkgZm9yIG90aGVyIHNpbWlsYXIgZGV2aWNlcz8NCj4gPg0KPiA+
IEJ0dywgTWljcm9zb2Z0IGhhcyB0aGVpciBvd24gc29sdXRpb24gYWN0dWFsbHkgdXNpbmcgX0FE
UiBmb3IgdGhlIHNvDQo+ID4gY2FsbGVkICJ3aXJlZCIgVVNCIGRldmljZXMuIElzIGl0IHlvdXIg
Y2FzZT8gSWYgc28sIEknbSBub3Qgc3VyZSB3aHkNCj4gPiBfSElEIGhhcyBiZWVuIHVzZWQgZnJv
bSBkYXkgMS4uLg0KDQpUaGFua3MgZm9yIHlvdXIgaW5mbywgd2Ugd2lsbCBkaXNjdXNzIG1vcmUg
d2l0aCB0aGVtLCBidXQgSSBhbHNvIHRoaW5rIHdlDQpzaG91bGQga2VlcCB0aGlzIHNlcmllcyBh
bmQgSSB3aWxsIGRvIHRoZSBmb2xsb3cgdXAgYXMgSGFucycgc3VnZ2VzdC4NCg0KPiA+IEFsc28g
SSBzdWdnZXN0IHRvIHdhaXQgZm9yIEhhbnMnIG9waW5pb24gb24gdGhlIHRvcGljLg0KPiANCj4g
SSBkZWZpbml0ZWx5IGRvbid0IHRoaW5rIHdlIHNob3VsZCByZXZlcnQgdGhlIGVudGlyZSBzZXJp
ZXMgc2luY2UgdGhpcyBzdXBwb3J0cw0KPiBhY3R1YWwgaHcgd2hpY2ggaGFzIGFscmVhZHkgYmVl
biBzaGlwcGluZyBmb3IgeWVhcnMuDQoNClRvdGFsbHkgYWdyZWUsIHRoYW5rcw0KDQo+IA0KPiBC
dXQgaWYgdGhlIF9BRFIgc3VwcG9ydCBpcyBvbmx5IHRoZXJlIHRvIHN1cHBvcnQgZnV0dXJlIGh3
IGFuZCBpdCBpcyBub3QgZXZlbg0KPiBjZXJ0YWluIHlldCB0aGF0IHRoYXQgZnV0dXJlIGh3IGlz
IGFjdHVhbGx5IGdvaW5nIHRvIGJlIHVzaW5nIF9BRFIgc3VwcG9ydCB0aGVuIEkNCj4gYmVsaWV2
ZSB0aGF0IGEgZm9sbG93LXVwIHBhdGNoIHRvIGRyb3AgX0FEUiBzdXBwb3J0IGZvciBub3cgaXMg
aW4gb3JkZXIuIFdlIGNhbg0KPiB0aGVuIHJlLWludHJvZHVjZSBpdCAocmV2ZXJ0IHRoZSBmb2xs
b3cgdXAgcGF0Y2gpIGlmIGZ1dHVyZSBodyBhY3R1YWxseSBzdGFydHMgdXNpbmcNCj4gX0FEUiBz
dXBwb3J0Lg0KDQpZZXMsIHRoYW5rcy4NCg0KPiANCj4gU3BlY2lmaWNhbGx5IHdoYXQgSSdtIHN1
Z2dlc3RpbmcgaXMgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZzoNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9taXNjL3VzYi1samNhLmMgYi9kcml2ZXJzL3VzYi9taXNjL3VzYi1s
amNhLmMgaW5kZXgNCj4gYzlkZWNkMDM5NmQ0Li5lMWJiYWY5NjQ3ODYgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvdXNiL21pc2MvdXNiLWxqY2EuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9taXNjL3Vz
Yi1samNhLmMNCj4gQEAgLTQ1Nyw4ICs0NTcsOCBAQCBzdGF0aWMgdm9pZCBsamNhX2F1eGRldl9h
Y3BpX2JpbmQoc3RydWN0IGxqY2FfYWRhcHRlcg0KPiAqYWRhcCwNCj4gIAkJCQkgIHU2NCBhZHIs
IHU4IGlkKQ0KPiAgew0KPiAgCXN0cnVjdCBsamNhX21hdGNoX2lkc193YWxrX2RhdGEgd2QgPSB7
IDAgfTsNCj4gLQlzdHJ1Y3QgYWNwaV9kZXZpY2UgKnBhcmVudCwgKmFkZXY7DQo+ICAJc3RydWN0
IGRldmljZSAqZGV2ID0gYWRhcC0+ZGV2Ow0KPiArCXN0cnVjdCBhY3BpX2RldmljZSAqcGFyZW50
Ow0KPiAgCWNoYXIgdWlkWzRdOw0KPiANCj4gIAlwYXJlbnQgPSBBQ1BJX0NPTVBBTklPTihkZXYp
Ow0KPiBAQCAtNDY2LDE3ICs0NjYsNyBAQCBzdGF0aWMgdm9pZCBsamNhX2F1eGRldl9hY3BpX2Jp
bmQoc3RydWN0IGxqY2FfYWRhcHRlcg0KPiAqYWRhcCwNCj4gIAkJcmV0dXJuOw0KPiANCj4gIAkv
Kg0KPiAtCSAqIGdldCBhdXhkZXYgQUNQSSBoYW5kbGUgZnJvbSB0aGUgQUNQSSBkZXZpY2UgZGly
ZWN0bHkNCj4gLQkgKiB1bmRlciB0aGUgcGFyZW50IHRoYXQgbWF0Y2hlcyBfQURSLg0KPiAtCSAq
Lw0KPiAtCWFkZXYgPSBhY3BpX2ZpbmRfY2hpbGRfZGV2aWNlKHBhcmVudCwgYWRyLCBmYWxzZSk7
DQo+IC0JaWYgKGFkZXYpIHsNCj4gLQkJQUNQSV9DT01QQU5JT05fU0VUKCZhdXhkZXYtPmRldiwg
YWRldik7DQo+IC0JCXJldHVybjsNCj4gLQl9DQo+IC0NCj4gLQkvKg0KPiAtCSAqIF9BRFIgaXMg
YSBncmV5IGFyZWEgaW4gdGhlIEFDUEkgc3BlY2lmaWNhdGlvbiwgc29tZQ0KPiArCSAqIEN1cnJl
bnRseSBMSkNBIGh3IGRvZXMgbm90IHVzZSBfQURSIGluc3RlYWQgY3VycmVudA0KPiAgCSAqIHBs
YXRmb3JtcyB1c2UgX0hJRCB0byBkaXN0aW5ndWlzaCBjaGlsZHJlbiBkZXZpY2VzLg0KPiAgCSAq
Lw0KPiAgCXN3aXRjaCAoYWRyKSB7DQo+IA0KPiBBcyBhIGZvbGxvdy11cCBwYXRjaCB0byB0aGUg
ZXhpc3Rpbmcgc2VyaWVzLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCg==
