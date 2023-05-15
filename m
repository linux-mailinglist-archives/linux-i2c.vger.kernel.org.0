Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7690E702671
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 09:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234659AbjEOHwb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 03:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239918AbjEOHwE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 03:52:04 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2123.outbound.protection.outlook.com [40.107.104.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435CF10C6;
        Mon, 15 May 2023 00:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEZb/emQdcHpjBEkHEcggrY2jcelfJFMuCPbivdoGtbRpEENXNhlXL+AjKafOnc7lVrllGOeLUKKXZJxRj341XNQBld8lw1VisutdyVtUqHzaMpu0vWEqfN57QYUtx8JKdxP4aMlaLZWXqdebMZzVLK/X1qxTKrzUU1hpNwRwsnN2nXqQNAPP4eR9ryOGT+RBtvHWTqLszQQMoqmobnvzq/NjSu5VJ8QczS8J1OIelv13zf6Xc9qzKGiujAIMofyHsMRmcBPlWI11k4eB7t91nEVcgTrFapnoJUnl9HuHAFKK8/lvjZC/qHAmjmVBS2aBYGTVP/Kv3oGshn1YgO4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTv5VjshWkxZJX9E+FOKC3uUdwETXnYxlv9yfjeutJY=;
 b=fhcFsqC7bPzhr+1TM1IOTsQ/XsPcoH87umvB+qz1mEAjIJtwnkedE+qmRq/G5jMDQTaXYaTOJPi1LJVhQ0xshsjljlZQbph5Gh/Dtzo54LJ3yLmi8RCUOxLkmE6osJKzFSvg1L1tgC+PRzinvrMtiwtRzCj/qRZ1BXIYgVofkn/aKqthrAnj3PCXYQwZ912k726zFVNths/6ZXuGCw6gBFb4kl/fQdbs0hri4Vq+jkg2ufFsg08myI3d+43OiAwitxoMRLlXvWlkZeQua0cLJ1C4cFOfrVN/9wE5PCxEqLK0/oo+TJ/xJjDraANmETmxoSR2xV7FuF6ZqCAaBCCs4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTv5VjshWkxZJX9E+FOKC3uUdwETXnYxlv9yfjeutJY=;
 b=RFwriIS0ExLtlnzVqWkdVqU3jwZXaRgMGYpcBq1L6KCPtx30mDcofA+6204budhUxrXVVU7d+xd5ivUyG56c4B+KXC9koTBVCyt7jaJ3JxRFMtK7R9HPsSEoDFwhJAOj8i2t29sRfZb5/8NbG03ltQhXFBXYjeVX6ljtcRcCcak=
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:591::19)
 by AM7PR10MB3461.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 07:51:55 +0000
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::90bf:46fc:e7bc:cf13]) by AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::90bf:46fc:e7bc:cf13%5]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 07:51:55 +0000
From:   Michael Brunner <michael.brunner@kontron.com>
To:     "josef@oderland.se" <josef@oderland.se>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingmar Klein <Ingmar.Klein@kontron.com>
Subject: Re: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Thread-Topic: [PATCH v1 1/1] i2c: scmi: Convert to be a platform driver
Thread-Index: AQHZhLPcdOnTkTPVbkq8yl7yK9h/ZK9a+tMA
Date:   Mon, 15 May 2023 07:51:55 +0000
Message-ID: <60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com>
References: <20220906155507.39483-1-andriy.shevchenko@linux.intel.com>
         <Yxj1ZQjBfdG1u93d@shikoro>
         <23c8fafe-af56-afb0-1257-222705bc36f3@oderland.se>
         <b8eff79f-0be0-e6a5-64ba-e085b0ea52b2@oderland.se>
         <Yxm9tlb4H7fspRMZ@smile.fi.intel.com>
