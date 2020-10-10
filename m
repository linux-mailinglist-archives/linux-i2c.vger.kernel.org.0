Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C50628A144
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Oct 2020 22:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730548AbgJJM7o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 08:59:44 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:8150 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgJJKQM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Oct 2020 06:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602324971; x=1633860971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4Tnv01uJspqC/UCfJuyY4JdOEmt4Du/pMZziKx5xQ8g=;
  b=QQ0/FdPpTchronhwcLwOso7Cthnuip/tMIXlMluqa/w8wJNlpP8h+3Ll
   WZUUdgprDLVwWyaTKtEGcU8Ejj8CRAzmMB7+u3mAm47dXzKzX3v9RNEI9
   0bgeW9Bs8jB7Kok1dguNzufeAWN/0Fl7k8dLTZetuWui0txBF4W5OsL97
   FkCTIK02L/zHqWuuFylQ0z70UjoW8j9bE61XfdvjG0nKVxFbtZIkUK9Ec
   bu4e9poC4AwbAvzkG7zdQcHitiLLDkGdfxo5Ab/R3Dc42flZX/XqryB3a
   iU3jF1pEiseduI/HIy2YQVlz4u0t2cKVeBMpFsPd3Z7hfeNKk1YaS9JAQ
   Q==;
IronPort-SDR: Nr5zGJHt2U06Lcnb9hW1Vy76cYiwxm3pNJlw91GQA0MVveJlrotIhRUUawGAuLhND2DOzpJHir
 G0DqrfANu7gXp9wjiDOZ2d3rSLmU5F788R2GsfSpPNMKjI+r0EwJ5AAfVTIKieUna3e5dE2D78
 1c6cv5/VLlpCNd3a5BIJEAzKIkkN22xClWwLFw4eVwPs9Vl40Ub317gPeLNXidNboVC4cdvD8I
 gBEW4h/wPms8Qua5cLyDua1eVObhLRHwzs+Ebpqq/flimoeX0taHqQEvOBKiA2zx0dUIcjmhtB
 rfY=
X-IronPort-AV: E=Sophos;i="5.77,358,1596524400"; 
   d="scan'208";a="94877485"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Oct 2020 03:12:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 10 Oct 2020 03:11:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sat, 10 Oct 2020 03:11:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayGIyybyrJFBP8H2YY5Dw/TaBwiBBtwSntuFMPF0v9DmCYd5Va8PWJk0j1TfOzZ4bhAT8foRQfKS+yZN7Zwkq5m3UmCSHcKcvJRUuU6pgDV1aXeYfGjrVkUpxi3rx/PdWbLr/hbkhu9ddBhEuGyV+dCQXF0EfyXRFdaDhvjHPsMzDxMktN2SrGQJQqBssifnIfaQ8qU2rzFVIwzHp2XX5Fi0eyCEBc0wJqQkdDsSzbRTdA4rQd+FA+y/MCv6ufzEh0R6kQB/ej3hiGp1/DWG8rBiklRYZEuHL6GZduG20QDDwvIMDBpi3aJu8EzIbLlceRfuFtZq2rhHChgST6CUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tnv01uJspqC/UCfJuyY4JdOEmt4Du/pMZziKx5xQ8g=;
 b=PNg+JJj5oID/bIxmEXNiKyUoovlcqgXJIW3Wzjdi+g+bNaj1XL9pFg+jh9Zz/W/tXnm+nq0ncq8SiBMAt5/EbfL8ElYTr9DX6Mgs0I6I8Xwd63LuntJPJDjsNvgg2iPfp33yEfyhtgRRR+MDDO/E+FZWy9yDsARvH2y8L/M/uSR7TykYQhJoq61YtEG6llnbQYkvVrCVuYGcQfL4lANtT6keHKsrWQ/vUKEOiXyrj/h4Gfgrr9/Yvf7kQ66/S8/T21FH3YSOFQ1m97/QHsylUg3wmuQzAOs9BJl04CWIGweaVVPpfgg/HLVxBavCx9YNmQ2mrDnF19R27eE5NnCVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tnv01uJspqC/UCfJuyY4JdOEmt4Du/pMZziKx5xQ8g=;
 b=DSV3aSCNR4GzbSMX4pvz5ke5G/q0NPmvDEhwjhXFI3esMf5nooLzVlHuCFxNYq7nMmJ5cOqyqjmQ0TP1lWP+swJYi1PwOKzjyoGbe6z/eevktjrKSwWIxYoxbgbt86u0eGk6W/sAVWR5Xqy6M2tDYAIpROWBreEf6ILYYSqPJic=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR11MB1830.namprd11.prod.outlook.com
 (2603:10b6:903:125::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Sat, 10 Oct
 2020 10:11:57 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::908:a628:69ca:d62e%7]) with mapi id 15.20.3455.023; Sat, 10 Oct 2020
 10:11:57 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <bobo.shaobowang@huawei.com>
