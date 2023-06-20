Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB467363E0
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 08:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjFTG50 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 02:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjFTG5Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 02:57:25 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF502115;
        Mon, 19 Jun 2023 23:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687244244; x=1718780244;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qm1l+wzkw9wn1NvzcISs+C+GjiI6VTcMmagcAwaMrCs=;
  b=SSpfx6MoXHfKuqpkkY9UbYojANYdmx3lp1qvA6IWum1yaCfgFmxYeKss
   pnMMCPc/Se6NWINJEHeDWXMCYcnXos/Y/deutoMrqACD+9KaRxqZmPIro
   VfmOIN2t2+GLdU0EDlbOdc6YL3s+MyxyWHKb6bHNxx3tE0BIxGHtHkDKP
   Upq8BDU9dMwJAcTI9rGxOts8/K4iVE7YUovULoggPQqcuS4CH+c1ggBPf
   SpMyd770WkL05Sa90OCAt/PrGBzQy0dG1bkAdA3p9tRIc3RfGQwIbGFYD
   trAHzm91Lgt82QDCHFXt69bxpTkmicHU30h1vCQ6ItW26rv6MqXvptEjp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="362325053"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="362325053"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 23:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="888141718"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="888141718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP; 19 Jun 2023 23:57:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 23:57:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 23:57:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 19 Jun 2023 23:57:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+vCjgS4YMJY3j1aUcbJwsrQHxTxB9wuCkv+rQCvdCRIDxBHOEBK46IIY7py3CZQh3R8WpTFwJp8MQu67dIY0ehExSn6outyW+QdZcRxLgr0PkdB2Od08IwlXNf9Lg7yXXh9N7gOd4qCFPv0wWU36eOwrC9Ug14bT1XMZ/+C0iU/gdTl+76SZk+WorRId7nsr+UfRSZFFhdPu8V8KRnRQafLq9ioBQLXe22N1lZFa5Q6cF/z2cJ4UH+g6ziXOAbHPxDKnUFz4PI4m6q/NY7lBWiaEGnvCUz7mXq002odwSgOJpFAyYH/K/dtsa2lD0MgSSg0ec8Ld28sLgl0IGeciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qm1l+wzkw9wn1NvzcISs+C+GjiI6VTcMmagcAwaMrCs=;
 b=X2ZHa2ASBi1KAwknvvJPZ0q/Fs9K8d3Dx+DtKgVt1jghsKwCg6SvOo542n9dTn5qoF0NZXG8Mc9J6V7IC33RMfA8bWMtBdTf+CoLmTx10cp4f1keQi+BEeGe451AMy1zz76X5m1aUgyN65j0D2vhLN8adBa0dvxzojZiUn/AMZhqGbv2dnATBLjmKovdh9hq/eBAWRjByGwW7TIrKNCne6MFfIdefouGU58XW7O9FV2bSB342MnT11BUILxuNBpWochDehfPiKlfBGP9GpDLdRx3tPzAxuKXTQw8ArrYPX4TRmBoBIBezTrW+wGnX2j5LDF5QRxB0/QCyZfam6elZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH0PR11MB4805.namprd11.prod.outlook.com (2603:10b6:510:32::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 06:57:07 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:57:07 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Oliver Neukum <oneukum@suse.com>, "Ye, Xiang" <xiang.ye@intel.com>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: RE: [PATCH v8 5/6] i2c: Add support for Intel LJCA USB I2C driver
Thread-Topic: [PATCH v8 5/6] i2c: Add support for Intel LJCA USB I2C driver
Thread-Index: AQHZhDKi+nLCjzIaUUmpTtrnIK8VLK9mHSqAgC1irkA=
Date:   Tue, 20 Jun 2023 06:57:07 +0000
Message-ID: <DM6PR11MB431671A0D56D284625ECD4FD8D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <20230511175844.185070-6-xiang.ye@intel.com>
 <a33654a6-71e0-07ac-a612-b1f7aedebb36@suse.com>
In-Reply-To: <a33654a6-71e0-07ac-a612-b1f7aedebb36@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH0PR11MB4805:EE_
x-ms-office365-filtering-correlation-id: d072b0f4-7297-434d-5fef-08db715b8fd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+LJ0VXTz1MyiQ5NixZSZJIfX0hAPYlMOq/B45HOaWjMV+eweMoiH8vBJhBsBK9FOedEqqjI36YkBuz4jv8oEkrPi3i2BMYku4ELxkX3oIPCN8id53qUzkKRVDmb5t6TgjE/jWlrd9RT1WP3dWtWdJuQvqKP/lYhiMy0Kk0PMwlELiyxvH/dTRIPT4FE0PlCu6wB8Y2DqKrCaelZZQl8EPsczKjNvyrYSEooPxGbxm4NxqdC/SspkzGWCEiM4JULh3KmdTIBZ9g0TYLv353gMSav+fzUOmE0PStOZz1P+NvWwSx9V8DokEych/fZ7kz98mUGFx4KKQfv4+f1peen9YKXwktoqkBDWUwFs26dsgCPbYKMx3nPxSPqwO5aoH9y6NbaPofBM0rCVnrUHwh5JMVGG0GsvhaEbkcgRhg276EObBcgvay4MRZGyq04aoXg2vQYrJyknSoOTD0WU9nBMl3WilqgWs1UMSdFzje6+GdkORjDDPE8aVaoNpVRNrguAnBfzqat3A00b351y/w5xnAnjlCOeER/I7B5XzNO6FMCMlVoZtHo0khRO9RvhD0UBCvAkVKvl5YNzMsJkxtJ/ZCMOOQrnOg7+fL2Us3pbORjgAt80vHgPeNRD01Nl4ql
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(71200400001)(7696005)(478600001)(33656002)(186003)(9686003)(6506007)(83380400001)(53546011)(26005)(38100700002)(86362001)(38070700005)(122000001)(82960400001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(2906002)(4744005)(4326008)(76116006)(6636002)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(7416002)(54906003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHl0WU9yVkVBeU9tNXo1WTc1OGgzNGxISCtkS3lnZHNJN01IaFY5dXlMUk1z?=
 =?utf-8?B?ZWw0MjYyM0VacGN0MHZnYTdmVTF4dWU4OXlqR001NnZBdFUvNS9SRm91dHlh?=
 =?utf-8?B?NnBhdjluTWs2TklXSi9GLzFWOFltQ1RaeHc2UTNJa0w3aVliYTBjZ1R5cjFT?=
 =?utf-8?B?TjdLMGhNS21tY0FReUxBYWF5K2doWUd3K2dxZU1JUzI5eUd6WElSa0lYUGtZ?=
 =?utf-8?B?V1R5d09aWFNrd1pITlFYU2JsOGxhaXpmMVpWMjZDWWJ0U0dLS1pqSGVOY0Yx?=
 =?utf-8?B?Sk9HNFdGZDl1eXdvRWRIVllCaU43cnIvVHN6N09HMmtscUNpT3B0WktONkRP?=
 =?utf-8?B?a2FmVUp1a2h0L25HaE5ERGh6NVBxQ0J5TVluWkxYelB1amxWS2ttZDZ4cE5H?=
 =?utf-8?B?dnMxb1M2UVo3UkNRVUFrdDVyY2RLUWVYNHJVa3RkM2ZsdzFMeDhmMEJUVGtH?=
 =?utf-8?B?eS9NU3FIL0M5QVN4K21iRDQ0TFVPUHViNUI1bWxKNnd0b1hpWmIwUis5RWFk?=
 =?utf-8?B?YlAxRGxqcWthR2xCemo4U2lzaUhsWGRwSFE0eXV2cklSVks4bElvZkRldG5E?=
 =?utf-8?B?NUhmV0IvTEtROE9KTnkwaXJKMDZISFc2TjhDTlRUTzMvOW90R2NQcXF1bmpy?=
 =?utf-8?B?bEFPa2RpVE53Y2RTenpUYUZHdzlkTkg2ZURlUWs3NFZUMHBQRC9kUzY2bjJG?=
 =?utf-8?B?dUFwL0FKWTkzYVo1aWZ5RU5DNjN4MU9Nd0ZKNUxOejExd2hzT3NXNjZwSlR6?=
 =?utf-8?B?bWdGbG1NSFY5SHVobXlGMFpFaGxnUDVvUGI5UVVxTUwvcG1YVU4zbk5GdDUz?=
 =?utf-8?B?MDZPSzlkajRZbXFsaE1PcHlqZXJLOGlsNDJzQ0ErR1ljUisveWJYMXpON1VV?=
 =?utf-8?B?R00zY29kYnlGcDJUbmpUSVZTcG41TmZGdzlNbmNVdlNuQ0tWazJabksyaC9N?=
 =?utf-8?B?Ym5WV3ljQjh6eUgrMGhiTENEbXJEOEloem1oU2lhTVpacHY5ZWxpcWJIdk41?=
 =?utf-8?B?aEFYaEFyZTJRMHJOUDAwOFRyR09mK0JZMnpJUjdoemNKSXN2THZMTE1KMEhJ?=
 =?utf-8?B?WEdTVHV1OWZBZ2F6MHg3dGxXQ0pMcmloZFdXSVZNTjdnYkRYaTN0elhqeGtP?=
 =?utf-8?B?VkVTcVpmdEZMSTl4YXFwMlVDUGM1amhQR2hTQUZrT2xWaVJockJpQ3hjbTUv?=
 =?utf-8?B?SXAvK2I2Vm5VZjBwcGh4bGJPVllCTWh4djFxYithY1ZLU1piWi9LYXVBOHI3?=
 =?utf-8?B?WURoZ1ljUnk1eW5xT0xsWnNiUDI4U0d5SUgzOWkxdmVEakw0dmRzSTNzUnlP?=
 =?utf-8?B?V0ZaRUxXT1dOUk9KcVQydzZBdmN0SGNQaU1PdGNBL2xOYWxNZUd0WlJUU3Ex?=
 =?utf-8?B?dUpWeHNkbnRmRGFzeTFTU2tlZmZkRktWalBIKzJINmppZXg5V0t6cG1wd0RI?=
 =?utf-8?B?YjBIVnZrZmR5L05vUncyNzdQanZzNzBEVzZJdHZVZ1BWQnRpVWpzMXA2VVBo?=
 =?utf-8?B?VHByMFdUZkwwV2Z1MGx6NzRaRW1YN0E4ZVA2NkpmYXpKTWtaRlpvTzB3SmRu?=
 =?utf-8?B?b3hDY0tMREtjVFlIVGJucUREWG1zR1ExckJYOERaelk3N3BqeE1ocGk3QkI1?=
 =?utf-8?B?QTE5LzZ2N0NqalBSWWtFb3BESnY4SWYvd09UZTcyZE1hRXcvejY1cVI0TDE2?=
 =?utf-8?B?NURSbGNWL2ord3JOY0dzekRBMmplaWdBTmdDbHJBNCsvTktsNEZsT2E5T2F2?=
 =?utf-8?B?K3VsZ0VLU3hXUWhvV2kzZlJBUUgzbjBpVE1NK2RSam1KdXYxeWZHRFYvelRE?=
 =?utf-8?B?V2JQak1ERFBVeUFDeWVmbWRWK3Z6MmdaL1VFbERZcUpTdnd1MW5ERUZlSWY4?=
 =?utf-8?B?aEpqNzVpT1dVaHhwdTZMQW1YWW1jKzVyMU5WSVVCU245cWRycEpYZ2dsYmVT?=
 =?utf-8?B?T3ZhZXVkTTkyMGljcmJHM3I1VXI2Z2psa1VYbGZqWmM5OWQ1cmxQWFVCQ08r?=
 =?utf-8?B?MEhSOGZHMGNQSXBGaW41Tis2SDg1Qnl5YnF2S01CcHN3TFE3MVh3c0JKb3hV?=
 =?utf-8?B?Z25kakZJUm12Z1Z6VGU3RDc5VDU0Z09wRnBzYjlEbkNtaExRalIwZGJoNkV4?=
 =?utf-8?Q?1vrhDw+NXycJF6kjWgV1bWqIz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d072b0f4-7297-434d-5fef-08db715b8fd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 06:57:07.1659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNQ/e9nkfgwi5ZNhCHhqzXsfCNTyrSjx1FrHQXgvDcx9hONnfvha6XrrKTCr1M61Pllkh3nXP/Evp9JUp4D8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4805
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgT2xpdmVyLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+DQo+
IFNlbnQ6IE1vbmRheSwgTWF5IDIyLCAyMDIzIDU6NTAgUE0NCj4gDQo+IE9uIDExLjA1LjIzIDE5
OjU4LCBZZSBYaWFuZyB3cm90ZToNCj4gPiBJbXBsZW1lbnRzIHRoZSBJMkMgZnVuY3Rpb24gb2Yg
SW50ZWwgVVNCLUkyQy9HUElPL1NQSSBhZGFwdGVyIGRldmljZQ0KPiA+IG5hbWVkICJMYSBKb2xs
YSBDb3ZlIEFkYXB0ZXIiIChMSkNBKS4gSXQgY29tbXVuaWNhdGUgd2l0aCBMSkNBIEkyYw0KPiA+
IG1vZHVsZSB3aXRoIHNwZWNpZmljIHByb3RvY29sIHRocm91Z2ggaW50ZXJmYWNlcyBleHBvcnRl
ZCBieSBMSkNBIFVTQg0KPiA+IGRyaXZlci4NCj4gDQo+ID4gKy8qIEkyQyBUcmFuc2ZlciAqLw0K
PiA+ICtzdHJ1Y3QgaTJjX3hmZXIgew0KPiA+ICsJdTggaWQ7DQo+ID4gKwl1OCBzbGF2ZTsNCj4g
PiArCXUxNiBmbGFnOyAvKiBzcGVlZCwgOC8xNmJpdCBhZGRyLCBhZGRyIGluY3JlYXNlLCBldGMg
Ki8NCj4gPiArCXUxNiBhZGRyOw0KPiA+ICsJdTE2IGxlbjsNCj4gPiArCXU4IGRhdGFbXTsNCj4g
PiArfSBfX3BhY2tlZDsNCj4gDQo+IFdoZXJlIGlzIHRoaXMgbmVlZGVkPw0KDQpZZXMsIHlvdSdy
ZSByaWdodCwgd2UgZG9u4oCZdCBuZWVkIHRoaXMgc3RydWN0dXJlLiBUaGFua3MgDQoNCj4gV2h5
IGlzIGl0IGRlZmluZWQgX19wYWNrZWQsIHlldCB0aGUgaW50ZXJuYWwgZW5kaWFubmVzcyBpcyBu
b3QgZGVjbGFyZWQ/DQo+IA0KPiAJUmVnYXJkcw0KPiAJCU9saXZlcg0K
