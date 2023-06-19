Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC23734C19
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 09:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjFSHHg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 03:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjFSHHf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 03:07:35 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2138.outbound.protection.outlook.com [40.107.6.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ABCF4;
        Mon, 19 Jun 2023 00:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRjlU5/yksJqo4ICiy7e5Qavjtqp96dFj0i9PAYH2cOMj5eUtXc1gCNqYneolAjdViQWwvimOGZGazkQyWhtcBVCFTK5TIZik4PlQQt2RzCHluI6K/895CbibqAbYGSeh5nsy/diS68haX0yru9AQ6WOnVB2uoDIRT/8PxC9hVu4omkBombORZCXkxyRofIDq51OHmTdbbGqD5FQBKZeWKXAqbaR5noyDUq+itWNOwTcsRKlddoddQP2eXBKAY2c14VRGg35phfmK5bK/Salt0dKwHxKhVbKvdKGOhWI2nUO/EmiK+gBEkfc5m15LaXP294HC1rgG2XAVqUBB10kxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9FnBn12MezX6Hk/X6AEocNkj3l5OCpye0YmIG5Z7VQ=;
 b=RD3BK9aHY7bNjW6F6O8dQK4OKZCnXfkx43rbOT6MxqP+Fs1KOVDVUTJgaABFPLB08HVATe9whBuw3LszgWpjHIWD3xxdotyeLh+AqxtNucPdPIy83KhrQZ62267FiYDLrSIE+JwkZyAJT9g1ZYeCG54iPk4PHXXQilu9883mhvRJnoDjJhWTnCWsS9nxoLgbC9NRSaiiT+S75HEXdX3SQ0/LOCjvYgcm4RuxzVZTl9p+ZW4HL19+CL+AGGwZUdyhSR6IHsdY2OeXTCrz0fWyE/cZ7DUo4Guun+TS7uCQ3EP0jpzj2pUzdJWFh3cLQD0tT/l7NFBv9vQ9gveVarxwZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9FnBn12MezX6Hk/X6AEocNkj3l5OCpye0YmIG5Z7VQ=;
 b=LbwlZ6ha2e/VKEpVXGPsn3mg66BPMgkYR4Z4mZ/9J1rc9lexEBQdkPwK4Aemv4k9jUGGiWGG18xdtLcAxgpKNBwzz2AH3oSMS56zi8pjQr9Y+0XmLxZo6kGDdC472SlMUwdsZwgL8Xf7k7Cua+ESwKuM/vE+Ucdv3g1vYQ8G4EQ=
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:591::19)
 by DUZPR10MB8236.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Mon, 19 Jun
 2023 07:07:31 +0000
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a069:8f48:135c:3f5f]) by AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a069:8f48:135c:3f5f%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 07:07:31 +0000
From:   Michael Brunner <michael.brunner@kontron.com>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
CC:     "josef@oderland.se" <josef@oderland.se>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingmar Klein <Ingmar.Klein@kontron.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Thread-Topic: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Thread-Index: AQHZhLPcdOnTkTPVbkq8yl7yK9h/ZK9a+tMAgDE94ICABbdRAA==
Date:   Mon, 19 Jun 2023 07:07:30 +0000
Message-ID: <74b0d5bbb6887f921157e94f9fabef8112ec782c.camel@kontron.com>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
         <Yxj1ZQjBfdG1u93d@shikoro>
         <23c8fafe-af56-afb0-1257-222705bc36f3@oderland.se>
         <b8eff79f-0be0-e6a5-64ba-e085b0ea52b2@oderland.se>
         <Yxm9tlb4H7fspRMZ@smile.fi.intel.com>
         <60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com>
         <ZIszLQ+Jv8YJr4Mu@smile.fi.intel.com>
