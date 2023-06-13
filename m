Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37DD72E800
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 18:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240355AbjFMQL5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 12:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235917AbjFMQL4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 12:11:56 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47900137;
        Tue, 13 Jun 2023 09:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LF/UCO4e0btQCwRUlg56Zoe9QmKIj7MeFmtKNkWvinPkPXuJYOdIxU+zuisqz2XXVuF+jhm/m5dE17MB5yNnUGh7GCJnuXt6kKF+rpFl7ZPMvil+/KrX7yrAUFQS0OiByENYvGKAmry0oxo49jZc5iIk49zKkeOxBX/9yywdjp6155c/9HEVTjapqtBnguuBDpTkspBQwZcC3/qe8vSRZGVOR6wfs4S5gQUcQCV5OdJb4g3NEAbL/0DQhXmrex5F/aabG1iquULNYsREwCKEnV/5j4sm0EtebjUkIiRbur75umUyoLUDFCdpV5wzI9RXnZI6hYccM/tBswV3G48rrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU/3xz0hdU7r8+Ja2ZTrTNv/WT7qy086yuDeGFdyY5g=;
 b=UZFb0/UAjAL6iI7Bzz0Q7xIaZKgHSrm1I0fVkRDbBhbUV5BoLvknajlRlfHgQ2BD9OjOd/Q3Tgv1wEm70nASuBp0cDBlyfL68zwKUKCPzc5oi5WAanmJ3DhZXdWo3Lw61sqYJ5SXy7URpvt/z1j2J4OhqdGmhvBY7R79roFJXBFIhDdAYQwbkraCa//iN1XQkSQbh/Y7soJzOkVi0e1pcbRSg1TZvWu9xeopfhDmQuFUmajpgENw1kWfW7KT3NUl0ZPdi7F7RE8xliduHMJVV/HTMSvps4I13h3hj/xC0id3iM5hMFQ+kE1rym7RkF7sRZHaoFzPRQFoddjjK/yWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU/3xz0hdU7r8+Ja2ZTrTNv/WT7qy086yuDeGFdyY5g=;
 b=u+E0mYoqgUvX9zNWf8908DIE1p4Lt6O88AmIwG/lhFs3EfQ3q8CTMhAvtaQLjVtPc5KjtQzcz9h22kA3/nYwLw+ntwoI7AqzfuqakvQDo1PKmtQz6TEwucaEnNsSaoKU0/528m3JS6pSp+Vjx+MxmsUMcE4BCZXAphTFq065Kmc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9604.jpnprd01.prod.outlook.com (2603:1096:604:1ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 16:11:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.047; Tue, 13 Jun 2023
 16:11:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACzT4CAABEtEIAAa5IAgAARedA=
Date:   Tue, 13 Jun 2023 16:11:49 +0000
Message-ID: <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
In-Reply-To: <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9604:EE_
x-ms-office365-filtering-correlation-id: d62d0369-00eb-49b5-2086-08db6c28e496
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ccUVkZda4ioPVlHgzaE0JeazodLpXlnTmDwigzO0kk850HAtkSZrjsPt0itTTb70ZZZWIrjtixU7l33Xd2DMhpCRXbrzTaIlOG5uI+OOVk2/UIRNOSZ1sW2pefd6QM4IaCWwUsqTk4inyMheZGhHN6/KiYgsUIHSm4vwXsY1BBPivi0g526AbFQYO9laDvFGDW/cyc410DEmGyBb+W1O0yZPhlyK4kg6+H+l3fMT4ptqw9pKs9oyu5o7JywloM9D3fcbVcTqg/VcfHtzpL4E1wHMW4vQwxwipUepo8asPYGRTD9uhnLveiMbD6PdG6kxnb3zg5daRXQeUD0DIZj2hk8YrP6wikkyx2Pg+giLL2FbLnke/zXpBbLXAERfx7ndbSnhda2FVl2x0ieQFlf2mGy0r0VScvOnuH9k7a1U/JC0PTY/4D9ZuX1jIZ3qothvFgo+phEauxIX3kNg/CLEAWaulJGqr0weO8M1kr7ynMalHmD4SxDh/WFklDwwzUwVqpXJ02HfnwPI73l9MPuV5bN2aFg2ZVd+l1yNf+8YtiP9tNHh/ZUyPgUYWoYnQ27R8C3Ly54ykNa1WFAnBs7mIQ2soMEDarshbSm2aQYF3EZY662EtlUcQ2VF1+FMIyU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(2906002)(83380400001)(53546011)(478600001)(54906003)(186003)(8676002)(8936002)(55016003)(7696005)(33656002)(71200400001)(316002)(4326008)(6916009)(9686003)(66476007)(66556008)(66946007)(66446008)(76116006)(64756008)(38070700005)(52536014)(5660300002)(41300700001)(6506007)(38100700002)(7406005)(7416002)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0JiSzBibHVqdDRpVFFBNDFoR2hvb2NNeE1vc3NTOFVTbUtqQWd4WWdWdVZI?=
 =?utf-8?B?NnVTZjRjTDl6alNrSzc0SXo0aHFiOGFZdE9UalExb1B1MGM2RWVPVzc1RVRO?=
 =?utf-8?B?UDdjWFhZb3QxRHZYbUt4WFpFWnZCdDdSTno4eXdpdk52Vjh1ekptTTZ2azF0?=
 =?utf-8?B?L1hBTFI0TDYwdXJxUkRzQzRGdHJ2WFpsWmFSak85T1kvWUx1aTYyaWl0ZTFL?=
 =?utf-8?B?RndRWkwzL05oSFp5dFdiS3RpV1FtRmV6N1Vuc0tPVXFGUXhhM0xFYWVNZzh6?=
 =?utf-8?B?L212cEFCNW1SWXFLd2RjNEhKK1VIbGh4L1d5dVE5Rk1JbWtwN0NJTkZqQ3dr?=
 =?utf-8?B?KzVFbktOTHNkdXFpbHlTSjEyOTlzbmF5SWlLSFNHMXNvWDg1UnRJOVlReTZE?=
 =?utf-8?B?eWJsZkFNUGxDZk9lTjhtODFyUWpLTGM1Tlh3ZnpvS1hsLzczNEFJKzJlTzRh?=
 =?utf-8?B?ZWJQQkxNTGhMS0V6M1ZNVUtxUmdwNjU1MlFhY0c1b2pzSEorS0xCdS9ZV2R3?=
 =?utf-8?B?dGthQ1pUZDNJNWpWWEk5enRzYWZvRFFtcVZLbnJMUDZTT3RpR2hFdGQwaEdX?=
 =?utf-8?B?NEh0VGNFakppNm0rUENaQ0U0QmZRRVJBYUxvd2ZNZU1jTnp6QmdrczZ3SE0y?=
 =?utf-8?B?RmUxYkx5WHhwTWdHMXh2clVUTFlHSzdodGxJUXdubmZhOGM2ODNsQjUxTHlY?=
 =?utf-8?B?eVBhUjBBMzd3VzBkaU90Q0RiS1VTUS83ektsRkVOUVpLeXdmZ1ljS284TEtj?=
 =?utf-8?B?SzlLeWRNRm12MmxwVVRuaS9zdWNVQitkdGlRVDN3WHo1eXlJY2JscUgyTXE3?=
 =?utf-8?B?MzhlUmxvTWV2Mk1qMkNoMjdJSkt5OUtxVHhZY20xOFF1YkNBNTY4V01lVFFC?=
 =?utf-8?B?ek9ITnJ3M2tpY1kzZjZaR1cxb3JJSkVlaDVPNnZ4NFlzbXMzRWtLV3NQR2Yz?=
 =?utf-8?B?emhKQkV3SFlkNVNTUjI0MENUbnVKN2JodEZkb1ZERkZRMFI1aVUvVXd3bEZi?=
 =?utf-8?B?bnptRlkrWHEvaXdyRnpoRVkyU09lcHFFSmRVMDFHaWJ0MUxSVFBZY2dETjRu?=
 =?utf-8?B?Um1tRldqQnhvdXUzNnUvUHlsWWQvWGxDY1FaaHg5VUJmdlFVaXAyaXRVcEFS?=
 =?utf-8?B?Z2RqL3paWUZqZE9rcGt6YjhiUFhRUmNLdjJKQkxLMmpNb3FUSndFWkw5Y3hK?=
 =?utf-8?B?N205Wi8zaU9zQXU3b2pWdlRRVmhLNEc2bDVET3RXc0R3VkJ1Z3dFOGlMckdM?=
 =?utf-8?B?Zi9oalJ5MlJKNGxieDAzZGMzT3RhNjNhQnYxekwwWkJ4ekdIS2tTTzV2VkpV?=
 =?utf-8?B?bW8rSTd2aGtQZHdGMlh3UWtLamhyMXFzZU00ZWlOc1UzdUcyR0VkSGc0cHY3?=
 =?utf-8?B?b3VFNlRaaWtnWkVnTXVhQ1RONzN3eS9DcHVxbVZBZ2pIeUcwL1NTRGUwMXU4?=
 =?utf-8?B?bzhhV1dzYlh2cnFGM3E1eDJIdjFzTlF3Zm5pM2tzWDJxRkMyWC8rM3E2WW00?=
 =?utf-8?B?ZHE0eW9zNlM0cGRjcTB0TVo0VFpjQmg0cGcvckphVDhieDkwQU93OW1pdFkx?=
 =?utf-8?B?UGs4bzlLbmNoenNTeHFLYW5WSjNkSGpYVWtFTUo3Uy9EUjVFeXJmck5URFg0?=
 =?utf-8?B?a2NtK2tnZWg1N2pmdVNjQWovU01nbzVrOHZVN213UTE1NDYrdGtLM1V6Q2Zu?=
 =?utf-8?B?M1RGeWZKMkhJQVF1VXhJM3ZWNmE5eEd1NElSNEs2Z29zamFhU2ZsNkpIMity?=
 =?utf-8?B?aXM2eno5dWYySStFU0hCTWszb0lpUUl0WWxJdEVNR2UwWk16TzQ2WjVrVlk0?=
 =?utf-8?B?WDNLcVMyYjNyVWU5RGg4dnhKNXJSU2VQWVVoaDRXc3k1NVRLalhPSFBTZFQ0?=
 =?utf-8?B?UFF6aUtlZUVsZUcyZEk0eTU0YzlUaDh6enFDRnd6QlU5d0swNEVvQ3MydmpP?=
 =?utf-8?B?MmlLQVgzc0J3SUVTQ1VaRDZSSG82ZnlRVXZraEs2TTFiMUJ2ZE1UQVVZeUlv?=
 =?utf-8?B?eFZBTGJkSURac1dFM2liOTVmRGE4ZTRsK0dZVzNkWHFXSS9JME9ZVk5wZE5z?=
 =?utf-8?B?QmFBRFdyMnZ2T2NYeGxPc2drM3hMUVVQK0RWSGxVZ3NrWXNxblZqQWo5U1Jp?=
 =?utf-8?Q?GBRg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62d0369-00eb-49b5-2086-08db6c28e496
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 16:11:49.2451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhvM4M5jmkOTXOdzXSf7SuO972QBA/4WtZ3biYpU/15DDUzAinzDbO9ZwJcwGH7DigPtQlRizM4b279N3oMge1vp0GmpLM57wMIqSpee91E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9604
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMDEvMTFdIGkyYzogRW5oYW5jZSBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJ
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgMTI6NDXigK9Q
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlIGkyY19uZXdfYW5jaWxs
YXJ5X2RldmljZQ0KPiA+ID4gQVBJIE9uIE1vbiwgSnVuIDEyLCAyMDIzIGF0IDEwOjQz4oCvUE0g
V29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz4NCj4gd3JvdGU6DQo+ID4gPiA+ID4gUGVyaGFw
cyB3ZSBzaG91bGQgZmlyc3QgdGhpbmsgdGhyb3VnaCB3aGF0IGFuIGFuY2lsbGFyeSBkZXZpY2UN
Cj4gPiA+ID4gPiByZWFsbHkgaXMuICBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQgaXMgdXNl
ZCB0byB0YWxrIHRvDQo+ID4gPiA+ID4gc2Vjb25kYXJ5IGFkZHJlc3NlcyBvZiBhIG11bHRpLWFk
ZHJlc3MgSTJDIHNsYXZlIGRldmljZS4NCj4gPiA+ID4NCj4gPiA+ID4gQXMgSSBtZW50aW9uZWQg
c29tZXdoZXJlIGJlZm9yZSwgdGhpcyBpcyBub3QgdGhlIGNhc2UuIEFuY2lsbGFyeQ0KPiA+ID4g
PiBkZXZpY2VzIGFyZSB3aGVuIG9uZSAqZHJpdmVyKiBoYW5kbGVzIG1vcmUgdGhhbiBvbmUgYWRk
cmVzcy4NCj4gPiA+ID4gRXZlcnl0aGluZyBlbHNlIGhhcyBiZWVuIGhhbmRsZWQgZGlmZmVyZW50
bHkgaW4gdGhlIHBhc3QgKGZvciAgYWxsDQo+ID4gPiA+IHRoZQ0KPiA+ID4gdXNlcyBJIGFtIGF3
YXJlIG9mKS4NCj4gPiA+ID4NCj4gPiA+ID4gWWV0LCBJIGhhdmUgYW5vdGhlciBpZGVhIHdoaWNo
IGlzIHNvIHNpbXBsZSB0aGF0IEkgd29uZGVyIGlmIGl0DQo+ID4gPiA+IG1heWJlIGhhcyBhbHJl
YWR5IGJlZW4gZGlzY3Vzc2VkIHNvIGZhcj8NCj4gPiA+ID4NCj4gPiA+ID4gKiBoYXZlIHR3byBy
ZWdzIGluIHRoZSBiaW5kaW5ncw0KPiA+ID4gPiAqIHVzZSB0aGUgc2Vjb25kIHJlZyB3aXRoIGky
Y19uZXdfY2xpZW50X2RldmljZSB0byBpbnN0YW50aWF0ZSB0aGUNCj4gPiA+ID4gICBSVEMgc2li
bGluZy4gJ3N0cnVjdCBpMmNfYm9hcmRfaW5mbycsIHdoaWNoIGlzIG9uZSBwYXJhbWV0ZXIsDQo+
IHNob3VsZA0KPiA+ID4gPiAgIGhhdmUgZW5vdWdoIG9wdGlvbnMgdG8gcGFzcyBkYXRhLCBlLmcg
aXQgaGFzIGEgc29mdHdhcmVfbm9kZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2hvdWxkIHdvcmsgb3Ig
ZGlkIEkgbWlzcyBzb21ldGhpbmcgaGVyZT8NCj4gPiA+DQo+ID4gPiBUaGF0IHNob3VsZCB3b3Jr
LCBtb3N0bHkgKGkyY19uZXdfZHVtbXlfZGV2aWNlKCkgYWxzbyBjYWxscw0KPiA+ID4gaTJjX25l
d19jbGllbnRfZGV2aWNlKCkpLiAgQW5kIGFzIGkyY19ib2FyZF9pbmZvIGhhcyBhbiBvZl9ub2Rl
DQo+ID4gPiBtZW1iZXIgKHNvbWV0aGluZyBJIGhhZCBtaXNzZWQgYmVmb3JlISksIHRoZSBuZXcg
STJDIGRldmljZSBjYW4NCj4gPiA+IGFjY2VzcyB0aGUgY2xvY2tzIGluIHRoZSBEVCBub2RlIHVz
aW5nIHRoZSBzdGFuZGFyZCB3YXkuDQo+ID4NCj4gPiBMb29rcyBsaWtlLCBJIGNhbm5vdCBhc3Np
Z24gb2Zfbm9kZSBtZW1iZXIgbGlrZSBiZWxvdyBhcyBpdCByZXN1bHRzIGluDQo+ID4gcGluY3Ry
bCBmYWlsdXJlWzFdIGR1cmluZyBkZXZpY2UgYmluZC4NCj4gPg0KPiA+IGluZm8ub2Zfbm9kZSA9
IGNsaWVudC0+ZGV2Lm9mX25vZGU7DQo+ID4NCj4gPiBbMV0NCj4gPiBwaW5jdHJsLXJ6ZzJsIDEx
MDMwMDAwLnBpbmN0cmw6IHBpbiBQNDNfMCBhbHJlYWR5IHJlcXVlc3RlZCBieSAzLTAwMTI7DQo+
ID4gY2Fubm90IGNsYWltIGZvciAzLTAwNmYgcGluY3RybC1yemcybCAxMTAzMDAwMC5waW5jdHJs
OiBwaW4tMzQ0DQo+ID4gKDMtMDA2Zikgc3RhdHVzIC0yMiBwaW5jdHJsLXJ6ZzJsIDExMDMwMDAw
LnBpbmN0cmw6IGNvdWxkIG5vdCByZXF1ZXN0DQo+ID4gcGluIDM0NCAoUDQzXzApIGZyb20gZ3Jv
dXAgcG1pYyAgb24gZGV2aWNlIHBpbmN0cmwtcnpnMmwNCj4gPiByYWEyMTUzMDAgMy0wMDZmOiBF
cnJvciBhcHBseWluZyBzZXR0aW5nLCByZXZlcnNlIHRoaW5ncyBiYWNrDQo+IA0KPiBXaGVyZSBk
byB5b3UgaGF2ZSBhIHJlZmVyZW5jZSB0byBwaW4gUDQzXzAgaW4geW91ciBEVD8NCg0KVGhlIHJl
ZmVyZW5jZSB0byBwaW4gUDQzXzAgaXMgYWRkZWQgaW4gdGhlIFBNSUMgbm9kZS4NCg0KSSBoYXZl
IGRvbmUgbW9kaWZpY2F0aW9uIG9uIG15IGJvYXJkIHRvIHRlc3QgUE1JQyBJTlQjIG9uIFJaL0cy
TCBTTUFSQyBFVksNCmJ5IHdpcmluZyBSODMgb24gU29NIG1vZHVsZSBhbmQgUE1PRDAgUElONy4N
Cg0KPiBUaGUgbGFzdCB2ZXJzaW9ucyB5b3UgcG9zdGVkIGRpZCBub3QgaGF2ZSBhbnkgcGluY3Ry
bCBwcm9wZXJ0aWVzPw0KDQpCeSBkZWZhdWx0LCBQTUlDX0lOVCMgaXMgbm90IHBvcHVsYXRlZCBS
Wi9HMkwgU01BUkMgRVZLLCBzbyBJIGhhdmVuJ3QgYWRkZWQNClN1cHBvcnQgZm9yIFBNSUNfSU5U
IyBmb3IgdGhlIHBhdGNoZXMgcG9zdGVkIHRpbGwgZGF0ZS4gDQoNClllc3RlcmRheSBJIGNoZWNr
ZWQgd2l0aCBIVyBwZW9wbGUsIGlzIHRoZXJlIGEgd2F5IHRvIGVuYWJsZSBQTUlDX0lOVCMNCmFu
ZCB0aGV5IHRvbGQgbWUgdG8gZG8gdGhlIGFib3ZlIEhXIG1vZGlmaWNhdGlvbi4NCg0KVG9kYXkg
SSBmb3VuZCB0aGlzIGlzc3VlLCB3aXRoIHRoaXMgbW9kaWZpZWQgSFcgYW5kIFBNSUMgSU5UIyBl
bmFibGVkIG9uIHRoZSBEVCwNCndoaWxlIGFzc2lnbmluZyBvZl9ub2RlIG9mIFBNSUMgd2l0aCBp
bmZvLm9mX25vZGUuIEl0IGlzIGp1c3QgYSBjb2luY2lkZW5jZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo=
