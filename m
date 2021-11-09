Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95AB44AD21
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 13:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbhKIMLI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 07:11:08 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:11420 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237666AbhKIMLH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 07:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636459701; x=1667995701;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tSb5Z5BePpJCMaTqk/N+fwQzQu3RJyp4ZZMed6+jDDM=;
  b=BPF1ndyFHwD2o06w8f+IqACsc51N1SBoqyCJdkLOvHXyp9kHiE0fBid8
   tA3kVfX/I3s5ElQ+0/Ni8ImFiTWBhMHP6TbCdenFNWlKEGVoJQ9DfG8fe
   6UUMjAiOIkcZ2jhlokqwKf6gA7o0duWW9uyDxG/q+g5ei5xqkydI9nJnm
   RQLyQI37flFhbIE+uPBxffGn2QYiUtA1A4bXIE4VBEpnj9Xpi8xffAY00
   8YE2MDHRZstcbZcp+kSoPrjD2fNI2Tc8pGVM2uWyJDwpBDWujnyARcczs
   rfdVxrP4+kkLXmiPZfGcuGNOQ8phY60r9vNQS8QLkVywpCz4kDf2b95Zf
   A==;
IronPort-SDR: Qptt+9lKhgxiGC3xWlR8FcqGCCpmu/jDDofjmEpucFxeQnyuLvwQY5HWNXE/9dauYNgEIa8EzL
 xVPVNDNLl2sDQbdfEi+KGRtDVS7dAZ5PbfxrH2RC4YQ8oI5ZgVcNE1hDI7w5KbA20kessxmu8a
 bDB8UProX07tR4gNlGdHnUOROG4EZJFgEyZHT/cCKXzgNHkUzDrMaQGieFNd6SCQot+1KV+wEa
 /btEjX4Vp4BYbI2XP0u+KlQVmEnE5/RaUIUbdNSblIO4D/S+UtEQLUrrQWWFpCG+9iOL3luZ7u
 sRBtmtp2tgvxGX5zShmiezAS
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="75845652"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2021 05:08:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 05:08:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 9 Nov 2021 05:08:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/x9G/blNgMYvtJzWUShsarlPqOnpwOvW6E/m9cgKsEwV4vsKCfgIbVGWKsrt8ESYrsOxJvEr/8HbYGKV/apjWCXnb5d4iQC9ZArdugDGi2nYi2YA7dBSB4zgITEmEVLrrxSMdbMwASsB5zQPDMZmGHv0x1BXyYlCAMPHBZ33h57CM46aQ+mqS+0G5t9tCu3j9OQZjd6sEMlfJFuppnLn8Yy5O/BoZFsxgdYJLzlkgiRW5D4xcyEWq/rRAstLXBCoRF/VuUrsGEO4fbKQm7Lq7qE6NrCFt6HNckx6AZIfo4sMxPVZh6P+Zq6YbXFdrV+FZWKUK9Tvc66Bhim73j2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSb5Z5BePpJCMaTqk/N+fwQzQu3RJyp4ZZMed6+jDDM=;
 b=DQcQCCHgHyBQBD7ePXk7XohJu77jwxMggEifcH+jOI23tuO1qgaZmdcrbNyN6I9IZavD4EUaR6qaBdd1a6CPnDNStQvckAqLxCO06c+gWaAYxI7IILpFATgrVEGaFIdaePCCFEs73HZmrxU3opBJcZN5epONLcMj/wEZWueUzQ0NsVmt2Kb6msIoRmfXSKKgBwniOEzAkbzjw1R/nqt8TJaFJfhxuOiwzqkTz/GGimuxbP7NQPkz/e/NKcYhWLUrk2/pwcADqP6BgNGtXzUFgTW1NsOQTbSwWSCx0aNeIhf4cWAPT49GxIx4M6+lR1QM2nbSHhKgtJZYexhpRO579Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSb5Z5BePpJCMaTqk/N+fwQzQu3RJyp4ZZMed6+jDDM=;
 b=dczrtRLbLIO+3WzoO9Vp1TAI0t90PomsRX/2m/LTRiKCxQ9O2pFHAltG2521EDqBfjeNkKi1snZpzzO4GmT2meI91L0PuKKjw3gqExeS3RCnSnYYKYmafL0aEKpZs0m8TjrPt7ir1v6zYqZeX/KTYUBB38LDL5FfB4/4E6BokKA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2365.namprd11.prod.outlook.com (2603:10b6:300:74::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 12:08:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 12:08:04 +0000
From:   <Conor.Dooley@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
        <gregkh@linuxfoundation.org>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <atish.patra@wdc.com>,
        <Ivan.Griffin@microchip.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire
 binds
Thread-Topic: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire
 binds
Thread-Index: AQHX1LJNFF/Lq51+t0yA8h7xtSxqzqv6392AgAA70wA=
Date:   Tue, 9 Nov 2021 12:08:04 +0000
Message-ID: <198eaf69-8f85-50a7-192e-5900776d044b@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-5-conor.dooley@microchip.com>
 <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
In-Reply-To: <CAMuHMdX1Xm9CP2hSpkD4ApVJ8gC_ZAE1L5CT0zjF+b5An4kmqw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d091124b-db50-46ea-704d-08d9a37995a7
x-ms-traffictypediagnostic: MWHPR1101MB2365:
x-microsoft-antispam-prvs: <MWHPR1101MB236516BB8FE6B839FE80B32098929@MWHPR1101MB2365.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: erJrWvSkTSY+qwDKJDo44HlfXdkrEmke8bXHnrpigs9LCK/WnOQoxgbJWvvcFqvCY+XZB15UXluz1wVnLvBUDbV5bTMgZZFVd5ghwy36sgja33csM20+WBvUqU6Tu26RHNXCClcW1SPdbIks12cH5sjZsK7Jt/MFCdJYYLoFno9cfKd+Z/JqS8Kiicqd18JcrRl/AZXIJDhKaJvchrsaO16BneuYxnREFCHTQklh2ftYlHcRNhVL/kYsMUk0DMJnuSs6NyqPPyBgCSHXbYpPx6uRo7iSloqz3LwPSqFG3trOK/uSi+eEYG+/pDVgtKXTcNVMUoUih3hM2W0zyvd4pSOsUIitP5H36W6gWShzHlhcr5Oymxa82vVs5oRqfchczrGZC1YTtKdj6eDRXpfQwJ8Ow8gW6a7gkSdkOtbKUtuema2fVK9zYe9Svy2UrxwUUB4x+VYwwCHhpe+kXFkseD6cjjg0jPIVcPVfWtwENDst42oSrrTmUAVXDh/auDJ+Kue6zRsyvJDZIwIF3EySd5dl1yCMQLfufgpWoQh15LGRSBzo2qJxB6MfijrbI1oUPkmI0idIjQVuRwXsQGYeOOWi6NV0DbOFTty/5CVcYZrymOwagFIxQRX9Cg36wbfg9PO28iYm0WR2OqrLGpAlXKKQUF1pgAkp6oeBMKEYv8BIl6ty5fkPEviMlzpBY/qUQKh04DCymyIX8dUE6gvyuHdWYYj2YEw/VtMxTIbpMqaYx9s9ZPiLY4V6ba5BMWy8OXNmFD6xMFVhHusyXHhAxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(83380400001)(26005)(2616005)(53546011)(86362001)(5660300002)(8936002)(2906002)(71200400001)(36756003)(8676002)(6512007)(54906003)(6486002)(6916009)(38070700005)(76116006)(66946007)(91956017)(66556008)(66446008)(64756008)(7416002)(31696002)(66476007)(31686004)(316002)(4326008)(508600001)(186003)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blNFUFJ6N0V4QkZ3azdwZnNLTEZSQXo4OFAzWGpjWlJKMDd6TFlrSzFIdmQv?=
 =?utf-8?B?clpicHFvWEdiMEJGOXQ1TzZNeG9WMGJTNU55NDZIREt5ajEyL0hLUnMyZUQy?=
 =?utf-8?B?SThDVGo4RTVLSEpvLzJlcWQ2OWpDWEE1WlBVanA4SmY3RFBManl3cXdsUVpD?=
 =?utf-8?B?K1BhQzR1NUJqLzNnNUdsM0tEbW1rYVVrbWwvQUhtbFJ6d085OGYxQW1WWlZ4?=
 =?utf-8?B?djRjTGl3aW0rL05KcXNFcDl1THRRQkFoT3d5N05kWGtyd3M5Q1NkbmtCQkxi?=
 =?utf-8?B?UnRmUHdzYWJmNEZSajZnQWN3UVN1N25Va0sxR0JyKzl1dWQ3TTE0bm1ocE5x?=
 =?utf-8?B?UlFOSHlpNDh6TmQzS1pTVVNlWGpXanpEOTNsZXZWaERTZ3lCTkR4Y0Y5c2Vp?=
 =?utf-8?B?N1N0L0JSUGthbS9mSFkrMHJpUVpXTU4zWW4yK2VPcEZnaHNjRlRlTHl4Wm9q?=
 =?utf-8?B?M0lrcmJuMnZxV2c4dktnYy9MOHdpRzlzTUJsYS9jZlNPNzY3d3NrcE91em5Y?=
 =?utf-8?B?TXNhQktzR1RNMW9aZ0ZGMjZKL3hVeXNKOVlRUWtYWGxOWGRLRzNIbGFBRHJM?=
 =?utf-8?B?S2ZMWHlHa29OTTFzNmR6VkZHQUptSFgvNERTS1NPb0owL2lVaiswU0htazhz?=
 =?utf-8?B?T0FlU1hzckIzdjJIU0t4bDFVL29ZaFRkSHU5dW9TRmliK3VOZXFldzB6eW1u?=
 =?utf-8?B?WE13OU1ROXk4LzlBVkgwam4vNGZxTFVQYTUyQXYxeExjQ1Zhd2lqeStObVpB?=
 =?utf-8?B?OGUvaG5wOFZkOFE2am1SVFE0TGRnU0cvaW9pVmhkOTdJVGxzTVBBa0wvNnln?=
 =?utf-8?B?TWhudmJmMmFweDBHVWVPeE5BTlNTMW1idHRFNDJiSDlCaWhkcTRnalpTY1Ay?=
 =?utf-8?B?dm9MRnkyZG9hK28rVi85YksxODlZcTU4Wk1KcHFBME5yNG1NOTJTZXI1NHc0?=
 =?utf-8?B?ZElLcXJpSGpDNkJ6QkdaaFpNUm9ram1jUnp2Ky9zQytQcUdGQUpVWUZDK2lT?=
 =?utf-8?B?eGt4Z1FtQklxUmJOV3diZmFhcC9UNUJUdUFXTjFQMHFBZDUvckozY3FFZ3U1?=
 =?utf-8?B?V2xqVEh2MmEyZFgxcHJrblE0K0orYjZlQ2pZWjlmck10VFA0VzJ2SE0zczds?=
 =?utf-8?B?L2NiNEVramM4UWtDajR6dXlXZ1oySHl3SjhUMFB5dlo5UEJRbzQwc1hreHVh?=
 =?utf-8?B?cXRjZklNTUpiNEtSc21KWG5sQ2JtN0JIWWxLTGk1TUZMODJvandRYnNoYTdE?=
 =?utf-8?B?NWtyb24wUXluVGxFZW1lYzQ4NzRRRisvTzBCbDlmYmc5cldEb2xiRXlMc1Qr?=
 =?utf-8?B?U3llQ2xaRzdjWGhWMVQvcnVvUmJUdHBkNzJtanlKQ0srOVRNVnkybHdobytr?=
 =?utf-8?B?bDN1TFE0aTFIWHlOMG9FQ0QvTCt5b3MyTGFUd2x5d3czbmhGVmljU1lna3dO?=
 =?utf-8?B?VGs2N1BLcE03UnFyQmQwQ09kSW9wNjlNR253MXNwdm8vbk1CM3B0ZUtrZHRh?=
 =?utf-8?B?ajEvVWZkY2wxZ21YRjdtSDFDcExPdVZxbHB6UFFIa0hlMnp6K0tpTXVPMHQ3?=
 =?utf-8?B?bjFlVmpJYmd1WUh6UWpnN0dsYTRYS1g0N2hSTnQya1pSZC9YL1BwcHdVR2ZO?=
 =?utf-8?B?eS9DQzVxUW1xT08wNnMrZnFMbDhBYzVZUjdNaWF0SHYrUXJsK1BvVWl4Wkdj?=
 =?utf-8?B?R2JmOFh1YmFLS1cyRnJOYlRFaHoxTG9TWVpjbDVtbFB4c2NnN2ROZnVzQjls?=
 =?utf-8?B?NHZ5WTlVajlBenRCd21lUmdYeGc5RkVpQUhPV25uUmhCYkFoZUFETTJHODdQ?=
 =?utf-8?B?UnFEWVpiVXE2SVMyTTd6RnZNbUp4TVhKbkc1MmpneGpmUHpXRWloUDUrc1Rm?=
 =?utf-8?B?ekY5RXo5TjVKRk9tb3E3YlpZUmR4RE55MWtrbS9vM2RzMEZ6K3B1T0pMdklr?=
 =?utf-8?B?b0RaR2FSbk45OXdYNHhLQURpLy9qSzNMQzNlK0ZoTTJzem9xWDRPT2ExMTNO?=
 =?utf-8?B?RjFsR0lwMGlHMU14d1BubmQ2bzQxMGZ2NEdTQysrdGo3TkFzMlV4d2t5aE51?=
 =?utf-8?B?c2ovMUFuMGVXaVQxUk9hRWh0blI4bFFnUTVUaHBHSyt1aFJ3WlhQRXQvc05o?=
 =?utf-8?B?ZDVBc2tLdUxGQ2xpWDd5NGduR01xRXUzZE1LbW1yckZySVZMY0lZSFpvU3lC?=
 =?utf-8?B?U2EvYjBvTVQ4UGhGVldtclVHWE9FSG4zUVUvS2F1SUlsL2xKeWViRkdVdzJ0?=
 =?utf-8?B?czIwSDE1aWZNZ0dlaUVQRW5ENm93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A92A584ACDBADC468FDF636D7B2C4ABD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d091124b-db50-46ea-704d-08d9a37995a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:08:04.5629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 17gk87zvZBO3Ou8ddOy/uAcUZeb0u19ad/82Bx5e/WHVJ8Kg+McLJoYAQgdydDd3RShwewuy1nDOG4PBZaIowDv6E1b9gLLXbDnu3obtgjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2365
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMTEvMjAyMSAwODozNCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gTW9u
LCBOb3YgOCwgMjAyMSBhdCA0OjA2IFBNIDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6DQo+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0K
Pj4NCj4+IEFkZCBtcGZzLXNvYyB0byBjbGVhciB1bmRvY3VtZW50ZWQgYmluZGluZyB3YXJuaW5n
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvbWljcm9jaGlwLnlhbWwgfCAxICsNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9taWNyb2NoaXAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9taWNyb2NoaXAueWFtbA0KPj4gaW5kZXggM2Y5ODFlODk3MTI2Li4xZmY3YTUy
MjRiYmMgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvbWljcm9jaGlwLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9taWNyb2NoaXAueWFtbA0KPj4gQEAgLTIxLDYgKzIxLDcgQEAgcHJvcGVy
dGllczoNCj4+ICAgICAgICAgLSBlbnVtOg0KPj4gICAgICAgICAgICAgLSBtaWNyb2NoaXAsbXBm
cy1pY2ljbGUta2l0DQo+PiAgICAgICAgIC0gY29uc3Q6IG1pY3JvY2hpcCxtcGZzDQo+PiArICAg
ICAgLSBjb25zdDogbWljcm9jaGlwLG1wZnMtc29jDQo+IA0KPiBEb2Vzbid0IHRoZSAicyIgaW4g
Im1wZnMiIGFscmVhZHkgc3RhbmQgZm9yICJzb2MiPw0Kbm90IHdyb25nLCBidXQgdXNpbmcgbXBm
LXNvYyB3b3VsZCBiZSBjb25mdXNpbmcgc2luY2UgIm1wZiIgaXMgdGhlIHBhcnQgDQpuYW1lIGZv
ciB0aGUgbm9uIHNvYyBmcGdhLiBpcyBpdCBmaW5lIHRvIGp1c3QgcmV1c2UgIm1wZnMiIGZvciB0
aGUgZHRzaSANCm92ZXJhbGwgY29tcGF0aWJsZSBhbmQgZm9yIHRoZSBzb2Mgc3Vic2VjdGlvbj8N
Cj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCj4gDQoNCg==
