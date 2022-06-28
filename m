Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D06655DA26
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 15:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345084AbiF1KtY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 06:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345081AbiF1KtX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 06:49:23 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59801144F;
        Tue, 28 Jun 2022 03:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaOAxBYz55OodgcQ6dUA9Y68z8gWCwIZRXCkYdClUG1ZZy7VgGLP3Aja/n00ckmlOJ1z7zssob5aKs76H5AHzqyLwwUy7uH/lxx1ZO4UWBTUwYK37T8oDMpTJkJnezcv95Xj3r4qVdC1+VPcDCYRFK/pwhEpRNzefnPcMDDf96hrTYdeupGPpYFRkybjXmgFwbAFy/fgnd0Vs+No+pD2ejze7JI0uZLK1yt2gqjNlf0GA8jbduYn6FbyDL7NzNe52i5I8aWzT+L+5qyU6mUJfwlitnRqSuUzsJTHK3vVVcAhZJBlp5B367OsgbniqYpD1jVeD/vW1kgOQ7UJ1g5+fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfychne9XGf39Wf5ldjCYmAje/8TXSZ/GUSRXXXcfUg=;
 b=dl7PyW4QyojP9JpMFcg7TXoHlA36xkVNRf3N7GQw4sZEj13bBP48bi0cdfPRVlksQ0gseeafmoXulDCXID0Tz8XN3A4vjzVhoc2GorvBGLXNOfBePVhPeam1T88VTr9+KwaUf328Fn7AFtkj7Jmb02BwY8nz67YerRSdo/kOR6DgRKdAmTgcX8GkfQ/7HDAfPitv/dUIbgTPCiZjdlT9Ogr83oKs2hwnLIf7rA49dHLoAzgh9lKzFAvVSuwdh3S9SIb/Jd8lkX4kA1Iserm2m/m70jLAj6ik9jxRdViDyXo4ZVD6UzFor/EsoFCxdj7u7m3liTIDhONDZ+hNNlUYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfychne9XGf39Wf5ldjCYmAje/8TXSZ/GUSRXXXcfUg=;
 b=PPnH10w6lL0TdXY49r8kdN6Rm1DEZDKCS+16QhQRD1gMQOBH1x+LWZAF1gJZKX/aJP2rtoz7nFGzpM0L54Y7kplBCTVESR7QmHlaY443+tUfIYZ1DRKtxRrlfyWxzu9FGGlxZEcra2EsvUrlLQBiHaLJJ8Zb+RHO4texZCxn57k=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYXPR01MB1725.jpnprd01.prod.outlook.com (2603:1096:403:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 10:49:17 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 10:49:17 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Topic: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
Thread-Index: AQHYh7O5Gmbz6jaenU+JJ4T6rEztn61ea16AgAAGAQCABi+5AIAACFMQ
Date:   Tue, 28 Jun 2022 10:49:17 +0000
Message-ID: <TYYPR01MB7086E2CE435420EBE5A559ABF5B89@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-3-phil.edworthy@renesas.com>
 <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
 <CAMuHMdWNvFARZgM1QX_t9aq1Kh84i2aCxcG5k9LqDM=wQu15pw@mail.gmail.com>
 <YrrVMAdZn9IyQA3b@smile.fi.intel.com>
In-Reply-To: <YrrVMAdZn9IyQA3b@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4852fd89-402a-443b-d94e-08da58f3d939
x-ms-traffictypediagnostic: TYXPR01MB1725:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kSFYNZqWbH6ZzN2eBNpEeQMaSGIdjhBF0P3Z1/xIqOVtrIeNk5pRavcOmAtlamjepZ/WLrU7sqQTb/4a1pXUxtkdq0pBk97fXqsLbb0xtvvSrHQiX3rpzjzoXINtQTN969lpC45SXym6IrUeOhVK5jl3WwNy+X1jZa05cRNbNat+a2xxjMiXUaqZPDL+qxMlYHp+mWom1MwZ8BcRwmrkZqoCGDANjSf3bC7llNb7mG/2JUVFE27YctSkMHpIn2w/pyX5HRv0LBAz4cCgyura9fXnhYyooBEWjgRxUr0M7im7r4GUIf+MTsg7NlTiNlamCmybDiUT9fVNeiagGzp6KkHwO8FmFuuJfwqgaacpqVrY6FR+qLmkfv+h6CAa3Il379Kj+9J9ffrDrrxtJTHLYND99KrH45N9JbtbT4l0kfmqSh1R/HcYSbap8QiGzvtkvX96N9evm7rkyNw99m0VFV2mih92PsCf462JopQCXhTZeY35dQMO54gwoF8P1q0l5yyv/2otKVMV7m3Gur93rt9VF/mf6QmR+KefDtEK1UDe0KDVrm9xzI9RZg1JSOm6LfEYxpgwLKNbkgViQsqROUX9PFCf4RDp3NywtZ92RIndJtu+AD0HiIIsgNJjtG1h9YHUfiyb8oNHTJRtMmGOKOC4mifTA2XL0vFSrkXMnoGEZefj8KRtmH1ggXW28OJVBIbyQ9SEd8acsNDNnU3JbQuiqTruI1U5eoc33XbgvFT7Qe5I8IV8wAD120dmDR1kybUdcBS6YBsKtJhmj/3OC7Oyyk6Jl/MdKFcNNR6IfG4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(66556008)(66946007)(71200400001)(8936002)(8676002)(122000001)(83380400001)(66446008)(52536014)(76116006)(64756008)(55016003)(478600001)(26005)(33656002)(66476007)(5660300002)(4744005)(9686003)(4326008)(7416002)(44832011)(2906002)(41300700001)(6506007)(316002)(7696005)(38100700002)(110136005)(54906003)(86362001)(38070700005)(53546011)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GBwaDyiCGr7Qryk2rP+Hmi1POYK1GjYJC1SKs4eQEOF96GX5SuG5xs9OVaSj?=
 =?us-ascii?Q?wKs0AnY8uRcXyVaYBV6bsLbelbpzYUtGvoMSnHBju2bQJKK5cO6OdJTHF4c5?=
 =?us-ascii?Q?mAdUasl6r+QRZtGL6cIjVXbdF+uXY/8ItLxb24soQz6Q/gLf1ce04iXTv/0z?=
 =?us-ascii?Q?WMKYoH2Ky7KLCZI1o5TK5LC8RyzX4J9+al9rE6Dc1bOvuUyD2G5xUJHABzr7?=
 =?us-ascii?Q?oZDvrHmXODEBQrKvJ3rJs4xumEzHum/z7T2iZf2H7S8b1782jEWDuQHANlY+?=
 =?us-ascii?Q?bFhZMcjobN6egg4cQrSbkWdbd+A/Gxie5IoZlob5kb+VLjVY+ufo9jL7pSIT?=
 =?us-ascii?Q?BeS/I2Mt97/4JFuvbTYS5JaWj0j6FTwxtzqHCW+y6voQx83cxyfWDaEu3b1P?=
 =?us-ascii?Q?S9ONUM4BlD+Ac1+Jz7inbzVvaIoxsT/tAn3Esa4+wA0KDZ1cPbPtHDHkqAKq?=
 =?us-ascii?Q?X75Fu/02zofu+WzRRMWQVqAwZF3FW37jOmCCzMqPzUFDrZoj/xpOL436rSLE?=
 =?us-ascii?Q?iTpBOdTWihAOPUbhVyPEQ9ujrj/M6VMj0H0ae3zHGFbJa9hkmlQQy6co62gB?=
 =?us-ascii?Q?WvJ3kxbR2HxH/skIhOk57z3nnMxIO3r42zQc2MmiT/dw0SQGmaWKN9EPHM8M?=
 =?us-ascii?Q?6V1UN80GnWm03mECzy0zJsPTPed13J2Ddu/Z930vVZuVC/6vAiatIkD5Ovez?=
 =?us-ascii?Q?kbf3IfJI5Ev3grbTYg8csKuqz6iF7P+GcR8nancbuC6oQ8qY/a3PU+DsK+De?=
 =?us-ascii?Q?3PKFWbYo/9tFnXp8VWtWt7oOVeTRWF/HuNYpS0VEwAp3R++uMyAe7XtwZfdV?=
 =?us-ascii?Q?4Ks569CaBQiUycj6B2aGCVnGFb1HfPjz1r/d3JgRRmSsRexzljVeSz+dek1N?=
 =?us-ascii?Q?v7QgyOwdlLKL+VkkJHQIKaQd8xEr+v8Z9xyTHomqOsnDGInrQQ2ZQpS85JMA?=
 =?us-ascii?Q?+BPR4erjNTCGjTWjSKJng0F7/jnbein/c3y05hGdQHt05fqEUF7milt5UAAv?=
 =?us-ascii?Q?K2Ld/LbEhrSY9W4YS6OpMcfEzQe9rCQPV57zPfx4irTFFixSLZRAMhsiiPft?=
 =?us-ascii?Q?NDOccVA38NAh4UpYwhH/hyeKy7KnUr7HYk6QlzHxlJAsfpLtcI8GBGnVj6KY?=
 =?us-ascii?Q?6t3h1v90Wki4zk172farFF/Dr5/C15p0wWj7yz3wzaid8ELY1fepL/6c3GSD?=
 =?us-ascii?Q?biJmU13eCgtlh8RFFJoBtzgad2q1YKqxwtVzJDuVmxyRC6+J8bjSnjtanCfg?=
 =?us-ascii?Q?6cRPSMjfPSHqJ3vX1Xa/m0k7ZB4ndAq7BY3ZFsdtjz49S2bjhQ3EEoCS1m/g?=
 =?us-ascii?Q?xXElJnZmhEyevRcIunERj0ZeKzQXlo8onDhoCUgTLQaoApDo0Vom+0dAG6EZ?=
 =?us-ascii?Q?MpMOXH4I4EU5IHlvesAW6M0F14nlbSa0hvmjGApl5QQ6i47Bz/7FJSWPHfeD?=
 =?us-ascii?Q?vryfDdNHoLyGdyrUw/FPVLzJn5BG23eOpXi8sGbbcX48pv/Nl0RblpoScBVO?=
 =?us-ascii?Q?lkLehwhaGEpRKAzMKrUAO8RpDcmVJwXpGEuQYrWNEYjadXuyXefP9c2VzBBA?=
 =?us-ascii?Q?t1OHhJAl8ATf8nafdnSV/0UB172quX4K8UCvaVsC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4852fd89-402a-443b-d94e-08da58f3d939
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 10:49:17.0777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMc4pODzkSXK/HRH8g0XEggU1ivVtqOV+7R8kNCal4IyQ5gBU9xVeoec5UubRNSK3InKveVzMeYwFiVgW29zQfp/Ac+0cTQriuXLKwQqYwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1725
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On 28 June 2022 11:17 Andy Shevchenko wrote:
> On Fri, Jun 24, 2022 at 01:48:58PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 24, 2022 at 1:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Fri, Jun 24, 2022 at 12:17 PM Phil Edworthy
> > > <phil.edworthy@renesas.com> wrote:
>=20
> ...
>=20
> > > Remove the #ifdef here, and use the new NOIRQ_SYSTEM_SLEEP_PM_OPS()
> > > in place of SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().
> >
> > Cool, TIL!
>=20
> There are also pm_ptr() and pm_sleep_ptr() macros (need to be used when
> assign
> dev_pm_ops).
I noticed these when looking at NOIRQ_SYSTEM_SLEEP_PM_OPS,
but thanks for pointing them out anyway.

Phil
