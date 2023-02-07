Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A495468DF7B
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Feb 2023 18:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbjBGR4W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Feb 2023 12:56:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjBGR4V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Feb 2023 12:56:21 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 547F310E6;
        Tue,  7 Feb 2023 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675792580; x=1707328580;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=Wfbanius27ZSTYlKm4zxjExK061LxmIp6SEWX9fDRGg=;
  b=y3ObatmP673RFPjKDxPmNYACHc26YPJqoXNRrmKMc6KYpBxZAevJ99m9
   +Iv+wyuI5oiFOUnqeub/L5eVDF8tQBsJQ408NAXZ/oUqmncvVEI9klM6G
   o2y9/8ALKToQ3dMY5+p1wuBbTOsX2NY5QjqI0D7UL2bz1OAYBJvHl1kIK
   dL/GNYp7hLQef1I1pQs+Al+qEkNvzEzA2bCbBD1bqsSip0DbIv0D7RxVE
   w3HqihtgjCM8HYq//XhxB6Puhiv7Kf61eF9BMcAk3djA8E1fsyoUHI+NY
   BosvaWnv5jhegxKqFCkqcnEDl3LDdHGk2hUOl3LyR/DZpQmKzYVa2ilYo
   g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669100400"; 
   d="scan'208";a="210974833"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Feb 2023 10:56:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 10:56:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 10:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cj6kMLRdQpEvhIjSg9QNFfmA7tMaOnynigTpjsoY8ykbyQ6I6OVqCio9G6CqJxTb9T2yBDEFat+X+Od9lEKfClcJ4DdXsZtuzv3DOw2mCFlIWy+kO5uoOK03e/v357fJFdYwrftkjYPf4lF1v/s8agRbqXJkmRRJqppK0UZr8ttbT61gP3aPCiJuDkE+oGC1348yZDyEpiKGTKGuIHU6nU0egNwjJL27HJFliyOvzTb24ZqSlqo1QP0Qiyain0F1hi9Hht5nZ3YcaKf4ihYpz71EDmCVy3k8t8Xo1CNM3bG5GPrRO5mFnqblEms5Bu7b+GLxlO7C6fS/Sv8hsJrpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wfbanius27ZSTYlKm4zxjExK061LxmIp6SEWX9fDRGg=;
 b=ZAmYxF/wr5m/YBGI0gkEZA4G1JbM5Kj3A7VT3igXoMzhM7h/GtZxmfrV9W0Q6/Gk4R7dSEYQzZ+LAWIYyMrmvOAjnsdycCV1mbEN7hXEMkoEsk9omefICei/6jqUKK5JsYaFttPlz6p+Cpj4VSIYFv/xfkQFt21zgte2pn873GL+qF/r/VXFBWVBcKyu4cIbDKg3NHNeLP2qxFA6DDjRsOYkWQXgYyk57Sa6Z2XyiGpJjI7i90xNjAipS2P7R8QgEzYnlUj0n9Cuk4miPSHQZ4KFXk8P4w0dnoPGSNyBs67QG8HiDUoj99XEMu8Qv1sLXMCqERfQPMvmrmj3pO4L4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfbanius27ZSTYlKm4zxjExK061LxmIp6SEWX9fDRGg=;
 b=P84Q8JVGNvIJntl31RcE5sRD5iw6aywKdShIBrmRFq/NgQjyXEkzXmBK2u8U2jmjJXA55POXHce4kWqywItHHL7jmSiity1CX0M5NbVLuHopb0geXcFRv4l9NSdyuQqd/PeTkAkVVcfgo1PKgfFi3Owi+VjAqN0lEuTKPLDIP+I=
