Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A65B76E001
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Aug 2023 08:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjHCGEX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Aug 2023 02:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjHCGEW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Aug 2023 02:04:22 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D30DE4;
        Wed,  2 Aug 2023 23:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V61VGlpIN6KXbHEF8DO6kKXXl3LHaL64fZkXXSVKbhclpJYGMGyOTeGJnmdc2i1hTII1n8wPy6CgLVry7xpJskPbb5pESgkPpefeW+ywD0iKqOX035ExLHk22W1M4Ez283EgxdicuY9MeLEH1yR1UjQ6Y0Vcx05pcDWmqJU5iqpabcwhU1COy+fTVvNvLCsHVzfnW9/XNzNJEUiTveGQoGdDBsadgKy1UAo2VaNX5ZTavnzkTapEtmE/fTFEq4I2LtablILrRQJAATWkHjUn0KLypxLqvz6WIdOscVSWIjS/g600Tl/UOjeIRKFvqOkQAQmdTUT3xthRMjwq1myTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1KzpqAleQEA4blUDMeDX7FbdcE0KZxrFGUzKd+QFAw=;
 b=ZwKayD+3M4fg6vqd9XKg4EVSOKrt/b+oOCOocZs88VOQVztz04exxWSF4fkbUmvmgPlkKezKyEfAvV5FAGLVoNPh/X2CEkADkJJbos5VVXzzoUcjfEzvdqOhbYKYTQWYRWUJu8HQa5tQ24t+5XtLbX9Mh5c/OaOSGPYcT2KeFajvfC1K04MXheFdnQ8jYenRTM0jktKyjpLsHdAiawTz5ySLwhBgxAeglokqQQm53rEqMSDfq7JZeFSNngsygBwCMZIixDR+6kOdMkPIyGFYyX+LuaBBnJNkDkfkYtrbLSXsTSDnF8GmNRdmjHxsAbo0ZL4+eyPbThLVL8SSum1XVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1KzpqAleQEA4blUDMeDX7FbdcE0KZxrFGUzKd+QFAw=;
 b=AlZG8+JvexeEQ4OdaMlNxQ0EwagLqyYXqbnQzfnvr8xQrMo45WIke3e3VK8sW4Ya0Ig3vRLuVM9M/VhFN+oz8InIJkBW4G2o68ajBzT8JOm/jgasX0cEiWENFLZUg7HBCAqWryDPafGA5+914MAYHNao8a86ssYbmDuSS0/GgMY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5794.jpnprd01.prod.outlook.com (2603:1096:604:b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 06:04:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 06:04:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to support
 i2c sysfs
Thread-Topic: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to
 support i2c sysfs
Thread-Index: AQHZxTPGKVbxcn/JNk6+MhlvEp6rX6/XiUiAgACMKhA=
Date:   Thu, 3 Aug 2023 06:04:17 +0000
Message-ID: <OS0PR01MB5922B8107B9D566ED453703D8608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
 <20230802112317.252745-4-biju.das.jz@bp.renesas.com>
 <ZMrNHXmRppNWgTHd@smile.fi.intel.com>
In-Reply-To: <ZMrNHXmRppNWgTHd@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5794:EE_
x-ms-office365-filtering-correlation-id: 193ce1ee-451f-4ce3-3ecc-08db93e778ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7pNWmspkt3LQVDVtG07IRVIGpdN66BOPilGc92j2q0uaoCoiQWKIE2nrPp8YzYB9An9VzXy6tguNNue2t9w0+ZPqU9vafqGPRki8nNQm3onaSQsPnnt5JUejJ5POQ2MoOkp5IIGhcs/c6vHJcfAvIclh34bslSM2A2WU1DXtkydLa9xeIyQDduw2TXOeXik86Cd7upISKRI4lcmwerh7hvXOPsOgw3LJCb2+X5T8qpi7b7bi3+GtCToEN3uEWQ1h3yrqdkZ4+qvpZLWbdGO62ZhvXPI75srD3vcCE80mz805IVmW6F+HJcdVJ+BRI8ckPjzH/T2Y1nBa+CLa5esA02/84znU3bFC3F6K4rg4nw1g56eFHWyGWNs5AO3wAR0lmacREUxpkgLOtqaCdLFCj5D2UrEhHkQ04xF2r44BgJEMFqQIZk+JRHVdDbUTJ9BWhGsq26PvM5x1N8Ildr7s/116mcg4Gzp2q5YknE7AwDIJ05GW8jY+KI2CDRMfqzrjDxGm7QnCclY3BVuxc9fFqHpTi/Jml5RTHWqdOi8voxvUjD+MQ4lLxY7caOP3o3BP31/02n/rxa2emRG7eowfP11Cjhpp6sdJPQX0FHdpDPJx7mlN8mcLVkoNKnGoSxSt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(6506007)(26005)(186003)(83380400001)(316002)(76116006)(2906002)(66946007)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(5660300002)(52536014)(41300700001)(8676002)(8936002)(7696005)(71200400001)(9686003)(478600001)(54906003)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8lYaILCSDBO8HOVkGMQCfE6XPNd84NFMjeN8aRd5xoHqh94vK7vlyrjYyAae?=
 =?us-ascii?Q?sdTzE3J8YeJzT/4f+zAPPLZhOqvPCgv/qufrymdQ/UZOs/rts5FwfwsfBZZY?=
 =?us-ascii?Q?+6R47Du2VuRNqzEg23+o0OAUD/3ZQiBy+LnlHgiryQqggkDTuGpzp9cCcmbl?=
 =?us-ascii?Q?Q7zF4TV1iPFMnlmz+uxFTYzMuNkSk3IX4Z5uc2F76veKFmP5yTqSQ/Xj7Ej5?=
 =?us-ascii?Q?CewJcanPuXDsrCA24wTJnj9HewnLDsgdWijn/nEpkAPPMb56YIS7oMfP/ONP?=
 =?us-ascii?Q?Nmi8fsB/shL9v4iWyFJXvPb0jiJuWQZZrYTzmG8vc26x18NtoMbVoe3Viwbj?=
 =?us-ascii?Q?uoQzqwxh29CXF5/8Nj3cPHzKRwFEGf4WrAM7mNFQ8RYjhbUN9tJt8pzilMWx?=
 =?us-ascii?Q?aIOYOJZG+NayKQUHV8conGesuowEDuixpJHNNBplHXBBPu2J6tyTKfApwDbG?=
 =?us-ascii?Q?lpATJrHs/X6v1ogba/ANwZTSS5RdSKK8G+UAFREBNSbfrjrXnYqVw+o9E0kJ?=
 =?us-ascii?Q?9Mylgpo/IFwLlEPqTJWCmi3o3VzVqSb6WLlYb3NviNhQfWRBznFybjlERw50?=
 =?us-ascii?Q?HpGeKd2B/0asOSOtYFVQCYGnZrxBCYSrAV1dpK/6Gbfo12TN5ZIObqg26suO?=
 =?us-ascii?Q?xaIfv9crMCqaHMSpoxyx1OgQqaJ8qNqng8WNUvnWfsRhTEOmvhDcNc6aJW+L?=
 =?us-ascii?Q?UNxj6r05Gjx8XZyf2RBIAmrSxuDVOHghinMgrWqRx1o4u087GLxF7NqYD03b?=
 =?us-ascii?Q?6PuoBy4y7skqVJV8OJBIHfSRJKjp2EbnK4YZb4G1gmJWW8VSgwn5Y1Hm5psZ?=
 =?us-ascii?Q?bKNCc30CVYDdj9G43DXMJgVFM5BPOt4oXqByOd7iTh1XroLdj6dOTVYYJx8A?=
 =?us-ascii?Q?IILo1+22yN34VcEYNvLMPFpGFJ3hmiWcyq9SZkdtn4WEiQqJsmbt2LfhrmIh?=
 =?us-ascii?Q?XEadlgRtv1Vl856ndqiKfaH2By0ndRjJmMudr44JbbuGRZ6zCKMaS0F4KpwO?=
 =?us-ascii?Q?0Q/aJDmetzKnPpQQdiiMnj3UopIA8wMaU7zyopm7RNIFD47Z+qvVlCixhqmk?=
 =?us-ascii?Q?96neUEiSca1E0E9cnfeyK9giztO2oKQirZy7w4LUvBgsQI9DCiPs2KFuBe2Q?=
 =?us-ascii?Q?39YwWJdEg9dYLwK9Rf9oumTiE+nn1L9/FtsActlo6v4y5C6rjSrl26+qOr3N?=
 =?us-ascii?Q?KfSHivw+jaAUkFUL+aWueIex/X9ZXnxpKeoKAmdyx1xWlra+MCldkCUa7ba3?=
 =?us-ascii?Q?IZyaM56q6+hB0vWHUY0t2ih0B3p4o8r/syQGnE1lOwxPiIN2yLVqfIhEOmzv?=
 =?us-ascii?Q?eSWNjeUzGTVmAllBpiNWS8joHCCEeDe7VWiXCGCmvG12x3PWeobyH0JJF+sJ?=
 =?us-ascii?Q?a18envNB4N2DMOZAbSnYCPYXYHzku4xdPChQIXoAXody9Tw6LbFUq+laVyu8?=
 =?us-ascii?Q?9/irAzbQ7MjJrxKuDohncUDjsszL0mR+xywzdtO6Zquc+g19ql2oJyiSLl+0?=
 =?us-ascii?Q?Dqa2MFGaeUOreWw/MJ0nVid8akVV+3/V0Sfl786YcFle/xCOEey9/T9f/iv+?=
 =?us-ascii?Q?45Mga3Pr135OmSHXLM01NC7scFQQp5q7LFakvn7b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193ce1ee-451f-4ce3-3ecc-08db93e778ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 06:04:17.3902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eAd3jf/h19inJLdCQTFE8hfMqXZUZ88w84BCW57RndASuZS5ZiQwtOVZZtksIka4g91g2d39ilVC7MAzqB3LH/e/kxI3nQAOXc6qk3yJMjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5794
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to
> support i2c sysfs
>=20
> On Wed, Aug 02, 2023 at 12:23:17PM +0100, Biju Das wrote:
> > Extend i2c_device_get_match_data() to i2c sysfs interface by changing
> > i2c_of_match_device_sysfs() to non-static and call this function as a
> > fallback for i2c_get_match_data_helper().
>=20
> ...
>=20
> >  	/* TODO: use i2c_verify_client() when it accepts const pointer */
> >  	const struct i2c_client *client =3D (dev->type =3D=3D
> &i2c_client_type) ?
> >  					  to_i2c_client(dev) : NULL;
> > +	const void *data;
>=20
> Oh, yeah, definitely, please follow advice for previous patch I have
> given.

OK.

>=20
> >  	if (!client || !dev->driver)
> >  		return NULL;
> >
> > -	return i2c_get_match_data_helper(client);
> > +	data =3D i2c_get_match_data_helper(client);
> > +	if (data)
> > +		return data;
> > +
> > +	if (dev->driver->of_match_table) {
> > +		const struct of_device_id *match;
> > +
> > +		match =3D i2c_of_match_device_sysfs(dev->driver-
> >of_match_table,
> > +						  client);
>=20
> So, with this it makes sense to have
>=20
> 	strucct device_driver *drv =3D dev->driver;
> 	...
> 	if (!drv)
> 		return NULL;
>=20
> The above for the first patch even. And here

Agreed.

>=20
> 		match =3D i2c_of_match_device_sysfs(drv->of_match_table,
> client);
>=20
> > +		if (match)
> > +			return match->data;
> > +	}
>=20
> > +	return data;
>=20
> This actually should be
>=20
> 	return NULL;
>=20
> to avoid (potentially) stale pointers.

OK.

>=20
> >  }
>=20
> ...
>=20
> > -static const struct of_device_id*
> > +const struct of_device_id *
> >  i2c_of_match_device_sysfs(const struct of_device_id *matches,
> > -				  struct i2c_client *client)
> > +			  const struct i2c_client *client)
> >  {
> >  	const char *name;
> >
> > @@ -141,6 +141,7 @@ i2c_of_match_device_sysfs(const struct
> > of_device_id *matches,
> >
> >  	return NULL;
> >  }
> > +EXPORT_SYMBOL_GPL(i2c_of_match_device_sysfs);
> >
> >  const struct of_device_id
> >  *i2c_of_match_device(const struct of_device_id *matches, diff --git
> > a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h index
> > 1247e6e6e975..e4d397b67989 100644
> > --- a/drivers/i2c/i2c-core.h
> > +++ b/drivers/i2c/i2c-core.h
> > @@ -82,8 +82,17 @@ static inline void
> > i2c_acpi_remove_space_handler(struct i2c_adapter *adapter) {
> >
> >  #ifdef CONFIG_OF
> >  void of_i2c_register_devices(struct i2c_adapter *adap);
> > +const struct of_device_id *
> > +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> > +			  const struct i2c_client *client);
> >  #else
> >  static inline void of_i2c_register_devices(struct i2c_adapter *adap)
> > { }
> > +static inline const struct of_device_id *
> > +i2c_of_match_device_sysfs(const struct of_device_id *matches,
> > +			  const struct i2c_client *client) {
> > +	return NULL;
> > +}
> >  #endif
> >  extern struct notifier_block i2c_of_notifier;
>=20
> That's what above I meant to see as a separate change.

OK will create a separate patch for this change.

Cheers,
Biju
