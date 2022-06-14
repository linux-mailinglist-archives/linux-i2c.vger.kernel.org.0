Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B27254B28B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 15:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbiFNNxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 09:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237979AbiFNNxX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 09:53:23 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDF238BF5;
        Tue, 14 Jun 2022 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655214799; x=1686750799;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=/BI5EaqpzT8ip+HR5DLSIZ60hGP208pU2zGypi6nC/c=;
  b=0kCBIuvwZEwYVeL9KhKyawZcA8zT5emV4NKmnaxPTimaVU2UrIf40A50
   asLRL0sIHmhI3r8ac3VZJBx41Z3m224Oy6pfvBp32+puv1Dl5OllpmwsW
   3APOaXDaFdvJKM2X/1cnUIVbtJrg/vGw46tPU0kkRIdyFYCYfLoQZ6FaB
   s9NC1O5M9qoROm8WX8h14YXfWqsFcTF86Z0dvj9/SZw4dAL23CTs8RjGC
   dm5vfJTNSGV0NvqPs5oo0wC+jyTmv22Wxi9zRJ9PB9MwsigckgJ3NgJHs
   hV/0EtFlxYFK9P+38rCvT1LhmkM38acPO2W7NaRnof7+v49Ky/19zxse1
   g==;
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="99965242"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 06:53:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 06:53:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 14 Jun 2022 06:53:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lj9O5itoV4ZuKo27jvsBKSl22SRnr/6K7PyH+EbCYoChXquMHjXKOeCtgN8ooK49v2yyGevVEPqJyzHmNB/ZZcRG9DdX8596qh2ZaQRjIDyTCk5yL6Tk5ULA9L0+1OewBOcLH33VjIvubhZho1qmA9Dw+BkoFpNLPo9i2tHd7RXSZwrEPRx+lRjJWTDEf95AyhKqKppvd2jnKhaKe7vBoT6A+qezxcjRgmmGfmD1bcjBWYNb+dnmFWGw8dlLFjoAPDgq4Drs2RbO9fRczdyMgrsRaMYEQLEJXrL9W0TaCbXgOFzaNYgijoe+dow2CINuC9bkmpfZTAYqL5Jq0xocvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BI5EaqpzT8ip+HR5DLSIZ60hGP208pU2zGypi6nC/c=;
 b=FKhwTLD5/804Vkyz3vZ1PjnfjdlssjUtt3gyPO8hLuV1M0IzjTXDKcw9HIrpwCKaVenZG2qnL0NxL3ZTMYWFvRu62aSWZS68lpMaM3zqK7azosRlx/FVPR4hef6BVU+B+BDDBT4p7EX5N0P6lXe/QwDCklzEi5HPCW64Gwlpz73ZC03j7YB/PCdo0RhoYDNDEobk4JLW+GpG/LpHdQ9MbLB7Ub5WruQMq6yXc3+426+9tA687apLMOMFtIh3b+ddmi9bq7L7N8xt83yXubG38dWLElcOZLJ+SFbhOS3aP335ezXLksRX0t3NXkHc5dtqaNl/djtN8bU4DCJFwM25ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BI5EaqpzT8ip+HR5DLSIZ60hGP208pU2zGypi6nC/c=;
 b=ol0vcJP0ftPcBW672vml/3xgNTU7ovmvpzyJqR7GN58/fwGEsp/0cIH1S01hUN0E5BkjgnAQhFaLvSHhNfZ8myf0MfgVksvmhvzsWjeQEUsAIC3Z26KfAmOU6vGy4Vd9X8vTjwkrtoo/F6duk6PI9hokI27o24ydltJ4spCaApg=