In-Reply-To: <ZIszLQ+Jv8YJr4Mu@smile.fi.intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7551:EE_|DUZPR10MB8236:EE_
x-ms-office365-filtering-correlation-id: e77bc333-5909-4cdc-0db2-08db7093d932
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WrSTdOjyIMVtgNxsyblSXLiNYmT4jWuAdyFEfURTI4a5a10aBvKG7XBzpDoYTMCPUgftsHj0znStqBNGV4kBayHzru0M4Z0sdev7O58bhpH2uaRcvZO0UcoA9qttGmO2SLdEsZUqCXO8FDEPEdMjTeHSmTJLWUz1gjlAnmUV4V0o59uCOmzTDZCw3oa0NdM3qSrZrVlTlGh0PTBEwu2diWCQBlBlYIBxTQBfq9JWBNCuBZYexHPcg0+22OSSliAn0whCY9QDMnCu+pp/D3rnjcXO/DIakxWkpWFrmh0m0L/lpqHNbDuqqfPZu+ACg+9xL7ZAbl9Rlvhf1BkKEdgongPYA+ZdK6Mqs1okd+E2IpZ5VNCxTCEg2ZI6Jj9NizP+KlijEpTsITKHknXjYB2jsJZofFO4pWG1Tp9Z7tS78M9OkMun3nAPeV5dZuePLXuUcsOgFCa7/ER6ucCngLspWSnUbG20zfvWrF9eQOaFpsVnQpmM8CCvZG/1/cmQ8FZkr2wUEjDmuMAMdE4PaXbBCvxFy2GtkSU2rt7t/kxLbCvG2p4m3WblvXCttqapeBt/+dw6LNqQ4i4eChMdsd+5lC1MXxIdTbgVM+DaRKP4UiNLPKHV6XbVhEp4s6MPS9zA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(2906002)(83380400001)(2616005)(86362001)(36756003)(38070700005)(122000001)(38100700002)(41300700001)(54906003)(8936002)(316002)(6486002)(8676002)(478600001)(5660300002)(66556008)(4326008)(66476007)(76116006)(91956017)(71200400001)(66446008)(64756008)(6916009)(26005)(53546011)(66946007)(6512007)(6506007)(186003)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?eJdhEcqBCagzeZJaDjIWZpc/53DsAqDnECwNl5khBQ3lQiPVql+mf9e6d?=
 =?iso-8859-15?Q?0q/jOtyGkLGo18HBPqjcH8qpx8u/uySW3o0zTQS4yUosp/N/qGbrH/I1Y?=
 =?iso-8859-15?Q?vJ5UuE0Q0UKErkw1V3qOlTfIkByBrDRzes6mUZzlx+P5wl/dbVWvCnMim?=
 =?iso-8859-15?Q?HEhDUoNA6cxw8QqBmGpS+JelPVk8N/GAz3EWGbX/+NGKS9UJMesvgyey2?=
 =?iso-8859-15?Q?bKSSOUaTMuyhDnjF0ic7Ijer3VCIdcsH/ZfmMgEL3thdjew+OZRdW9zKV?=
 =?iso-8859-15?Q?79Ewa+/+w4HO1guKHbjTZtA9iNy5QBQIFJO1C//iFsilNle578YwoUUvZ?=
 =?iso-8859-15?Q?tAu/Y1nEgpeCdr6bLoh+Nx+ndC9HwQ0cybgDJwQES1mIAfoyV7btoNYGR?=
 =?iso-8859-15?Q?p0wZeBykdeb7+2mOZsx5DEfXAUijwtYWinC9UkEcU7lllQOQkGHpl/Jr3?=
 =?iso-8859-15?Q?LVN/Mj0smtNIjGoLV7eyhR9nHdYcdxOyc6mm9mtwlCaHplcMoyDdmZp6e?=
 =?iso-8859-15?Q?iNuR19eVx2d87/mDCS1z0DyXBAX0YzHu7FwBMr5r+mAk5eaRGDvstNsoo?=
 =?iso-8859-15?Q?eq7QH6pq+gVhP6S6fKOFYBLecDaKn45qMJiEo+Agl+aewWfswCFoCtIOD?=
 =?iso-8859-15?Q?aMyg1poATYSli2vYHj2wp51f+afgPbHWy/gL+QBEDV40A5spIqwX2HTKI?=
 =?iso-8859-15?Q?tzMtT1h4F80nDKScVaIQD6vVpbfxHqAkVOnrm5jmwarzWMBMOUWBSTstH?=
 =?iso-8859-15?Q?tusV9N9ta38mB5uMW7PeQA1MIWUNA/8V/tu+HS3l3pQtSXlZRdny/DrBX?=
 =?iso-8859-15?Q?sjnHmGLmAPrzcUwGv2BSffOBnIiM0Ba+kiWKxHmbT4dMlfdGhuIIP9kR8?=
 =?iso-8859-15?Q?DIWiE0XYM9b9oZrJ53rM+1Kxf9RCma5PubZ7gOe2PxSdC5+iZvKfd5eDa?=
 =?iso-8859-15?Q?cjUTREE1R0blOyGmH7G22EpzyvNSEPzo+cxYLeJd6hbQkV6q+rd3JKtQs?=
 =?iso-8859-15?Q?xj32VitGbhnKbVVMR3RfWkn5SDOLXjsRJFTpJXyXrII2zepia6lpc8tb1?=
 =?iso-8859-15?Q?wqEtaoqOLaY+3HqBw87/GKvMxZYGuHs1Fm5er4a+BI3e4bYeNCXypysTA?=
 =?iso-8859-15?Q?pOp3tzxLBwANv0tSzE9G5wddB1YofeNHi4RqqN4w/dASA/t1ceRuJSZeC?=
 =?iso-8859-15?Q?hwdsVftHYOUuMB2hpoSEwxDHepgLIRUMrrsLiPBWgTx6Ij5GQbn6Vtxgf?=
 =?iso-8859-15?Q?tDzHGXGajuSH9/zR/uvXbgs0MzkQtTz77sXOPSZwNnJI4X+dzVX6WwbIa?=
 =?iso-8859-15?Q?u4xYRhU99SbU50jX25/bVxRWGAX3IDGIpusGIK+1EXfD/lL+FRhXvsavJ?=
 =?iso-8859-15?Q?Tzfk34tVTt8BMecKDmXOjHkmNF85KSAelBU+/gG+7ZbRFf8KqmWQktDXK?=
 =?iso-8859-15?Q?goiRqNugm2kQFSINQbhug2No3waTTBmhCqCM9dYZxorRk7HJn3MrpzAX6?=
 =?iso-8859-15?Q?UO/XwmxokEAUOFRdy3U+IZljxtdA1wajcU37Em6JvEqem7mD/hkWbS6bj?=
 =?iso-8859-15?Q?2Uhv19/ZWzT7PbvzLylf69WFPfyu4vKspX7fl3Psxt3kIffeeYXKBzNWp?=
 =?iso-8859-15?Q?Us1YWsFUZXTzvfyRkH4E4xQWyto9Zay6poy3k83c5mCZ2lTcRnA7SE60Y?=
 =?iso-8859-15?Q?By4naXs80ViL61up1+kBJ9zkA00bRS9lP5P/I3QnM7DSVXw=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <1C492CD7370CA54A8BE3BC9147F50398@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e77bc333-5909-4cdc-0db2-08db7093d932
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 07:07:30.9183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VMYbvIvwuzxXznTYy8gqHQuiJN9WPinAGA7m2cE4xCLDXVSaNPgrbJ/glZanYxiY1VM1SnvNM9ZJ9tdOvkKVBJL5AjeMwNSqio/W6zrISRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8236
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2023-06-15 at 18:50 +0300, andriy.shevchenko@linux.intel.com
wrote:
> On Mon, May 15, 2023 at 07:51:55AM +0000, Michael Brunner wrote:
> > On Thu, 2022-09-08 at 13:02 +0300, Andy Shevchenko wrote:
> > > On Thu, Sep 08, 2022 at 09:48:29AM +0200, Josef Johansson wrote:
> > > > On 9/8/22 08:07, Josef Johansson wrote:
> > > > > On 9/7/22 21:47, Wolfram Sang wrote:
> > > > > > On Tue, Sep 06, 2022 at 06:55:07PM +0300, Andy Shevchenko
> > > > > > wrote:
>=20
> First of all, sorry for so-o lo-o-ong delay. Too many emails in a
> backlog.
>=20
> ...

