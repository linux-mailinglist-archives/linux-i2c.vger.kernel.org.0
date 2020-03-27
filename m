Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16B6195339
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 09:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgC0IrO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 04:47:14 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:59772 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725946AbgC0IrO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 04:47:14 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02R8gLtS031851;
        Fri, 27 Mar 2020 09:47:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YJw8XoTO1v1PRGqYcjUGZSKR+X2/a6Uk4mv/NSHkJo8=;
 b=SnI+snLZWTU/DrJFlg1DOyaQQ0TcS9te3M3/UemSgMwEcK+W/YEWs45YsFX/iEMeZ8Th
 RVi63AgBytgWVMQpl0mXOmy1H8Vq3o8qdBful3gsK9VR7ABDne1VWwlWw6T2PFmi+h3z
 2lxhYojVMu86AYcWR404xVcthmdBodsxAAT3JXns5rRdY4oTUX0fyKlt+bPfWaP3iRhb
 wehSPUNKi+7Hf4r+R3zhRTJbdT8COLEukz/Ifpqp5M9fE+frmTmsEAPhN30R3y4tRM0e
 H/vkrlbnoR5LvyfCOaMJiAzUH/aTyBoIUp5MC61QFtMibE3fBn3hBGN/eDQ0YqEAUl8V Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ywappgpfx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Mar 2020 09:47:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD9BF100034;
        Fri, 27 Mar 2020 09:47:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B138921F663;
        Fri, 27 Mar 2020 09:47:01 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Mar
 2020 09:47:01 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 27 Mar 2020 09:47:01 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Alain Volmat <avolmat@me.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-st: fix missing struct parameter description
Thread-Topic: [PATCH] i2c: i2c-st: fix missing struct parameter description
Thread-Index: AQHWA7S25N2xB719JUWj+X22ne9jPKhcEGIA
Date:   Fri, 27 Mar 2020 08:47:01 +0000
Message-ID: <0b432170-8ae0-d5c3-7557-fe6d606782f7@st.com>
References: <20200326212243.17363-1-avolmat@me.com>
In-Reply-To: <20200326212243.17363-1-avolmat@me.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <679754E3029C214598936C34C70CF6F2@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-27_02:2020-03-26,2020-03-27 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQWxhaW4NCg0KT24gMy8yNi8yMCAxMDoyMiBQTSwgQWxhaW4gVm9sbWF0IHdyb3RlOg0KPiBG
aXggYSBtaXNzaW5nIHN0cnVjdCBwYXJhbWV0ZXIgZGVzY3JpcHRpb24gdG8gYWxsb3cNCj4gd2Fy
bmluZyBmcmVlIFc9MSBjb21waWxhdGlvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxhaW4gVm9s
bWF0IDxhdm9sbWF0QG1lLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0
LmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1zdC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1zdC5jDQo+IGluZGV4IDU0ZTFmYzhhNDk1ZS4uZjdmN2I1YjY0NzIwIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1zdC5jDQo+IEBAIC00MzQsNiArNDM0LDcgQEAgc3RhdGljIHZvaWQgc3RfaTJjX3dyX2Zp
bGxfdHhfZmlmbyhzdHJ1Y3Qgc3RfaTJjX2RldiAqaTJjX2RldikNCj4gIC8qKg0KPiAgICogc3Rf
aTJjX3JkX2ZpbGxfdHhfZmlmbygpIC0gRmlsbCB0aGUgVHggRklGTyBpbiByZWFkIG1vZGUNCj4g
ICAqIEBpMmNfZGV2OiBDb250cm9sbGVyJ3MgcHJpdmF0ZSBkYXRhDQo+ICsgKiBAbWF4OiBNYXhp
bXVtIGFtb3VudCBvZiBkYXRhIHRvIGZpbGwgaW50byB0aGUgVHggRklGTw0KPiAgICoNCj4gICAq
IFRoaXMgZnVuY3Rpb25zIGZpbGxzIHRoZSBUeCBGSUZPIHdpdGggZml4ZWQgcGF0dGVybiB3aGVu
DQo+ICAgKiBpbiByZWFkIG1vZGUgdG8gdHJpZ2dlciBjbG9jay4NCg0KUmV2aWV3ZWQtYnk6IFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCg0KVGhhbmtzDQo=
