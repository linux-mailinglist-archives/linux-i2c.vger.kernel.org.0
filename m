Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2589E79FF3A
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 10:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236116AbjINI6Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 04:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235913AbjINI6X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 04:58:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26142F0;
        Thu, 14 Sep 2023 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694681899; x=1726217899;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CAk1xjCJgGviIruGTkkMXq+jFfyzhek//hRDS/ZeyBY=;
  b=iQE2oOY7J0HSLIYm7MFCurOjbCiys4AoJxXWjk6EPFGWJ0s5PhEtdrPQ
   DX0sEdt/8cRDirAQbUDQr33BjUq+OJIyIpK9L/MauLWqQI8f4nIt82xJ+
   C++a4cHfeLAYQF//6HiUw2rPkrNd/l84TbYZyKLpZyzi5KilKgZDJzqOM
   w15hgB7k5DJd9P0/ITzedLvDqauzprE8e3BqZeruY1ZAlcDHUEcqEmpBK
   rRuWiIrb108LOGnNfZZO0bJf4wAZZcDOkB51qesQ5p4QEmCU4uEIiW/Dt
   d/DU97CLPq3TCKgcU9FVv9pj3dbB+b3OSELOYEJNZUZWv9R41Ru8Zsw/I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363934257"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="363934257"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 01:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814601637"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="814601637"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Sep 2023 01:58:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 01:58:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 01:58:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 01:58:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 01:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbIZoXLbs8hympABVetP+ZYr8YapFv1QvEfhnWC1JnhdhvryJo5JzwhY1KSmMQq7ZfquYbVXcW06T2/RFgQJ0qSZQL+aKgAnmc4wfcOQJ66wCFXI6RdhLzLqzcfBhNHOMLec0IltS51s5G007sChxQwcb48A06g4p0BCxwHPiBfGXpYJrsZuJm1qseTECkjn5ixgGMpYEE+wrHvWTUvyXYRAF4n+YQX421F4tjQ0DVObPlNH7v/2jZg7mXwO8rpfTSvI9LGzSdsAr0zdLZR9erwpYXTNgg2wTP0uNhuxqLVsWOSPt+Whuh7o6rX/wO5SrRtmhiwQ00FF0YPFpKt/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAk1xjCJgGviIruGTkkMXq+jFfyzhek//hRDS/ZeyBY=;
 b=Uu3PplxxPAx7lwfEsFJsDggfX7jVl0vTMTgaOxlXbh7KYftzzyM3IkTOGTYqfe+FfVqNAZqpoXLyYe9+8ORrEFGsy1EC98NOxwOFKuoQVXDoryzWmwVzhUVhwxNoSRcddbafqF/heTVbKvQdEq4FI+sXVF/d2Sd07F0g4n8kIr6SN4P7zV78Z82Z07irH0sPBtFtC5WTunkVtb8YhHHf3qBq09zoyCWgtCYClaSwPoCu/6sXjF9JZb7ybdWP7ordkkhxGhprAv4IXPwVWRJfAI3g86fwbge3ELH+rVimGHjQhqdqXZNncuowjao3OnOMebsl0ZGUXaD+B04y9cRCWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Thu, 14 Sep
 2023 08:58:14 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::e836:4003:6244:2466%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 08:58:14 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "arnd@arndb.de" <arnd@arndb.de>,
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
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: RE: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Thread-Topic: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Thread-Index: AQHZ5eNQYYYhXKCANUeYzCUjonX6erAYdpGAgAEKJ7CAAHxRAIAACCyQ
Date:   Thu, 14 Sep 2023 08:58:14 +0000
Message-ID: <DM6PR11MB43166041AFA4A1E092C406658DF7A@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1694569212-10080-1-git-send-email-wentong.wu@intel.com>
 <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
 <a3b75e11-9cf0-4ee3-be90-fba73bd5df3d@suse.com>
 <DM6PR11MB43162A9B2AC68B2686BBE2598DF7A@DM6PR11MB4316.namprd11.prod.outlook.com>
 <05b9b252-653c-7cf7-9b96-59d9f662b81e@redhat.com>