Received: from BN7PR11MB2657.namprd11.prod.outlook.com (2603:10b6:406:b1::19)
 by DS0PR11MB7830.namprd11.prod.outlook.com (2603:10b6:8:f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 17:56:17 +0000
Received: from BN7PR11MB2657.namprd11.prod.outlook.com
 ([fe80::5785:c616:dbb7:5dbd]) by BN7PR11MB2657.namprd11.prod.outlook.com
 ([fe80::5785:c616:dbb7:5dbd%7]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 17:56:16 +0000
From:   <Ryan.Wanner@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <linus.walleij@linaro.org>, <Nicolas.Ferre@microchip.com>,
        <Claudiu.Beznea@microchip.com>
Subject: I2c GPIO Recovery with pinctrl strict mode
Thread-Topic: I2c GPIO Recovery with pinctrl strict mode
Thread-Index: AQHZOx15gHC8guyQWE6YQOQzjOIVNg==
Date:   Tue, 7 Feb 2023 17:56:16 +0000
Message-ID: <b151531d-c9fc-cafa-4e46-e213a9892247@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2657:EE_|DS0PR11MB7830:EE_
x-ms-office365-filtering-correlation-id: 8c0ea9b7-9fb7-4f65-f1e9-08db09349c52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BSqfDVM3RzYSw/KV3pQpdNTCQici3FG0CuiOoFcJo51Y53CBvY/qaGQGCbTGlW7yO+I05THCQZL5thqKZqws3oF3oSGU8Sv+3OgDwLzVDbzSlsh5lRAFNEoOdQ5T5CnIM4E7w+iVBgtKRYxGVnjl+s/GNM8jg/4YpwjJ8k7UP3F3xcMD1E9qSP5ZpgMpR60UVTl7V3xkAmW1PeiDkNcQJXasAh2Eg55twKSIYP623btj1iHoLiEngbh/h3VTNjy/g7aXVdmNhNC3t4xOwijqMM9W/LAKc6qlmN1F2JQdclzT3SXcEfB13tVSOCOkrr1khxIGIxOKezGZKUEL5RQck2JB0PWZx2vFhPQBhqLDWRyOSVRBTc9oqse2kexziLnNBoHU28S8ShlzS9IK89911627R6o09e68m0/eyYiPCSn6onnMjUQ2mtMHp2phXqgA4xt+vLzQ4dI8Y2AeFbwIRJUup7gISF21JQFsuxES92H/GAmM2YGXJ7z4mpDYWLjJQ+oc5sdPRAxGwk22WUh6Tz/R0DLOOhBSZafONvHhSkSLmA6oXtXPjMkqsATD5qkR4zXlxkqtc/X+IwmyfTlb/9zQoqnSJLPJTACjRZYBLBwISNl8hMUXAtKX3s4KA6fkIFBbBBggzBtOhzzIcLT8pZm5tnfcCZFfTzDPIntbzU5iaqJiFb80aY4bskZLTLkH2huYJWOqxv0gRfepAEDJCfXYvOgG3DPSdP3MhbWRZ+8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2657.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199018)(2906002)(8676002)(66476007)(122000001)(4326008)(66446008)(76116006)(38100700002)(91956017)(64756008)(66556008)(83380400001)(66946007)(38070700005)(31686004)(31696002)(41300700001)(8936002)(86362001)(5660300002)(6512007)(6506007)(26005)(316002)(107886003)(6486002)(54906003)(71200400001)(110136005)(478600001)(186003)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm1tS0h1Q2ZPUVF2Sk1jVWtseFQrWThkTnFnY0lTRHdqTjJmSE1lZlFHekRp?=
 =?utf-8?B?VEhPalBINlpmM0JHb3dmcEJVcVJhbDhVSXdGRWhZMnNnQmVVYjRYeGd4ZDRX?=
 =?utf-8?B?QnJsZThQSHdNNVNhcG5MWndIUHFsalpCc0Npd0NMRG8xamhPWU5iVTRGSEJ4?=
 =?utf-8?B?WjJ6a2E4d09YaFpZRmt3alJRd09tRks1OGd6emJ3TU02em9RWDNjSGk5RHc3?=
 =?utf-8?B?ay96R0J1RjZhaE9vcllWUDlVMWtReGxJNHRkWDI4dzVDakx5bTJWTWpLSUFj?=
 =?utf-8?B?eElhdDJzelVMVi9hU0sxNTY4WXgyU1FOV3NHc1M1NG5Qc3ZYMTRLeklvREFV?=
 =?utf-8?B?Q1dVSlZ0TDYxa1ZRT0taaEd4Z1RsMHF1cVhWbVZoaTJQdFg0NExOL2Uzc2xs?=
 =?utf-8?B?UVVxQ3VuTDBXeGtmL2pYTkRSalAzcEx4NElzc3RyVnIzcWZ1bnBWbmVZUmJj?=
 =?utf-8?B?MjczTUJJbUJPa1VzSWYxdExuWXZxSzViNkloeHV2MzJOZSsyWEVjeHhiV3Z1?=
 =?utf-8?B?dlNLcWFvTkxHYnBJSWRJTGRhSUk1RWw2bnIzb1Y4R2NJNUpSY0k2TXdKUXV3?=
 =?utf-8?B?aFV5Rmc1eEMxZjBtNTBUK01jWlRWeHBYcksvSDlibUQwbWwyVy84ZmhKV2Y0?=
 =?utf-8?B?ejNWZmowZ2pHYUpFN3FSb3pBSFJMRXdaTmF4WVVmTzg3aUtmK082UzVXdmp1?=
 =?utf-8?B?b3pqdmtXbXIrS0h5UUw1TTB3TTFLQnBoNWJKNFV1dHVwNjBqSElqU1FGR3lk?=
 =?utf-8?B?am81cXdtTkM5R2RqUWtwcXM1THd5MzlrR2hBS3RkdzdPQTN1bDNLU2lWSTRH?=
 =?utf-8?B?SS9rSjhORlZNWjEwdEk3YlRUdjlPNjgzVzNTOE9ScTJkR05wRk9mYTA4NlVi?=
 =?utf-8?B?L3lIUU5EcjdXd0lUMWFLeU9lZk1zVEtqQWM1ZnN6RXhWS3ErWUdMWGp5M1gv?=
 =?utf-8?B?M292YVBadng4MDRKTGtpa0pBaWE1bWIvSys5ZjE5M0VlL1FCVE5XenpSWXUy?=
 =?utf-8?B?azF3ZkprbHZwQ0JhcGtUSXQvTkMrb1M1RVB5akVnZ3BvYTJFelZiRWFkZUl4?=
 =?utf-8?B?VFd3aEJxK1N6QlhhTWlKS2lRUUFDdDBEd2dRRmxCQXN2bGh1Q2xvOHphNkdE?=
 =?utf-8?B?K1M4SXZEOHM3eDlabFBIVTA3Tk41TjNvdi90QmRJY21pdlM4Sm92R1BXUmhl?=
 =?utf-8?B?eUd0cmI5amFZWkRXOG9kRjhJeFZoeGdIZUttZ3o3NFg3N0toNXQwL2JhZ1Nt?=
 =?utf-8?B?aWk0aWN0R2ZiS0NTQ1JFVDNCdmJ4ckFJT0JWdnhZcnpxK0lBQzArVWhZTFIr?=
 =?utf-8?B?QzV0bVBuV1lRZU05RURHVlJtZklSbDhNcEFjdGtwZE52d2FCL2drSWtlNlpt?=
 =?utf-8?B?V2U2djIvanNGSm5sVzl6aWNjbnNHVDN1NFVSMG55Wis4UkRzZnJZN25uRjM3?=
 =?utf-8?B?K1drZnhjM08rdyt4M281b0t1MEttczNJdjBtenU4UzNMQUJDeElKa1k3K2xN?=
 =?utf-8?B?VDRkTmxDc2dEQjVMRUJFa3lSN1RoemdsK1RHNS83VW5rcHNkSmhkYmVmSHFG?=
 =?utf-8?B?N3JXN1lpVDZHT3pNZjltUHliR1JjSm9yYjZCaGQ4eStXbTMrcGVhUVgwTUxr?=
 =?utf-8?B?WXU2d2p1dnloV1luaDU5NFhRSWNmR01OeDJoSE16bEFYaHRUV2RPQlBPMFg0?=
 =?utf-8?B?T2ErVngyOGxEbEFvaVYwOHd0ZEQrOW51WjhqMEI1dnY1N3FIWkZ4bUpzT2da?=
 =?utf-8?B?Z2FBMDJYMnJaVmpvU0tkVnNWMy94aUtIUXdkQmNqNkdFY2ZMUGRJMUlMRGlv?=
 =?utf-8?B?QWltOEhpNCtFbnlNaEJ5T3NRRTJZdEhCRUwxakhIbTVoT2J0SUo1RDVyZ09S?=
 =?utf-8?B?a2hmQkVOTEdrUVZKQndSUEI4dXBsM0sxRXVIbWZEVEp3cWZJQ25QYkRBVkZ5?=
 =?utf-8?B?cC9pNUtob2ZzRGROT25lVG9KS0Z1WXhtckhXZXJ2dXorem5vOTB1NnY3d2dj?=
 =?utf-8?B?Z2srM21NRWQrT0F2U0Q4ZVZLc2lZNUFmV0VaNUptNC9LWXh3UExvbllRNkhu?=
 =?utf-8?B?OVRaaDRSMld2OWU5TUF4MnhZN3lIcFZTVlFkZ3dZREh0S0dtQ0VSRUsyT2Zt?=
 =?utf-8?Q?aZgsfa+nbdpZI2Fqj7d7fSmMX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8D461FD996A894DA4627D118DA4A7AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2657.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0ea9b7-9fb7-4f65-f1e9-08db09349c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 17:56:16.8219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/0whpqhBeT/fLlt+Pmf0Wb+xvvZpj0cWCHKhKHDyi9niVq+sHlGoQ2X1Q15e0CM309NBPT/SgnFiHTAor0avEafdiENt+5HtKY5I32FrZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7830
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGVsbG8sDQoNCkkgY2FtZSBhY3Jvc3MgYW4gaXNzdWUgd29ya2luZyBvbiBpMmMgYW5kIHBpbmN0
cmwgc3RyaWN0IG1vZGUsIHdpdGgNCmF0OTEtaTJjIGFuZCBhdDkxLXBpbzQgcGluY3RybCBkcml2
ZXIuIEkgdW5kZXJzdGFuZCB0aGF0IGZvciBpMmMNCnJlY292ZXJ5IHRoZSBwaW5zIHVuZGVyIGky
YyBjaGFuZ2Ugc3RhdGVzIGludG8gZ3BpbyBtb2RlIGZvciB0aGUNCnJlY292ZXJ5IHRoZW4gYmFj
ayB0byB0aGVpciBkZWZhdWx0IHN0YXRlIHdoZW4gcmVjb3ZlcnkgaXMgY29tcGxldGUuDQpXaXRo
IHN0cmljdCBtb2RlIG15IGdvYWwgaXMgdG8gY2hhbmdlIG93bmVyc2hpcCBmcm9tIHRoZSBkZWZh
dWx0IGkyYw0KaW50byBncGlvIG93bmVyc2hpcCB0aGVuIGJhY2sgdG8gaTJjIG93bmVyc2hpcCB0
byBjb250aW51ZSBub3JtYWwNCm9wZXJhdGlvbi4NCg0KTXkgbWFpbiBpc3N1ZSBpcyB0aGUgcHJv
Y2VzcyBvZiBmcmVlaW5nIG93bmVyc2hpcCBvZiBhIHBpbihzKSBoYXZpbmcNCmFub3RoZXIgZHJp
dmVyLCBpbiB0aGlzIGNhc2UgZ3BpbywgdG8gdGFrZSBvd25lcnNoaXAgdGhlbiBmcmVlIHRoYXQN
Cm93bmVyc2hpcCBiYWNrIHRvIHRoZSBkZWZhdWx0IHN0YXRlLCBpbiB0aGlzIGNhc2UgaXQgd291
bGQgYmUgYmFjayB0bw0KaTJjLg0KDQpJIGhhdmUgdHJpZWQgY2FsbGluZyBwaW5tdXhfZGlzYWJs
ZV9zZXR0aW5nKCkgYW5kIHRoZW4gY2xhaW1pbmcgdGhlDQpncGlvcyB0aGVuIGVuYWJsaW5nIHRo
ZW0gZm9yIHJlY292ZXJ5IHRoZW4gZGlzYWJsaW5nIHRoZW0gYWdhaW4uIFRoaXMNCmNhdXNlcyBs
b3RzIG9mIHdhcm5pbmdzIGFuZCBzb21lIGNhc2VzIHRoZSBmdWxsIG93bmVyc2hpcCBpcyBub3QN
CnRyYW5zZmVycmVkLg0KDQpJdCBzZWVtcyB0aGF0IHdoYXQgSSBhbSBhdHRlbXB0aW5nIHRvIGFj
aGlldmUgaXMgbm90IGRvYWJsZSBjdXJyZW50bHkuDQpJcyB0aGlzIHRoZSBjYXNlIG9yIGFtIEkg
bWlzc2luZyBzb21lIGV4dHJhIHRoaW5ncyBuZWVkaW5nIHRvIHByZXBhcmUNCmZvciB0aGlzIGFj
dGlvbj8NCg0KVGhhbmtzLA0KUnlhbg0K