Received: from MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11)
 by MN0PR11MB6181.namprd11.prod.outlook.com (2603:10b6:208:3c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 13:53:12 +0000
Received: from MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::ddf6:11cc:3391:d4e9]) by MW4PR11MB5936.namprd11.prod.outlook.com
 ([fe80::ddf6:11cc:3391:d4e9%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 13:53:11 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <peda@axentia.se>, <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <Ludovic.Desroches@microchip.com>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <kamel.bouhara@bootlin.com>
Subject: Re: Regression: at24 eeprom writing times out on sama5d3
Thread-Topic: Regression: at24 eeprom writing times out on sama5d3
Thread-Index: AQHYfA01c45T/mrWhU2n/5J6R8aiEq1IQRKAgAUy9QCAAAyngIABF+EAgABbgYA=
Date:   Tue, 14 Jun 2022 13:53:11 +0000
Message-ID: <0dd2fd90-07c1-f693-1782-e68a7b2efbf2@microchip.com>
References: <074b39c5-55fc-2bc1-072d-aef1070e284d@axentia.se>
 <2bb4868b-90ab-887e-bf13-9de8b79231bd@microchip.com>
 <YqdQoJbsgwjQ9PYh@shikoro> <0ce8b9d7-8a9e-cded-1762-71e230f4246c@axentia.se>
 <ebadf90a-066d-1cbe-b15a-3a99e3ab2bd5@microchip.com>
In-Reply-To: <ebadf90a-066d-1cbe-b15a-3a99e3ab2bd5@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51136433-978e-4385-e193-08da4e0d38af
x-ms-traffictypediagnostic: MN0PR11MB6181:EE_
x-microsoft-antispam-prvs: <MN0PR11MB6181F5DF5D03F1965FE969BEE7AA9@MN0PR11MB6181.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7yK9l141pM6MmqxkAUvcw1ZCIsrYBpE7LIqdcslzA6u6Y1oCIXO2vviZq/MJ6w60+roSvvXvkeNCbBgtxXE0Aj0Rd6WSC2dFSXt5gzmjZGg3z1krCdgs/pAuEAzhF/S5YI7xVUuTqSVsGiBOrOFLWq+xX+Tq3MWqiiAPMFFdr9n6VGgx/Dgz1/qcJojGoeXg3tTCmnXNdqtQ+w35poBl300HOQfnThuyWLH/wYgwOXJjpswPXo2jgDhBkL43NigOH0S9A97cATXqngmK76AdY/Grlwkt5VBAjWn/k5MPGL1FxxSTVNgyqFH6/AEP+ZKleGtg+4HvuZgtq/KEAVn+UYASLNovjQraiwJw7Vk3hP5J2klz7WkrYdL1Jpm6+2SMhNf3B0jlrBh9u5rzlJZRpRuurUyTSYTzfFm92/ktRn2DndmIUpTTHVDMINDxW/Rst0VDSajpBKykvynKWhcCp1Wcswq/jWAIutPHCOajCzfJav8lMZA7FGB6YfgvqlFYFNjUNcwm2MnRfwydm74qIIzXWoDv+V4ggGXmuA/v+zKZUrXGNtS30EPsGyQplWEFFCgTfUhLScyf8+b0sWRzGBf2Qivlkm33cM4di+XrdpN6TyiOqddP2YQ0f7NtppcsWZO1WGmwolezESgcendhiKmICyvoJ0g62wCI2EkT/F52DIlfXKVbnSnAZXkKMuHXFuRFaWXrHd80Je9TgUYp9dU+f/zGoIYp+GA/TuP3pNfhXiqmt7CMLykGLcP14iVda4wbqGcKwRNfeMJzp9XKEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5936.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6486002)(71200400001)(921005)(38070700005)(8936002)(122000001)(2906002)(86362001)(508600001)(36756003)(66476007)(64756008)(110136005)(66446008)(76116006)(316002)(31696002)(186003)(2616005)(6512007)(8676002)(26005)(66556008)(91956017)(66946007)(6506007)(53546011)(38100700002)(4744005)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U29KMmxZemJuR0MyUEw2a00veGxESVlvUk9qRUdCaVJCRUlOMW1LMUI2cEJI?=
 =?utf-8?B?My9mMnRZanlJNDc3YW9xNzVCTmw3aWNDc0Fnb1NSMHhGYUcvWUpwVFdHR1pI?=
 =?utf-8?B?aVFPdjBNc0ZvdHRYM0J5ajlsNnZ1bUEvZlJCUWRTQWR6SG1pSmszNllYcjh0?=
 =?utf-8?B?SnducGRPbVpQU3JLNkNxbkdFWnN6R0tRTzJNekgzSkt5NjVxQXc3dGwrQ1FU?=
 =?utf-8?B?ZEdmZEJWS0RWclg3bTRJWlVrTXlRakwrZzFGNU00NEVnYVR6VFBHWVZyeVlY?=
 =?utf-8?B?VDZMeGx0MFc5OGUvSUtlK210eVFFNUhQaitwY0p2b3pnRjJ5eWoxcjBOeEdO?=
 =?utf-8?B?dFNuakhJcDBxK3NjWC8zSFhpR3ZWc3Y3OWZ5L2VzTFlmV3p0Ujd0ZmpxOW55?=
 =?utf-8?B?dFE4RzE5SlpobldtSFdFWFl3djZzYWZydnJSeXJORFhoUW0ybzRLUEJBQnZG?=
 =?utf-8?B?ay9vZWdLY1JMc21yeDhOb1oyQmN6K01VaE5Tc1BWVHF5WmVEOFF5Q0djNEFm?=
 =?utf-8?B?SWZPNDNPTDFPRWxhWjJWNlFrbEpqeVp6c1hLY1ExdU9Oa3orWVhKR0Y1N3ox?=
 =?utf-8?B?cW55YzExSHk4ZEwyU3A0QUNHSE9QS0UzY3B4cEtJUVI2OUxiUHlHcWdBVUF3?=
 =?utf-8?B?T0I5NitYR0c4eVZsdkJlVDF3NFRHT0pyNk44ellEclJvREIzblBlVlZ1aStI?=
 =?utf-8?B?SFJHZmg1QzJjOEtveUxVWHUzUTJEMXdXa1VucGMzc1JJUEFmc3BkU3hYdzl5?=
 =?utf-8?B?UHNuMTR5ajlOdWQ5UUhrdEg4MjFKZG1yQ1pUMVh0VjdpQlBFdW4wR2lUbE5m?=
 =?utf-8?B?NmtJVnhKSVhSQU9yRzd2aGZwVklJaEh1aXNWd0VHWVZwUWxxS2dtS01WUmtk?=
 =?utf-8?B?aFA4VGJoRERTL09RdTZZMS9KdmxEZU94ZFF4NTZiVTZUQml2WllSeWMvakg3?=
 =?utf-8?B?M2VUU1NuRmpTcWx0NGlQazlITnEyR3ROenAycTNWVHRWcG9CVzJpc2FPbWg2?=
 =?utf-8?B?QyticlhSYVMreW1UaDgzWFlnQ25LRmNBTTJvd2tpcklhVkxZWElvZk1zbXRh?=
 =?utf-8?B?L1gvT1lUNVZ0dkVTaXJhdk8yaVd0ZDVnelp4bVN0OTNZZUtCZDNka1pxTk1K?=
 =?utf-8?B?T1M0dzVSa00zTlNINVJDZW5BZ0RjWC8xU25JRjhvZjdQMlNrc3BseVhuOGtW?=
 =?utf-8?B?Rm93OGVxeWhxODl0K09wcUhORUdXOHNGZ1JFUHFKOVBwYkdQdWtRbFYxbFdr?=
 =?utf-8?B?K2RoY09XaXJTZDdHZjVwdFB3NWRBMFA2VVlPU3VTWUhhVzRCdGFvbk5tcndo?=
 =?utf-8?B?bGdEbURvNEZqUzhtS2VyOFRWeE5qU21GdE9PWkx0QjVDbnlJcVpnQkYwaW9w?=
 =?utf-8?B?Y2k4VlltWkV0a1dmcXNDZm5nZWl1RlB3V05LM0JrUTJic3c3Qmd4WTlDNGJT?=
 =?utf-8?B?SjZBTFBCVmZxWndtMkh6SHhaZFJUVlNvc1ZuVVQyRnlpMCs5Qlo4NUIybkJz?=
 =?utf-8?B?UXBwSG9wNE8yd1VMaTc2QnZNY3FWVzNCdnloNVR1Z0V0VGdXaEdqWXZwOVAy?=
 =?utf-8?B?T09WRlB2S1oxd2Z2eEdXcmtHaVhUVU9RWWpxS2VGR2FQcktGdW9BMWJkNGln?=
 =?utf-8?B?Q1VDbFFRR1VsYWFUT25KNTVPaGlqNE9kWXFScGVhdmVpdUpmbE9oM3VpWGJO?=
 =?utf-8?B?QXEwdHpsWFBPZm50NnB1R0RpOXFwcWE3STBIaXBidTgzc0czdnVyRXo2R2gx?=
 =?utf-8?B?NExLeGVnWTNMSWdJK2F3czBjMHlqdnlCSEJUS1hqR2FNbHdBQUFUMXAxSkg0?=
 =?utf-8?B?TTBCQ3VORW5vUDlCRW5EaWhVTmJxd1VUM0VKTnV1MUVteWFMTisvckxscENL?=
 =?utf-8?B?WGxTK0tHYndwS2Y3Sllubkh0aHROSi9CS043dHdtVkhtR3I0RUFIMXBlQ0JR?=
 =?utf-8?B?akt4eUtldnQxZVVmYTNOY3kwWVVsRHZ0ZEpqNDJiRFB0Z3V4K2daL0VSd1U5?=
 =?utf-8?B?Y1BTa2d0VTdQL2NSaTVJUXhsNjBZTXM2MTFXbjlINXBUVDJqMUVaL21wOTZz?=
 =?utf-8?B?L3dEelUvcTJweVF6T055VmYxSk90aytnUjFCZ3lNSjc2bDFXdXdlc01UK0k0?=
 =?utf-8?B?UThUQVc5N1NLTDJSWUdUbXhyWmxNaEErcm1aQ0JvQWxaUDY5MWE4Y0lkQkp4?=
 =?utf-8?B?K0dhQWVOWE1CYlZMdHBrQnB4aS90ZFM0LzBqaFRaSmk1MGtML3ZmNmdkK3g0?=
 =?utf-8?B?empYU3R5S3ZrMmpkamdaandRMXkwUm8xYndMT0F3RXJWYWtMUnY1WjRxWXpK?=
 =?utf-8?B?NEduS2FQNXJ6T3NDZWxYSkd0S0tTL0dCa0toUnU3N21icy9PaGRsSmhnRG04?=
 =?utf-8?Q?k8GZE1OzT5heIDTg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62821D305366964C9314B4F2A0DAB881@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5936.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51136433-978e-4385-e193-08da4e0d38af
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 13:53:11.8612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQ+yHgsqdlFMZ/Oqvbgf82lFj2cu/2kjX94RECabcLU0vLTfXDiQRBChdoIhyXxNpARErqqKLIPyyaIUtO93ZG3YqBZdPFdiq890DvQJwUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6181
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMTQuMDYuMjAyMiAxMToyNSwgQ29kcmluIENpdWJvdGFyaXUgd3JvdGU6DQo+IE9uIDEzLjA2
LjIwMjIgMTg6NDMsIFBldGVyIFJvc2luIHdyb3RlOg0KPj4gRVhURVJOQUwgRU1BSUw6IERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyANCj4+IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4+DQo+PiBIaSENCj4+DQo+PiAyMDIyLTA2LTEzIGF0IDE2OjU4
LCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+Pj4gSGkgQ29kcmluLA0KPj4+DQo+Pj4+IGNvdWxkIHlv
dSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaC1zZXQgWzFdIGFuZCBsZXQgdXMga25vdyBpZiBpdA0K
Pj4+PiBhZGRyZXNzZXMgeW91ciBpc3N1ZT8NCj4+Pg0KPj4+IEFueSBjb21tZW50cyB0byB0aGUg
Y29tbWVudHMgSSBnYXZlIHRvIFsxXT8gOikNCj4gDQo+IEkgcmVwbGllZCB0d28gdGltZXMsIGJ1
dCBpdCBsb29rcyBsaWtlIG15IGUtbWFpbHMgYWxzbyBkb24ndCByZWFjaCB0aGUgDQo+IGxpc3Qu
DQo+IA0KPj4NCj4+IEkgcmVwbGllZCB0byBwYXRjaCAxLzMgYW5kIDIvMyBidXQgaGF2ZSBub3Qg
c2VlbiB0aGVtIG9uIHRoZSBsaXN0cyBhbmQNCj4+IHBhdGNod29yayBhbHNvIGFwcGVhcnMgdG8g
YmUgaW4gdGhlIGRhcmsuDQo+PiBEaWQgdGhlIHJlcGxpZXMgbWFrZSBpdCBhbnl3aGVyZT8gU2hv
dWxkIEkgcmVzZW5kPw0KPiANCj4gU2FtZSBpbiBteSBjYXNlLiBJIHRob3VnaCBpdCBoYXMgc29t
ZXRoaW5nIHRvIGRvIHdpdGggbXkgc2V0dXAgb3IgDQo+IE1pY3JvY2hpcCdzIElULCBidXQgaXQg
bG9va3MgbGlrZSBpdCdzIG5vdCB0aGUgY2FzZS4NCj4gDQo+IEkgY2FuIHJlc2VuZCB0aGUgcGF0
Y2hlcy4gSG9wZWZ1bGx5IGl0IHdpbGwgaGVscC4NCg0KSSByZXNlbnQgdGhlIHBhdGNoLXNldCwg
cmVwbGllZCBhbmQgdGhlIHJlcGxpZXMgc3RpbGwgZG9uJ3QgYXBwZWFyLg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpDb2RyaW4NCg==