In-Reply-To: <05b9b252-653c-7cf7-9b96-59d9f662b81e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH7PR11MB7451:EE_
x-ms-office365-filtering-correlation-id: 75f2b82e-73b6-4ffa-059b-08dbb500bb01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/1bwK9RbZ/UDxaVoOkSKpzONlVgMdC1QPlEMd2XBaGkqE6rpLJTCFkaW/ukUTJzPkjcxsVOQj8zv2N9uDgy1wU81rUlYCSW1/d5kn+WLPiZ7z1aKePpQBVR5kHCsGuqDRGanJr1ewd7h+uzDLzDD6WVrPRnenHxpZxdtutOn6lXSF0J+HrVA4jqOYVpDY9HhJb9xbj2HU+/v//hi4ho4vM7wBVepyHhjw5KZp9eCNTBdNAWKJHP0HvdPigE/rglQczSpTpM8pIrzfXOe8R1k9X+73EonbUbHf4Wx2HNtLyEuiiz/cmTw182U7/jV/bHzwRAGAQ+x4grmbFuBSlTcnUtZNFi8nFTEextNGthlQt9XOZ3xCgqBxLVDy0BUHDnGyoQ1l8snSfBy+SXwe9UpIjwVBhV4Xbh5r86GhhXbabXd/Cu13peGghC7nRwDP+6gszeCHd2owaWya0n8ul1YRb11k9d3nKWLmofbuiZI8++e0SA7NqxnSyX8bjJfFOisWbD8gP5zWM7AdQuHKRolLxljgNf+Mof6yLUa3YfZyjQAtWOQmrqxhxjIGm8Sup1ehQSIr/VVvbC8Nww26y3V3+McpvFsG5bWuRso/5Rk1nXwehkdH3nsAZzu8UrfuM0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(1800799009)(451199024)(186009)(122000001)(7696005)(71200400001)(6506007)(53546011)(52536014)(41300700001)(110136005)(5660300002)(83380400001)(82960400001)(38100700002)(33656002)(55016003)(38070700005)(2906002)(7416002)(66476007)(478600001)(86362001)(66556008)(9686003)(4326008)(8936002)(66446008)(8676002)(64756008)(66946007)(316002)(76116006)(54906003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTN2UGYyY0hnMDhITUk5SkE5TDdHdm9GN0JNWXhiSkx1bDdyZ1I3WHZ3bWcw?=
 =?utf-8?B?YjJWWUFYLzdoSEZEKzlka1ZhOWlOWWJoMG96bEF5QU52RnBpa1htM0l1R1F2?=
 =?utf-8?B?OHZ6a3hQNDM2YkhSaCs4RUo1UG0zSTZyd2tXVTVQdndMK1lyUkdXWlpmaGxl?=
 =?utf-8?B?N05XS0kzQUxrTktkWTJNZkJGaXoxREpIUTFERVlzdEZnZzYyNitiU1RYeXFE?=
 =?utf-8?B?eTVUZTF1djhwNzZFZXVsRk1EWjhCNU15R1BWV0hFZ0ZDMEtqWUFtamlSR0dR?=
 =?utf-8?B?UDgyL0RHY1FFNlpqMjdqcWxQcVBZb29sVWROOEZMV1RwOFpmL2NDeTB3d1pS?=
 =?utf-8?B?YTlZa0MyRHpNbWNZbng0T3VINmo0MUdxUlFFTXdSVzIyRHA0YTN5RGQwZzEw?=
 =?utf-8?B?eUdhbnpKVG1NSVI2UDRZNUQwZkRrT1VZRW9SWElHRVJmT1FtMU9GUmYzSlJK?=
 =?utf-8?B?WHYrVCs5dzBxSW5FeERrSDBKelI1ZjhHdEJud0pNbUhsMG9OL0VpSDY4TE9M?=
 =?utf-8?B?Tkd2NWdsZzhORUNSY1BqMm9zMUdZbm9SV1JsY01oQkpBcTdLWU9XeW1Dcjda?=
 =?utf-8?B?RHMzUkZlVyt5Zkw5bHFjT09wYTVieS9oOVc1SU5FbkRhTnIya1lYNDF0SEdU?=
 =?utf-8?B?RVQrSkxTVlAwK3JGTXZ5cGNRbXQxYmZIRGdXSFY1WEh5Mm9lYW1qeHl5MTZi?=
 =?utf-8?B?eXlCbTdtMFBTSUU0U00rVmdJeXFYRmdtbjZ0OWNIOG03OGsrTkE1WmJIVkZW?=
 =?utf-8?B?ZHBlSExMbEVESmdDY2hDNmdZMVpBamFIUWVhekwwWDFoNXQrMDViUndocjY4?=
 =?utf-8?B?M0RpTkxBMzF3MzRWQ3gzNFJieENQVHBlbjdYbXlEUTJLOGVBeGo2TzROd2VD?=
 =?utf-8?B?TndBd3NwZGtsUGx3R2dKZmlZZXVwcWo0YUxwNkZiQ1pFZi9teGlxanBmZklu?=
 =?utf-8?B?elU0MUdseFBhRWdBWlNIMmp3K3oyTVJMNkdTd05mYVNUSk90c3JDa0NIS3hq?=
 =?utf-8?B?T1hqZm5qangxQkY2YjZNdjZEOGlMSko2QWhUUDhLWitJNlpBZllFcXQ3ODlG?=
 =?utf-8?B?aWRxcjk3MDBZY1VNcmk5Vnc3anFwY0hkUWYrR3MyTWc0SHJsaVljRnFiYktU?=
 =?utf-8?B?UGJacWdGMmlFTXBwTDhCZ3ZHWU4vYmRxTzkrbUNNU290Q0FsRVVEZG1YaVhB?=
 =?utf-8?B?NXhnR0N3cE9RdXhPZlcvWVB1cHBtWUg2cWhqbnBJR3VWb0hsZng0cWpDQjNT?=
 =?utf-8?B?anRnV0NtZXZyTVNwbEJtUFBlSGZFMmpraUtScHNHSjBtVkVSVzVqYVFSd1ZE?=
 =?utf-8?B?NC91KzN3NkRtN3BZVzNmTVE1NmlxS1FIaTJOcXBEUzEzS1d1dHQvdWxjSkNX?=
 =?utf-8?B?MlJIcWtObnBBNzM4bkRyMjVIbkxNQVVjc3ExYmx6djJmRnE2L2Z2UDVrd0dD?=
 =?utf-8?B?VUlJZGJabmYwL3pVNVJ3cEU2VHpuYkhCVmwyNWdqdlpTSmdjV3ZMa2oyRGJt?=
 =?utf-8?B?bG5LSjhzamhXNmxIZkVPc1lER2tPdmI2TDhzNWY0Y3NHR0lsWUZTWlYvU0tQ?=
 =?utf-8?B?cW1icHhCSE1nQzdhb0ZhY2wybk9XVFBxelVBdGQ4Tm9EUzdWeHM0d3d6WmhZ?=
 =?utf-8?B?YmQ4VEUzQ3Y2Q1dGTS9iSVZaRFFvaHpEakw5U1dETXRZK1hOVDdGc29qeFZj?=
 =?utf-8?B?MUhBQk1ubnhNWUdVY0w3amk3YVNld0E2Q1NDM0tHekwzdXNFeTlreEVKOEFO?=
 =?utf-8?B?MlhaU3JSQnNYWUJ1Zm1jMHIwOUVUNjBZaU5jRmNtdm1nNEpaOVVpYzFDVnJW?=
 =?utf-8?B?SFFXVFZPYUQyWDlYNytManhpUDVDYW9ZWHY0cHZaYjVEeXlBaTJQMlFDcU1h?=
 =?utf-8?B?dzZTSHN3bXpZSkg3UUdXdEFuSjBPOGo3N3Fqd2U2K2pPMEdtVUU3VjNmd0NJ?=
 =?utf-8?B?M3RkS01QQ0tUcmpjMG0xRDEvTEVmaDkvYnRCUWE2OTFSMVdWcHVRRzlpdFRl?=
 =?utf-8?B?Nm5GbDQzZUJHYUpzdnZIemIyZDdKNE01c1RuSkQvYlB0eWVvYkhXSGdSekt1?=
 =?utf-8?B?OVFOdjJwUW04c0x2ZndhbXNZcytuZnlPS0N6aE1QUzJ3Y2VFZzVOd29RNDBk?=
 =?utf-8?Q?U+Hv+ArpjyVirgmLL+QotQgYH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f2b82e-73b6-4ffa-059b-08dbb500bb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 08:58:14.4854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EN/vhHvZbUC94EFTDv2iVqz5vZXE/ThsocwjpiUFu9aTxOvBNUTrYa+rVq2tGanaOKi5mZl119IHsa3m6JqcCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiANCj4gSGksDQo+
