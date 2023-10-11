Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3717C544F
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 14:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjJKMuo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 08:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbjJKMun (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 08:50:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9853193;
        Wed, 11 Oct 2023 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697028641; x=1728564641;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MnSAvSIz1nVitIhywwxP4F+HcfcPzt1cEfIFz08NVKc=;
  b=NjQTzBsP6nwvQ7dng3EhaZWsfMEovJJZ2qhmgZUAdX6I3fl2GZJRpiY7
   9Z+Nz63cFAcDU0ASiA0OAeFmMUhOi1sSjVdirdisOX8gL7VJy8foLUzfm
   RnZ97QJWm7b2E8xPEHJ1bvsG/vqRGxtQ4DyKFoZXfcbx8DdpeXprb65vO
   OcQTBXIpG+DdjNQy/WzNFdiML1CBDvPft4VLFJLorC7oPPFWh4jmGwgjZ
   uLHcoBKvhrXr2MQssqPIv4XxBOFwEDzSSHKIlO2r77YhlSfR88oiEzzak
   r8SUXbF/ad2B1oBtHvllpNjXIQoo5NZO/EOHO4FPny9yxkdT9YzSTaKHv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383516952"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="383516952"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 05:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730482492"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="730482492"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Oct 2023 05:50:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 05:50:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 05:50:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 05:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwfZMjkweZ9pnTmWSuEZ8CsYiCgUpSq0EfHYJhifq0uZkV4eZz7+pdfEFTG4ZcfD4uCRm/8Gq8j3j5UwM8uO3ehdYDNHWlffimgvWWyUB1P+EkX9GFCiasYqlon9EwhRszpZlVOXm3eHR32sMogA2Q+I6jnK7Nx4X8QY1ATb2i4p47prgvKS04C2OdA43eO2i6z4rXlT27YKvir+XlYUMndC4i77VffiC5qQ2JPcFkmQ4rxJXmqJ78g73+endK1yreEo45GfNH/9uGVNrYXzADYG/x0+jz+2MYFJX3KUeub58XGtVgsHFTI+pmqnyFUczgXX4AavcXfMbDfhiH5vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnSAvSIz1nVitIhywwxP4F+HcfcPzt1cEfIFz08NVKc=;
 b=bdCeBP29HMSUy6nwhmNi2Pw5LGBPr2Ugpa1HrIYk+bxlbFutnJmcfg26yJqcoKLqn3ZIKxceeXXO+i8zDQqUvzgkpP1NEdyEEiHwMSNR4gdu6QnMiToUr15oDV+8et+mXGrCt3sfOwgp+F4sGM6u8dUYQtK0IUvP2xB8m56lizwNEMJoHEGmEhguFWF+1e9iqGH4tkLEggU/9hUotHF6c/feMHLguecmonVfBkmnYN+Sis+ydmuqeK9JfHwIh+O4828M9x1k2Y1JwYtnYO76W9dHzJp8SRWQK21fVjfSzq1ce/DxLhYmmy0LXC0AWaDhrwGdUUir7fPklPfEEuZmwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by SA2PR11MB4777.namprd11.prod.outlook.com (2603:10b6:806:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 12:50:36 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 12:50:36 +0000
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
Thread-Index: AQHZ+nqZYOWB2QQzm0agSGlxpBPNmbBEZGUAgAAEnYCAAByScA==
Date:   Wed, 11 Oct 2023 12:50:35 +0000
Message-ID: <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
In-Reply-To: <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|SA2PR11MB4777:EE_
x-ms-office365-filtering-correlation-id: 15383181-58c3-46ad-69c4-08dbca58a9de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xpl3rMDiUPZHl7vzi1RLwnKJzatX6vBo6Q3PLxFpWfxsl9oHBnhaXLtIb5zsQhYUMVMZW81ij+DMjLhSgrrRhqmO0epyjsp5WdlLdPFkt9AQvKyP3N4BfrZdqypdn+lHOUPfOkJfrCYXfvd7rt2xmONn7KxefjamywueRmO+RUQQEpsgt2XDovcOcmUnNeaBK5lx+Kcy6+4IuxMWUiWzIM4WoGyDu0qqUFbanWxn5RJKwlvWear2YGCFX3E9+ODwLdxlOKgpjuXzUZclCZRO6Og/fqCBY5rmr8yRGJ96n97C66v0V+aC/dxgmtM3YCN2txDrCn/QyJHvWx5YETQkM8kai5xra14vRRWbTPwY/5ywoH/AVrL7clqOfSL04rpQWOt5E/d6hCMed2lCDEVlQbVqZtxya657tDb6Q6/Ayhdsr0vbj410CPXOLkoBJh9mY3gQSSWkYKyqsy9lNQkgyWx3dTnyhErUdQ5GUS7VJbB2Ll6RNQJTmLn4pNwD+/cfjfOzxfTzB9EmvrNd8xV+pPJL+N2qWoKrrkNYvPslyGuvJM1APMfqisnsoorbWYG6A8RvQO2/hoV3i5CJs1sbutwlmneNt4+9AidAIxp1vpe+7Ph7C1hOM1gZnj/3IEM/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(38070700005)(5660300002)(41300700001)(122000001)(52536014)(8676002)(8936002)(4326008)(33656002)(86362001)(2906002)(82960400001)(7416002)(478600001)(7696005)(6506007)(9686003)(53546011)(71200400001)(26005)(6636002)(316002)(64756008)(66446008)(66476007)(66556008)(76116006)(54906003)(38100700002)(66946007)(83380400001)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0I2NGljZXJUL3FwZEhlU3V5TUtERXB4VXVKQTVnVXZiaXNtWG50YmpuOGRu?=
 =?utf-8?B?czh4R3NBdEh2THdJanhwckZycjFac21IVXByQ2Z0dlJ5dTdxN21KZmladnVi?=
 =?utf-8?B?VUV4V1RKSnU3a0txRTBDLzl5dnR2aG5DU1ZvQnlLbnZTcFQ2Tldndzc4Ympa?=
 =?utf-8?B?U1QrSjlzKzljTEU2d0ZoaER5ZTEyeFNSeUNzSTBycUV2NDVndCt4bjVNc1ZY?=
 =?utf-8?B?MzU5NHhOM1BPb1B5TTlFanJXemdhcFZLRHZYdWJpbVprcHpnRU93dkJQc0p2?=
 =?utf-8?B?R2dGRmRKNzBWbnJVejZuZlMzdEgrSnpkbnNhY2pCRkluL3hVc2hlMHhwSDVL?=
 =?utf-8?B?Zk5IVnQxMTVWeUh2ZEFSNnptZ3B5Mk5TdFZoOFU5NDhkZEhKMHhLZGtCODZx?=
 =?utf-8?B?ZllKbm83VEk3TEhZTDlDMXQ3SjkyamhYUDM3Ty9XZEt0Sld5ekFRZHJnMjN4?=
 =?utf-8?B?MGZWVnhEMHE2MHFsZG0vd0dNUUtFQzQzVnlFdlovYmNIMXR4ZVY2M3lMRGNk?=
 =?utf-8?B?d054SC96MjNML0N0UlRYNGt6bVdJczg2cXdWRUo2R1MvOWhrVWpJQnhiUjYv?=
 =?utf-8?B?STkycE9QRVVaMFNaY2ZDVEJ3SjVrSklpUjlqNVBUOE1WTWdXVDVwM2VDZEgv?=
 =?utf-8?B?eFJOTVJ4UzBOaVR6UmdINmZnMVBXMy90TUJmNmZSUkxRSGZ0SUV1RUNSMlJt?=
 =?utf-8?B?SzhaS3RqSm5TTm1OOHVWTHJMY205TUZPT1hNV1JDSFlZUlhpcVR1YTRTMWxR?=
 =?utf-8?B?QlhsS05reTRHWkdaSENQQWtnTFhNeEZ4aTVLMHRYMkJwQ2NCeVV6c2VhcDZr?=
 =?utf-8?B?c2l5eXY3L0NudGhXQkZBRVVDSHNvbEhOdDBaMTZFWnlVYnA4UHlTUmQ5QUNv?=
 =?utf-8?B?U2lQSXBOT1FCczMrVnlLbGxCazBFeld1R09zdUxjNU1NVVJSTTdpMTJTQk0w?=
 =?utf-8?B?RWtQRXBBMUc3M0V6OFFkL2QrcGI1UHV0VUk1bGJEU09nU2lQcjlQeEp5a0Ew?=
 =?utf-8?B?UXRsV2NxMjlTV2NtekJ2cVo1ZFc3bjBOZ3BFZzFWeHpYYVZuWnI5S04xaFA5?=
 =?utf-8?B?ZThuWGMzNEgvMzBhRzhqOWdDS3o2Wk5uUHJNTEFVQ2wrblNmL0ljN2R4OEg1?=
 =?utf-8?B?THRXUDhTaDBFb1l2ZVdrdmdtaVdZaGpSd0hYQU0rYTJ6bWxETDUrSVV6OWJo?=
 =?utf-8?B?OVVhL0JkTXRreVZtS2prejhaWjg2d25FVWxnQlRhVHFEVWJyeVU0QlRXWDJD?=
 =?utf-8?B?ZkdqV2ZHK053QVg2VUkwMllDZkU2eEh5UnJTald5dU5waGZhSGVnM0pMV1Jt?=
 =?utf-8?B?YkpNMDduTWtqMFI2dE1wM2I2REMrVFNkaTBiVHcwc2pGNm1FaXV5N1JUVmtJ?=
 =?utf-8?B?TlliTzlrcHZxcWhFcDYxYnp6NmpHaXJWcElSZFpRdTh3bm9Vb0pKYlFIdWJX?=
 =?utf-8?B?V0V1T3RZcmd4Q0xVUlZUQU9FNldPWUFDM2RnQWJYUjNZWjFFa1daNFpucEV6?=
 =?utf-8?B?Rmd3ZjBDWXVjMDAvU3VDVTlFazZvVnZEdlpUMU9vQitIRE9uSm16NXo0V0VV?=
 =?utf-8?B?U2ZIdDhkYWVYNGF6bldlREpISjB4SEI5T1V1aGlVQjFKbGpNTUc1TVFUM0V6?=
 =?utf-8?B?WERURnJRVzhJQ3orZEZsaWd2bzJDeCtjVjhIaEtHZ1g0NDhBRUhXRC8yTGor?=
 =?utf-8?B?N3Rjb3JyczY5ZHRCbUVFTEp2V09tV0QvTTJYT2dqUG5QM0JkSnhMV2d3aDl1?=
 =?utf-8?B?RndUU1ZHNXZVRXgzK2JpdDNMamtVd0dzYmE0cENuOFd5LzhNK1ZTYXpKU0JF?=
 =?utf-8?B?UHprZnJhR0V6VUVlMkNmVlpQUTBhTnZoNjlTNmlPOC9CaFNHMDROL2pITXZo?=
 =?utf-8?B?eGorWkVkeUZZVU1mZndmYVNJTllSSkFnVGZDTThIZ0N1ZFBQeDI0UGhUS2x0?=
 =?utf-8?B?OW1sUmVlSWJUWjQzcWY4YTY0L0JCY0NFb1lRUDV1SWRwWTFTTzBqa1Y3bHNN?=
 =?utf-8?B?L2tVSExHQ1N0N2JxTkx5YlpUazd4Qk85eVVEb0dnTWM3eG8zZlltRVdyMHRL?=
 =?utf-8?B?aGwrcG93WGhxRTBoL0tHQ1djTVJRb2NNSEJ3Tjk0eE5VSmpqczVkc0pmV2RJ?=
 =?utf-8?Q?5o+VIn0X3pyoFEPYrpB+RwTTr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15383181-58c3-46ad-69c4-08dbca58a9de
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 12:50:35.8394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XxLkxSTgnr7X22bg54g3HfqVfREVZA8vTEtQRjPFay6zZt16z/3Og7bg9sKUTCAVe4/VMocgZ0Ju6mxfRPQqCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4777
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZT4NCj4gDQo+IEhpLA0KPiANCj4gT24gMTAv
MTEvMjMgMTI6MjEsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiBPbiBNb24sIE9jdCAwOSwg
MjAyMyBhdCAwMjozMzoyMlBNICswODAwLCBXZW50b25nIFd1IHdyb3RlOg0KPiA+PiBJbXBsZW1l
bnRzIHRoZSBVU0IgcGFydCBvZiBJbnRlbCBVU0ItSTJDL0dQSU8vU1BJIGFkYXB0ZXIgZGV2aWNl
DQo+ID4+IG5hbWVkICJMYSBKb2xsYSBDb3ZlIEFkYXB0ZXIiIChMSkNBKS4NCj4gPj4NCj4gPj4g
VGhlIGNvbW11bmljYXRpb24gYmV0d2VlbiB0aGUgdmFyaW91cyBMSkNBIG1vZHVsZSBkcml2ZXJz
IGFuZCB0aGUNCj4gPj4gaGFyZHdhcmUgd2lsbCBiZSBtdXhlZC9kZW11eGVkIGJ5IHRoaXMgZHJp
dmVyLiBUaHJlZSBtb2R1bGVzICggSTJDLA0KPiA+PiBHUElPLCBhbmQgU1BJKSBhcmUgc3VwcG9y
dGVkIGN1cnJlbnRseS4NCj4gPj4NCj4gPj4gRWFjaCBzdWItbW9kdWxlIG9mIExKQ0EgZGV2aWNl
IGlzIGlkZW50aWZpZWQgYnkgdHlwZSBmaWVsZCB3aXRoaW4gdGhlDQo+ID4+IExKQ0EgbWVzc2Fn
ZSBoZWFkZXIuDQo+ID4+DQo+ID4+IFRoZSBzdWItbW9kdWxlcyBvZiBMSkNBIGNhbiB1c2UgbGpj
YV90cmFuc2ZlcigpIHRvIGlzc3VlIGEgdHJhbnNmZXINCj4gPj4gYmV0d2VlbiBob3N0IGFuZCBo
YXJkd2FyZS4gQW5kIGxqY2FfcmVnaXN0ZXJfZXZlbnRfY2IgaXMgZXhwb3J0ZWQgdG8NCj4gPj4g
TEpDQSBzdWItbW9kdWxlIGRyaXZlcnMgZm9yIGhhcmR3YXJlIGV2ZW50IHN1YnNjcmlwdGlvbi4N
Cj4gPj4NCj4gPj4gVGhlIG1pbmltdW0gY29kZSBpbiBBU0wgdGhhdCBjb3ZlcnMgdGhpcyBib2Fy
ZCBpcyBTY29wZQ0KPiA+PiAoXF9TQi5QQ0kwLkRXQzMuUkhVQi5IUzAxKQ0KPiA+PiAgICAgew0K
PiA+PiAgICAgICAgIERldmljZSAoR1BJTykNCj4gPj4gICAgICAgICB7DQo+ID4+ICAgICAgICAg
ICAgIE5hbWUgKF9BRFIsIFplcm8pDQo+ID4+ICAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEYp
DQo+ID4+ICAgICAgICAgfQ0KPiA+Pg0KPiA+PiAgICAgICAgIERldmljZSAoSTJDKQ0KPiA+PiAg
ICAgICAgIHsNCj4gPj4gICAgICAgICAgICAgTmFtZSAoX0FEUiwgT25lKQ0KPiA+PiAgICAgICAg
ICAgICBOYW1lIChfU1RBLCAweDBGKQ0KPiA+PiAgICAgICAgIH0NCj4gPj4NCj4gPj4gICAgICAg
ICBEZXZpY2UgKFNQSSkNCj4gPj4gICAgICAgICB7DQo+ID4+ICAgICAgICAgICAgIE5hbWUgKF9B
RFIsIDB4MDIpDQo+ID4+ICAgICAgICAgICAgIE5hbWUgKF9TVEEsIDB4MEYpDQo+ID4+ICAgICAg
ICAgfQ0KPiA+PiAgICAgfQ0KPiA+DQo+ID4gVGhpcyBjb21taXQgbWVzc2FnZSBpcyBub3QgdHJ1
ZSBhbnltb3JlLCBvciBtaXNsZWFkaW5nIGF0IGJhcmUgbWluaW11bS4NCj4gPiBUaGUgQUNQSSBz
cGVjaWZpY2F0aW9uIGlzIGNyeXN0YWwgY2xlYXIgYWJvdXQgdXNhZ2UgX0FEUiBhbmQgX0hJRCwg
aS5lLg0KPiA+IHRoZXkgbXVzdCBOT1QgYmUgdXNlZCB0b2dldGhlciBmb3IgdGhlIHNhbWUgZGV2
aWNlIG5vZGUuIFNvLCBjYW4geW91DQo+ID4gY2xhcmlmeSBob3cgdGhlIERTRFQgaXMgb3JnYW5p
emVkIGFuZCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBpdA0KPiA+IG1heSByZXF1aXJl
IChxdWl0ZSBsaWtlbHkpIHRvIHJlZGVzaWduIHRoZSBhcmNoaXRlY3R1cmUgb2YgdGhpcw0KPiA+
IGRyaXZlci4gU29ycnkgSSBtaXNzZWQgdGhpcyBmcm9tIHByZXZpb3VzIHJvdW5kcyBhcyBJIHdh
cyBidXN5IGJ5DQo+ID4gc29tZXRoaW5nIGVsc2UuDQo+IA0KPiBUaGlzIHBhcnQgb2YgdGhlIGNv
bW1pdCBtZXNzYWdlIHVuZm9ydHVuYXRlbHkgaXMgbm90IGFjY3VyYXRlLg0KPiBfQURSIGlzIG5v
dCB1c2VkIGluIGVpdGhlciBEU0RUcyBvZiBzaGlwcGluZyBodzsgbm9yIGluIHRoZSBjb2RlLg0K
DQpXZSBoYXZlIGNvdmVyZWQgdGhlIF9BRFIgaW4gdGhlIGNvZGUgbGlrZSBiZWxvdywgaXQgZmly
c3QgdHJ5IHRvIGZpbmQgdGhlDQpjaGlsZCBkZXZpY2UgYmFzZWQgb24gX0FEUiwgaWYgbm90IGZv
dW5kLCBpdCB3aWxsIGNoZWNrIHRoZSBfSElELCBhbmQgdGhlcmUNCmlzIGNsZWFyIGNvbW1lbnQg
aW4gdGhlIGZ1bmN0aW9uLg0KDQovKiBiaW5kIGF1eGlsaWFyeSBkZXZpY2UgdG8gYWNwaSBkZXZp
Y2UgKi8NCnN0YXRpYyB2b2lkIGxqY2FfYXV4ZGV2X2FjcGlfYmluZChzdHJ1Y3QgbGpjYV9hZGFw
dGVyICphZGFwLA0KCQkJCSAgIHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphdXhkZXYsDQoJCQkJ
ICAgdTY0IGFkciwgdTggaWQpDQp7DQoJc3RydWN0IGxqY2FfbWF0Y2hfaWRzX3dhbGtfZGF0YSB3
ZCA9IHsgMCB9Ow0KCXN0cnVjdCBhY3BpX2RldmljZSAqcGFyZW50LCAqYWRldjsNCglzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSBhZGFwLT5kZXY7DQoJY2hhciB1aWRbNF07DQoNCglwYXJlbnQgPSBBQ1BJ
X0NPTVBBTklPTihkZXYpOw0KCWlmICghcGFyZW50KQ0KCQlyZXR1cm47DQoNCgkvKg0KCSAqIGdl
dCBhdXhkZXYgQUNQSSBoYW5kbGUgZnJvbSB0aGUgQUNQSSBkZXZpY2UgZGlyZWN0bHkNCgkgKiB1
bmRlciB0aGUgcGFyZW50IHRoYXQgbWF0Y2hlcyBfQURSLg0KCSAqLw0KCWFkZXYgPSBhY3BpX2Zp
bmRfY2hpbGRfZGV2aWNlKHBhcmVudCwgYWRyLCBmYWxzZSk7DQoJaWYgKGFkZXYpIHsNCgkJQUNQ
SV9DT01QQU5JT05fU0VUKCZhdXhkZXYtPmRldiwgYWRldik7DQoJCXJldHVybjsNCgl9DQoNCgkv
Kg0KCSAqIF9BRFIgaXMgYSBncmV5IGFyZWEgaW4gdGhlIEFDUEkgc3BlY2lmaWNhdGlvbiwgc29t
ZQ0KCSAqIHBsYXRmb3JtcyB1c2UgX0hJRCB0byBkaXN0aW5ndWlzaCBjaGlsZHJlbiBkZXZpY2Vz
Lg0KCSAqLw0KCXN3aXRjaCAoYWRyKSB7DQoJY2FzZSBMSkNBX0dQSU9fQUNQSV9BRFI6DQoJCXdk
LmlkcyA9IGxqY2FfZ3Bpb19oaWRzOw0KCQlicmVhazsNCgljYXNlIExKQ0FfSTJDMV9BQ1BJX0FE
UjoNCgljYXNlIExKQ0FfSTJDMl9BQ1BJX0FEUjoNCgkJc25wcmludGYodWlkLCBzaXplb2YodWlk
KSwgIiVkIiwgaWQpOw0KCQl3ZC51aWQgPSB1aWQ7DQoJCXdkLmlkcyA9IGxqY2FfaTJjX2hpZHM7
DQoJCWJyZWFrOw0KCWNhc2UgTEpDQV9TUEkxX0FDUElfQURSOg0KCWNhc2UgTEpDQV9TUEkyX0FD
UElfQURSOg0KCQl3ZC5pZHMgPSBsamNhX3NwaV9oaWRzOw0KCQlicmVhazsNCglkZWZhdWx0Og0K
CQlkZXZfd2FybihkZXYsICJ1bnN1cHBvcnRlZCBfQURSXG4iKTsNCgkJcmV0dXJuOw0KCX0NCg0K
CWFjcGlfZGV2X2Zvcl9lYWNoX2NoaWxkKHBhcmVudCwgbGpjYV9tYXRjaF9kZXZpY2VfaWRzLCAm
d2QpOw0KDQo+IA0KPiBUaGUgY29kZSBpbiBxdWVzdGlvbiBwYXJzaW5nIHRoZSByZWxldmFudCBw
YXJ0IG9mIHRoZSBEU0RUIGxvb2tzIGxpa2UgdGhpczoNCj4gDQo+IHN0YXRpYyBpbnQgbGpjYV9t
YXRjaF9kZXZpY2VfaWRzKHN0cnVjdCBhY3BpX2RldmljZSAqYWRldiwgdm9pZCAqZGF0YSkgew0K
PiAgICAgICAgIHN0cnVjdCBsamNhX21hdGNoX2lkc193YWxrX2RhdGEgKndkID0gZGF0YTsNCj4g
ICAgICAgICBjb25zdCBjaGFyICp1aWQgPSBhY3BpX2RldmljZV91aWQoYWRldik7DQo+IA0KPiAg
ICAgICAgIGlmIChhY3BpX21hdGNoX2RldmljZV9pZHMoYWRldiwgd2QtPmlkcykpDQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+ICAgICAgICAgaWYgKCF3ZC0+dWlkKQ0KPiAgICAg
ICAgICAgICAgICAgZ290byBtYXRjaDsNCj4gDQo+ICAgICAgICAgaWYgKCF1aWQpDQo+ICAgICAg
ICAgICAgICAgICAvKg0KPiAgICAgICAgICAgICAgICAgICogU29tZSBEU0RUcyBoYXZlIG9ubHkg
b25lIEFDUEkgY29tcGFuaW9uIGZvciB0aGUgdHdvIEkyQw0KPiAgICAgICAgICAgICAgICAgICog
Y29udHJvbGxlcnMgYW5kIHRoZXkgZG9uJ3Qgc2V0IGEgVUlEIGF0IGFsbCAoZS5nLiBEZWxsDQo+
ICAgICAgICAgICAgICAgICAgKiBMYXRpdHVkZSA5NDIwKS4gT24gdGhlc2UgcGxhdGZvcm1zIG9u
bHkgdGhlIGZpcnN0IEkyQw0KPiAgICAgICAgICAgICAgICAgICogY29udHJvbGxlciBpcyB1c2Vk
LCBzbyBpZiBhIEhJRCBtYXRjaCBoYXMgbm8gVUlEIHdlIHVzZQ0KPiAgICAgICAgICAgICAgICAg
ICogIjAiIGFzIHRoZSBVSUQgYW5kIGFzc2lnbiBBQ1BJIGNvbXBhbmlvbiB0byB0aGUgZmlyc3QN
Cj4gICAgICAgICAgICAgICAgICAqIEkyQyBjb250cm9sbGVyLg0KPiAgICAgICAgICAgICAgICAg
ICovDQo+ICAgICAgICAgICAgICAgICB1aWQgPSAiMCI7DQo+ICAgICAgICAgZWxzZQ0KPiAgICAg
ICAgICAgICAgICAgdWlkID0gc3RyY2hyKHVpZCwgd2QtPnVpZFswXSk7DQo+IA0KPiAgICAgICAg
IGlmICghdWlkIHx8IHN0cmNtcCh1aWQsIHdkLT51aWQpKQ0KPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7DQo+IA0KPiBtYXRjaDoNCj4gICAgICAgICB3ZC0+YWRldiA9IGFkZXY7DQo+IA0KPiAg
ICAgICAgIHJldHVybiAxOw0KPiB9DQo+IA0KPiBOb3RpY2UgdGhhdCBpdCBjaGVjayBfVUlEIChm
b3Igc29tZSBjaGlsZCBkZXZpY2VzLCBvbmx5IHRob3NlIG9mIHdoaWNoIHRoZXJlIG1heQ0KPiBi
ZSBtb3JlIHRoZW4gMSBoYXZlIGEgVUlEIHNldCBpbiB0aGUgRFNEVCkgYW5kIHRoYXQgaW4gY2Fz
ZSBvZiByZXF1ZXN0ZWQgYnV0DQo+IG1pc3NpbmcgVUlEIGl0IGFzc3VtZXMgVUlEID0gIjAiDQo+
IGZvciBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgRFNEVHMgd2hpY2ggbGFjayB0aGUgVUlELg0K
PiANCj4gQW5kIHJlbGV2YW50IERTRFQgYml0cyBmcm9tIGVhcmx5IGh3IChUaWdlckxha2UgRGVs
bCBMYXRpdHVkZSA5NDIwKSBOb3RlIG5vIFVJRA0KPiBmb3IgdGhlIEkyQyBub2RlIGV2ZW4gdGhv
dWdoIHRoZSBMSkNBIFVTQiBJTyBleHBhbmRlciBoYXMgMiBJMkMgY29udHJvbGxlcnMgOg0KPiAN
Cj4gICAgIFNjb3BlIChfU0IuUEMwMC5YSENJLlJIVUIuSFMwNikNCj4gICAgIHsNCj4gICAgICAg
ICAgICAgRGV2aWNlIChWR1BPKQ0KPiAgICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICBO
YW1lIChfSElELCAiSU5UQzEwNzQiKSAgLy8gX0hJRDogSGFyZHdhcmUgSUQNCj4gICAgICAgICAg
ICAgICAgIE5hbWUgKF9ERE4sICJJbnRlbCBVc2JHcGlvIERldmljZSIpICAvLyBfREROOiBET1Mg
RGV2aWNlIE5hbWUNCj4gICAgICAgICAgICAgfQ0KPiANCj4gICAgICAgICAgICAgRGV2aWNlIChW
STJDKQ0KPiAgICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICBOYW1lIChfSElELCAiSU5U
QzEwNzUiKSAgLy8gX0hJRDogSGFyZHdhcmUgSUQNCj4gICAgICAgICAgICAgICAgIE5hbWUgKF9E
RE4sICJJbnRlbCBVc2JJMkMgRGV2aWNlIikgIC8vIF9ERE46IERPUyBEZXZpY2UgTmFtZQ0KPiAg
ICAgICAgICAgICB9DQo+ICAgICB9DQo+IA0KPiBBbmQgZm9yIG5ld2VyIGh3IChMZW5vdm8gVGhp
bmtwYWQgWDEgeW9nYSBnZW43LCBhbGRlciBsYWtlKToNCj4gDQo+ICAgICAgICAgU2NvcGUgKF9T
Qi5QQzAwLlhIQ0kuUkhVQi5IUzA4KQ0KPiAgICAgICAgIHsNCj4gICAgICAgICAgICAgRGV2aWNl
IChWR1BPKQ0KPiAgICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICBOYW1lIChfSElELCAi
SU5UQzEwOTYiKSAgLy8gX0hJRDogSGFyZHdhcmUgSUQNCj4gICAgICAgICAgICAgICAgIE5hbWUg
KF9ERE4sICJJbnRlbCBVc2JHcGlvIERldmljZSIpICAvLyBfREROOiBET1MgRGV2aWNlIE5hbWUN
Cj4gICAgICAgICAgICAgfQ0KPiANCj4gICAgICAgICAgICAgRGV2aWNlIChWSUMwKQ0KPiAgICAg
ICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICBOYW1lIChfSElELCAiSU5UQzEwOTciKSAgLy8g
X0hJRDogSGFyZHdhcmUgSUQNCj4gICAgICAgICAgICAgICAgIE5hbWUgKF9ERE4sICJJbnRlbCBV
c2JJMkMgRGV2aWNlIikgIC8vIF9ERE46IERPUyBEZXZpY2UgTmFtZQ0KPiAgICAgICAgICAgICAg
ICAgTmFtZSAoX1VJRCwgWmVybykgIC8vIF9VSUQ6IFVuaXF1ZSBJRA0KPiAgICAgICAgICAgICB9
DQo+IA0KPiAgICAgICAgICAgICBEZXZpY2UgKFZJQzEpDQo+ICAgICAgICAgICAgIHsNCj4gICAg
ICAgICAgICAgICAgIE5hbWUgKF9ISUQsICJJTlRDMTA5NyIpICAvLyBfSElEOiBIYXJkd2FyZSBJ
RA0KPiAgICAgICAgICAgICAgICAgTmFtZSAoX0RETiwgIkludGVsIFVzYkkyQyBEZXZpY2UiKSAg
Ly8gX0RETjogRE9TIERldmljZSBOYW1lDQo+ICAgICAgICAgICAgICAgICBOYW1lIChfVUlELCBP
bmUpICAvLyBfVUlEOiBVbmlxdWUgSUQNCj4gICAgICAgICAgICAgfQ0KPiANCj4gICAgICAgICAg
ICAgRGV2aWNlIChWU1BJKQ0KPiAgICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICBOYW1l
IChfSElELCAiSU5UQzEwOTgiKSAgLy8gX0hJRDogSGFyZHdhcmUgSUQNCj4gICAgICAgICAgICAg
ICAgIE5hbWUgKF9ERE4sICJJbnRlbCBVc2JTUEkgRGV2aWNlIikgIC8vIF9ERE46IERPUyBEZXZp
Y2UgTmFtZQ0KPiAgICAgICAgICAgICB9DQo+ICAgICAgICAgfQ0KPiANCj4gTm90ZSBVSURzIGFy
ZSB1c2VkIGZvciB0aGUgSTJDIGNvbnRyb2xsZXJzIGJ1dCBub3QgZm9yIHRoZSBzaW5nbGV0b24g
U1BJIGFuZCBHUElPDQo+IGNvbnRyb2xsZXJzLg0KPiANCj4gVEw7RFI6IHRoZXJlIGlzIG5vdGhp
bmcgdG8gd29ycnkgYWJvdXQgaGVyZSwgYnV0IHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgYmUN
Cj4gdXBkYXRlZCB0byByZWZsZWN0IHJlYWxpdHkuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFu
cw0KDQo=
