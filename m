Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9520F7A62C4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 14:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbjISMXo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 08:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjISMXn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 08:23:43 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF27F4;
        Tue, 19 Sep 2023 05:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHdBDoPBieGW5/+3qzqPUXv1ZJDuqejMgZHEwGEa3j8B1PdCceAHnlLZ8uMwCnoODtzSUsWD52qm4fXI8gVAPmKXe1j18aDluACNQKz6PMX6sI0TXiuOlVv89WUeYMlJ3JNBX4xWuEmOCT10aCU7bCKVDmKO855B+JUulMzXo99X4dCnPcwPspJJG/H1dNiin0yAa7iOKCImzp7/TYs5IFTUJLtUUl450UgRIdxmAPMb8IalKsNQW+HaZswtABTS5Hg/9WDrq2VEpNx0os0Z8hUVmwiF1v9UiTFIjPJMjLGYbz8pGmIvFC76q15c09dXfqiNXeAOVkRKs7g9rKVbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96gpNW+Xk001zfzd2/kg0fBLDzVtO4BvvSmZMcx7/d8=;
 b=TrM4oWOqlE6kkm96dLUyn2N+HT0sq2Ih59xyhR0ME4uhrlGXJgt3GOVva3mxxcbFOb8F0PbsApOwCLyB1x/ipdeHoJ+pfsi52fkY2hxgTn5w0fW/kCQ5VJzySAiaj9IHprYm20UbmG9jS/fbyxKMpvqom33N+XfOBYZTelzP5pQidkbI5P8FARbSFXs8qUscurLYnpMMS9SgHylwIpMrQ48y1K8z8S2H0HnPG2dk1F1Zz4gWjalodXAMiXE0q8MlqhWosZdQh3od39WRVE7dxHzLw6fBd2jvxIcDQkWfiAIQoDR9JoM+5YBcltDh/cx+xk9TQGyCr0hTjhFmfHRW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96gpNW+Xk001zfzd2/kg0fBLDzVtO4BvvSmZMcx7/d8=;
 b=Z6n8016WPJzTvwTrUydpGBpBt0KlyAiFIDIrXlznX8By1ZDiwTZEA7OKtEj+UQiAhQq3HF00PJAiwev9pvgdUkJhxAQ5BgpCYYJxQAPdhgO9+B/ckHg4cHEDRp18NkV7H4aoAYExwZEcajOB3BNZsfPfQbrSQeN8PsoePcvrJAI=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB11592.jpnprd01.prod.outlook.com
 (2603:1096:400:371::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 12:23:33 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 12:23:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] i2c: rcar: add support for Gen4 devices
Thread-Topic: [PATCH 0/2] i2c: rcar: add support for Gen4 devices
Thread-Index: AQHZ5oF5i48p1M7vK0upwV1KcaqiH7AaSXiwgAMO64CABMHbwA==
Date:   Tue, 19 Sep 2023 12:23:32 +0000
Message-ID: <TYBPR01MB5341132B818922E7C01A915FD8FAA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
 <TYBPR01MB5341A56291AFCB54E4918167D8F7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <ZQWUWwi7pR7/negW@shikoro>
