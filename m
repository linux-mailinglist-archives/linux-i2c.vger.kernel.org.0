Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A3D76C555
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 08:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbjHBGfD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 02:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjHBGfB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 02:35:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E4C9B;
        Tue,  1 Aug 2023 23:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEMrYNdI1WIRFsHoHT2JoqCN6kagEK7gdEfUwD2hdtJaMNkuN3yW5Nh3GrXlYFzVy4SH0snzHfyCKOHKse30LpDtYHQyJJzGJ+hcZNFfBQaPeong06YIZ2/B0ANmf2Geu/+felyRAe43mcjROzl4Nu33ZTR83ZJZaWbo79Mb38/93ruvdY4zu0nwjWWll6LytHanQ80xOe9em8ruLYc9ef1yF7mPEdiTONhxMi/rf8AdBFwm1pB1ZfLgica+J9lmaU5AHnXAxXOj+YZnbajqfx4hXCgzO2LnbinJXgejjoQhtYHPp5rBhAhBGe/8wtCXebgdcJ6j3MCGEPWVQtvuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e6eMw1IV1RzDJqjZYi2mAYYhXX6oaztJLmSBBBKyXk=;
 b=PIpqH7VXK9dd6JjrnwIKjBZkfZ789rQfxnUlo82pcf8KWiKUJ3vcb0Zzj3/dXriQ9K6uTkSp9yIQabFyUnrxSxLC2pXzwxRJZgncyrRz+O4mcdMeKAojHaNv6VE3FdljECeFKiEDdHyt5YEbhe4D2f955EiX026CPYJ5StdL3CzNbs3z9z04zpKOgGOZSQLqQ0VHZesP3LrRDH9UpBUi/7p2cH9Mhuyi4QXdYIev8n0yEssC/oXgpYu3iOZbru2B1xw8WP74y2MwSQZ+58aPEOQi89aMfK1J4HVMn2MsdI1teLILckV87YBYlZA/zfJXHHwIgFVLWcAO5aSrz/H8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e6eMw1IV1RzDJqjZYi2mAYYhXX6oaztJLmSBBBKyXk=;
 b=O7PTCs/iw+/2SjWltJJrvEzsV2iXUYmKk+I4iAF5peX3lBfBB84zJG3f5gcFYLeq1Kxb+SRn3GR5OkJ+zOsP3lD9/F5txuj+Fsz20BqjS4gz80OnK0ly/NIrJG3UwaUiYSozDWIHZZnVxekqwyx5AogA5jW7YvUMgwJ9cTTKC+s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10453.jpnprd01.prod.outlook.com (2603:1096:400:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 06:34:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 06:34:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZxJobTrEvnta3tEGNX72C24BfYK/V08UAgAC5Q7A=
Date:   Wed, 2 Aug 2023 06:34:56 +0000
Message-ID: <OS0PR01MB592215F385BD7B389BDF3B2B860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230801170318.82682-1-biju.das.jz@bp.renesas.com>
 <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
 <ZMldGIYbjDa51587@smile.fi.intel.com>
In-Reply-To: <ZMldGIYbjDa51587@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10453:EE_
x-ms-office365-filtering-correlation-id: 654d509f-8508-4425-4549-08db9322965f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ncbk9oa5HmLWDiqlWT14fgpggjhxjZrGOdHw4shiWYsAynXGMRIzvrJDyd+IhzcQNJyuuFYPA5dnB/Jlt/9BdywEECAAPL4CRyZWByhZm8nTizxiPLWh3S9YMYvcp/2NJiDkbUtw5IYAW6hfsUgNYp7ZRU0p4hgA9dpbuMyoY21ijOXUbw4QuO3lKi3g6dJLDXu4JvjkQoMQGSIGvmHLGbDzbe1YRUc2pL4jF03M5Lbgjj8OSQa95tsxelrNLW6w+CaJ2vbTT+dn5V+NG6/ZjKbJD89BurCKiLjQlje2Z+dpilMbWR+UwrYPpRwT5CfVxJlWedhoMQLWrZeMq6NWtJIwjN0k2QAbCzsvsDr/1/XOE4CBs8BlRFdW5Rh7kkPGaBRNIOozXyUvQOSlpSWh7H2SF73Lw02ERw/LRLfZY0aTVLKp/yI/6FtrqTWy/UYxyxgFs/WzfkvF3GDg1CbZpzfK4dUXzRAFKDZZabbF3fuqvh2NHyaZOTP0XF9cZ1B4DS3pVRJcl4JI6qkCv65kJP/viCtQGq7WqciKXgPK9JghfXGMRqj5PAoDnlQdUfPXUZbIF2QZZ3MZ8qt/esbDKi3CEOhGmzQij5xtYageVLJSq+gPmdbRb6TFB90KwOub
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(38100700002)(122000001)(54906003)(86362001)(5660300002)(8936002)(52536014)(8676002)(33656002)(41300700001)(76116006)(4326008)(478600001)(6916009)(64756008)(7696005)(66946007)(66446008)(66556008)(66476007)(316002)(9686003)(186003)(6506007)(26005)(38070700005)(71200400001)(4744005)(55016003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p/539EBXUd30zDRjjqaprsNU1VDs7/l60fTFNb1iJRZyyR94RGboh4Euu8zK?=
 =?us-ascii?Q?xoDuoyBu+ldcFCAYPGCCVgJzEeclE5W9gBFdht2SMfzr7YNJZqsFjNRJu2Wc?=
 =?us-ascii?Q?2Ua4KPAueXhtqmSizebIDMqK9oTdwrlyvIt99CWs2zphHnjGWj02FofO/fUO?=
 =?us-ascii?Q?mTdbV7Ss9Bo8ap/BLCoBXFnZZd/Uob+qdqzvJtjLVocUi/Ue4NHT5YslZC5j?=
 =?us-ascii?Q?Iauya0rDdZiLWfairRHC1fea3tsKs4xcnJTznRvD/ap/5ELJlpwiZzII5BSh?=
 =?us-ascii?Q?YNjhqI9cqSo4yMwGeG42HZWPpm14Bw7Mnv3fO7030LNDTy/8pjnEDjQyLyvj?=
 =?us-ascii?Q?ruAqG1hVw7sWgLo3m/EXiWYU4Vy0ozF1x7AZ4angySP0kWzMYIf++AuZG4fl?=
 =?us-ascii?Q?HX8LaJKlEu+BcUbBMUKiB0h5UuCnpPYkq7HHc4s4MEghFMS1G87ZN/kZM2Li?=
 =?us-ascii?Q?rby7wI6+eoVMjnQ+960bogQbVuiUj36QaFdHltmT8e+bZ0XFdRPlA1xNIt68?=
 =?us-ascii?Q?evC0c4vLWFnspOnlNi+kcvoWRuoYZjvlPqE8bpKEDt9NaGU/B5M07Ql+VJcE?=
 =?us-ascii?Q?wkE9o09zzJWZ+E3r9g7yDFxDLh3muhaVzixrszfVqLYzV1g3HmaoxPV2tUeP?=
 =?us-ascii?Q?4n/cFsNSJAZ1n2e3gAf/reGnjlrpvjj/UU7D670GfEgAdXk5sCUBlj7S7Bvy?=
 =?us-ascii?Q?mSGQR/cyegC+/XypJhd+YhI4lLWGT2Uqt5piDkXeyJ8CrCtCMuUlzoSq0BEX?=
 =?us-ascii?Q?3fVz1uy1FJKlgGf1yYvJqpmd3l2+F4ghTQ+T/kQBfFnBYRVmGzW1aLTYsPNv?=
 =?us-ascii?Q?QcfHEZokyczdL0d50ZUCyu/ApjM/B1oBnqAr/w1NYQn988QGqVdaUIV/OI6M?=
 =?us-ascii?Q?M5SiVQ4epH/ofQMB1/NodNWxSjAzzOBIstmqEVKnVDF5GX27A+oriztGov8H?=
 =?us-ascii?Q?TQ1Y9sJ0t0y2fXeJaDH+GmMFhAG3BjlmQA+R6yAWz/KvJeiIjQDXmOhM4GR4?=
 =?us-ascii?Q?o0v00oYaKgh+PFj653vm85gCTak1fE4oA3iU7pIlbXd6LQcb5zxQu+cgs5bG?=
 =?us-ascii?Q?cUdV8Vc84mFBYJ8EhxJiGm6b+RWpllU8rvU+ui7poiXLkuFJWtM/Sn1Bes38?=
 =?us-ascii?Q?EGNhhknqSq4h67VJmUtRGG2+Dpgr2SIfJi1xm5G9KEvFKP7NdtsqJ8rJKqRD?=
 =?us-ascii?Q?qQXB//Lj0bvTBvfE0u5kHUUaKwwZU58fCS9jqxbZNgdz8tqcP3dldS/xOhWS?=
 =?us-ascii?Q?g5Iz4WAX3gp161BZS8VYzEoz3Qboy7wJSgQQa5ex9+I/EizWp60qIduKtp1X?=
 =?us-ascii?Q?8p3VCHGZmnEjeiU8zn/M3pxbOPYTGer12SwGn+5sfPrCjXsMjIyDkW/c5101?=
 =?us-ascii?Q?2G+vzelWWCwsZKD/Om5WITWdz3iqo/3CfXn1SBfT5MLk4/wt24XK7pKJa2x2?=
 =?us-ascii?Q?WjdkDG68hxUWFVVmErrL4h1u+07XD3qOumJtVQ4feA6DfDRFIZE4pOVtCiRX?=
 =?us-ascii?Q?cOzMwxKZSg08lxxYIVMEYvX7h0dOP5sZohLSxtdUldcHwTpX9KJyCixE79vD?=
 =?us-ascii?Q?IpkwCRHYd84GbcGwO2WYiTvz0cV5aP/CVmMVW6ps?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654d509f-8508-4425-4549-08db9322965f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 06:34:56.3996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HiWDeTEJgcBO0TRCOcn+pCnKa3AVMIieXAW/bP3/9HVjzi/xNY5aOvS77mZBSecgNelPtAz9FUJWkI46EfGzA6sXUUSHdTCtkf/+xwe7lLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10453
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data()
> callback
>=20
> On Tue, Aug 01, 2023 at 06:03:18PM +0100, Biju Das wrote:
> > Add i2c_device_get_match_data() callback to struct bus_type().
> >
> > While at it, introduced i2c_get_match_data_helper() to avoid code
> > duplication with i2c_get_match_data().
>=20
> ...
>=20
> >  * Changed i2c_of_match_device_sysfs() as non-static function as it is
> >    needed for i2c_device_get_match_data().
>=20
> Btw, this can be split to a separate change.

OK, first patch is callback with I2C table match and
Second patch is for handling i2c_of_match_device().

Cheers,
Biju
