Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644AD44ACFA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 12:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbhKIL6A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 06:58:00 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:24652 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhKIL57 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 06:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636458913; x=1667994913;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GglzzlQj2fZplPUA8R4joBt14jK+jaxl9ah/RVMoFpY=;
  b=KnOueG22EEtvFBg6UreokuYasTtj+llEyW2vl2ige9iXAkxHzBc9IPB8
   XjHDBXHgM17j9Oy22WVMKtFNC7lFBqg7p9KJoDwY7zM0rmDlCncEjyU52
   3erL7khuTiSmOYZ/BC9TOQpXl4u376JtoWcaLrDuFpiPAKGSkiawS93CT
   3FJ6eTtX37W03khLEYcp6h3Wyei6NdPnUN6IllwZhYfu61VmP+kvKOyBZ
   q6L7iXJJf3R9lz503SkbnIQs38rxrYz5OtIwr88aV7L6/7sKDeKJ/wQcj
   gP4G7oSo7/KTL/bTD0CoXIj0h3SuS3qaryiqrKr4Ko7AzDZRuiqRyw4ge
   Q==;
IronPort-SDR: tEKXUZstDdvQKOUzJ+jHfLdn+ifYZQUzldGvOITWLAk4VDZ6CxKnawKpw4CPti6/sB/YlTnjTj
 fmUD+ETusj3PeubI+mR1tjAC48hvdmuLWwu+2o/dZJScvKdFd7Gzqge7udoz/IfY+v7RZf3gbh
 ajahcI+RNRKvcjTrbaluXOGPOiKe8Vs51OBuXQn0wBikqOt8oZUzamUBUBKgPuH0lw3UUZ/d9Q
 O1GWVQUD2JqVM3iDz8E3Y4IkdNPZqnrcBwEAFKHd8bOX6vPF2FoDuBBQxBnTTkKhe11igeQAjp
 SqdjVNDXZkopfJSlDy12561Z
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; 
   d="scan'208";a="135963447"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2021 04:55:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 04:55:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 9 Nov 2021 04:55:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eggeBAxp13EiZqH/2k1iNm2gkWBB/ZJhEWczXmC/zg3J+cvOhDzJ+IIPxPSO+6VWravvb3hUFB86s6Ok/ryyZG635XwRX0Z07GZvwTpBzO5TDwYRcOh9aJU5Xd9onFjYZPO2yUvWf3s/toButAM/ATUOFxtsYze6FwdrdWE5nzDpCzk5/ZgChTYf/ACRDkBDftiWrubjeGUhG9PIWEJHXGIE43PBFXcItKvbRUDSARPhmVqz8vF39F2uNaqr+WND9JQ7QvL2rBxbI4PvOm6SUQlT18tK9+wGGar/sZ7LJCWypTmMRRVIYB6w/lUhfm/3uswkzPxwrUCG/2c7RnQW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GglzzlQj2fZplPUA8R4joBt14jK+jaxl9ah/RVMoFpY=;
 b=J8J+rfsREALouepBCdj2xFmpKJwxSGWURP/0YQ7zUCpnndv/WyT7jYOVUWFhj70Wxxb6KIXkt4K13Kqp744dMtpda9NT9M62sN+/AxNNgzCOMAmYjbyesZ7Y9Jm97SjXZbJl+YvAhHR6fg2iNtRVbvUNU4Th1G35j/mMnyifZTho/jPGcR/uLiiVWuMTE3Aj9WPOL61YuxBgXFZnl7RKBGymv8w3SwesqtC1/STTD/dCzw4PCmNs0ESi2tb9/OEbQ4Oqg/n/Z1y/Q8TyHKwM8F/fFacTeDJ8AXo90FXF80McJsEjSRlrNC442/XQhGOv1yPcsZlyeDzr0z8MJaL0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GglzzlQj2fZplPUA8R4joBt14jK+jaxl9ah/RVMoFpY=;
 b=L02D2gNeK3ePrpODPRtDMEcDBYsIvO0iBkuli2YaoagF6knzl3zxfbXV001kDKy8dgrcUvmOOcjKvVR90kP6odAQUuh7yz2Vk5N8k1z0BXn1LpRroqRtX1VduR5dLJXXwNa2mp+2WNBX9TLC5Uo1rRIHCubOrhFFVBSmHU03neg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 9 Nov
 2021 11:55:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 11:55:09 +0000
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
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Thread-Topic: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Thread-Index: AQHX1LJPDy+D8VJjOEmJwWP3EzXa3av64KAAgAA3dIA=
Date:   Tue, 9 Nov 2021 11:55:09 +0000
Message-ID: <a374a644-82af-d95d-ee8c-feafa378fb1d@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <CAMuHMdWWzQE7Pq8Qo=Vt3ey-ODhnP9B5+r==fsoK0miDv7-arA@mail.gmail.com>
In-Reply-To: <CAMuHMdWWzQE7Pq8Qo=Vt3ey-ODhnP9B5+r==fsoK0miDv7-arA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3d664c3-2c0c-4a26-e13d-08d9a377c7b7
x-ms-traffictypediagnostic: CO1PR11MB5060:
x-microsoft-antispam-prvs: <CO1PR11MB5060E611640B9DACBA83AD1498929@CO1PR11MB5060.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Xg9OCMW40AmhcHBvSkp9kOk1BiIh1b4zwIYTQTGZ5S9ZfHNhVrUL+9RXe5F0jxR+5/gBPnShL3IxBTIoqYgq0YiAih5XtTFDAWs+BPXL0jkY05gWeoMkC+iYN6CE/cU9O2o24HjfNMgkkM2HBT/AUvY8/VoaH43M05ezelPQno8sPpaJ4dq5foxnNxEFgsImyWGpdoIs05/UdgSrd6W1l2TvqekJOe+o/2TjgUc8sWd2IdRwgo/mzXi+JZcS0xVGBp6WsugxCQWfYs9xcWrXmLtLWrUB+8iE7oBYDQlqt+CnavkoPd1okfu43XEgveOD1EVOhfsDHST/II1PmEgxj4OT82TWw8xd1eM0kBbv4AyE2YglWsUZovK3Zs551TQqdQUQmMN08qExc+fr/3on74cJyCacF6PHRbzqUsms0oxAE5BiDmsD4I+d702fgFRcA4jFEZPe75HPehVurEHkjIt+Rt9PPgR3SODvkOyznnTlIYUNtLJchYOdH1BV9iHAYv5+XEaUawSKrw2iaRm+crgWG2/jU9XWKC2CmJNwwIOTxd+AnVcgXTQxqENZHCBTsiRmXVPtPuZ9Y3zqzEzdSc/R9pXtR2RFrlRLxX8/8+0KzsJt14T7bvoRrXh7Nw+XhuUOhU17QjrYA/zn2qZfbuPMkoKfm50EA0BHs+oO/IjzdZTUFalbOzLWTgjs4asbX2pLFyNwas0jKJI++vK0MrOZIu3+FdSmqWTuD8Txm4Yyq3LE7QnsqTghWspIzXgDilA/xm5Vd5AWRfIqZAApJSwkzg2Ai47RLFERQkelngKfjxShkLI/r8RkKuR+wProP6NFFdKKZ79HgG2AXV9eODchSUm+XFlT8+5OZuA1aqNZ28QZlrHglhCVG/Eru0/o8fVo5StUgIFTWpb5bMhYA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38070700005)(66476007)(7416002)(6486002)(64756008)(316002)(26005)(66556008)(38100700002)(5660300002)(508600001)(91956017)(54906003)(6512007)(8936002)(31686004)(122000001)(31696002)(76116006)(186003)(66946007)(8676002)(53546011)(6916009)(83380400001)(36756003)(6506007)(4326008)(71200400001)(2906002)(86362001)(66446008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnlFVlVxZTZ5dWRCMUpSMzdyS2s2b1hrTTV2b3RtQTM2N1BmSWJlVVNqRHpX?=
 =?utf-8?B?blhKR1ZlREJDVUYxNjkvckxsYWdhd0ZqejUvYm5iRkRiWFdWTUEraFNmUkdT?=
 =?utf-8?B?eklWb0FiTmYwK2tMN0V3bWhSNExRMW5CRks2TER1bW1UcWFMY0VmSGkvVGR4?=
 =?utf-8?B?eS84cGZBZ0FEVFZJR2trYklvbDJBSFM5bGEremNBWjlQbHZLZitCdE9pdml4?=
 =?utf-8?B?ZzR0RStraHdnNFhQQmlIZDQxUEFZTkQ2NlhDU2psTDJ4dlM1QXNBZGJBbGhC?=
 =?utf-8?B?aXZpaTR2YTV5Qm5XWWpJOG5jc3M1U2VBcWRtcW1DcENoQkgvbjlaSnNVaFkz?=
 =?utf-8?B?WXZ1OVdrd2hTLzBhOStRb1NURXpLdmxESURZR3JhcWdmRXpnUWFYdVA0NEpU?=
 =?utf-8?B?ejFMR0lPc0VXWklUbHdGQU1oekJXOWU1K0FEWkFoOXBwemZVc3o1NVRwQlBL?=
 =?utf-8?B?TW5YZWRBcTBkbXRidDIzaUpONTZPZXFzYkdLQWR2WS9KcnhiUnMrMmZhRWtE?=
 =?utf-8?B?TmFBU2JXemdQU3FCT2RJS2ZHLzd0T1pEc0psUkNPckNRcTAzbzBLQThxajlI?=
 =?utf-8?B?Z0ZrYWIyYjZLYXpYT0o0RHRYV2FsdlZaY1BPUmlndG1kcXgxdXplMXZTMGdQ?=
 =?utf-8?B?MUZxUUxmOTdLQnNFcHZGUmhrWFRmQnlZNUViemxZZHg4eHVUQklKeWI2Ynkr?=
 =?utf-8?B?K0tJL2FFa3JTSHlLYTZtbUlHYU1JOVV1eFRPdFNYMVFuL3hHaU5YOVBaQUNt?=
 =?utf-8?B?d3F5N3g2dmdUaG9EZTM5UVc0OTBid05rNjl0Mm9wUnA0NU5GTUg1SEZzZFQ5?=
 =?utf-8?B?QnRyTkNRbnJKYzlzKzdhS2hURUxiWGtxMGtyMGJuUG9rQkt1dXQ0R3V2dEFn?=
 =?utf-8?B?ckcvWVhpTG1pTmtLaG54ZWRHV20zYmxCV3o3TXpLMDJQeUszYVhnVVZJdzNa?=
 =?utf-8?B?VHlvdW9nRUR3UDZDcStTaEVYODdibXR2czNBZGNhTk1ScytpTVVrcklDTU00?=
 =?utf-8?B?S3IvYW55c3NrYk1Mc3FQcTN1NmRrMlE1MDI0RzJOVURiVExxaWRXZXd4a3BW?=
 =?utf-8?B?ZW1zSHlPSkFDS2VOYm1hZmFQd0xTMm9CWGovc3FxQXgrNDZ3Sy9yMTU5MUhH?=
 =?utf-8?B?RTNPbVFtSE1sc01PNjhLZTliazNIek1rRDVyNnJxdHE5VEQzM2ZqRXNFUTBs?=
 =?utf-8?B?SSt1SzBXRktWbzFLY2ZIeFRDbzhqc3hreTNlcnE1aEtJVk1BN0Z6eUZWSWVL?=
 =?utf-8?B?bFMyWkljWnFIKyt0dzlzK3hYVWxYcEpVV05oRkg2VG5BVVhsU09IdFduNXFo?=
 =?utf-8?B?SnB2cVhLS1d6RXlxKzBvaUl0QklGMk1Xa2tDUklxdlNWd2xqdFl2ZmROejlr?=
 =?utf-8?B?WThQKzZId05oa24raFhyS0VFOWk4Q3N1cFMvNm5QWHI5cWNNNmRZMDhuV1Ay?=
 =?utf-8?B?U0dNM0dqYTRncXBEZ2IvamNoc3EyZzM5Z2tNdDJCdXBMRkdrVU5sdDZnTTJv?=
 =?utf-8?B?WmlhZzBHaFVBUW1iKy9rYW03cjdFVjMyZ1VEU1NiMWM1emE2ZUVhM21XY3lQ?=
 =?utf-8?B?YUVVOTdpM0tyd1lmbi9lZHY5ZHZmczkwTUhIMGdWVFFDYzVRMWdrcXRKVDBZ?=
 =?utf-8?B?NVBsNEU1ZldYQWZlQ0VlOGlWbVlBR2ZSQmdLUWhzY0xTdXRwZHRvRklKMTQ2?=
 =?utf-8?B?M2UrN1RXdEdaTGh4MWZ6MFA4NUd3U3ZSU2JMSzFJQmFXVExpV0NKUElyTjIy?=
 =?utf-8?B?OHRSQmllOFdQd0g2cVZVcmVBRGVLMXF4WFJyVHcwU3oxQXNQbkphWThxVVhm?=
 =?utf-8?B?Y2RKTVMwc1ladlUxMEhVQ1BBQzBSRVFLdzM1dUtyZVpuMTgvNXpMQTdYaGhn?=
 =?utf-8?B?dXpzOUFXZmUvc214M1JHRnJQNTQwdy9VR2wvbHI2WlF2UUVZUVFkT29OMXFs?=
 =?utf-8?B?SWZiVW5tdlpnZ1h5OThBRkRXbW9nbUlSTENITk9XSXFGQnJIYytZeVNWU3RZ?=
 =?utf-8?B?L2tXY3gyQ2tkTk5oQTZqNTV6elNZTXloeUg4eXBaMGVqYWRWWFNSR3JoNDQr?=
 =?utf-8?B?bkN4SjVrck9KQ1JjUXB0K3JQVjVsSS96ZnkrK2loVWQrMHRxcDgvUmxiY0hq?=
 =?utf-8?B?cjV2VTF4a2l6N1M5Z2hLeitLckJCSCt2eDlYK3FocXZ3WVQ1N3RrN1JHY1VO?=
 =?utf-8?B?UlhzbkExTzNkdWk0cWxnQmtKNENFQmduZnN0V3I2N2crRFlOMEJvWktpZXF0?=
 =?utf-8?B?UXVTY2lUTjRYc0RnT3ozOTU0SjFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DD0CFAA45D2FA4CBF797D6D71BCBE19@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d664c3-2c0c-4a26-e13d-08d9a377c7b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 11:55:09.4727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MViiL1PAbpW3DWHbfMr4qMI1WD2YO+2hSneohXso/qWRp8kLGzzdpns73NYZexnldNtobrLtHqs7wSeoxI1ZgKTwgbghnTRZdTd+mkzD3+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMTEvMjAyMSAwODozNywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIENvbm9yLA0KPiANCj4gT24gTW9u
LCBOb3YgOCwgMjAyMSBhdCA0OjA3IFBNIDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3Jv
dGU6DQo+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0K
Pj4NCj4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIGhhcmR3YXJlIHJuZyBkZXZp
Y2UgYWNjZXNzZWQgdmlhDQo+PiB0aGUgc3lzdGVtIHNlcnZpY2VzIG9uIHRoZSBNaWNyb2NoaXAg
UG9sYXJGaXJlIFNvQy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiAN
Cj4+IC0tLQ0KPj4gICAuLi4vYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sICAg
ICAgfCAzMSArKysrKysrKysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hpcCxtcGZzLXJuZy55YW1sDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ybmcvbWljcm9jaGlwLG1wZnMt
cm5nLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcm5nL21pY3JvY2hp
cCxtcGZzLXJuZy55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5lOGVjYjM1MzhhODYNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ybmcvbWljcm9jaGlwLG1wZnMtcm5nLnlhbWwNCj4+
IEBAIC0wLDAgKzEsMzEgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6
ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ybmcvbWljcm9jaGlwLG1wZnMtcm5nLnlh
bWwjIg0KPj4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMiDQo+PiArDQo+PiArdGl0bGU6IE1pY3JvY2hpcCBNUEZTIHJhbmRvbSBudW1iZXIg
Z2VuZXJhdG9yDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsg
IGNvbXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiBtaWNyb2NoaXAscG9sYXJmaXJlLXNvYy1ybmcN
Cj4gDQo+ICJtaWNyb2NoaXAsbXBmcy1ybmciLCBmb3IgY29uc2lzdGVuY3kgd2l0aCBvdGhlciBi
aW5kaW5ncz8NCmNvcnJlY3QsIGRyb3BwZWQgdGhlIHdyb25nIG9uZSB3aGlsZSBjbGVhbmluZyB1
cCBzaW5jZSB0aGlzIGRvZXNudCBtYXRjaCANCnRoZSBkZXZpY2UgdHJlZS4NCj4gDQo+IEdye29l
dGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0
DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCj4gDQoNCg==
