Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A35A34C504
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 09:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhC2Hdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 03:33:39 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:16932 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhC2HdZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 03:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617003205; x=1648539205;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=HwclyHG0+17qRYnQW49g2pFtsSbqV8tUvCg5gMI5d90=;
  b=wAKuHaqeuPZoFQNH14JeVQbeyL1boBo9PUUVNTm6rPsVYi6JUnV6y/oW
   HGRCB0V78JenPfKHCTJryrJjOP/c7CFT1yPVQGFjojBJFTNV6v0UISK4p
   gKqJCfuaPnzTe1aK5I8vOoY3l58Zbx8yxdJPsvPYSAhWal9i1YPkdxz+s
   BhPicLienpUF6dUlMRKO0QXXR0FWAD2aBXBhzM8KLPta+3aN0qHN8x3Ew
   S8vruhoEtoptEwtgTN/ugMy7aUVyg5T3WQzXDRlacsScPwUGg43xombu+
   IwIjHprq8uNPb7ZVxqjcAJKNUlHUEsDBuc4645GHJW4gxIhC9CWZ1WFbO
   A==;
IronPort-SDR: naaiVHnLp/cFlIZabYEHc1ZtC59VzLSbf24O8OOetE/6AzAZ0gLXr82dNVJWgTo3AkMra6XrKY
 +NqcwPAfHdjbinKplU7zGnMW9UzLxY8HY7NMq6KEEBA/gp/vZzw/vdaq9vGWCM3vLxgvnpZfie
 sbpLHM/SnnTiArsb+JkPbvj31Tkf2qdq77e6psKLYNyi7kWrdBG6uHvavA3lszT+IPp7ooWOKU
 2BOA4oTn5+cKnHd2CjBaBrbVNwbLqQmPLie9TxVn+H6q6cY4NLFSzdLe9Mgo9MqBdutUb2XOJK
 gzg=
X-IronPort-AV: E=Sophos;i="5.81,287,1610434800"; 
   d="scan'208";a="108874750"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2021 00:33:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 29 Mar 2021 00:33:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 29 Mar 2021 00:33:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tp787EsnpdOFPPFEiG9EliNesABJRKTGaHb0rttEcZZFofu0T6OnRszdCq+mwgaMemcqsOyEFHaN6rdDRwZ7kVpjgVGpIhBAQWT/CMoX9iireozt/KJhKSmWlN1vjQgumwPBZRAOQH1syePCfbnlHrT6YaGTtdDbeAdkLEVKwz6QqgmIb1BaOK9BtIPnVbNwlqj4kNtX5t1s1Uj7bEMB+GFdwJ1ApRrZrVmGOJkS0U7LAb+03py0p7AtIdeGAOeydUZ+JPF310R2uVmvzZzw3uxnmaNZd+akaAWDVBBf1d2DvL90rRq/Mq+NaULTMW7WV/xOgVG72hm4SHlrmTZXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwclyHG0+17qRYnQW49g2pFtsSbqV8tUvCg5gMI5d90=;
 b=BtJ93jeqJDtr6GUdd0+An93pzv06B+mghE5Q+o4nbMcL4Og0ec2L6L0gsyohY/7J37HEa+sBOy7UMZUKwCB4MiVcIn7Mjlkp3XDZ2PR3dSvG0lZ3KIgnprv4g8wIabn/SxoPEvDyN3UTxJy5SVtJAOQr1GuO5LSQ/kbgfxvCpSZt5VHEu9wlui+bqDBflJ8FU2JNZ2lO5trcqpWgujc71spl11QR8RMDgkKs2ivQEiq4jur4/0FUovaO8hvCXI0dou48a6BlUXVVK/UgZUNY/j89iXGdQR694of+CE6W2u+Ja4rkd7XGbaQQKx+epe6epzsatz7dtD/o3zZBZIhC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwclyHG0+17qRYnQW49g2pFtsSbqV8tUvCg5gMI5d90=;
 b=lW6pHgZKkxQodzUj4Q4qTUj8BMCsLelEU1tQK4h43mO6xITGTSrZIJMrY26IezclapwdO+wCdoJlcvnz2Ep+MSt1Hp3VtlpQpe5K+/kiqqKkBb8YRNTtQGWfJrbtNzVIp5LUxOujIrbgx2at2Xpm7JKJPfdEFhfw0dDOm1JMBpI=