In-Reply-To: <Yxm9tlb4H7fspRMZ@smile.fi.intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7551:EE_|AM7PR10MB3461:EE_
x-ms-office365-filtering-correlation-id: 2197a928-566c-4fd3-5679-08db551940ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hCmSTjWXdwCoLOI2ydmekhXqI7yMs049lhJNjymSv2i3WUqBlUBgci9tOvNxDiSyN0/CcBnCldqbFczlA6wn1m72XXYcguKMOogfCHo4+394zf27IJbdAZu6UHaXor93HlFyfq2xoxdfX9rYEhZmN1sLWknjTBCUgRiI9p1s1xFYv7EWrIuoLsrvUctUoe+q9vpgRTDhbnwmt1ZvHUC3ROpMXD5+sx6VLT1dw0ku0XP5isCHIJ0n+5rjE6OFwfUTVfLbMbh0oedLj1qqv+YLrfDUNLFcxOTWTyxcL59QLSTcs1s6jKRbNAMp/1dKHvFxvlY02+9yISOYDrKrFZRLwneVr+rguuNG8PrOPUFCjFzc+voO5zWRt07cjGDJedJeKCOSKS98Fl9itaP+QZyZaJl04xTC3uNFNA9YvdOkTnYlV/epTZWKBSi2sGLbU/3pr0Yxl1YAH4tyOREp6J9gZRj+5urL3MOtuEevyXCHpxIM2Ej3lZipTBE8CspGKWWV/9a5lMaICbsaUD9dhFdrtCflPX5m6PtzLTch+brzjo5gKIH9dC98ZNh6mgrET060UDMcuye2A8nWIx1hI2HH8hxpNEF5EN+bPFpeXiTEM3jv1q+hWdcvukD1aLueTYDu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(451199021)(66556008)(66446008)(64756008)(66946007)(66476007)(4326008)(478600001)(6486002)(76116006)(86362001)(91956017)(316002)(54906003)(110136005)(36756003)(83380400001)(26005)(107886003)(186003)(6512007)(2616005)(53546011)(6506007)(71200400001)(41300700001)(8936002)(8676002)(5660300002)(44832011)(2906002)(122000001)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?RDdEXGdYVun8uKjWSC4suXvqAIX8uTWeRALKb6/ncMipkGi0kGbViD0dz?=
 =?iso-8859-15?Q?iXX96lPbMI94PIM/A2LEkEuIkMNPZR/rZry++B03P5il3R5otqr11mlZ5?=
 =?iso-8859-15?Q?UAACS+4AICnBFIzcZFTp4Ijfc6S/NeNy42O2lwUFIpJ/H8moEQeOJkCHy?=
 =?iso-8859-15?Q?J7GZyMOqYi++Ylab+tzxVK6FSomCm50+3SDp5MYTPfvtTZS6UKGD6thdP?=
 =?iso-8859-15?Q?aPfLbxh5CNuIcxJ8TrE0rSWxNej1NQj9N/dR1dfy6dp29m1rtBSfAlyzX?=
 =?iso-8859-15?Q?Swk9Hx/0LEtVy2UFibaozP0XF0Lc+SWnEB+XIxD3q8Q8+AGXmIBAQvaoI?=
 =?iso-8859-15?Q?tuh5LCqsDqA39Obf/84Lh1nVwrsv9fiSDJQOiQ3JnbaanfVlLsJJY/XGR?=
 =?iso-8859-15?Q?TY8cHdQDQA8CaFpto6+ISjkTYAWimqpwxkxUNMoRehvSEI78ujYCRbO+o?=
 =?iso-8859-15?Q?uLObLG/JBBCsvSIY2WY71dvLZE9e+wmPn5pQ/IdH9AePTlQOvUVi+afVG?=
 =?iso-8859-15?Q?bEirLXKp4ZeMyyqCliZhk9W36U1hqvhSqu/reqMHlZq2V++PIuR/Ftnjn?=
 =?iso-8859-15?Q?HBwTjgLokyP8TkQZc779mrK4hBXASuXRUb+domNlUAJMl17QKhmmXRYj0?=
 =?iso-8859-15?Q?ngpDP3Y4WT6TvUF87+o78cKblM4UmvRhxZcd/ojPxIYNK2uJCruMurbkw?=
 =?iso-8859-15?Q?5H43Ou5pZTNDV/7gaZDFxnVTlX4ggtuGdELhysoLIXcB6OWnJxjUkKk6e?=
 =?iso-8859-15?Q?Hw0nhgob0wtiIuYLsbFTtOWgSNE0PTAKuzyU6/bQ7UM6VuGK0haq9rY6W?=
 =?iso-8859-15?Q?wwGz6oVJqxU0wAKd16XHpMMvYftWse+honqhoLR46d92USJ/LbIv8h70o?=
 =?iso-8859-15?Q?UlrjSJAPdMP4H1hdszjz7sfFW4gYIe9B4OhmypdVJzM49ZlQeOmuHyzfL?=
 =?iso-8859-15?Q?16Q+p2lGV+m9JUzbLo3emOqKN+CBCaKQhZG//OB3QzD32MMNCfn1XeO/3?=
 =?iso-8859-15?Q?xxNqumnJH3e8W38NXHb6qR2bn//CCe3XXbl9BgLR7wD1PSyIWwsxlRK7x?=
 =?iso-8859-15?Q?Olpt8PmZCIFdnMVd/P7C0sVhQBsMDRSUHAcZMwZMIoE1IcZlGmBWXah9+?=
 =?iso-8859-15?Q?xpOmgxs9tipkUZrkjL0ZO+gYXZnoJveC5/ayCraATUDV579RdgJcJbrDz?=
 =?iso-8859-15?Q?RciiqsvAMMHoRlM37Y60bCTd9hAHRpUoCCjdty3KvUaH6vIlwOZ4tlCvU?=
 =?iso-8859-15?Q?Dp6rrY65qoJazggYwudnIVrE5SGrMi9YIEle7rIga82GlrbwmAMnqHIzX?=
 =?iso-8859-15?Q?i2U7WzQfdLvarE+5U8ipASsMg41BEiwuRk0nF/HdyDJQvhOao14JKV4aP?=
 =?iso-8859-15?Q?zhJjTjcBO9MMYGn+A0RdjP+v4xA/DUfF04tIvujpi9Jl5cIzh0+sjqzPh?=
 =?iso-8859-15?Q?Lkc269l4cx+9ecwVIdYlw9asLSrvkq3LpfWTNloMBuzFwWkDC+/T+itmU?=
 =?iso-8859-15?Q?aYkWPCxGKKZ7FbqyvJ3dMNPPiEiEvY+xFXwfJJSqHPq6TsY8X2imoUGAO?=
 =?iso-8859-15?Q?vun3g7npv5pQjb1kfs8ZT2GWpIYFfR2Gl730yeyRvi+TVf+UQkP3kcF9B?=
 =?iso-8859-15?Q?4TYchub3snW9S9+DCJTCcY2IhYJXeYvvg65RdZOjy2ryGPy92EGVYFAPa?=
 =?iso-8859-15?Q?DWnI/QDzrj0WXXtB3SuBF0nLVnianiXNaXOSc0Ca6zQCNkM=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <3F880A2B01CA5D448907C9CADCC21FCA@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2197a928-566c-4fd3-5679-08db551940ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 07:51:55.4500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ug/r6Pc+89v1s+Fi269Q2x9txmnr+DMGBZP/H+J4GJfzPHv/aX4NIrYyombomkXPlq4RR3U7SsqS6AGUb34t88pw7HetJmIdNPCN4xt0nIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3461
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2022-09-08 at 13:02 +0300, Andy Shevchenko wrote:
> On Thu, Sep 08, 2022 at 09:48:29AM +0200, Josef Johansson wrote:
> > On 9/8/22 08:07, Josef Johansson wrote:
> > > On 9/7/22 21:47, Wolfram Sang wrote:
> > > > On Tue, Sep 06, 2022 at 06:55:07PM +0300, Andy Shevchenko
> > > > wrote:
> > > > > ACPI core in conjunction with platform driver core provides
> > > > > an infrastructure to enumerate ACPI devices. Use it in order
> > > > > to remove a lot of boilerplate code.
> > > > >=20
> > > > > Signed-off-by: Andy Shevchenko <
> > > > > andriy.shevchenko@linux.intel.com>
> > > > Josef, do you have resources to test this patch before I apply
> > > > it?
> > > >=20
> > > Yes, I'll make that happen today.
> > Hi,
> >=20
> > I compiled with linux-6.0.0-rc4 with your patch on top.
> >=20
> > Have been running flawless so far. Boot showed no problems.
> >=20
> > Thanks!
>=20
> Thank you!
>=20

Hi,

We just noticed that this change prevents the usage of the i2c-scmi
driver on basically all Kontron COMe based boards.
The reason is the patch "ACPI / platform: Add SMB0001 HID to
forbidden_id_list" submitted in November 2018 by Hans de Goede. The
patch blacklists the SMB0001 HID that is also used by the COMe boards.
This was due to issues with HP AMD based laptops according to the
commit message.
Ironically the commit message there states that it is OK to blacklist
the HID as the device directly binds to the acpi_bus and therefore the
platform_device is not needed anyway. This changed with this patch.

As this affects all systems using this HID, applying a patch that
whitelists specific boards again in the acpi-platform driver doesn't
seem to be a good solution to me.
Therefore I would request to remove this patch again, unless someone
has a better idea.

Thanks,
  Michael Brunner
