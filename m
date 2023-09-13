Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0971F79E1A7
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 10:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbjIMILJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 04:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238788AbjIMILC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 04:11:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2207A1997;
        Wed, 13 Sep 2023 01:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694592658; x=1726128658;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I75rxRD5hmQFQg4BXBAqM66F4M/+uqhXG/1C2Jx5ix8=;
  b=D1TI++pB7+vbq1avIHBWCLL4dtZqR+b52YS2HdXxKMOejczqsLN3dknt
   31Eutrxr5VjeW4hbCTi0F/3F0WxQmcpgAN/O9cL3pmpjUG3uQ38JjQ1z2
   +JfQ8Ued4gc1wO8rnb8V/ULcs7omruiAAhMicZ4Mg0UeuS7m6pyQbiDZj
   i5YkxXC8I+bcqqAQpRUSI/QLR10FhoHemnykumYoCyJOOkYV64I4Zg1mf
   fZ5hTC48CHFmpj54KcQpbuqX2xvdqBTMiRYNwZdilD8Wc84D1+Sj9AoAX
   KgZpOKfKVqugZspXXyrSsJ6afOo1PfyY+qkp+1glVgf76rDhopXrLdeqo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377508286"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="377508286"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 01:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="859168796"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="859168796"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Sep 2023 01:10:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:10:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:10:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 01:10:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 01:10:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVsXLv22u+a6q+V4o04z8ZuZkmZuTqqfyXetwXk8573A8GVSim0k6U5aJ+ZrqpGojQozvyRXEh+tXwYccuwLEp1cmWKxTtg7Z0KF1ULEFCQJzC3d4+Lh56hkKyILjS/LAGJbGapYLfqdv+HLrfxmXak2mVvcHE9FLrdivKlImYjPs/L8cBkyBR+sZQxoAzb8woGrI3ReNStuEPCFXHUhjWtjq8DXx9bKV+1UPrUKyuyxfU/3kFfeQMi1GQtav2+/zDhuqAyY+xQCbhEiKVdNxUWWqXXo4M/iCM/UHnlLH/Ge4z1oyCog/QC6qPuxEumHW1kVN8Ylpo9DFaQnE8FbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I75rxRD5hmQFQg4BXBAqM66F4M/+uqhXG/1C2Jx5ix8=;
 b=S43p81ngTKpX/xmnfeRIOm/5iLQKMLRohKnvPvQdqtQRfboohBXJufwFN3qsUm/G9+8vAMQioC9hlCJAh+w3N/krzxGtgGuwtC7wusymNI8lFAtx7I5UmUoVK3secN19KxwEnEhSowcoQgOgkd0IEAMX6+TJHfnA2t+XaHMK55KcFdX8Vcwdd7KtvEk6t8RaSIe8CDBF5LZjdnn/QakOY9yxqMlIUI0JMzNWhGXatSPRVULYTbInK0EaOodPiqSCeKZJ3M1rJ8dzBfjtI5uxIzE+P+53anIvvZQ24PliNve2w9ujVUvgEGWd5vlm9tZkCZqmuBQ6LYkFgqIu0wifeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 08:10:40 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 08:10:40 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>, lkp <lkp@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
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
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Subject: RE: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ5eNQYYYhXKCANUeYzCUjonX6erAYRsWAgAAUrACAAAuGMA==
Date:   Wed, 13 Sep 2023 08:10:39 +0000
Message-ID: <DM6PR11MB431687298E830EB2E78AFE7F8DF0A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
 <202309131427.AUBwVNBm-lkp@intel.com>
 <764de5af-d589-9c43-be02-a9934eb9044b@redhat.com>
