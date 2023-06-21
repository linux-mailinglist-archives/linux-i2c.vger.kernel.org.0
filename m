Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C67737CF9
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 10:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjFUHqr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 03:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjFUHqp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 03:46:45 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2098.outbound.protection.outlook.com [40.107.22.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C030F11D;
        Wed, 21 Jun 2023 00:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzZsF91oVRqK+MO0/eiISDbpwH7sIGpCEZVpt+7kMYxBvE35Mfkuw4RGouPjIbhAbqt6CVVtqVqDW+HWc2e1d3ng3tDjbsEaoQEkgea37vqGJwvxq/SVgyCWTziTXz3fLb9THCFTrF4ReTFOznqrn5mcaFFZhBbAOlB1u6bJ9IqT3Qv141pwYeAo0q0FTVvCEPHdFOyE4EOa1uKApobJ8UnXFiQNq3IrvHeny0dyODh19509Kye6qu5xpj5sxtd6mZXsDhSlIImQvVX4xvHQAK8Md73hQFo0LyeQYXWlhUQfeM/wO/XXc+FkNfSzIYEzs8Gh90zLWZQhqOo5Jsngxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+gK5lxHggi6XM8QH7wGYCeRVtdvdEw/0UFE067mnhc=;
 b=ZZ9p+TpJ9QWZXE6V8Pz1N0cabaILdf/Sgj8iuWtwTnFKzsrVxHfGSzreXGjsvZS1mXv3VklokhgEkKZLsn2S/vCedhu//JvHYSU6F89+VwauddDCMaddOINhYHYclgbdrfmgChwACm27+K9UJKApo+f3hWl7hQFeYMEcD1inIwEuYhVK4d8r8hyk1noon8/Dijj4ajjyUU1xRj41MzxixsRS6tAgb3wsGhMWjWMTfrR1SQRFtMZPQvPWfZMMHvWQJzlG9IqwFAKGvfuDGjiGCsYgPU50vn3teI8J3yDe8ynp9HZ12dKXoFwSnXpwPq8f17PrJ/HHS7SQCKG/oaNBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+gK5lxHggi6XM8QH7wGYCeRVtdvdEw/0UFE067mnhc=;
 b=bDGoYRentvxRc1kNjUA4GXwrZnm7/Tnxt3hoH4Q3rB1tjY16CbNOXTfiKi3LhVRcOhxFPNWyg9MzW/er0oEfVE/DoRFMIKO5lxc8h1LOo+ij6DF8yI2as1QaL/UtPczGePF7D3QMnUVHj0eIMjbuX2ig1se7gTkpa7hxcZqpAG8=
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:591::19)
 by DU0PR10MB5922.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 07:46:42 +0000
Received: from AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a069:8f48:135c:3f5f]) by AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a069:8f48:135c:3f5f%4]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:46:42 +0000
From:   Michael Brunner <michael.brunner@kontron.com>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "acpica-devel@lists.linuxfoundation.org" 
        <acpica-devel@lists.linuxfoundation.org>,
        "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
