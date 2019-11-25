Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C84410917A
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 17:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbfKYQBj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 11:01:39 -0500
Received: from mail-eopbgr20106.outbound.protection.outlook.com ([40.107.2.106]:11429
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728454AbfKYQBj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Nov 2019 11:01:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpJ8O5vHUvmR7GzooMfvTWgnpQ2EPa+4jKiIAzZK+obC8y/VozWcGW3JCIsRTLeqFyigVjgipiYvjQGPmI4FeLJZz4FUXSehp25zr0BnZ+v8SRvlplJ+AUHPazvi0FyHJ9Ij4ik9nPMj1K55FLuQeoYriyZxtAw72WICEMh0Q/XzoBPIqeCA2nitUTGM4Vbl6MDs2xfJF3DKxBW56rzyKIS+EkPGta/91CR43yUtJvMdTbc7W2bf+4UAFCT6gpUohEICjCTf4pnKQ866hyNB7yDVviyjeMzUgAduN/JEXETmejqEPw8OWOP2FgZPE4T/SGudSsBACGJXCdxQf+W0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDyM88MoIHGHhOAblKsemgH9+2ghcqzJ8Cr/PR0kQaw=;
 b=PFr7HKF8504aiBYRUhKQ1USihI+OHv/YVnbzUezbmcRUvptv1CDbBGwJMg4rPxVVodqmdunoS30dWw/d1TuhxDqQ0t486yWfyHolfenNoPPpgR2U5F+pVmGO1P8rYNvHtBt9D3QdFqthJAmDfSyGV+O7+if1qNA/2P+5Xlkg5840BkmNm7WqCBr6I2b7RTtCibQWizKy4lWFKyeLMu0arvY5sZXVqfYmJwmnVtNhn8oZr7SfFp8bYjXFmjU/q97xTxJ/9Af01rit/eDaIHc2Gs8DNZYtneY5NGaahdvrb8s9Dvd2Kc35x915IAXZhnXfaen750K9fI6n6pi6kdm2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDyM88MoIHGHhOAblKsemgH9+2ghcqzJ8Cr/PR0kQaw=;
 b=COQiUpXZaTMZYVJiH6LAGYUW1qovnJL0XkR3NgGgQO1HvUSyCLbLyCrZf7xBlTy+mGn4fgJ7S1SBCpWzv3sePKyV2cdM60EcCBXg34AZ2XjgeKK8PdaY9A0HkigaT6OvE9ncMljwE87LEy5JLeG4fbJPYL5Eka8OMAzFYIQsF+4=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3466.eurprd02.prod.outlook.com (52.134.72.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Mon, 25 Nov 2019 16:01:35 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 16:01:35 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Krzysztof Kozlowski <krzk@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: Fix Kconfig indentation
Thread-Topic: [PATCH v2] i2c: Fix Kconfig indentation
Thread-Index: AQHVoBp9xElXntCxZEao13ofxvqdGqecAXqAgAARhgA=
Date:   Mon, 25 Nov 2019 16:01:35 +0000
Message-ID: <63e3fe9d-93c5-1e82-5a4e-c8b7cc6ff301@axentia.se>
References: <1574306363-29424-1-git-send-email-krzk@kernel.org>
 <20191125145849.GD2412@kunai>
In-Reply-To: <20191125145849.GD2412@kunai>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR07CA0038.eurprd07.prod.outlook.com
 (2603:10a6:7:66::24) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dc0294f-84a0-4e79-4b71-08d771c0bf0f
x-ms-traffictypediagnostic: DB3PR0202MB3466:
x-microsoft-antispam-prvs: <DB3PR0202MB3466C1B3873091BA213A60E4BC4A0@DB3PR0202MB3466.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(366004)(346002)(136003)(39830400003)(189003)(199004)(81156014)(256004)(8676002)(76176011)(305945005)(86362001)(65806001)(102836004)(31696002)(186003)(14454004)(36756003)(110136005)(26005)(508600001)(7736002)(25786009)(54906003)(6512007)(2906002)(99286004)(71190400001)(6116002)(58126008)(71200400001)(4326008)(316002)(31686004)(6246003)(4744005)(229853002)(4001150100001)(66946007)(66066001)(65956001)(3846002)(66476007)(66446008)(64756008)(66556008)(446003)(53546011)(2616005)(52116002)(8936002)(6506007)(11346002)(6436002)(6486002)(386003)(5660300002)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3466;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TTkdWPCd8wvRnYCfKeC4FklLfaPqhLSeTt+08ZbXbE1TJxVodfv2GcDwdf154lKlb56QVhruxxTnSDnD5df4rVmp+Lf38qMvUSmDRpqz2skhA7plGscbzArP2IjQKOZIJbmcgG4ypvmJo4l7rRz1rEOJIRfy99Zk8Ah91aG76mr1pye8V1Mqpms2qEUI6QR1JSBtXQvrk9iyiW6kT2LBnrk683YbPtcap7p2S3gKSFzYx4nnswPh9KLmTxs8gijD7zmJZ4QJU6EiWAPF1DDlm5HjAfqqT/5GNLGKrzLBiZc+5ynv55uD93SLn7LvF5yaQmYls2gaQQ7EYGGIdsURFh6ZiDl/2GzWdSxF6eKwUpuhVvyF4NN+B+0iEylAGm9dGuUlrp6iTylLUP/JGgxtLwzg87xq8U5fnUbCTJGwLVp7p3KO82Vc8t5danBi0WJG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <E5E6E30E572B324596C4B965AFD3C903@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc0294f-84a0-4e79-4b71-08d771c0bf0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 16:01:35.1393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BgHd8zurLhNfN6eer7Klfw1Q6omHzpGk4WNlxA04+noBauuk5zueO8s8m0KlVHgo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3466
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2019-11-25 15:58, Wolfram Sang wrote:
> On Thu, Nov 21, 2019 at 04:19:23AM +0100, Krzysztof Kozlowski wrote:
>> Adjust indentation from spaces to tab (+optional two spaces) as in
>> coding style with command like:
>> 	$ sed -e 's/^        /\t/' -i */Kconfig
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> ---
>>
>> Changes since v1:
>> 1. Fix also 7-space and tab+1 space indentation issues.
>> ---
>>  drivers/i2c/busses/Kconfig | 22 +++++++++++-----------
>>  drivers/i2c/muxes/Kconfig  | 18 +++++++++---------
>=20
> Peter, I'd like to apply this for 5.5. so we don't have to deal with
> whitespace conflicts during the next cycle. Are you fine with me picking
> it up for muxes?

Absolutely!

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
