Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9DB764410
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 04:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjG0C6B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 22:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjG0C6A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 22:58:00 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744D119BE;
        Wed, 26 Jul 2023 19:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKi0hrIxp8ZiYg7h+t8724qTAMZY/BrE47iVXvKysjTrmayv9o7hUVrT2lV8Or9lSQI/7TUJDn0zz7/BzAWHvPPEeuZ/Fj9HOEhoa2ZFrSBHK7r8QPU/J1N7/Bei5laDzH6xRQQg8w9ghMEPiVvJWps9AqZ3XeFkLIbrmsyulyvtAHBEHZnW2GWW1ttjl3r/Fh1WCHNKhBzuOHS+Gn3XhQp6VSAkg12Wa8ev5PozDPMVZqPOSoCAelnDd9WVpg5H1bETRoFQUsmIyfpPv84EHCYPUk4t3Np1jLehtIttwQ/OugMcXm016WnsgTSUR2XB3FPp9Jzdom9SUT9MrnaDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dknFIiUjl5cyR/ZGEBZm8pgjy4jXY/arRMQgm7ODMwM=;
 b=MkaW5XoRcRIbLeeHg8VAyELuOJggORtpuK1kMrnohwyY3BQWLWIOko0A6LYDpib4/hzw6J7IcsMLHsSX+dQQ469hwnz02DYcyWSXwN26sJi18De32u+SowD8lV9XS/rAS8uwtcOSLpnboeSsbPejzw87NOxZRuXWmInQQWioKZov+DAxYWTuy4jCR2F74JLeFZAMXPdDrJyfDPjScDnqdq4lJUDfbgH7quaxwCPopySInWDe8gX6RICSUOgJ5zwnIhhNvpcFlBZQi2Q9asnT47chbTY4sTH4k3xfZ3tTSYmtvrPKZs0bwMzS4Lb9O+p5yD1l3BVM8VXkMwrkqUYYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dknFIiUjl5cyR/ZGEBZm8pgjy4jXY/arRMQgm7ODMwM=;
 b=BBkxGws1vkiNqjDmE+F6l4ZaZ+0wLgoIcXUtyurSFeFQBRLhnout/mygx3xQs4IIvK96XNtj/8+SB13IAF3FEgHdJN+F8V0qN7dFHx87BhjQUfktFE6VQc+FEjzuaGWKJInvpETy3Mi6jc7PIUtxI7dMKG4kgYT8fT2I1Q2RZ5M=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AM9PR04MB8259.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 02:57:56 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 02:57:56 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v3] i2c: imx-lpi2c: directly return ISR when
 detect a NACK
Thread-Topic: [EXT] Re: [PATCH v3] i2c: imx-lpi2c: directly return ISR when
 detect a NACK
Thread-Index: AQHZv6JZrTJq5WN/fUC818v18ahhoa/MIi8AgADHa9A=
Date:   Thu, 27 Jul 2023 02:57:55 +0000
Message-ID: <VI1PR04MB5005EBD54A829907B0E8C741E801A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230726092350.3432837-1-carlos.song@nxp.com>
 <20230726145158.xhn2c7uzs6xsrguf@intel.intel>