CC:     <cj.chengjian@huawei.com>, <huawei.libin@huawei.com>,
        <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH -next] i2c: at91: Use
 devm_platform_get_and_ioremap_resource()
Thread-Topic: [PATCH -next] i2c: at91: Use
 devm_platform_get_and_ioremap_resource()
Thread-Index: AQHWjZTiR+ldOCrpskiz0EeGj8tqYKmQwGWA
Date:   Sat, 10 Oct 2020 10:11:57 +0000
Message-ID: <e1761eb1-b682-7d90-204c-02ffd606d3df@microchip.com>
References: <20200918082140.32258-1-bobo.shaobowang@huawei.com>
In-Reply-To: <20200918082140.32258-1-bobo.shaobowang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.121.164.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c205451-c97d-4aac-6e15-08d86d04ebd6
x-ms-traffictypediagnostic: CY4PR11MB1830:
x-microsoft-antispam-prvs: <CY4PR11MB18301F36A727FC25E7A8A85AE7090@CY4PR11MB1830.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkZOuSUhCirETcMgZw6jY6vNWbxC1GxsuViA3SYpSIqnpyeG8UzEmxr31zZX56sppJqeD7EpZAgsZjy82rwKn19P9Wy+nOZQo8DJxHUyrQ5lfFfD7weP/GzdRqt0+lgQxstwWv1qDOquFGGX0hCOOwYdKxX4IkQHnlSquKVS9HjpQ02sUJyuiLLBtbeMfA43CKCALMZ4Phxyxec+0Yb/pZasU5pZjY5I6i6COk0YNnbETtgdQfFmjyBLBENGwWBWcQTIsCe0uMz0z71NUdzFGG80IXbrp6Fn3O9qVGnBUtL0snQzpYuiNGd0TuZ5xhqYFAuatz+v6BRr7L+dwbHkSSvLG7HBypWaOSFy2zohlxw25uTkFaWyI/GwcvX2o0Wd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1101MB2341.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(366004)(376002)(396003)(136003)(64756008)(71200400001)(66556008)(76116006)(66946007)(66476007)(66446008)(91956017)(6512007)(31696002)(8676002)(5660300002)(83380400001)(6916009)(316002)(54906003)(6486002)(86362001)(36756003)(478600001)(2906002)(4326008)(6506007)(186003)(53546011)(2616005)(8936002)(26005)(31686004)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: v4u0m3CJACOkATYCVUHGlISVLWlK4kZ1eE9lsAi8nnARBZYar6fW/0DZAc2u4aqOnUn3kvtIDhFBOjQZC/a7zEvIfm20BZbQcZcEtTW+1zKM+2tj5KmY3BbS9h+3Pz/naYr8WoNlAcKxTHwXxFNWmfAPh6RMKkfRykpstS0g+YEumeXftkOYkMTdilT/KX/lMfgwJybAZ0ZDhaIh2r+NfZ6v0MVz7yZHiIzY1n05hzoxmCoVofTDhmDwWI9yXN+RqaBYCYF5d92e3pXaLuL1tkbw9xPtVXv564SifJbWqAQ2trJ5p7RFp2vLYcHDojDcAxbQ0VFjZAxN23oMEp81vtX2W99VrPI6WV/nK00qXtbnSRUQNr7gNd/Vj2YGrX5VNQBbrmVSb/lUr6kRQKpWCqaMxmirbaq5+JR3AXmLQYxRn9L2Zeidc+i6ETlGnZDlxE3aB2bOldV1FobMPKoxpMg50zF9ucumolbKN235TnyGjsPOVdGH37lOFs1UGw0e3hYtC1y7+Js2yXBc5NrY6YZUxEPvlZWZJE9c1deMrWeTQGtcfdfwErJ2oZKvRDjanPwbVezXJTXDiDxneLqPzlX6upgOIJ6zS6Xn+qhKN4Mj6hkpxn0MVgPQahzRp4x2C9Bmw8FsfJFEqyiQoOC1FQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A4E79243B2CED45AD1E800073002949@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c205451-c97d-4aac-6e15-08d86d04ebd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2020 10:11:57.5351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +t5MRhWYQ3fk1q+m0//M4Qet0Un7j0ZEW0YKbSPVLTSeBRwHdi6ffh64cJ56Gi6sRQ+9ztcHMqnTVCNYnG8bTuY1FN6nSR1INnaEXlt32cM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1830
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTguMDkuMjAyMCAxMToyMSwgV2FuZyBTaGFvQm8gd3JvdGU6DQo+IE1ha2UgdXNlIG9mIGRl
dm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCkgcHJvdmlkZWQgYnkNCj4gZHJp
dmVyIGNvcmUgcGxhdGZvcm0gaW5zdGVhZCBvZiBkdXBsaWNhdGVkIGFuYWxvZ3VlLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogV2FuZyBTaGFvQm8gPGJvYm8uc2hhb2Jvd2FuZ0BodWF3ZWkuY29tPg0K
DQpSZXZpZXdlZC1ieTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3Jv
Y2hpcC5jb20+DQoNClRoYW5rcyENCg0KPiAtLS0NCj4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWF0OTEtY29yZS5jIHwgMTEgKysrKy0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29y
ZS5jDQo+IGluZGV4IGUxNGVkZDIzNjEwOC4uNWI3NzgxMzAyODUyIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXQ5MS1jb3JlLmMNCj4gQEAgLTIwNywxOSArMjA3LDE2IEBAIHN0YXRpYyBpbnQg
YXQ5MV90d2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gDQo+ICAgICAg
ICAgIGRldi0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gDQo+IC0gICAgICAgbWVtID0gcGxhdGZvcm1f
Z2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gLSAgICAgICBpZiAoIW1l
bSkNCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiArICAgICAgIGRldi0+YmFz
ZSA9IGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZtZW0p
Ow0KPiArICAgICAgIGlmIChJU19FUlIoZGV2LT5iYXNlKSkNCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBQVFJfRVJSKGRldi0+YmFzZSk7DQo+ICsNCj4gICAgICAgICAgcGh5X2FkZHIgPSBtZW0t
PnN0YXJ0Ow0KPiANCj4gICAgICAgICAgZGV2LT5wZGF0YSA9IGF0OTFfdHdpX2dldF9kcml2ZXJf
ZGF0YShwZGV2KTsNCj4gICAgICAgICAgaWYgKCFkZXYtPnBkYXRhKQ0KPiAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PREVWOw0KPiANCj4gLSAgICAgICBkZXYtPmJhc2UgPSBkZXZtX2lvcmVt
YXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgbWVtKTsNCj4gLSAgICAgICBpZiAoSVNfRVJSKGRldi0+
YmFzZSkpDQo+IC0gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihkZXYtPmJhc2UpOw0KPiAt
DQo+ICAgICAgICAgIGRldi0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gICAg
ICAgICAgaWYgKGRldi0+aXJxIDwgMCkNCj4gICAgICAgICAgICAgICAgICByZXR1cm4gZGV2LT5p
cnE7DQo+IC0tDQo+IDIuMTcuMQ0KPiANCg0K
