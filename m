Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11F5624AE6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfEUIz3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:55:29 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:14286 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726259AbfEUIz2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 04:55:28 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4L8kANY001756;
        Tue, 21 May 2019 10:55:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=RFrnERmByD/oKvdoub0hTueCAKXrMlvGebh2uFiWJh8=;
 b=JV70KZM/wqX2vf6ZNYY4Y7dm0Vbdv0NcQz2hNyJqN0Z2Pxd0TLdcxkjah5b7xPVb7C4i
 FkAmoOpZg3fusM/Qtd8k6/lRZMHf8FCm/UWbW5/w4a4Kq5YABZdvPaAYgVLN1FDKMA3o
 1cTYs36J58OBw5DFQ5GKhqxqEDOkhJ/r6wTEDADcHC0Dkh26mlbkKg3Z+U1aUoYOUepH
 OOvejgVvR6EnKiScSGY60pUq2IUATBcS3y06Pbi9hl/Hqz/uT0ViE50YUf+F9HB6Mnn4
 ipa1B3zOgQb8ORdAvhViqBS0t80k+GR1i2E/xZ91PEEqG9r63m/1ovYPrNtbHt6ReT1x dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sj7h0rbhj-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 21 May 2019 10:55:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E577C38;
        Tue, 21 May 2019 08:55:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1BAA11C5;
        Tue, 21 May 2019 08:55:14 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 10:55:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Tue, 21 May 2019 10:55:14 +0200
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 6/8] MAINTAINERS: add I2C DT bindings to STI architecture
Thread-Topic: [PATCH 6/8] MAINTAINERS: add I2C DT bindings to STI architecture
Thread-Index: AQHVD6487I0RI1LZGUuDWk3S2JTL7KZ1JOsA
Date:   Tue, 21 May 2019 08:55:14 +0000
Message-ID: <f1035a9b-c6a8-5e6e-4b08-81b5f6b473db@st.com>
References: <20190521082137.2889-1-wsa@the-dreams.de>
 <20190521082137.2889-7-wsa@the-dreams.de>
In-Reply-To: <20190521082137.2889-7-wsa@the-dreams.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA23ABE00F0C4542881DD9049BF3D5C5@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-21_01:,,
 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgV29sZnJhbQ0KDQpPbiA1LzIxLzE5IDEwOjIxIEFNLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhQHRoZS1kcmVhbXMuZGU+DQo+IENjOiBQ
YXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQo+IC0tLQ0KPiAgTUFJTlRB
SU5FUlMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gaW5kZXggMDlmMzI4NjZiZGVm
Li5jY2UxMTczYmUzNWMgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5U
QUlORVJTDQo+IEBAIC0yMjgxLDYgKzIyODEsNyBAQCBNOglQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBzdC5jb20+DQo+ICBMOglsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQ0KPiAgVzoJaHR0cDovL3d3dy5z
dGxpbnV4LmNvbQ0KPiAgUzoJTWFpbnRhaW5lZA0KPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMtc3QudHh0DQo+ICBGOglhcmNoL2FybS9tYWNoLXN0aS8NCj4g
IEY6CWFyY2gvYXJtL2Jvb3QvZHRzL3N0aSoNCj4gIEY6CWRyaXZlcnMvY2hhci9od19yYW5kb20v
c3Qtcm5nLmMNCj4gDQoNCkFja2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFy
ZEBzdC5jb20+DQoNClRoYW5rcw==
