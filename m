Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C60726647
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 18:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjFGQsA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 12:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjFGQr7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 12:47:59 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9A01FF5;
        Wed,  7 Jun 2023 09:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSb1MX9vNatIwCjM1gbI9Fu1+j7mEM5cEpzrdP/e6IouBjHDRjDhJoR2dGu80FsuNbxChHwq2XBfP+ungEdgujFM/CavnLHfJLZMZ96K2Kk+d1UxEQ1qYDO6qrMCSkJLbXDRDPjhiOSgZIjgnsAVV4pBH3XQn9bsI0kNBmw4RaWmTlmpjZ+J/ZZgJL/WRhFRa5V9A04VC93AsBt4ROxJ+iAWRHJ8flS2Q+S4aOMOHtjz7ehGdgf3zN03vPOESqCkfMHBfVwtNbc73guAFNbzfvKVAdqC8GzQxXqoVymaPcMr+PkvT6TBAjU6KrYsekK2kLBmlHPI1sJxNxh7mDqVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjsK3/7nPwHmsNUV1tzdLuwnAfkhgnltKs8lYG952zo=;
 b=U81ScU5iIoLmAR+1/wBLz6Sg3gDzqH9m+nUJgBjpOfxlEMUAzPgOai7NnJnoQ6ie/wEeUC3o3Cav9qTbqBD0htzOVOVvjdspg11MdNJg4Gl3HMZ2KjIpxqmamsnsm6zM/j+ojuBOcNjplk3Gl4b+mNdny/KbANF7h3NEyk5OGbpHFW0v4wcVugdZa3zUIJ5oY6e/5swOZASDt+YPE0lqvkz1qV5lmvp0iFbxlPiFKB4BZ/Ad1AEahWQAZVpHsZkd8kwCnKYlG6p6UMTCDktrLsiBBt4Ov+vjj7DeIqUWedX0K/JQ5jvlYnrpcXNyf+9jZxRQv8ZwjNNFDH7VyrvnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjsK3/7nPwHmsNUV1tzdLuwnAfkhgnltKs8lYG952zo=;
 b=juEEVGLyY2Cz9t6rYcKq+33jS0FeUp578IA7ITMOkFWOniuWeheoNGugojOCMq9Xta+AeZamfZuM7Kf2GvYBKb6ijbpR2H60K6e/jKZAFxqh3d2YdWWwIdBBP0DdpHdD/E6I1IbkVG3hSwUvqW3voZhZGZ6CdvaklSvB4g1QcLY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9768.jpnprd01.prod.outlook.com (2603:1096:604:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 16:47:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Wed, 7 Jun 2023
 16:47:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH v3] i2c: Add i2c_get_match_data()
Thread-Index: AQHZmHeP0tU6ipLwP0StWgcCj8giXq9+63MggAAodQCAAA54gIAAbADg
Date:   Wed, 7 Jun 2023 16:47:51 +0000
Message-ID: <OS0PR01MB59224879E7A4E8C8C96D852B8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVXekgea3biJXXNb3fa-8Fe3iUJ=K51jKnu9ew_+Fq69g@mail.gmail.com>
 <ZIBZ4RzFvLN368nQ@shikoro>
