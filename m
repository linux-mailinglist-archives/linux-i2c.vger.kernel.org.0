Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A08078ED62
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 14:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245056AbjHaMj5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 08:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjHaMj4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 08:39:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA60DCDD;
        Thu, 31 Aug 2023 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693485593; x=1725021593;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pujHUSdtnlSUwVxBAn2tQWCnb8zmooIqWHqyfvoHPzk=;
  b=RM5O3NErJ/F66OmNdC+cFTpOJJoFGF/EJOfBLlIynYEy7+oCtc0wYhtn
   K742gtXgPtYToSjju/+zKVZBQrVqlXPkHQ7UxmPWQ1vKqO9DT1Qf0QlPh
   Ak9WVo4lagEg9PBDbF2C7J+zEZ+BIKK/W0EyTcQ+0IOPituBdl7kQd57E
   pkKq6mT5hMcqreOLib/H5bvhoN0zJH/BUcVs3Rifg0sBExMdAOcBNwurt
   t1ssdPDYDAXjnWIUd+NEmLLBxn0ajz3Op+DXUWQTiiSU7FJCbQViIlkil
   35OjYf0rpigr1nUHxq1V3ULwyaJ9AMAENcinP4ZG2vmY2uGjcOz1dWu/h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374839430"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="374839430"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 05:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="913233367"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="913233367"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2023 05:39:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 05:39:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 05:39:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 05:39:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 05:39:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+dTaSn4qX5hb8UuCcbf+mlgMro9OChvaiNubFvMy9XHJOXaH56YFtagVdiN9OJ5SNIchqrefnZ8lLLuEMdXS17Yu9Di7PChUXWo0iTcR+c9aDN11Uo4BEkZgS04nFrWshyoWjTr4cnVXClIqgWLt/FksUQVWBFGI+s80mbUe2HESdO44bhR1cl4WvB9S8Abjulaj0swsO76b/3H3h+meD62uSYkBSz8EBvIH5pRSFnwZ+I+7dkE9omFqybohTH8HF79RRPH67CsUfg+zeVk0QKoL1ZutBOD2gNeP7K97tb5Hinjg008qDXrHhxLQV6tW88etIIYQBFh2dHDmFqQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pujHUSdtnlSUwVxBAn2tQWCnb8zmooIqWHqyfvoHPzk=;
 b=M6twRXTKjnmqZ2rL3xT2nE0nrx9V/9NhKKOmnaajbARoHVzxRc/WKZplTOKYUD+2MvOnqKcyrc+1FiZNIWb60GUkXVF52g7D6hon2dqHSC5yRe+qG07og9OZtvh7N+GS1T8doN34iKy3C1MNAkUoIV/m6/Erg1FTsqi9+mPPLglWR1noYi4pnQQyHbHfsPzWR78ew4O7j6JXvBRaEqI+BKcMEyAeJ5V1FQNBZb165x3Yn9FU2wx3BGQTQSkhGr9wV93772MU8ssHBrerOmDMKeQOAKTxfgw35iiTyZ9eOFz0GMiwLxIb9TjYtwFRc9T93WlKKo69KeN0cKPqxv89IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 12:39:48 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 12:39:48 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
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
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
CC:     "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v11 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v11 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ2jTpuOzDXEzOr0WScT1nUCuDK7AERL6AgAATp7A=
Date:   Thu, 31 Aug 2023 12:39:47 +0000
Message-ID: <DM6PR11MB4316CF2B4CCA77523A0BC5428DE5A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693284848-29269-1-git-send-email-wentong.wu@intel.com>
 <1693284848-29269-2-git-send-email-wentong.wu@intel.com>
 <9b2265a3-e10d-ee85-db48-45c75dd4b89f@suse.com>
