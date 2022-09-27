Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0163D5EB855
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 05:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbiI0DLA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 23:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbiI0DKT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 23:10:19 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3850D13F284;
        Mon, 26 Sep 2022 20:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664247834; x=1695783834;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=18m+/ItgCBM3FbEmDXKGGHsjPJCs3pS9v57tuRia8TA=;
  b=e3LmAOgfEb3FZbBghXGlUDrrKvpk81b2vdenTIsW/Y3x0luBYYypNbbt
   D74wiEkdx9vxbhor0Gubpl0wLSvkPJJBfLlI3XsDvTxO/ephLw0Pplr9w
   V4rEMUXui3Ei9LlTx1VvXb7nGyl9BYR+qxexrgpf9EExIMmZ6NMsrfcg1
   R6r0eZkgF/jkFGNjGfoQ5lfgFrThkISHwHS3D53Un5l6gurlP9qHt5NxE
   l55OhZqRA2RD1bzSKO9CuIcSEJx6SNSogcSO1QsovlB/7XVROChHUmVER
   OUYofv49C7W1f/GR+0dK1GkkxBVNyw8UPOYUaov+w7ssEgSlQ5mQHN6OK
   w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="115539027"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2022 20:03:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 26 Sep 2022 20:03:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 26 Sep 2022 20:03:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhgUIJYgyXa/U5WfvQfoXq/0KO8dIcPcG5XnUbsav+LN4xhY+IhMJJfuXVR6PKTaUa9Hb3HmhBJU/TlUfmlbxlrgXuGV9JtKEjMMvvuhG7RXnFfcgvxMlPqs/OKUegyE15XKGU/a+0yLb63w3/DgwSuQbnIrKDl8/0VQMkoAtSsy80GGWCTQZHE9vct4l8HZAuhs8NBn8pjZJpm5OoBTJLZd6gILSZiXKt+tyIevSU4ypvc7dZzmBD+sesMQTuxQzgq0LMDGnKYJDgiFx6z0kTKKVatwOvQ0kQ1LPU+gUmA9wG+E7qDDSxi+gaIUC4XcSnVzeTD8jaVTzfv2c0ja/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18m+/ItgCBM3FbEmDXKGGHsjPJCs3pS9v57tuRia8TA=;
 b=nJ8ffm3IMM561G9ImO7AF6Pke3C+V3a0JyELAfMe2ngWIc3iW+HW8sLtaxCWx0R2eCHAF0peVcl4krT6fw19cyZ1WJeHZCqfSjUcp8K3vRdJ3eBfyZOe4M12FkMjzY0J8JsXbfkoH4TuoECY8oQbPuKrwG1GADFFkHEsFFWfSasar1LZasfCp4eJ/F5L9dPORfvJzfV86dHC2jHISk2VNjo/1KRikpotdbeEWJFP7Gv3sI6pPUBP2Ze5ogsk4B60F7N53Ij9eO1iTqtoTe8ncHE5GdnDvLQGE7K9QUDBYf5Nn5OiZprTmc1KtbEyRmZm7p1jb6tV/5Ep3pSCplR9Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18m+/ItgCBM3FbEmDXKGGHsjPJCs3pS9v57tuRia8TA=;
 b=BykhMx+o2CHEuCaGlWUQ87E93Puf0wY7keVU8GMjgG9GVcN657W5BA2poZ6zrTnnQVU7TvojyITG27CpIOgVq+DOovbSYwJ7MsHVXXsP0wmuGi86zs1sjoAAxvNUFgL9ItNIsvXuwZWX61HPT7/PMAAiqS548yHcTnCSVXwSmts=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 03:03:01 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::3c5c:7050:7ea3:6ac]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::3c5c:7050:7ea3:6ac%6]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 03:03:01 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <andriy.shevchenko@linux.intel.com>
CC:     <UNGLinuxDriver@microchip.com>, <wsa@kernel.org>,
        <krzk@kernel.org>, <sven@svenpeter.dev>, <robh@kernel.org>,
        <semen.protsenko@linaro.org>, <linux-kernel@vger.kernel.org>,
        <jarkko.nikula@linux.intel.com>, <olof@lixom.net>,
        <linux-i2c@vger.kernel.org>, <jsd@semihalf.com>, <arnd@arndb.de>,
        <rafal@milecki.pl>