In-Reply-To: <764de5af-d589-9c43-be02-a9934eb9044b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CO1PR11MB5025:EE_
x-ms-office365-filtering-correlation-id: 36dd8d6a-6eb2-4609-cfef-08dbb430eb1d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XPKTPVTRsncuFu7mH54EsGk4Yor94ltgYx8nz+reN5KyOXwZvGOnrRGsdjdAnceeEdegzeGs1q4tuR2NjjU68HReH0DMptEbyC8VLFUUggCoyUDTbJNxuTgs2pqPpRNF6AMSlXxp8W9sNDaP0m8umamswPfhAFqZ6R70upxTpXc1UVZiF0IXAhNDBUIHWS81EMa/sVCLQs7kw8itZWNmZSkHMVDx/rAC+lIPvt+gkA88HogxZa1dliGVmRjeWpbelp9ZK977TFlmsD51M5+Riozxd71E8QSnR/dDP8OXevhK8QXVV0BhRwXzLXkdVbfg7V3hIT/1ZfVWLod3369pG/mg184+YIGFOdWLGFFGoP3a75fnSwtGgHozFjz1M0iVWTa8JfzbpGWA2gM9BnhW2Ykvh3hEsAl5eiOvWqsK+Eren6AwtyljCYRtbIomcEeBrtry+xaNuzTkip1703i/JP0QExSNR/svni8GuSUfabi4g7H+1Lzxt8B22BLQkDnxBpJCijjI6qaLADQMp2Ijs8HvWKS303xcjPBxmquRKAzldPXhXO9PBUCYhchWuHIJsepcwdX864+WQzegu1MZGvlYAoqPH0BcAIj4EuAyK8r2MuKvEZGOETb7Xa2+EciKIZPs3/vmT0xt+PP0Xi3qng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199024)(186009)(1800799009)(8676002)(4326008)(8936002)(86362001)(55016003)(5660300002)(52536014)(2906002)(33656002)(38100700002)(38070700005)(83380400001)(82960400001)(7416002)(19627235002)(7696005)(53546011)(122000001)(6506007)(9686003)(71200400001)(478600001)(26005)(66946007)(966005)(316002)(110136005)(76116006)(66556008)(64756008)(66446008)(54906003)(66476007)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE9GL3gxZndXbnphSCtpdXVCaWJjbEpmVU1GS2hoVDlQSm1uKzBreFBzRXhv?=
 =?utf-8?B?VDlJRXBtOElnMFp6VkM3aUVPU1F3RnVtOHVTUGp5UWcxcHhNODYwRHZtU2lH?=
 =?utf-8?B?aGwzb3VGTkpmVm01RHF0UjdKZ3Mxd2loN3NyOGdjNm1DelBSU2JKOWwyYzhD?=
 =?utf-8?B?UENZNDZGdGJWK1htVDBNSWZPdUxxQXdscXpzWW1hcHZhTHhlMHRtbnc1NnIy?=
 =?utf-8?B?cjllRVVoM0tDbU9PRE8xTlhnWFB1SDBvcm1IWGlVOTBpUDF3azJENjlkQkht?=
 =?utf-8?B?WVg4STJlYzY4Q1JDVmh1ZXZxaVJlMWRSQWVYSStrZUJUVUlBSFpQakdNOGM2?=
 =?utf-8?B?L0RGMmV1VVNJTXNleTZIdTZMSFV3aWthWjI2cTdHVkhNNndrS3FaWHI5MVIy?=
 =?utf-8?B?SVhWMzREWnJ6WHlhOFErRk9GdmJTczNESDZlTXJQbk5BbHYyNzhkanp2RGRR?=
 =?utf-8?B?SmtzRGc2ZVZjNFg3QkFxb2I1aXcxNmtiUTZiMFRiaW9uYnJpYk42enhaWHEx?=
 =?utf-8?B?cDNkV3NTZ0o5Ty9aL0lrd2dNZExOZ0FNVTQ3QWsrTlBSZXhORDRyZ24xeHJE?=
 =?utf-8?B?aFdyUlFkTkxqOUZMc2w1TVRKZmQ4QTBkZ1JlUWdiV2w5T2hkNjJkdVVCZVpP?=
 =?utf-8?B?eG9vRnkvV1kxaG53eXpRZ2pUUVJBTE5GdGlUanNBOEp4b2ZhU1QyWHNxMEhn?=
 =?utf-8?B?Qy9WVythcEdrUXVXVUord2k1REZBVmZLRkluVFBBbE1SRVAvRkVzakN1UjRJ?=
 =?utf-8?B?YktQcC85aTYzZ1BOTURmOURTdGlGd291QWJvL0pKZlNlai9jVGJDRHNWRmlL?=
 =?utf-8?B?ejJkTm5xcEJpb1lzUkFFOENLMUs0UGN5d3BTc0QzRDZNeUR1NXJhY1ppQW5k?=
 =?utf-8?B?eXdKNU0xVThjKzhtZ0lZd29LaFZQYnJVM0dUVFllNk0wc01oRHdSQnZBY3Ix?=
 =?utf-8?B?QXV1Sy8vS1liVjgwTm03cm9sVnBaTWxXM3NxUVl5emhjUFByNHY2aytaNzlB?=
 =?utf-8?B?cm00NzNSNDlhUXdPTzRYTHdqdW5SN05reFJnaEVHajlTT21jeUlvQWpZaE1G?=
 =?utf-8?B?NERjVG9wK0dqWUcwbVUrZWRYOU93anZraTc2WjhUd0pESG1CdnhHb0pwODZY?=
 =?utf-8?B?TktnMDFubnY5cDlyd2pLbG9qSlZNS2VCQkh1UE9ETkNzY0hjTXZYaWxjbDdx?=
 =?utf-8?B?Zy9EbDZtVkRuY2R2cW1Ma0dEL0dxNURWL0tzVWx4c2djZ2RJazZtZ2xvN3Zm?=
 =?utf-8?B?LzdLYVd2Q1o1MVBORDBRdEVBWFU5ZVFvbzF5ei8yMUhGL2xFazZ5ODJxVUl2?=
 =?utf-8?B?ZlFFa3h0NTN5QTh1UWFOYno5dzRUbGRyc25EMGFoZytGM3c2Rk1jZzhBckl1?=
 =?utf-8?B?ZFZzZCtIVGtXank0ZnBFdVJia3RLcHlPNmtpLzJ1NXFCUXU0MGdYRER4dDlm?=
 =?utf-8?B?THJkK0Npd2xmUlh1UWZOclE2ak0rcUpsbXRnV2xBY0d2MVIzSjBpaVdRL3Bo?=
 =?utf-8?B?RE04Q0crMWdtQnllWWdqaEZIR0tKMkxjcXNaSUFQdHlpMGozVWtnYWxpR045?=
 =?utf-8?B?S0pCSHp1d3pybktDVzhqZnRCRko1SHNsZ3Jna1Z1NWx1V2xaOGNpUVFGanBs?=
 =?utf-8?B?d1J4cEZCVE5wMUNpTWhGNWN3N0pGOFd4UDhDSzhWVGEvV1o3VUN3dHR0ZC9h?=
 =?utf-8?B?eU5GSFlFcXVxQk10Z2NxOXo4MjFmaXNHWG5kam1RbmNhcjJJak8wV3FybmIx?=
 =?utf-8?B?dlc2aWJtR08xeDhlNXhvazZDT2ovd0hvMDBBRjZZQmkxb2dZMGFYbDVXdlZV?=
 =?utf-8?B?OFZFdW1JcEI0WEpVS1ptSkxBeEI2MUYrWjM2cldPNVppMzF1UzIvM3dlMmhu?=
 =?utf-8?B?WHlISTl6NHNCMUJ5emFhRk80YXg3TE5BQTIzWWxUaldDd3ZIOUlIL0RyT2ZC?=
 =?utf-8?B?c3ZwS0RXU3ozckdvWDBiRlBwZVRJYzhWSTNBaGlYTDZKZ0xoTkpMdEE0cE5z?=
 =?utf-8?B?WnpHUlBKUjlacmNBa2NOWVNLQlVXWk9FcmFBT1pCdkNNTEFkUW5HeEcxREZX?=
 =?utf-8?B?d0h6Q0VwTjBOZVpYaHB4VlYzMjk0OUkzMzdGZzFwdDA4QWdFT2JhNDhHb1NS?=
 =?utf-8?Q?95YWZijIgUUn8SUXM4MibARWz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dd8d6a-6eb2-4609-cfef-08dbb430eb1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 08:10:39.8492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZrpikV7Dr3IVa0P766eVclyHhknauxJdn2H32GGo5YWgDxrVC0TIMexAC4tOs6WfE8mvZTBXQhFPBzg+gdBLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBIYW5zIGRlIEdvZWRlDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDkvMTMvMjMgMDg6MTIs
IGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0KPiA+IEhpIFdlbnRvbmcsDQo+ID4NCj4gPiBrZXJu
ZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgd2FybmluZ3M6DQo+ID4N
Cj4gPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gd3NhL2kyYy9mb3ItbmV4dF0gW2Fsc28g
YnVpbGQgdGVzdCBXQVJOSU5HDQo+ID4gb24gYnJvb25pZS1zcGkvZm9yLW5leHQgbGludXMvbWFz
dGVyIHY2LjYtcmMxIG5leHQtMjAyMzA5MTJdIFtjYW5ub3QNCj4gPiBhcHBseSB0byB1c2IvdXNi
LXRlc3RpbmcgdXNiL3VzYi1uZXh0IHVzYi91c2ItbGludXNdIFtJZiB5b3VyIHBhdGNoIGlzDQo+
ID4gYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4N
Cj4gPiBBbmQgd2hlbiBzdWJtaXR0aW5nIHBhdGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNl
JyBhcyBkb2N1bWVudGVkIGluDQo+ID4gaHR0cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3Jt
YXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0NCj4gPg0KPiA+IHVybDogICAgaHR0cHM6
Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9XZW50b25nLVd1L3VzYi1B
ZGQtDQo+IHN1cHBvcnQtZm9yLUludGVsLUxKQ0EtZGV2aWNlLzIwMjMwOTEzLTA5NDIzOQ0KPiA+
IGJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
d3NhL2xpbnV4LmdpdCBpMmMvZm9yLQ0KPiBuZXh0DQo+ID4gcGF0Y2ggbGluazogICAgaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjk0NTY5MjEyLTEwMDgwLTItZ2l0LXNlbmQtZW1haWwtDQo+
IHdlbnRvbmcud3UlNDBpbnRlbC5jb20NCj4gPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggdjE2IDEv
NF0gdXNiOiBBZGQgc3VwcG9ydCBmb3IgSW50ZWwgTEpDQSBkZXZpY2UNCj4gPiBjb25maWc6IHNw
YXJjLWFsbHllc2NvbmZpZw0KPiA+IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LQ0KPiBj
aS9hcmNoaXZlLzIwMjMwOTEzLzIwMjMwOTEzMTQyNy5BVUJ3Vk5CDQo+ID4gbS1sa3BAaW50ZWwu
Y29tL2NvbmZpZykNCj4gPiBjb21waWxlcjogc3BhcmM2NC1saW51eC1nY2MgKEdDQykgMTMuMi4w
IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MQ0KPiA+IGJ1aWxkKToNCj4gPiAoaHR0cHM6Ly9kb3du
bG9hZC4wMS5vcmcvMGRheS0NCj4gY2kvYXJjaGl2ZS8yMDIzMDkxMy8yMDIzMDkxMzE0MjcuQVVC
d1ZOQg0KPiA+IG0tbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpDQo+ID4NCj4gPiBJZiB5b3UgZml4
IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5l
dw0KPiA+IHZlcnNpb24gb2YgdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xs
b3dpbmcgdGFncw0KPiA+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPg0KPiA+IHwgQ2xvc2VzOg0KPiA+IHwgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Ut
a2J1aWxkLWFsbC8yMDIzMDkxMzE0MjcuQVVCd1ZOQm0tbGtwQGludGUNCj4gPiB8IGwuY29tLw0K
PiA+DQo+ID4gQWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+ID4NCj4g
PiAgICBkcml2ZXJzL3VzYi9taXNjL3VzYi1samNhLmM6IEluIGZ1bmN0aW9uICdsamNhX21hdGNo
X2RldmljZV9pZHMnOg0KPiA+ICAgIGRyaXZlcnMvdXNiL21pc2MvdXNiLWxqY2EuYzozODk6Mjc6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbg0KPiAnYWNwaV9kZXZpY2Vf
dWlkJzsgZGlkIHlvdSBtZWFuICdkbWlfZGV2aWNlX2lkJz8gWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tDQo+IGRlY2xhcmF0aW9uXQ0KPiA+ICAgICAgMzg5IHwgICAgICAgICBjb25zdCBjaGFy
ICp1aWQgPSBhY3BpX2RldmljZV91aWQoYWRldik7DQo+ID4gICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fg0KPiA+ICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkbWlfZGV2aWNlX2lkDQo+ID4+PiBkcml2ZXJzL3VzYi9taXNjL3Vz
Yi1samNhLmM6Mzg5OjI3OiB3YXJuaW5nOiBpbml0aWFsaXphdGlvbiBvZg0KPiA+Pj4gJ2NvbnN0
IGNoYXIgKicgZnJvbSAnaW50JyBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEg
Y2FzdA0KPiA+Pj4gWy1XaW50LWNvbnZlcnNpb25dDQo+ID4gICAgZHJpdmVycy91c2IvbWlzYy91
c2ItbGpjYS5jOjM5MToxMzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
DQo+ICdhY3BpX21hdGNoX2RldmljZV9pZHMnOyBkaWQgeW91IG1lYW4gJ2xqY2FfbWF0Y2hfZGV2
aWNlX2lkcyc/IFstDQo+IFdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4g
PiAgICAgIDM5MSB8ICAgICAgICAgaWYgKGFjcGlfbWF0Y2hfZGV2aWNlX2lkcyhhZGV2LCB3ZC0+
aWRzKSkNCj4gPiAgICAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fg0K
PiA+ICAgICAgICAgIHwgICAgICAgICAgICAgbGpjYV9tYXRjaF9kZXZpY2VfaWRzDQo+ID4gICAg
ZHJpdmVycy91c2IvbWlzYy91c2ItbGpjYS5jOiBJbiBmdW5jdGlvbiAnbGpjYV9hdXhkZXZfYWNw
aV9iaW5kJzoNCj4gPiAgICBkcml2ZXJzL3VzYi9taXNjL3VzYi1samNhLmM6NDI5OjE2OiBlcnJv
cjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24NCj4gJ2FjcGlfZmluZF9jaGlsZF9k
ZXZpY2UnOyBkaWQgeW91IG1lYW4gJ2FjcGlfbWF0Y2hfZGV2aWNlJz8gWy1XZXJyb3I9aW1wbGlj
aXQtDQo+IGZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiA+ICAgICAgNDI5IHwgICAgICAgICBhZGV2
ID0gYWNwaV9maW5kX2NoaWxkX2RldmljZShwYXJlbnQsIGFkciwgZmFsc2UpOw0KPiA+ICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+ICAgICAgICAg
IHwgICAgICAgICAgICAgICAgYWNwaV9tYXRjaF9kZXZpY2UNCj4gPj4+IGRyaXZlcnMvdXNiL21p
c2MvdXNiLWxqY2EuYzo0Mjk6MTQ6IHdhcm5pbmc6IGFzc2lnbm1lbnQgdG8gJ3N0cnVjdA0KPiA+
Pj4gYWNwaV9kZXZpY2UgKicgZnJvbSAnaW50JyBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3
aXRob3V0IGEgY2FzdA0KPiA+Pj4gWy1XaW50LWNvbnZlcnNpb25dDQo+ID4gICAgICA0MjkgfCAg
ICAgICAgIGFkZXYgPSBhY3BpX2ZpbmRfY2hpbGRfZGV2aWNlKHBhcmVudCwgYWRyLCBmYWxzZSk7
DQo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgXg0KPiA+ICAgIGRyaXZlcnMvdXNiL21pc2Mv
dXNiLWxqY2EuYzo0NTg6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
DQo+ICdhY3BpX2Rldl9mb3JfZWFjaF9jaGlsZCc7IGRpZCB5b3UgbWVhbiAnZGV2aWNlX2Zvcl9l
YWNoX2NoaWxkJz8gWy0NCj4gV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0K
PiA+ICAgICAgNDU4IHwgICAgICAgICBhY3BpX2Rldl9mb3JfZWFjaF9jaGlsZChwYXJlbnQsIGxq
Y2FfbWF0Y2hfZGV2aWNlX2lkcywgJndkKTsNCj4gPiAgICAgICAgICB8ICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiAgICAgICAgICB8ICAgICAgICAgZGV2aWNlX2Zvcl9lYWNo
X2NoaWxkDQo+ID4gICAgY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3Jz
DQo+IA0KPiBPaywgc28gdGhpcyBuZWVkIHRvIGhhdmUgYSAiZGVwZW5kcyBvbiBBQ1BJIiBhZGRl
ZCB0byBpdHMgS2NvbmZpZyBlbnRyeS4gVGhlcmUNCj4gYXJlIG90aGVyIHdheXMgdG8gZml4IGl0
LCBidXQgdGhpcyBkcml2ZXIgd2lsbCBub3QgYmUgZnVuY3Rpb25hbCB3aXRob3V0IEFDUEkNCj4g
YW55d2F5cyBzbyAiZGVwZW5kcyBvbiBBQ1BJIiBzZWVtcyB0byBiZSB0aGUgYmVzdCBzb2x1dGlv
biBmb3IgdGhpcy4NCg0KWWVzLCAiZGVwZW5kcyBvbiBBQ1BJIiBpcyBhbHJlYWR5IHRoZXJlLCBi
dXQgSSBoYXZlIHRvIHJlbW92ZSAiZGVwZW5kcyBvbiBDT01QSUxFX1RFU1QiDQoNClRoYW5rcw0K
V2VudG9uZw0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCg==
