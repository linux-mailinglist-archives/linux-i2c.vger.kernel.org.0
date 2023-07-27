Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F58A7648DE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 09:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbjG0Hif (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 03:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbjG0HiB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 03:38:01 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2097.outbound.protection.outlook.com [40.107.113.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0EA35AF;
        Thu, 27 Jul 2023 00:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cd/C3vd6G7v25kHuOJC1mehccHo8FULrBgEPT16dITIgFJVlEBcjVrpmaGPXaf/lJKmydwmpMVqLXR6m1++bjcLbb0wTeVsT31vs9HTHz/3XyKWF4srSREGkhTr4WN4Jun5JSfbjfnAQvJzXEgPlgALx2eY2PAUqSls/6bNqRLcM7kWAutMb78UqA3vcqAgmcrNIwc4vguIuB4gHQgc428Tkk8aX5gEtCzGbbXePKOjmeD+F0/TFyib1k66sAvawFovCqbKvrf7Bh+AdN3R4OcypTa3ULYrp9LxweLcS4F1xfZyL3U9dy5N11XySN5NXRupOSJoydI9tqOSDtz0+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG/dEcdKVRh8PuUsE4TcpdxMrgqSlF3w+8CGpKIP/a0=;
 b=BBqlt1SEE/O5we74ImWadRBDGujo38kXG5wNIbC+IEkMR2U277s5j2anEpgvZqlfH+M34s6iV7kJZBAOE5SbkSHRMJZVW28vXr/ytXEOEDL2xguql7/WOIplCkZ07gpGcKykl9UBx5iTB+S7nQxUI0KB0N/Jn9cBOR5+5Ug7T0wIf0Jytynx8PoZdmpPZ+1KJDZMcimPefe2e+rBAB4Wn13CpwRsSun6OWMcett3JfcpFXIS4W5qf4Y6vcwZLNaTWCW6JVfbb4etCS44yM6kZPwrFi1xfHzsJ2MxiFnenhteVmCXk3I2xNsUj4n69xABjhKEOkrfkAaWirn2h10r/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG/dEcdKVRh8PuUsE4TcpdxMrgqSlF3w+8CGpKIP/a0=;
 b=BX8Qa2HZZxrTnf6kRbe6Uf4na3Ebv2gyzy544g1RtEIEsqivNt5dzEGTr/XPX48BjdY/vQVPskR8UzhwtdeY9gyhGHGPoNVHJ0QFjnnoGXo+AkVrlmw5nmr1R8BvUsB3GhLz6BRGlkp5xgsLNfOMCenlEydjW8i/F1Ee3AYyGlY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11397.jpnprd01.prod.outlook.com (2603:1096:400:402::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:27:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:27:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZv8I//eJwt44Rq0y5OeqtZOu7J6/MQVGAgAD1hNA=
Date:   Thu, 27 Jul 2023 07:27:20 +0000
Message-ID: <OS0PR01MB592248936526C8C453C2E5B78601A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230726130804.186313-1-biju.das.jz@bp.renesas.com>
 <20230726130804.186313-3-biju.das.jz@bp.renesas.com>
 <ZMFNYQHqWrS+zSXQ@smile.fi.intel.com>
In-Reply-To: <ZMFNYQHqWrS+zSXQ@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11397:EE_
x-ms-office365-filtering-correlation-id: b6d7b728-db90-4984-a4d7-08db8e72e9af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JErjGpV+bWG+UeM6N5nMX2RhKLZ9IN4WvVu8KK/4QyVYlTU5rvjqHmoX+xw8nFmX7Nj6H7ZMmLVbzK5QoMlf5jELt9lfUPvWqZvLL6A1iBJOP1jJGjMIC8e5uy4myV73VVnbW8JPM8LlqXWZ/qw7RhbPgeV/2sIBS+XmP4EzZdBv/hrr/w+ru8HzxXy+QovtiUgVLT40menvxWn5/+Hg8YzzOKIXPD1sX5GPevDl97FCKx1Za2xk7nD2ttCwuR8YDPz2/HJ8zmcGZjbfueBIXGXhPjdj7xrEZch9Rm3o662XnJ1GvZ1+gvNLqj9hOV4pfKMS8jDlHcBjEWCb8Tu9zLJ1HEXviegShrg9Q25JnynFeV74B00XHIxxTFj8Ica1iC1prRK9obJ+DPJoUCM6t7kRSv2+e3++1FMCoCx5Kw8QLsVFuPKU3oWE4RkRZ6yusnUqMhRJk4GV6anl6kBAvlOL98RIjH7na33fFkZxnF/bai0Czyzl1dOTKOg2w0YviVE96nLd4ZV/lQKUZxU5PHhYNuKxw28JeDCrWSIdSrGVAH1YHjnIecuz6beUcobeOv8N7j8bCuVHtNojVB4qzT8W3jnYvNdgAU5Gk+QPiGO3ED8UAmPiVsS4XcaSJBaU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(86362001)(33656002)(122000001)(38070700005)(55016003)(2906002)(478600001)(54906003)(38100700002)(26005)(186003)(6506007)(71200400001)(66946007)(9686003)(5660300002)(7696005)(41300700001)(4326008)(76116006)(64756008)(316002)(66476007)(66556008)(83380400001)(8676002)(66446008)(52536014)(6916009)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1pHBXA1DbZSH9px2GX7vxgSU5K04vl7EhUku6Au2ouP6vyOgkCURukh3ybCE?=
 =?us-ascii?Q?HOqK1vwn+HZhYVWl1h8SNgEB+qRVRxRpTOQO2YV4Xfi1zcRqZgEiR2zsPfqo?=
 =?us-ascii?Q?zjT5FM5t+341Lu6bCkqBYW0mOjE6olGmMO6K0q/3pLTkhZ2knQLfy0tdjMCg?=
 =?us-ascii?Q?PSJ7bxX+GDillN9a6Ui3CRKXOXlZ8XA83LTvvMXD/v3fsHWNSdizmele0HLp?=
 =?us-ascii?Q?QMdEuozlDs0wMobtw5d5dm+HDuPR2hrPlbpcqWAlrOICqnHW0kvSuMDHKe6f?=
 =?us-ascii?Q?YtPLkI6JuCN4ob6hyEpB3Ch6MTgZuj4UHZzDEYWp4bmSAVvBDDHjDdkFPE4q?=
 =?us-ascii?Q?3X/IjsJje1oj5Lu27gkeWDFEB2gmBHsCgzBv5PlvmAF6Cn8R8ngbEI+EekVl?=
 =?us-ascii?Q?fV/PQ2ioUXnLlPk3KGpFBK7Rf7su0ZasRVvK6PXFWcH7Ei33Q3paF8nijN0R?=
 =?us-ascii?Q?xHaRTZdn5NwpTp67v8U4KvOpsDdfVa49H/sD3TMoEoFLqi/b6d51DiA8RMBC?=
 =?us-ascii?Q?1UDsFVhcYyJo+MXu4FqNSgXaT85477ePMqo2eirh7KrnL3fgK4vFKH0II16+?=
 =?us-ascii?Q?/1V+VB3Z5ZOGn3kWhpTGXNF58JzrIjikK2rxGthGt5pIyDucNAdrnu86VWww?=
 =?us-ascii?Q?B8s0t1nm7u4gazc11K00Qy4ML3GWQG1A/YNwfYe94Pt+5nzWjC3v2Idby6yw?=
 =?us-ascii?Q?YlktAw+jLQtH9mxdJEryiXp0UvgY1ov+Hbdu6Osm/rtDNuPKTr2N+pRiGBvl?=
 =?us-ascii?Q?tBJSRFKRioZnGhD1lNfbLM47Q+z0hqZLpfXeI13YdtDydnwUOjY4BFqQejZR?=
 =?us-ascii?Q?aHwScLe9s3YAC+38rF2w220D967NRPq4R0FE2PkprtL11zNuS5yF+EHbfq1y?=
 =?us-ascii?Q?JLldmFJLEfExaxgMNShmC+AFfFNge/gMaIO+uUjZHF781s/qn42Gw2Nj0Z2M?=
 =?us-ascii?Q?lv8Nt4HpNN/54+LsNBZJIqJ+7GT/k/qUdNSag26AU/lgRn6c9bqrCtHnyFsD?=
 =?us-ascii?Q?Bujtbr7ZTS2ivY4L17KpwQHVI/+K43klJBgatfH4ixqRsAISXmYPXtjbsdtN?=
 =?us-ascii?Q?H5nk10CASvSN02wP8yVBBMffnsLpigs0JFH77lqSZguVYnbbHVTyHbvy3wp/?=
 =?us-ascii?Q?v5ZtqVlf7RBfXDuPEsW7Iha0OL49n6LYjetApaANMEWfF4nVkb/PJTT+EWBI?=
 =?us-ascii?Q?fZ3lHqP1apfeN+9rx6UHL6/X3FZSw/kV70nBeKdNQaymxb+RO9TzlyF3pRY/?=
 =?us-ascii?Q?ZOuXL/c9jK+i7J5AZDjptkQsDR5MCho+3hZ+y0/vRpuDpIMlkmqLSqoCQ9cA?=
 =?us-ascii?Q?8eij+4ZrkF4gtEvz+UhYhLawsOB1PSNCg93DkN2KIvL4IDoYHDdLEPZyNDJD?=
 =?us-ascii?Q?6U5i/T/mF8HKfV4SvS5IMTkUMHOJFX4OKwgA32s6zseVkDCi55dSudlaYeRj?=
 =?us-ascii?Q?w1dTP+acKF+dsZbXpcqE83QT/qX5TT8jfw44DsjrKiYbW2Jt6p9oaFSrO+/b?=
 =?us-ascii?Q?IIx7meNDsNRExTLFL8boXahGinZ/qwxHlP8e2cCn00KQG44cvIcyEZ+od/11?=
 =?us-ascii?Q?jKlq4g8WroAt72InUQCDAX5c+dv1/iIz81hVGQ2n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d7b728-db90-4984-a4d7-08db8e72e9af
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 07:27:20.0863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9yHBDykQNLBWw2RQjYOp3j3WvVx8BhUOc6pq1u2AWIkwrZTkIyumWpne8n8CcqgqI5lNNNErVyBJuAkzMggquqTMBarnGK86z6NjfJDesU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11397
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/2] i2c: Add i2c_device_get_match_data()
> callback
>=20
> On Wed, Jul 26, 2023 at 02:08:04PM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().
> >
> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
>=20
> I have not been Cc'ed to this...

I execute one script per patch, to pick the recipient list. Somehow it did =
not pick your name. Next time I will make sure you are on the Cc list.

>=20
> ...
>=20
> > +static const void *i2c_device_get_match_data(const struct device
> > +*dev) {
> > +	const struct i2c_client *client =3D (dev->type =3D=3D
> &i2c_client_type) ?
> > +					  to_i2c_client(dev) : NULL;
>=20
> There is an API i2c_verify_client() or something like this, I don't
> remember by heart.

Dmitry already responded.

>=20
> > +	if (!dev->driver)
> > +		return NULL;
> > +
> > +	return i2c_get_match_data_helper(to_i2c_driver(dev->driver),
> > +client); }
>=20
> ...
>=20
> > +const void *i2c_get_match_data(const struct i2c_client *client) {
> > +	const struct i2c_driver *driver =3D to_i2c_driver(client-
> >dev.driver);
> >  	const void *data;
> >
> >  	data =3D device_get_match_data(&client->dev);
> > -	if (!data) {
> > -		match =3D i2c_match_id(driver->id_table, client);
> > -		if (!match)
> > -			return NULL;
> > -
> > -		data =3D (const void *)match->driver_data;
> > -	}
> > +	if (!data)
> > +		data =3D i2c_get_match_data_helper(driver, client);
>=20
> 	if (data)
> 		return data;
>=20
> 	return i2c_...;

OK.

>=20
> >
> >  	return data;
> >  }
>=20
> ...
>=20
> Side question, what is the idea for i2c_of_match_device()? Shouldn't you
> also take it into consideration?

I guess you are ok with Dmitry's suggestion.

Cheers,
Biju
