Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9925655C222
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 14:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238677AbiF0P7A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jun 2022 11:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237989AbiF0P67 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jun 2022 11:58:59 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7FAD79;
        Mon, 27 Jun 2022 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656345536; x=1687881536;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZlpdHq241mLJEz8rw3ymS24Qz2G4YYyFVs7JbaiUFBE=;
  b=cGq/Sv3dvCWWyE3e0rIPWZuf6DpuKCsx2RZPD5vpPPlH9k5PVDdO4AGN
   yZPh2QuVLe7i4Fvyy5vb5UunKBfiYl7wswtmHa44KpP01kzVIRofo8YYo
   SrWih6luR6M9N7mDQli1BwPHOpVt4e1WI/CW8UczA4y8EKeWcmgqXtLQD
   hShoRimwgFEHhNkTUipSOG8vsTqLAhBVmR5uFX7qMJyJt7CGUK/GSHN9X
   xUzRzfQSHtz6nhGV/NkMhzPY+YPdZ5BXe6fzyHb55Gs5ihmNzJHnWgApi
   7XN1QYzMRVDSnC4Hr8SzEHBdnyf0syj0OTMJhpv48ckFbfGAF6kfJakgG
   A==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="165277493"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2022 08:58:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 27 Jun 2022 08:58:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 27 Jun 2022 08:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQOdPDlJuv2Qxqjq/N5L1dUEOmil1RITJUa2a1pdlLBW98QU24sSofMWiShomgLLPBOK4Q4Hfe516cM5YNF3us7tbQHLknQ189HPUfhEpU3a4gNzSsXwXcVuxSNiIReMF1k7cobge0Z6j33FO18C0cAqvDGDj7Mdc/IJdnB2DSg6KCdaCF8Cr/JdnRQpwA1IFXOVh5tdXCStJPQnaqw3AhFiEV+VsAHVX0qLrxGV9yoK/E3Ul5CblwNMaVvKpp7BbGau8qkN3/LSjvOv+CTsve2vmMUsgjLegP6l+KZMmBEzjxqs/xH/hQIbNSRRnRK/2t2AvCpyGbT8YuX0xaDIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlpdHq241mLJEz8rw3ymS24Qz2G4YYyFVs7JbaiUFBE=;
 b=fnMXIU5g/NuDFNM1W2eBtOobiLRtL2adpC2zYVP25bih4RQjkqnA5JUjlWh4cs7g6COfg2kEMStulM8lfYfqU9HYxNGZOwbYX530FPwcpfjeBYKoJX/s9ruVemXGK94Ob9j9IeiW1ejbAjO8e5J4evOA4U/Z8Q/9ZfiuWrPXpw85KdaBKaWPLBxCxXSE54U5TTbewUzJXMjmSQ5wMUd7sQUDDwP3bzXeJYmJWj6ZeZebqtlvAXmnqqtYIKMkwYN28tu+vtRI2ePWBMxcz4z8wXfifAl1Pkokr20EttfQPo+II/8fk7Ne5V2FT38E7b73y8imeLYiie/ThxxXPuozMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlpdHq241mLJEz8rw3ymS24Qz2G4YYyFVs7JbaiUFBE=;
 b=tR//rGBlkbDYYBkQ1GQy8CYU3pnbHfPevEN/hUtiF4/yCS3YMsNn34C5nLzfpyYgKN2kB1EimxcNQZRocY9PcYRIKX+pOIofqCYdTj+KrHS9OVlQTIeXOb3+NYFn7PRrp0YLxPTcijLksBqwLBLXMogntKO6liAk/0aynVCSP58=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5722.namprd11.prod.outlook.com (2603:10b6:610:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 15:58:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 15:58:47 +0000
From:   <Conor.Dooley@microchip.com>
To:     <palmer@dabbelt.com>, <palmer@rivosinc.com>
CC:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <lee.jones@linaro.org>,
        <robh+dt@kernel.org>, <linux-mmc@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <linux-riscv@lists.infradead.org>,
        <atulkhare@rivosinc.com>, <support.opensource@diasemi.com>,
        <andrew@lunn.ch>, <heiko@sntech.de>,
        <krzysztof.kozlowski@linaro.org>, <stwiss.opensource@diasemi.com>,
        <aou@eecs.berkeley.edu>, <ulf.hansson@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Thread-Topic: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
Thread-Index: AQHYeeIGXs9WOWYBI0qGmFVsFT4u2a1NYDuAgAAJMwCAFiBfgA==
Date:   Mon, 27 Jun 2022 15:58:47 +0000
Message-ID: <737ca8a9-1403-e594-b466-d652536e482e@microchip.com>
References: <20220606201343.514391-1-mail@conchuod.ie>
 <20220606201343.514391-5-mail@conchuod.ie>
 <ee29eefa-9206-b84a-e27c-4e4388865db0@microchip.com>
 <2247394.ElGaqSPkdT@diego>
