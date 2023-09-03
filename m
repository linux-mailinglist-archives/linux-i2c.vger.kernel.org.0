Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C45790C80
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Sep 2023 16:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240361AbjICOjG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Sep 2023 10:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240963AbjICOjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Sep 2023 10:39:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FE6FA;
        Sun,  3 Sep 2023 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693751942; x=1725287942;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gsylsYfy26pchZbrOqO9EoGnMOGdij3l3PzVkALY/ps=;
  b=eNO7O6ooWQVLHW+BSggEzAGhQkSx4jO26MuvrgSw+aL7VhbpsOB3T/vI
   1Sx6HTDUa+c0QLL8E8N4mO2a01jndl6CzxwK1ygKs02e827oXNkENYoVc
   MW0k5r5YhdVmQHIMDAtuCpTc34eV3x+brbeaQ4n96Eq40apxP6fVkZayA
   6TxgkNpIwy8DZfxA6zht/tohyehBzUi5dzdD7jDhYB4E0RIngOi/Dq4/J
   GdLhzIEgtlHKfWIx2GBpT/PnkJYil5+h/gs+AIroPmPi8nAVAo7++4Rs8
   9MeIrMVCke9Inq2Ev3DYUh6ad5mtQRFjdDoD7SuINu0RgV9Bqn/iMfuMJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="376389853"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="376389853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 07:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="769731570"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="769731570"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Sep 2023 07:39:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 3 Sep 2023 07:39:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 3 Sep 2023 07:39:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 3 Sep 2023 07:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdVNry9j+maIGLTEBZaRu1TQGDFoURYx2xYyg/cNy4IY+qAVaeyKoxJgh2ueZH29WOWtHmJWKtY0w1AligAsIy8ChSaYWZ1kVoTcS8Dd6mabdvqmwuAX60epG1ug2izfJffBSRj3Tt0u/ZPdYB9hp+AnK/dtZD8kybKcNJxvs++R4dYjNpHtC+fu3lrMOJA9V0I89TnkEReTg57MsZJdcs8cUsowqX7H+kUYwQ2afSgeiCCMeoIHx3iSZ1Y4EHgGTg7Qb0r9xOnxvYrFGQvh7EsgQ8J6lO3T6EPwt3f1dP/ajnUi06TZyF9sfMbdgyqf/eVBUS9Up0g0iWthcxPSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsylsYfy26pchZbrOqO9EoGnMOGdij3l3PzVkALY/ps=;
 b=Uboqdyyl8u+FyO34j5lL1Dv1bo7JR2Jc5EylnmzmCekdCu3b/2WyDr7dKI26S15CdqFFgnle//MipD0tIEq7w+9E2IvIfB54/p9lP46h+7BxmT4UKRBaDObgyVoxszY4dIsvh4fKalXng3sruH5N4grQSg2xBPbSuSPyYIBdLdlf8LX15qbAJFOwti2sviGRgop+9JeSe6oRAgQ3jV++TlJcrOZv7HOoiP8Knq7tqW8TMVYwyF4RZL60sVBcOneN0vh9OY3DWfcsLWx9nVoTfbGLqkH/uvQN9LkFKLJ72UHAh3WGMPiPAwyBQ5Jp/GVjTBI0FyIeAZXj15aL+ljAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Sun, 3 Sep
 2023 14:38:58 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6745.030; Sun, 3 Sep 2023
 14:38:58 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
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
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
CC:     "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v12 0/4] Add Intel LJCA device driver
Thread-Topic: [PATCH v12 0/4] Add Intel LJCA device driver
Thread-Index: AQHZ3JZM3L/1K+kPhkqbxShD2s4CurAHoqgAgAAjxMCAACAGgIABQGFg
Date:   Sun, 3 Sep 2023 14:38:58 +0000
Message-ID: <DM6PR11MB43164E5ADAC1A0008199F8F28DEAA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
 <7fc37bb5-2121-4174-fb1d-9edf49213a6c@redhat.com>
 <DM6PR11MB4316D9C6026B6672872939DE8DEBA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <185f2f8a-e2ba-e198-79a2-6c01081f035e@redhat.com>
