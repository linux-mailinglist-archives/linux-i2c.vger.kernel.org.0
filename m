Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A57729EA1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 17:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241718AbjFIPfG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 11:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241904AbjFIPfE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 11:35:04 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC7030D8;
        Fri,  9 Jun 2023 08:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfyRoyYSHY9YXow63PSZPHYL0CZK/YSRO8NuRoALDVmW9nuzdbbatopr92/NsW36nykVYLJk4ZQ/CSyE2jYOzn0zkWvEiOewR5h4754GWgCRJ6EkiRUGyqG6bRJpRqt6n8/TLS/7ti78yzou4lkbEg4Oo6Qj7gaFrZdAwbBxwdb8FquxWuPzedvdWyyrLLaKHZDUYDlyEXVMuMwrV3Ehn+iQvi51Yytn9uinuYZuFbvV6WVk4gycLFSOZKkpLd4xmvzQU91CHp7Q1uZWfMAu4LANvvGCwMQr5xFRi+vjFAseYZ8T3DxyjS408ahAo3IA4Ud3Gr0xBiaRKPcJC6YYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKGcvvHo9S1C6c7Q7mfhEspLX53IYGaOmfbdCmLEAtM=;
 b=knSzFZRQLqTje+SIIkO/hFTl1vTh/mhN3nF8BkwnA+FtMh85/rJNv7W8Z176FImmOAlE+oZghTpBBKDnEBH3AkKo4GhNts8PxVgYPenOvq6rvPXnoZdKxy/GTPYMnanaKxJO1MVZEXyh+FZ/1Zl29iMDdtY7QfPWpeEl2L81Fm2KYTXK9zaWTKenLALISAy/NbxNvkBMviVSqPOfFBLiHbd1eCRmMeolz2/z6r0h4ZHMSIYo6oR7vTW9xUaxfEbQS9N3dhGGvALKa607e6yA3QdFPLfAiFF1BYvvcQX1GuP6Qm/A2DzlTXduo8D3b8877GNVLk52nsJEJ9IkFKDGbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKGcvvHo9S1C6c7Q7mfhEspLX53IYGaOmfbdCmLEAtM=;
 b=ks+FfH91aogv6F8LoNPYCBM3M/FReB+ib2nWydIwPHxuesBcviWAUGdKRrm9V9E/hdV37ZoMsNC+lht6GxWtWdtRN6tmPL3HqNRgknL6rJg4hk3Bq8utjjLSqOdjjHD/qA8SlFjk7HTRDq2Ei3evSN9Yw1HOlnZGCLMh9H4Fd0o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10185.jpnprd01.prod.outlook.com (2603:1096:604:1e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Fri, 9 Jun
 2023 15:34:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 15:34:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH v4] i2c: Add i2c_get_match_data()
Thread-Index: AQHZmWEvpHHyYQXYEUaO2IMvdgA3Qq+CmnKAgAACa2A=
Date:   Fri, 9 Jun 2023 15:34:59 +0000
Message-ID: <OS0PR01MB5922056817E134BE28452F008651A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230607165738.138357-1-biju.das.jz@bp.renesas.com>
 <ZINEYYxGBSQ0mKyV@shikoro>