CC:     "robert.moore@intel.com" <robert.moore@intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "lenb@kernel.org" <lenb@kernel.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Thread-Topic: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Thread-Index: AQHZo5VI7IrE3xvC7kWrbR8c4raVtK+U4d6A
Date:   Wed, 21 Jun 2023 07:46:42 +0000
Message-ID: <b9af5a068cc0b5e785c8e2ddfc70d811fd5929cd.camel@kontron.com>
References: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7551:EE_|DU0PR10MB5922:EE_
x-ms-office365-filtering-correlation-id: 8dad6d83-cf08-4d30-8e6f-08db722ba76d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 40FMflFlKdhOSfQX5ULPYz4bz9lXnvgrrIxN+Noq53t9MthZHG14IERvaZoq9g/cx2uR5ENpB/LYwyDcGkvbcBbZWevXhmW1re9M3ED5XgEMY/bg60yW9SNXZkQVz2Pi4jfq41ciLONdioD7f2o/MqSyzpyWU2mwxNkfdG9dYcf9g/LGBmoe+3gQhPULPxzE2SreDxQUp/Cay2ISS90uNimpH/Sw+Ww6WfFJskcr87iNevl0XwM5sdPL0JRrs09JJwIwssBsUYXzqT4m1XedIpt25EzLNKVYUau8SzPLOvAAXNYIer1cNerGZP0CMCv0h3zJg3pithuhkhKaSWMUZzTTcOMeTxZhSjqE1DViHYEtFV81I4Bo0qmjHyK0IO2U0ZfDDUge+8F9bt/rPef9etmHgt3FC9xDYSGJBH1lkmgFkIK6WgKAFXzAdZXJRgE81LcQOLVi6sm0jNIzH9GJZeKdt5hmskKMOwj3o4UerJ6i/SzADEBuIZiKifwy1Xg1zDtJqIhZughCxyqGmArEBC2nYPw1DAbXoFz3RUxp9aLgeSRsVZPbeE4PnIYzgRfkTIVPnSuidvqQKKFUwET96IGb1Z/qc1c24P2o7FxVIbo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(91956017)(66946007)(76116006)(66476007)(66556008)(66446008)(64756008)(186003)(6512007)(122000001)(2616005)(38100700002)(966005)(38070700005)(6506007)(26005)(83380400001)(4326008)(86362001)(54906003)(478600001)(110136005)(6486002)(36756003)(71200400001)(4744005)(2906002)(44832011)(7416002)(8676002)(8936002)(5660300002)(316002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?yVJdUanNfXaYdMGSSlHkY9cu7h3W+2nWqaZG32elZi0I3QaWzc8pAoQKm?=
 =?iso-8859-15?Q?6qNMiZuDjG9u4Gcw6YIut3jiKwKM9Y27LlA0zz4QebazYOEK8wuoaL7qj?=
 =?iso-8859-15?Q?qvGgAIRk0tI07DWuv0QgMgqiL6aO+MlOaU3Zk6XzVcr2n9f5WptUCWchX?=
 =?iso-8859-15?Q?fdqarc8kiNdWPPBTkhZSdP4EE1CuWrhL+gXhjpidvuI1Np5FPe3Z8muXA?=
 =?iso-8859-15?Q?dIuIgtCbVN3r/NWZqVcug/VlFo03OlQ+JRwOJdwFhTHsfuQOFZ1rvcSH6?=
 =?iso-8859-15?Q?ZMtiPv65ONu+e/S/pROWNNbt7z1F3+2ZZqyHuC0+2Hh1W7eYF8kjOUPWG?=
 =?iso-8859-15?Q?Zklh50A+S3OHkyrimFP/clAmJIa9VO9QAjnZFxi4MQJnMwmDGBogc0FgH?=
 =?iso-8859-15?Q?2WaFAnPd7JP8+8ma9vFDaN2C+DblXkYqTBw5HqMn+Dq+R9sCe8sY/mhYB?=
 =?iso-8859-15?Q?uuGypE6QxgdHTqfXznPGSPihhcFH1oDJ+na7vKx0MeIvQUIQzeITmyKZr?=
 =?iso-8859-15?Q?d9aACdTAi/nHY70P7yvwnl2XubQoSwgJ/6V/ix/osTuHHHGPzq9kzRV1m?=
 =?iso-8859-15?Q?/23DcLMzLSUf8dawtxKcxoTGAv4fGqEi33XUz83zhLYekc2BX9adWdQ3G?=
 =?iso-8859-15?Q?9q/3X2hyEZuOLQ6KQzrhn72nLSweJMZ3mkRNf2jfSb0xhAkVl+jaDXhhq?=
 =?iso-8859-15?Q?PAiXG7Bjw98llhWIthf9hC18S30mGX0SPz8Mokk+w410bCiG9je1yPRyq?=
 =?iso-8859-15?Q?sB5fGV4yv3w3YbMARQKH9FjLl7B1cQUPUvz/ZznUlJUsKoxbCSDs1YhjU?=
 =?iso-8859-15?Q?Y7TfBFqm6oJEjIuz6qvEUPLsNVe54hxuhGjJ96nzuP2tbXwbhGBDqjzPD?=
 =?iso-8859-15?Q?IwkCa5rz+W5jswchAXIAVwnFWlENjHGl5wXN9IJqTAkWHBfdMwF7Eo9SK?=
 =?iso-8859-15?Q?9dmzivUtueOFYOz6iM9ATFV7iTjzWeYJe3Wn/U+71otnTJ1hC0CGCufyP?=
 =?iso-8859-15?Q?pPmrRevS6HmGD23xzK+DosrSB8x4fOf8ZsfljIXDvE+dBSvKRdt5A2QVq?=
 =?iso-8859-15?Q?NmGx4uwVsLflep6Pme35/ZZE3RhrvC5Q7b1ONevrDV2nzPOp0kmqOS6vQ?=
 =?iso-8859-15?Q?8PoPOqJh+eT7fDKUEBbcaxzBiMDEkChKj1XukfSy3KmjPPo5i+8dHcAER?=
 =?iso-8859-15?Q?o3RgN4rfg3rTQPw+ednFAuS2fZC26Q6cb+QdMZlyQq5J7dT8ayYO106zQ?=
 =?iso-8859-15?Q?s7tRpmeJj9799/A5A8yyOMhbBxWKjiVXHtkD3XpBcMObevA7ZajMKKgEK?=
 =?iso-8859-15?Q?XsQpgQUd6hZjOGhHcX4Ie83NlF5RFd+78bgZ77P9N5EJXQZ25/XC43q/8?=
 =?iso-8859-15?Q?cZGotQ58O2W/HyKtHJpKDtHfHBz44IzHt4FVHc817qomQjAQvg7o86hJ+?=
 =?iso-8859-15?Q?ras7mixVXIaX8ns4lPJixYon9/sOw3z56fVzf1UfqKxiZ1j79Itkj7dBS?=
 =?iso-8859-15?Q?BjOtDQQgDSYeeVm2Vo0Vg3XBEcUSupWS8K0Wq5bEjc0B82B8JAQQ8jDyf?=
 =?iso-8859-15?Q?A/0HaWdJgvSFPOMBTVZVi0V92ARlrIvYKBaockyFCaSQ4yp6ZXWz7nlk6?=
 =?iso-8859-15?Q?SpeCgc4L5K6cjPZdYIvwtLctbLAzpcgWvCJdkt+MBZXvoac7wKy1W51Mn?=
 =?iso-8859-15?Q?OdTyNqNfCevhocub/+4iMzjXWUri9HFFAGJcYQzebAOn/wI=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <9998B04AC020E84CAE51280A9DA4449A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7551.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dad6d83-cf08-4d30-8e6f-08db722ba76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 07:46:42.0726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5r7Gpn0cq532gtc2Hs82GvASNF4w/z2f5jnZIO3FC5PpyM1N5YoPBgDu94xdNA4NyWGv6+Z567E+1gg9OFfOMSuYPYaz671DU7K6cvdP24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5922
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 2023-06-20 at 19:35 +0300, Andy Shevchenko wrote:
> After switchind i2c-scmi driver to be a plaform one it stopped
> being enumerated on number of Kontron platformsm, because it's
> listed in the forbidden_id_list.
>=20
> To resolve the situation, split the list to generic one and
> another that holds devices that has to be skiped if and only if
> they have bogus resources attached (_CRS method returns some).
>=20
> Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
> Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf4=
8.camel@kontron.com
> Reported-by: Michael Brunner <michael.brunner@kontron.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Works as expected - the SMB0001 device shows up as platform device and
the i2c-scmi driver is enumerated again on the affected boards.
Thanks a lot!

Best regards,
  Michael Brunner