In-Reply-To: <ZQWUWwi7pR7/negW@shikoro>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB11592:EE_
x-ms-office365-filtering-correlation-id: 97e37858-44a6-4d04-3da9-08dbb90b3d7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ooPxGFZ6htrJ9QDn3hYEfctC4Ui+QfyZXhEu5sJu1Cnjaeg4++b/9m+DrcL9Q8OJ3RtsegojDww04B2Wkz6YmRJ/qAdFwYh/6bGq/ink2CfnRUZO9tXgXGnsPjADhDAia0Sqlmyylbhrupch3EIPMv0D+Ou2tp3QKyF9uhcR76EtV34pbKGu0YzZo/9h4pCgv0Ec/PSYTEIdCOEwdHz4JF5TmJzbJPS/fLQi/e0jGg/drVGR4vDDYeoG5mgQkI/nsMSJi3FKl7l9wOuLdGyGFPUa3QJ5nDG3IVGdc2rMlmAVRPKRU5r4hcLPoU8jh7yjwMbinrFEhjGUMXavH0VRftUV9lYXWqkgxvAkni8AoO++h1rSQDirHyvk7rWjCywyvoh3UmUTR3BAGLca1Nq/nD4j8BeOBFjg7fIFUcBmJEbTJLgGgMlR4czxaN88osaciqYsnpraSuz5JrdSRKK3aZn12DVf6tEtPEwsa0obVudt5AC1ZcuuMj8X1cRD46pFtxrf0qRcMSWtpKOGayShn/izMEMOkz7zWq1UHvWU/TreWEB+48jphxojxG1hcyES37oaa2AwDj5j8gVOvmeJRvpdb0UnkBlRQqgP4T/0oYX6B9DcNq/7CvCzeK/6eETA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(186009)(451199024)(1800799009)(38070700005)(38100700002)(55016003)(26005)(9686003)(71200400001)(66899024)(122000001)(83380400001)(66446008)(64756008)(66476007)(66946007)(54906003)(76116006)(4744005)(2906002)(86362001)(4326008)(41300700001)(52536014)(5660300002)(33656002)(316002)(8936002)(8676002)(66556008)(6506007)(7696005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FohRgjsMCquSguQi2E/9N4wX0/NQAWgqh2CJzrkGWOz4mXpmDQg+U2t9axd7?=
 =?us-ascii?Q?tZvkXMrNdHzjtaHfK78VJlqyfuwNvzkmNQbOSDc1B7Hkx6wtDNZJ5fff+uqa?=
 =?us-ascii?Q?oslz+nQjWcdGnn6G3zUgtK8H7IyPL/vNX0QZGOBgAbl5OGqUlQm2hStz5so/?=
 =?us-ascii?Q?s2MsmY4YW6vLgEWr64rrjtc10yDBFVJAZo3rCvvnbmHO8I3r9pa1jzH/9VDM?=
 =?us-ascii?Q?HCWa9SzfykWuvB+5CIkiRElyJsep9tOdrjDlziCZmO5qj+5wzEV4RlSK9k1w?=
 =?us-ascii?Q?UfFphaBa/p37m/fG0idmWzkmep5Ly2bAVe4S8RjqjUVMGMN0JOKob9vx8uSF?=
 =?us-ascii?Q?15GISnyGAWrLrJnzWzcJHZyjErdREFSo3F6dGZgjMWrdiEiALb/CnBA+D+LT?=
 =?us-ascii?Q?vODAmwwlUmDJSHj6os4D39opNmmmIhH72bFdwaTz1Yh6xMjU/R4BWmvI573J?=
 =?us-ascii?Q?+TqK0DAaJS4NmKeGlAZkzaRFP7muyHfunbbTWGmILbyTFj8fHWlCxGPoBeHG?=
 =?us-ascii?Q?k4AbuzZ6foP2l0Z3IFwZXwXltI3GpnIIDcKcJW8rKqWCOEORsoGhQ87YbJ9v?=
 =?us-ascii?Q?LzEFFDzy/OW8D7wNrn4LxcJnErkrk/OTOsh1yiL7Bh9hiX04RV+nObe0SMK7?=
 =?us-ascii?Q?q2ShIR8FqoQmrJ16a9IgWLJaoGrwNMtSF5YDNXQcwkVAHEqxt+8Rm8i/HtmQ?=
 =?us-ascii?Q?zooyzH692dPIXWbi7TO3t20H8xF4paIchBRxx4L6osIwIeVmj9w58+pcBFOt?=
 =?us-ascii?Q?x+GQhagMdXxhv9QGXn2vF3pX5GzwJDtJ0OcDFgEhAauYZ2SM4gNat9WBaSH9?=
 =?us-ascii?Q?K6lkS5YqgsIjm8BtbsQONBWHM7brrUR1kY7oqxWz6vu8ZY6x4Ol68smK9XVJ?=
 =?us-ascii?Q?QGzSQSnck184tv6FklGxylkJ/c7DwR5IwSH2khCS8Jg7PhFwhH+aihT4d4lP?=
 =?us-ascii?Q?EuOAjISYEUmWBngSh1IO0AqRS5CIvdyKPbLd1f7Vq1bd+09eKs8qvpYUa/mB?=
 =?us-ascii?Q?ibapVhmRGjbv8r0UiDJGYCD7sjyY79Fe0sBYKGevUcICJ5p4Ji/qht+7i8qc?=
 =?us-ascii?Q?31ejIQQqdsrjEIdSoVn/I2RtanqhOalqixLLAchxpYsEsGcLXAuTG+T9jr6N?=
 =?us-ascii?Q?GQBL4pYSU8wvFru75XjubyQIyna5C47Yc4epQ/8Elo0dgaFuXVjE57FNgdyx?=
 =?us-ascii?Q?H7KV9DvxqbaydOrWgaXbb4/S9qKiOXmLj6ZoNanBEeAkJYvuBgWMY+d6Q7UF?=
 =?us-ascii?Q?6kc2G4NamOvh0nJ2CLG7h4GJ62eJ37u3wQ63k1xQfv+wm0MXEbXSvfSbH2E+?=
 =?us-ascii?Q?i+y3NPuNRyjjFMcrX2kphE3dk/drE3sZtg6MIam9+945c15xY9hpZSmVS3HE?=
 =?us-ascii?Q?QZbEE5JIKr2E3paWMaYNoKzPl0tTHwQRyibNv6Q1aZIei5LZIEj9viedzjtI?=
 =?us-ascii?Q?5Kjfzu4HWgEbNIMFJvsIzSPLw/LAxrlLriMstUjh4KmG1YsHy7hMzD8DqzSZ?=
 =?us-ascii?Q?q1+m8fFEUiWqSBwsYIzCCV9dv8S0SE988gKlbQPNxm4GLdn4EgNcwhC9wdPh?=
 =?us-ascii?Q?n+s0dR0CodDcJoZz/OcsbLAr0fEAkURFX+KoFheHxmIL4s36GJ2FqSm3Px5M?=
 =?us-ascii?Q?IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e37858-44a6-4d04-3da9-08dbb90b3d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 12:23:32.9791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wevy8tV4Iqlgz1dcmygbCafSWyIPbQ5po3M4EoXTr+6Nm+msKJGjswPDvwLJ7Kyu5gBXiQIGQR+FTFXypAJNwZkhDCvhY2xMiCkzuG9hZxS68MdeFZlcXapx//+v2UJG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11592
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Saturday, September 16, 2023 8:41 PM
>=20
> Hi Shimoda-san,
>=20
> I had a look now with Kieran's Spider and could reproduce your findings.
> It is not a problem, though, because the system behaves the same with
> plain v6.6-rc1. The only difference with my branch is that DEBUG is
> enabled for the I2C driver, so we see all the messages regarding
> EPROBE_DEFER with DMA. If you add DEBUG to plain v6.6-rc1, then you see
> the same messages. But still, the busses get probed and they also get
> DMA channels after some time when the DMA driver is finally loaded. So,
> this really has nothing to do with the patches themselves, only with the
> additions for debugging. Phew!

Thank you for the investigation! I also confirmed that reverting the "DEBUG=
"
commit resolved the issue about the EPROBE_DEFER.

> Thank you for reporting and testing, still!

You're welcome!

Best regards,
Yoshihiro Shimoda

>    Wolfram

