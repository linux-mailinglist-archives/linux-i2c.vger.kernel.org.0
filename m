Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0708A5443BC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 08:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237119AbiFIGWV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 02:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiFIGWT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 02:22:19 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCF3C0;
        Wed,  8 Jun 2022 23:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654755738; x=1686291738;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+L8YTO2EaKOe4dOv9zr1gM6UMAd+PJx6woThyolR7mY=;
  b=VrFDs38uvtjLB6BNWyb+iNVEYRZsQZ7nqopM0YpU32uY1sq8+ex0Eg8t
   4ftMAKMMLSZ/GNs/nYqqri74fKL6kLlHu8FOcsOkRH7jCyzGXE3xPoKsZ
   AUB76iNVwqfsHo650Y/vUZH/gDAR5xcNC6B77DmQplKdPCy0c6r/7nzSK
   AT49lvENWC7rvK4+f4rXvXC0a4jxDDlKMpWo/YlD0LFcRFuULDdsTAa+e
   DwUDPTjXIyYq22S2drf+5R9rjB+xvlQGLfRHRd82V/Hcg2QtHIT1R6Mfx
   LLKNrO1svRD2XoHB2XdnadepJztc3ZAsvdob+4yTSOekwfGOjSkh3iyXL
   w==;
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="162560500"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2022 23:22:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 8 Jun 2022 23:22:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 8 Jun 2022 23:22:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5rHz7Lr4td/le5ezv/0dboNy3/yhw3NVQeUY0OOCILiJzpZAIETP2jC/6LshmUzu6oknkvT5lrTriH3cqZMSFHXFLWuvCdSkhuzGSAaAGZA+ZB+/M1doL3R3tEcT7oSGjVbqqryoEceWjmP4BQfVDHMRze2uVV14KCCw8/OzovhHqrTm/2gnajsO7t78hRXPM35igSJ6gEQd4tG/L8UW4jkToSpjYalCUSaMifV1zoYzRSUDica0gxFP0GJE+zTHZDuU9SRodXMPGqQRkN88XlRmupZIYYEwKUEGPrBX+jqfNMo8Ac/d0x2HnLPlzA8tTdVDhHVu4R9bYXTA7MyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L8YTO2EaKOe4dOv9zr1gM6UMAd+PJx6woThyolR7mY=;
 b=BdHHqM8YCa71CFRxmR6ymMza1RumqV7dJ8Ab6TAO4NSv1cNRb+GzlVQ58QaeZj8fD6CKtuLOHrrbg1qOIha9KVX2z/XXkmnn2ZbjF+byHtzXCerEW1siFNwyzqY5ddeO6Cq/y2qi0UECbRxJZISLmRmT1jgxXMeMYyyI4xb3GNVda/W/KXkXtE1VhxlmvqiqFWzCZx2kqlNCWzjvpuh7BDiLVUFQorzZAUG4ClLa51YKpwgjrsZhvM0Kmx1Ev5fTD83k4U6KjUcXh3jrWPpxz4IJakGR5UcpSHL4XEWqqZoNTgPnJwfxWyBg7xlalpwx5q/8LvUFX6sB15R4VLniHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L8YTO2EaKOe4dOv9zr1gM6UMAd+PJx6woThyolR7mY=;
 b=r/2qDEbFPWt4ly4Qi55JerOq+aIU6TlApCgmbpSQ61QVatv+REtANhvtIfg/7O5LZ/Lc+HZ+Ilkua8Vubgddtw5XLs4uuvQe6zkuKT8IpWVbGi+FQv4dge5Bgf+UkGVQrNAktt7dPDo3F6DZPQodgf18OOofExSo9TY/2bvOx74=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1979.namprd11.prod.outlook.com (2603:10b6:3:10b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 06:22:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 06:22:04 +0000
From:   <Conor.Dooley@microchip.com>
To:     <atulkhare@rivosinc.com>, <palmer@rivosinc.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Topic: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Index: AQHYe5EWlaN9eJ6DkkaWySyozCpPXK1GmukA
Date:   Thu, 9 Jun 2022 06:22:04 +0000
Message-ID: <b51610ec-a77a-7293-bef1-1a8ce0f882c8@microchip.com>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
In-Reply-To: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de4c835c-a386-448b-8e57-08da49e05f06
x-ms-traffictypediagnostic: DM5PR11MB1979:EE_
x-microsoft-antispam-prvs: <DM5PR11MB19796F546100B8495E81642F98A79@DM5PR11MB1979.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KA9Qmiz+J9Z49Lw1PoEAwXvu7x2gKRWlWrHK00ecKPCPSsaMN81G5kwhmAuAYu1H9o3XgA4UNw0wpktXMBlu+izfLsGdA+guv1R0FXcz1VXettk4t9zYMMqkJ3erWoE+eAYfRDJ062oLqa+Nd9a0LolCK4zEmammhTDv9QlhU/NV1KFxxTNWB+RJ+WxTGdd1KB4CsSnj1pLF1LKJn0n4BK5Le/RhlGJG7jgtMJbjZFrbYoz833bbJQ5wOPuBE83UpOw8UqqsXv7UK87wu1bZ1gXz8Zfh+DB0HvDh7QYR8mLMORMULanlKPDUlFZrUlcsukf68Ve0jN7mbAgIK7iZBX5mTusmmi3vmg5bgEPwpim//JvaAZOQFq58t3A/Y+oPT63DbNz5OCiepRij4tCslue8lNRXmrLYA2YApbVjPIJsFDW6cz5irgchEPhdAuVDxBVdb/jmZtN+4Ir6Jek6e4LDrYLkgLJMNm8uCjKm1cAbfs1BlI/NTX8j5lUOz1iMcS7NEwQ53Lt6Nb11cVwqkx4fx/lhJ4POgaLIRl7/3f2pboI0eHdgBjOveIlXHg7JYtM509SNJynqZ8CrtozG2n9W134/lpwGoJ/TRu2TqUncNJbSJKaRpWiMFdcFUorubkP1PFgvB2Fpk79J+gN0+E9bAiWZMYUBl8j23UE/AIinZJxZ9Bt1bHEbqk9OjvFu4zdl/Vy3IONyUVvUnRfO0IFL/Gg//bgKnhcn9gGDlFjjZkmc5I9aiNizhr35v1sgp3+CqXRk9FAYv5XcI0g9e8EEJQsfOqyUan4be9Wv7kJTm5MtZd3a6JBiTOGdqWIa8FI+Ux09PdT9nykLkMj0PQxvUz2I09CTi34aBA1VgAA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(110136005)(6512007)(83380400001)(6506007)(66946007)(186003)(71200400001)(38100700002)(8936002)(31686004)(508600001)(31696002)(966005)(86362001)(36756003)(76116006)(6486002)(26005)(122000001)(5660300002)(53546011)(64756008)(66446008)(38070700005)(2906002)(2616005)(8676002)(54906003)(66556008)(66476007)(91956017)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnBqUGFMOEJNNnJzdWFpWEo0U1pzQVFGeGlUSFpUUE12N1pHWTFEZ05iSDE2?=
 =?utf-8?B?RXZZK2d6dVpVSlUzNEpRb3JOS0ZKY3F6SitZdUFubXpwOHE0dVAxeTNIRGFE?=
 =?utf-8?B?SWdyK2ozT2lyRDJ6a1MwaHdINDhTeCtNeU9XcXZxTCt1clM4T0l2Nml6ZE9F?=
 =?utf-8?B?QktHcUpUUG5xaHNjamJNNlFTVjU3Sm9KK1RyT1FNZysxVmxPWmpHNzNHMEZ5?=
 =?utf-8?B?S0tKOW1IOEtaWkQ5MmNLODk4aitVZ1BRdDFMRHU4Z1dzUmU0UVFNUUM1ZkYr?=
 =?utf-8?B?ajRvdmF2dEhlV2llbnBRdTkzOHA4YnVEbkoyQS9VaVZXRlVQTzhES1Z6SGFQ?=
 =?utf-8?B?UHdkMGpoTThsdEM5b1NWcFU4WE8yS3NrL2Fpa2cvZXY4akw5YldLRmc1dmdv?=
 =?utf-8?B?SVhlWFM2Tmp3SkcwWFRNUllGYkdFQWc3dFZLZTdZWFhldEtxbzNyZFRRYWdn?=
 =?utf-8?B?QlM0Yi94VkxRYmNkQUJLaUwzdmg4OHNDZ2xIWFpYOTJqZmRXdWdFYUVHMXRB?=
 =?utf-8?B?bmc3VG9oaEF3VkQ2TUhSU25jaXNMbWtUUSsyTE1JZXBicXp6WHFJQk9xQzVp?=
 =?utf-8?B?REpBbk90L2JXRXYrNHhpcWFOb2hQQ0VXUXVMOVR6ckRoeUV4cHlzOThKSGc3?=
 =?utf-8?B?U1dia1EvTkRVcVR3cHdPUjVUZ2dySHFjS0dleVpjZnJnMnhrd2JhZWIyZ2dT?=
 =?utf-8?B?U2ZpT2t4WlRtcnp6MTNHVWJpSmJzMWxOVER4U2NJd1NTTmFWWkZtUDFvaytQ?=
 =?utf-8?B?enRsQTdzOXB4Q21vTTBNYVg0Z3pkUTkzNTBQNzFIT3R5aFNaY0g1N0h4T01N?=
 =?utf-8?B?bmZkWlc5bmM5bWFuRC9ya05lSzR1N21aZVBUNmZuYWwyN3RrMUFqUWc2bzV1?=
 =?utf-8?B?cmZsMHMrUG9aYlFheThybTU2ZWJ6SjlhRG1odnU1OWNuVVlxUWdYdUh2VzFH?=
 =?utf-8?B?eUk4WTFyVDZSN3JXajlISkJleCtZZTdHamFnQXlDb0JLSWh2QmNrY3RuUlhC?=
 =?utf-8?B?Yk14d1FGdlVLQkVHWm5McXB5elF0b2JhM0ZtSUM2RkV1YjF2MG0vMTMyYkh3?=
 =?utf-8?B?ei9QcnQ3V2p2cDhuZjlLK3kyalBSblVIUzJCd2Q5bVpQWmovQTNOeG90YlZk?=
 =?utf-8?B?SlpvenEzQ21xWWppekdEcEl2TE1MVDQzbmM5S0Fkem9NZ1ZZZm1MV2x2d1NR?=
 =?utf-8?B?NDU3TEdGTWRpUU1udjN3QmRsdHNzZGpyZWswdGhKTDRCSVRLRGMzWFVLRDAy?=
 =?utf-8?B?bElaMWZqZ2ZMUGhuNVlRK3lNTHo5VlJMV014cmtkU3NTS3BFSkRiVzNQV3VO?=
 =?utf-8?B?am0xRXRRdXIvaEdwZ0FXeHRlQnhBS2xhMXJ4S2E0S01jd0lVQkVFelVPdEZy?=
 =?utf-8?B?QWducWZPRTByaFVOSDhxN1hpV1pVbFJ6K1p4UCtEYlpUT2gwUGNtWnFNWGI2?=
 =?utf-8?B?cERld1l5NC9wYW1xSGlsY1lZTXZNcjN1a1VuaEFpVXZvMVNrcDc1TXZEbUtN?=
 =?utf-8?B?d05sVkFWUEYvVFhVdGlrWm5VMFZ4WlRrME1tQmx6elg5ZmhVb3lNSU0wclVI?=
 =?utf-8?B?UHdGbitzei94VHpiME1rc3JnTVNETXc3eDl5T2xQMkxTcWVoWkh4RWlxN3dk?=
 =?utf-8?B?akh2b1BTKzZ6cTlFaXBvby84QlBIZEtSVkJ5ZVc1SDNSSStXemw1SGVHa0Y4?=
 =?utf-8?B?Uk5aYi9WQVJmYkE2NWo2cG4vdXZrSWwraHBLMUt5cHRXRS9QbmZvSElLbXJ3?=
 =?utf-8?B?Qkc2bGVlVy9jUnZXSzJPMEhaUWJGTE1IN01acmN6YzV2SVVkTExQcStXbDJw?=
 =?utf-8?B?WTMrMlJuMkU1Ni8xQ1lBejhOTFJHTjFCbm9oU3cyYzNyVEtQWHM2SWlvL0VC?=
 =?utf-8?B?UlExYXpoSkhCV0xiRzBReGo5RVpVVUowNFdFZDYycTlld0pHR1J5VG1GUi82?=
 =?utf-8?B?OG1QbFBnRldMWEttRDNvVW1KQWZBaWI2bnIvdXo0d2hTMTRyOU41T1FnSVlx?=
 =?utf-8?B?Zmhucnk2dGF1OGtJWHdTNG5OUWNSYVhQU296c3hVWkVWdG1vUi9ab3BjQ0FE?=
 =?utf-8?B?OVhxWU9QUjM1QzNicXhyUHJXUENSSDFxUlZLOHRmVlU4NkRDSEFNYUordVJy?=
 =?utf-8?B?YTNiNWswUElvNnhtRGxkU3gzNkJRL2doUVZvWDBJR2JYdHd2QjFVNzBoRmVj?=
 =?utf-8?B?NmZncDFqVHJaMkxKQ2NjQUtWQStBMjcrdjJwa0lLSGszeG43cjlsOEtLQUFi?=
 =?utf-8?B?VnUxS3pRR2lxeEMwM2k3WTJuMjZWYkR1WHk5QU1KdWIwQ2dxY0lVR0txbm1J?=
 =?utf-8?B?WG5HdHBmdzh1bnh0RkZEcVdNbW43cVR5TjRSNTNBZVlicFdISUl6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7761D8D3029CC04B863D22AEF95D0B23@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4c835c-a386-448b-8e57-08da49e05f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 06:22:04.1645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuDVuFDqBRDIai4eIH9AA5m2WIcJiR5jaobo07DtELIVnj9mYdx1ehCECw5Lo6+ayRdIe0ZPjZEhfZIpXMcJtjdHtpVhQMkLTbbmiFFxzYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1979
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDkvMDYvMjAyMiAwMDozOSwgQXR1bCBLaGFyZSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGUgcGF0Y2ggc2VyaWVzIGZpeGVzIGR0LXNjaGVt
YSB2YWxpZGF0aW9uIGVycm9ycyB0aGF0IGNhbiBiZSByZXByb2R1Y2VkDQo+IHVzaW5nIHRoZSBm
b2xsb3dpbmc6IG1ha2UgQVJDSD1yaXNjdiBkZWZjb25maWc7IG1ha2UgQVJDSD1yaXNjdg0KPiBk
dF9iaW5kaW5nX2NoZWNrIGR0YnNfY2hlY2sNCj4gDQo+IFRoaXMgaXMgYSByZWJhc2VkIHZlcnNp
b24gb2YgaHR0cHM6Ly90aW55dXJsLmNvbS95dmR2bXNqZCwgYW5kIGV4Y2x1ZGVzDQo+IHR3byBw
YXRjaGVzIHRoYXQgYXJlIG5vdyByZWR1bmRhbnQuDQo+IA0KDQpIZXkgQXR1bCwNCk9kZCBDQyBs
aXN0IHlvdSBoYXZlIHRoZXJlLiBEaWQgeW91IHRha2UgaXQgZnJvbSBteSBzZXJpZXMgYnkgYW55
IGNoYW5jZT8NClBsZWFzZSBydW4gc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCBvbiB5b3VyIHBh
dGNoZXMgYW5kIHVzZSB0aGF0IENDDQpsaXN0IGluc3RlYWQuIEFsc28sIHBsZWFzZSBqdXN0IGxp
bmsgZGlyZWN0bHkgdG8gbG9yZSByYXRoZXIgdGhhbiB1c2luZw0KdGhlIHRpbnl1cmwgbGlua3Mu
DQoNCj4gQXR1bCBLaGFyZSAoMik6DQo+ICAgIGR0LWJpbmRpbmdzOiBzaWZpdmU6IGFkZCBjYWNo
ZS1zZXQgdmFsdWUgb2YgMjA0OA0KPiAgICBkdC1iaW5kaW5nczogc2lmaXZlOiBhZGQgZ3Bpby1s
aW5lLW5hbWVzDQoNCkZvciB0aGUgcGF0Y2hlcyB0aGVtc2VsdmVzLCBwbGVhc2UgdXNlIHRoZSBz
dWJzeXN0ZW1zIHJhdGhlciB0aGFuDQpqdXN0IHB1dHRpbmcgInNpZml2ZSIgaW4gdGhlIHN1Ympl
Y3QuDQoNClRoYW5rcywNCkNvbm9yLg0KDQo+IA0KPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlvLnlhbWwgICAgICB8IDMgKysrDQo+ICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NpZml2ZS1sMi1jYWNoZS55YW1sIHwg
NCArKystDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
