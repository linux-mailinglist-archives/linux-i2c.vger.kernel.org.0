Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B4C550A17
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jun 2022 13:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbiFSLRV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jun 2022 07:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbiFSLRU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jun 2022 07:17:20 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF762191;
        Sun, 19 Jun 2022 04:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655637440; x=1687173440;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=6WfPp8I7AUjaaWrWT0ZayixH6FkTwqp6ECgMOYfMT0k=;
  b=KHe3w919CN0qVZ/8OhmWzlRLHFR6w1ObjLay9XnD3yX+2sX1icOMojee
   rPaysVZgqbAL4bUzbdq9si1CmXTZzm2FGgGktrXfv4/4iIZ22z6Ugk2dE
   rF2hjxls8HP/Qgbtf+6rgudbeTn3JwJOEQhODsbD3QjXieDX9ArlY/Lno
   nVWh1Lyzg2cfp3QHLtjXiRUHA6hm+j2/QPM+Ikdji4qAzBgOKilHCyPvH
   pYm0KK83t5PUh9lsVu/bGoRHqtTFxQDj8g6jL46/5MA69sJG2iCGxE47Q
   tvRaH6hTqBPvRuMV3xjmzARTq/JTD2q8U7qNHS249IYOmeSsYepKlZ+jU
   A==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="161000834"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2022 04:17:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 19 Jun 2022 04:17:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 19 Jun 2022 04:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiuA6p5Lroq0H4rAj+WXD4hvBOnZ/DroK9kR5MSkZ3KrJ+O1tWpL7zikBwMj0CLi5A2zYx0A1DlLOex74mySJIZ/jUGvPIVYMiW0fBj6TWJDez7q9HNVyAQApzs1lTHhKbqqhRf3LSWVFXsAwEuEOataNrt8UR6QQLMwm0wZ2Vjg0CHmny1nDAkmc6LG0I592imz0lTlOT3GJpLKzE3SpHlaV5eGWOmb/tOWnirZlCM6vN5awAHuXT9xBni1ri0rQkmM0tl6BB6qk4uCCp8sOlmOWUMKablt8ElHQGAe2ncHWIcAVTjT1fFLbub7BwhjwRf6VYCgb0WyFFZFGdkfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WfPp8I7AUjaaWrWT0ZayixH6FkTwqp6ECgMOYfMT0k=;
 b=Jj1cWPapPBrH+QH4Z4Dd0+CnQDEyzrt9SJT6PdKq7i4LhtAipnpoZr4EqdGSmAoand6kl4a1O5VGgaE0OhlLQcQ2IVa0184RPeJ046xqGOJ+2onVUGngPZh4MfW4MguZ6cNjH7vEX3+rMffpGv6vt/vLautlcinevh2rB3NgmgBS18q3jpP1cUGTcJLxBs/aN+4iDBp8uNfHRnARfIzeqskKkFbXUe1tSWRt79tk5LPwsSawmq00YzFoFtY7jdGcNyPT9Q6DQNv+f7MUpk9rII9+Q9gLhe5MbD7tp1ZbOBUIbHqpJS7JWW5YoG4ln+46nO8hgm6l4AWgokXL8kwMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WfPp8I7AUjaaWrWT0ZayixH6FkTwqp6ECgMOYfMT0k=;
 b=AOr++G7MsvUBTf/EeRuh3Jo7hsZCp2ih2z1MkuHdJufZs3b8PiJNKG0cbwrmVfApo78SsrweMCRSPdEWw8cBrAD3JYvqkZ/EZwosBmEFcRg0GdFfA4h0de4eTqYNwuWR3SeKEkRkK6ZObs5P8/TqDsOZZ7piSgWn6cxcA5Dy5FI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sun, 19 Jun
 2022 11:17:17 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Sun, 19 Jun 2022
 11:17:17 +0000