In-Reply-To: <185f2f8a-e2ba-e198-79a2-6c01081f035e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CY8PR11MB6890:EE_
x-ms-office365-filtering-correlation-id: 19201e9e-7a18-4b41-8bf4-08dbac8b820f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uiFnKHryCA6+hsEJPB55C2XyCLUrrk0PNpQDCpUnp1de3i8hYcJzjcLK88xjrfjyGk7/s5k+77SoufF2lvULaEXoaOGevDOFFMVHhKHi2QZoYaUyBLwCowfzYLOgVG/VSnXESsrWaFNNv0OslXUqSmxA+LvxZfy1IGS027X25YJugiqCRUuQLbzx/Onu+/kLXIarqLMHkHUxba/Kq4crd0ADm3i1RKd+bmlGbhByHCOZfJ8fVY7+5Q2zJfVoHWIha/y2wFu23EW12W8A3c4PvI/Jm/h+nsgrola3pRCNNId+3gdpnNW1LCzDw1ieTEAxsdutkr2wkziAqUXXFdBl5+ArUlbjbf4x4dvd2gtPTeodH9HxBnhZ2ydKLh/x9y1ycG/w1Ql89TfZc8tTo7Se0c2ZR46ZRTap5PsQcHmxYXteglaGpJWEYeG3nucdkjGTnqu8IjrvyE2U/Wjaqwcd7j1aYCzF7TFs2UR2ftzlRgZUROJ41I+AsMLdyDM+BowmMn0mYfa3yX5gTIAbx/WjwR9OqETQkHe2tODBLisYr4+aHyLWML/FepUNyD3q83MdFSArq0I3ZWhFKXZ/dwln1VRUlF3Un2Ih7Ej230udF4zSMdTMeBj4LYFt0Uw62q4W+KEGMcNfdq2TvKiMg8ycMFtu99rc9aYBN354XscpHyM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(346002)(366004)(1800799009)(451199024)(186009)(8936002)(8676002)(5660300002)(6636002)(316002)(66476007)(66446008)(64756008)(2906002)(110136005)(66556008)(66946007)(76116006)(4326008)(52536014)(7416002)(41300700001)(53546011)(6506007)(7696005)(26005)(9686003)(55016003)(38100700002)(38070700005)(82960400001)(122000001)(71200400001)(921005)(478600001)(966005)(83380400001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bE9iOGxjdEt4eFdlaW1uVWhGdUQrT0VabVpOakUrUzN0NlNNN09XSWtxRmVN?=
 =?utf-8?B?OXpQcWM0WU1sdEVNclRHYzk5cHNFdXRYOWxjREN3M2I4Lzk1b3hlQVViZDRO?=
 =?utf-8?B?NEpJRzhEZGZFa2lWaGxwN0o5UHprY0JjOWYzZThnN1FFNVE2L3BpM3BpZktH?=
 =?utf-8?B?NUtMWWdjOUwzLzZQZTZ1NFIxZnFaK1JLc0FsMWltTGJaN3F2V1czazJWOGdN?=
 =?utf-8?B?eDRNVUZvNHpZUmMyRjlSTDl1aVgxZVBab1NVL0I0U2tadFErTFp5SlJYSUxL?=
 =?utf-8?B?OHdTZ0V3ekxRZUYwY3Nhb2plNExpaUdIbHFmM1JxYUhGY3hZd2hSa2RuVGtO?=
 =?utf-8?B?REp6bURWMlR4WkRyTi9LTWRHQ2tmbVBnS1FyemJaVityeHpldXZzeTBITVJk?=
 =?utf-8?B?RFI2YmNJNDUzTVdyVTQ1aE14Ky9GU3JZeEFRbE9Eb3JFVndwWHhqYUdJK3li?=
 =?utf-8?B?MUlUVkF4ZmFPaUJEMFBGMTB3ZTN3VlU4a0hwNFVKakoxQndpN09vamo2WTVO?=
 =?utf-8?B?WmFNZ1MyUEkrMW5GVkt4ZHBtajg3YnNmeUFzRTVUTlM5TUVrKzNldWJxVUxB?=
 =?utf-8?B?eHBua2trV1NTeFZrL0RWTlV1b0JKVmt0WERCMzBNaVFpczhqeURWakpQQVJi?=
 =?utf-8?B?TnYvbkIySUdPWHVxN2NhMUJVTTJnVGhFNVJEbmozK1VXekNYZmNKV0xtQ3Rh?=
 =?utf-8?B?RG5STUhrVFQyVGwrdXkwMlkyOXR5amNWMktjbjcyc3FVSEM5Sm00NG9GcUVX?=
 =?utf-8?B?dkJ0Ri9KMW01Q1BqQ0dxTURCZy9yMjNsUHA5d1B2R29pZVNWbENya1NFU1BU?=
 =?utf-8?B?SCt6Y2M0NkNQck00R1daZWd3U2lRRWswZk5EWTNCWmUxZFlxdmZJOUdpajJ2?=
 =?utf-8?B?V3ljYmNyOWZ6MzNNOEJ6bEo0Sm04Y05rZGNlZzR3eG5IUURMRmd4R2pheHlF?=
 =?utf-8?B?Nm9xQTBkNmxJV0xLV1FXY2dEeXFZNFRMMTFUNFZKY2E1cXMxTVdVZzR4ODA4?=
 =?utf-8?B?M29idnlFMjUyeERDOFNtSkx2YmxOUHRVeFZMN2UvbzgxcVhGOG9WKzBXOXZr?=
 =?utf-8?B?TG5HanQ3MHpCaTVYK3BaMTZUM2ZSNXB6QWZNVkwyT2l0cVNuOTNWSmprTDNS?=
 =?utf-8?B?K2NzUlIvNm5VNkZUTEw2ZGsyUVJkTm0yQTVGRStjcDl1VWR2WWdacERnSHds?=
 =?utf-8?B?czlzWUlVMzdpMmY1RXZBK3I4Nmh4Q2ZTZ0VqMmNJN0ZKYW42ZzJ3YUR2K0Qr?=
 =?utf-8?B?aHBGN2pVRDJXM1FCdDlDVklQSVRab3dtZlIzQ25UVWgrUXR5a29TNzVOdy9J?=
 =?utf-8?B?aExoY1NweExVRGNKV2xxVVl6Umt4RDZXZG9BNXV0OTFzdkdRRUpSTUsyNk9r?=
 =?utf-8?B?RHlpSk9ibXRKVUJYWFRpdFRTdkQwa085T20yRXlhcjZVYUh0amlnZlJVM3J5?=
 =?utf-8?B?aWlEcERjUDR0QmNLZ3dZM1JvU2NxM3RmaU5PTGpLaVV4Y3pEblhZYW9zM09o?=
 =?utf-8?B?VnM1b3QzR0dpOWdRTFllOWovNTI2blhtWUlUNVRkYm1Cbk5yMkxrV0o1TW40?=
 =?utf-8?B?VDFRbko2dzhMYjFkaXBkUGN6MWlaNU9SN3R2MVZGekJuZ01nMHZ3cHRTWjRk?=
 =?utf-8?B?Ylc4cVlERFdJR2ZWSVpJTHJGemZDWlJQZFo1NzVFdWR5QXhpMzhTaVUyeEVG?=
 =?utf-8?B?SFBPamV6ZFBWMnhYU0FUa3JLQXh0dUdacVl4NjNOQmVSemFkQW9qZnR0a20x?=
 =?utf-8?B?TC9CVXMrZnQwemlYNWpmTVlid05DWFVHQVFHeHd5dUlPREpPM3ZqMzRtZzRu?=
 =?utf-8?B?RzAvTUM5VzZoZ2NVaVJJVndYY3h4ZlRmbnpGNWVtWVJPTmczTEZTdzVMWjFa?=
 =?utf-8?B?ZFhYZlo5VHhmOWlnRXFMV2I3N2dEaS9Dc0J4Q3Z1NkZZV3duQzdvc0JNdkNI?=
 =?utf-8?B?aGlGN0pYbTBKVmY5TXdybUpTbjBSa0JDTGo0NDg0K2FnWG16U3Q2NXpCbFRw?=
 =?utf-8?B?cHpuMmhTQWNGajRqYlcra1lRQTYxUDltRjk0L25rbHg3aXZTTmJHdG9kd1pG?=
 =?utf-8?B?eTBwcmlVT0wwSEdiN2FkMGlMZm1UUE96dW1UclJhNittUk11WXRCYTlXb0JQ?=
 =?utf-8?Q?jdr49Zuqu5xPRMF66yKEPltlg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19201e9e-7a18-4b41-8bf4-08dbac8b820f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2023 14:38:58.5380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nqpwmYAHo3sYkN0MgLdhcUG4SS02zDH+0Ek3RBOEeDwwxQfgNNhYltcLFtnDSCMnRsoX+YzXXUgclS6wsbnTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgSGFucywNCg0KVGhhbmtzIA0KDQo+IEZyb206IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDkvMi8yMyAxOToxNSwgV3UsIFdlbnRvbmcg
d3JvdGU6DQo+ID4gSGkgSGFucywNCj4gPg0KPiA+IFRoYW5rcw0KPiA+DQo+ID4+IEZyb206IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+ID4+DQo+ID4+IEhpLA0KPiA+Pg0K
PiA+PiBPbiA5LzEvMjMgMDc6MzYsIFdlbnRvbmcgV3Ugd3JvdGU6DQo+ID4+PiBBZGQgZHJpdmVy
IGZvciBJbnRlbCBMYSBKb2xsYSBDb3ZlIEFkYXB0ZXIgKExKQ0EpIGRldmljZS4gVGhpcyBpcyBh
DQo+ID4+PiBVU0ItR1BJTywgVVNCLUkyQyBhbmQgVVNCLVNQSSBkZXZpY2UuIFdlIGFkZCA0IGRy
aXZlcnMgdG8gc3VwcG9ydA0KPiA+Pj4gdGhpcw0KPiA+Pj4gZGV2aWNlOiBhIFVTQiBkcml2ZXIs
IGEgR1BJTyBjaGlwIGRyaXZlciwgYSBJMkMgY29udHJvbGxlciBkcml2ZXINCj4gPj4+IGFuZCBh
IFNQSSBjb250cm9sbGVyIGRyaXZlci4NCj4gPj4NCj4gPj4gVGhhbmtzLiBJJ3ZlIGJlZW4gdGVz
dGluZyB0aGlzIG9uIGEgTGVub3ZvIFgxIFRoaW5rUGFkIFlvZ2EgZ2VuIDgNCj4gPj4gd2l0aCBh
bg0KPiA+PiBvdjI3NDAgc2Vuc29yIGNvbm5lY3RlZCB0byB0aGUgTEpDQSBkZXZpY2UuDQo+ID4N
Cj4gPiBUaGFua3MsIGFuZCBJIGRvbuKAmXQgaGF2ZSB0aGlzIGxhcHRvcCwgY291bGQgeW91IHBs
ZWFzZSBzaGFyZSB5b3VyIERTRFQNCj4gPiBzbyB0aGF0IEkgY2FuIHVuZGVyc3RhbmQgaXQgbW9y
ZT8NCj4gDQo+IEkgaGF2ZSBzZW5kIHlvdSBhbiBhY3BpZHVtcCBieSBwcml2YXRlIGVtYWlsLg0K
PiANCj4gPiBBbmQgSSB3aWxsIHVwZGF0ZSB0aGlzIHBhdGNoIHNldCBhZnRlciB1bmRlcnN0YW5k
IHlvdXIgRFNEVCBhbmQgaGF2ZQ0KPiA+IHRoZSBwYXRjaGVzIHRlc3RlZCBvbiBteSBzZXR1cC4N
Cj4gDQo+IE9rLiBOb3RlIHRoYXQgdGhlIG91dCBvZiB0cmVlIGl2c2MgZHJpdmVyIGFscmVhZHkg
ZG9lcyB1aWQgbWF0Y2hpbmcgaW4gdGhlIGkyYy0NCj4gZHJpdmVyIHRvIGZpeHVwIHRoZSB3cm9u
ZyBBQ1BJIGNvbXBhbmlvbiBiZWluZyBhc3NpZ25lZCBieSB0aGUgTUZEIGRyaXZlciwgc2VlOg0K
PiANCj4gaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2l2c2MtZHJpdmVyL2Jsb2IvbWFpbi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLQ0KPiBsamNhLmMjTDM0Ng0KDQpUaGFua3MsIHRoZXJlIGlzIGEg
bGl0dGxlIGJpdCBjaGFuZ2UgYmFzZWQgb24geW91ciBwYXRjaCwgYmVjYXVzZSBzaW5jZSBSUEwN
CnRoZSBVSUQgYmVjb21lcyAiTmFtZSAoX1VJRCwgIlZJQzAiKSIgc3R5bGUuIENvdWxkIHlvdSBw
bGVhc2UgcmV2aXNpdA0KYmVsb3cgY29kZT8NCg0Kc3RhdGljIGludCBsamNhX21hdGNoX2Rldmlj
ZV9pZHMoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2LCB2b2lkICpkYXRhKQ0Kew0KICAgICAgICBz
dHJ1Y3QgbGpjYV9tYXRjaF9pZHNfd2Fsa19kYXRhICp3ZCA9IGRhdGE7DQogICAgICAgIGNvbnN0
IGNoYXIgKnVpZCA9IGFjcGlfZGV2aWNlX3VpZChhZGV2KTsNCg0KICAgICAgICBpZiAoYWNwaV9t
YXRjaF9kZXZpY2VfaWRzKGFkZXYsIHdkLT5pZHMpKQ0KICAgICAgICAgICAgICAgIHJldHVybiAw
Ow0KDQogICAgICAgIGlmICghd2QtPnVpZCkNCiAgICAgICAgICAgICAgICBnb3RvIG1hdGNoOw0K
DQogICAgICAgIGlmICghdWlkKQ0KICAgICAgICAgICAgICAgIHVpZCA9ICIwIjsNCiAgICAgICAg
ZWxzZQ0KICAgICAgICAgICAgICAgIHVpZCA9IG1lbWNocih1aWQsIHdkLT51aWRbMF0sIHN0cmxl
bih1aWQpKTsNCg0KICAgICAgICBpZiAoIXVpZCB8fCBzdHJjbXAodWlkLCB3ZC0+dWlkKSkNCiAg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCg0KbWF0Y2g6DQogICAgICAgIHdkLT5hZGV2ID0gYWRl
djsNCg0KICAgICAgICByZXR1cm4gMTsNCn0NCg0KVGhhbmtzDQpXZW50b25nDQo+IA0KPiBGb3Ig
dXBzdHJlYW0gaXQgc2VlbWVkIGNsZWFuZXIgdG8gbWUgdG8gZGlyZWN0bHkgcGljayB0aGUgY29y
cmVjdCBBQ1BJDQoNClRoYW5rcw0KDQo+IGNvbXBhbmlvbiBhdCBhdXgtZGV2aWNlIGluc3RhbnRp
YXRpb24sIHNvbWV0aGluZyB3aGljaCB3YXMgbm90IHBvc3NpYmxlIHdpdGgNCj4gdGhlIE1GRCBh
cHByb2FjaCBidXQgaXMgcG9zc2libGUgd2l0aCB0aGUgYXV4aWxhcnkgYnVzIGFwcHJvYWNoLg0K
PiANCj4gQW5kIHRoZSBvdGhlciBjaGFuZ2Ugd2hpY2ggSSdtIHByb3Bvc2luZyBoYXMgYWxyZWFk
eSBiZWVuIG1lcmdlZCBpbnRvIHRoZSBvdXQNCj4gb2YgdHJlZSB2ZXJzaW9uIG9mIHRoZSBMSkNB
IGkyYyBkcml2ZXI6DQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvaXZzYy0NCj4gZHJp
dmVyL2NvbW1pdC83MGQ5NTI2OTE2OWNmOWU0NTI1ODBiMGMxNTQ3MTgyOWRmNGE2ZDU5DQo+IA0K
PiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiA+PiBJIG5l
ZWRlZCAyIHNtYWxsKGlzaCkgZml4ZXMgdG8gbWFrZSBldmVyeXRoaW5nIHdvcmsgdGhlcmUuDQo+
ID4+IEkgaGF2ZSBhdHRhY2hlZCB0aGUgMiBmaXhlcyBoZXJlLg0KPiA+Pg0KPiA+PiBXaXRoIHRo
ZXNlIDIgZml4ZXMgdGhpcyBzZXJpZXMgaXM6DQo+ID4+DQo+ID4+IFRlc3RlZC1ieTogSGFucyBk
ZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gPg0KPiA+IFRoYW5rcyBhIGxvdA0KPiA+
DQo+ID4gQlIsDQo+ID4gV2VudG9uZw0KPiA+Pg0KPiA+PiBSZWdhcmRzLA0KPiA+Pg0KPiA+PiBI
YW5zDQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+PiAtLS0NCj4gPj4+IHYxMjoN
Cj4gPj4+ICAtIHN3aXRjaCBkZXZfZXJyIHRvIGRldl9kYmcgZm9yIGkyYy1samNhIGRyaXZlcg0K
PiA+Pj4gIC0gYXZvaWQgZXJyIHByaW50aW5nIGJlY2F1c2Ugb2YgY2FsbGluZyB1c2Jfa2lsbF91
cmIgd2hlbiBhdHRlbXB0cw0KPiA+Pj4gdG8gcmVzdWJtaXQgdGhlIHJ4IHVyYg0KPiA+Pj4NCj4g
Pj4+IHYxMToNCj4gPj4+ICAtIHN3aXRjaCBkZXZfZXJyIHRvIGRldl9kYmcgZm9yIGkyYy1samNh
IGRyaXZlcg0KPiA+Pj4gIC0gcmVtb3ZlIG1lc3NhZ2UgbGVuZ3RoIGNoZWNrIGJlY2F1c2Ugb2Yg
ZGVmaW5lZCBxdWlyayBzdHJ1Y3R1cmUNCj4gPj4+ICAtIHJlbW92ZSBJMkNfRlVOQ19TTUJVU19F
TVVMIHN1cHBvcnQNCj4gPj4+DQo+ID4+PiB2MTA6DQo+ID4+PiAgLSByZW1vdmUgbGpjYV9pMmNf
Zm9ybWF0X3NsYXZlX2FkZHINCj4gPj4+ICAtIHJlbW92ZSBtZW1zZXQgYmVmb3JlIHdyaXRlIHdy
aXRlIHdfcGFja2V0DQo+ID4+PiAgLSBtYWtlIGxqY2FfaTJjX3N0b3Agdm9pZCBhbmQgcHJpbnQg
ZXJyIG1lc3NhZ2UgaW4gY2FzZSBmYWlsdXJlDQo+ID4+PiAgLSB1c2UgZGV2X2Vycl9wcm9iZSBp
biBsamNhX2kyY19wcm9iZSBmdW5jdGlvbg0KPiA+Pj4NCj4gPj4+IHY5Og0KPiA+Pj4gIC0gb3Zl
cmhhdWwgdXNiLWxqY2EgZHJpdmVyIHRvIG1ha2UgaXQgbW9yZSBzdHJ1Y3R1cmVkIGFuZCBlYXN5
DQo+ID4+PiB1bmRlcnN0YW5kDQo+ID4+PiAgLSBmaXggbWVtb3J5IGxlYWsgaXNzdWUgZm9yIHVz
Yi1samNhIGRyaXZlcg0KPiA+Pj4gIC0gYWRkIHNwaW5sb2NrIHRvIHByb3RlY3QgdHhfYnVmIGFu
ZCBleF9idWYNCj4gPj4+ICAtIGNoYW5nZSBleHBvcnRlZCBBUElzIGZvciB1c2ItbGpjYSBkcml2
ZXINCj4gPj4+ICAtIHVuaWZ5IHByZWZpeCBmb3Igc3RydWN0dXJlcyBhbmQgZnVuY3Rpb25zIGZv
ciBpMmMtbGpjYSBkcml2ZXINCj4gPj4+ICAtIHVuaWZ5IHByZWZpeCBmb3Igc3RydWN0dXJlcyBh
bmQgZnVuY3Rpb25zIGZvciBzcGktbGpjYSBkcml2ZXINCj4gPj4+ICAtIHVuaWZ5IHByZWZpeCBm
b3Igc3RydWN0dXJlcyBhbmQgZnVuY3Rpb25zIGZvciBncGlvLWxqY2EgZHJpdmVyDQo+ID4+PiAg
LSB1cGRhdGUgZ3Bpby1samNhLCBpMmMtbGpjYSBhbmQgc3BpLWxqY2EgZHJpdmVycyBhY2NvcmRp
bmcgdG8NCj4gPj4+IHVzYi1samNhJ3MgY2hhbmdlcw0KPiA+Pj4NCj4gPj4+IFdlbnRvbmcgV3Ug
KDQpOg0KPiA+Pj4gICB1c2I6IEFkZCBzdXBwb3J0IGZvciBJbnRlbCBMSkNBIGRldmljZQ0KPiA+
Pj4gICBpMmM6IEFkZCBzdXBwb3J0IGZvciBJbnRlbCBMSkNBIFVTQiBJMkMgZHJpdmVyDQo+ID4+
PiAgIHNwaTogQWRkIHN1cHBvcnQgZm9yIEludGVsIExKQ0EgVVNCIFNQSSBkcml2ZXINCj4gPj4+
ICAgZ3BpbzogdXBkYXRlIEludGVsIExKQ0EgVVNCIEdQSU8gZHJpdmVyDQo+ID4+Pg0KPiA+Pj4g
IGRyaXZlcnMvZ3Bpby9LY29uZmlnICAgICAgICAgIHwgICA0ICstDQo+ID4+PiAgZHJpdmVycy9n
cGlvL2dwaW8tbGpjYS5jICAgICAgfCAyNDYgKysrKysrKy0tLS0tLQ0KPiA+Pj4gIGRyaXZlcnMv
aTJjL2J1c3Nlcy9LY29uZmlnICAgIHwgIDExICsNCj4gPj4+ICBkcml2ZXJzL2kyYy9idXNzZXMv
TWFrZWZpbGUgICB8ICAgMSArDQo+ID4+PiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1samNhLmMg
fCAzMjYgKysrKysrKysrKysrKysrKysNCj4gPj4+ICBkcml2ZXJzL3NwaS9LY29uZmlnICAgICAg
ICAgICB8ICAxMSArDQo+ID4+PiAgZHJpdmVycy9zcGkvTWFrZWZpbGUgICAgICAgICAgfCAgIDEg
Kw0KPiA+Pj4gIGRyaXZlcnMvc3BpL3NwaS1samNhLmMgICAgICAgIHwgMjk3ICsrKysrKysrKysr
KysrKw0KPiA+Pj4gIGRyaXZlcnMvdXNiL21pc2MvS2NvbmZpZyAgICAgIHwgIDE0ICsNCj4gPj4+
ICBkcml2ZXJzL3VzYi9taXNjL01ha2VmaWxlICAgICB8ICAgMSArDQo+ID4+PiAgZHJpdmVycy91
c2IvbWlzYy91c2ItbGpjYS5jICAgfCA4MTcNCj4gPj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4+PiAgaW5jbHVkZS9saW51eC91c2IvbGpjYS5oICAgICAg
fCAxMTMgKysrKysrDQo+ID4+PiAgMTIgZmlsZXMgY2hhbmdlZCwgMTczNyBpbnNlcnRpb25zKCsp
LCAxMDUgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPiA+Pj4gMTAwNjQ0IGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtbGpjYS5jICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPj4+IGRyaXZlcnMvc3Bp
L3NwaS1samNhLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4gZHJpdmVycy91c2IvbWlzYy91
c2ItbGpjYS5jIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4gaW5jbHVkZS9saW51eC91c2IvbGpj
YS5oDQo+ID4+Pg0KDQo=
