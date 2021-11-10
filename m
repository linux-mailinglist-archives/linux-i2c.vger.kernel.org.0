Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4EB44C0C5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 13:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhKJMKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 07:10:05 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:23641 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhKJMKE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 07:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636546037; x=1668082037;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sxmu2/efoOQF5UrmlDKX6s/aNSfKC7WCyam4rSYtIFY=;
  b=v1UAmFja2aCT6Yd+2y4BdbrmY4fLIaLTH8Y1uHWFxGP8kyriJQpER3mh
   +Lx9ty0GSqPhSVE+Lp9lp1cx7gxXKXdeRmwKcpqPiSYvYH953JqzywGwr
   F2A+DTjDXk3hrpdZV3mPZ2bkRuyAc4O+nUPjD4RXrYozYYKkxA/byxlEn
   2TphmfkFWeZbtPGMVXZsjI9fDiUHI4Js05PyAXsMNIJh3GQnCCxsp3ixm
   SooX7FTtytXvNghDnT7QzvYkc9E2MFh2reaVcQldOJpgZ8eUB+AmfQ6Mh
   HmbBsGcSqdVnskuJS1Snu4EbA+hB25VpvkVNSmQ6DvLLLpF5Ivhy+mI3V
   Q==;
IronPort-SDR: 0JmUshwCzULV67u5tP3LGxI5gb39IjlpsTQjlMvuB1YDqzdJkRxBPp+UYoGQkEfD1CWy+jySKm
 BDioA0ApyEUAWLgcHLMwZgFoR09JXf7uCHdH0IpULI1tXlGoeXYqvR0IZu5Gyb+xYrT1hKdwMP
 zgi0ugw3Y/HHzC5XeFaByTtAhJgbPkm3ZTVKCD0vHVfG43/V5NKgnh8b6ve/kFGvaefL+W18YA
 NQy2AoFJi+8lygfV2TkQ0NyCbdjfw4gIwRrUVQWOHltxa8tyKP9OaLs/vWicv/p9eFyNK+vxd9
 kuowg5ofhRt2pY7Smj5yzaUu
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; 
   d="scan'208";a="151426868"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2021 05:07:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 10 Nov 2021 05:07:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 10 Nov 2021 05:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmG/DD4eMa8kguKJF3bv2v2lBq3HQhUwaoYUi4dB23tbhVtYIYKcmt2irKf63oUdcgNn/wIqFui9K4vkviC+vaTtYWp0n6+WH/QqN3RgbrJJz169JRSsfS2OsqLWoi/FMEz/EBPVspa1zPRnQSGu+GhckpF3f0u2boFvYKp6V4O2yBxsD+m+vvU4r0Tv04m2ZpcRfvyIxrQ3e56w+pZxq2a8JNY+TOg8vBcg3fx/g5Gdgp0pPOGaDj6UpyORLyoPB2oteIXve9cDgdpo8ylpmC4OLvxfiWmX3syLneBZvpXT8bFPYuxa4r5rKKErihV8nTvo6/AuL4wmy9a0NuBETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxmu2/efoOQF5UrmlDKX6s/aNSfKC7WCyam4rSYtIFY=;
 b=XwZyjLWtPys7hCJsT3rH0tnEWCGkD6Fkqi/fka/591Zyxgk7vnvXnoUXRYvCDHG2xE2/sUzlXaL6nmUM5Dj2eoeq3M5Lbngk+0ty+Cc2DLqxCz5K/7UUpVo0nsv3DTttoWxVqCf9pNnxaOpXtZymtjLOSr6Z+IcIVfDlvgZUa163hq7Cx5i0HvAV5oMcUFBq6ZYpbeGCsTys4GKi7Z8ns+UQftVzVrqMTMPgQDKa6KbqHCizXhmmdzV8Qh6S4pDiq8a1RfTx/cJ4mBPHxwgZ2bEJcx9//xMsKOhHJYfcTtuib/LZGM7DQ8do8uYkVGA1vq/2O6axAmLAv2O5MJ8s4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxmu2/efoOQF5UrmlDKX6s/aNSfKC7WCyam4rSYtIFY=;
 b=qSjVLZx+twjtqpFP2DN6B0ybCWs2g0sS+humxnfhJJ8+YK7lx8ITjmivMDlm1XpaOVX3bksAopKK0lrZt9QFbD8xWk4WOMOQdS9KyCw7KoMZrVmz9/pSdgAzTiDAxSadx6SylUW2gQOBAhT+SDgW8PYFVRB2bOLV8bqkgkI0Vio=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB2016.namprd11.prod.outlook.com (2603:10b6:300:26::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 12:07:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4690.015; Wed, 10 Nov 2021
 12:07:10 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
        <Lewis.Hanly@microchip.com>, <Daire.McNamara@microchip.com>,
        <atish.patra@wdc.com>, <Ivan.Griffin@microchip.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <geert@linux-m68k.org>, <bin.meng@windriver.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Topic: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Index: AQHX1LJ2yk8h5UAHwUis11m3Urxauav6KQUAgAKEvoA=
Date:   Wed, 10 Nov 2021 12:07:09 +0000
Message-ID: <2d1dc0ab-f3fa-15c6-1aeb-e825a714aba0@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <01fdf2cf-26ae-b062-178b-4b9a23cd5803@canonical.com>
In-Reply-To: <01fdf2cf-26ae-b062-178b-4b9a23cd5803@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831db819-b3f2-496b-fad1-08d9a4429f8b
x-ms-traffictypediagnostic: MWHPR11MB2016:
x-microsoft-antispam-prvs: <MWHPR11MB2016369AA12B94518155CE7298939@MWHPR11MB2016.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: icf3wugeLq2uz3MWli8HcxfOvyMgDP+crx6pQypEdMDqWgSU8YxkbIDvPVkEscaw58FmSd1tqqfdzdJ6rcIyk50m5/yOzSsit2+4kRa4/nVsFc1IK/L5y8mE4xg+xN5xTtjNkkL3wG7/ueo+GohIW/e50+UaPtOVYeRhIssjtoO/xNK8pvx77078e2Ow1jZOhJOBLGGG3HgHhk/t0ljfNN6sWTA6oBuAZEIKAUhxz5vAAKYC0YCBqjwgzB/SUDpF0kdzCGHYEuEKmxS8R01iiYWb1r8mQ0mmwcajILv0YNwxOUSonWbVNzKHaFhEmagUVfPkawGRCbJ766TicqrHWc5IyfZFwmwiFJMe2zW6YDuoI3Li229qrZYjNlNmIY76rmkIOMw2etmRQ0WEeGuxmxua7xtmRm+f+uwSwaIJ7Jd72cU0zF15KY8unHqbN8DHlMzyE0lRunObVYz2oZV0gsRKSHKgFERXQiMn8h8VRv0iZPg/HSCa8qXwZYX6aPSR6PC8w35DksjhB+8unZmeEuMT41MIfnAnsuAGuJCAVzpEh1L8qdac5DTKawmzWNxdd3xjZc2TrK+GTUcSwKhYOsa4nDTgCuQxnBCcFJJ+ENp98UjPj/zh5Ar4YfdhK9mSru+wx/+hPuemI2JP8OmcUsaMnDDdHDS64tZhBs7FCINwhxz+ZfJNJZ/9FmMA5D0mhQG9RjAH3gW8imbeZZvqAG6VB2fQb4kFFh5aj1fcObkZaFNzVZo1nO35SQcjvXk7Qpw+/99aCyBBPjJ+28PZDnkbU/Ht48Nbt6gFyx8Z7aQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(76116006)(8936002)(83380400001)(36756003)(8676002)(110136005)(38100700002)(2906002)(38070700005)(71200400001)(5660300002)(26005)(53546011)(91956017)(6512007)(6506007)(508600001)(64756008)(86362001)(66446008)(66946007)(4326008)(66556008)(6486002)(186003)(7416002)(921005)(122000001)(15650500001)(31686004)(316002)(31696002)(66476007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djlpeFdIVW8yMlpiWE5kTEMyeUt1bFZCdzhONURKWkl0cGNGa29XNG9tTElJ?=
 =?utf-8?B?eXdZUU41TWVEUXc4VGE5d3ZSeExYYVN4UjRNTW9raUMxVldVWnF1UHJVc283?=
 =?utf-8?B?YjR1K3Y4TmFlNS9pbkZVVGQ0dDRWWjJteU9uUDlZUEF0QitnaUdYa0RLajdK?=
 =?utf-8?B?ZDRPSW81MHlqNC9IbXdZZlFGNHE5bWlTY1hwdlRSaE1LaU91RXVhUWhXVWJI?=
 =?utf-8?B?c1lZcGF2MkIrQndWanV0ZTFGTDVEODhyZmYrNTVHTkREZExFSGtuQ2R1bmww?=
 =?utf-8?B?d0hmZHlHd01iZWt3SEhXRytFckdLRGNrbmZsZHVzMnVRQllIUVZURng1OEtl?=
 =?utf-8?B?RExITjNKZHdFTEJrUm52dExqQUM2TTQxWU9DZUpETnZ3TGdnL3RlOGVBWFpY?=
 =?utf-8?B?NG5oS2ZJZW53cmRuS2laVFoxbDg2dkp3TnBSKzNkT2NEVkszUEsrc0hTOFVs?=
 =?utf-8?B?aTBnOUlKSzlXTHcrSmcwTW5wWTFNOXpXQWR4S0lrb3BkVHhFQzZpQmRBQWRT?=
 =?utf-8?B?NlF1a3lTdHFZTS9LQVlnY1RZaHlEYUlVVXBaRThBcXBkZlBUdDRXTXVQdG01?=
 =?utf-8?B?bEQyTnRzWHVVWExzZVlOalBXemxHNHBBU2twMUdhVUJsd0RSS2ZmTFF1Yzlz?=
 =?utf-8?B?VjEzK3NzSzlBL0FtTUxjSW1OYjliYWN3alZrcmZ6MWJObzlKQ2tIelUrN09n?=
 =?utf-8?B?dDJaaXpMUmpQVE5temlBTzdYOW85Wlg5Smxqb0pLM2tHcmhsYS8zY3hObXdB?=
 =?utf-8?B?b3BidXh1QWRMKzBGQkVPcWQydUgwT2RIcmxsRnc1bEsxOHI2cVNZSjdFNFhm?=
 =?utf-8?B?UmhQTHFaMFhlWTFpalhZYm8wR0phVzM1aDRWc0N3clRaSldaV2tEamE1aldv?=
 =?utf-8?B?aWIrTkxZa3lwbDBDU1JCN3BvbkV6YnI3WjYvSXZJeGdPWEEreDMzam05N0lh?=
 =?utf-8?B?cmZCVWdKbzhmb1dKMnM0aWR5cHkvV1hpdURDVUwwWkFSazJMTSt3N1dlenVo?=
 =?utf-8?B?TDlkb09PL0Fwc3k3Nk5lTldBdmNxMmtqQ2dnWUdJUTc5S0NJMFdCY3ZBL0U3?=
 =?utf-8?B?a2RCczlnWFQ1cjlZT0NsSS8xeVpxWTVQRWZXOHFrRzNyRTVLN1FHbjdpNVAx?=
 =?utf-8?B?MHRjQ1FTb05yNEJEYnFWWURHMUFJRmVZelNqZWhxdUkvZnlNZ2J2SGVvUHV2?=
 =?utf-8?B?QXdkQlVrWUFzTm5DVklnM05OZy9FOW5uc21kQnJ4UTJ6VFdQNDhxRDBnQU1Y?=
 =?utf-8?B?bmprMWE2NDlwS0lDOG1HMkNHMlR6WEpZSkx5SHh2UlFMWjFId3dyb3ZCbzNm?=
 =?utf-8?B?NnMydVpnSVdGZDdmU0RJVCswYmx5R1c3VG5TRUxkRmg1TTJPLzJyQVBnNnVa?=
 =?utf-8?B?OW9obFJPOFljSHNTaExweDV6N2RPQU1LTkxHS1dNczA1b1NpSHRCSFBURytG?=
 =?utf-8?B?SmlxeVhpL1ZTcndHUnl4QUNEMDY5eS8xM3pWcjFZNktmWWVzZUV6cE5BZUU1?=
 =?utf-8?B?bnc1RDFYMEx3Zk5seDFuU3I0Y0R0V1lnbXBRUlhHTUEyd21zdTR0N3JtQ3Zs?=
 =?utf-8?B?TmpDYy9EbjI1SWJqUElYTzRBOVN1R1VjcnZYQkgxeTFXNnZxWHpRVGJSTFVx?=
 =?utf-8?B?QXNlem9rZDVRMnRPR3lwYlp6WURVZ3NlVGRMcDhHUnY0dkxPTGF5dnlGeVR0?=
 =?utf-8?B?YVhsb2Q1Rno0WHcyMEpKZEwzUFNLTzl0R0MvQW1zbk4wMFpnbGZJN1AvWmN1?=
 =?utf-8?B?d3ovM3FtNndHS3REZDB2K3VlMmdlWE1GNkduMnVmZ21JV3EwbXpGejZ0RE9C?=
 =?utf-8?B?MFVPYXRaVGlMRzI3eHNVeHd3S3Z1VTd0enNzTVZxZDZWeEg1UEpKL0pXeVRn?=
 =?utf-8?B?cGNERjkvL1dUQWxIWDBuV05TQkxFbmwxOWlrVVJpd0wvVUNma05UTTVtRkZ5?=
 =?utf-8?B?VzRTMlJCR1R3VkxlRFNieUhPQnNWTmRzaEYvZ1VFU0lCRzl6WC8vSytFbEwx?=
 =?utf-8?B?WEx0bXpMdG43ZmgrRUxMeE5SbUxDZ3FScXdOSWJnWTI1YWsrUk1qUE1SaDFB?=
 =?utf-8?B?SVdPMEtKMTdWbFA5b2dEQ3pWc3dPTVpFTGVEMDhOZ1ZoNGNrMFlCSGIrYS90?=
 =?utf-8?B?d3h3Q09jaWRQMFlWSUtjUWErbFZoSStKZ3RUcE1Fb3o3bFVhUGl0WVJUSTN5?=
 =?utf-8?B?YTU1VTBhbjhtOFMzSHc3WmtNQW0zTklEQmxIcHVjMkszZFIvZXNiaDNpaCtX?=
 =?utf-8?B?TDE0RSt5WmVMbXlCMzVVUnVGcVl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55BC135F98201D4896166A1B421AB670@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831db819-b3f2-496b-fad1-08d9a4429f8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 12:07:09.9570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKE7pdjyW6zJofiGdgxyIxxe4mcdEeS1qZpoG5zuwfAV/Ak1uyBnnI+FdzezOQdwY1fGP04MZAm5fBTlwaFjOhF0cTDd5DD1BN+/RqtIRbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2016
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDgvMTEvMjAyMSAyMTo0MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwOC8xMS8yMDIxIDE2OjA1LCBj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gVXBkYXRlIHRoZSBkZXZpY2UgdHJl
ZSBmb3IgdGhlIGljaWNsZSBraXQgYnkgc3BsaXR0aW5nIGl0IGludG8gYSB0aGlyZCBwYXJ0LA0K
Pj4gd2hpY2ggY29udGFpbnMgcGVyaXBoZXJhbHMgaW4gdGhlIGZwZ2EgZmFicmljLCBhZGQgbmV3
IHBlcmlwaGVyYWxzDQo+PiAoc3BpLCBxc3BpLCBncGlvLCBydGMsIHBjaWUsIHN5c3RlbSBzZXJ2
aWNlcywgaTJjKSwgdXBkYXRlIHBhcnRzIG9mIHRoZSBtZW1vcnkNCj4+IG1hcCB3aGljaCBoYXZl
IGJlZW4gY2hhbmdlZC4NCj4gDQo+IFRoaXMgc2hvdWxkIGJlIG11bHRpcGxlIGNvbW1pdHMgYmVj
YXVzZSB5b3UgbWl4IHVwIHJlZmFjdG9yaW5nIChzcGxpdCkNCj4gYW5kIGFkZGluZyBuZXcgZmVh
dHVyZXMuIFRoZSBwYXRjaCBpcyByZWFsbHksIHJlYWxseSBkaWZmaWN1bHQgdG8NCj4gcmV2aWV3
LiBJIGdhdmUgdXAgaW4gdGhlIG1pZGRsZS4NCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4v
ZHRzL21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy1mYWJyaWMuZHRzaSAgfCAgMjEgKysNCj4+ICAg
Li4uL21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy1pY2ljbGUta2l0LmR0cyAgIHwgMTU5ICsrKysr
KystLQ0KPj4gICAuLi4vYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLmR0c2kgICAg
fCAzMzMgKysrKysrKysrKysrKystLS0tDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDI4IGluc2Vy
dGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtZmFicmljLmR0c2kNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1w
ZnMtZmFicmljLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNyb2NoaXAt
bXBmcy1mYWJyaWMuZHRzaQ0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uOGZhMzM1NjQ5NGYxDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy1mYWJyaWMuZHRzaQ0KPj4gQEAg
LTAsMCArMSwyMSBAQA0KPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBP
UiBNSVQpDQo+PiArLyogQ29weXJpZ2h0IChjKSAyMDIwLTIwMjEgTWljcm9jaGlwIFRlY2hub2xv
Z3kgSW5jICovDQo+PiArDQo+PiArLyB7DQo+PiArICAgICBmcGdhZG1hOiBmcGdhZG1hQDYwMDIw
MDAwIHsNCj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsbXBmcy1mcGdh
LWRtYS11aW8iOw0KPj4gKyAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICsg
ICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArICAgICAgICAgICAgIHJlZyA9IDww
eDAgMHg2MDAyMDAwMCAweDAgMHgxMDAwPjsNCj4+ICsgICAgICAgICAgICAgaW50ZXJydXB0LXBh
cmVudCA9IDwmcGxpYz47DQo+PiArICAgICAgICAgICAgIGludGVycnVwdHMgPSA8UExJQ19JTlRf
RkFCUklDX0YySF8yPjsNCj4+ICsgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gKyAg
ICAgfTsNCj4+ICsNCj4+ICsgICAgIGZwZ2Fsc3JhbTogZnBnYV9sc3JhbUA2MTAwMDAwMCB7DQo+
IA0KPiBOb2RlIG5hbWVzIGdvIHdpdGggaHlwaGVuLCBidXQgYWN0dWFsbHkgeW91IHNob3VsZCBu
b3QgbmVlZCBpdCwgYmVjYXVzZQ0KPiB0aGUgbmFtZSBzaG91bGQgYmUgZ2VuZXJpYywgZS5nLiAi
dWlvIi4NCnN1cmUsIHdpbGwgY2hhbmdlIGl0IHRvIHVpby4NCj4gDQo+IEhvd2V2ZXIgdGhlcmUg
aXMgbm8gc3VjaCBjb21wYXRpYmxlIGFuZCBjaGVja3BhdGNoIHNob3VsZCBjb21wbGFpbiBhYm91
dCBpdC4NCnllYWgsIHRoaXMgYW5kIHRoZSBwYWMxOTM0IGkgZGlkbnQgc2VuZCBiaW5kaW5ncyBm
b3IgLSBlcnJvbmVvdXNseSANCnRob3VnaHQgaSBtaWdodCBub3QgaGF2ZSB0byBkbyBzby4gaWxs
IGdldCBhIGJpbmRpbmcgc29ydGVkIG91dCBmb3IgYm90aCANCm9mIHRoZXNlLg0KPiANCj4+ICsg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJnZW5lcmljLXVpbyI7DQo+PiArICAgICAgICAgICAg
IHJlZyA9IDwweDAgMHg2MTAwMDAwMCAweDAgMHgwMDAxMDAwDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgMHgxNCAweDAwMDAwMDAwIDB4MCAweDAwMDEwMDAwPjsNCj4+ICsgICAgICAgICAgICAg
c3RhdHVzID0gIm9rYXkiOw0KPj4gKyAgICAgfTsNCj4+ICt9Ow0KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRz
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtaWNpY2xlLWtp
dC5kdHMNCj4+IGluZGV4IGZjMWU1ODY5ZGYxYi4uNDIxMjEyOWZjZGYxIDEwMDY0NA0KPj4gLS0t
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtaWNpY2xlLWtp
dC5kdHMNCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1t
cGZzLWljaWNsZS1raXQuZHRzDQo+PiBAQCAtMSw1ICsxLDUgQEANCj4+ICAgLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkNCj4+IC0vKiBDb3B5cmlnaHQgKGMpIDIw
MjAgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5jICovDQo+PiArLyogQ29weXJpZ2h0IChjKSAyMDIw
LTIwMjEgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5jICovDQo+Pg0KPj4gICAvZHRzLXYxLzsNCj4+
DQo+PiBAQCAtMTMsNzIgKzEzLDE4NyBAQCAvIHsNCj4+ICAgICAgICBjb21wYXRpYmxlID0gIm1p
Y3JvY2hpcCxtcGZzLWljaWNsZS1raXQiLCAibWljcm9jaGlwLG1wZnMiOw0KPj4NCj4+ICAgICAg
ICBhbGlhc2VzIHsNCj4+IC0gICAgICAgICAgICAgZXRoZXJuZXQwID0gJmVtYWMxOw0KPj4gLSAg
ICAgICAgICAgICBzZXJpYWwwID0gJnNlcmlhbDA7DQo+PiAtICAgICAgICAgICAgIHNlcmlhbDEg
PSAmc2VyaWFsMTsNCj4+IC0gICAgICAgICAgICAgc2VyaWFsMiA9ICZzZXJpYWwyOw0KPj4gLSAg
ICAgICAgICAgICBzZXJpYWwzID0gJnNlcmlhbDM7PiArICAgICAgICAgIG1tdWFydDAgPSAmbW11
YXJ0MDsNCj4+ICsgICAgICAgICAgICAgbW11YXJ0MSA9ICZtbXVhcnQxOw0KPj4gKyAgICAgICAg
ICAgICBtbXVhcnQyID0gJm1tdWFydDI7DQo+PiArICAgICAgICAgICAgIG1tdWFydDMgPSAmbW11
YXJ0MzsNCj4+ICsgICAgICAgICAgICAgbW11YXJ0NCA9ICZtbXVhcnQ0Ow0KPiANCj4gV2h5PyBD
b21taXQgbXNnIGRvZXMgbm90IGV4cGxhaW4gaXQuDQpjaGFuZ2VkIHRvIG1hdGNoIGFsbCBvZiBv
dXIgZG9jdW1lbnRhdGlvbg0KPiANCj4+ICAgICAgICB9Ow0KPj4NCj4+ICAgICAgICBjaG9zZW4g
ew0KPj4gLSAgICAgICAgICAgICBzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsNCj4+
ICsgICAgICAgICAgICAgc3Rkb3V0LXBhdGggPSAibW11YXJ0MToxMTUyMDBuOCI7DQo+PiAgICAg
ICAgfTsNCj4+DQo+PiAgICAgICAgY3B1cyB7DQo+PiAgICAgICAgICAgICAgICB0aW1lYmFzZS1m
cmVxdWVuY3kgPSA8UlRDQ0xLX0ZSRVE+Ow0KPj4gICAgICAgIH07DQo+Pg0KPj4gLSAgICAgbWVt
b3J5QDgwMDAwMDAwIHsNCj4+ICsgICAgIGRkcmNfY2FjaGVfbG86IG1lbW9yeUA4MDAwMDAwMCB7
DQo+PiAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KPj4gLSAgICAgICAg
ICAgICByZWcgPSA8MHgwIDB4ODAwMDAwMDAgMHgwIDB4NDAwMDAwMDA+Ow0KPj4gLSAgICAgICAg
ICAgICBjbG9ja3MgPSA8JmNsa2NmZyAyNj47DQo+PiArICAgICAgICAgICAgIHJlZyA9IDwweDAg
MHg4MDAwMDAwMCAweDAgMHgyZTAwMDAwMD47DQo+PiArICAgICAgICAgICAgIGNsb2NrcyA9IDwm
Y2xrY2ZnIENMS19ERFJDPjsNCj4+ICsgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4g
KyAgICAgfTsNCj4+ICsNCj4+ICsgICAgIGRkcmNfY2FjaGVfaGk6IG1lbW9yeUAxMDAwMDAwMDAw
IHsNCj4+ICsgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCj4+ICsgICAgICAg
ICAgICAgcmVnID0gPDB4MTAgMHgwIDB4MCAweDQwMDAwMDAwPjsNCj4+ICsgICAgICAgICAgICAg
Y2xvY2tzID0gPCZjbGtjZmcgQ0xLX0REUkM+Ow0KPj4gKyAgICAgICAgICAgICBzdGF0dXMgPSAi
b2theSI7DQo+PiAgICAgICAgfTsNCj4+ICAgfTsNCj4+DQo+PiAtJnNlcmlhbDAgew0KPj4gKyZt
bXVhcnQxIHsNCj4+ICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiAgIH07DQo+Pg0KPj4gLSZz
ZXJpYWwxIHsNCj4+ICsmbW11YXJ0MiB7DQo+PiAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4g
ICB9Ow0KPj4NCj4+IC0mc2VyaWFsMiB7DQo+PiArJm1tdWFydDMgew0KPj4gICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCj4+ICAgfTsNCj4+DQo+PiAtJnNlcmlhbDMgew0KPj4gKyZtbXVhcnQ0IHsN
Cj4+ICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiAgIH07DQo+Pg0KPj4gICAmbW1jIHsNCj4+
ICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiAtDQo+PiAgICAgICAgYnVzLXdpZHRoID0gPDQ+
Ow0KPj4gICAgICAgIGRpc2FibGUtd3A7DQo+PiAgICAgICAgY2FwLXNkLWhpZ2hzcGVlZDsNCj4+
ICsgICAgIGNhcC1tbWMtaGlnaHNwZWVkOw0KPj4gICAgICAgIGNhcmQtZGV0ZWN0LWRlbGF5ID0g
PDIwMD47DQo+PiArICAgICBtbWMtZGRyLTFfOHY7DQo+PiArICAgICBtbWMtaHMyMDAtMV84djsN
Cj4+ICAgICAgICBzZC11aHMtc2RyMTI7DQo+PiAgICAgICAgc2QtdWhzLXNkcjI1Ow0KPj4gICAg
ICAgIHNkLXVocy1zZHI1MDsNCj4+ICAgICAgICBzZC11aHMtc2RyMTA0Ow0KPj4gICB9Ow0KPj4N
Cj4+IC0mZW1hYzAgew0KPj4gKyZzcGkwIHsNCj4+ICsgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+
ICsgICAgIHNwaWRldkAwIHsNCj4+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzcGlkZXYi
Ow0KPiANCj4gMS4gVGhlcmUgaXMgbm8gc3VjaCBjb21wYXRpYmxlLA0KPiAyLiBZb3Ugc2hvdWxk
IGhhdmUgYmlnIGZhdCB3YXJuaW5nIHdoZW4gYm9vdGluZywgc28gc3VjaCBEVCBjYW5ub3QgYmUN
Cj4gYWNjZXB0ZWQuDQp0aGlzIG9uZSB3YXMgYW4gb3ZlcnNpZ2h0IGZyb20gbWUsIHRoYXQgY29t
cGF0aWJsZSBoYXMgbmV2ZXIgYmVlbiANCiJzcGlkZXYiIG9uIGl0cyBvd24gaW4gb3VyIGludGVy
bmFsIHN0dWZmIGFuZCBpIG11c3R2ZSBhY2NpZGVudGFsbHkgDQpkcm9wcGVkIGEgdmVuZG9yIHN0
cmluZyB3aGlsZSBtYWtpbmcgdGhlc2UgcGF0Y2hlcy4NCj4gDQo+PiArICAgICAgICAgICAgIHJl
ZyA9IDwwPjsgLyogQ1MgMCAqLw0KPj4gKyAgICAgICAgICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9
IDwxMDAwMDAwMD47DQo+PiArICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICsgICAg
IH07DQo+PiArfTsNCj4+ICsNCj4+ICsmc3BpMSB7DQo+PiArICAgICBzdGF0dXMgPSAib2theSI7
DQo+PiArfTsNCj4+ICsNCj4+ICsmcXNwaSB7DQo+PiArICAgICBzdGF0dXMgPSAib2theSI7DQo+
PiArfTsNCj4+ICsNCj4+ICsmaTJjMCB7DQo+PiArICAgICBzdGF0dXMgPSAib2theSI7DQo+PiAr
fTsNCj4+ICsNCj4+ICsmaTJjMSB7DQo+PiArICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArICAg
ICBwYWMxOTN4OiBwYWMxOTN4QDEwIHsNCj4gDQo+IEdlbmVyaWMgbm9kZSBuYW1lLiBMb29rcyBs
aWtlIGNvbXBhdGlibGUgaXMgbm90IGRvY3VtZW50ZWQsIHNvIGZpcnN0DQo+IGJpbmRpbmdzLg0K
PiANCmFzIGFib3ZlDQo+IA0KPj4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hp
cCxwYWMxOTM0IjsNCj4+ICsgICAgICAgICAgICAgcmVnID0gPDB4MTA+Ow0KPj4gKyAgICAgICAg
ICAgICBzYW1wLXJhdGUgPSA8NjQ+Ow0KPj4gKyAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7
DQo+PiArICAgICAgICAgICAgIGNoMDogY2hhbm5lbDAgew0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgIHVvaG1zLXNodW50LXJlcyA9IDwxMDAwMD47DQo+PiArICAgICAgICAgICAgICAgICAgICAg
cmFpbC1uYW1lID0gIlZERFJFRyI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgY2hhbm5lbF9l
bmFibGVkOw0KPj4gKyAgICAgICAgICAgICB9Ow0KPj4gKyAgICAgICAgICAgICBjaDE6IGNoYW5u
ZWwxIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICB1b2htcy1zaHVudC1yZXMgPSA8MTAwMDA+
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHJhaWwtbmFtZSA9ICJWRERBMjUiOw0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgIGNoYW5uZWxfZW5hYmxlZDsNCj4+ICsgICAgICAgICAgICAgfTsN
Cj4+ICsgICAgICAgICAgICAgY2gyOiBjaGFubmVsMiB7DQo+PiArICAgICAgICAgICAgICAgICAg
ICAgdW9obXMtc2h1bnQtcmVzID0gPDEwMDAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBy
YWlsLW5hbWUgPSAiVkREMjUiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGNoYW5uZWxfZW5h
YmxlZDsNCj4+ICsgICAgICAgICAgICAgfTsNCj4+ICsgICAgICAgICAgICAgY2gzOiBjaGFubmVs
MyB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgdW9obXMtc2h1bnQtcmVzID0gPDEwMDAwPjsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICByYWlsLW5hbWUgPSAiVkREQV9SRUciOw0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgIGNoYW5uZWxfZW5hYmxlZDsNCj4+ICsgICAgICAgICAgICAgfTsN
Cj4+ICsgICAgIH07DQo+PiArfTsNCj4+ICsNCj4+ICsmbWFjMCB7DQo+PiArICAgICBzdGF0dXMg
PSAib2theSI7DQo+PiAgICAgICAgcGh5LW1vZGUgPSAic2dtaWkiOw0KPj4gICAgICAgIHBoeS1o
YW5kbGUgPSA8JnBoeTA+Ow0KPj4gLSAgICAgcGh5MDogZXRoZXJuZXQtcGh5QDggew0KPj4gLSAg
ICAgICAgICAgICByZWcgPSA8OD47DQo+PiAtICAgICAgICAgICAgIHRpLGZpZm8tZGVwdGggPSA8
MHgwMT47DQo+PiAtICAgICB9Ow0KPj4gICB9Ow0KPj4NCj4+IC0mZW1hYzEgew0KPj4gKyZtYWMx
IHsNCj4gDQo+IEkgZ2F2ZSB1cCBoZXJlLCBpdCdzIG5vdCBlYXN5IHRvIGZpbmQgd2hhdCBpcyBl
ZmZlY3Qgb2YgcmVmYWN0b3JpbmcsDQo+IHdoYXQgaXMgYSBuZXcgbm9kZS4NCnllYWgsIGlsbCBz
cGxpdCBpdCBpbnRvIHNldmVyYWwgcGF0Y2hlcyAtIHByb2JhYmx5IG9uZSBmb3IgdGhlIA0Kc3Bs
aXR0aW5nLCBvbmUgZm9yIHRoZSBuZXcgZGVmaW5lcywgb25lIGZvciB0aGUgY2hhbmdlcyB0byBl
eGlzdGluZyANCm5vZGVzIGFuZCBvbmUgZm9yIG5vZGUgYWRkaXRpb25zLg0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNCg==