In-Reply-To: <2247394.ElGaqSPkdT@diego>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97618203-8d80-41a9-4d9a-08da5855eba2
x-ms-traffictypediagnostic: CH0PR11MB5722:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vK88hJVvq+sg2lHaatmmWKE7WeR0F8gyzWlr239tSjIxyxElcp7KBS/kvoSGqsVs4tPvapXYoUbdabtW4ztq73lb9NVt4p8Slzfjpm5gtCmcHiGfDJFDZrB9teCvQHLiykKv2ynNq56uqWwaRAbZfhrah56eAmrMgb2sGkwxyAihVtvHR4CgA/SHtD6STzqgnrPhJKumwPFlChU+51tLx044J1rSqcSYFVTh5TI/79Uj4y6b/UiU/FzowUpLXxOKpWW8r022uQtf6M3jT1TuP2YS45HxkENob8/hGCZ7PXAYleyiibqIoXrSSV2o/Rh9aZ+DVF4VQ8fH5Bdq6GR1FNZQymIymM1g1EzwB0wDL0H7/0DYJEsoLwM/IW0BnGkomE/sCFomRgWG66Q6uwRbVxmtxES7QB4L5T3IkZDLu/dS2ogZ0jW8DgPRHDeWa+aKrkcAb3PvuYREZmue+JSgyUcthuE2bCWte8ldyFOVmOxLEZdxbg959/gSIt0wiOt6M5xWO0pau9ntWI/fYE0jQiSlZToYeQbu6d8FCBccMltVsbi8DOu7uBPHbR1h0srgoN6cacvJ0lb3cT5t3oHnfQv4o0RamKxMBFbUcAxa3B/cZCfm95IA3y6kuDF4nsmtU199ICWAJ3LBuCuW1rt6Ok2NjbnAjTo30Sj1a5zSp2CKAltgCnJCSHldTLkrldQnq33mfTzN3JItW5sZn7Q7TiIv7jtcovoErrgoDaab/1RBHX1ocIxmCZowfJUbBmSuOemZ/LI9g90PivJpkw7IgCP10vsqH7X3lPpziynN3pCL1Zzhhg+O2wJkugLe1zRc6XOwJQCc5lFlntubhJHJxBJDby5Gk3/X2xxmaREp+8ngZVWBELKXDYJ4ZsVh1F2kNF5hBQVp6E0Gj9nvZw0gsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(136003)(39860400002)(366004)(54906003)(31686004)(2906002)(966005)(53546011)(36756003)(38100700002)(5660300002)(122000001)(316002)(110136005)(41300700001)(86362001)(83380400001)(2616005)(6512007)(8676002)(66946007)(66446008)(66476007)(91956017)(4326008)(66574015)(64756008)(76116006)(66556008)(6506007)(71200400001)(186003)(8936002)(26005)(478600001)(7416002)(6486002)(38070700005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXU5T0FvT01MNmY4a2FRZ2FvSDVDV3FvMlBBWWJIUVJ6dEhsQjlHajVGSFdM?=
 =?utf-8?B?VXFkWjBIcXdIYmRvQTBhbWVhK3lvTjcwcHAyMmlVNWlneEcyZ04wUitSZFZM?=
 =?utf-8?B?MTVZTEJBVlcrUWNtOGQydkJteXBINGZvYWJwVTJyZUtrRXduem02R3gyTk9q?=
 =?utf-8?B?cjRUd2J5azF2bjBFaFVCR1lneC9Ca29uT1ZjOXNJQWZCYjFDRVFneVhtTUUr?=
 =?utf-8?B?aTRsQXVGWXdlcnZSVnNxa3hISnMyMUFvOGErenRyb2xDa3JQR1VBRi83ZWg1?=
 =?utf-8?B?VVJ1QzlnRzBFSXhvbHIySHNSTmo1N2szQU51WEQwS1RlZ3pJSW16ME1BcXpj?=
 =?utf-8?B?dXZLSk8rZWJCVHNwNi9WamtMM0ErN2IwZ0tUZDNmRDA2RVdCcWhMSzFhdXBE?=
 =?utf-8?B?MHpIbzh0eGNuQW9sTGEwUUg3cFFGMDV6SS9CWFRzVVpNc1JjYng2M2N0RFZ3?=
 =?utf-8?B?dDZPRlFLcmVuU2k0UWhtYk1kaHc2eXdEeGIvNGxZaFZTTnBIMEkzTXFMSlF0?=
 =?utf-8?B?eC9rVFhWM044Yk1EZWFhZ0tsNi84dVkvb1czajVGZHl3M09oWk9yTlE5V2Uw?=
 =?utf-8?B?TXRNY0ZMQ09VT1N5bUNHb3VHY0JCUHlJS0ZKOFZFUjNJeU1ZSjB1RnByTkVQ?=
 =?utf-8?B?Z3d3SXNiQldmaFFVTWpJaUJoU3RGNTVWTkI4aS9RaGpWZVpQYVZwMkRMNlc3?=
 =?utf-8?B?MG94Wmt6VE45Wi9lakhaTi9UUS9OY2p5dEJrVFRNbXVwY1E2TWNYUjlNWENS?=
 =?utf-8?B?TWlyZFhoYXFjMllaQXd4OHhLRUlPc0hjU3hucGN0UGJOa3lEWHVDR0dnSWlt?=
 =?utf-8?B?T0dJb00zSDBOTEtkcWVtT2w4cWhDM09GS1kvYjFuMDJjUXpBd0RkU1B4REw1?=
 =?utf-8?B?b0I3MWk2Q1NzNkp3VXpMdnIvMmRmcU1OWDZvZ01NQjdGQnJQcGhwY2RqanhN?=
 =?utf-8?B?Z1Q5SC95dkV0ZmRJem9YNm1GMzMwTUlCbEdJQ0dHdHZ6UnhrcTNCZXlOYlZ0?=
 =?utf-8?B?QnJoSzdvWENpL3YxTzhjdHhnK2V5RTNPcVNPYWVuNk8xTElvUStXelQ4U200?=
 =?utf-8?B?Mm42RTl1VUNFbjVUaUt1YlptWDZyQldESUNqUEc2Y0szQTZOVUFENlh5N2FY?=
 =?utf-8?B?ejRmSCtBUHJYNXhEb2ZNbEVrcTBkaW1NY2lJYmRtYlRlU0VJVlNrSXk5R1U0?=
 =?utf-8?B?T3paSk1FcHVWeVpKKzBKMm1kaVFvRnhFMjF4MGwyQ1lDOW1kdUJqOElBMGg1?=
 =?utf-8?B?TFhMUXkvNDFlMHg5dW5SKzExaTVxWEVaQzcyVmIrSDVnOWNnWHQwbWdHSlFT?=
 =?utf-8?B?SHl0eEZ6NGM3bmgvNXdTT2ZBUzIxdkJzNmNYV2laczlXSjNXM0tmaHVNYUlV?=
 =?utf-8?B?MTlnSmJZdXo0ZjF5aDdhYlk0NVBoRWQxelBCUm1MbmE0RElWY0ZlTDFIV2lx?=
 =?utf-8?B?NGdka01kZHZBT2RTQ1RDMXhkOGN2OWJkN1lhWDM5WmxUeUxQamZYQmwzNHZ4?=
 =?utf-8?B?UHQxVEFGNzV2OGNlR1RXdHBHK1RPcXQ4bC9hM3p5SmMrU0ZlMjNBYlR3bGNi?=
 =?utf-8?B?cjJUejBKeGdjbkhNVVJCTENvQ0V0ZUtQSXlhUzJ4UDlnaUlNUzBuQ3poVkdn?=
 =?utf-8?B?SVFkM0pkdDJHNGlVVE1YMlAwVXNkam50TnRjSytvTE9jdjJvVWpjSjhBRGFE?=
 =?utf-8?B?dDlVaFIyem0xcHNqTnY1VEhKeXRuSW1ZZWd2Y2o4U1dkdWl6NnU0b2RTVVR4?=
 =?utf-8?B?ays1cHNXSE5PMSt2MjhRK1BKeVFUU25UUC9uRVlUT0JHWWliUWFDU3p5bG5t?=
 =?utf-8?B?a1g3RENFaWIzWVdmMXVYck9pZzkxU0RCTkc3TThtVHJJS2dCQ1FNU2srWVBC?=
 =?utf-8?B?UEpPalRGZDI0SEsyZ0lvb1I1ZW1MZ0YwVHJ3Z2VKZnZ2YjViTWY3VzdscC9O?=
 =?utf-8?B?eGFDbW9PZW5FNTZYK29ZeEFZZFNOTmtDdFRCYnRrUGo4TUN3TkNrTFhqb2FM?=
 =?utf-8?B?eCthMWRUYWJxS2xSK09zcDRoZmhiL3BjK2V6T2RVbFdQZ0xXWW11QjVJSmtz?=
 =?utf-8?B?N3dQZERNNllRVkxSMjFUbStZdTd0VjlvaDlLSk9kNTYwQytPNWFHY0lmYXlm?=
 =?utf-8?Q?N3SNscQG0tMc4w1G19h0x/yl9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CE78646FA60AE4CB0A497294B7F63CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97618203-8d80-41a9-4d9a-08da5855eba2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 15:58:47.4780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MA5xkgnIdpVin6/sMDPPW3yaDcaHv/KXYPKoqDIVAnruv4zWMsSBPMBwTsSXUWDHreu3MRlXWNYEXQYqtDa6a/ePdXgLFxppo8YbYsWhrFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5722
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

QSBwaW5nIGFuZCBhbiBvZmZlcjoNCg0KUGFsbWVyLCBkbyB5b3Ugd2FudCBtZSB0byB0YWtlIHRo
ZSByYW5kb20gZHQgY2xlYW51cHMgdGhyb3VnaA0KbXkgdHJlZSAmIHNhdmUgeW91IHRoZSBoYXNz
bGUgb2YgZm9sbG93aW5nIGFsb25nIHdpdGggdGhlbT8NCg0KVGhhbmtzLA0KQ29ub3IuDQoNCk9u
IDEzLzA2LzIwMjIgMTU6MDUsIEhlaWtvIFN0w7xibmVyIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIE1vbnRhZywgMTMuIEp1bmkgMjAyMiwgMTU6
MzM6NDkgQ0VTVCBzY2hyaWViIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tOg0KPj4NCj4+IE9u
IDA2LzA2LzIwMjIgMjE6MTMsIENvbm9yIERvb2xleSB3cm90ZToNCj4+PiBGcm9tOiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4+DQo+Pj4gQWZ0ZXIgY29udmVy
dGluZyB0aGUgcG1pYyB3YXRjaGRvZyBiaW5kaW5nIHRvIHlhbWwsIGR0YnNfY2hlY2sgY29tcGxh
aW5zDQo+Pj4gdGhhdCB0aGUgbm9kZSBuYW1lIGRvZXNuJ3QgbWF0Y2ggdGhlIGJpbmRpbmcuICJG
aXgiIGl0Lg0KPj4NCj4+IEhleSBQYWxtZXIsDQo+PiBUaGUgdGhyZWUgZHQtYmluZGluZyBjaGFu
Z2VzIHdlcmUgYWNjZXB0ZWQgLSBkbyBJIG5lZWQgdG8gcG9rZSBTaUZpdmUgdG8NCj4+IGFjayB0
aGUgZHRzIGNoYW5nZSBvciBhcmUgeW91IGZpbmUganVzdCB0YWtpbmcgaXQ/DQo+IA0KPiBJIGRv
bid0IHRoaW5rIGEgbm9kZS1uYW1lIGhhcyByZWxldmFuY2UgdG8gdmVuZG9yIGRlY2lzaW9ucyA7
LSkgLg0KPiANCj4gTG9va2luZyBhdCBiaW5kaW5ncy93YXRjaGRvZy93YXRjaGRvZy55YW1sIHdl
IGNsZWFybHkgc2VlIHRoYXQNCj4gdGhlIG5vZGUgbmFtZSBpcyBhbHdheXMgd2F0Y2hkb2cgb3Ig
d2F0Y2hkb2dAZm9vLCBzbyB0aGlzIGNoYW5nZQ0KPiBpcyBjbGVhcmx5IGNvcnJlY3QuDQo+IA0K
PiBSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4NCj4gDQo+IA0K
Pj4gVGhhbmtzLA0KPj4gQ29ub3IuDQo+Pg0KPj4+DQo+Pj4gUmV2aWV3ZWQtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4+PiBTaWduZWQt
b2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4+IC0t
LQ0KPj4+ICAgYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAu
ZHRzIHwgMiArLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUv
aGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlm
aXZlLXVubWF0Y2hlZC1hMDAuZHRzDQo+Pj4gaW5kZXggYzRlZDllZmRmZjAzLi4xZjM4NmIwN2E4
MzIgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVu
bWF0Y2hlZC1hMDAuZHRzDQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlm
aXZlLXVubWF0Y2hlZC1hMDAuZHRzDQo+Pj4gQEAgLTkwLDcgKzkwLDcgQEAgcnRjIHsNCj4+PiAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZGxnLGRhOTA2My1ydGMiOw0KPj4+ICAg
ICAgICAgICAgIH07DQo+Pj4NCj4+PiAtICAgICAgICAgICB3ZHQgew0KPj4+ICsgICAgICAgICAg
IHdhdGNoZG9nIHsNCj4+PiAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZGxnLGRh
OTA2My13YXRjaGRvZyI7DQo+Pj4gICAgICAgICAgICAgfTsNCj4+Pg0KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdA0KPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdg0KPj4NCj4gDQo+
IA0KPiANCj4gDQoNCg==