No problem, thanks a lot for taking the time.

> > > > I compiled with linux-6.0.0-rc4 with your patch on top.
> > > >=20
> > > > Have been running flawless so far. Boot showed no problems.
> > We just noticed that this change prevents the usage of the i2c-scmi
> > driver on basically all Kontron COMe based boards.
>=20
> Does this device have resources defined in DSDT? Can you show all
> variants?

According to our BIOS department there are no resources defined in any
variant. The device uses operation regions only.

> > The reason is the patch "ACPI / platform: Add SMB0001 HID to
> > forbidden_id_list" submitted in November 2018 by Hans de Goede.
> > The
> > patch blacklists the SMB0001 HID that is also used by the COMe
> > boards.
> > This was due to issues with HP AMD based laptops according to the
> > commit message.
> > Ironically the commit message there states that it is OK to
> > blacklist
> > the HID as the device directly binds to the acpi_bus and therefore
> > the
> > platform_device is not needed anyway. This changed with this patch.
> >=20
> > As this affects all systems using this HID, applying a patch that
> > whitelists specific boards again in the acpi-platform driver
> > doesn't
> > seem to be a good solution to me.
> > Therefore I would request to remove this patch again, unless
> > someone
> > has a better idea.
>=20
> I have a better idea if the DSDT has no resources. See the Q above.

Sounds good for me. Please let me know if you need additional
information or if we should test something.

Best regards,
  Michael Brunner
