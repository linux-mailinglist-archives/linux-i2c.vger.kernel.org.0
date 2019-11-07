Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76580F2BAF
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2019 10:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbfKGJ7c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Nov 2019 04:59:32 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:54467 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727434AbfKGJ7c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Nov 2019 04:59:32 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA79unK7010798;
        Thu, 7 Nov 2019 10:59:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2DOWtu8jCuxYV13WHI7tGlkOex/ugFLRvmjsqa3AGzE=;
 b=FOSRhCJjNn32aKkzEJTN3A1O5PriISPyOomQwedz3yh3T7+GKAwsi6T7C022D3PCYLlP
 6DEsPRsy1zzYM481yuDCvMMC4Os/kjVUXZsvVet5916FDF9IXDea7cYeulbypBZkKxhv
 LNPfT43muLoFLr9WER2hxIZjtFPQxv+kL9hCbpqhlgwbiNe+Wlc9QRwehvb1KLWaNLUT
 b7l1JL7zADTysPkn5iWVkrcm7e8DNblznLSG7venTTYj5WpGwMeFopnGMcYPHeJYpZu9
 kgS+GssbIJhMInfD7SEp6iLqVrLCYoAucSKGR9BDzhpdO8Nb1hURP6pxqVRmsInOecGK fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2w41vdvdce-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Nov 2019 10:59:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 430B910002A;
        Thu,  7 Nov 2019 10:59:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 347922AA4DB;
        Thu,  7 Nov 2019 10:59:18 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 7 Nov
 2019 10:59:17 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 7 Nov 2019 10:59:17 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/17] media: platform: sti: c8sectpfe: c8sectpfe-dvb:
 convert to use i2c_new_client_device()
Thread-Topic: [PATCH 10/17] media: platform: sti: c8sectpfe: c8sectpfe-dvb:
 convert to use i2c_new_client_device()
Thread-Index: AQHVlOgn5rnZLf3S8UOcZMZWPlClMKd/aXSA
Date:   Thu, 7 Nov 2019 09:59:17 +0000
Message-ID: <e4fd1be9-9406-7701-9864-56981d486f6f@st.com>
References: <20191106212120.27983-1-wsa+renesas@sang-engineering.com>
 <20191106212120.27983-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20191106212120.27983-11-wsa+renesas@sang-engineering.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB0A9BA7A9BF554983B74248C1130533@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-07_02:2019-11-07,2019-11-07 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkNCg0KT24gMTEvNi8xOSAxMDoyMSBQTSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBVc2UgdGhl
IG5ld2VyIEFQSSByZXR1cm5pbmcgYW4gRVJSUFRSIGFuZCB1c2UgdGhlIG5ldyBoZWxwZXIgdG8g
YmFpbA0KPiBvdXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9zdGkvYzhzZWN0cGZlL2M4c2VjdHBmZS1kdmIuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtZHZiLmMgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWR2Yi5jDQo+IGluZGV4
IGE3OTI1MGE3ZjgxMi4uMTAzODcyMjY2NTY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWR2Yi5jDQo+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtZHZiLmMNCj4gQEAgLTE3MCw4
ICsxNzAsOCBAQCBpbnQgYzhzZWN0cGZlX2Zyb250ZW5kX2F0dGFjaChzdHJ1Y3QgZHZiX2Zyb250
ZW5kICoqZmUsDQo+ICANCj4gIAkJLyogYXR0YWNoIHR1bmVyICovDQo+ICAJCXJlcXVlc3RfbW9k
dWxlKCJ0ZGExODIxMiIpOw0KPiAtCQljbGllbnQgPSBpMmNfbmV3X2RldmljZSh0c2luLT5pMmNf
YWRhcHRlciwgJnRkYTE4MjEyX2luZm8pOw0KPiAtCQlpZiAoIWNsaWVudCB8fCAhY2xpZW50LT5k
ZXYuZHJpdmVyKSB7DQo+ICsJCWNsaWVudCA9IGkyY19uZXdfY2xpZW50X2RldmljZSh0c2luLT5p
MmNfYWRhcHRlciwgJnRkYTE4MjEyX2luZm8pOw0KPiArCQlpZiAoIWkyY19jbGllbnRfaGFzX2Ry
aXZlcihjbGllbnQpKSB7DQo+ICAJCQlkdmJfZnJvbnRlbmRfZGV0YWNoKCpmZSk7DQo+ICAJCQly
ZXR1cm4gLUVOT0RFVjsNCj4gIAkJfQ0KDQpSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAc3QuY29tPg0KDQoNClRoYW5rcw0K
