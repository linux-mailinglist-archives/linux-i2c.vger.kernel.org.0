Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46F1016AC18
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 17:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgBXQs7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 11:48:59 -0500
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:20832
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726762AbgBXQs7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 11:48:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgtCMyETZ3uMd7QctPh0EAQqnOHlrW34vFwpL9oEub3t0lFUbOR9bXVDA9HWfZf5NKxUDswMD2rXcgL7oEXHKffLm+qLqmlMRVGkihaMJYidIlYCo0d2XlsCWhKQVbuhczXbbWoEnXKg4sgcahxovIez87Pr4TlBuqkBjzp8pqpnEZR8Q9ZVRhONo/o1k58kxREv5VbowVxds+9K2EBB5gZP9XgkJva1K74odF13/+vBVTZr46+uzA+NrtBMcrmzYbnPrLKaVCab98dVtFwlqT2rJwWAbsHZ5WvxmTlneCkz5GyWzlJA5YD7CjyxlX2O/R4ot9bl64RxCyGKXKcd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl94WL0v1dtv0tFLF+fSaNug8NkhsC3vYv6dkBV9APg=;
 b=bsD4nymhcigOhCr1EXtKFjUJH+5uY2ac7JlI4GwcJ9YRjBpeZXOQy0TTwgrKRCWEm4utqCrWcbjKjrSjZYSv2xCKWVnTmGplcnRyh4q8qT4SdG/qpo2q7qCNLAlD0qgFM1zTv76NeCCTxe3O45TeqIKC0/1mH381lC6y2nNOilij7F8fJHjTvbiO9IaCHfu0igAUBSATQB4UVjDqwa49yK1GSqsayPL9KjBK8drsZ5DTRCMIHLDaL8jilNZxwD0YMUc30+GsTMAmDi4dfDgmO/L5/Drpv0dd/eLP4tqVVs5/lH/0FBMJMO8+CN8WYnAq6jKiVRNn+pHLANno/+G0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl94WL0v1dtv0tFLF+fSaNug8NkhsC3vYv6dkBV9APg=;
 b=cH/L29oW4QS2+ia9ZqKs5yfNmNCwxpNtwMusotoxUbxh5OTWD3+tJC5lhe+lcugH0U+lDe6m3Ej3+8h3ymMGGN5HtUFOQ3bLdshl7NV6yaHSkscqextiKbkqHNJIox8aVNUEQHiM2q7RjJSYuIbcl7Bs1kjFS/Ab+qFL6GnzbXM=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1785.jpnprd01.prod.outlook.com (52.133.163.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Mon, 24 Feb 2020 16:48:54 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::8870:97e4:a63c:67ea%7]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 16:48:54 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v1 26/40] i2c: riic: Use generic definitions for bus
 frequencies
Thread-Topic: [PATCH v1 26/40] i2c: riic: Use generic definitions for bus
 frequencies
Thread-Index: AQHV6yVJtqL7FvgJoEehWc6SU5dao6gqjbhQ
Date:   Mon, 24 Feb 2020 16:48:54 +0000
Message-ID: <TY1PR01MB1562EA8B9260B64E08843E168AEC0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-26-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200224151530.31713-26-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctODhmYjJjOWEtNTcyNS0xMWVhLWFhNWQtOTRlNmY3Njc5M2FlXGFtZS10ZXN0XDg4ZmIyYzljLTU3MjUtMTFlYS1hYTVkLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iNjAxIiB0PSIxMzIyNzAzNjUzMjIwOTkzODQiIGg9IlRkQU9ZYk1CSzFKV2IzZG9iT256alhrQW9CND0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 20d68f04-d9dd-4091-0e30-08d7b9496f13
x-ms-traffictypediagnostic: TY1PR01MB1785:
x-microsoft-antispam-prvs: <TY1PR01MB1785373164C65B9B4C74B1818AEC0@TY1PR01MB1785.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(199004)(189003)(86362001)(66476007)(4744005)(66946007)(76116006)(316002)(64756008)(66556008)(66446008)(2906002)(7696005)(186003)(478600001)(81156014)(81166006)(9686003)(33656002)(8936002)(55016002)(26005)(5660300002)(71200400001)(52536014)(110136005)(6506007)(8676002)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1785;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6RcoZbJ5Uot9WZ1eifeBTRGBFLG5C2yBh/z9cNhfg/2m775IM0/enJH4XDqeZfB+8j8+K6OG0bUCuGsKJ9xdfMY7hbfZr/x0SXKCkNhblCNnzf+XQahIz5GqK/r3ueHB7d9OskVI5v5YLzbiTqYS4YCCSbcf3aNcW7zZWxyEY02yxw7K1Ndr+Xt2pdnU088YSLEkfkr/mxUVPqWAC8tj6FK4x69C3kVN5avGTfRPcwWoWYG7tk0cbTuCOVpTipIZUHVQr1ee7hCUwWMC5OhzE6+sXGunfo0iiFBivxx7j/dieBiJFF73tFAb/ByYnEXAPWDqAsFrtmMy2+dGc59tzQRYFOneP/aP/kmfLOzBl2/HoxJw8BT/m6BJPtTTippHA5QQY6khUTWn+7s10dM6HlI8Hg5hIXXqqHpzAaeJN91qimDrgsCKCJEGGbM/y6ZIKeauK7ygeRrwGIsCVM9+TyuS2K3erN95efd8P7ER/2xMVFGdRg6269uP5z7OAylj
x-ms-exchange-antispam-messagedata: rBPbCqnV5qOMDjSFu7592VuieHU5srpfdVkc7x7PSG4BMSgWRNtqAMnzRFM0sw9wrqVz+KGPm1grMdxnmyVhJscUaMQd/Z07zDvT1cPjGcvHiyEdvuBuytveaErLC+PEykFpV0DBczASpVI2KvXLuA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d68f04-d9dd-4091-0e30-08d7b9496f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 16:48:54.2326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmQdfHN4KyvgHYxR7eHwEZ3jd9LspcLCy/uI0bePq2GHDiPXah6owW4BgQIgpfbUOTKY7iP7OYQIWIxAqTgCqV5FHq0lavv2y7lrElpO2cU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1785
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 24, 2020 1, Andy Shevchenko wrote:
> Subject: [PATCH v1 26/40] i2c: riic: Use generic definitions for bus
> frequencies
>=20
> Since we have generic definitions for bus frequencies, let's use them.
>=20
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Chris Brandt <chris.brandt@renesas.com>