Received: from BYAPR11MB3607.namprd11.prod.outlook.com (2603:10b6:a03:b2::31)
 by BYAPR11MB3400.namprd11.prod.outlook.com (2603:10b6:a03:1a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 07:33:23 +0000
Received: from BYAPR11MB3607.namprd11.prod.outlook.com
 ([fe80::b5c2:d4a5:1758:a56f]) by BYAPR11MB3607.namprd11.prod.outlook.com
 ([fe80::b5c2:d4a5:1758:a56f%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 07:33:23 +0000
From:   <GaneshKumar.Gurumurthy@microchip.com>
To:     <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>
Subject: git tree for new I2C Controller patch
Thread-Topic: git tree for new I2C Controller patch
Thread-Index: AQHXJG3MNn6tFcto6kac7y9LHd+5DA==
Date:   Mon, 29 Mar 2021 07:33:23 +0000
Message-ID: <d8e04fecd8109bee9729850b67c322381faf2e51.camel@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4-0ubuntu1 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [183.83.154.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d2439ec-dcd2-430c-ca99-08d8f284ef13
x-ms-traffictypediagnostic: BYAPR11MB3400:
x-microsoft-antispam-prvs: <BYAPR11MB3400DB12F11E975BB9405EB39F7E9@BYAPR11MB3400.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yxiZ28IMgGLG8HQoIn4KB11qW7XUat7mq2pDVOCWskbwMNjZT2PdrUXCYkNTd7L8kJTK//CKnx37N7cES+++C4zlvy4wCgnuQWmNmX5wn4aKqhVVfFsaoasMsCRzT3aenh30UVeEcXWf+3YODKK3Kwksqao/b0eZ08LEkW9yaBfMqXiT/O8IcMCUIbXk/jsbHnvGY2wn+Quk2bjqajb0NpBBxUdF5pzbq95/TfbfAbkkz1TajRvN2ObPvaDkXwKMG02anyU0RuDaBMvrRU5sBJG+Bok6x25ZPMS50hEVBfOLBFmL1DtYePuA+0PMGLi6ALWMqWPSHo06FStMZSMoBlTy5PutFsK0CdpDZjz+KwU4I9JC1GGhTj8e9xElOfeQG9NwOzkIfEmvUVuHZA84laZxI5+AoZH19HPw6RdU0fSHhAaN1E/AZm+4W3zVvNJGSSRWoSZqi5DRB/wCME0WeFrk+LYEVg51Ad09J+ZUrSYvfBUtyIqDxqMmV1ZePYMvlNrqpiD2DmRcl0i6EdBg8DVuPwMDAamigJU5/9s9TzouzALoPKp5tckq7wpZfNrrICcP9OfNuugm+mQA2ji3xuAue0ERto7ML/5qGoZZ9NGPxsa/BuFxEv0N0oxnP/Y/p99l50dxrVSDggB58nj922YCkrNEaaJu9uf19A4W8Xk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3607.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(38100700001)(2906002)(6486002)(86362001)(71200400001)(4326008)(26005)(6512007)(6916009)(66476007)(64756008)(91956017)(66946007)(76116006)(66446008)(66556008)(186003)(316002)(8676002)(8936002)(5660300002)(558084003)(478600001)(36756003)(2616005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?d2JZQ09hcTZoc2d6NEJUUy9YL2hRNEdLMmZBb3NOemRMWjBLSjUybjZCUzBo?=
 =?utf-8?B?dnMvR0txSGR2a0dKMmU1eTNJc1JkOFltcVdtcGxUcUF3Z1E3VENDNUlBeHpF?=
 =?utf-8?B?ZURSZzQyTTNaWVhjVjQ0ZzdIaE5MRk1ONDZpSGNDSWMrMFVKQTd2d0ljTnNp?=
 =?utf-8?B?djhIRjFLeHoraCt2cTFUeWdwSjJLcmpMdTJ1ZTQ1bmZOTmhLbE80K0N6cE9q?=
 =?utf-8?B?QWtCZjJsbUFKZkljUXpjeTZNRFVFRnVjY05NRVdYZUs4RGZyZnpCUDJSNUpF?=
 =?utf-8?B?aW40NC9HMkpJMWx1U2xnNkJzSHZUQVdneDR3UEh1dmthKzRCOFdVNEt4OTRZ?=
 =?utf-8?B?OUMyTVRxYTNrUmdPZW9RU1NiRTZ6VVJDeEZjR3JpV29jOEhmZ0FzREIwU203?=
 =?utf-8?B?R0xJWVFpdjdFcjBMb2ZxRVVDMFluWkNCTHU5ZGVYL3p0c0ZLYWt3NlFzenJV?=
 =?utf-8?B?RHdGUzlSc0ZxVGcybTE3Rk5jYm9nbjYwYnV2WFRWd25KZXNaVDRSczlRdEJK?=
 =?utf-8?B?V1BRN245TnVBQ0JoTHBhekpXa0FYREo3VlVicDZJR3NkR01NNGlqaE5Xa3Zz?=
 =?utf-8?B?clZxc0UzYnhRbTI4UG4yamg5Ujhmd3Z1MXlvcmlXd2srR1pJUWhuRU5QSTdS?=
 =?utf-8?B?S3NsN2ErQjNtOWI3NGtibndNSXAwM3hsdVU1WUcyTm9GUWV5UG12Q0RaamFW?=
 =?utf-8?B?RlNJcEVsOW1sRm14ZU4wT2l4bmErWkZKb3JBVmFKeERlTDlRNUVaQnd0em1h?=
 =?utf-8?B?dlQvL3M4NDhJdWlrcFZKNzY5cGV2NTFtOVpPNFB1cEVxY2czVzJsazh5WjdN?=
 =?utf-8?B?eWFaYmU2RmtYRWIyNVNNYWZDYVAwcnNLMWlBS1lVNTN6cHp5YnJmSUpsQ0Jn?=
 =?utf-8?B?b1pIdTlCL282T2FoK2NzZ0FXTlJpQ0w3Z3ZDbnFlUXRLc2RHaC8vQjZNN0Rv?=
 =?utf-8?B?YkV3dW5weUhlK29IL1FmUzlRNERGTHJCYXY2S3hyTTRiVTFJcXZXWG1OdUpk?=
 =?utf-8?B?WGpTQk93QmQzMjlqaVN5VEVkMkx0TXF0dTQ1bU1FSGZ6cnYvN0dBaTdYMXQz?=
 =?utf-8?B?R1EzQXpiMFZvMFp2WVlvTGpmU285RGRFOHh0Mm5IbVI1Rm9oSW5tdjgzdFNp?=
 =?utf-8?B?M0Q0dERpbjdyUklsaFN5R1lzTVVYZGwzSEw4ejljZmpqUkYvNzhNU3pFUElF?=
 =?utf-8?B?SkNNSHk3RHNPM3p6UVVNWVdhekI3cUpQU3NvemhPL3UzM2ZabmExV05FUTY4?=
 =?utf-8?B?eGN4MGZJekVCV2tPSkVtamN0REQ5Q2hncm02Snd0YmF5NG5kWTVaZEl5TTBC?=
 =?utf-8?B?WnJjTTRkcVBTUjlYUlJDYWJScG1rV1FlQVcvYlBwWERkS1VvL3B4SU9nOFJ0?=
 =?utf-8?B?RVlpR0xxN21nTlBKMmRoZlNadHhTVFFRN2d2NGY5aU5hQlFoRm0yNFRIMHpO?=
 =?utf-8?B?a3haZEJ4amtucW1QUHI2NlVobVdFb2JrZzE0dDJwaHVGQkxLUm0rU1dva0hH?=
 =?utf-8?B?MU9FMStHd21pK2w1blNZM0RNZ3ZCRzJ3OC84Qk1GNXVXNnJWYkVMZlBRa0Jk?=
 =?utf-8?B?TkNkYmMzYkhJbkZGSHB4THFEMmxTb1lkSDFtbStEbTZ0a2VmSk1FWUlCUU5N?=
 =?utf-8?B?ajNQWnFJWmo3M282MjRrV2k1bmpHVVkvcXorRGkvRXkzN0htVTVrZlVQMHd5?=
 =?utf-8?B?MzZNTXhWVXVCU1BxSk4xNEZERWhsQWtOeXYrVW9kNEtaRkNIZzlPN3c1U3NI?=
 =?utf-8?B?Tk5iQkRhbWxzRFA5c2VQWDJMcXQ2dGNrbkNad1JPRDFxTCs4M01UdkJIR2lI?=
 =?utf-8?B?U2JjMG1SRWpsdzI2NDRHZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <109AA4045BCC9945AD5C4DC72FF669C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2439ec-dcd2-430c-ca99-08d8f284ef13
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 07:33:23.2782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0CmZA7QUcEYJUsbdvMH8EVScy2XK+dUq9QWqZJtqAQfYPa+qb3KyfTuub++QzVu3n57jBi+C8Ahk9wpPAb3auzyVg1uUbTrYdkRsEeqPlRvjcK6CyqfLs8Ah3LWCqao
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3400
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbSwNCg0KSSBoYXZlIGEgcGF0Y2ggZm9yIGEgbmV3IEkyQyBjb250cm9sbGVyIGhh
cmR3YXJlLiBTaG91bGQgSSBiZQ0KZ2VuZXJhdGluZyB0aGUgcGF0Y2ggYWdhaW5zdCB0aGUgTGlu
dXMgTWFpbmxpbmUgdHJlZSBvciBsaW51eC1uZXh0IHRyZWUNCm9yIFdvbGZyYW0ncyB0cmVlIGZv
ciBrZXJuZWwgc3VibWlzc2lvbj8NCg0KVGhhbmtzLA0KR2FuZXNoLg0K