In-Reply-To: <9b2265a3-e10d-ee85-db48-45c75dd4b89f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|MW4PR11MB6716:EE_
x-ms-office365-filtering-correlation-id: 4d7a3699-f2a9-4243-228e-08dbaa1f5c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qbANJe1lAjXx/Sgt8m1NQ4bQs6aOUt/twIAEVXFKwgj5oxLtI8TtPjlqIFFeLE7D7pYmyqbNaTNFw6kxbDdGkhdFu1Us+TqFTBJ40rzMrv3uLbmzSy1dyzSEJ+iAxwCIZ39H4cKjWm1VDsmljMz/GL8O9p6yeGGoKKBItS4KX7ysQR1E26MrFUtCklQIbD/wW+sw6rnEXLRlA+b9QPBra+fX6OfEnIKJ304+wZsZAg874POq9jkF9xkSVQn4Mlb/8OtHfHJJbFEXDj1sCRx+Cql1kuBrDky+s/Q4R608G7zj1pBhIqvgl+Y7IVtm4MH4btc+NtbVA4sjDFINH2DZuxz/Km+Y+N9gIihGlElm3VlT1W6T3dcj4KGHhNmy3CiQEKI879yyNEdKb0vuxfWTLxg3lkcvifGTwiv1MQt0mIrOlJOJnd2AHxWLLM4GdFdn9gsqLTItGfTNRZFFfOY6FpdnoDDEUICkfXoyo6Kgi/n3s2s2lMDXsmCBPrnyCHH/hgxNS/qVQV/h8y6XOJQO6AuLC5qgbHMA8j3pm/SMoVyIwmZ1pxIbBhP/nr6lJISDB8NcAiMz5tk3p/iufVLwqysG9j0XvDV9HrO+EBnmd9TvUZaYCwY0bT9cTAAafYEYedxxbweuhDmP7Q1a39Svag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(1800799009)(451199024)(186009)(7696005)(9686003)(71200400001)(6506007)(86362001)(33656002)(921005)(38070700005)(82960400001)(38100700002)(122000001)(55016003)(478600001)(110136005)(53546011)(64756008)(26005)(83380400001)(5660300002)(4326008)(8936002)(76116006)(2906002)(52536014)(66556008)(66946007)(6636002)(316002)(7416002)(66446008)(41300700001)(8676002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUcrd1lFTUhyc2NRc3RHenpDeTFSdFJXSGRMNis0NElQK3dxQ2NEUDVhRE16?=
 =?utf-8?B?YzF6aHdlelltV2xTOXllUnBwbE9OVGk5aDdHUHJjVSthNzFhV25oSDM4OUlG?=
 =?utf-8?B?SzdjNW1UWEk4ZXIyanhTdmUrbVFxYnZZVGp0bVJSaDlKVG5sd0xrK1BSMFBY?=
 =?utf-8?B?eFhRcUJ2K2F4SzZPcVphY3gwL0dWb1A3Ym9mbWxDTDVrcDVwZmRlc2Z6RE5v?=
 =?utf-8?B?MmtkcnpCTVJ5NXZKMXJ4emhyZk13dXBQZm50QzNqZkVpbnVqeDlqK2o3L056?=
 =?utf-8?B?dmJUYXJhdHZZeENnZUl5d0xleFBmYW9iRjFoUmVSUTFnZzVxMVl4Z3gzSnA4?=
 =?utf-8?B?a0ZMUHQzdWo3ZFJpU3lod2t3VnZSZ1BMZmRUQ2RndFh1a0h2ZWwzVlZqeThu?=
 =?utf-8?B?MjdKcDJnMk1JeXUybm53QUduVEVIMWwraTY2RTFFdlZHRkRMRnJwUkZsQVJl?=
 =?utf-8?B?SHJUc25Edm1SeTZ4R0pXOStXU2pJUGJtSDlhTnFMWng4TTFFWjNGWCtqWERq?=
 =?utf-8?B?Y3RWZEhTUWNtZFVpTXhmNzBHY2xlUmlLK01kRmJ1T2U1WjFOSVRJaHBRbTJX?=
 =?utf-8?B?UVNpOTZ6dDFnbVZ6SFJKUFFxZlA0eUZtS2xTNzBmL1daMVJsZHZPZnhhanQ3?=
 =?utf-8?B?TFZwQXA4Vyt5TUhTaUJnamcwNHMxWWNFeUsvTE55VUQvaXgzd2hBZTZHekVq?=
 =?utf-8?B?N04rZWJGcXY0b0xNWGVzbGs3dkhLU0pxUjdYM0hwa09GSEcrdTNpbjhLUEto?=
 =?utf-8?B?Ny9naTdtNHFQbnF6akRJTlBIM2VQKytBSFZuWE9FR2RkcTZjNWU3d1hNSVRW?=
 =?utf-8?B?OEFNcm1iUWlzWm9ERnlQLzh4MktHRVhJWm5mQi96K090NlNUWTFWMjJ6Mzg4?=
 =?utf-8?B?VUltQk4vd01DRmk4QmE0T29jVnhZSGIrWjJSSVMyN2g3dUdCa1Q4SEg0VS92?=
 =?utf-8?B?UTFBWWNtd3d5djNPNVlkVENGNnZ4bnBibXVIS3VQUGdKZjNrRzQyNTd1bk93?=
 =?utf-8?B?djJwY2hFaHJTNnRXVzc0dFBqdEttbjd2VjJGaWNNUXRHU2JvMTZaR2NEUFBO?=
 =?utf-8?B?dllyL01zZjBpcVZvRjI3WU9OamJjZzNKbkYxdkJoNzFqNStsbHJXMnZHVE5K?=
 =?utf-8?B?b1JoU0txYm03dXVVNTB0OVNYZG9TTlJua3pYZzRyakFmTDd4M0RLUUs4WEZ6?=
 =?utf-8?B?SmRuRG5Wekc2a0NaUzFJZ3doUXRyOGx3MkJ0d3RYOE9lRUp4TVNsYlpnRkFQ?=
 =?utf-8?B?QUFOT00xYnFudjNWNDIvQmlxanpOdHdqbVFKY1ZJZnI4blVneUprcFVGa1JJ?=
 =?utf-8?B?dlVLNWt3cXRKdm5yalhFWVN2OHVPczVPaTJMVU9odU5tWUtqOEw2Q3NLQ0o4?=
 =?utf-8?B?Qzh0cWp3NTJzbUozRFluRUt0WndaVGMwTjhPOE02Q3JoSWF1VmJ2ZHl6Y2Vu?=
 =?utf-8?B?NDl0UDZXKzU0aUNZL0M1ajhXeXRhZ0lOVEdHNzEwLy9BRzdxR1BjR2JuRXk0?=
 =?utf-8?B?ZjRNQTdYR2tnZmovdk5Wbk02MXJuVEVMMEZNZ2hZM1BSaU5nRzJGbEplbGN6?=
 =?utf-8?B?dDNKM29zVXRzYnZ4Z0YvT0RXMzI3WkFMOUViSll4UTBudXlGc21vb0JpUTQv?=
 =?utf-8?B?ZzJnZ3NFY2VZdklZdWVVOWZNQXFvV0NyMVljdFBYQmJsVUYvT1BPK0xtZTNR?=
 =?utf-8?B?WU00OWZkS2ZkZUxSK1lDamsrK2EzMHpZN3Z1NHV5VW5EY3p4c2tWejd3dUpE?=
 =?utf-8?B?OEY4NXdEbytoT2hTVFAxM28vdzVjUXcvOEsvdm51Ulc3QndzSWVXa0IyL0dI?=
 =?utf-8?B?U2JSSUtLVFJQb3kvck92N3dtb2V3U2kyMEUveUY0dGs0ZFFJNVNTSmdtMGFT?=
 =?utf-8?B?WUNGVUpqZ09URUdNUG0rdUZ0NkhXRVRDYVdhSE1ETXM2b2VnbnY2MUhnWlZE?=
 =?utf-8?B?T0xybzJFVEZrN3Y3Nm1odlJtMVlScTBJdTNqZXYxTEdVWDdqZWh4SStPSVht?=
 =?utf-8?B?NHR6SFN4Vk1wQXVjaC80T0Q0RUY0eXNaWFFxWlp4WU9uWENNWmg2N0ExdVpD?=
 =?utf-8?B?S1BRWHl5dUk1VDdGdTFyTDV0S0crZUZVc1Y4bE10VVFYR3hYOUpTUE4xTlVh?=
 =?utf-8?Q?VxZYS4eZ2Stow4RoBRqoUeKjv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7a3699-f2a9-4243-228e-08dbaa1f5c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 12:39:47.6776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j14hmcVgV/63REnHoiMO9FFG3DKQc3OlXkG1bbknAfoA0X9Q3DXZc8/HiQIIjP4luJk3Z5rF7D/i1JFaS0A0IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgT2xpdmVyLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IEZyb206IE9saXZlciBO
ZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+DQo+IA0KPiBPbiAyOS4wOC4yMyAwNjo1NCwgV2VudG9u
ZyBXdSB3cm90ZToNCj4gDQo+ID4gK3N0YXRpYyB2b2lkIGxqY2FfcmVjdihzdHJ1Y3QgdXJiICp1
cmIpIHsNCj4gPiArCXN0cnVjdCBsamNhX21zZyAqaGVhZGVyID0gdXJiLT50cmFuc2Zlcl9idWZm
ZXI7DQo+ID4gKwlzdHJ1Y3QgbGpjYV9hZGFwdGVyICphZGFwID0gdXJiLT5jb250ZXh0Ow0KPiA+
ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlpZiAodXJiLT5zdGF0dXMpIHsNCj4gPiArCQkvKiBz
eW5jL2FzeW5jIHVubGluayBmYXVsdHMgYXJlbid0IGVycm9ycyAqLw0KPiA+ICsJCWlmICh1cmIt
PnN0YXR1cyA9PSAtRU5PRU5UIHx8IHVyYi0+c3RhdHVzID09IC1FQ09OTlJFU0VUIHx8DQo+ID4g
KwkJICAgIHVyYi0+c3RhdHVzID09IC1FU0hVVERPV04pDQo+ID4gKwkJCXJldHVybjsNCj4gPiAr
DQo+ID4gKwkJZGV2X2VycihhZGFwLT5kZXYsICJyZWN2IHVyYiBlcnJvcjogJWRcbiIsIHVyYi0+
c3RhdHVzKTsNCj4gPiArCQlnb3RvIHJlc3VibWl0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlm
IChoZWFkZXItPmxlbiArIHNpemVvZigqaGVhZGVyKSAhPSB1cmItPmFjdHVhbF9sZW5ndGgpDQo+
ID4gKwkJZ290byByZXN1Ym1pdDsNCj4gPiArDQo+ID4gKwlpZiAoaGVhZGVyLT5mbGFncyAmIExK
Q0FfQUNLX0ZMQUcpDQo+ID4gKwkJbGpjYV9oYW5kbGVfY21kX2FjayhhZGFwLCBoZWFkZXIpOw0K
PiA+ICsJZWxzZQ0KPiA+ICsJCWxqY2FfaGFuZGxlX2V2ZW50KGFkYXAsIGhlYWRlcik7DQo+ID4g
Kw0KPiA+ICtyZXN1Ym1pdDoNCj4gPiArCXJldCA9IHVzYl9zdWJtaXRfdXJiKHVyYiwgR0ZQX0FU
T01JQyk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWRldl9lcnIoYWRhcC0+ZGV2LCAicmVzdWJt
aXQgcmVjdiB1cmIgZXJyb3IgJWRcbiIsIHJldCk7DQo+IA0KPiBUaGlzIHdpbGwgZGV0ZWN0IGFu
IGVycm9yIGlmIHlvdSBnZXQgYW4gdW5sdWNreSB0aW1pbmcgd2l0aCBsamNhX3N1c3BlbmQoKS4N
Cg0KSW5kZWVkLCB0aGFua3MsIEkgd2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkJS
LA0KV2VudG9uZyANCg0KPiBUaGUgY29ycmVjdCB0ZXN0IHdvdWxkIGJlOg0KPiBpZiAocmV0ICYm
IHJldCAhPSAtRVBFUk0pDQo+IA0KPiAJSFRIDQo+IAkJT2xpdmVyDQo=