In-Reply-To: <ZIBZ4RzFvLN368nQ@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9768:EE_
x-ms-office365-filtering-correlation-id: 46e1796a-2c19-42ab-29de-08db6776eeb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: okLW5Owlt5G2kJoa2jiQKOWtrjbPC16EUZ6AGhS8Oep8SmELcJtPsZsYo7QZv83/vQgXo57xNO6VR74resUt9/jfKnYiFbK7xMnF1ZdwdVjjEReon5x7EofU4wjjOiY/1D3hMHbSGorj2iE4OQoxAgrc/UeGyIGoKV3S/0tpc9L3ySvwm+qq8GwY6CT+v19O8Azl8fWTGs5UJRoDHRZ4tXzBqQ7zq47Sf4cqwKE6SKzdYeKK7uXrqP+PkYAKs3vegWRcGgh56z/Gc/+6n+ihLF+aUvfuGIsdUw/fHdV+W28cmcxpR/76E9bTrpbKbUvkr34sSRErV79NAo3QbYYsDqQh9/9niJuS+4Zst8VWq11OTn+vkgoTWLYIqmei3YkN2yyRtlGdkXcdZVlsbp1bFVaTElz4vCSor9iSHJ3MyC6iA1/0KTo3jG5ksPs0qCyHtbmVpxItAU3lMJAbjl9DazbcnTb2FBK6mrt+8w6eZrhxR6c3bC9ptVv9Ts4+6Y8Jf/f7cnBH5lYOERV/FGD3hKIwg/AgTwaO1IcM2cidHo32F6BLEvtpIiienEhAiXRKRYu8Qd0OBMi8uC7HgTgAxBOHc0R1PS0aMbtA9ewBccxbWwLwQNNKRgLVya4d1Bor
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(478600001)(2906002)(4744005)(7696005)(71200400001)(33656002)(38070700005)(6506007)(86362001)(9686003)(186003)(122000001)(38100700002)(5660300002)(110136005)(316002)(8676002)(8936002)(66946007)(76116006)(66556008)(66446008)(4326008)(66476007)(64756008)(52536014)(55016003)(54906003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dgpewNBMbBaIatECbpxO6Hlq33Eb1JZjF/sh4tuN7rt9UyCOumxUqdtuMUYe?=
 =?us-ascii?Q?pnMJdvqsydsq5jJK3sO+ewFiTPKHnxTH1Q8JIOBnBV3Dkuo4oa/kVtKdzgy8?=
 =?us-ascii?Q?2rIX1rAgNLBo4nY+u5QPFpigGBA7FQUkoGtYbIQGEaZb7ncFm5jDiKaRqWgQ?=
 =?us-ascii?Q?D5HdmMFNgLSnUzpwO3tRgUSmXJ9oKFvaN0kLnpLpR0BmKvon+nAh9p7ukwXl?=
 =?us-ascii?Q?6Y3RkehvsfjrBiYqApYO3HhtLPYweGIqWPCm+ANdcfX6BrgF69Om1iW2Y1eg?=
 =?us-ascii?Q?KtDn4PAZKZVNqTum4b/wRyxFUJdiuMhb63uWC+9vqbUqjLvi0u04mYZEmct2?=
 =?us-ascii?Q?0BXscKwjxIaDDu3zGrUIC4lI4pcCLERxl2n5TQaAMcfQn9htuLvl+1udEep4?=
 =?us-ascii?Q?tlwA2tAycOCRbdiTFKIeWO04jtz12tEuc6I5xQ9Eo1/nTf7dalHXOcXRKpu3?=
 =?us-ascii?Q?GbYL3BjqPo3FjFrAng2+JT4D+ZRKJj9hcklVroulxRL3PjRaglTNLpGDddFe?=
 =?us-ascii?Q?c7bWwyie3wQ+CWCJgoSCVRBHhQF7f6fp4IE+/5ohRVaotB5Tw2Yoy+5wUusb?=
 =?us-ascii?Q?JRR88y7He2+eyPFUanlCQcW+rt4+si1G30oPxR6T0P3fW7J5ozgiJOR/vcE1?=
 =?us-ascii?Q?toxxCqSmtHPkPBWCr8ZN8Rg5FQzt63kn5XB/HuepDxGeDQ+bXM65oq6HIxcx?=
 =?us-ascii?Q?Ljaya/rHllrmCpSwrcD7JRKh7eQOyQjqYU/hRPgznZH0hRi0OPZrhj/mEBOf?=
 =?us-ascii?Q?E5fVyA9VAxWKSfZQ0Xk0r3FAW9r8gSfdm9JbZHYVZyfHTmRNPH753XCP8qgc?=
 =?us-ascii?Q?Un6Ek4H363+VSjf5CmaG4iok7mvxmFwB9LNkRvs2pl84NuWCx69Em1TCIkVK?=
 =?us-ascii?Q?FSY/us9dQdHmt1/RB5xgCD/6liepKrWHssMyKE9zwuTMm6UO2ToL2lc2TZUQ?=
 =?us-ascii?Q?lSo4b83U0XQ0NHMZ2zI+PiM2xNgJaJxPV6PVC6LvD4CM5SFS/z/DhMa1MA0W?=
 =?us-ascii?Q?eUOSxXm08Wa8bVrc4O3aKdm/J9jMDfUsKVLWVhO/989BZIjLeXx215Pp9Y/H?=
 =?us-ascii?Q?mw54PbnsE6ICEdNdC9VkVF4S0Lo5Us+VJ7wqIakWP/0jhhrXYE2aejPcOGMU?=
 =?us-ascii?Q?u+cWslaIBTTc+GbHuH/qiGIi8epqiTdPSUAHqw2KPPHbn4F1TmedhFQGAeWN?=
 =?us-ascii?Q?BGt8wqwVqjej/RcT/bmk1mVMVg//iH/1h02DGTgXV0TWPwB8ZrYGuWoCl+X5?=
 =?us-ascii?Q?1LPpj4/EEGaOfMRbKR7Zb84aRnIp7N++hSrZCS/ND+R9QM79NIlV5vTXzFa8?=
 =?us-ascii?Q?Gnocm4g/Bz4dYhlWGSUclTaP/g8z5Dm9o2SGe29jDd3KCmcuPwWb/ZSqxboH?=
 =?us-ascii?Q?fMU0sQhFG3Stg3RfUgp2LseLFCdOtQHf63UowJIJPzVUNYGzffiAactkiP2Z?=
 =?us-ascii?Q?xlxxHuR4TCbdtY9GtZCNDv/EHVuE0hoPaB2piIWCBc91VPXqe8Ue0OqnFh+o?=
 =?us-ascii?Q?vKq90Q8q/URVEu0wH08+qCRLf6nS0Z3MCsHo93O7dHiMvFyBblUNjADC2ItU?=
 =?us-ascii?Q?4MDaHKsRY6U0725Qn9U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e1796a-2c19-42ab-29de-08db6776eeb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 16:47:51.1211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7oWUJDmPlYDNV+OVrINds/kILpYG3MQjT51aGV/w1uMsgC3Zxq2yTXJqFw4NDs5WXwRLt3W7iY56RMR+pyjy/qex1giHTXUTq6W53hbea9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9768
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH v3] i2c: Add i2c_get_match_data()
>=20
>=20
> > > +const void *i2c_get_match_data(const struct i2c_client *client) {
> > > +       struct device_driver *drv =3D client->dev.driver;
> > > +       struct i2c_driver *driver =3D to_i2c_driver(drv);
> > > +       const struct i2c_device_id *match;
> > > +       const void *data;
> > > +
> > > +       data =3D device_get_match_data(&client->dev);
> >
> >     if (data)
> >             return data;
>=20
> I like Biju's version a tad more. Except for errors, and especially
> within small functions, I think single exit points are easier to
> understand.

OK, will send V4.

Cheers,
Biju