IA0KPiBPbiA5LzE0LzIzIDAzOjA1LCBXdSwgV2VudG9uZyB3cm90ZToNCj4gPj4gRnJvbTogT2xp
dmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4NCj4gPj4NCj4gPj4gT24gMTMuMDkuMjMgMDM6
NDAsIFdlbnRvbmcgV3Ugd3JvdGU6DQo+ID4+DQo+ID4+PiArc3RydWN0IGxqY2FfYmFua19kZXNj
cmlwdG9yIHsNCj4gPj4+ICsJdTggYmFua19pZDsNCj4gPj4+ICsJdTggcGluX251bTsNCj4gPj4+
ICsNCj4gPj4+ICsJLyogMSBiaXQgZm9yIGVhY2ggZ3BpbywgMSBtZWFucyB2YWxpZCAqLw0KPiA+
Pj4gKwl1MzIgdmFsaWRfcGluczsNCj4gPj4NCj4gPj4gTm8gZW5kaWFubmVzcz8NCj4gPg0KPiA+
IE9uIGJvdGggc2lkZXMsIHRoZSBlbmRpYW5uZXNzIGlzIHNhbWUuDQo+IA0KPiBSaWdodCwgYnV0
IG5vcm1hbGx5IFVTQiBkcml2ZXJzIGFyZSBhbHNvIHdyaXR0ZW4gc28gdGhhdCB0aGV5IGNhbiB3
b3JrIG9uIGJpZy0NCj4gZW5kaWFuIENQVXMuDQo+IA0KPiBJIHJlYWxpemUgdGhhdCB0aGlzIGRy
aXZlciB3aWxsIGxpa2VseSBuZXZlciBiZSB1c2VkIHdpdGggYSBiaWctZW5kaWFuIENQVSBidXQg
c3RpbGwgaXQNCj4gaXMgZ29vZCBwcmFjdGljZSB0byBtYWtlIHRoZSBkcml2ZXIgd29yayBvbiBi
aWctZW5kaWFuIENQVXMgdG9vLiBFdmVuIGlmIGl0IGlzIGp1c3QNCj4gdG8gc2V0IGEgZ29vZCBl
eGFtcGxlIHdoZW4gb3RoZXIgZHJpdmVycyBjb3B5IHRoZSBjb2RlLg0KDQpUaGFua3MsIEkgYWdy
ZWUgdGhlIHBvaW50IGhlcmUuDQoNCkFuZCBJIHdpbGwgdXBkYXRlIHRoZSBkcml2ZXIgYWZ0ZXIg
dGhlIHRlc3QsIHRoYW5rcyBhZ2Fpbi4NCg0KQlIsDQpXZW50b25nDQo+DQo+IA0KPiBTbyB0aGlz
IHNob3VsZCBiZToNCj4gDQo+IHN0cnVjdCBsamNhX2JhbmtfZGVzY3JpcHRvciB7DQo+IAl1OCBi
YW5rX2lkOw0KPiAJdTggcGluX251bTsNCj4gDQo+IAkvKiAxIGJpdCBmb3IgZWFjaCBncGlvLCAx
IG1lYW5zIHZhbGlkICovDQo+IAlfX2xlMzIgdmFsaWRfcGluczsNCj4gfSBfX3BhY2tlZDsNCj4g
DQo+IEFuZCB0aGVuIHdoZW4gcmVhZGluZyB2YWxpZF9waW5zIHlvdSBzaG91bGQgdXNlOg0KPiAN
Cj4gCXUzMiB2YWxpZF9waW5zID0gZ2V0X3VuYWxpZ25lZF9sZTMyKCZsamNhX2JhbmtfZGVzY3Jp
cHRvci52YWxpZF9waW5zKTsNCj4gDQo+IE9uIHg4Nl82NCB0aGUgY29tcGlsZXIgc2hvdWxkIG9w
dGltaXplIGFsbCBvZiB0aGlzIGF3YXkgdG8ganVzdCBhIHJlZ3VsYXIgcmVhZC4NCj4gDQo+IFJl
Z2FyZHMsDQo+IA0KPiBIYW5zDQo=