In-Reply-To: <ZINEYYxGBSQ0mKyV@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10185:EE_
x-ms-office365-filtering-correlation-id: 3e6d87c5-8674-41d4-177d-08db68ff159d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /+bIT0XYn+8xojw5FtvKlH4g7RhGiQi4VpdOZIpc9momsCbQX7PRfEAJ+qiNhBPkcyn0MfJIscgnudaNDLYUQLyHlOfwxnKzrvYU2yAIVV7Q5mGLuSXrglWPzVP8nSiBlW0iKTZObywSR7IEXj8N7zrXWzEyYE1lt1H9jKW9jwN0eRf1rGECRCX4G2S4MRt43CizxRyUftfnsTFb3cWpDZ+s1/xWjEEAx+Ndw66LemxXv2rSEa9CQNEchqkd/mfUNuP0j3XC5u5PjZMfIHcN0rP/CTYtDOg5bnhTdHKXhmRfvEcJ9sz51rmpChoSg0+cHQhEDEHQzBixVM3SS7ymLpYn1gXAgeQiaYHw5JPZLFYh4Hpx2zRyTzZQUeszUYZa0EBxNU24pvRH7il0ko97sJaNZNvlvJAQRCy/ouPvntUGXyVwQAefvQ3DYQSfJ1nYcMbFhb+Cpt6J9SfErYGCMyd5UZfVBFtgiPA9zF91UMU2x9LJzUlcgVgRq2vXYpKN8Fk6Mm1bVl32/YI54Jo54p96GJLgPhpebRFvc4ocKZ7w013J0WfApLBNcndQg6NGtC8BJK8W6XEmJWhS1XgtsBjObz4ynidSDlY4ZHv2EAFcRtyQ6n8JsT01zYmRLEpN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(7696005)(55016003)(478600001)(76116006)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(316002)(6916009)(52536014)(5660300002)(41300700001)(8936002)(8676002)(54906003)(38100700002)(122000001)(71200400001)(33656002)(26005)(2906002)(4744005)(38070700005)(9686003)(6506007)(86362001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5gG+wrb8VbmkWHSaN7XTf7XWhbNTtDFTKe1rdlwCbpaEJPQ2VZ/7qnvUpaH3?=
 =?us-ascii?Q?467OhrXQeFnDZzC4cpeiOX/bjEIyLsWbbSNd/sX5LA6iu9rMzXvqC3IlqBdC?=
 =?us-ascii?Q?s+dvIzU17XHzEGvDv6s99PGv0/1M/QHkl8xq7LpQHTOpZnyCn+4nqH5JhB91?=
 =?us-ascii?Q?ATyKuVWENbdRcqqBs553xK408piKYlBmQOrl2qKg06QJyEh7KpM/vnFfWA72?=
 =?us-ascii?Q?OKp5+423KoSw4j+ypH/M7YCsFsq+6fYcK1nLlBZplqr44tF1HlIiiNhQQYKY?=
 =?us-ascii?Q?aTZtaMB8bV+JRSp4i34FcPG8kmY1Dfx2rn+ujCTtyrNVRm500bjkAMCsbh4i?=
 =?us-ascii?Q?KjNxdGUnAje3Oike76+ZPvVdfTTug7gCuWBLpBuEmCGdjvrJHgA2pbtUz1Y7?=
 =?us-ascii?Q?I+1yVRfhq/noedgpKOflgyGCLj0N9H5E2Bqy20iuZFuUst9lP62f7cfzcOI9?=
 =?us-ascii?Q?Yz40H8Xz5Oazcz8kcZUsyXSvvkME+BfupcgtGcIvuXGCwmnjbh1d7+6V0fJS?=
 =?us-ascii?Q?uS2YsbZ/hHWRK6S4ggdTbMJeZH6qpsbFJ6mDIqAvjucWlx8QuqZZXGDtfi8x?=
 =?us-ascii?Q?mHMotkban4HbVTOPh5a9xnjS+tGZCSzJgvKgUiyUx+WRth2vkCGy61VFMwuH?=
 =?us-ascii?Q?i9//tLa/MSz/vXDW/jRGSftz3ssCfY3e7Us+CLos1IaZHTuctgcUMJ5EwHmL?=
 =?us-ascii?Q?cQXsI02bbfnycyV777i2IlzE4PuSR25C2JlPH9eAqmdokftnqUn2BMZBVUqw?=
 =?us-ascii?Q?pMt3SbGW3OfR/XA5YexpqHi8nS3xq7xtxMPxJHSJfySsOLK3Iu1/QhBobeub?=
 =?us-ascii?Q?+Mm3tMOAqo50gsNYEGHlNEism8xCDQ2N/o4b7sHq6iumtYbOOFWe9Qa+ioYm?=
 =?us-ascii?Q?zjzfeOEey3duFMakgF8ntDe6HSDuX9CkeSr7S9kuPSg0Gmn6m4wCQpHT1avp?=
 =?us-ascii?Q?DiFOMHBHuIu3350kI/qe3jgkqPZ+M0S1OiG9CHTux9/OYolb605y8D7yEioP?=
 =?us-ascii?Q?rnB30tEX2Y7yfeJcapTUClVbgE46Mq34suFvVH2AJ5rd+EhWkVz6DsX1Oeru?=
 =?us-ascii?Q?sOkVDbP+MG1cldpkuE5Jan0di3Q274Ab52Hk7lBEHG6YAM0rY9x2ao0yLYoO?=
 =?us-ascii?Q?iItACbrokvk4SeRr2H3Ijj0BW3/FG2K/ZA4IajnIP812bIBRaag1sSA4btLg?=
 =?us-ascii?Q?fCEvRkX5sGx1dJWy8dHE6dwmpXIqYmlKkxx6j1l0WUQoSGoPB7W0hgDemNgB?=
 =?us-ascii?Q?wltszzD+1gSF5WvDROXsCUPR0VVHV9OSK8HBm36hQauEC9ZBTBujRGxYVTbi?=
 =?us-ascii?Q?P0FR4jQu4gyQMtrx50815E1ImpfJEh6MWNlY3toj+2e7Be8lNlFT1PYZln29?=
 =?us-ascii?Q?d5zeF8+OBMOZ0j2wEJi+0oB2rw+d6yQ5JIV+JVo7Lnws/OxD47igZAvZ1pGb?=
 =?us-ascii?Q?xUfseHC7QE35/NBbYdv45wZWPQY6Dg5/qEzDLDjPK+vgV8AZM7+4FkfZjqin?=
 =?us-ascii?Q?M5ODWrEIpaJ4tcnPyl6mOiEMOUuwXifVPuEvfrbp8Q7jPj8hTFsGFbYzT+tw?=
 =?us-ascii?Q?B9Scx9HzFFeZA3Yndte1l42ZQD04UEcf9qzk+/VkxY8f+Tf7jTkdjXxe6oJN?=
 =?us-ascii?Q?0A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6d87c5-8674-41d4-177d-08db68ff159d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 15:34:59.1030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMhlfNoywHVPubjVR6qbpfYerYbDYtDnsPfzvsO0f2MHJQEfLfMRQniHObkRw9521i9lqczV1HpaNLhNczRoUC89T/+cCXyRl9kmqjtkBpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10185
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram Sang,

> Subject: Re: [PATCH v4] i2c: Add i2c_get_match_data()
>=20
> On Wed, Jun 07, 2023 at 05:57:38PM +0100, Biju Das wrote:
> > Add i2c_get_match_data() to get match data for I2C, ACPI and DT-based
> > matching, so that we can optimize the driver code.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> No further comments, yet I like it, so:
>=20
> Applied to for-next, thanks!
>=20
> With one minor change, I hope you are okay with it:
>=20
> > +	struct device_driver *drv =3D client->dev.driver;
> > +	struct i2c_driver *driver =3D to_i2c_driver(drv);
>=20
> Variables 'drv' and 'driver' sounds like it could cause confusion later.
> I merged the two and eliminated 'drv' that way.

Yes, it is much better.

Cheers,
Biju

