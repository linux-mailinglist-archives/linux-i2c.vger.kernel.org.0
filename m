Return-Path: <linux-i2c+bounces-6659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3497767A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 03:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE8F7286179
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 01:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCD4BA2D;
	Fri, 13 Sep 2024 01:42:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D57B672
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726191750; cv=none; b=oGE+zLUK4+sKlI4PdztIibnlWOHL0a7PeSZIGXMX9ooX2j8qAcktdyku7U/EAWilsk+AWrHtot055xcDerPxO94cDapggzoYlLgDdwivFRawKPcaTkN0EgPABc0zeGyoiT1mqBGeN0FkR/Z8BSYfgEOwzcHe44PcTH3ihPfdiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726191750; c=relaxed/simple;
	bh=gAvmkDRuJce7nI0PJsDZRjNGaiQYVFEP/ujm3GKyjzA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=spSynsINSlmF51WH5wMQXX5jTil8syPPyOfYrOf7kLJEC0cZLQcMtWajyhhKeVEexQT2rYY0RsnBCqL1rExPCBsCkNerpjMDcWsty2UT+dRCKcK4ruwS2bL0Ychx72IYuG3vZmn2XXeE2GduWQcV44ux+syEzFFT8yWfJjqTygU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48D1gCL6061266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Sep 2024 09:42:12 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X4cVq3ZtVz7ZMt2;
	Fri, 13 Sep 2024 09:42:11 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 13 Sep 2024 09:42:12 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 09:42:09 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Fri, 13 Sep 2024 09:42:09 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko
	<andy.shevchenko@gmail.com>
CC: "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Topic: [PATCH v10] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Index: AQHbBNrkUD+mO8YM70mPDsgqfnC1TLJUWit3gACL0iA=
Date: Fri, 13 Sep 2024 01:42:09 +0000
Message-ID: <c3e590cc3db74234ac7a766babd46344@siengine.com>
References: <cd5f6b0a57adf6fdff7bf3c24cb319bf778d61d6.1726121009.git.kimriver.liu@siengine.com>
 <ZuMJoHWLU1FIznZR@surfacebook.localdomain>
 <fpa7ufcpazewftgeoj72t3m7jumddvt23dzmqpr4znqx663yl7@4vckpbls2iyy>