In-Reply-To: <20230726145158.xhn2c7uzs6xsrguf@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|AM9PR04MB8259:EE_
x-ms-office365-filtering-correlation-id: e7b4d542-e096-408d-67d0-08db8e4d4725
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hmhfnJILdBRByRZ9EmUDuuECd9M0lWNi0AK1KPNIUy8VlGcL0CEk1L7TsF4t42pcbv6PSagR09dwe1WFI51pCUo3LTf2oH+uX8jDfbz/813CTQI4Ylviyz4HLHhrxqNiG3D+3+ozPxijzzbU4pR48mlwhxH3n3r8WpieEbF0AACuYSsra6yGkLZPXzQpHFU5q10VTeNGJO/phk2hB638g7fANM/WRkHhX159N6MvM43PoYKaSw7mdloE63oOKCQxKYMs3YXo2LsSk+pTcTGuS7DLc41KYj9OMm3UTN6eZ9AKAk6jlzslMz9IDpg2yO2avSWJlvRZo/0ElL2ZlHWKs2SA6YRBrigDdobJgLgX2wzVWbOWPmrIvlHVqIHiq3UxdlG2iU4cTrlDcyTUDJccBcE3JAiiJ3nqP014yYU5szua3a+fAXZs3ljguGK/WeAKBywwOaX9F4/GBwv9GT/Gj86Gtq/X4MK6PLIw01pZg8H/IunzwwsnJD5tVVAykiE8qsZcTK9tz8BebEteY75kz4Vk3cSKCrxAjj9rqEhUpveYgXvYWk4SppW4xL4u6VNdDHfS85Hhg65ajqworuRa0YEjmw2ZMMEhR5lz3aOeODXJl40Y+7BRls8eEJLQt8EY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(478600001)(9686003)(7696005)(54906003)(26005)(71200400001)(186003)(53546011)(6506007)(66446008)(2906002)(66556008)(66476007)(316002)(76116006)(4326008)(44832011)(5660300002)(8936002)(66946007)(41300700001)(52536014)(6916009)(8676002)(64756008)(122000001)(38100700002)(55016003)(86362001)(38070700005)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iuQi3gSoXJVttMMfxvbZk7RtJDe2937qyxKWt68UeaSoglc9XcIyktIUUHPK?=
 =?us-ascii?Q?bfXT/wOH45lX8uSghVL/p3c8cBiJlGSWbbUS5osSl9W1c5CDD6VR11MZkHt2?=
 =?us-ascii?Q?v8D7hfd/yt23airf8d4NpQrH+4FF3geXwuVfxB4zxqJ0C0NiNPOo7yynRLyc?=
 =?us-ascii?Q?T00MOhqboN/GZ0I1oTpFChkRZvUcE6IcnKQ27rjiZr2iDCq/G1YITQmriI0J?=
 =?us-ascii?Q?nE7W8+B+qnDGqBV0Dqca7Mud5C2oiEMzqKH9E99zNpE5ZeNnN4VdWkdGty48?=
 =?us-ascii?Q?bXB75XuWibZhsWODvDo/Nhkcw/uEf1BEKRG1cEIPNsIO6uFKwA6Zbws2r0dL?=
 =?us-ascii?Q?WfLowlZcJGvLSOyQVYTcZa9V0aP2s/PapJCtFftWCW7fXbDKMVAtg4NlBojf?=
 =?us-ascii?Q?6ajlWm01PWlqNvoCSXhGftiWbceUfMNIOcgBW21J/5Za/cCy4Btg/Fj8F/Gd?=
 =?us-ascii?Q?WERmPp/w69YXI3zXT6cQGya4Nws8M7+rO1gIsCOTlXaWFIvx3FJK/dfJZj4T?=
 =?us-ascii?Q?KHvsG+yl9BiS/rVGMdy1yMH5l8A9nndpmtIKVG3s6Ok7UjcTu+FbNYfDgIKD?=
 =?us-ascii?Q?TaP6O3k+QdVw8T0NCtlmz+jG09SwWUNwO5V967DRYPEe5280trmdLTcH9rAd?=
 =?us-ascii?Q?NOjpooFDYRmlxqqZpfGClezI4fXb4HoiD+xwrLuUEyZ2S5rrWrVqwftnfpBk?=
 =?us-ascii?Q?8m7cDAEA1qhqMee6tZIoxjgVYOST2P2Wgi07zNJU6LJVNP+puPpkyqYr4sjH?=
 =?us-ascii?Q?6woOvB5F2Tu3LW3ep57sXPj0o+LChGG6NZg9aeftqjjWinhPn4okbQQllxY2?=
 =?us-ascii?Q?8AzkqDAMKKhLD7w3Zu0jMEl024LHh8sen37j6C/uL7sRBy/oA9VMfzaKsWPW?=
 =?us-ascii?Q?friAtrc3j/bXjxMHdnEFxSgaG/f7nd/7zUoOQdF7bAcslZ6pOw5hDMA32akm?=
 =?us-ascii?Q?e3Rv2or+DJp9Pjhc6HTkVV6uWv2WBsJH8Vr5VbcppNDzbIEl4ZycXo5ZX8aZ?=
 =?us-ascii?Q?UufpnkVAWPETrjWnDdTX6M2ppIPqToHYlc0H48doPzjWvmhdi11H0gD3vuHL?=
 =?us-ascii?Q?dePMvR7oC/6NDP+2jS/zhRd8e8KxNp/uIN1pgpBNznbSlhZYsQqcnXf2IXB6?=
 =?us-ascii?Q?nCTHfLkKqhhhJJmywL+2ouSIOOnmiUl/ryQ9L0Q2VTCNCXakjhLz1vHOtT2t?=
 =?us-ascii?Q?8VXe/Ll/kmybPNQ9GkjST7DnuAvn0fRXpjBwQN/9YnwuIwrhr8tXE26aYM4K?=
 =?us-ascii?Q?Xri1gICLmzNpZ4Dblu+MOj6cdk/XhDIJUAmf/Osgb/+8tL3buhsK4kxAzG5l?=
 =?us-ascii?Q?EBcmdKO0OlbkyrztFXP4kyOFOW9gZtgukombZVwLit2aRK3E8ywdRj7VELki?=
 =?us-ascii?Q?2Bpz4r9J1nan05olF2X0V/4KR8I0tcFTzxsZHh9jk53w6DKVTly8ca+a51FA?=
 =?us-ascii?Q?OEi07ishXr9tijurbH2EEUAm3I0FeUxqS64vrfHT+w86UUI8pDfhn22b4Bae?=
 =?us-ascii?Q?VM4TwIlPR3mQRShhrJPnhZ1tD6RFZMPKDuaMyfXJ18Y4MyGTLtn2OE5n5yyY?=
 =?us-ascii?Q?83BDnTBu1qhFG1BT9ZM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b4d542-e096-408d-67d0-08db8e4d4725
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 02:57:55.9863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bC9DF+XdUulJ0fh+PXoIUqNNw9sxseAsASkUCcas9FoNUoI/SV7wgFuYJ76iJAMCnM/wfxfv/3NCiApO8wa6qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8259
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Wednesday, July 26, 2023 10:52 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; Clark
> Wang <xiaoning.wang@nxp.com>; Bough Chen <haibo.chen@nxp.com>;
> dl-linux-imx <linux-imx@nxp.com>; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v3] i2c: imx-lpi2c: directly return ISR when de=
tect a
> NACK
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> On Wed, Jul 26, 2023 at 05:23:50PM +0800, carlos.song@nxp.com wrote:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > A NACK flag in ISR means i2c bus error. In such condition, there is no
> > need to do read/write operation.
> >
> > In this patch, i2c will check MSR_NDF, MSR_RDF and MSR_TDF flag in
> > turn, it's making mutually exclusive NACK/read/write.
> > So when a NACK is received(MSR_NDF), i2c will return ISR directly and
> > then stop i2c transfer.
>=20
> Very good, thank you!
>=20
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
>=20
> One last little question here. I want to know if this is actually fixing =
something or
> cleaning the exit path. What I mean is:
> can the device ever send an NDF along with an RDF or TDF?
>=20
> If not, this "Fixes:" tag should be removed and this patch can be conside=
red a
> cleanup. Otherwise would be nice to know what failure are you fixing.
>=20
> I'm just trying to understand here :)
>
> Andi


Hi, Andi,
Yes, no failure to fix just a cleanup. I will remove it and resend v4.

