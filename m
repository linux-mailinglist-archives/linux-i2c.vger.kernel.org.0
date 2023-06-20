Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2068A7365B3
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 10:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbjFTIG2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 04:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjFTIG0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 04:06:26 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAC9B1;
        Tue, 20 Jun 2023 01:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgE0OTMfGvarb25vKSRZcDS7w0U9rvCBOP/Hf34n0kUo9bp/0wuFPCbWIWAtRdcjbjHXbhcnDyLRL0n3dcJWo/G5HSP0EtuDumg3VmvIZQogSr4Oa8SFZE/vSOXfrm6QMd5HUIIi0+zntkO/4+a9eFWBASzp/PS8WGoocdymJTmp2/QAcNaWZ6sA6DGDEc7pqUYbqzHAIsi4NeHOBRxdDwLjv8iWnrbRpIa7Jo8ka3w+UuWz55DoQLOsxI9ebuMcqo4BzoGkrSq8hmdObCRkJgPtVU1Ys/J3P8Gng9T19YXBB78+R4mEEUKUmB00eojFke8W8PnjOS1qxzhGbLTe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnbBCcmMWP2SJCzozlwwKLcnxWDeuN+5gg0xWxTDzfY=;
 b=SKYXT5d6GcuwfK4pBW5zdy0P7RskU2+cGKkiU7QECzCjhHwpPJPpYz7JuPNbC7wrv7ydlbA0N5CCS0dD5k2N04J3Z4XHM+tP+JAG6y4Sv8B7suK1i1booWAMDG/yS8lzN4/BSWXLZDCSHGnc+FFLZZhoC9pCsMtqF6JmqrdOmrHrRPAh0yS4CILStnXg/GI4DIzmSEWbzSfgq+3o7i+kfRo/wtK5AXXjbawZu+1TjKr3jBwwBpfirZ2yDcNUya1N8UnspVb2V70bT4XKWXyl+4v7TJkS2UQ2MAXNYkUQoyCTJK3y9c1gipdjdStfIsjJyCJIAeo7987NkVqCTw0erQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnbBCcmMWP2SJCzozlwwKLcnxWDeuN+5gg0xWxTDzfY=;
 b=EB5ae2ugbbSXxLuCpFGbKjqPVWZuvJ+SoBntfRz/MH971B7RcyNKn7BXMEHPvkUqXru0Y6T59Zg9J+8eYk5MtdtdiqkLnYwSj9+EkUeQ4qkuoXDdHFm5wd8TnHUZ4b6ofyHPb9Y3r0Z2MP9y8A/U1U6xUTpH7+GNX04In2aMr+A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10254.jpnprd01.prod.outlook.com (2603:1096:400:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 08:06:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 08:06:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACwEcCAAD30wIAAjmJQgADWpQCAAAETwIAAGzEAgAAT4OCAAXaogIAHxFMg
Date:   Tue, 20 Jun 2023 08:06:20 +0000
Message-ID: <OS0PR01MB5922CCE963E1C544EDC8829E865CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614081314.GD17519@pendragon.ideasonboard.com>
 <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614095424.GJ28480@pendragon.ideasonboard.com>
 <OS0PR01MB592279423F94849882512AED865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230615092629.GG741@pendragon.ideasonboard.com>
In-Reply-To: <20230615092629.GG741@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10254:EE_
x-ms-office365-filtering-correlation-id: c634c6fb-4cd6-4880-6da2-08db71653b71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fJeaN6OylXQQy8tU0jFu9AdEZudzsxRrjDYlqJ+tysWymE2m3K3MP5F68R6JBdYlbWU2+yT7Gj/eAOOS4OBbHb2d5B4FXLHUAEE4HXYZImvxeNEWxCFmDGTcKdN5+UWjpDygREBPUgTMsARtDAGa/ZCyCvDKSwi2qK/qihkA4w5HrUI6WvNwuCDhXahVWYaGRvkzC8/OC3+GLXAiQwHXO4ODKc0zYS2G9v5PBKgt5BCKdCkPsgMsf8I2V6oTQK+/n6MfvkZFj8MTkTiK3r+uViboPeWiRJaVOz18xx7TzJEkzKxcFk3rTS90pMSgkimLedPm6fPIOQO2NsA2EIbVnw319tDlRo8yu9s6uFcoCK/jDnYTp32bW7Zh4IJluQrHQJLzmA6ulVYEN2zp+xp0yfzuQck9YjblVmUnBxE4SEcxydvvv2CARnZGJ3CbGYYVWJSyKV9W7SQvNFtyH0aQHqgANqD4j88B3GIolxI3LcdiubVOmJ0OpLE0nMqa5+/j4ySiauJAx2cMyvWd5kqh1+AjS5RMkGStEL/rmfmLiVTj543vGHs/ZGz1JjoqP0LKIOoz9sg9xiDtLSsvwn/xy3cXfa69pemLRxstyb/pQj9mLAB5jtmiXQ6S4NawbeQM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(66556008)(66946007)(8936002)(8676002)(64756008)(66446008)(186003)(66476007)(66899021)(5660300002)(54906003)(76116006)(7696005)(71200400001)(33656002)(316002)(38100700002)(478600001)(41300700001)(4326008)(26005)(6506007)(9686003)(6916009)(55016003)(7406005)(7416002)(83380400001)(38070700005)(2906002)(122000001)(52536014)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0VucjRicXZNeEl5aXpJNVhrUUF4N3ZzbithQlJhZ2Y2Y0tTQytURjhrcVZv?=
 =?utf-8?B?UE9EZkMzNkxQUTdNVDNJMndUREFRU2VHUFlmc0VoRUlVb2VqSFV4VVIwSG1W?=
 =?utf-8?B?djArUkZLVnJyWWpvUnNTSDVxK2kzbTNxUXhEUVhCUlFlZmJ2TFB5Ti9pUXdE?=
 =?utf-8?B?N09yc0NwV1RPeFV6Mnc1cjFSNk8zZDFuRGhFWG9hZ1AvUHBobW9oRE1KUGRn?=
 =?utf-8?B?SnNMM25raHFaeHc4WXI0ZnhxQWUranpIODRaWmhwZit6M3NYR2Vjck45dFg2?=
 =?utf-8?B?T3A2eU5WVDREaTFwNmFKaitzU3gvYlNONGs2QW83OHB6aXFyYzR6QTl4L2U4?=
 =?utf-8?B?c2F6bnhpckRTUFA2K0FoRmlVQ3NENXo0N3l3eWdHdFdmUGwvRmdNL0svK2VR?=
 =?utf-8?B?bTlqaVZPNnJJbG1KanJISGgvR3A0OU9wYXFwNVRJeUs3Q1pKdGo5U2I5dGRX?=
 =?utf-8?B?OEt1SFhjN2VUcmJJSnlpbDdJejlSMytwejQ0ZHljTUlhdlpkd3FDaFYxODlh?=
 =?utf-8?B?dlNYU3h2WHR6aC9aS3ZRc200Y2ZKckhLQjc2cTZyU2VwQnBTSWw3NEFYSkU1?=
 =?utf-8?B?ZXU5cnZVOTRibitvWU9CZGkrUGRIZVllZjA3VklOYmRPRm5TYThIMWdjUnRB?=
 =?utf-8?B?U0RNL1FxZHFVVGt5Y3QycUVRVnVzdTJIVU94REwwNVVhOWs0RWxoLy9GVHpy?=
 =?utf-8?B?S0oyVkFmME4wVTZ1KzJzSE5kbTZhdjNhdXBiaytYTkcvL2EwNnlFTDBWb3RC?=
 =?utf-8?B?Ni9iQktuN1FjckM5TFl3Y3Z4ZDRZRkNIK0pHWVE3SlBtZnc2eUE5TGt2M09l?=
 =?utf-8?B?dmYzayt3NWhJZExBWFYwcFRqZkpmbjJEL3ZxcXpJd1dKVVp5dHBzQU5lcG04?=
 =?utf-8?B?aDR4eTh5Y1V3N1lsZ0FMa0c3OUthMXdhaktjNy9nVnlHR3ZuN3BoYzJIMGll?=
 =?utf-8?B?QnFXVXZRM0VqZ2E1VHZxdDZSRHpLVjJKRHFQWDdNVkJTTEJIc3dVaFhiQnFo?=
 =?utf-8?B?RXFKUHNSRUFMS2VGM2RKenNacjhTb2dZdWl5Y0lSb1ZlZmp6T0hOcFZXR3Va?=
 =?utf-8?B?alh1Y21BdDNTaGFOdDdKWnVidVZGU0JHeW1nWEpXR0hmdUM0NTllSkkxUzZL?=
 =?utf-8?B?VERxN1hYNjh5M05tZm95TWVLMVNjUzlCVFhYUWwzZ1RROUlUQjlJUlArQldR?=
 =?utf-8?B?M0djVEZVQnU4RHlHMkFEWXVtM3VWazRPejZ0akFrL0FsRW45MEtDN0w5UjI2?=
 =?utf-8?B?UloyQmNwbUpKMncxVEhNUEhISEZ4bzJBeWxPQnc2MjVhNTNRTjIxNy9mc0RG?=
 =?utf-8?B?a3FJTEwyRzVUNjdnY25yNVpaR1Z1V2RvZlorM0Z6ZUZBRFY0aGkyU2JneDNS?=
 =?utf-8?B?SjNpaSs3aU1pbURSN1p4ODFBUGNwREJST2NqaHlHZzNuUm9lZDlHZXd4SC8w?=
 =?utf-8?B?RkJ6amF2MEJtVVMwZlBONTFuSndKRWg0anpRR3diU2grSXJZa0R1dHUzOTYx?=
 =?utf-8?B?WFBZZlNKNmc5cUs1YWZQZVBrelROTTBkbWNEaFljYjFITDJIT1QrOEhuOTBS?=
 =?utf-8?B?WHhzQURnTWc0QTVMdUE3MmR2bVl5V2F2QnNyOExHNDRwemJVbFdqZmlJd045?=
 =?utf-8?B?MlBaWEFzdS9EcXV1Ylg2SDd0SGlUc1drdks4dm4zQXRNdHg5NkUvNVlzdzdJ?=
 =?utf-8?B?VnhpdlhOOXREWUt3V1J4cHZ6L3Z5ajN1bFNSa1JFR3FiaElsVDFPT2d1czNH?=
 =?utf-8?B?dDhGa3VUQ1JJbjlJMmRITmFuTE1hZlhWQnJtRzErdTBCbG9sZkcrU0xlcjVl?=
 =?utf-8?B?OXFNZGE5bnRXVk16ejc3alFwR1psSWhJUThuaG02RDd4RFBWNkwzU1E4RWJv?=
 =?utf-8?B?cVQxZHJFVlJEWkhRLzIwU3p3cHJxY3BuYUo3dUpyNTRHLzRaNUVJUS9wQ21o?=
 =?utf-8?B?Q1g1WjYvVFFzZU5OWG1vK0ErMjlpNHpyTXR5VDFTSzdmYUw0cFJ6VnNzVmNG?=
 =?utf-8?B?OVhSOUxQMmFzR25aTjJLU0d0em55Q1MvZ3VYNTN6a2dKZHNwT2w2ZlJab2M4?=
 =?utf-8?B?bjE3QU9YaXA1cWUwaW9DYVQvd25EcFEvSE5qRXpsanpYNUZvUHF0NzBlclg0?=
 =?utf-8?Q?Vo6ha2/zS0LSTTtZc3nQ4OcIG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c634c6fb-4cd6-4880-6da2-08db71653b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 08:06:20.5950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wg+M/6wmQP0iKJYieQkvkBw5nJuOgNLLTUF+zMo0lTsXvBzaYVEq/NKWVKmwhIAVqVHcawY+k/KqW2TM4jDoVzBW90YCrI/wFGZ0OkHfFbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10254
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFu
Y2UgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0KPiANCj4gT24gV2VkLCBKdW4gMTQsIDIw
MjMgYXQgMTE6MzA6NDhBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNl
DQo+ID4gPiBBUEkgT24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMDg6MjE6MzhBTSArMDAwMCwgQmlq
dSBEYXMgd3JvdGU6DQo+ID4+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6
IEVuaGFuY2UNCj4gPj4gPiA+IGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBBUEkNCj4gPiA+ID4g
PiBPbiBUdWUsIEp1biAxMywgMjAyMyBhdCAwNzozMTo0NlBNICswMDAwLCBCaWp1IERhcyB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhh
bmNlDQo+ID4gPiA+ID4gPiA+IGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBBUEkNCj4gPiA+ID4g
PiA+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UNCj4gPiA+
ID4gPiA+ID4gPiBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJDQo+ID4gPiA+ID4gPiA+ID4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UNCj4gPiA+ID4gPiA+
ID4gPiA+IGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBBUEkNCj4gPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiBIaSBldmVyeW9uZSwNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+ID4gPiA+IFBlcmhhcHMgd2Ugc2hvdWxkIGZpcnN0IHRoaW5rIHRocm91Z2ggd2hhdCBh
bg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBhbmNpbGxhcnkgZGV2aWNlIHJlYWxseSBpcy4gIE15IHVu
ZGVyc3RhbmRpbmcgaXMgdGhhdA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBpdCBpcyB1c2VkIHRvIHRh
bGsgdG8gc2Vjb25kYXJ5IGFkZHJlc3NlcyBvZiBhIG11bHRpLQ0KPiBhZGRyZXNzIEkyQyBzbGF2
ZSBkZXZpY2UuDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gQXMgSSBtZW50
aW9uZWQgc29tZXdoZXJlIGJlZm9yZSwgdGhpcyBpcyBub3QgdGhlIGNhc2UuDQo+ID4gPiA+ID4g
PiA+ID4gPiBBbmNpbGxhcnkgZGV2aWNlcyBhcmUgd2hlbiBvbmUgKmRyaXZlciogaGFuZGxlcyBt
b3JlDQo+IHRoYW4gb25lIGFkZHJlc3MuDQo+ID4gPiA+ID4gPiA+ID4gPiBFdmVyeXRoaW5nIGVs
c2UgaGFzIGJlZW4gaGFuZGxlZCBkaWZmZXJlbnRseSBpbiB0aGUgcGFzdA0KPiA+ID4gPiA+ID4g
PiA+ID4gKGZvciBhbGwgdGhlIHVzZXMgSSBhbSBhd2FyZSBvZikuDQo+ID4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+ID4gWWV0LCBJIGhhdmUgYW5vdGhlciBpZGVhIHdoaWNoIGlzIHNv
IHNpbXBsZSB0aGF0IEkNCj4gPiA+ID4gPiA+ID4gPiA+IHdvbmRlciBpZiBpdCBtYXliZSBoYXMg
YWxyZWFkeSBiZWVuIGRpc2N1c3NlZCBzbyBmYXI/DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiA+ID4gKiBoYXZlIHR3byByZWdzIGluIHRoZSBiaW5kaW5ncw0KPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gT0ssIGl0IGlzIGlubGluZSB3aXRoIERUIG1haW50YWluZXJz
IGV4cGVjdGF0aW9uIGFzIGl0IGlzDQo+ID4gPiA+ID4gPiA+ID4gbWF0Y2hpbmcgd2l0aCByZWFs
IGh3IGFzIHNpbmdsZSBkZXZpY2Ugbm9kZSBoYXZpbmcgdHdvDQo+IHJlZ3MuDQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ICogdXNlIHRoZSBzZWNvbmQgcmVnIHdpdGggaTJjX25l
d19jbGllbnRfZGV2aWNlIHRvDQo+IGluc3RhbnRpYXRlIHRoZQ0KPiA+ID4gPiA+ID4gPiA+ID4g
ICBSVEMgc2libGluZy4gJ3N0cnVjdCBpMmNfYm9hcmRfaW5mbycsIHdoaWNoIGlzIG9uZQ0KPiBw
YXJhbWV0ZXIsIHNob3VsZA0KPiA+ID4gPiA+ID4gPiA+ID4gICBoYXZlIGVub3VnaCBvcHRpb25z
IHRvIHBhc3MgZGF0YSwgZS5nIGl0IGhhcyBhDQo+IHNvZnR3YXJlX25vZGUuDQo+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBPSywgSSBjYW4gc2VlIHRoZSBiZWxvdyBjYW4gYmUgcGFz
c2VkIGZyb20gUE1JQyB0byBuZXcNCj4gY2xpZW50IGRldmljZS4NCj4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+IAljbGllbnQtPmFkZHIgPSBpbmZvLT5hZGRyOw0KPiA+ID4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiA+ID4gCWNsaWVudC0+aW5pdF9pcnEgPSBpbmZvLT5pcnE7DQo+ID4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBTaG91bGQg
d29yayBvciBkaWQgSSBtaXNzIHNvbWV0aGluZyBoZXJlPw0KPiA+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+ID4gSSBndWVzcyBpdCB3aWxsIHdvcmsuIFdlIGluc3RhbnRpYXRlIGFwcHJvcHJp
YXRlIGRldmljZQ0KPiA+ID4gPiA+ID4gPiA+IGJhc2VkIE9uIFBNSUMgcmV2aXNpb24gYW5kIHNs
YXZlIGFkZHJlc3MgYW5kIElSUSByZXNvdXJjZQ0KPiA+ID4gPiA+ID4gPiA+IHBhc3NlZCB0aHJv
dWdoICdzdHJ1Y3QgaTJjX2JvYXJkX2luZm8nDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gPiBXaWxsIGNoZWNrIHRoaXMgYW5kIHVwZGF0ZSB5b3UuDQo+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+IGluZm8uaXJxID0gaXJxOyAtLT5JcnEgZmluZQ0KPiA+ID4gPiA+ID4gPiBpbmZv
LmFkZHIgPSBhZGRyOyAtLT5zbGF2ZSBhZGRyZXNzIGZpbmUgc2l6ZSA9DQo+ID4gPiA+ID4gPiA+
IHN0cnNjcHkoaW5mby50eXBlLCBuYW1lLCBzaXplb2YoaW5mby50eXBlKSk7DQo+ID4gPiA+ID4g
PiA+IC0tPmluc3RhbnRpYXRpb24gYmFzZWQgb24gUE1JQyB2ZXJzaW9uIGZpbmUuDQo+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+IDEpIEhvdyBkbyB3ZSBzaGFyZSBjbGsgZGV0YWlscyBvbiBp
bnN0YW50aWF0ZWQgZGV2aWNlIHRvDQo+ID4gPiA+ID4gPiA+IGZpbmQgaXMgaXQgY29ubmVjdGVk
IHRvIGV4dGVybmFsIGNyeXN0YWwgb3IgZXh0ZXJuYWwgY2xvY2sNCj4gPiA+ID4gPiA+ID4gc291
cmNlPyBhcyB3ZSBjYW5ub3QgcGFzcyBvZl9ub2RlIGJldHdlZW4gUE1JQyBhbmQNCj4gPiA+ID4g
PiA+ID4gImkyY19ib2FyZF9pbmZvIiBhcyBpdCByZXN1bHRzIGluIHBpbmN0cmwgZmFpbHVyZS4N
Cj4gPiA+ID4gPiA+ID4gaW5mby0+cGxhdGZvcm1kYXRhIGFuZA0KPiA+ID4gPiA+ID4gPiBDbGll
bnQtPmRldi5wbGF0Zm9ybWRhdGEgdG8gcmV0cmlldmUgdGhpcyBpbmZvPz8NCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBPcg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkyQyBpbnN0YW50aWF0
aW9uIGJhc2VkIG9uIGFjdHVhbCBvc2NpbGxhdG9yIGJpdCB2YWx1ZSwgaWUsDQo+ID4gPiA+ID4g
PiB0d28gaTJjX2RldmljZV9pZCdzIHdpdGggb25lIGZvciBzZXR0aW5nIG9zY2lsbGF0b3IgYml0
IGFuZA0KPiA+ID4gPiA+ID4gYW5vdGhlciBmb3IgY2xlYXJpbmcgb3NjaWxsYXRvciBiaXQNCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBQTUlDIGRyaXZlciBwYXJzZXMgdGhlIGNsb2NrIGRldGFp
bHMuIEJhc2VkIG9uIGZpcm13YXJlDQo+ID4gPiA+ID4gPiB2ZXJzaW9uIGFuZCBjbG9jaywgSXQg
aW5zdGFudGlhdGVzIGVpdGhlciBpMmNfZGV2aWNlX2lkIHdpdGgNCj4gPiA+ID4gPiA+IHNldHRp
bmcgb3NjaWxsYXRvciBiaXQgb3IgY2xlYXJpbmcgb3NjaWxsYXRvciBiaXQuDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBJIGRvbid0IGxpa2UgdGhhdCBoYWNrLiBJIHN0aWxsIHRoaW5rIHRoYXQgdHdv
IERUIG5vZGVzIGlzIHRoZQ0KPiA+ID4gPiA+IGJlc3Qgb3B0aW9uLCBJIHRoaW5rIHlvdSdyZSB0
cnlpbmcgaGFyZCB0byBoYWNrIGFyb3VuZCBhIHByb2JsZW0NCj4gPiA+ID4gPiB0aGF0IGlzIGFj
dHVhbGx5IG5vdCBhIHByb2JsZW0uDQo+ID4gPiA+DQo+ID4gPiA+IFdoeSBkbyB5b3UgdGhpbmsg
aXQgaXMgYSBoYWNrPyBJIGJlbGlldmUgcmF0aGVyIGl0IGlzIGFjdHVhbA0KPiA+ID4gPiBzb2x1
dGlvbg0KPiA+ID4gPg0KPiA+ID4gPiBQTUlDIGlzIGEgc2luZ2xlIGRldmljZSwgd2l0aCAyIHJl
Z3MsIGNsb2NrcywgcGluY3RybCBhbmQgSVJRDQo+IHByb3BlcnRpZXMuDQo+ID4gPiA+IFNvIGl0
IHdpbGwgYmUgcmVwcmVzZW50ZWQgYXMgc2luZ2xlIG5vZGUgd2l0aCBzaW5nbGUgY29tcGF0aWJs
ZS4NCj4gPiA+DQo+ID4gPiBUaGUgY2hpcCBpcyBhIHNpbmdsZSBwYWNrYWdlIHRoYXQgY29udGFp
bnMgdHdvIGluZGVwZW5kZW50IGRldmljZXMuDQo+ID4gPiBUaGlzIGlzIG5vdCBkaWZmZXJlbnQg
dGhhbiBidW5kbGluZyBtYW55IElQIGNvcmVzIGluIGFuIFNvQywgd2UgaGF2ZQ0KPiA+ID4gb25l
IERUIG5vZGUgcGVyIElQIGNvcmUsIG5vdCBhIHNpbmdsZSBEVCBub2RlIGZvciB0aGUgU29DLiBU
aGUgZmFjdA0KPiA+ID4gdGhhdCB3ZSdyZSBkZWFsaW5nIHdpdGggYW4gZXh0ZXJuYWwgcGh5c2lj
YWwgY29tcG9uZW50IGhlcmUgaXNuJ3QNCj4gcmVsZXZhbnQuDQo+ID4NCj4gPiBEVCBtYWludGFp
bmVyJ3MgbmV3IHJlcXVpcmVtZW50IGlzIGEgc2luZ2xlIGRldmljZSBub2RlIGZvciBhIGRldmlj
ZS4NCj4gDQo+IFRoYXQncyB0aGUgZGVmYXVsdCBydWxlLCBJIGhhdmVuJ3Qgc2VlbiBhIGNsZWFy
IHN0YXRlbWVudCB0aGF0IGl0IGhhcyB0bw0KPiBhcHBseSB0byAxMDAlIG9mIHRoZSBjYXNlcy4N
Cj4gDQo+IFJlZ2FyZGxlc3MsIGluIHRoaXMgY2FzZSB0aGVyZSBhcmUgdHdvIGRldmljZXMgaW5z
aWRlIGEgcGFja2FnZSwgc28NCj4gaGF2aW5nIHR3byBEVCBub2RlcyBkb2Vzbid0IGJyZWFrIHRo
ZSBydWxlLg0KPiANCj4gPiBJZiBhIGRldmljZSBzdXBwb3J0cyBtb3JlIGZ1bmN0aW9uYWxpdGll
cyBqdXN0IGluc3RhbnRpYXRlIGFuZCBiaW5kDQo+IGl0Lg0KPiA+DQo+ID4gSSBhbHJlYWR5IGdv
bmUgdGhyb3VnaCBtYWlubGluaW5nIE1UVTNhIGRldmljZSwgd2l0aCAzIHNlcGFyYXRlIGR0DQo+
ID4gbm9kZXMgYW5kIGZpbmFsbHkgZW5kcyB1cCBpbiBzaW5nbGUgZGV2aWNlIG5vZGUgaW5zdGFu
dGlhdGluZw0KPiBQV00vQ291bnRlci9UaW1lciBub2Rlcy4NCj4gPg0KPiA+IEhlcmUgYWxzbyBJ
IHN0YXJ0ZWQgd2l0aCAyIGRldmljZSBub2RlcywgYW5kIGVuZHMgdXAgaW4gc2luZ2xlIGRldmlj
ZQ0KPiA+IG5vZGUgYXMgaXQgaXMgYSBzaW5nbGUgZGV2aWNlLg0KPiA+DQo+ID4gSSB0aGluayBm
cm9tIGR0IHBvaW50IGl0IGlzIGNvcnJlY3QgdG8gaGF2ZSBzaW5nbGUgZGV2aWNlIG5vZGUgZm9y
IGENCj4gPiBkZXZpY2UuIGV2ZW4gdGhvdWdoIGRldmljZSBjb250YWlucyBQTUlDIGFuZCBSVEMg
YXMgc2VwYXJhdGUNCj4gPiBmdW5jdGlvbmFsaXR5IFdpdGggc2hhcmVkIHJlc291cmNlcyBsaWtl
IElSUSwgUElOUyBhbmQgQ2xvY2tzIGFzIGF0DQo+ID4gdGhlIFBNSUMgZGV2aWNlIGlzIHRoZSBv
bmUgZXhwb3NlcyB0byB0aGlzIHRvIG91dHNpZGUgd29ybGQuDQo+ID4NCj4gPiA+ID4gQnkgaW5z
dGF0aW5nIGEgY2xpZW50IGRldmljZSwgd2UgYXJlIHNoYXJpbmcgdGhlIHJlbGV2YW50DQo+ID4g
PiA+IHJlc291cmNlcyB0byBSVEMgZGV2aWNlIGRyaXZlci4NCj4gPiA+DQo+ID4gPiBCeSBpbnN0
YW50aWF0aW5nIGEgY2xpZW50IGRldmljZSwgeW91IGNyZWF0ZSBhIHNlY29uZCBzdHJ1Y3QgZGV2
aWNlLA0KPiA+ID4gd2hpY2ggaXMgdGhlIGtlcm5lbCBhYnN0cmFjdGlvbiBvZiBhIGhhcmR3YXJl
IGRldmljZS4gVGhpcyBzaG93cyBpbg0KPiA+ID4gbXkgb3BpbmlvbiB0aGF0IHdlJ3JlIGRlYWxp
bmcgd2l0aCB0d28gZGV2aWNlcyBoZXJlLCBoZW5jZSBteQ0KPiA+ID4gcmVjb21tZW5kYXRpb24g
b2YgdXNpbmcgdHdvIERUIG5vZGVzLg0KPiA+DQo+ID4gVHdvIERUIG5vZGVzIGlzIHRoZSBwcm9i
bGVtLiBEVCBtYWludGFpbmVyJ3MgZG9uJ3QgbGlrZSBpdCwgZm9yIHRoZW0NCj4gPiBpdCBpcyBq
dXN0IG9uZSBkZXZpY2Ugd2hpY2ggcHJvdmlkZXMgUE1JQy9SVEMgZnVuY3Rpb25hbGl0eS4NCj4g
DQo+IEhhdmUgdGhleSBmb2xsb3dlZCB0aGlzIGRpc2N1c3Npb24gPw0KPiANCj4gPiA+IEFzIHlv
dSd2ZSBub3RpY2VkLCB3aXRoIHR3byBkZXZpY2VzIGFuZCBhIHNpbmdsZSBEVCBub2RlLCBwaW5j
dHJsDQo+ID4gPiBjb21wbGFpbnMuIFlvdSBjYW4gaGFjayBhcm91bmQgdGhhdCBieSBtb3Zpbmcg
dGhlIHBpbmN0cmwNCj4gPiA+IGNvbmZpZ3VyYXRpb24gZnJvbSB0aGUgUE1JQyBEVCBub2RlIHRv
IGFub3RoZXIgRFQgbm9kZSwgYW5kIHRoYXQncw0KPiBvbmUgZmlyc3QgaGFjay4NCj4gPg0KPiA+
IFBNSUMgZGV2aWNlIGV4cG9zZSBwaW5zIGFuZCBpdCBiaW5kcyB0aGUgcGlucyBkdXJpbmcgcHJv
YmUuIFNpbmNlIGl0DQo+ID4gaXMgYSBzaW5nbGUgZGV2aWNlLCB3ZSBkb24ndCBuZWVkIHRvIHNo
YXJlIHRoaXMgdG8gUlRDIGRldmljZS4gV2UganVzdA0KPiA+IG5lZWQgdG8gYWRkIHBpbmN0cmwg
ZGVmaW5pdGlvbnMgaW4gUE1JQyBkZXZpY2Ugbm9kZS4gVGhpcyBpcyBub3QgYQ0KPiBoYWNrLg0K
PiA+DQo+ID4gPiBUaGVuLCB5b3UnbGwgbmVlZCB0byBoYXZlIHR3byBkaWZmZXJlbnQgZGV2aWNl
IElEcyBkZXBlbmRpbmcgb24gdGhlDQo+ID4gPiBQTUlDIHZlcnNpb24gdG8gbGV0IHRoZSBSVEMg
ZHJpdmVyIHNldCB0aGUgb3NjaWxsYXRvciBiaXQgY29ycmVjdGx5LA0KPiA+ID4gYW5kIHRoYXQn
cyBhIHNlY29uZCBoYWNrLg0KPiA+DQo+ID4gUE1JQyBoYXMgYWxsIHRoZSBpbmZvcm1hdGlvbiwg
c28gaXQgY2FuIGluc3RhbnRpYXRlIGFuZCBiaW5kIHdpdGggdGhlDQo+ID4gY29uZmlndXJhdGlv
biBuZWVkZWQgZm9yIHNlY29uZCBkZXZpY2UuIFNvIGl0IGlzIG5vdCBhIGhhY2suDQo+ID4NCj4g
PiA+IEEgc29sdXRpb24gd2l0aCB0d28gRFQgbm9kZXMgbW9kZWxzIHRoZSBoYXJkd2FyZSBiZXR0
ZXIgYW5kIGlzDQo+IGNsZWFuZXIuDQo+ID4NCj4gPiBCdXQgbG9va3MgbGlrZSBhbGwgb3RoZXIg
cGVvcGxlIGFyZSBoYXBweSB3aXRoIHNpbmdsZSBEVCBub2RlLg0KPiANCj4gQXQgdGhlIGVuZCBv
ZiB0aGUgZGF5LCBpdCdzIG5vdCBteSBkcml2ZXIsIGFuZCBub3QgbXkgc3Vic3lzdGVtcywgc28N
Cj4gSSdsbCBsZXQgeW91IG1ha2UgbWlzdGFrZXMgaWYgeW91J3JlIGhhcHB5IHdpdGggdGhlbS4g
SSBzdGlsbCBzdHJvbmdseQ0KPiB0aGluayBpdCdzIGEgbWlzdGFrZSwgYnV0IEkgY2FuJ3QgZ2V0
IGV2ZXJ5Ym9keSB0byBkbyB0aGluZ3MgcmlnaHQsIGNhbg0KPiBJID8gOi0pDQoNCkFzIFdvbGZy
YW0gc3VnZ2VzdGluZyB0byB1c2UgImkyY19uZXdfY2xpZW50X2RldmljZSIgYW5kIERUIG1haW50
YWluZXIncw0KYXJlIG5vdCByZXNwb25kaW5nIHRvIGhhdmluZyAyIGRldmljZSBub2RlIHNvbHV0
aW9uLCBJIGFtIGdvaW5nIHRvIHN0aWNrIHdpdGggc2luZ2xlIGRldmljZSBub2RlIHNvbHV0aW9u
IGFzIGl0IGlzIG9rIGZvciBEVCBtYWludGFpbmVycy4NCg0KUGxlYXNlIGxldCBtZSBrbm93IGlm
IGFueW9uZSB0aGluayBvdGhlcndpc2UuDQoNCkNoZWVycywNCkJpanUNCg==