In-Reply-To: <fpa7ufcpazewftgeoj72t3m7jumddvt23dzmqpr4znqx663yl7@4vckpbls2iyy>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail03.siengine.com 48D1gCL6061266

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kaSBTaHl0aSA8YW5k
aS5zaHl0aUBrZXJuZWwub3JnPiANCj4gU2VudDogMjAyNMTqOdTCMTPI1SAwOjM2DQo+IFRvOiBB
bmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+IENjOiBMaXUgS2lt
cml2ZXIvwfW98LrTIDxraW1yaXZlci5saXVAc2llbmdpbmUuY29tPjsgamFya2tvLm5pa3VsYUBs
aW51eC5pbnRlbC5jb207IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsgbWlrYS53
ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsganNkQHNlbWloYWxmLmNvbTsgbGludXgtaTJjQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjEwXSBpMmM6IGRlc2lnbndhcmU6IGZpeCBjb250cm9sbGVyIGlzIGhvbGRp
bmcgU0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVkDQoNCj4gT24gVGh1LCBTZXAg
MTIsIDIwMjQgYXQgMDY6MzI6NDhQTSBHTVQsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiBU
aHUsIFNlcCAxMiwgMjAyNCBhdCAwMjoxMToxMlBNICswODAwLCBLaW1yaXZlciBMaXUga2lyam9p
dHRpOg0KPiA+ID4gSXQgd2FzIG9ic2VydmVkIHRoYXQgaXNzdWluZyBBQk9SVCBiaXQgKElDX0VO
QUJMRVsxXSkgd2lsbCBub3Qgd29yayANCj4gPiA+IHdoZW4gSUNfRU5BQkxFIGlzIGFscmVhZHkg
ZGlzYWJsZWQuDQo+ID4gPiANCj4gPiA+IENoZWNrIGlmIEVOQUJMRSBiaXQgKElDX0VOQUJMRVsw
XSkgaXMgZGlzYWJsZWQgd2hlbiB0aGUgY29udHJvbGxlciANCj4gPiA+IGlzIGhvbGRpbmcgU0NM
IGxvdy4gSWYgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZCwgdGhlIHNvZnR3YXJlIG5lZWQNCg0KPiAv
bmVlZC9uZWVkcy8NCg0KPiA+ID4gdG8gZW5hYmxlIGl0IGJlZm9yZSB0cnlpbmcgdG8gaXNzdWUg
QUJPUlQgYml0LiBvdGhlcndpc2UsDQoNCj4gL0FCT1JUL3RoZSBBQk9SVC8NCg0KPiA+ID4gdGhl
IGNvbnRyb2xsZXIgaWdub3JlcyBhbnkgd3JpdGUgdG8gQUJPUlQgYml0Lg0KPj4gID4gDQo+PiAg
PiBUaGVzZSBrZXJuZWwgbG9ncyBzaG93IHVwIHdoZW5ldmVyIGFuIEkyQyB0cmFuc2FjdGlvbiBp
cyBhdHRlbXB0ZWQgDQo+PiAgPiBhZnRlciB0aGlzIGZhaWx1cmUuDQo+PiAgPiBpMmNfZGVzaWdu
d2FyZSBlOTVlMDAwMC5pMmM6IHRpbWVvdXQgd2FpdGluZyBmb3IgYnVzIHJlYWR5IA0KPj4gID4g
aTJjX2Rlc2lnbndhcmUgZTk1ZTAwMDAuaTJjOiB0aW1lb3V0IGluIGRpc2FibGluZyBhZGFwdGVy
DQo+ID4gDQo+PiAgPiBUaGUgcGF0Y2ggY2FuIGJlIGZpeCB0aGUgY29udHJvbGxlciBjYW5ub3Qg
YmUgZGlzYWJsZWQgd2hpbGUgU0NMIGlzIA0KPj4gID4gaGVsZCBsb3cgaW4gRU5BQkxFIGJpdCBp
cyBhbHJlYWR5IGRpc2FibGVkLg0KPj4gIA0KPiA+IFRoZXJlIGFyZSBFbmdsaXNoIHdvcmRzIGJ1
dCBhIGNvbXBsZXRlIG5vbnNlbnNlIHRvZ2V0aGVyLg0KDQo+IFdlIGNvdWxkIHJld29yZCB0aGlz
IHRvOg0KDQo+IFRoZSBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgd2hlcmUgdGhlIGNvbnRyb2xsZXIg
Y2Fubm90IGJlIGRpc2FibGVkIHdoaWxlIFNDTCBpcyBoZWxkIGxvdyBpZiB0aGUgRU5BQkxFIGJp
dCBpcyBhbHJlYWR5IGRpc2FibGVkLg0KDQo+ID4gICBGaXggdGhlIGNvbmRpdGlvbiB3aGVuIGNv
bnRyb2xsZXIgY2Fubm90IGJlIGRpc2FibGVkIHdoaWxlIFNDTA0KDQo+IC93aGVuL3doZXJlLw0K
DQo+ID4gICBpcyBoZWxkIGxvdyBhbmQgRU5BQkxFIGJpdCBpcyBhbHJlYWR5IGRpc2FibGVkLg0K
DQo+IC9FTkFCTEUvdGhlIEVOQUJMRS8NCg0KPiBJZiB5b3UgYWdyZWUgd2l0aCB0aGUgY2hhbmdl
cywgSSBjYW4gYXBwbHkgdGhlbSBiZWZvcmUgbWVyZ2luZy4NCg0KPiA+IA0KPiA+IFJldmlld2Vk
LWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4NCg0KPiBUaGFua3MgYSBsb3Qs
IEFuZHkhIEkgcmVhbGx5IGFwcHJlY2lhdGUgeW91ciByZXZpZXdzIQ0KDQo+ID4gLi4uDQo+ID4g
DQo+ID4gPiArCQlpZiAoIShlbmFibGUgJiBEV19JQ19FTkFCTEVfRU5BQkxFKSkgew0KPiA+ID4g
KwkJCXJlZ21hcF93cml0ZShkZXYtPm1hcCwgRFdfSUNfRU5BQkxFLCBEV19JQ19FTkFCTEVfRU5B
QkxFKTsNCj4gPiA+ICsJCQkvKg0KPj4gPiArCQkJICogV2FpdCAxMCB0aW1lcyB0aGUgc2lnbmFs
aW5nIHBlcmlvZCBvZiB0aGUgaGlnaGVzdCBJMkMNCj4+ID4gKwkJCSAqIHRyYW5zZmVyIHN1cHBv
cnRlZCBieSB0aGUgZHJpdmVyIChmb3IgNDAwS0h6IHRoaXMgaXMNCj4gPiA+ICsJCQkgKiAyNXVz
KSB0byBlbnN1cmUgdGhlIEkyQyBFTkFCTEUgYml0IGlzIGFscmVhZHkgc2V0DQo+ID4gPiArCQkJ
ICogYXMgZGVzY3JpYmVkIGluIHRoZSBEZXNpZ25XYXJlIEkyQyBkYXRhYm9vay4NCj4gPiA+ICsJ
CQkgKi8NCj4gPiA+ICsJCQlmc2xlZXAoRElWX1JPVU5EX0NMT1NFU1RfVUxMKDEwICogTUlDUk8s
IHQtPmJ1c19mcmVxX2h6KSk7DQo+ID4gDQo+ID4gPiArCQkJLyogS2VlcCBFTkFCTEUgYml0IGlz
IGFscmVhZHkgc2V0IGJlZm9yZSBTZXR0aW5nIEFCT1JULiovDQo+PiAgDQo+PiAgCQkJLyogU2V0
IEVOQUJMRSBiaXQgYmVmb3JlIHNldHRpbmcgQUJPUlQgKi8NCj4+ICANCj4+ICANCj4+ID4gKwkJ
CWVuYWJsZSB8PSBEV19JQ19FTkFCTEVfRU5BQkxFOw0KPj4gPiArCQl9DQo+ID4gDQo+Pg0KPiA+
IA0KPiA+ID4gKy8qDQo+ID4gPiArICogVGhpcyBmdW5jdGlvbnMgd2FpdHMgY29udHJvbGxlciBp
ZGxpbmcgYmVmb3JlIGRpc2FibGluZyBJMkMNCj4gPiANCj4gPiBzL2Z1bmN0aW9ucy9mdW5jdGlv
bi8NCg0KPiBJIGNhbiBmaXggaXQgYmVmb3JlIG1lcmdpbmcuDQoNCk9Lo6xJIGFncmVlIHdpdGgg
eW91ciBmaXhpbmcgaXQgYmVmb3JlIG1lcmdpbmcuIFRoYW5rcyBmb3IgeW91ciByZXZpZXchDQoN
Cj4gPiA+ICsgKiBXaGVuIHRoZSBjb250cm9sbGVyIGlzIG5vdCBpbiB0aGUgSURMRSBzdGF0ZSwN
Cj4gPiA+ICsgKiBNU1RfQUNUSVZJVFkgYml0IChJQ19TVEFUVVNbNV0pIGlzIHNldC4NCj4gPiA+
ICsgKiBWYWx1ZXM6DQo+ID4gPiArICogMHgxIChBQ1RJVkUpOiBDb250cm9sbGVyIG5vdCBpZGxl
DQo+PiAgPiArICogMHgwIChJRExFKTogQ29udHJvbGxlciBpcyBpZGxlDQo+PiAgPiArICogVGhl
IGZ1bmN0aW9uIGlzIGNhbGxlZCBhZnRlciByZXR1cm5pbmcgdGhlIGVuZCBvZiB0aGUgY3VycmVu
dCANCj4+ICA+ICt0cmFuc2Zlcg0KPj4gID4gKyAqIFJldHVybnM6DQo+ID4gPiArICogRmFsc2Ug
d2hlbiBjb250cm9sbGVyIGlzIGluIElETEUgc3RhdGUuDQo+PiAgPiArICogVHJ1ZSB3aGVuIGNv
bnRyb2xsZXIgaXMgaW4gQUNUSVZFIHN0YXRlLg0KPiA+ID4gKyAqLw0KPiA+ID4gK3N0YXRpYyBi
b29sIGkyY19kd19pc19jb250cm9sbGVyX2FjdGl2ZShzdHJ1Y3QgZHdfaTJjX2RldiAqZGV2KSB7
DQo+ID4gPiArCXUzMiBzdGF0dXM7DQo+ID4gPiArDQo+PiAgPiArCXJlZ21hcF9yZWFkKGRldi0+
bWFwLCBEV19JQ19TVEFUVVMsICZzdGF0dXMpOw0KPiA+ID4gKwlpZiAoIShzdGF0dXMgJiBEV19J
Q19TVEFUVVNfTUFTVEVSX0FDVElWSVRZKSkNCj4gPiA+ICsJCXJldHVybiBmYWxzZTsNCj4+ICA+
ICsNCj4+ICA+ICsJcmV0dXJuIHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChkZXYtPm1hcCwgRFdf
SUNfU1RBVFVTLCBzdGF0dXMsDQo+PiAgPiArCQkJCSAgICAgICAhKHN0YXR1cyAmIERXX0lDX1NU
QVRVU19NQVNURVJfQUNUSVZJVFkpLA0KPj4gID4gKwkJCQkJMTEwMCwgMjAwMDApICE9IDA7DQo+
ID4gDQo+ID4gCXJldHVybiByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2LT5tYXAsIERXX0lD
X1NUQVRVUywgc3RhdHVzLA0KPj4gIAkJCQkJIShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVS
X0FDVElWSVRZKSwNCj4gPiAJCQkJCTExMDAsIDIwMDAwKSAhPSAwOw0KPiANCj4gPiAoaW4gdGhl
IHNlY29uZCBsaW5lIHJlcGxhY2VkIDcgc3BhY2VzIGJ5IGEgc2luZ2xlIFRBQiB0byBmaXggdGhl
IA0KPj4gIGluZGVudGF0aW9uKQ0KDQo+IEkgY2FuIGZpeCBpdCBiZWZvcmUgbWVyZ2luZy4NCg0K
PiBLaW1yaXZlciwgaWYgeW91IGFncmVlLCBpIGNhbiBtZXJnZSB0aGlzIGFuZCBxdWV1ZSBpdCBm
b3IgdGhlIG5leHQgd2VlaydzIGZpeGVzIG1lcmdlIHJlcXVlc3QuDQo+QW5kaQ0KDQogT0ujrEkg
YWdyZWUuIA0KICBEbyBJIHN0aWxsIG5lZWQgdG8gdXBkYXRlIHRvIHBhdGNoIFYxMT8gT3IgeW91
IGZpeCBpdCBiZWZvcmUgbWVyZ2luZw0KDQogVGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8g
cmV2aWV3IHRoZSBwYXRjaCwgIEkgaGF2ZSBsZWFybmVkIGEgbG90IG9mIGtub3dsZWRnZSAuDQoN
Cj4gPiArfQ0KPiANCj4gLi4uDQo+IA0KPiA+ICsJLyoNCj4gPiArCSAqIFRoaXMgaGFwcGVucyBy
YXJlbHkgKH4xOjUwMCkgYW5kIGlzIGhhcmQgdG8gcmVwcm9kdWNlLiBEZWJ1ZyB0cmFjZQ0KPiA+
ICsJICogc2hvd2VkIHRoYXQgSUNfU1RBVFVTIGhhZCB2YWx1ZSBvZiAweDIzIHdoZW4gU1RPUF9E
RVQgb2NjdXJyZWQsDQo+ID4gKwkgKiBpZiBkaXNhYmxlIElDX0VOQUJMRS5FTkFCTEUgaW1tZWRp
YXRlbHkgdGhhdCBjYW4gcmVzdWx0IGluDQo+ID4gKwkgKiBJQ19SQVdfSU5UUl9TVEFULk1BU1RF
Ul9PTl9IT0xEIGhvbGRpbmcgU0NMIGxvdy4gQ2hlY2sgaWYNCj4gPiArCSAqIGNvbnRyb2xsZXIg
aXMgc3RpbGwgQUNUSVZFIGJlZm9yZSBkaXNhYmxpbmcgSTJDLg0KPiA+ICsJICovDQo+ID4gKwlp
ZiAoaTJjX2R3X2lzX2NvbnRyb2xsZXJfYWN0aXZlKGRldikpDQo+ID4gKwkJZGV2X2VycihkZXYt
PmRldiwgImNvbnRyb2xsZXIgYWN0aXZlXG4iKTsNCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdh
cmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4gDQo+IA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJlc3QgUmVnYXJkcw0KS2ltcml2ZXIgTGl1DQo=