Subject: Re: [PATCH v5 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Topic: [PATCH v5 i2c-master] i2c: microchip: pci1xxxx: Add driver for
 I2C host controller in multifunction endpoint of pci1xxxx switch
Thread-Index: AQHY0YST49cGr1oKFUGKzquZtB/JN63xfI2AgAEcKIA=
Date:   Tue, 27 Sep 2022 03:03:01 +0000
Message-ID: <8369deb67f979b25dad8a9cd51da8c846b2d76e9.camel@microchip.com>
References: <20220926084654.2580827-1-tharunkumar.pasumarthi@microchip.com>
         <YzF55ckrtsNaxZUq@smile.fi.intel.com>
In-Reply-To: <YzF55ckrtsNaxZUq@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5096:EE_|PH7PR11MB6055:EE_
x-ms-office365-filtering-correlation-id: 6ce97319-963e-4b39-67b6-08daa034c9d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GjnhoLb9X6LWxGVxKIWcOPqYEyoo//W8huZcabPc7AX8yvLVKBxbkutolT5TOYkZggXMya3BzpkYoPUnnQpHmw2Y9yBuaevwzJl5pRObd27oEXtL3/V97gm78dvcYQu+YXUSC2llR1ezLzewGTX8hjgKXFlAstet2bXDJLXleGZmAk3skpN1hfBqL+jAfW6/tXpOCSF0mFWXDaY8w/TzMkF+C9Ns7q7YVVW1P3H/qcqhXb+tC8jkN+S9zmqJfttmsy+6b177D6sJ53PbR/6Ffvb/L4WZRkd7UFU2P0Z/m2l0XHGzKt6gt0oIN+YFnWpgZuie8YH4SB5QNi71JkDYRmrZQPK/XoDm/jmFacSh8xejhHpeXtJ8m4MFtnvSsZaBPMMnzkZ3DO3BDbEafnbCxnxFAGdi1PoJXnCKEWa5hO4moXtfE4lLNbgAbVEQgUYZLC4F1xJtE8DXI+2JNU44ELY/W9ung99gToyQwydep+XaVFX8VZAQr1/2K2Kn48apUqtvXyX9HVXGDPUezXsQ69lWeeZYiroLyqdq6roynh8+H8XrAzybcEcK7ZdXPnXMo9kySNco2riVoOhUj4B1I2Ok4aNXwACXWOQ3L2az7nQltpPj7ZuW/Lt4s8WlRSexENl13J7YtBhAe4kailJNcqerAEQSTV3YGOZFAc4wpG8TdSxQC0ixqelGl0YvMBsME5FGjccWTdgHih2/gTc/2FaAqcEtJJJJeEeKJZkb9icZZxGreQsdaNceya6QbLT3e/CmmPatKjJ/ix9fUm6XxgzNwsMEBN4PnLt9lNNKHMI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(83380400001)(86362001)(38100700002)(76116006)(66476007)(38070700005)(36756003)(66556008)(4744005)(2906002)(64756008)(66446008)(6512007)(8936002)(122000001)(66946007)(7416002)(5660300002)(4326008)(8676002)(91956017)(6506007)(316002)(54906003)(26005)(2616005)(186003)(6916009)(71200400001)(6486002)(478600001)(41300700001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z05FSUNxS01SazYwZGdKTmdPaG8rL0ovVHdtaUZqaVhPK2R1b0NhRUV1R1pY?=
 =?utf-8?B?Wk8rRDd0dnl3MGlSME1tVlRDU3J2NGNSSUljaGtVb0NZdFdybUNUMjNRK0dV?=
 =?utf-8?B?WlRvSjdnSnZ6MHJDb0hpM1pHMVFPclhIN3pHcmFLNDBtdlVONXB6MWRLMWxF?=
 =?utf-8?B?TFpmZVVoQUF3b1Y1YS83blJSQzgrOFoxeTRLeGw0UlRqRWo2d2k0eFZDNGdi?=
 =?utf-8?B?WnpYdEtZUytHVEJ1TFZTenlZWDZRYmc1N3R2WGlYaU1sMDI5RE40dzZLV29E?=
 =?utf-8?B?ei9rL3h2TXVUQWU4SnNhWVhCU3VBK29IUURxdUhuMU1adk9rU1puTlBsamRT?=
 =?utf-8?B?NEROei9BNVphc01VNHgvT29DUnZWY29jNzY5V1B3dk9VWWRhblAvanl5Zmgr?=
 =?utf-8?B?SkQzMnpaZ0NXdm11YVpsWEt0OEVBdGVXMTVteDZoSlRXVWwrUFh6aUlIaUlI?=
 =?utf-8?B?RTlPSFVzWFBzdW1oMmZYY0JpUEE5QUg1d2hvblFXRXRMQVNpcm1uOWtpaisz?=
 =?utf-8?B?eFJpWHFNbWF4RnlDcFFJbVJxSnhoZHkzbWV5TWZGWjJjYlBuazZZNGdtay9l?=
 =?utf-8?B?bmhWd2VQZUF4dFpxZGN0ZkltVjB3dDdoZGxYZnV4VHlSVVZXa0E4TnRGbGoy?=
 =?utf-8?B?S0ZmdTlld2lpdDlKb25ONnBiVXgyZWJOa0R2T25wUlR5d2J5Zlk5VVh5Z0VG?=
 =?utf-8?B?eVAxV1k0N2Jhc3habzlnbFdjQkI2UHUrRTFEZ0NzM0NGWGZGSjZ1a3g5NE9o?=
 =?utf-8?B?TGJsK1RJZjJMb1I0NDRkUGdGYTZPd3c5ZkxaNGJ0TkFaUXJKcitzdHFyOGdK?=
 =?utf-8?B?SzJudzRvQ1JzWGgyZTZOOG5hVk9yNXlxTUY2SnZtSm1hZEFmTXJaLzBFeEhF?=
 =?utf-8?B?cDFPMVBOTjhtM281a3FJQk5NdFlydWJvQ25pR29ZUnZ2dTQrenA0L3pyU243?=
 =?utf-8?B?aFo1eWJkR21aeXRiTVZzbCtGZXZrNDkyYTVyOHV1MXloMzVQY0pUV2NnQWJt?=
 =?utf-8?B?U3ppMmswcUNRR1FwNWUxU3JKZmQzWitFWkEzbTdKNm9Yb2hMdG5OWkRPVGhP?=
 =?utf-8?B?SmpZbCswMFplUFFUSklhd1g4NkRFa2txRDhzdXdXOVhvS3Fxa1NtODR6Rmw5?=
 =?utf-8?B?dHVSVlZYdnppL01nV3o2QnVIVk5kSXpsKy81OUFPeFJDaTFXdldBM291eUw5?=
 =?utf-8?B?SzdqOE5vSk04VHRLRm15VnVKMGVqRlZabDVOK3pwYXk1ZFdHZ0JaZXpmdTBx?=
 =?utf-8?B?eFdMbXhtMHN5TUp0bEhMakRRdU5RV2hrWXVseUJTVG15c0ZrdVNONDhaNFV5?=
 =?utf-8?B?b2RLMmg0ZE5YZU15TURzOURuc091Q0N0OEdQOFJaRFBMbUpBbmpnTElBVXVr?=
 =?utf-8?B?SnNieUJwUW4zK1JXZVRET0h3SFVnN3RyVzUxUGJCMkJ4bVlpZnZpZkwxaDJP?=
 =?utf-8?B?c3RIa3BGSDV2cWk3VWh4MkZneDg4T2xLNzB1SWN1VUloa3Rqc3RnL2NwSXZp?=
 =?utf-8?B?cHFVM0p3YW56dWdJRnpQdEJteEFvUTUzYVNYK3hLNTdCOC80WnpJNllnb1Jm?=
 =?utf-8?B?QjRjU3lnbENPbUw2citrV2xVUWJhZ3ZmQVVoZm4yUGlyaDRKdzFRQVV0N3ZF?=
 =?utf-8?B?b1A3V0pXbThQYXhsV0xMV0twQ0srdmNWck5lQloxRnFOV3gxTTZPVmFycUcx?=
 =?utf-8?B?aWJUb1c5Q3BLQVRXTmt4SWlMV3pMcWRUVktuUHEzTndXNTRGeTRHNGJQT3k0?=
 =?utf-8?B?bVJkMjVQbjFWK0ZKbi9BL1NORGJGNHZYK1YvbjFQd3Nxa0FrNmkxYyt0cmpK?=
 =?utf-8?B?NTFiM2ZCWWVQVXlDVlNDS1ZidW14YVFxNWJtME80aEUySW9SQkV1QUZYOFQ1?=
 =?utf-8?B?WEs4aW1iNFVnUXgybzhPSVlzZDA4bXFXNnZlVEthT09oNmQrYTJPdTQ2elc4?=
 =?utf-8?B?Q004QjJNNEJzZEV6TWtETTJ5Q0tYckhNKzFoemk3NWFXVmVuWDE3eWR2Rysv?=
 =?utf-8?B?MWtnTmpjc2pKclFGZk5GNE1aUHB4MVlPQmx2Yi9aTE9vcGxjNUpRbmRUcy8z?=
 =?utf-8?B?Z2tNRHUrN3JhMjdtQTBrZVRORU9yNk9FT2VSRjJna01TWTQyME5PUmQ1ZDF6?=
 =?utf-8?B?djcrTEdFQ21qWXRNVTN0NUkvWlV2K1dQU0VPNXppUXZVUlUrd05OQU16czZz?=
 =?utf-8?Q?SCt1a+T8fII6UDxRcP4Yr9nJJcXlGbK9KUs49j7hO+kw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF631C5957B5DF4E8CA337A083FE2283@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce97319-963e-4b39-67b6-08daa034c9d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 03:03:01.0812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vu6qIkZUGTqSnqdr+/gZ0qwiRelCDUhbGgICe7ElImVXwksdNxZVx3kwdPXC3rlA0X7zZXCs7IkuQuKDFko5LTNbo/JNwooEiw1v1ihiONg/ABCj8mhyQV9znCOiKTBt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIyLTA5LTI2IGF0IDEzOjA3ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IFRoZXJlIGlzIG5vIFNvQiB0YWcgaW4geW91ciBtZXNzYWdlLiBIb21ld29yazogdG8gdW5k
ZXJzdGFuZCB3aGF0IHdlbnQgd3JvbmcNCj4gYW5kIGZpeCBpbiB2Ni4gV2l0aG91dCBTb0IgdGFn
IHRoaXMgbWF5IG5vdCBiZSBjb25zaWRlcmVkIGF0IGFsbC4NCj4gDQo+IEFsc28sIGlmIHNvbWVi
b2R5IGdhdmUgeW91IGEgdGFnIChyZXZpZXdlcnMvbWFpbnRhaW5lcnMpIGluIHRoZSBwcmV2aW91
cw0KPiB2ZXJzaW9ucywgaXQncyB5b3VyIGFzIGEgY29udHJpYnV0b3IgcmVzcG9uc2liaWxpdHkg
dG8gYmVhciB0aG9zZSB0YWdzIHdpdGgNCj4gbmV3IHZlcnNpb25zIGluIGNhc2UgdGhlcmUgd2Vy
ZSBubyBkcmFzdGljIGZ1bmN0aW9uYWwgY2hhbmdlcy4gT3RoZXJ3aXNlDQo+IHRoZXJlIGlzIG5v
IHBvaW50IHRvIHJldmlldyB5b3VyIGNoYW5nZXMuDQoNCk9rYXkgQW5keS4gSSB3aWxsIGFkZHJl
c3MgdGhlc2UgaXNzdWVzIGluIHRoZSB1cGNvbWluZyB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4NCg0K
DQpUaGFua3MsDQpUaGFydW4gS3VtYXIgUA0K
