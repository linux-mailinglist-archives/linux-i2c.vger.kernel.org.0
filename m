Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC2976C4E1
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 07:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjHBFb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 01:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjHBFb4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 01:31:56 -0400
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2073.outbound.protection.outlook.com [40.107.117.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490A5C6;
        Tue,  1 Aug 2023 22:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcTJYEOHvrEaz1Hz+abZja5yUrd/e1CfOdslrOfICLT7Y5UM9SvV1mBYXNhdcngQzbuxnLaFsi/SVReJRDcd0Ogpe3edFGbzIXWATNP9FOdK7S8L2P7GN58HQDAE6q2/FEOGjhfjFT50GgfMtdDGQcGQJSWb29tXwLrGwAIy638RedeqwBFyaYaRrbbF5iIDk42O4trUkWJaELGtkQnJsvCkp7ux2rNyozQmpWanL9kYwrDX1goAOU5ZKYtQnzKBwmQLymiIK8lHG7j0cZSIQLpeFMDKQIri+/TW/navoIWt2FpeYSsJm7k0ZfipPbqJrVZnrl4Gh1IRwmgxLIgF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS7YfN3XkV5ZfjyE+mEKXO3ggxFpc0cnFGWWGloJ7LI=;
 b=Ngg+scIKeaLIoZGEgPBThDU8R1Df9GFhyvvnqzRzROGO9UxEA12pdq3c9kXZjQz6HHcPla6pPFan26WkrFi0cSea6aD4xr0t+goUtpXgWlPp5MucHCJKlvsWWZ9g1sbmn8+5C5XHVLeY32vmCzEcQ/4fDyOYzXiJ+JvhqZkmgbhuc7lp1YaHm5BXEuxp+Y6hvYK92mufMNCIj19h/otRL7HUiawBfcTTylgO/jJ+hDY/ixdVTAKcSSFJfOTISfV75h6qHxejJ/MNB2eBPFZ3+P4yN60JP+a23Uogbv1CwCsPOqo/cqRNpeAz3QSJ6bOlt7L/nkvNaO2yeKJjMoIOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS7YfN3XkV5ZfjyE+mEKXO3ggxFpc0cnFGWWGloJ7LI=;
 b=RpPDNPwppa60tuXqFhWEdUbKPlGpokwTm93ZyPmCwMnEpAFg/nDhStSFtds6ZOPjiIEG6rP5XGzhiZLxEFsdo8pBwaARj1+5eGeQjGgPH+gbEuA8Yw7AZFmIN1/2i0OIdYdoGmg3J+PD1iyT9UkTfQAvqN/N3ykiKdz3XiLfgOmW96Y50c8lR/weELhTTRr2chJVJetUm5ayMpkR31xj5N2im9cga1noj5y3XJ6/HAkeCT2Iw+KT9HMRPVl3RZrB2m/0hYxSSXIwZ7Rhk/WZ+H1WRkCjOnsEBDG+VnzM7R7fr3LYW/OPAtAfyfXPHUdk59Z0EArfUJDIoB0Z65ypkQ==
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com (2603:1096:4:172::14)
 by KL1PR04MB7080.apcprd04.prod.outlook.com (2603:1096:820:f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 05:31:50 +0000
Received: from SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0]) by SG2PR04MB5543.apcprd04.prod.outlook.com
 ([fe80::819:57b:cc1b:f5f0%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 05:31:50 +0000
From:   Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
CC:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Topic: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Thread-Index: AQHZdpWBIG2M1qq32EmedgU1uUok9a86egWAgI5AU0CAABR2gIAOSAuA
Date:   Wed, 2 Aug 2023 05:31:49 +0000
Message-ID: <SG2PR04MB55438E9C5E61ACB9330D829AA10BA@SG2PR04MB5543.apcprd04.prod.outlook.com>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
 <321a84c6-6d74-4042-a6ce-6229073c8d30@roeck-us.net>
 <SG2PR04MB55436F03F6CAD6D415FDEE40A102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <e093a52d-e36f-ec26-e218-1e3b3b400e34@roeck-us.net>
In-Reply-To: <e093a52d-e36f-ec26-e218-1e3b3b400e34@roeck-us.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR04MB5543:EE_|KL1PR04MB7080:EE_
x-ms-office365-filtering-correlation-id: 8a65d873-91ff-4fdd-158c-08db9319c583
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1M74H8te/bgZcYPx0otzeyKrxQPsNnA1++Ksee7JRryUZyiqYk5rYuSps6R/PoqJLouYrC8y+UVGJ5zSxsZ+ZJKdm1xZUrk9wqlttWmgE98ta38SacoEEsJjm+P4grQKEviM+eovrbuDl8v7nRwydLS7mra3ElliBRJZlsDzd3ldBf9O0TyoeNlF5NTL/EYIrtRGnd60uIxMpBMd7ZShuk/DB9oqvwQI2KXPcM6j8SIEJwfI9OEmrzTPbLV4arxCJKRR6ZhROXWENJToWQNeHJ3uwd5ZAwbAhf/F7kE9PqG+Le4NMRxy3QHIjI0qms9f96YWnb6qo9Ff50q4+lvCSu867zPy/SfCX2KAoRwaDp+xal0yeze3LWQCfbtP3w8MwYWtniVmaAAbgagND09SQOUVPomgCLci86l2m9mWLfYvkbgFd4tH+hJszXzcvWoTHCjHulXOOQC2nZJ5k4Fx4mwcDxc8/yS0byC/eQgwOidAvl3OFpKUtbKES4Zls3AgP9evpXl7+I5AChrCDGb+zLdw2yW8klXKMK4XqG28LWFy0pQm7IxL92wuatPPcszGYU5FM2hpJw8yyJkK+2xzHRsGZyBLK/jNQDL9jrJVWEQSSZQaNiK4ANnao8uJnahu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR04MB5543.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(186003)(6506007)(53546011)(26005)(83380400001)(316002)(66946007)(2906002)(66476007)(76116006)(64756008)(66446008)(5660300002)(52536014)(4326008)(41300700001)(8676002)(8936002)(71200400001)(7696005)(966005)(9686003)(45080400002)(478600001)(54906003)(110136005)(55016003)(38100700002)(122000001)(66556008)(99936003)(86362001)(33656002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IY3hQkYQQ6fIFLsbA+Zy8Lq236C7oG2bkf91vdhd3Vj4R9zhvInfA6AckMaO?=
 =?us-ascii?Q?jy9W0FWtyXgBw4Psc5jcFqu/zT7T4mgvvUsaNGnJuCh7VF5oGm4bmEC8iEr4?=
 =?us-ascii?Q?cNCGJfwjfxXgK9uBe0Q004sS02KLuG7aRfbAHopuNxeBWJQDmj1+7TnfPnPa?=
 =?us-ascii?Q?IeIttY4xJj2m2uvKYaAxSZvt6jHmpyvoJ76Pa3qhUR5CGDaIvpoP/TgvcBDc?=
 =?us-ascii?Q?NeSAXkQ+wrTfd0Ooc1hohhWuC2sZVb6WYZJzXgzDVl1cXocbmy7utJt49EUv?=
 =?us-ascii?Q?wNfjKmfK6Dw6oX1O61gI+T6nL7/wDFRCeuiPyWigFUhMpJIrv2UeyS57wn//?=
 =?us-ascii?Q?c4aGZL7Tqh16usjOQkrkN4ekWLWP8DpDJS894nWvC9/Ayy1vF1bg7M9pGz5w?=
 =?us-ascii?Q?udRZ/hMfKp9yGPJXhtU5UPbNd5cjZ74XIIsQPpzjOogcHg65G1HdNHtjELZl?=
 =?us-ascii?Q?BPPmZHvfQ2S1dKcSY8l0KsFbd3/udKHmd1minHVLKF685M5/F8sYg+VY+7RY?=
 =?us-ascii?Q?Rf+TWze66DO8AijCw9leW26V2porxwdnaU5RH3hct93ErgMnNUIp4eRGuwTg?=
 =?us-ascii?Q?wxCCi4FMFrUoxyIm/ZKkDaSLBV4ViYUyGEfS3TmvayIORKO8zQMwKt8Lg0TT?=
 =?us-ascii?Q?EPr1yUxRzSOBS1zZzYYBTE0ZxQftuJ2zZxvsYRlWdSC0rf6e0nUAw+635klQ?=
 =?us-ascii?Q?fv41X8d15V/sKfbSviarBWWfbSuyYFB2csEw2wRcsU3QwMqXMMteWL26+A7m?=
 =?us-ascii?Q?9BSyF/Z2ZC8JRdJilJNwjUqgE0pNYbDkaZoRoFlkqSUw15V69xK3K2GKnlZA?=
 =?us-ascii?Q?gH3NWPIjsTKCYnHvl46nWAw49XVhIOzwtzVH+E17KoMprGkbTHh+4UPVGR35?=
 =?us-ascii?Q?H0ocMV2UsLRWYlEnQWJuX3cjvKLeTp8HtuQhNpVy0H0PftdzvJLaaRxDYsch?=
 =?us-ascii?Q?38G6m4OGu8xIMTj8RG6ivexzc3cBi6dSDNO5j8u80DHnG3Z2J1rsQDX7/wXM?=
 =?us-ascii?Q?HOmu5aL+IsRomtOt1Hb4O2xWPcjb6VqANwog5fd1loceonBvueqcc2YZOgY4?=
 =?us-ascii?Q?RvPGXX2S8/klIA6gbPBSylz3psplyKS+lo/Do0VKC/AoGLGCCQ4sugUJqWAd?=
 =?us-ascii?Q?bqAJFdCdPIq2NA8nkNd063sZrnlTuoncKUiSDctq6R5JFEjN1AJiEkqbZLUg?=
 =?us-ascii?Q?AEYHvj55p1GAQqQ7iNAw2j3uVKISpM5wuHjc6NhJGiM9qCC691VpSC88LpCU?=
 =?us-ascii?Q?EiV3ntPrvfHBe3UoSDEQbiadIwIM810SozDiSyTFUt/uNrWckx3zEOfos2oV?=
 =?us-ascii?Q?ZgStyhGs/TW+HCEHfo26CRhU4nVtQIXmWS8Fc0nuf4K+ICDnEQ+srLtzn4ww?=
 =?us-ascii?Q?AefGomGtRvHglb4KuMN6xzQUcjZM2fcP8/gQcaXD+H3IaPBt6jCwgWCl7AQ2?=
 =?us-ascii?Q?mlTOIXSAtAA1OcJ/RC386VOBbU6r8Ws+v6I9JEOJDEk+hkyc6XisfKxd6NdG?=
 =?us-ascii?Q?RSH3O7nOHQyr3ZpY1gKEt7NrTkXmITKXRU7rGx0zK/AH2LJrP10ZeCDfPIF2?=
 =?us-ascii?Q?QVkowwN7AZrIbkucv3rWJjDzrtyFwLLP8fXzuN5x?=
Content-Type: multipart/mixed;
        boundary="_002_SG2PR04MB55438E9C5E61ACB9330D829AA10BASG2PR04MB5543apcp_"
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB5543.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a65d873-91ff-4fdd-158c-08db9319c583
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 05:31:50.0011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OarQeTSb9j34QvoxL+BhilxgfZng9/wX1e6C6cjkn0hhbhOh+K6xJmIUhLD1RuHMvCVlQrx5Urk+nKLK2sSBoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--_002_SG2PR04MB55438E9C5E61ACB9330D829AA10BASG2PR04MB5543apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, July 24, 2023 11:22 AM
> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; linux-i2c@vger.kernel.org;
> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
> bindings
>=20
>   Security Reminder: Please be aware that this email is sent by an extern=
al
> sender.
>=20
> On 7/23/23 19:12, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>=20
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - lltc,ltc4286
> >>> +      - lltc,ltc4287
> >>
> >> There is no LTC4287, at least according to the Analog website.
> > It has been announced on Analog Devices website.
> > Please refer to this link:
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.
> >
> analog.com%2Fen%2Fproducts%2Fltc2487.html%23product-overview&data=3D0
> 5%7
> >
> C01%7CWayne_SC_Liu%40wiwynn.com%7Cd97a86a696a54f28a26408db8bf52
> 23d%7Cd
> >
> a6e0628fc834caf9dd273061cbab167%7C0%7C0%7C638257657193005539%7C
> Unknown
> >
> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> wiLCJ
> >
> XVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DXrdlzCyq0pcjfv3M6QNX73Ieux0w
> rfNKzNvv
> > HgVSH40%3D&reserved=3D0
> >
>=20
> No, that is wrong. You are pointing to ltc2487, which is something comple=
tely
> different.
>=20

We have sent e-mail to query about the release date for LTC4287 chip.
Analog Device reply that they will release this chip in last week of Sep, 2=
023.
Please refer to the attachment to review their reply.

> Guenter


--_002_SG2PR04MB55438E9C5E61ACB9330D829AA10BASG2PR04MB5543apcp_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Wed, 02 Aug 2023 05:31:48 GMT";
	modification-date="Wed, 02 Aug 2023 05:31:49 GMT"

Received: from TY0PR04MB6192.apcprd04.prod.outlook.com (2603:1096:400:32b::10)
 by SG2PR04MB5543.apcprd04.prod.outlook.com with HTTPS; Mon, 31 Jul 2023
 02:54:42 +0000
Received: from SI1PR02CA0056.apcprd02.prod.outlook.com (2603:1096:4:1f5::7) by
 TY0PR04MB6192.apcprd04.prod.outlook.com (2603:1096:400:32b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 02:54:39 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:4:1f5:cafe::3d) by SI1PR02CA0056.outlook.office365.com
 (2603:1096:4:1f5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42 via Frontend
 Transport; Mon, 31 Jul 2023 02:54:39 +0000
Received: from mx0b-00128a01.pphosted.com (148.163.139.77) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.22 via Frontend Transport; Mon, 31 Jul 2023 02:54:38 +0000
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36V1e5sj031173;
	Sun, 30 Jul 2023 22:54:35 -0400
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3s50fpevxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jul 2023 22:54:35 -0400 (EDT)
Received: from PH0PR03MB7067.namprd03.prod.outlook.com (2603:10b6:510:2a0::13)
 by DM6PR03MB5340.namprd03.prod.outlook.com (2603:10b6:5:24d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 02:54:33 +0000
Received: from PH0PR03MB7067.namprd03.prod.outlook.com
 ([fe80::8ba3:69df:5904:a1ee]) by PH0PR03MB7067.namprd03.prod.outlook.com
 ([fe80::8ba3:69df:5904:a1ee%5]) with mapi id 15.20.6631.041; Mon, 31 Jul 2023
 02:54:33 +0000
From: "Tai, Jason" <Jason.Tai@analog.com>
To: Wayne SC Liu/WYHQ/Wiwynn <Wayne_SC_Liu@wiwynn.com>
CC: "openbmc_compute@meta.com" <openbmc_compute@meta.com>,
	Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Subject: RE: The release date about LTC4287
Thread-Topic: The release date about LTC4287
Thread-Index: Adm+oQV6yJ+2eHfETn6ZssxAU/bWvQAFlmiAASi42mA=
Date: Mon, 31 Jul 2023 02:54:33 +0000
Message-ID:
 <PH0PR03MB706741CB9D9833AE006E39C39405A@PH0PR03MB7067.namprd03.prod.outlook.com>
References:
 <SG2PR04MB55435EC465FC0179D75C7F34A103A@SG2PR04MB5543.apcprd04.prod.outlook.com>
 <SG2PR04MB55434174101F42BA0D4B6557A103A@SG2PR04MB5543.apcprd04.prod.outlook.com>
In-Reply-To:
 <SG2PR04MB55434174101F42BA0D4B6557A103A@SG2PR04MB5543.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Exchange-Organization-AuthSource:
 HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Has-Attach:
X-MS-Exchange-Organization-Network-Message-Id:
 0b300363-3ea8-42d8-8f53-08db91717b57
X-Message-Flag: =?iso-8859-1?B?Pz8/?=
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
x-ms-publictraffictype: Email
received-spf: Pass (protection.outlook.com: domain of analog.com designates
 148.163.139.77 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.139.77; helo=mx0b-00128a01.pphosted.com; pr=C
x-ms-exchange-organization-originalclientipaddress: 148.163.139.77
x-ms-exchange-organization-originalserveripaddress: 10.167.8.4
authentication-results: spf=pass (sender IP is 148.163.139.77)
 smtp.mailfrom=analog.com; dkim=pass (signature was verified)
 header.d=analog.onmicrosoft.com;dmarc=pass action=none
 header.from=analog.com;compauth=pass reason=100
x-ms-office365-filtering-correlation-id: 0b300363-3ea8-42d8-8f53-08db91717b57
x-ms-traffictypediagnostic:
 PH0PR03MB7067:EE_|DM6PR03MB5340:EE_|HK2PEPF00006FAE:EE_|TY0PR04MB6192:EE_|SG2PR04MB5543:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-forefront-antispam-report:
 CIP:148.163.139.77;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00128a01.pphosted.com;PTR:mx0b-00128a01.pphosted.com;CAT:NONE;SFS:(13230028)(4636009)(451199021)(9686003)(7696005)(83280400002)(83290400002)(83300400002)(83310400002)(83320400002)(55016003)(53546011)(6506007)(26005)(8636004)(83380400001)(336012)(33656002)(52536014)(450100002)(7416002)(7636003)(356005)(7596003)(54906003)(86362001)(4326008)(5660300002)(6916009)(1096003)(8676002);DIR:INB;
x-microsoft-antispam: BCL:0;
x-ms-exchange-crosstenant-originalarrivaltime: 31 Jul 2023 02:54:38.0974 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Internet
x-ms-exchange-crosstenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
x-ms-exchange-crosstenant-network-message-id:
 0b300363-3ea8-42d8-8f53-08db91717b57
x-ms-exchange-transport-crosstenantheadersstamped: TY0PR04MB6192
x-ms-exchange-transport-endtoendlatency: 00:00:03.9175086
x-ms-exchange-processed-by-bccfoldering: 15.20.6631.043
x-ms-exchange-crosstenant-authas: Anonymous
x-ms-exchange-crosstenant-authsource:
 HK2PEPF00006FAE.apcprd02.prod.outlook.com
x-eopattributedmessage: 0
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n40GGxrjCyQQHNRaZvLIPsU+jMFp5GeVQAp5p/QkrrQ=;
 b=hGhVeVQAAOV5djVlIaIMHjZZpDrruZv0pe2YAnAT9oEa4qdB45XtvbGjq25y1JfixWv/8/nlAW4ZStzKjaaZ4kxmy9y7KBKLoxzHTvaNt/FkEl0Ta7d85CLZrsiBNAOSVyNVD26qXBacyuLYoZFetVh6IosXse8YcoC8sfIoxAI=
X-Microsoft-Antispam-Mailbox-Delivery:
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(930097);
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?AuEuNmhqaCIMg/zIDj3axw3T3TVZyu73H+NskJg/TUPO9tsLFvY0FWn8pJ?=
 =?iso-8859-1?Q?DdafHS8Ufd4RHhwsoSwP1APpbYNqvAHQ44kR1IHgnyCpm5q2kIO79vga58?=
 =?iso-8859-1?Q?Y5/G8IwD0TwnxdYbknmXtOHod+1alDfp1zpdLjyABgAyCq8ppKiq4zxqn0?=
 =?iso-8859-1?Q?GD7HJ2XPbwn/atmnER109DAvjHsRtI52WMSe64xiUxu/U/ncsw22LKz4uw?=
 =?iso-8859-1?Q?2u7AlmL5hE2GKknePk9LMNaAneuXEgUNDEbTENYNAvVt24TTOgF5EQ+uUN?=
 =?iso-8859-1?Q?d1Qi28l7jhLg7u9LrfNb6dszbYvBGTWZT9pIB+bZbrU0T0oWwh0hkPBX0s?=
 =?iso-8859-1?Q?733Wr+k+5mwKpTLrh06f8QtmlIpZpks1krhd8Whmptp1I6yxQ3HjGysjnD?=
 =?iso-8859-1?Q?8XWgJ6HNeFm1RDdxp7//8CwF3t+plI2pBHnqqKMvB62CFEMOhfbJ7t7YTO?=
 =?iso-8859-1?Q?2ba8CwqXPSQ7H3NTDNpaJ/rD/6RAev21P9APZR4J+FtHwq/NUTrbaI9R5m?=
 =?iso-8859-1?Q?xbAT3MqbTTCfxAGb/SXM078we2XaQr51JMWwkQgCSXzD/lBmnQz0T1ou4O?=
 =?iso-8859-1?Q?UZgPfXN1BK2etPdby5wWrTmIyEYdIw818ae5p+RZlShlfRkKreEiIJOZu8?=
 =?iso-8859-1?Q?8jyhfvRjkfXdVdUHL0YhkXaB7fzyPq5rCp3JYFILDnLD/jI8hZtYhAD0aN?=
 =?iso-8859-1?Q?S0PbdWppsfQiF3JnW/4ziKP6COZvrg0Tag92sfNW4bKEW9ylvgAXATgV1p?=
 =?iso-8859-1?Q?inU5S2CTHyL3ZZ33Dq4muPpB5tiIVsU98DIWE328AbEQTBhQHSjNKYj5Sa?=
 =?iso-8859-1?Q?xOxqCMG7DttbxJ1N8AM5UBKg2ELUZFah1hDdchpSliFMgPvm33t4wPPAXf?=
 =?iso-8859-1?Q?xrF1GFCctL2BE7jEhIz0S53RNABmYAMZIxY4F+yGk7+O5cj4W9z/R8FAlJ?=
 =?iso-8859-1?Q?K+wHWdIwkGLtlv+GAb9kymSl2L/sCUSqkaPwekzoKjghct5h3Q+jaMFwV1?=
 =?iso-8859-1?Q?7miMEQk3tP6aETx9iliw+RVJKFdY2i9rS9hoTyN2fn5yb+peSlH7Sh1g1d?=
 =?iso-8859-1?Q?j/COwBlVmSEaOSToEOtIorK0oT0a6Qyp82XM8zvWyE2FsCdUIu2zr05B1y?=
 =?iso-8859-1?Q?ZF2srCUjNfz801+K4MMLyH++L00j/8nBSe8oZyf5YtCk36TrSkQnIDIcLQ?=
 =?iso-8859-1?Q?G6KyQs7TzDs0/yMPFaH2fwVKhhnbfTUxb1+3YrsoYRb9V06P0/bdtZH4bI?=
 =?iso-8859-1?Q?AMZmwsAEytrBdRKei5Atd9CZqhX1vmDZtBKFNSRYuQBfwFEoBS855KKCgb?=
 =?iso-8859-1?Q?YmlR4wzUEJOR4YLEe5n3ag6PC5ZYlUmt+dDUmBSvARzPeJP/Nl1iAJ4IHt?=
 =?iso-8859-1?Q?eqLQylu78qrvkwTDE+NN98B68k0q8jqtPiUgOovJrN/Uj+mh9HTrNL7K9f?=
 =?iso-8859-1?Q?9h5hjwHkOAr9vD68dWqTx2jswavVxYLYf08VAMpA/sQhf+tGOBNCu89nJg?=
 =?iso-8859-1?Q?YK55zjQPeGsdSVYxqw0ToBoTU9N+VMfDr5h6xtNSQgZUOsCbjRXHmSxlOc?=
 =?iso-8859-1?Q?LxCpQZgi3G8/Uc8uWJJyEtmRN7KaLe2kldcq6qj8xTvTkgZkeozKLtNmfw?=
 =?iso-8859-1?Q?8ZAelqb+3h3MCkGrdK02xjdkoagXVJuDYMzpmo0cCXNRFQUYlK5CIYRKAv?=
 =?iso-8859-1?Q?F/BEaMHUvuvQrOxJGOP2B0WUKxNYqi14LeBZ7tRW8OBel+0S8i31On6B9C?=
 =?iso-8859-1?Q?WIEhWrxQWlDc78YAb7rCaGPml7L8bOIhg4quq1RRPzaC8yXB/kPECL2Ydi?=
 =?iso-8859-1?Q?dfffdkKEnZCavbG91AelKAPw4cHvXXg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4E08000B6DF6F24487EE8B3646DC6EF7@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

  Security Reminder: Please be aware that this email is sent by an external=
 sender.

Hi Wayne,

To be specific, last week of Sep, 2023. Thanks.



Regards,

Jason Tai
Senior Engineer, Field Applications
Mobile     (+886) (0) 922-226-527



-----Original Message-----
From: Wayne SC Liu/WYHQ/Wiwynn <Wayne_SC_Liu@wiwynn.com>
Sent: Tuesday, July 25, 2023 1:19 PM
To: Tai, Jason <Jason.Tai@analog.com>
Cc: openbmc_compute@meta.com; Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chi=
u@wiwynn.com>
Subject: RE: The release date about LTC4287

[External]

Loop more Wiwynn BMC member

> -----Original Message-----
> From: Wayne SC Liu/WYHQ/Wiwynn
> Sent: Tuesday, July 25, 2023 10:40 AM
> To: 'Jason.Tai@analog.com' <Jason.Tai@analog.com>
> Cc: 'openbmc_compute@meta.com' <openbmc_compute@meta.com>; Delphine
> Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>; Bonnie Lo/WYHQ/Wiwynn
> <Bonnie_Lo@wiwynn.com>; Sara SY Lin/WYHQ/Wiwynn
> <Sara_SY_Lin@wiwynn.com>; Ricky CX Wu/WYHQ/Wiwynn
> <Ricky_CX_Wu@wiwynn.com>; Jeff Shih/WYHQ/Wiwynn <Jeff_Shih@wiwynn.com>
> Subject: The release date about LTC4287
>
> Hi Jason,
>
> I am Wiwynn BMC Wayne.
>
> We have contributed the Linux driver for LTC4286 and LTC4287 chips.
>
> However, Linux reviewer doesn't agree with our contribution because
> LTC4287 chip still not release on Aanlog Device website.
> (Please refer to the attachment)
>
> Moreover, our customer Meta plans to use LTC4287 in next generation
> product so we need driver to access this device.
>
> Do you have the exact release date about this chip?
>
> Thanks.
> Wayne
>

WIWYNN PROPRIETARY
This email (and any attachments) contains proprietary or confidential infor=
mation and is for the sole use of its intended recipient. Any unauthorized =
review, use, copying or distribution of this email or the content of this e=
mail is strictly prohibited. If you are not the intended recipient, please =
notify the sender and delete this email immediately.

--_002_SG2PR04MB55438E9C5E61ACB9330D829AA10BASG2PR04MB5543apcp_--