From:   <Conor.Dooley@microchip.com>
To:     <wsa@kernel.org>, <lijessen2016@gmail.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <root@laptop-706cegjt.localdomain>
Subject: Re: [PATCH] Print some info into ring-buffer during loading
Thread-Topic: [PATCH] Print some info into ring-buffer during loading
Thread-Index: AQHYg8uuV+0W0XbN50i/4aJoFEbFQK1WkjOAgAACeQA=
Date:   Sun, 19 Jun 2022 11:17:17 +0000
Message-ID: <ae44d6ea-fcf6-04ad-311b-a69946201086@microchip.com>
References: <20220619083207.749-1-root@LAPTOP-706CEGJT.localdomain>
 <9b94e885-be5f-3548-67ed-d79c6e7c22e0@microchip.com>
 <Yq8DqWEdEEkrAm6H@shikoro>
In-Reply-To: <Yq8DqWEdEEkrAm6H@shikoro>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2d650b5-1531-406d-5495-08da51e544e1
x-ms-traffictypediagnostic: SJ0PR11MB5086:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB508653BE834AA6BB8D81B9F398B19@SJ0PR11MB5086.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kdegg1qQM9gitX8F4WfCLiqqin0KBUf7MueBnz3Dtyl6j52o9yGrQ7NN2jzAEyCee1KsuM2kebOYGrlu2D09tr6+RUuv40XkLjoQj9DohxQAwK16OPbi+uynlhyIlRR0V+jS5/5a0KW8usw8I4ek2PuR2Oi+S3W4RZ6IKPnYjLGqIir3jRINRsWbN+ebFZizYDlC9EUpTph8iZ/UH6zhCFvfz+Cxf6Q5vHQGDCU+KDxSVzhEHy4SfcO7f1sVEOjrSo9A/kiHrXoylVcWhUZ8ehZjQJzr9xu1rjAxjgS29ntzCUhiTBs62hK0jQrHA/APa/NRTJ0vsZSIgqxoYXFbbsuJkL8iga3xI+f5CTrl+/ERnDuSEHLuwVDRefuJq7tkhaebZSLKKv4MRiw4JhrvaznZugXOCteAiNt28QmX7LCqb9nixgOqmcT6ykiWA9YaCs3W/78niQXEea5W1iUz2dBdaoiVDw3DZFKrBfviuH0UCoq1GV8eL2NtGsGIMh1PKMqSJUnt8gHH98/urf1YZa8Oxkft1GD8ysdlsVNoVKdU8eBmvK9lo8sCUo+jZ0FPagJaSWbXbCmrrkPExCwJiBzg7i8vb0xCWMpPNvnwri7zqWUkQ9NU0JNQM4kdSVewXFBJF/WHwCg2pKmVJbVX1InD+hk6freBwC11lvnXhPOGipZ5X7KRI91MlFwLqlDr4HXGZ5hn4kAUCL6JGOm9SHAwpMsJ2EKWvbS4jpIiP1yltmcuM/Z5UVWLbu+Xtn0lxtXpXVpLfoZhLCUduKtAFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(76116006)(86362001)(91956017)(110136005)(122000001)(71200400001)(4744005)(31696002)(66946007)(498600001)(8936002)(8676002)(5660300002)(31686004)(64756008)(38070700005)(6486002)(38100700002)(26005)(6512007)(316002)(2906002)(2616005)(66556008)(53546011)(186003)(36756003)(6506007)(66446008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aU8vazZkaE1HMTE2dEtiSlBBSXd3TGxJQlZ5VHNBb3BkM3B5VjN4d3JTcXkw?=
 =?utf-8?B?bGhaamJBV2RIbmg1VWNvWkIvbUo4YkwxZ3kybWFpekphRDBOKzJYSHpkZ3FH?=
 =?utf-8?B?TGFGenR5UURDcUw3U2d5eHNEMDREQndmL3lFQ0FtR05EWDNoRGdlRkVuUDQr?=
 =?utf-8?B?TWlHQXZycHExUzZMWkIvYm5leHVYdzdpeG8rUXV5a05NYkRSc2tWYTJlbFUr?=
 =?utf-8?B?ejBSM0JiUDBNMHNYbkhIUXVjZld2MTF6SklaKzRRdko1RU5xbkkyNFQ5VkNL?=
 =?utf-8?B?T0s3bUNEZCtoUTA2K1Y5NVk2SVIvakJ2cURKUmVyVDlnMm9iL3NjNmF4aVNr?=
 =?utf-8?B?YTQxN0hmWm5mM01obzhOTitaZk5WWmszY1FqVHh5cThENkZQR1EyTmprRndB?=
 =?utf-8?B?bEJSWXZqQmdiZWI4MlFsTy9hd0lETW5ZS2oyNzQzRm5helJhRURBWHZQdHlz?=
 =?utf-8?B?QWE2dE5hYmUvVmpielNNZ051NHFFZzMwSUc1eHZPZDBPSkR1OFNIT29JcWRt?=
 =?utf-8?B?MkNKN20zY01mV1FybnJLa1JFb0VDSlJua0lBZWhkZ2prM0ttbHlLNkRrWEpW?=
 =?utf-8?B?WlU3OG56WUVLdTJXb1E1ZWQ2Ymt6M0JTbjhrbG1OYUtjN1NUSU5zOUZ4UG1N?=
 =?utf-8?B?enJXQWQ2Z0NXMnlPVUZXdVpFRnZZenFFcjZQRzJudGFpMTU5YWJLZkNhYmk2?=
 =?utf-8?B?bTB3RWRTanFMS3pOcVNTZERydTdKa0tIUFdpWlBvcW94VVBnWURtVC9wV2Yv?=
 =?utf-8?B?RTJsMmxvSUZIY2VhWUlYb243THR2WU81QlRyNSthZXB1UkUzR2o0dDdvTVdM?=
 =?utf-8?B?cWNXdXBpZ2JuR0wyaFFFUU5Ld1FLRU5PTWVOdUdyQXh4UU9KMkIyN2FYbDFG?=
 =?utf-8?B?aWZGY1I5cS82K0xtTzV0Z01PYm5UWDk4dUZrd0h1YzRYaGdJU2g0MmRTUVk1?=
 =?utf-8?B?MVQrR3k4dFNmVE15VlhXc0lhcFFGSWRqR0ptYTU4Znhxc3ZPVHRPc1dobElG?=
 =?utf-8?B?bm5jeXZia1JRaDQwNG5wZDNnTlJIdmtrNUQvQ0pmMXJyMzhVeG80YWxpUUVP?=
 =?utf-8?B?THhxVzYzVmdwVS8xbXEwdnhYQTd0dlJVUkZXcURpVk54Rk1qWGFKRGtJakNp?=
 =?utf-8?B?MG1GREVSQUVYVWtTUWU4cmdpc05MOHhTRllaeVpjTWt3OGVNemZoRHF4ZCtk?=
 =?utf-8?B?ZHFZTlRqY3p2dm1GL1VhcXAzS2cxend2UDNWbGZjaGNYWnNlMTNvNVN0MTM2?=
 =?utf-8?B?WHppcWIrVDhwVFV2d2V5TEVGV1ZaUUNqYllyZ3RZQ2NTMjU5NVRxS0dZMTk3?=
 =?utf-8?B?TzFoKys5UVNsaVZoUEQ0R0tVRFNBV3NzMXBTaUluTmNTZENpaHRVSExYWVRy?=
 =?utf-8?B?SmVFMEhQUkNVNTZJMDdMN3dHenJnSUpPWWtrc0hOTGhnblJ1NzM5MDFLNVox?=
 =?utf-8?B?di9HU1hXbnNzU1B5NStVSTdQVnNueGtobnVNMVY2RVhMNkRJOUJBZ1p5K1FH?=
 =?utf-8?B?azdTb3Y2UnhXMzRjS2RHVUcwYnBYTU1BQTMzWC81MDkrVk01SnlOSTJmU2FR?=
 =?utf-8?B?bkk3VHJnRmNjZlV3a1EzYS9FekRPSHF1WDBxMzV2UmFLeW44N0NTSGZzcnhN?=
 =?utf-8?B?VUR1SEFtNXhndC9FcS9RS1hvd2hrRHRXa2hWQWdCR1dBdUFvbElrN1pMR1J6?=
 =?utf-8?B?Y1NBNURIbGZIazNDMVJBSytzNHNVdHJSd0pzaFZtVHFmSDlYQVUvN0FqWXJI?=
 =?utf-8?B?VENITXVjRVNycWhMRm83T0ZadzdlcHF6NGxOdmd0aUpJMjV4OHBnWEVxcE5L?=
 =?utf-8?B?ZEZuSUtzWWQySGFpRE1BY2dGQWx1QVZKZVJpSk5MT2ozc1BIRlpTS2w1MVFN?=
 =?utf-8?B?b2RlL0FGUTVXcSt5NXJRd3JOeC9lS0ozVW16YWNoVTE1ajA5ckhsS2tYbG45?=
 =?utf-8?B?ZFFReDNrckYyckFaZ3IrWENUZzVHK0hKaG9iYjMyQXlhM2NPSC81ZTUvRGZl?=
 =?utf-8?B?WE5xMnBDMURYeWdhQXZJSXNScGtFY2ZMbG5lMUE2TDNlMkg0cDFrM3BncTlz?=
 =?utf-8?B?NmIzUUVGUWppNU0wTEEwempMMXEwSlMzbUcxNXRiY3RSQzZLaEkwakcxUzl5?=
 =?utf-8?B?SjkxSWpNcFFiUDVBMlk1c0pGdWNEZDkvNkVqRlhyV2ZqSGNRbDJBRy9OYVl0?=
 =?utf-8?B?cjFZQnNQNGZCT2djbUtibGVRU2pZdGxjdTYyemN5WkNJQTZYSlhjYW5lNFpP?=
 =?utf-8?B?cWlKKzVmT2hraVZLRWZqMzY1YkFWSFh1b2FYNWMwTExCUVBxcGxsM0VvNHZi?=
 =?utf-8?B?TmpFMlVLQ2FRNlZFRlVqZkJha2lFQmlpRDRReFJyZEtUUFpTbGhQS0dQQjNP?=
 =?utf-8?Q?fXW23YDGAnLlAia0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24542AD368522047BD61AB8F2E950BA7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d650b5-1531-406d-5495-08da51e544e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2022 11:17:17.0856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfrbz8N7fb69/WzyXLNJuEn5K5D7aJ3AvZbteMjyegafmDyeg0/r37cDOfPY27QMd4/JlznDcvtRykc/iEFDWCqtmXuAb1ZGUWRlOQSx6ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTkvMDYvMjAyMiAxMjowOCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+IEhleSBKZXNzZW4gTGkvSmFzb24tTGVlLA0KPj4gKEkg
aG9wZSBvbmUgb2YgdGhvc2UgaXMgeW91ciBuYW1lLCBzb3JyeSBpZiBpdCBpc24ndCAtIGp1c3Qg
ZmVlbHMgd2VpcmQNCj4+IGFkZHJlc3NpbmcgYSB1c2VybmFtZSBsaWtlICJyb290IiBoYWhhLg0K
Pg0KPiBJJ2QgdGhpbmsgc2VuZGluZyB0aGlzIHBhdGNoIG91dCB3YXMgdW5pbnRlbnRpb25hbD8N
Cg0KUXVpdGUgcG9zc2libHksIGJ1dCBubyBoYXJtIGluIHRyeWluZyB0byBoZWxwIHdhcyB0aGUg
d2F5IEkgc2F3IGl0IQ0KDQo=
